Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6DB0C4332F
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 23:52:20 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.89880.1670975531933109217
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 15:52:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y3euVkRP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id f13-20020a1cc90d000000b003d08c4cf679so9442009wmb.5
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 15:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8K7dwh/3jvofXztFS2VNz7J+Ts142RpslCf4DiDh0yQ=;
        b=Y3euVkRPMXClj680vr4iCx877QT5I0na115jlbqu+6ZnCpdwGS3zbBqADFkLFKGYRm
         98LZdSzrIWIhLmOJjUw/fWPORsiqQkIriV0IrLxKl4ez/yTeKzErYIK2U3Zbu8OeqtXn
         g6FmudUftYVyxmhokuwsBRB9ClnY1xymLPyxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8K7dwh/3jvofXztFS2VNz7J+Ts142RpslCf4DiDh0yQ=;
        b=D5rYp9osgFYS7EBUHxJrCmiJbxfS6eteuZ+L7aALTgMJbphitLASxgNBUy5jUccDBn
         u6QviPY9O+5fY5ynF+M0b/fO+OfJy8DHR34SkeG5DWcYI4Bw4hBi1jtkvYYGdo+3oX3/
         +j5zFV1ewDoGs39cXJJjcDvwtL/S0L4GXVpI6JnGDB4s7P0Lxn2ozHOE1e8tFtn473zY
         EQDjvLiecaR0UMQdAg0SlVnQTIRiodM6A6l3cwqrXASu3gXk9Blb40e3SXj5FSV6MwX4
         WhCyBx34j0ouiHxXxVq34rbzs1RV82lUN5JaJEmFTBrNF68dxstk0VDBk4l0mLMxTSdm
         lYJw==
X-Gm-Message-State: ANoB5pkDzufd7kYFDeAIP9AEQZA1gVfxTGtEAl1hirjQE9YSqOb4YEfg
	d7tdfGjPnVZT6MefrjH7MsYsJQ==
X-Google-Smtp-Source: AA0mqf6gaqa5GQg2sfmq4Ts7hotXVWB5uF513osytZmOEXGwA0y1iBsfCOhTu9WVMOPIj2mRTVDPCg==
X-Received: by 2002:a7b:ca49:0:b0:3c6:e63d:b8a2 with SMTP id m9-20020a7bca49000000b003c6e63db8a2mr17022433wml.17.1670975530012;
        Tue, 13 Dec 2022 15:52:10 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:9b1a:807b:6e09:ff96? ([2001:8b0:aba:5f3c:9b1a:807b:6e09:ff96])
        by smtp.gmail.com with ESMTPSA id z24-20020a05600c079800b003b4a699ce8esm308060wmo.6.2022.12.13.15.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 15:52:09 -0800 (PST)
Message-ID: <fdd0b8fac4e6a8398c9cda35d0c11a3bac355c8e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] kernel-fitimage: reduce dependency to the cpio
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patrick Williams <patrick@stwcx.xyz>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2022 23:52:08 +0000
In-Reply-To: <20221212221808.753268-1-patrick@stwcx.xyz>
References: <20221212221808.753268-1-patrick@stwcx.xyz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 23:52:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174546

On Mon, 2022-12-12 at 16:18 -0600, Patrick Williams wrote:
> In order to build a fitimage, we don't need the image to be "complete"
> but we need the cpio portion of it built since the cpio is what ends
> up inside the FIT.  By reducing the dependency to `do_image_cpio` we
> are able to include an image's rootfs as the ramdisk for a FIT and
> then bundle that FIT into a larger SPI flash layout.
>=20
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> ---
>  meta/classes-recipe/kernel-fitimage.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-r=
ecipe/kernel-fitimage.bbclass
> index 7980910aa8..ccc132482e 100644
> --- a/meta/classes-recipe/kernel-fitimage.bbclass
> +++ b/meta/classes-recipe/kernel-fitimage.bbclass
> @@ -38,7 +38,7 @@ python __anonymous () {
> =20
>          image =3D d.getVar('INITRAMFS_IMAGE')
>          if image:
> -            d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends',=
 ' ${INITRAMFS_IMAGE}:do_image_complete')
> +            d.appendVarFlag('do_assemble_fitimage_initramfs', 'depends',=
 ' ${INITRAMFS_IMAGE}:do_image_cpio')
> =20
>          ubootenv =3D d.getVar('UBOOT_ENV')
>          if ubootenv:

I merged this but then realised you can't do this. The copy to
DEPLOY_DIR_IMAGE happens during do_image_complete so you can't rely on
this to be present until that task. We need the copy and sstate code so
we have a manifest of what is "installed" so we can clean up the task
and replace it with code re-running.

As such I reverted it.

Cheers,

Richard

