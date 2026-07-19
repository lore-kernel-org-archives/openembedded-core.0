Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6CEEC44512
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 17:14:08 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1556.1784481243678812316
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 10:14:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2pZq5D+m;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-495437bb891so22543015e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 10:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784481242; x=1785086042; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x90oVtfqqqBb8GIhZJUROLEzssWu0Ls/Swg7SwTN3Vw=;
        b=2pZq5D+m4Z9JNEoDAcWNSorWgKvcrZx/CJ2QuAy/buVJIvCuNpAd1PAXSOzwe4a57V
         lYfcxPjRrwynpc6tbDiJ/ymtebp9A/5201Ev1Pat+ioam47x3KgXgEs9x+Ekdf4TkRlb
         VY0E/pp67ToHeWM18iBQD3XSp0VFEvHfhQzn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784481242; x=1785086042;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x90oVtfqqqBb8GIhZJUROLEzssWu0Ls/Swg7SwTN3Vw=;
        b=ZLhEPZlMEY0xolE/csrALtLZ5vpMUBf2SwC9o4Tcci94W4PF14G3CzXXVIRt4e+Pqj
         FweUx/rq765RDQKIkr35YfYqqmbHAdFF4Wq+HngndurOgbTm/+WfXc7zysrMGAZYnZR3
         JO/+CvuH/KJFa6W6QcAgttAgL1tSRzhDhINHzluYjaVcg722B8ABbC5Zhgj2DA50wDNG
         +0Q5kW7UVaFI/LZHfE/F6+clHjilW4+qUUw2PtCpm2aAVpaPuqAZ915KZImk0z4NW7HE
         goIBkRBtkTsvN/X16AH3bh045YGhTUwHk0WvTiijXl9Vn1CwmR4loAUsJa+hNfI4yi6x
         HbAw==
X-Forwarded-Encrypted: i=1; AHgh+RqJKmotgUBrMeSQ1gcgdAgDnfi1B6GFRqqlKdfpFCpAujbBXQjscooTq+VyARZcMkIPv7+VIG7BhtZkga22xL8deA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwlhLP2GXNOsv+d+4KvN3EzhJPCiOfBtveJLjBuuaNhVJXVynWi
	CaeM+kIhn6dBVgSWSd/RhZoFKFlUmeUN9JkmEXzx8Uz5ak7q5Xgo/ufhFOd+pnX4PDk=
X-Gm-Gg: AfdE7ckiPgo4qLRiS3FVE2Xg+7W+xsFCVCZNqecbTYBwH6vUteQ+h+8QQT5+b6uGTQR
	Ws+xBCOh0tGGG5AaP7CuzcN8cZ5pBJEaAsM91sfZXcsTnvkL9oMvlBWL00w9JlkLh1C2uIz4oEn
	51tUHuMnoZQXvrobJk7W28Zz8Qcc7rTL01UQsfosC94rNXdlWN8c081XBYeNTTn7Fj1IOqmxgJ1
	i9apw+Y+wyZCOSZTi0ekop552u2M668aJdIKPKmJpJAcNGu4+3qiChBp8pPKsadJgy4/d3s1jw6
	UV6PGjB+8u2Epkx5yX3FLdhKop50YiJlclDfhNbm9L3cjJaI+Cw+YDgfjAqdhDw/Mzzdj+tMdfr
	QKtK7REC3nW9YPK279uQwL3pkOy/kb+j7CBs4Xs+/1lCW7GQoP3XENzRW/9hmQwPlnVP0W/gXBb
	qzXVPUTXKaYrJ86/ZSZu8ngcD3lTLFTadc/m4M+IpZrOBwO97kxFOUu7W0EPINPNwXrbM=
X-Received: by 2002:a05:600c:4f0e:b0:495:4f84:7280 with SMTP id 5b1f17b1804b1-4954f847354mr88221495e9.4.1784481241836;
        Sun, 19 Jul 2026 10:14:01 -0700 (PDT)
