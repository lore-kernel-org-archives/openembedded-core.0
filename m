Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E2B3C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 03:04:39 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web09.23005.1658113469890615256
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 20:04:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Nw0hhsDY;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.54,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f54.google.com with SMTP id w12so13482253edd.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 20:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AzbgBrkxKmSnKmkStx+U4RA5hELdLJMPQ+LJ3rdXwVY=;
        b=Nw0hhsDY2hRlJIz1+DrPbhmZ61Nj2ke8z3M7LoUN1KklUlwb4F1VIBmxvS0n+82A0l
         0+ZYqIUC5rmiuh6K/oK0BWNzndTzxcHh+uzRrgiqfMW2wo47k/ciZSywLdklQEEEZm3B
         I0ZxIHpzV6EWXDA6w2Rr8Dz2tXynYx1Zqh0thmZu9uSwtdUek4LG1CmI15ae0my0ZCLt
         +XE0DTPHSlY1/1CuCuI/IQDWKdic0UpgAThfcJUazOkqrm8fJDrCy0d79MXBdnItpjZO
         J8iCXPDhPYHYPfCME3frUXbLKQM8sjpolXev8/JAI63IDU/IlCOv+JrDyldF/b+o61+B
         dDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AzbgBrkxKmSnKmkStx+U4RA5hELdLJMPQ+LJ3rdXwVY=;
        b=b7yyMr2IXyTiIgxQ6AMbNbekEMWV254DksmWIc3h5/aqWOIu9+coNWJ2pARx1VTLMM
         aIbWDrRJRJj2kgrVaUUZIh9g12NohFNP3MLsbemthW8UWTKUYvrRWbebMX+tW/d60KEp
         lkEWU1ChSaRO7XF+jHKihTbR25+hq/4L5LG2JrhPWfb2k+MVcJEMotX/vRmTVUj89AMh
         jvrOTLv0y7OnkK71sPd+7E7LSa35SZI6goy8gN2E8oN5veYT1gBuwCjlB1F9EvPiM8fb
         mMAMcck2Kx20oDDkYk22euJuatLnVslHZAd4N9BqUPea1c6ZgYqFonVLj9O2rpUHsjKh
         jnFQ==
X-Gm-Message-State: AJIora/ynxt/NQcesLZ2nlnzP6j0nWs/nLDsLMf/sVeG2ycWV3/3LAQZ
	IN8g1xGJ5QUMrvupQNIkiFUcBNyHnqhNTwNm8fG42w==
X-Google-Smtp-Source: 
 AGRyM1s5DOaFH/UyWTEHiMBQ1rfmmNUIsK3wEqI4jtdA1nnDtjlXpBUi+RvlV8ZFLjxgh8Sr0sudCI1T8d30w3JRfIk=
X-Received: by 2002:a05:6402:3219:b0:43b:6f3:8ccb with SMTP id
 g25-20020a056402321900b0043b06f38ccbmr34708005eda.345.1658113467957; Sun, 17
 Jul 2022 20:04:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220717200717.16540-1-pavel@zhukoff.net>
In-Reply-To: <20220717200717.16540-1-pavel@zhukoff.net>
From: Steve Sakoman <steve@sakoman.com>
Date: Sun, 17 Jul 2022 17:04:16 -1000
Message-ID: 
 <CAOSpxdY5D8tc9RY7o50PrjAPy1zLeeUOvS1Y9z9vRpuuNJ0iAA@mail.gmail.com>
Subject: Re: [kirkstone][PATCH] harfbuzz: Fix compilation with clang
To: Pavel Zhukov <pavel@zhukoff.net>
Cc: openembedded-core@lists.openembedded.org,
	Pavel Zhukov <pavel.zhukov@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 03:04:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168191

On Sun, Jul 17, 2022 at 10:09 AM Pavel Zhukov <pavel@zhukoff.net> wrote:
>
> Fixup commit for prevous CVE-2022-33068 fix.
>
> Fixes:
> | In file included from ../harfbuzz-4.0.1/src/hb-ot-face.cc:39:
> 4429| ../harfbuzz-4.0.1/src/hb-ot-color-sbix-table.hh:301:11: error: use of bitwise '|' with boolean operands [-Werror,-Wbitwise-instead-of-logical]
> 4430|       if (png.IHDR.height >= 65536 | png.IHDR.width >= 65536)
> 4431|           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 4432|                                    ||
> 4433| ../harfbuzz-4.0.1/src/hb-ot-color-sbix-table.hh:301:11: note: cast one or both operands to int to silence this warning
> 4434| 1 error generated.
>
> Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
> ---
>  .../harfbuzz/0001-Fix-conditional.patch       | 25 +++++++++++++++++++
>  .../harfbuzz/harfbuzz_4.0.1.bb                |  3 ++-
>  2 files changed, 27 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/0001-Fix-conditional.patch
>
> diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Fix-conditional.patch b/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Fix-conditional.patch
> new file mode 100644
> index 0000000000..0f9b86973b
> --- /dev/null
> +++ b/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Fix-conditional.patch
> @@ -0,0 +1,25 @@
> +From e421613e8f825508afa9a0b54d33085557c37441 Mon Sep 17 00:00:00 2001
> +From: Behdad Esfahbod <behdad@behdad.org>
> +Date: Wed, 1 Jun 2022 09:07:57 -0600
> +Subject: [PATCH] [sbix] Fix conditional
> +
> +Signed-off: Pavel Zhukov <pavel.zhukov@huawei.com>
> +Upstream-Status: Backport [e421613e8f825508afa9a0b54d33085557c37441]
> +
> +---
> + src/hb-ot-color-sbix-table.hh | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/hb-ot-color-sbix-table.hh b/src/hb-ot-color-sbix-table.hh
> +index 6efae43cda..d0e2235fb2 100644
> +--- a/src/hb-ot-color-sbix-table.hh
> ++++ b/src/hb-ot-color-sbix-table.hh
> +@@ -298,7 +298,7 @@ struct sbix
> +
> +       const PNGHeader &png = *blob->as<PNGHeader>();
> +
> +-      if (png.IHDR.height >= 65536 | png.IHDR.width >= 65536)
> ++      if (png.IHDR.height >= 65536 || png.IHDR.width >= 65536)
> +       {
> +       hb_blob_destroy (blob);
> +       return false;
> diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
> index 81518a53ea..e18727bcfc 100644
> --- a/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
> +++ b/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
> @@ -12,7 +12,8 @@ UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
>  UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
>
>  SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz\
> -           file://CVE-2022-33068.patch"
> +           file://CVE-2022-33068.patch
missing \ here ---------------------------------^

No need to resubmit, I've fixed it.

Thanks for the patch!

Steve

> +           file://0001-Fix-conditional.patch"
>  SRC_URI[sha256sum] = "98f68777272db6cd7a3d5152bac75083cd52a26176d87bc04c8b3929d33bce49"
>
>  inherit meson pkgconfig lib_package gtk-doc gobject-introspection
> --
> 2.35.1
>

