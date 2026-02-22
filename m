Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14667C636B3
	for <webhook@archiver.kernel.org>; Sun, 22 Feb 2026 18:16:50 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18600.1771784205742681449
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Feb 2026 10:16:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ayx8SRwN;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-483abed83b6so6826125e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Feb 2026 10:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771784204; x=1772389004; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HqZw05PrguWo7R7W4oaQwUgOzd3AW14OAzQxlk5vjaE=;
        b=ayx8SRwNHNtajNHbmpAKbmXMXuFAuNWSEcZ9xyVw3MZrQYEhJlJD/K1R4pXrm8miP/
         hYoqP83csUFKZHa3VYN0p535yDhnINfkdqRzddbQ+TEjoqXsqwfVqN7mlOoRuscjQIJz
         bxHgRw4/kHalRL2oHsMAtDWZ6mOyivoGIpIDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771784204; x=1772389004;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HqZw05PrguWo7R7W4oaQwUgOzd3AW14OAzQxlk5vjaE=;
        b=LT+vQxoI3wswcKkfaIds9Qcg+GWN6oNggHfcaRkMGuxJP7wNdKbXLEC/sAUnrZsBxH
         SFXLkKs8CjLtZHCqXZxVHcLUXERcCTUTs6JxR4j199IEwmx6mxW1J7JzqFB3OdvlX8KM
         iMNf5kr2CLUNdTsr8fuPJvt4gDO7veCAUgM8/U1IoYgM7/UH/khO0srgxUHZzHZ232RB
         OyICzMhRjEruIfJ/jqNUJtyvZZjlLZmH4Fqi1aaOC6zFH9JrMjk5CPWhvnaJo+E8sVfv
         BhyftqgTUGcdxryUDNU14uOw6J6pJk2VYpznY/lBjPT5BhBaM7wGnIDmwnW7wMOFsMfp
         OOnw==
X-Forwarded-Encrypted: i=1; AJvYcCXrjQF4Uh4bMOHSU1bAaOHk0wadCzD3+8vKRGHBMkiC1PsxMACkNjVF2Z1xd+T1lVe/1Sb/8qyv5MbPigil3OvKhQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzEmp/wbn2+iQvgT6M9+Gf0oIgoy//olyL9O0yFsIDxxoD2Tr/4
	9S2DhSDpTmzjQ1I7GUC7Ho8N/WPsR6TAzwC30oBDP6kKv9eSLOWD992yMwJhd6NHKDQ=
X-Gm-Gg: AZuq6aLd4aFx3zduVdPbu4LPDz5Jfht9vW3O420u7PUw0rD3hT1egEXA94RS8dldo8V
	zqpnYks7YPaugS4tgqTyjcCafyghWGuwbNhY7TVdV6xTjgceQTSB0zj+tpGdquvHU6pKb0+0YEf
	J0KONnSfmsWQz4/3gF2ZsztDrZSWVuV//y1X1cO1EcrmcANReHqR+Jd15kwGZ05EeqsGhx1+zdA
	P51URPQm1OuSmAGSHLTlsohg7l1+ROzfEqqvjIaC3ugTPrE5Vz9glJrg1tzG4UbqPa7d/FqS/Ja
	GRooELteGMBB2Qfize4IlZPTaJyjcDCAU9Xah47woBQVEaYHnbXI1f0GOvVpRHlQ6/LkR/cchQV
	FUasDM8o8vQxFycwreHptafnKb1V0mCn4qoimtLHXiHFaj3rH3Iu0LH3Bun8G+0zbSUc/sRiBhc
	0c/8s6FkumVfAq9srmnzz2n2S+OdvalDW+5zmNdzcP4/1fxjjK/QNvz4Ot5pTYgwWej4LmbxDJ+
	OebYCi0jG2QCq4=
X-Received: by 2002:a05:600c:608f:b0:480:49ce:42cc with SMTP id 5b1f17b1804b1-483a95bd993mr106943545e9.9.1771784204020;
        Sun, 22 Feb 2026 10:16:44 -0800 (PST)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9b75e51sm138990615e9.5.2026.02.22.10.16.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Feb 2026 10:16:43 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 22 Feb 2026 19:16:43 +0100
Message-Id: <DGLP2YD2E5RG.3PLY6N8MHIF2@smile.fr>
Subject: Re: [OE-core][whinlatter][PATCH] zlib: Fix CVE-2026-27171
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Bruno VERNAY" <bruno.vernay@se.com>
To: <hsimeliere.opensource@witekio.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260220142108.881783-1-hsimeliere.opensource@witekio.com>
In-Reply-To: <20260220142108.881783-1-hsimeliere.opensource@witekio.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Feb 2026 18:16:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231634

Hello,

On Fri Feb 20, 2026 at 3:21 PM CET, Hugo Simeliere via lists.openembedded.o=
rg wrote:
> From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
>

Thanks for the patch. But the commit message needs improvement: Please
add a justification as to why you think this particular patch fixes this
CVE: Cited in the NVD report? upstream? another source?

> Upstream-Status: Backport from https://github.com/madler/zlib/commit/ba82=
9a458576d1ff0f26fc7230c6de816d1f6a77
This marker is not useful outside of a added patch (like your
CVE-2026-27171.patch) : you can remove it.

