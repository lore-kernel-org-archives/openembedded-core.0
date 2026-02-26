Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90FEBFD9E21
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 23:04:44 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.83345.1772147083283798212
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 15:04:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xTyKsqoS;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4807068eacbso11648155e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 15:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772147081; x=1772751881; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/On1WMVYUkG7QAS7Vy5/agXtEQegebT5Sf7miKO2Xcg=;
        b=xTyKsqoShh79EvbeDNd/zCQE4vxIsuqqYQczC2MYlD1SsxNY9CSZsJWxAAzBZyGaFN
         cKqYtqY4+tU94W3tAnOO4FlLcEvitcrZnnAR6mbgjGtTvhznts4d/TDpuzIBzKCdHgez
         mf+HqyaBjQ7ww/GvuDde7YA3O1hLMPSCCFxtI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772147081; x=1772751881;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/On1WMVYUkG7QAS7Vy5/agXtEQegebT5Sf7miKO2Xcg=;
        b=Yki4IRFTXi0SJpJfrvHFAKiUR0vVDE2ADo2e0f/igr4zrU2sUTBX/MKC+7i9uqxACd
         LNpDy+hjGzi1NxCFAOiHE6wmRft0ehzbFbBWoeDQsnuvmV3hf2ZCoWkoir27Ez4hZxH/
         QxooppGzgjIgnBrR2ObCyV9cuniUqX/GKeMkWzqe+bPHa7cd3243UaZMlDeJaBBty1AR
         I2DO22JUvZ32Awa+6bjKpQDljxqmFw0yry78e23sCkiCOMaRh+MoNu27fk1CHVJcfgzX
         rWgVxgoA2IneSG4eoRwSZXjjM+aQ4hO7dXMM/ee8CwwEzYl8A08+dbL2KqPtWezR+/7R
         4dyA==
X-Gm-Message-State: AOJu0Yyt8bBp0FyFwsqgT7xGlEnrHeVaZSxkVLxsOD7C0JiHmg8Qmw7/
	Y9tyo8/1GtBiVHuTwdoA1BHe2ZGBI68zGXSEBuexkq5dkX4L2dlklbo5lWCPoRDyoqhxB2uTv9l
	8Uyqw
X-Gm-Gg: ATEYQzyvi1TmyEauV7pnQgRun8M8+P+EcRMm3tQLR0yRbqN96/0MoNm2WhwSl/EXKV/
	w0v2OdxoZleYa3pt/wnHovkTD+Ix1qzwe3BPuWuV3hqMIK44TPWYTELzDFUiS9HW9T7vlOia/on
	VQgUGLD8wjRrWvO7RWFMknORbHsTx7JutI8qpvTPtQPPAypzwl4rlrL/zHlNzbdPyqGy3z1LVId
	7rDotQjcRyV2EU7VJNEM5NwhIixnex9/wFx0eAfXl6QWJGcpl7BZdj/Ji6DqiiSjWiRCaWVoWZD
	7BjpMDsqfVuLG4wDvSjlv62kQvzShFpLnPmuP1lnMnD5uqbJGmMb+zACrXmj2UcodCepzylnjhk
	TGNkR4NzxqHBXDwpHvPNwBKimiBHd2admRVyafLa4J0sFhP5ScBtq0ZnIcDioO/IWotUhuekD68
	q+CZtQSekLV5mgFZ1SJzXPptlbJOoq9Avvr95GJVH7PexADw1pZ824mSJZGCRfSIw2YLNpzptxo
	ejb3fzwx7MJoQgQ
X-Received: by 2002:a05:600c:a16:b0:483:64b4:79da with SMTP id 5b1f17b1804b1-483c9bf45fcmr7951125e9.26.1772147081463;
        Thu, 26 Feb 2026 15:04:41 -0800 (PST)
Received: from localhost (2a01cb001331aa002c0b752a8b25831e.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:2c0b:752a:8b25:831e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c35910f1sm65137125e9.2.2026.02.26.15.04.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 15:04:41 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 00:04:40 +0100
Message-Id: <DGP9PLZJ9IIH.1AFCGS6H37VUZ@smile.fr>
Subject: Re: [OE-core][master][PATCH] libseccomp: add diffutils to ptest
 RDEPENDS
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <openembedded-core@lists.openembedded.org>, <nikhil.r@bmwtechworks.in>
X-Mailer: aerc 0.20.0
References: <20260225094114.44082-1-git-patches@bmwtechworks.in>
In-Reply-To: <20260225094114.44082-1-git-patches@bmwtechworks.in>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 23:04:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232068

On Wed Feb 25, 2026 at 10:41 AM CET, Nikhil R via lists.openembedded.org wr=
ote:
> From: Nikhil R <nikhil.r@bmwtechworks.in>
>
> libseccomp ptest needs diff during test execution,
> add diffutils to the runtime ptest deps.
>
> Signed-off-by: Nikhil R <nikhil.r@bmwtechworks.in>
> ---
>  meta/recipes-support/libseccomp/libseccomp_2.5.5.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb b/meta/r=
ecipes-support/libseccomp/libseccomp_2.5.5.bb
> index 478e5f4289..dd253a7826 100644
> --- a/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb
> +++ b/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb

Given the recipe version, this patch is targeted at scarthgap and does
not apply on master.

> @@ -59,4 +59,4 @@ FILES:${PN} =3D "${bindir} ${libdir}/${BPN}.so* ${PYTHO=
N_SITEPACKAGES_DIR}/"
>  FILES:${PN}-dbg +=3D "${libdir}/${PN}/tests/.debug/* ${libdir}/${PN}/too=
ls/.debug"
> =20
>  RDEPENDS:${PN} +=3D "${@bb.utils.contains('PACKAGECONFIG', 'python', 'py=
thon3', '', d)}"
> -RDEPENDS:${PN}-ptest =3D "coreutils bash"
> +RDEPENDS:${PN}-ptest =3D "coreutils bash diffutils"

--=20
Yoann Congal
Smile ECS


