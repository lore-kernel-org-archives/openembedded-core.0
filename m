Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA2BC44524
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 12:39:31 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10563.1768999163591630053
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jan 2026 04:39:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=GocRgUrA;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7040A4E421C4
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 12:39:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 40DC66070A;
	Wed, 21 Jan 2026 12:39:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4423A119B0FFF;
	Wed, 21 Jan 2026 13:39:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768999160; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NZqJ1srPsg/T9rPuW66jkNSrjReOCLYdIDGPMm8qoSA=;
	b=GocRgUrAm9TEJlVA9ptvnCoQn9RvtoTxFtxK465HHbhZ1Shc/QoQsKfl0hy8geArqH1biE
	VyGXHd9mvYmczCCxtiYHpCFW9/+h80wTgThEKgfSc+31rjwgmgVY5spqtj3yt8Ej1bp43S
	U5UYaVM6cs6ZmavpQCr645h1LrPoJoYJvDGtObLwoiT116XuRO4Dkx/rqcaR8K43mWNIFU
	KhnYhA4PXElTFWIPuF+O56qrs8q7xFrMILKHGNXrWmhqSZWafPYoNapLJwZr2Io7ju5In9
	Or/TmWkfkzA6axOqCyV84L2dLPnFdqYJcPDGkvsMef/oOETf879yoNh+0DxMJA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 13:39:19 +0100
Message-Id: <DFU9V6ZMRPSI.D5A7XD6GPHK4@bootlin.com>
Subject: Re: [OE-core] [PATCH] coreutils: Backport fix for lseek_copy loop
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Paul Barker" <paul@pbarker.dev>,
 <openembedded-core@lists.openembedded.org>
References: <20260121-fix-coreutils-v1-1-30a1769b5733@pbarker.dev>
In-Reply-To: <20260121-fix-coreutils-v1-1-30a1769b5733@pbarker.dev>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 12:39:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229809

Hi,

On Wed Jan 21, 2026 at 11:41 AM CET, Paul Barker wrote:
[...]
> diff --git a/meta/recipes-core/coreutils/coreutils/0001-fix-lseek-copy-lo=
op.patch b/meta/recipes-core/coreutils/coreutils/0001-fix-lseek-copy-loop.p=
atch
> new file mode 100644
> index 000000000000..75286dc43cb9
> --- /dev/null
> +++ b/meta/recipes-core/coreutils/coreutils/0001-fix-lseek-copy-loop.patc=
h
> @@ -0,0 +1,35 @@
> +From bd528f923482223649aa84be7d131e69356149da Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?P=3DC3=3DA1draig=3D20Brady?=3D <P@draigBrady.com>
> +Date: Sun, 4 Jan 2026 12:45:46 +0000
> +Subject: [PATCH] copy: fix possible infinite loop with SEEK_HOLE
> +
> +Commit v9.8-95-g4c0cf3864 intended to initialize
> +ext_start to src_pos, as was described at:
> +https://lists.gnu.org/r/coreutils/2025-11/msg00035.html
> +However ipos was inadvertently used, which is only
> +valid the first time through the loop.
> +
> +* src/copy-file-data.c (lseek_copy): Use scan_inference->hole_start
> +only with the initial offset passed to lseek_copy().
> +* NEWS: Mention the bug fix.
> +Reported at https://github.com/coreutils/coreutils/issues/159
> +
> +Upstream-Status: Backport (commit bd528f923482223649aa84be7d131e69356149=
da)

I wonder if having the reason between brackets and not parenthesis is impor=
tant
here? That's what we document but they could interchangeable, I don't know =
for
sure.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


