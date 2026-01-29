Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06E78D61009
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 11:26:47 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12702.1769686002434368513
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 03:26:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EQ5Ih8Xx;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8c0f13e4424so108772085a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 03:26:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769686001; cv=none;
        d=google.com; s=arc-20240605;
        b=LrKDjBajv2ITldSJDrAAlGODq9cDsm/s9KMzlDUA9Bi0toBxLfVUrWHHP8DfEpHgmi
         PNJ555H1uX+jGCak6+1MJVdHBTb2dwvUqPCHwat/pBmHI9WbC3ug9fU8zeuu5+OvSYPR
         xuIZryNt+GiFC5VXwAdfsZ8L85q6bOA99OlfZnkxzcEG0E80mFNjTdI2BUv7s1NmObH4
         w05HVfYYCMMC8nYZrsIOqUE4SQL6Jw/CnAP9n8+0yC4YA0vGzNzFrL+MH1Ah8TFahTUz
         WVpHMmz/+07cz0PhtoNwFCO6Gi8eavsMbuEhjHietfRP7SWuhWk9+GwQNouolRT5r41y
         MW3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q1wGT9d84hwaCcWFcB97ONdHeFj8/ZzaRqWslcbVPFQ=;
        fh=QG0/1kl/iNDCWfShgAIKRpbEE7JIBRGbrVXnRZODZk4=;
        b=X2sKTI91Irad4fwp2dZ4xu2EK+a75dfS9fhU0IPknC0JPrKto9+m/jOKhCuxZIb3Uw
         oXeu60MSDi90FEe7gHQ71X0Sgy8UIr+CVqMtq/k3npz7OYrfZx4EN1OD5SdcZWEoJwuM
         54ZPvu8dMPGQ6qEmG2ybymlpuf2Sz2fRa//CuWQisxoXxR/x/YpsIc5XQuls4xCBMu6b
         QiHQ21QARCtWZuYoYZYnfEo0H5PYMGnssZaX7nRCON1QbAawJy63sGfFsnsS1dPAayQY
         wZxeHbxbwMAaqXHMNsBr2ZPSNXV50HWkwTfFnGn3IERi+mYNh/btci+Wr1erT+fzealD
         sGNQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769686001; x=1770290801; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q1wGT9d84hwaCcWFcB97ONdHeFj8/ZzaRqWslcbVPFQ=;
        b=EQ5Ih8XxjAJqk7nJ66AezdvBnm8ZOvUSONhWPNrYR8n419p22ukUAjgJaBlcOIoRfo
         6RJTd5qIfJ0vMsFdY4wSGP6NqEHvODtStybCVP1nj8adlTvk6aD1r9ju1fTOo31biMV+
         nbDyfobb7kSlE2/Rnz+c7Qt5e5lBPgLj4MN6u1vzCoUBeBM8SV0qpc7S38C1FcutKw1G
         9yzFMwcZkiNo0Fl6jN6iuDGtx422NTG88RmWb7kgBMT7UrNR+vohXviyN4A39bqfs62A
         6VIE8QRcyqd6Y4kXkknqCKO9Yn3I5sMR5C1w6ITRfKlRK1LXuQlTjKyVZmJ8KCTmxZ8I
         dcKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769686001; x=1770290801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q1wGT9d84hwaCcWFcB97ONdHeFj8/ZzaRqWslcbVPFQ=;
        b=WzKj4nD1MtEMOspCyHKs9T5V92Dg00id2nY7fdNzN3yLD1EevvkZF9n38sTgReyvhI
         NXkqxw6GuaXtTdBG4KQm9XVjB0uUJcY27fu/gmrqeYMKQ/R61o/hhIfLDgXuvabSt217
         Ef2FWblzY78KJLcG49uNRFpRy1A5kN1kQTCTHDO2D3gTxnuc+/rA0QrfbngU3vuGno9p
         bKGhpuTN2fyQ+Ws6O3/SwEx2uCZlKy82pS/Zr+p9ckTA10ZrtZLwjoaceiiVmgV+AYkq
         lR5BF3JtGA7uG8RlICMVbV3XRYRZcjYfwRx2bLhToomMnXMkEImdNfYevMGqBcZE7o39
         J00g==
X-Gm-Message-State: AOJu0YwXzt7bAzlC53wNOQRLrp1Jhp0LHZQ5/BTKiWfofknConWphK1Q
	BQBP1I/Hq08zzhOS0GMg+KaRSTLxsjyK5L1iFBnfP9G3kQz0SVUxbct/m5XUemvmXLZmjLLmJ48
	XQ2+a2M0KlmsJe7XRBfZwqgwdC7tQqDk=
X-Gm-Gg: AZuq6aLbNZWvcOs8oT7z/8l/Or7fLc1nkYt2A4JH4YvUDbsOOtvtzdlV27GJTyuZk50
	4lxyOZAwpezFNFrQzjAclO9YL/qT1wndvygWKbjQRpyxwzwdxz8pJvUO1DgHS6wEy/Zdbl7miM6
	QP2wUK2Yue+DmUBFRuEgTn31m7TP5nhNaNi1UmzqmqX+SAEfkANp5Ga/PZCDTg/D71ThxrU4u5e
	wyLxrgOpGphF9KDfdQODa4DDMf5+XlvwEEWpfjweKuXzAycTRn6hpBQUcCMV/cKL3Ata6x18Doy
	ryMq+g7zJCa/Gi5lEfjQORvENRWiKg==
