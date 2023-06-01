Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1503C77B7A
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 20:01:18 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.2582.1685649669006504123
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 13:01:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=qcmReF1i;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.44, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-9700219be87so180279366b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 13:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685649667; x=1688241667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkwT50mN76rUt4xiQdYjEKi4Zfp177IURreHC9SBPmw=;
        b=qcmReF1iBljbCsvXcWxpXvI92Rb817S1ObTsvs53sUZKARTc/xFzucR6ZXRrUelbgW
         DMB4O1/Vumh+X2t4GNkdu7RUPS7JYNhK/56ymSwdViIFCXJn4b4NNu1n98o7M5mmF+sC
         bJ7oKHHXZUfRol1D3q1A5k/z3TMmNXddzT8975Mu5hByifGWvzQif6aOclaz6fiMMIrU
         a3swta1JUTbk1xCjBxzcK+hg30xNzvjAVttEC/dywai+dFaIgK9w/kXSPQjTPDVvNbBx
         LxMOQBtzFBIqBMkUstHcGn/wobUnWI68eggNUxuUr6frLduOD7w2Stmb/KyvgSyeUUl8
         KcnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685649667; x=1688241667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tkwT50mN76rUt4xiQdYjEKi4Zfp177IURreHC9SBPmw=;
        b=fdQOzuSwY/VDFBREFACZRkMAVOn4KW5UL6R3JGJUqU1I3hkCa0Z/TOFDnptyooU0Pj
         3DVEsmgKORVDY3PW+kKd8+Ki6OPw4S5BOkVJRegoen3Co9GlIwaMaQe07uhxM3JlqQoD
         2bCyORl5sF4IQNbF0Jeg12J8c/Ymxt/aiRRTAMkCvZxklDyE2dSQpYI11aXOxwfXXANP
         l18pb6QY7PHaiJkEg4lb/rMXYm84KzMdeAf2AXhEfKbjogyBfSlpMiu0sa+WS+z2iZlF
         FdlGiWqMNXeyV5uKLqcLsohE47EGQgLiLODlgUhsCkT5kSQh3iUUalrnceR9TiGnmlxZ
         SBHQ==
X-Gm-Message-State: AC+VfDxi6ByOU+i9gWHpDQbvqKb3SFbHasV6SSP4Ik/VGdV8ZdWbEcYw
	0U5DEy2pySYhRNdd2G0r5OHpV1K5f8Ma9zenHBxfTw==
X-Google-Smtp-Source: ACHHUZ4J6M6GGApjBD4/WGPZbMFD5TRUerq/XOOhGjhT249hMaTimc5ymD45U3W+FRcIvA7tmKmhgdoz12lbvdlaADQ=
X-Received: by 2002:a17:907:62a1:b0:974:1c98:d38e with SMTP id
 nd33-20020a17090762a100b009741c98d38emr8954550ejc.2.1685649666894; Thu, 01
 Jun 2023 13:01:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230601195149.3558777-1-nat.bailey@windriver.com>
In-Reply-To: <20230601195149.3558777-1-nat.bailey@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 1 Jun 2023 10:00:56 -1000
Message-ID: <CAOSpxdZxphE1pgvASVoQOS2ZiAYJ-fqLAkZhqxwDSaPd1yg1MA@mail.gmail.com>
Subject: Re: [oe-core][mickledore][PATCH] tiff: backport a fix for CVE-2023-2731
To: nat.bailey@windriver.com
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 20:01:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182119

Hi Nat,

Thanks for the patch, just one comment - see below.

On Thu, Jun 1, 2023 at 9:58=E2=80=AFAM Nat Bailey via lists.openembedded.or=
g
<nat.bailey=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Natasha Bailey <nat.bailey@windriver.com>
>
> This patch fixes an issue in libtiff's LZWDecode function which could cau=
se a null pointer dereference.
>
> Signed-off-by: Natasha Bailey <nat.bailey@windriver.com>
> ---
>  .../libtiff/files/CVE-2023-2731.patch         | 39 +++++++++++++++++++
>  meta/recipes-multimedia/libtiff/tiff_4.5.0.bb |  4 +-
>  2 files changed, 42 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-2731.p=
atch
>
> diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-2731.patch b/=
meta/recipes-multimedia/libtiff/files/CVE-2023-2731.patch
> new file mode 100644
> index 0000000000..7db0a35f72
> --- /dev/null
> +++ b/meta/recipes-multimedia/libtiff/files/CVE-2023-2731.patch
> @@ -0,0 +1,39 @@
> +From 9be22b639ea69e102d3847dca4c53ef025e9527b Mon Sep 17 00:00:00 2001
> +From: Even Rouault <even.rouault@spatialys.com>
> +Date: Sat, 29 Apr 2023 12:20:46 +0200
> +Subject: [PATCH] LZWDecode(): avoid crash when trying to read again from=
 a
> + strip whith a missing end-of-information marker (fixes #548)
> +
> +CVE: CVE-2023-2731
> +Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/9=
be22b639ea69e102d3847dca4c53ef025e9527b]

You should also add your Signed-off-by here in the patch file too.

Regards,

Steve

> +
> +---
> + libtiff/tif_lzw.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/libtiff/tif_lzw.c b/libtiff/tif_lzw.c
> +index ba75a07e..d631fa10 100644
> +--- a/libtiff/tif_lzw.c
> ++++ b/libtiff/tif_lzw.c
> +@@ -423,6 +423,10 @@ static int LZWDecode(TIFF *tif, uint8_t *op0, tmsiz=
e_t occ0, uint16_t s)
> +
> +     if (sp->read_error)
> +     {
> ++        TIFFErrorExtR(tif, module,
> ++                      "LZWDecode: Scanline %" PRIu32 " cannot be read d=
ue to "
> ++                      "previous error",
> ++                      tif->tif_row);
> +         return 0;
> +     }
> +
> +@@ -742,6 +746,7 @@ after_loop:
> +     return (1);
> +
> + no_eoi:
> ++    sp->read_error =3D 1;
> +     TIFFErrorExtR(tif, module,
> +                   "LZWDecode: Strip %" PRIu32 " not terminated with EOI=
 code",
> +                   tif->tif_curstrip);
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb b/meta/recipes=
-multimedia/libtiff/tiff_4.5.0.bb
> index f8a2482a84..ce371a15f9 100644
> --- a/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb
> +++ b/meta/recipes-multimedia/libtiff/tiff_4.5.0.bb
> @@ -9,7 +9,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3Da3e32d664d6=
db1386b4689c8121531c3"
>  CVE_PRODUCT =3D "libtiff"
>
>  SRC_URI =3D "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
> -           file://CVE-2022-48281.patch"
> +           file://CVE-2022-48281.patch \
> +           file://CVE-2023-2731.patch \
> +           "
>
>  SRC_URI[sha256sum] =3D "c7a1d9296649233979fa3eacffef3fa024d73d05d589cb62=
2727b5b08c423464"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#182118): https://lists.openembedded.org/g/openembedde=
d-core/message/182118
> Mute This Topic: https://lists.openembedded.org/mt/99272816/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

