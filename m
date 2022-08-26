Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53945ECAAD2
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 10:02:35 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web09.35350.1661508145270818040
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Aug 2022 03:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FwgXWmAn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id EA600FF805;
	Fri, 26 Aug 2022 10:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1661508143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bDByYKi9mLJSrRxkm+BWjNCfg6DS6o75MLKH0wFy/BA=;
	b=FwgXWmAn6CuyLg4gKkdMbVe7mzpBKuoE1ENXQykiJM1vLbtziugQWiPsZ8QzoMzUKdbi1H
	wHYxpoCBzJ15i9QLcRLSmH3z0SsNgHch+ClkgfgT9qf4pfkxO+tkPom+tuZMdNvHU4w+WQ
	dbXGFqKOxlIH09h9D3hcjQ6tLkazAir/Xq1D2HZMcgMQdtPIKdcppE791VG+uIxleojvMP
	it7WvnytoVbcr0Z0JdiMbRBZwEofJMgIzsl4ybSDxZ5TlQUB4LAX31Ja7g4T9+7KY144Yb
	iGaxkE5u/tsn4OCg/wU8IQnpYIwa981vNo3RoD3vIrNa+on5YPJt2bvqzH12JA==
Date: Fri, 26 Aug 2022 12:02:20 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Livius" <egyszeregy@freemail.hu>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [master][PATCH] image_types: add 7-Zip support in
 conversion types and commands
Message-ID: <20220826120220.18071b38@booty>
In-Reply-To: <kqeP.1661457574119806544.v4b2@lists.openembedded.org>
References: <kqeP.1661457574119806544.v4b2@lists.openembedded.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Aug 2022 10:02:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169907

Hello Livius,

thank you for your patch!

I have a few comments, see below.

On Thu, 25 Aug 2022 12:59:34 -0700
"Livius" <egyszeregy@freemail.hu> wrote:

> I added to support=C2=A07-Zip in conversion types/commands. It is fully c=
onfigurable in compression level, method and file extension.
>=20
> From: "Benjamin Sz=C5=91ke"=C2=A0<egyszeregy@freemail.hu>
> Date: Thu, 25 Aug 2022 21:45:55 +0200
> Subject: [PATCH] image_types: add 7-Zip support in conversion types and=
=C2=A0commands

These 3 lines should be in the mail header, not in the body. All the
lines that appear in the body before the '---' line will be part of the
commit message, and of course we don't want these 3 lines in the commit
message.

I recommend you to use 'git send-email' to send patches.

See this link  (from README.md in the meta-yocto sources) for more info:
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

> ---
> meta/classes-recipe/image_types.bbclass | 8 +++++++-
> 1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recip=
e/image_types.bbclass
> index a731e585b2..94aa1d9510 100644
> --- a/meta/classes-recipe/image_types.bbclass
> +++ b/meta/classes-recipe/image_types.bbclass
> @@ -59,6 +59,10 @@ XZ_INTEGRITY_CHECK ?=3D "crc32"
>=20
> ZIP_COMPRESSION_LEVEL ?=3D "-9"
>=20
> +7ZIP_COMPRESSION_LEVEL ?=3D "9"
> +7ZIP_COMPRESSION_METHOD ?=3D "BZip2"

Did you run some performance test to check that this is actually a good
balance between compression ratio and compression time?

> +7ZIP_EXTENSION ?=3D "zip"

I think the 7zip default extension is '7z', why defaulting to 'zip'?
Seems like generating confusion for no reason.

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