X-Received: by 2002:a05:620a:7016:b0:8c6:a2f2:d874 with SMTP id
 af79cd13be357-8c70b869219mr1171530485a.39.1769686001419; Thu, 29 Jan 2026
 03:26:41 -0800 (PST)
MIME-Version: 1.0
References: <20260129035353.8982-1-liuyd.fnst@fujitsu.com> <20260129035353.8982-7-liuyd.fnst@fujitsu.com>
In-Reply-To: <20260129035353.8982-7-liuyd.fnst@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 29 Jan 2026 12:26:30 +0100
X-Gm-Features: AZwV_QhjFDgoVK2JhoJfbU-F4Md8BXwOtC-xkfXg7QumeoD0GP4BWaoHoi6cZl8
Message-ID: <CANNYZj9TRt0GqyafY0eD+bwuTBUb3iEeBFD16po7kxPHwQJ-Kg@mail.gmail.com>
Subject: Re: [OE-core][PATCH 6/6] orc: Enable hotdoc to produce doc
To: liuyd.fnst@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 11:26:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230134

Thanks for looking into this. Are there other recipes in oe-core that
have hotdoc support? You can perhaps unpack everything (without
building it), and then grep in WORKDIR for hotdoc.

If there's just orc, we could probably add hotdoc to meta-openembedded firs=
t.

The pending patch needs to be submitted upstream.

Alex

On Thu, 29 Jan 2026 at 04:54, Yiding Liu (Fujitsu) via
lists.openembedded.org <liuyd.fnst=3Dfujitsu.com@lists.openembedded.org>
wrote:
>
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---
>  .../orc/orc/0001-Fix-hotdoc-run-error.patch   | 37 +++++++++++++++++++
>  meta/recipes-devtools/orc/orc_0.4.42.bb       |  5 ++-
>  2 files changed, 41 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-devtools/orc/orc/0001-Fix-hotdoc-run-err=
or.patch
>
> diff --git a/meta/recipes-devtools/orc/orc/0001-Fix-hotdoc-run-error.patc=
h b/meta/recipes-devtools/orc/orc/0001-Fix-hotdoc-run-error.patch
> new file mode 100644
> index 0000000000..277ce038f8
> --- /dev/null
> +++ b/meta/recipes-devtools/orc/orc/0001-Fix-hotdoc-run-error.patch
> @@ -0,0 +1,36 @@
> +Subject: [PATCH] Fix hotdoc run error.
> +
> +Fix the following error.
> +| Running custom install script 'tmp/work/x86-64-v3-poky-linux/orc/0.4.4=
2/recipe-sysroot-native/usr/bin/meson.real --internal hotdoc --install orc-=
doc/html --docdir /usr/share/doc/orc/html --name orc --builddir tmp/work/x8=
6-64-v3-poky-linux/orc/0.4.42/build/doc tmp/work/x86-64-v3-poky-linux/orc/0=
.4.42/recipe-sysroot-native/usr/bin/hotdoc run --conf-file orc-doc.json'
> +| --- stdout ---
> +|
> +| --- stderr ---
> +| ERROR: [doc-tree]: (index-extension-not-found): tmp/work/x86-64-v3-pok=
y-linux/orc/0.4.42/sources/orc-0.4.42/doc/sitemap.txt:8:10: No extension na=
med c for index page
> +| 00006:                tutorial.md
> +| 00007:                opcodes.md
> +| 00008:        c-index
> +|               ^
> +| 00009:
> +|
> +
> +Remove c-index as it is not in the doc directory.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> +---
> + doc/sitemap.txt | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/doc/sitemap.txt b/doc/sitemap.txt
> +index 568b367..40a7f99 100644
> +--- a/doc/sitemap.txt
> ++++ b/doc/sitemap.txt
> +@@ -5,4 +5,3 @@ index.md
> +               concepts.md
> +               tutorial.md
> +               opcodes.md
> +-      c-index
> +--
> +2.43.0
> +
> diff --git a/meta/recipes-devtools/orc/orc_0.4.42.bb b/meta/recipes-devto=
ols/orc/orc_0.4.42.bb
> index f56b9058c2..b73c8df04d 100644
> --- a/meta/recipes-devtools/orc/orc_0.4.42.bb
> +++ b/meta/recipes-devtools/orc/orc_0.4.42.bb
> @@ -4,11 +4,14 @@ DESCRIPTION =3D "Optimised Inner Loop Runtime Compiler =
is a Library and set of too
>  LICENSE =3D "BSD-2-Clause & BSD-3-Clause"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1400bd9d09e8af56b9ec982b3d857=
97e"
>
> -SRC_URI =3D "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz"
> +SRC_URI =3D "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz \
> +           file://0001-Fix-hotdoc-run-error.patch \
> +          "
>  SRC_URI[sha256sum] =3D "7ec912ab59af3cc97874c456a56a8ae1eec520c385ec447e=
8a102b2bd122c90c"
>
>  inherit meson pkgconfig
>
> +DEPENDS =3D "hotdoc-native"
>  # distinguish from apache:orc
>  CVE_PRODUCT =3D "gstreamer:orc"
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#230118): https://lists.openembedded.org/g/openembedde=
d-core/message/230118
> Mute This Topic: https://lists.openembedded.org/mt/117521454/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

