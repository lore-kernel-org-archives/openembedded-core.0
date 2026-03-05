Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E29C9F3D32B
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 16:22:32 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48162.1772727750599566475
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 08:22:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=KV/VpQmm;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A92531A2CEA
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Mar 2026 16:22:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7E8A85FF89;
	Thu,  5 Mar 2026 16:22:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6DFB01036987C;
	Thu,  5 Mar 2026 17:22:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772727747; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dUNOqfCdUJYZDIgbRLjYZlEZhT4f3PtwMAykYDp93bc=;
	b=KV/VpQmmg4BQyHJw1zWV8MDiGmhCvCnRvJcleHs4yXeOLjkjPgaBxA2sw/6hfegPZYxnro
	qHr8ei9jKmQLy1FqlSDebOTQTexetiGre+yrN+2Y+MCAfqUtPS8mz76TlwwSAUHeDIMgcR
	WeNG8AzbbtVEpOnICQHCwX5jhz2uEcRRjXWggX43nCRde8c3GydlSzZQKBFgfrSTYzDcMi
	PHVxlnRmPwyca5HhqNe0rQF97Do/ykNJOGxAWFoJfy6SBTqY/tINLMbw+z3g1jH5f5nqXw
	IncQA+KfP6z9+r5gKLgzycD0gwvIWE5T9bOoDGFT5iavt9UM54nwm/Uz5bvKnA==
From: Benjamin Robin <benjamin.robin@bootlin.com>
To: openembedded-core@lists.openembedded.org, Paul Barker <paul@pbarker.dev>
Cc: ross.burton@arm.com, peter.marko@siemens.com, jpewhacker@gmail.com,
 olivier.benjamin@bootlin.com, antonin.godard@bootlin.com,
 mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com
Subject: 
 Re: [OE-core] [PATCH v3 6/6] sbom-cve-check.bbclass: Add class for post-build
 CVE analysis
Date: Thu, 05 Mar 2026 17:22:25 +0100
Message-ID: <1922651.atdPhlSkOF@brobin-bootlin>
In-Reply-To: <8fae3195a70bb6b43872b57cb27b6197c08744b8.camel@pbarker.dev>
References: 
 <20260226-add-sbom-cve-check-v3-0-2e60423f4d35@bootlin.com>
 <20260226-add-sbom-cve-check-v3-6-2e60423f4d35@bootlin.com>
 <8fae3195a70bb6b43872b57cb27b6197c08744b8.camel@pbarker.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 16:22:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232500

Hello Paul,

On Thursday, March 5, 2026 at 2:47=E2=80=AFPM, Paul Barker wrote:
> Hi Benjamin,
>=20
> Patches 1-5 of this series were accepted, but we had some concerns with
> this one.

Thanks!

> We would prefer not to override do_fetch for sbom-cve-check-update-*.bb.
> We should be able to use the standard git fetcher here, with a hardcoded
> SRCREV to allow offline parsing to succeed. A config fragment should
> then be defined which enables the sbom-cve-check bbclass and sets the
> srcrevs for the update recipes to ${AUTOREV}.

Honestly, I've been considering the best approach for fetching the CVE
databases. While using the Yocto internal fetcher is indeed cleaner, it
raises a few questions:

 - Is it possible to implement updates at fixed intervals (e.g., every X
   hours)? If so, how could this be done?
   If this isn't feasible, it's not a major concern, having the latest
   updates is more important than performance.

 - Would there be any objections to updating the `RM_WORK_EXCLUDE`
   variable within the database update recipes to exclude the recipe
   itself? Unpacking the CVE database is quite slow, especially given its
   size (~3GB).

 - By retaining the unpacked databases, we could store the database index
   in the `$workdir`. This would avoid the need to recompute the database
   index each time, which is something we'd prefer to avoid.

 - However, it feels questionable to use an extracted Git repository from
   another recipe: My whole (new) idea on how to fix this looks wrong.
   I checked how `cve-update-nvd2-native.bb` handles this, the database
   is moved to the download directory. But if we do this, the database
   will still be unpacked for every analysis, which we try to avoid.

My primary aim is to avoid extracting the database repeatedly for every
build, and to be able to keep the database index somewhere.

> Running sbom-cve-check offline should be supported, but manual config
> may be needed to set an appropriate srcrev. We should provide an example
> of this in the docs.

I plan to write documentation (in yocto-docs) as soon as this series is
merged :)

> We should also be able to avoid setting do_sbom_cve_check[nostamp]. With
> dependencies set correctly, this should only re-run if the image changes
> or the cve database has been updated.

I am going to fix that (at least try, see discussion above)!

Best regards,
=2D-=20
Benjamin Robin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com




