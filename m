Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1734CCA476
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 15:25:37 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.11390.1760109929748683786
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 08:25:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=jomFOJxF;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 032CF4E40FD9
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 15:25:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C6AD960667;
	Fri, 10 Oct 2025 15:25:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 89CE4102F21C8;
	Fri, 10 Oct 2025 17:25:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760109926; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=w6TUxvgemcHpFm8A48VsWwtKfy6iaAy3topaTNMhkW4=;
	b=jomFOJxFMICcAX6sZbvnBqfjDl/TDIZDnUuUddPRh/xVmUj9ufdQD2ohmLdGz/1+hmLKb5
	G2cohex7Jw7qy4IKt8DSISoiOnBWgKLe0FxTA+GGonSpSboxR8g75nA6uH50gzrTd51xBb
	3YsmKrLihXlTcjPNg4A9rAUbQ6EqQ9z98pmXiDKkLfFS/B+Ufc/qP0+Fa82KtFfyNpnOUb
	e7uX9+Ct3FZxZ2L0ii906eHg8niTE+njNO2Q/1v/W4Ayv9NKqXURj2oFu3AiYfq+UP6Aj5
	mjzdF7DSZN5A88MRh8dcVwkpQw26jO1+k/51mLN2cLSTy1b51A0xgX0HP8U0Lw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Oct 2025 17:25:23 +0200
Message-Id: <DDEQW8B3NE3U.3B4LRO75HP1JX@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <pierre-loup.gosse@smile.fr>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v4 0/1] wic: extra partition plugin
References: <20251002144534.160791-1-pierre-loup.gosse@smile.fr>
In-Reply-To: <20251002144534.160791-1-pierre-loup.gosse@smile.fr>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 15:25:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224689

Hi Pierre-Loup,

On Thu Oct 2, 2025 at 4:45 PM CEST, Pierre-loup GOSSE via lists.openembedde=
d.org wrote:
> From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
>
> Some files are not part of the root filesystem and must be installed in a
> separate partition. This is already handled for boot files by the
> bootimg_partition plugin and its IMAGE_BOOT_FILES BitBake variable.
>
> This patch introduces a similar approach for generic "extra" files. A new
> extra_partition plugin is added, which populates a partition with files
> listed in the new IMAGE_EXTRA_PARTITION_FILES BitBake variable. Like the
> bootimg_partition plugin, files should be deployed to the DEPLOY_DIR_IMAG=
E
> directory.
>
> The plugin supports:
>  - Glob pattern matching for file selection.
>  - File renaming.
>  - Suffixes to specify the target partition (by label, UUID, or partname)=
,
>    enabling multiple extra partitions to coexist, similar to the
>    bootimg_partition plugin.
>
> For example, with the following (simplified) wks file:
>   part / --source extra_partition --fstype=3Dext4 --label foo --size 5M
>   part / --source extra_partition --fstype=3Dext4 --uuid e7d0824e-cda3-4b=
ed-9f54-9ef5312d105d --size 5M
>   part / --source extra_partition --fstype=3Dext4 --label bar --size 5M
>
> And this configuration:
>   IMAGE_EXTRA_PARTITION_FILES_label-foo =3D "bar.conf;foo.conf"
>   IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d105d =
=3D "bar.conf;foobar.conf"
>   IMAGE_EXTRA_PARTITION_FILES =3D "foo/*"
>   WICVARS:append =3D "\
>       IMAGE_EXTRA_PARTITION_FILES_label-foo \
>       IMAGE_EXTRA_PARTITION_FILES_uuid-e7d0824e-cda3-4bed-9f54-9ef5312d10=
5d \
>   "
>
> The file bar.conf is installed as foo.conf in the first partition, as
> foobar.conf in the second partition, and the last partition installs all
> files from the foo directory.

This was merged on master. Could you send a docs patch documenting the new
variable in ref-manual/variables.rst?

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


