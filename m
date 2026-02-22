Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC4BC636B6
	for <webhook@archiver.kernel.org>; Sun, 22 Feb 2026 18:21:50 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18697.1771784506605441704
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Feb 2026 10:21:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XfAXn6wU;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-483abed83b6so6842105e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Feb 2026 10:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771784505; x=1772389305; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=haD+yzqFdSVRcMyzFYC2x36c1/Evy4GCiOx7ItHqPQw=;
        b=XfAXn6wUfOZN4xwUVvT6v/2XdoMZHhuwpQqxq+/5FKNQcO+5sbPlcT39t3HMHZ0Abx
         udVNr0WCivv3xbINtPE1jmEbOfxmaPjtzjtjn2F/ui7Pb54cKklAe6z9R+gGMaKzrZwF
         imr6iZksoae/jeyamGBRISA+KPzTgG7dci72Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771784505; x=1772389305;
        h=in-reply-to:references:subject:to:cc:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=haD+yzqFdSVRcMyzFYC2x36c1/Evy4GCiOx7ItHqPQw=;
        b=Cg2YcgzhIE2UawosiXTK3Y2+AgKQ55QkaBkwjwnyCBtrntZXaFN8bGwfWjfNgHsJKl
         UqofQaxyWMgBe6MU4VJ9MjDl/6DXKtYL2gr+j5yIuAz2Odwe01sQeD0istfi0h22M6Mu
         bMO7YuNCBkEJUpWRBbL9ewQiBCvEk9YPLrxNB+1ivDPrRfHA4+JeAgY+ScbJiPMuTgFh
         Nw2BiVzhAr64ApbOJw6dwc2UjKar1cmHKBz5JjaMONeuFJ91UBYCxoTq8kjUysG4Cqwa
         57BSk5OumdVrvKcLLdqURTC1tqufkmQJPewDYTV0mEFrFOgDBm3M4OP+8kAnZWlyQRYb
         1RKw==
X-Forwarded-Encrypted: i=1; AJvYcCXyBFnZg+qlFxLXh+AR7l82a0neS8WXwA3vxTycn6oJrYBdQ8+kCyynYLgMd4zsrzW7mvX6Jm1ErZ3zsnXSBpH3+w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzwfncBKceYIdNFqFojHszi4tmGx8wu6zzP8Dvho7tIk7Qnty8L
	22eSVK1uOnnfEMHnegRiQ0SkwiqJcqQMrIy/3a6CV6N5s689oqJhLWkA7MTswK8R8S/zpgjvb1s
	WQnb4
X-Gm-Gg: AZuq6aLIiG9zUhUGnKby9Re/WHhY9Q74diqKYSq2JZrU0x/zDyoTu0rFkB0mru/S5w6
	OUvSXMZzSgu6E5GZlmdP7V+a/wsAelekyNrNvsmMGfz8Ys6IJEEMk5cSFTekX8rBRqZ5JnnZ354
	rLYSwQ6kkk/FjLUx2KH5MwLvo6JIwiNDKYf/n0/4/qegJxykMkO4am3MQlXBZamYaI22YGgkmQ3
	BWQQt8ilHGl/gmCGzPmliotkC9GLm5tH4RI66cpdyTWdRsz3rX2qXYK1f0tbreuJIe7K5HNin4i
	8ZWF3qV+PSHpiFOf3Qn4e2Wdnaj3apz0YYsmSRdwszStL1FPfB4fyzAEGhjIs6OK5p3Jv4ahkKr
	aFau44NkNZ7pcf4NO0B0ZNFGYD/opgwOUi3CddkRAPrYGJXYEavAtqpefqC3nMM/+1eYqSPFpSg
	Eh/0zIY83wPxKWM2cCYfbm8T4SjyK3Ufcdch+4fdp3QqLe0edyXYiflJ7FLUvhEmJxZq27w+1jp
	SJ35tZ+1JNS18g=
X-Received: by 2002:a05:600c:4f94:b0:480:4a4f:c36f with SMTP id 5b1f17b1804b1-483a95e2488mr95596475e9.21.1771784504956;
        Sun, 22 Feb 2026 10:21:44 -0800 (PST)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31b3d88sm231664225e9.3.2026.02.22.10.21.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Feb 2026 10:21:44 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Feb 2026 19:21:44 +0100
