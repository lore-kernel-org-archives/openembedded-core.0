Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC39C77B73
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 08:00:18 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.16917.1684742416701591842
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 May 2023 01:00:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=GaxH/YgS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3078d1c8828so5448444f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 01:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1684742415; x=1687334415;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UiB5HepA35hXaJqr8YvfS1ZZti/dBbVFgunS5PLOkjU=;
        b=GaxH/YgSuJWmTzcRkoOpjGm+e4mYiaRpPyqQ+WkDJaWnkm8whuFdytixuGhcBTLo5O
         VYYRXufqbM69/Wgt0ePUlrLmwbJclM6+7gJt6j9fy0SCQlGr2HX6hTRcdyix660lMiqg
         DPl/cMszLfaqF9N7E7y6cL8merCLS1EvJdhLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684742415; x=1687334415;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UiB5HepA35hXaJqr8YvfS1ZZti/dBbVFgunS5PLOkjU=;
        b=gCi9a0SY7lr5CnkFYAZARrzeau0GjsLnl0oJIiLY9+XGT4Pr10kgumBDdIiDX2lt6m
         FKFR0lhZRkfHaT+rlKiVu2QWtiTVCOm5U6ZzwRvXOfTDK9LAfCzNbaikYttceoX5krpJ
         XHecsuo+tv6OPyT7h51Yp9kkybpeq2YJD077M6hyPrASSVzi9xYWlDEjq4GReZoZfBPh
         DzH4RmvRuo0G3+OTGFxdsDrpL0/mRaPBr87cr07eiUDjLFaHH0D+eMUQf6Afp+sSD1FG
         ASJCljpkULYiz2mVZqCimeCc5v00AUoZaGZMZIIFWKsk2aul/1J9BK5n6rLDVw7Rk+aM
         lMrA==
X-Gm-Message-State: AC+VfDzfs9Ed1VYXUGV4/yaOznq6HIbeZA/3MV2lkE1VmArCkZ/zydkU
	YOQssW148bZisloflEr3rBd7TA==
X-Google-Smtp-Source: ACHHUZ6x5zdElX+ua2I5CHsjXuWnL8Hnuizw/Csewyb+/stdjjxmAetfmFz00Cb30HVsQDLZ2Oxh2g==
X-Received: by 2002:adf:e689:0:b0:309:38af:d300 with SMTP id r9-20020adfe689000000b0030938afd300mr6009204wrm.33.1684742415034;
        Mon, 22 May 2023 01:00:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bbd6:6555:2925:1c74? ([2001:8b0:aba:5f3c:bbd6:6555:2925:1c74])
        by smtp.gmail.com with ESMTPSA id o14-20020a5d58ce000000b003062675d4c9sm6767389wrf.39.2023.05.22.01.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 01:00:14 -0700 (PDT)
Message-ID: <373eafd376a3ecf1b418fcbd0a8dfc8974226920.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCHv2 2/2] kernel-devicetree: recursively search
 for dtbs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rs@ti.com, afd@ti.com, reatmon@ti.com, denis@denix.org,
 martin.jansa@gmail.com,  peter.kjellerstedt@axis.com,
 alexandre.belloni@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 22 May 2023 09:00:13 +0100
In-Reply-To: <20230512172221.4062722-3-rs@ti.com>
References: <20230512172221.4062722-1-rs@ti.com>
	 <20230512172221.4062722-3-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 08:00:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181585

On Fri, 2023-05-12 at 12:22 -0500, Randolph Sapp via
lists.openembedded.org wrote:
> From: Randolph Sapp <rs@ti.com>
>=20
> Upstream's dtb directory structure has no real standard. They just tend
> to idle around the 2/3 directory depth. Recursively search for the
> dtb/dtbo files instead of assuming anything.
>=20
> Fixes: 04ab57d200 (kernel-devicetree: allow specification of dtb
> directory, 2023-05-02)
>=20
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  meta/classes-recipe/kernel-devicetree.bbclass | 21 +++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/classes-recipe/kernel-devicetree.bbclass b/meta/classes=
-recipe/kernel-devicetree.bbclass
> index 831fdd1527..fa6de7a140 100644
> --- a/meta/classes-recipe/kernel-devicetree.bbclass
> +++ b/meta/classes-recipe/kernel-devicetree.bbclass
> @@ -12,12 +12,21 @@ python () {
>              d.appendVar("PACKAGES", " ${KERNEL_PACKAGE_NAME}-image-zimag=
e-bundle")
>  }
> =20
> -FILES:${KERNEL_PACKAGE_NAME}-devicetree =3D " \
> -    /${KERNEL_DTBDEST}/*.dtb \
> -    /${KERNEL_DTBDEST}/*.dtbo \
> -    /${KERNEL_DTBDEST}/*/*.dtb \
> -    /${KERNEL_DTBDEST}/*/*.dtbo \
> -"
> +# recursivly search for devicetree files
> +def find_device_trees(d):
> +    import glob
> +    import os
> +
> +    file_paths =3D []
> +    dest_dir =3D d.getVar('D')
> +    full_dtb_dir =3D dest_dir + '/' + d.getVar('KERNEL_DTBDEST')
> +
> +    for file in glob.glob(full_dtb_dir + '/**/*.dtb*', recursive=3DTrue)=
:
> +        file_paths.append('/' + os.path.relpath(file, dest_dir))
> +
> +    return ' '.join(file_paths)
> +
> +FILES:${KERNEL_PACKAGE_NAME}-devicetree =3D "${@find_device_trees(d)}"
>  FILES:${KERNEL_PACKAGE_NAME}-image-zimage-bundle =3D "/${KERNEL_IMAGEDES=
T}/zImage-*.dtb.bin"

I suspect this still suffers from a determinism problem as the previous
patch did but now it depends on whether the build had occurred or not.

I also really don't like resorting to python functions like this,
they're horrible for performance overhead. I did wonder if:

FILES:${KERNEL_PACKAGE_NAME}-devicetree =3D "/${KERNEL_DTBDEST}/**/*.dtb*"

would work?

Also, are there automated tests we should be adding to catch bugs like
this?

Cheers,

Richard


