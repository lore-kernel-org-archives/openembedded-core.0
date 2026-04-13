Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD397EBFD24
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 09:32:37 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.268544.1776072742011935446
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 02:32:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=R/RYJE7C;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1F1E04E4291F
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 09:32:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E93975FFB9;
	Mon, 13 Apr 2026 09:32:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D9A541045022E;
	Mon, 13 Apr 2026 11:32:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776072739; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GcwpqKHS1GgpB659//q5BQjOzqAJmY9nYcvZLwIhDt4=;
	b=R/RYJE7CdlSHUPDpD9KL+DssYqR/odb4AkkwYXaB6vDKr4JaQuO6jLDJucEs0DmDalpLoY
	/Zq+XXyJqFo087udQu+GnrY2KDGn13YRKVYevhPWxFcn2N1dipQFsDIkef+t3MkRujAzr+
	Q0NHkjZMyBpDup7PrMvGIt9VKvZdoP8mbdoZAJQLBxpGPC9cxiiw7F4bxNx5Nypy6Ld3Ka
	nv2gBbdMKOXDbh0BQvZOAuJbpuX6QTM6ZaRPv0MfLz2gUEM0I6WTw/gWuwUoYrbzjoi4yL
	jkBalGN/W6qGpi2cnBllyIp73NNFQRsQ4u7jk9Rsz1fK5g3HrwjLSi3ooT+8MQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Apr 2026 11:32:16 +0200
Message-Id: <DHRX8N5OL55X.3OKSM6LCFRKA1@bootlin.com>
Cc: "Mark Hatle" <mark.hatle@kernel.crashing.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <twoerner@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v8 1/1] wic: re-implement sector-size support
References: <20260326001150.203099-1-twoerner@gmail.com>
 <20260326001150.203099-2-twoerner@gmail.com>
In-Reply-To: <20260326001150.203099-2-twoerner@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 09:32:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235094

Hi,

On Thu Mar 26, 2026 at 1:11 AM CET, Trevor Woerner via lists.openembedded.o=
rg wrote:
> The previous implementation had the following limitations:
> - required the variable WIC_SECTOR_SIZE either be defined in a
>   configuration file or be defined in a --vars file
> - this means that every invocation of "wic ls", "wic cp", or "wic rm"
>   needed this variable defined (config or --vars)
> - required the user to create separate *wks files for every sector size
>   they wanted to use
> - required the user to specify the --mkfs-extraopts by hand to specify th=
e
>   correct sector size: e.g.
> 	bootloader --ptable gpt
>         part --fstype vfat --label emptyfat --mkfs-extraopts "-S 4096"
> 	part --fstype ext4 --source rootfs --label rofs-a --mkfs-extraopts "-b 4=
096"
> 	part --fstype ext4 --source rootfs --use-uuid --mkfs-extraopts "-b 4096"
> - it would not be possible to generate images with different sector
>   sizes in the same build since the configuration and *wks files would
>   need to change and the build re-run for each size
>
> The new implementation handles the sector-size via a CLI argument, while
> preserving the previously implemented variable definitions:
> - the sector-size may now be provided on the cmdline to the "wic ls",
>   "wic cp", "wic rm", and "wic create" commands: default =3D 512
> - this means the configuration and/or --vars file does not need to be
>   changed in order to perform those operations on images with different
>   sector sizes
> - support is provided implicitly for mkdosfs and ext[234] partitions
> - the user no longer needs to know and supply the sector-size magic in
>   --mkfs-extraopts (thereby clobbering the other defaults)
>
> As before, if the --sector-size command-line argument is not given,
> allow the sector-size to be provided via the WIC_SECTOR_SIZE bitbake
> variable. The user is warned that this behavior is deprecated. If both
> are given, warn the user that the cmdline argument takes precedence.
>
> AI-Generated: codex/gpt-5.1-codex-max
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
>
> - restore environ test case, as it is still supported (but obsolete)
> - revised commit message above
>
> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> ---
> changes in v8:
> - Mark Hatle stepped in to help provide advice and updates
> - add back the code and test to support/allow users to specify a
>   sector-size in --mkfs-extraopts, this gives the user 3 places in which
>   the sector-size can be specified:
>   1. cmdline
>   2. --mkfs-extraopts in *.wks files
>   3. WIC_SECTOR_SIZE bitbake variable/--vars file

I've written a migration note here (sent on the docs list):
https://lore.kernel.org/r/20260410-second-release-notes-6-0-v1-11-40213436c=
3ca@bootlin.com

Could you confirm that this is the right approach?

Antonin

