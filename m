Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A2DCD5BD0
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 13:58:38 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20969.1779890313269929559
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 06:58:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Yp34pcgn;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NxKDru0Vj9vNDOieozm7aPabZkeV0tHXVUhWga4BUJo=; b=Yp34pcgnAjKr10lyQcoD8yWBGA
	i4t+TvrU/82/Uo2VGquwJUOQ+DFUW8/QsvnS9A0VSMF6wfRC/GCM+JW6PuA2nc1fSpo2KeSeXz4tn
	r+v78RGnaz1yheNH9AJpWEvevXPzUx0UZoBhuFtR7/80pXk0wfqfRNbLPA/QqOHCBHnrQd+v2vU8I
	p9MgfHKkO1aM5mQgjlFbj/11s8coMlSJM9P5O7TR5bSLofvbKLLr1vC/98ix27zZJgvlJyBxup0+A
	Ay0G328yCHeMxn6ZnrWVKMiU5hT5esy6PzQuvz4zJGvw0aEX9CzDZLJ01kCciwJuRtvUG+XYNbr5M
	Wi5H0WDQ==;
Received: from [147.129.179.166] (port=47036 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wSEmD-00000008ZDe-3z4Z
	for openembedded-core@lists.openembedded.org;
	Wed, 27 May 2026 09:58:31 -0400
Date: Wed, 27 May 2026 10:02:11 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: "packagegroup missing SUMMARY" warning when there *is* a SUMMARY
 setting
Message-ID: <6b1570ed-8060-963b-1ac9-dd4ffc78f7f9@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 13:58:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237669


  (while this is from meta-security layer, it's a more general
question about how a packagegroup assigns a value for SUMMARY).

  building an image that includes packagegroup-security-tpm2.bb:

https://git.yoctoproject.org/meta-security/tree/meta-tpm/recipes-core/packagegroup/packagegroup-security-tpm2.bb?h=wrynose

and getting the warning:

"WARNING: packagegroup-security-tpm2-1.0-r0 do_recipe_qa: QA Issue:
Recipe packagegroup-security-tpm2 in
/home/rpjday/Layers/repo/wrynose-next/layers/meta-security/meta-tpm/recipes-core/packagegroup/packagegroup-security-tpm2.bb
does not contain a SUMMARY. Please add an entry. [missing-metadata]"

  here's the rather odd content from that packagegroup recipe file:

    PACKAGE_ARCH = "${TUNE_PKGARCH}"

    inherit packagegroup

    PACKAGES = "${PN}"

    SUMMARY:packagegroup-security-tpm2 = "Security TPM 2.0 support"
    RDEPENDS:packagegroup-security-tpm2 = " \
        tpm2-tools \
        ... snip ...

this seems overly complicated since the packagegroup doesn't define
any sub-packagegroups, so the "PACKAGES =" line seems superfluous, as
does the override usage for SUMMARY.

  but why should this generate the warning above? is there something
odd about the way this packagegroup is being defined?

rday


