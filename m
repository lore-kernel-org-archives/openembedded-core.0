Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4798DC624A0
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 21:24:44 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2458.1771709077438711842
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Feb 2026 13:24:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=EwQHCs8s;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-436309f1ad7so2278678f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 13:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771709076; x=1772313876; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbYL8faU4BenVaTligNaKuEcwjImyCZrj+x3LkWGv/w=;
        b=EwQHCs8s+0r21bILVblTGDBgvtUJ6nfkUOKNDxftD9LF94fF+umu+GDQlnnKdzsuaK
         T+r/5LSpSpaLw1eEg4XrZN4DQ0iyr5y7gnCVF6kPqcx5Rja+xSXT0LU5+UUcr7JtK354
         lK3tIO/7q56ykJS/NqxaH5E6O5nZbq4cjGnq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771709076; x=1772313876;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fbYL8faU4BenVaTligNaKuEcwjImyCZrj+x3LkWGv/w=;
        b=gpPrdStFP7BzYUDsoaDhsL+njOCxl3Hw6dVpc51pABPzeHw1K2/Z7qtBMgF7Wd0utQ
         bjwL0JEzLmow5kYkQsclD68a2t/Mm0b1ThFH4dsK8bvHCuAmyt5svJTEEZVFbiP8uCHH
         j6vLlYpZ0Lqv4rjmmwjjRBrN1Jn3Yc8cfGiUOIBtojZahgVjJDa7bYjjZ7vB/Xv/Utw0
         rGzT2QcbQITpRYyI8KinjkEqiTMITT0ZPefupaPR+NEC+I9+U2BaFGEpqtUZp7sJa6g4
         4qjLy3mSxH+LOKj2iCL+SPRUexXCaWa9X4dxel8FCSmb85/CYBrH2Bw0ndt1MbXeJgon
         evdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoqmIozMztRLS6MJqzH5aT9oNVeYZZSXOW/Vn55OmLQDw3Z1Q4jjdNjxMxNzy69ZBVEOAFtDmKtcSm43ERYYWxSg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YywE20CqhXUHwt0zXvCjYJUWM6lBAFhBRaVrq5ZOmu3EBxNqRC8
	2ezQc5UOSjgW3vuMe5T+ONF6SRcrlV50kUWFwAZJU2230Na2u7rjhtq4cEtbxvVe7wY=
X-Gm-Gg: AZuq6aIe7iyh1XKGI6LjPy6V/I2Jbj7AGKJF4pZ3WM7ECSNM4U04jpV/5mFaFDiq3PX
	2f3aKywDiOkB5nB1LmipDg5eVJY2HWQ4cutHi7TX4aU72znHu3pN1E3Qx2gdndXxtFvlYXTXjde
	LXkM/uhY4jki7/kGn2EuMATWpfr3+sXW/OfdGDmLgXoyKGgBiHz7Y/hiDZm3DfGMi78O4UraHfT
	vbWn4+cELW4THmuVSVp6FCNritaolKJ2JrcUHQ80h4e0ShI+vDjz1dFsgcTxtSRO+2MIeX1o83m
	lcYSkJ1EVf6/N3AKLGVX02H1zp7oegwt4nxFT3dsrZbeXZDG/3daGtY8185xfjrukZwXxAttmxL
	DmH9Bq48r89ME81IIcwnhfNwXRz3vzKJz7+V6rzPr3ZZmEnZIjb3+GdafqNNVg4J9fyN8hSyL+C
	LsQ4t5UDqxC/tBnnq1BwMMUKh5oHdR46lFs0/+ZDugAS2SeGEoNYUBwbf6MFKp3KA3D5g8momdB
	MMnv2kuO4HT66A=
X-Received: by 2002:a05:6000:428a:b0:437:6b2e:a279 with SMTP id ffacd0b85a97d-4396f156119mr8643447f8f.10.1771709075652;
        Sat, 21 Feb 2026 13:24:35 -0800 (PST)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d54a73sm8230243f8f.37.2026.02.21.13.24.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Feb 2026 13:24:35 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Feb 2026 22:24:34 +0100
Message-Id: <DGKYG8RFAYEQ.N3XNBPSXB9PK@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH] gdk-pixbuf: Fix CVE-2025-6199
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <careers.myinfo@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260211083556.102891-1-moins@kpit.com>
In-Reply-To: <20260211083556.102891-1-moins@kpit.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 21:24:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231622

