Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB30CAC5A7
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 15:20:31 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.14398.1758813629235256129
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 08:20:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=iIPzFrDI;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1FA99C011FB
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 15:20:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3DDA76062C;
	Thu, 25 Sep 2025 15:20:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 87351102F189F;
	Thu, 25 Sep 2025 17:20:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758813626; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wuzHstxhtlJOAHNhVu5IxoU21wyZHOZgVgDGPh0jScE=;
	b=iIPzFrDIoV33eKETmQbSBnDw8L8szMIQ2dpM+/gCMF4/bilP6VRTB0uxy5unPkgFWoANmL
	ATX97ZTWc2dzc1jF6/mxrDgtwvLWe5ZhL/P/GeBvRxNu/bDt+bm6+vK9x6FASz+/asxxE6
	0yDMPU4NFa1DfKP+Ysal+8soXAYvl6VtHY063Z6XtURKXs8WGbWba14VDXYRs5b0Bkh/Dn
	yb1pYEPZMYm756IPNjIGJkpAknFnREqLX9QNyuSGJwBgD/1L6C1H0Kn6TAnpC84di4ImHI
	j7Ndk2D7kv4C5rT+Tuj9TFfpGXUy0maXF9w1O+n6BjOG+gBt4gVF99QLnqhKfg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 25 Sep 2025 17:20:21 +0200
Message-Id: <DD1ZE7G2YIZ9.L1KYBCLSDBU@bootlin.com>
Subject: Re: [OE-core] [PATCH v2 1/1] wic: extra partition plugin
Cc: <yoann.congal@smile.fr>, <openembedded-core@lists.openembedded.org>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <pierre-loup.gosse@smile.fr>, "Peter Bergin" <peter@berginkonsult.se>,
 "Alexander Kanavin" <alex.kanavin@gmail.com>
References: <20250925072203.3490596-1-pierre-loup.gosse@smile.fr>
 <20250925072203.3490596-2-pierre-loup.gosse@smile.fr>
 <CAMSfU+4LjK0K9Mh20oJxhTvW8Dw87nriJakCwQiFfr_T6TSLOg@mail.gmail.com>
 <CANNYZj9PfFUcESHwT_6-CzDw8QB30hva_o5V2gVX5uB+LjaOng@mail.gmail.com>
 <CAHT-cZtsPnCk3_6-48D3uRJbVxmexjeSayhphzCWm_OTraQR4A@mail.gmail.com>
 <6371e7d1-1d57-4b6a-bb6d-eb3ce0f0ba9d@berginkonsult.se>
 <CAHT-cZtr-en6sc7JaPfN9s7BFbwiV+iGrv9rQDKjr8rcXSpWFA@mail.gmail.com>
In-Reply-To: <CAHT-cZtr-en6sc7JaPfN9s7BFbwiV+iGrv9rQDKjr8rcXSpWFA@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 15:20:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224042

On Thu Sep 25, 2025 at 2:43 PM CEST, Pierre-loup GOSSE via lists.openembedd=
ed.org wrote:
>>
>> in the past I have used to rootfs plugin with '--exclude-path' [1] and
>> '--change-directory' [2] assuming that I have isolated all files going i=
n
>> to the extra partition in to one directory of rootfs.
>
> This is a solution when files are installed in the rootfs but need to be
> split across multiple partitions.
>
> However, some files aren't or shouldn=E2=80=99t be in the rootfs. For ins=
tance,
> I=E2=80=99ve worked on boards requiring a dedicated VFAT partition just f=
or the
> U-Boot script. Other use cases include keeping business software separate
> from the rootfs, especially when they are installed and updated
> independently (with a SWU package).
> Pierre-Loup,

Why not install all the files in IMAGE_ROOTFS in a single image, then do th=
e
filtering in the WKS?

What I do is:

  part rootfs --source rootfs --fstype=3Dext4 --exclude-path=3Ddata/ ...
  part data --source rootfs --rootfs-dir=3D${IMAGE_ROOTFS}/data ...

In this case the rootfs partition will not include the files in /data, and =
the
data partition will include them.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


