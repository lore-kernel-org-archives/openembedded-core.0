Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D95CCA5FD4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 14:54:52 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14218.1790952887932260113
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 07:54:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2pHPKIRm;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so1136215e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 07:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790952886; x=1791557686; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/M/cEL108E3IxtpwopAl9zGdrodYGJjpFCwVi8Lhlp8=;
        b=2pHPKIRm9XlV+nB926SoRpHxD1Can5TOs5D9rXwTR3QMR1OuxF2eY+Zl8Azh+fCF5O
         +NhvfE1WNuq1BsQOoV3N0M2ItOCxDnURNFCcji9g27GtsxMxphiAKG29D/S3SCbGZJk0
         cqow3Yr0NUvZmlYI5agiaEdkAujVMSicbwvfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790952886; x=1791557686;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/M/cEL108E3IxtpwopAl9zGdrodYGJjpFCwVi8Lhlp8=;
        b=Tf60s8PF2QDBBlVe73izhcNRZgowfD7fI5Tl/SggQfBTtLu6HLKR5qbtODGPs9E5GO
         7ofxioSNEVGnn67NEQeYFX88Ym1qWl4q9aY19Ysq00Mu0bhz3+p+zfUjOuMgPCpSIkXg
         +FBdMoGbMo1Z+dYiwQgRYkj6nfI6QlTv6jDdBhee3OH1i+u8DWoLGk3fHwuhb9fof57a
         0BCTV0OgoFb1I3TLl2Fywsw/cawgELZ+OP6o5js9JJ2sKp6D8+ayOkqFTHJByl/jvcei
         4B0t6IpXQFbIej42I/FnZInTeyX1BfSVGwMk234nLsXYCd7z2dJ11v/PfttOHx12x4PY
         2KYA==
X-Forwarded-Encrypted: i=1; AKwUvBz8Q5aB0TJYd8FJITVZIBUaqhUtGsVGG81NWw4wz6rURsKGbE+EHlK9EjcERrvNJr7S3tx0hM1hK5VdJZ8QvKUI4A==@lists.openembedded.org
X-Gm-Message-State: AFuF++nw79OcM8qREvlSC8jOW+P2ZqB/zOJ99oe9cZc0YtJ/thWYi5Nn
	h9gHUgmzY82nQqxijhPAzeba+RKwlo7XM3W3dl/P2Nyqx4fGDpv4s3135jYG9PO957wf4vrS2tU
	JYewCUZg=
X-Gm-Gg: AYBFou04JNKDc70alVuvoR6fr2G8Z44fo2JYcQ97RpQUv8yT4kwJ/E2+YCBgBNfanAa
	3WGvU32YdxRnodwDCWixguqtNkc6w3UvV7vLo68xbnjmKOc/g3saJ9xQzRh6KAN8AOPcn/uVwvK
	Kw42Qwk2M0CaPiocjhmDJ/p8CH1P3ajiBlALjH3JV3EqOVSmrYnH+qQ/3KfAtfpwy3agk90phwE
	FNhI3tvnamNO20p5X53Si71sbsSz2kAVFqR53WfrO/+itrTxJa5GNL0Lgg1HYXkPf3EC4GpOqKn
	hKzPbpJM2fzhYi0GzoEvo7UTwCZxUX/u7yhrQVNtjfxG8T1g1ucgyM0pycQ1AhFVc+b6btAd/Nr
	HNdgylmem/E4LC8WQ/GaOph0GuiyPMYEbxdDyTu/ldy3xvAbsCR3XRSzMNTack0baBTJpWcuH5m
	Ctp0MwRZvM5+sO+cWz6F2ehNbOwEp5r4P8Tr+QwVaLb6okgZEgaAABmQ2s7V8paTqCbJbowJFAf
	zzTb0WPryCmZKNPMgD1+1cPpzmnEFAM8Havw31o5QBvpYUzd8wQveH+UCHjZ9xbh1EKtJiYzQ==
X-Received: by 2002:a05:600c:c084:b0:4a0:2835:6fd3 with SMTP id 5b1f17b1804b1-4a028357000mr39127065e9.17.1790952886142;
        Fri, 02 Oct 2026 07:54:46 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff20831sm49087785e9.4.2026.10.02.07.54.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 07:54:45 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 16:54:45 +0200
Message-Id: <DLUFT99SIVFB.3NZ1KLVFAD7EP@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 3/8] libxml2: mark CVE-2026-86139
 fixed
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>
To: <hthakar@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260929041836.2217090-1-hthakar@cisco.com>
 <20260929041836.2217090-3-hthakar@cisco.com>
In-Reply-To: <20260929041836.2217090-3-hthakar@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 14:54:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247127

On Tue Sep 29, 2026 at 6:18 AM CEST, Hetvi Thakar -X (hthakar - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> The fix for CVE-2026-86139 adds a zero-length guard in
> xmlURIEscapeStr, as shown in the upstream commit [1].
>
> The libxml2 2.12.10 source already contains the equivalent guard,
> so no additional patch is required. Mark the CVE as fixed in the
> recipe.

Can you provide a link to the function so this can be quickly verified?

>
> [1] https://github.com/GNOME/libxml2/commit/8edbbdb09f24d26a2f900141fddc2=
b9d014f53b0
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-86139
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> ---
>  meta/recipes-core/libxml/libxml2_2.12.10.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-c=
ore/libxml/libxml2_2.12.10.bb
> index 28ae601118..93b7a23754 100644
> --- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
> @@ -46,6 +46,10 @@ CVE_STATUS[CVE-2023-45322] =3D "disputed: issue requir=
es memory allocation to fail
>  # https://gitlab.gnome.org/GNOME/libxml2/-/issues/958
>  CVE_STATUS[CVE-2025-8732] =3D "disputed: the code maintainer explains, t=
hat the issue can only be triggered with untrusted SGML catalogs and it mak=
es absolutely no sense to use untrusted catalogs. The issue triggers a cras=
h if an invalid file is provided.  https://gitlab.gnome.org/GNOME/libxml2/-=
/issues/958"
> =20
> +# The Scarthgap 2.12.10 source already contains the equivalent zero-leng=
th
> +# guard required for the xmlURIEscapeStr integer-overflow issue.
> +CVE_STATUS[CVE-2026-86139] =3D "fixed-version: xmlURIEscapeStr returns N=
ULL when xmlStrlen returns zero"
> +
>  BINCONFIG =3D "${bindir}/xml2-config"
> =20
>  PACKAGECONFIG ??=3D "python \

Thanks!
--=20
Yoann Congal
Smile ECS