Message-Id: <DGLP6SO77QVS.1GNBROBCZWMAM@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Bruno VERNAY" <bruno.vernay@se.com>
To: <hsimeliere.opensource@witekio.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][whinlatter][PATCH] harfbuzz: Fix CVE-2026-22693
X-Mailer: aerc 0.20.0
References: <20260220143449.888520-1-hsimeliere.opensource@witekio.com>
In-Reply-To: <20260220143449.888520-1-hsimeliere.opensource@witekio.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Feb 2026 18:21:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231635

On Fri Feb 20, 2026 at 3:34 PM CET, Hugo Simeliere via lists.openembedded.o=
rg wrote:
> From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
>
> Upstream-Status: Backport from https://github.com/harfbuzz/harfbuzz/commi=
t/1265ff8d990284f04d8768f35b0e20ae5f60daae

Hello,

Same remarks as your recent zlib CVE patch.

Thanks!

>
> Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
> Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
> ---
>  .../harfbuzz/files/CVE-2026-22693.patch       | 33 +++++++++++++++++++
>  .../harfbuzz/harfbuzz_11.4.5.bb               |  4 ++-
>  2 files changed, 36 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-graphics/harfbuzz/files/CVE-2026-22693.p=
atch
>
> diff --git a/meta/recipes-graphics/harfbuzz/files/CVE-2026-22693.patch b/=
meta/recipes-graphics/harfbuzz/files/CVE-2026-22693.patch
> new file mode 100644
> index 0000000000..bf821bb63a
> --- /dev/null
> +++ b/meta/recipes-graphics/harfbuzz/files/CVE-2026-22693.patch
> @@ -0,0 +1,33 @@
> +From 21c880d1154a5bcef2ef68c1687d286820a274ee Mon Sep 17 00:00:00 2001
> +From: Behdad Esfahbod <behdad@behdad.org>
> +Date: Fri, 9 Jan 2026 04:54:42 -0700
> +Subject: [PATCH] [cmap] malloc fail test (#5710)
> +
> +Fixes https://github.com/harfbuzz/harfbuzz/security/advisories/GHSA-xvjr=
-f2r9-c7ww
> +
> +Upstream-Status: Backport [https://github.com/harfbuzz/harfbuzz/commit/1=
265ff8d990284f04d8768f35b0e20ae5f60daae]
> +CVE: CVE-2026-22693
> +
> +Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
> +---
> + src/hb-ot-cmap-table.hh | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/src/hb-ot-cmap-table.hh b/src/hb-ot-cmap-table.hh
> +index 294b2b60d..95a436b54 100644
> +--- a/src/hb-ot-cmap-table.hh
> ++++ b/src/hb-ot-cmap-table.hh
> +@@ -1679,6 +1679,10 @@ struct SubtableUnicodesCache {
> +   {
> +     SubtableUnicodesCache* cache =3D
> +         (SubtableUnicodesCache*) hb_malloc (sizeof(SubtableUnicodesCach=
e));
> ++
> ++    if (unlikely (!cache))
> ++      return nullptr;
> ++
> +     new (cache) SubtableUnicodesCache (source_table);
> +     return cache;
> +   }
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb b/meta/rec=
ipes-graphics/harfbuzz/harfbuzz_11.4.5.bb
> index 9e0e42b717..2364dd7efd 100644
> --- a/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb
> +++ b/meta/recipes-graphics/harfbuzz/harfbuzz_11.4.5.bb
> @@ -8,7 +8,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db98429b8e8e3c2=
a67cfef01e99e4893d \
>                      file://src/hb-ucd.cc;beginline=3D1;endline=3D15;md5=
=3D29d4dcb6410429195df67efe3382d8bc \
>                      "
> =20
> -SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
> +SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz \
> +           file://CVE-2026-22693.patch \
> +           "
>  SRC_URI[sha256sum] =3D "0f052eb4ab01d8bae98ba971c954becb32be57d7250f18af=
343b1d27892e03fa"
> =20
>  DEPENDS +=3D "glib-2.0-native"


--=20
Yoann Congal
Smile ECS