Obviously, that also applies to the whinlatter patch.

Thanks!

>
> Signed-off-by: Bruno VERNAY <bruno.vernay@se.com>
> Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
> ---
>  .../zlib/zlib/CVE-2026-27171.patch            | 63 +++++++++++++++++++
>  meta/recipes-core/zlib/zlib_1.3.1.bb          |  1 +
>  2 files changed, 64 insertions(+)
>  create mode 100644 meta/recipes-core/zlib/zlib/CVE-2026-27171.patch
>
> diff --git a/meta/recipes-core/zlib/zlib/CVE-2026-27171.patch b/meta/reci=
pes-core/zlib/zlib/CVE-2026-27171.patch
> new file mode 100644
> index 0000000000..e6a8a3eac5
> --- /dev/null
> +++ b/meta/recipes-core/zlib/zlib/CVE-2026-27171.patch
> @@ -0,0 +1,63 @@
> +From f234bdf5c0f94b681312452fcd5e36968221fa04 Mon Sep 17 00:00:00 2001
> +From: Mark Adler <git@madler.net>
> +Date: Sun, 21 Dec 2025 18:17:56 -0800
> +Subject: [PATCH] Check for negative lengths in crc32_combine functions.
> +
> +Though zlib.h says that len2 must be non-negative, this avoids the
> +possibility of an accidental infinite loop.
> +
> +Upstream-Status: Backport [https://github.com/madler/zlib/commit/ba829a4=
58576d1ff0f26fc7230c6de816d1f6a77]
> +CVE: CVE-2026-27171
> +
> +Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
> +---
> + crc32.c | 4 ++++
> + zlib.h  | 4 ++--
> + 2 files changed, 6 insertions(+), 2 deletions(-)
> +
> +diff --git a/crc32.c b/crc32.c
> +index 6c38f5c..33d8c79 100644
> +--- a/crc32.c
> ++++ b/crc32.c
> +@@ -1019,6 +1019,8 @@ unsigned long ZEXPORT crc32(unsigned long crc, con=
st unsigned char FAR *buf,
> +=20
> + /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D */
> + uLong ZEXPORT crc32_combine64(uLong crc1, uLong crc2, z_off64_t len2) {
> ++    if (len2 < 0)
> ++        return 0;
> + #ifdef DYNAMIC_CRC_TABLE
> +     once(&made, make_crc_table);
> + #endif /* DYNAMIC_CRC_TABLE */
> +@@ -1032,6 +1034,8 @@ uLong ZEXPORT crc32_combine(uLong crc1, uLong crc2=
, z_off_t len2) {
> +=20
> + /* =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D */
> + uLong ZEXPORT crc32_combine_gen64(z_off64_t len2) {
> ++    if (len2 < 0)
> ++        return 0;
> + #ifdef DYNAMIC_CRC_TABLE
> +     once(&made, make_crc_table);
> + #endif /* DYNAMIC_CRC_TABLE */
> +diff --git a/zlib.h b/zlib.h
> +index 8d4b932..8c7f8ac 100644
> +--- a/zlib.h
> ++++ b/zlib.h
> +@@ -1758,14 +1758,14 @@ ZEXTERN uLong ZEXPORT crc32_combine(uLong crc1, =
uLong crc2, z_off_t len2);
> +    seq1 and seq2 with lengths len1 and len2, CRC-32 check values were
> +    calculated for each, crc1 and crc2.  crc32_combine() returns the CRC=
-32
> +    check value of seq1 and seq2 concatenated, requiring only crc1, crc2=
, and
> +-   len2. len2 must be non-negative.
> ++   len2. len2 must be non-negative, otherwise zero is returned.
> + */
> +=20
> + /*
> + ZEXTERN uLong ZEXPORT crc32_combine_gen(z_off_t len2);
> +=20
> +      Return the operator corresponding to length len2, to be used with
> +-   crc32_combine_op(). len2 must be non-negative.
> ++   crc32_combine_op(). len2 must be non-negative, otherwise zero is ret=
urned.
> + */
> +=20
> + ZEXTERN uLong ZEXPORT crc32_combine_op(uLong crc1, uLong crc2, uLong op=
);
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-core/zlib/zlib_1.3.1.bb b/meta/recipes-core/zli=
b/zlib_1.3.1.bb
> index ef83142121..892467a1fb 100644
> --- a/meta/recipes-core/zlib/zlib_1.3.1.bb
> +++ b/meta/recipes-core/zlib/zlib_1.3.1.bb
> @@ -10,6 +10,7 @@ LIC_FILES_CHKSUM =3D "file://zlib.h;beginline=3D6;endli=
ne=3D23;md5=3D5377232268e952e9ef6
>  SRC_URI =3D "https://zlib.net/${BP}.tar.gz \
>             file://0001-configure-Pass-LDFLAGS-to-link-tests.patch \
>             file://run-ptest \
> +           file://CVE-2026-27171.patch \
>             "
>  UPSTREAM_CHECK_URI =3D "http://zlib.net/"
> =20


--=20
Yoann Congal
Smile ECS