Received: from localhost (2a01cb001331aa00e37f7eb174d0a6c8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:e37f:7eb1:74d0:a6c8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954c0a81f7sm145403955e9.1.2026.07.19.10.14.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 10:14:01 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jul 2026 19:14:00 +0200
Message-Id: <DK2PT0QLCUZ6.2CQUAXXCZATD1@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] create-spdx-image-3.0: correct
 SSTATE_SKIP_CREATION key for do_create_image_sbom_spdx
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <olivier.benjamin@bootlin.com>, <thomas.petazzoni@bootlin.com>,
 <mathieu.dubois-briand@bootlin.com>, <pascal.eberhard@se.com>,
 <wahid.essid@se.com>, "Eric Meyers" <eric.meyers@arthrex.com>, "Joshua
 Watt" <JPEWhacker@gmail.com>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>, "Eric Meyers"
 <eric.meyers15310@gmail.com>
To: <benjamin.robin@bootlin.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260708-fix-sstate-create-spdx-image-scarthgap-v1-1-8f605c913801@bootlin.com>
In-Reply-To: <20260708-fix-sstate-create-spdx-image-scarthgap-v1-1-8f605c913801@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 17:14:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241296

On Wed Jul 8, 2026 at 9:11 AM CEST, Benjamin Robin via lists.openembedded.o=
rg wrote:
> From: Eric Meyers <eric.meyers15310@gmail.com>
>
> The override was "task-create-image-sbom" but BitBake derives it as
> "task-create-image-sbom-spdx" (do_ stripped, underscores to hyphens), so
> the skip was never applied. The task then cached an ${IMAGE_NAME}-stamped
> SBOM in sstate, letting a stale spdx.json be restored via setscene. A
> later do_sbom_cve_check would compute the current IMAGE_NAME and fail wit=
h
> "No such file or directory" on the missing timestamped SBOM. Correct the
> key so the image SBOM is always regenerated, never restored from sstate.
>
> (cherry picked from commit 45302ff5cfaf91ece74d4065acf710507f27da15)
>
> Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootli=
n.com>

Beware, you removed the trailers (SoB: ...)  while cherry-picking.
I restored them.

Regards,

> ---
> Backport this fix to scarthgap.
> ---
>  meta/classes-recipe/create-spdx-image-3.0.bbclass | 2 +-
>  meta/classes-recipe/nospdx.bbclass                | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/cla=
sses-recipe/create-spdx-image-3.0.bbclass
> index e0f1766bb766..c516e9545653 100644
> --- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
> +++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
> @@ -71,7 +71,7 @@ python do_create_image_sbom_spdx() {
>  }
>  addtask do_create_image_sbom_spdx after do_create_rootfs_spdx do_create_=
image_spdx before do_build
>  SSTATETASKS +=3D "do_create_image_sbom_spdx"
> -SSTATE_SKIP_CREATION:task-create-image-sbom =3D "1"
> +SSTATE_SKIP_CREATION:task-create-image-sbom-spdx =3D "1"
>  do_create_image_sbom_spdx[sstate-inputdirs] =3D "${SPDXIMAGEDEPLOYDIR}"
>  do_create_image_sbom_spdx[sstate-outputdirs] =3D "${DEPLOY_DIR_IMAGE}"
>  do_create_image_sbom_spdx[stamp-extra-info] =3D "${MACHINE_ARCH}"
> diff --git a/meta/classes-recipe/nospdx.bbclass b/meta/classes-recipe/nos=
pdx.bbclass
> index b20e28218be9..913b213a6543 100644
> --- a/meta/classes-recipe/nospdx.bbclass
> +++ b/meta/classes-recipe/nospdx.bbclass
> @@ -10,4 +10,4 @@ deltask do_create_spdx_runtime
>  deltask do_create_package_spdx
>  deltask do_create_rootfs_spdx
>  deltask do_create_image_spdx
> -deltask do_create_image_sbom
> +deltask do_create_image_sbom_spdx
>
> ---
> base-commit: 2814f0962f56c8d1afa4de76d2895ba9b5cb767d
> change-id: 20260708-fix-sstate-create-spdx-image-scarthgap-697f60f4ab87
>
> Best regards,
> -- =20
> Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>


--=20
Yoann Congal
Smile ECS


