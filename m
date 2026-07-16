Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B10B0C4450A
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 14:08:22 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13761.1784210893831353499
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 07:08:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=sFB3xYW0;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9903E4E40E00;
	Thu, 16 Jul 2026 14:08:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A67E602B8;
	Thu, 16 Jul 2026 14:08:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3061E11BD3D03;
	Thu, 16 Jul 2026 16:08:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784210890; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=V7IcEz9szQbtvUU9ncrOeryyOyvgoVYWViQS0qwq/Tw=;
	b=sFB3xYW0dPlNR2ZUghs61kUXhrDF0lj92EYuJZLOuztgCLD0/e0rLvC+P0dXGg+FOd4h8C
	VKZnX70ngz2K47vInOQn7c+c1GGkBSorlm2eOB62/t2JBDPtqogkMjVGNI/GSw5sm9Gi1k
	MdAvWDQiYDtHYOj1TtSPvZk+HKUOsN8jEEzvh1bfdeRDOpaQ+ze73WSxVVqRZ3seUhOOdG
	oTOg1xG9Qih/VAnUvJIuAtAi5JN2e4pqtb24cvRjkPTajuA/g0sS8QljR4lgamWwtDFIkv
	s81heRnzKqVxr/HGITULYL1JPmp0AY/KZUx0A83vjfICrWV5JBHsBPUMl+n8QQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Jul 2026 16:08:07 +0200
Message-Id: <DK01Z2GDOIEI.2TEGVBC8N2KFX@bootlin.com>
To: <john.ripple@keysight.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [meta][meta-selftest][PATCH v2 2/3] oeqa/selftest:
 Add go-vendor.bbclass selftest suite
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260715152011.3542412-1-john.ripple@keysight.com>
 <20260715152011.3542412-3-john.ripple@keysight.com>
In-Reply-To: <20260715152011.3542412-3-john.ripple@keysight.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 14:08:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241091

On Wed Jul 15, 2026 at 5:20 PM CEST, John Ripple via lists.openembedded.org=
 wrote:
> Add govendor.py with two test classes that cover the behaviors fixed and
> defined in go-vendor.bbclass:
>
> GoVendorSrcUriTests (offline, ~10 s): unit tests for go_src_uri() parsed
> via bb.tinfoil; verifies the basic URI shape, path/pathmajor/subdir/repla=
ces
> encoding, and that non-git VCS omits the git-specific nobranch/protocol f=
lags.
>
> GoVendorTaskTests: runs do_go_vendor once against the real recipetool-go-=
test
> project and checks that external deps land in vendor/, *_test.go files ar=
e
> excluded, pathmajor=3D/v5 falls back to the repo root when no v5/ subdir =
exists,
> modules.txt is reproduced in vendor/, a local replacement (./is) appears =
as
> a symlink, and the S/src/GO_IMPORT/vendor -> S/src/import/vendor symlink =
is
> created.
>
> Signed-off-by: John Ripple <john.ripple@keysight.com>
> ---

Hi John,

Thanks for your patch.

We get a single failure with this patch, during the
reproducible.ReproducibleTests.test_reproducible_builds selftest:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/4392

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


