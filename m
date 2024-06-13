Return-Path: <mac@mcrowe.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D22EC27C75
	for <webhook@archiver.kernel.org>; Thu, 13 Jun 2024 12:50:23 +0000 (UTC)
Received: from smarthost01c.ixn.mail.zen.net.uk (smarthost01c.ixn.mail.zen.net.uk [212.23.1.22])
 by mx.groups.io with SMTP id smtpd.web11.7859.1718283018568691240
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 05:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=Re1ywMBq;
 spf=pass (domain: mcrowe.com, ip: 212.23.1.22, mailfrom: mac@mcrowe.com)
Received: from [88.97.37.36] (helo=deneb.mcrowe.com)
	by smarthost01c.ixn.mail.zen.net.uk with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <mac@mcrowe.com>)
	id 1sHjuA-00Fwkf-Ca
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Jun 2024 12:50:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	s=20191005; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:
	Sender:Reply-To:CC:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=f1ZV7YEN0Za+4AF8sGOhzRIcjTHDW38HjFPaINPOyNw=; b=Re
	1ywMBqeS0zaDRnwUesHzTicU20WkqT6G0ZRiLG/Xor9rwvQSLJZ1gDASITwtxvfIRI3s5YLlTfBmX
	KoHPDSqE6OXNJk3iDVh/bd+AGc1ag0uTmifXum1P1CnAT4uFQ5n6QUxliJOAJNRtm/malJtf6yCyY
	H0Dt8zmCsPxAyIov6WcwDxOctExwFOagCp4FBu6587C/2n/oc8gBL+v1JqqzeMIzA74vEUWvjTzLB
	qyZz2uLMfGgFX7tbB7hi1pWJmSZr1vM739ZmNR8YKXgueDTC+UCGxgjI100yImNGI2frfp7JHOktC
	2UewGJdzkGjHNHNvo1ofqBO77sGTXFPw==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.96)
	(envelope-from <mac@mcrowe.com>)
	id 1sHjuB-00DHnC-2x
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Jun 2024 13:50:15 +0100
Date: Thu, 13 Jun 2024 13:50:15 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Subject: RDEPENDS:${PN}-lic and multilib
Message-ID: <ZmrrBw4fiGdzcOkG@mcrowe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Originating-smarthost01c-IP: [88.97.37.36]
Feedback-ID: 88.97.37.36
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jun 2024 12:50:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200599

We've been successfully using the "lic-pkgs" image feature in order to
install licence information in our images for some time and we ensure that
the licences for header-only or static libraries are correctly included too
by adding RDEPENDS like:

 RDEPENDS:${PN}-lic += "boost-lic"

to the affected recipes in the absence of anything better[1].

I've just tried to build a multilib image with both Scarthgap and Dunfell
and discovered that this doesn't work. I get warnings:

 WARNING: lib32-lictest-1.0-r0 do_package: QA Issue: lib32-lictest package lib32-lictest-lic - suspicious values 'boost-lic' in RDEPENDS [multilib]
 WARNING: lib32-lictest-1.0-r0 do_package: QA Issue: lib32-lictest package lib32-lictest-dev - suspicious values 'boost-lic-dev' in RRECOMMENDS [multilib]
 WARNING: lib32-lictest-1.0-r0 do_package_qa: QA Issue: lib32-lictest-lic rdepends on boost-lic, but it isn't a build dependency? [build-deps]

The solver then complains that nothing provides boost-lic (because I'm not
building "boost", just "lib32-boost".)

If I change the recipe to instead say:

 RDEPENDS:${PN}-lic += "${MLPREFIX}boost-lic"

then the warnings go away and the image is generated correctly containing
lib32-boost-lic.

(I found that I needed to cleansstate both my test recipe and the image in
order to make the behaviour described above reproducible when switching
back and forth. Changes to RDEPENDS:${PN}-lic in the recipe alone didn't
seem to cause everything to be rebuilt correctly.)

RDEPENDS don't normally need to use ${MLPREFIX}. It looks like
ClassExtender's rename_packages automatically adds ${MLPREFIX} when
necessary to all the RDEPENDS overrides that are listed in PACKAGES. But
${PN}-lic isn't in PACKAGES so it doesn't get that treatment.

If I try to add ${PN}-lic to PACKAGES then I get:

 ERROR: Nothing RPROVIDES 'lib32-boost-lic'

Whilst I can add ${MLPREFIX} to each entry in DEPENDS:${PN}-lic it feels as
if I might be fixing this problem in the wrong way. Is there something else
I should be doing instead?

Thanks.

Mike.

[1] https://lists.openembedded.org/g/openembedded-core/message/156909