Hello,

On Wed Feb 11, 2026 at 9:35 AM CET, Shaik Moin via lists.openembedded.org w=
rote:
> CVE: CVE-2025-6199
> Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/co=
mmit/c4986342b241cdc075259565f3fa7a7597d32a32.patch]
>
> Backport the fix for CVE-2025-6199
> Add below patch to fix
> 0001-gdk-pixbuf-Add-support-patch-to-fix-CVE-2025-6199.patch

Thank you for the patch but it needs improvements:
* The commit message body should not have "CVE:" and "Upstream-Status:"
  those are for patches.
* The commit message should justify why you import this particular
  patch. Is it the patch cited by the NVD report? another source?

> Signed-off-by: Shaik Moin <moins@kpit.com>
> ---
>  ...d-support-patch-to-fix-CVE-2025-6199.patch | 36 +++++++++++++++++++
>  .../gdk-pixbuf/gdk-pixbuf_2.42.12.bb          |  1 +
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-gdk-pix=
buf-Add-support-patch-to-fix-CVE-2025-6199.patch
>
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-gdk-pixbuf-Add=
-support-patch-to-fix-CVE-2025-6199.patch b/meta/recipes-gnome/gdk-pixbuf/g=
dk-pixbuf/0001-gdk-pixbuf-Add-support-patch-to-fix-CVE-2025-6199.patch
> new file mode 100644
> index 0000000000..aa8bfec8f4
> --- /dev/null
> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-gdk-pixbuf-Add-suppor=
t-patch-to-fix-CVE-2025-6199.patch
> @@ -0,0 +1,36 @@
> +From 140200be0b4d5355aab76a6fd474e17d117045ca Mon Sep 17 00:00:00 2001
> +From: lumi <lumi@suwi.moe>
> +Date: Sat, 7 Jun 2025 22:27:06 +0200
> +Subject: [PATCH] lzw: Fix reporting of bytes written in decoder
> +
> +When the LZW decoder encounters an invalid code, it stops
> +processing the image and returns the whole buffer size.
> +It should return the amount of bytes written, instead.
> +
> +Fixes #257
> +
> +CVE: CVE-2025-6199
> +
> +Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/c=
ommit/c4986342b241cdc075259565f3fa7a7597d32a32.patch]

I'd rather have the simpler link
https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/c4986342b241cdc075259565=
f3fa7a7597d32a32
(without the .patch extension): it makes checking if the patch is in a
branch really easy.

> +
> +Signed-off-by: Shaik Moin <moins@kpit.com>
> +---
> + gdk-pixbuf/lzw.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/gdk-pixbuf/lzw.c b/gdk-pixbuf/lzw.c
> +index 15293560b..4f3dd8beb 100644
> +--- a/gdk-pixbuf/lzw.c
> ++++ b/gdk-pixbuf/lzw.c
> +@@ -208,7 +208,7 @@ lzw_decoder_feed (LZWDecoder *self,
> +                                 /* Invalid code received - just stop he=
re */
> +                                 if (self->code >=3D self->code_table_si=
ze) {
> +                                         self->last_code =3D self->eoi_c=
ode;
> +-                                        return output_length;
> ++                                        return n_written;
> +                                 }
> +=20
> +                                 /* Convert codeword into indexes */
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb b/meta/r=
ecipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
> index ff1c7a1fb2..8579614bb1 100644
> --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
> +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
> @@ -21,6 +21,7 @@ SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-$=
{PV}.tar.xz \
>             file://fatal-loader.patch \
>             file://0001-meson.build-allow-a-subset-of-tests-in-cross-comp=
ile.patch \
>             file://CVE-2025-7345.patch \
> +           file://0001-gdk-pixbuf-Add-support-patch-to-fix-CVE-2025-6199=
.patch \

Can you please name this patch "CVE-2025-6199.patch" to follow
conventions?

Also, this CVE impacts whinlatter, please send a patch for whinlatter.

Thanks!

>             "
> =20
>  SRC_URI[sha256sum] =3D "b9505b3445b9a7e48ced34760c3bcb73e966df3ac94c95a1=
48cb669ab748e3c7"


--=20
Yoann Congal
Smile ECS


