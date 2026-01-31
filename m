Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB685D79752
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 08:02:06 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5106.1769846518153598516
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Jan 2026 00:01:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=B2aEl7pm;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so1866618f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 00:01:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769846516; cv=none;
        d=google.com; s=arc-20240605;
        b=ijYgYRkhbVlRSErTsgDIvvnKiWfdGw/onGgDnZ2RPfJ7PzfC3/feK4UUTkLjPI/LHp
         GwH2P7Y+3FOyp7mlfpV+uA8flVFyMQbbXZrZ8KXCok2jsmITI4xBlJ0Iis+Lm8PtLC2e
         pGUj5zjudLXS0q4hCLdtGGYHUr7jdaOaw7MVUnPGh9qaNFpaBH2Msz06xpS86Vhk/VCc
         8I+ISuim+FH867ZIGg28rXZ3wgDBSBdksDLPoybGurgQVjilltvuVuCrbOU13/KcNSJg
         jzaihJ6eezxWuc58+8qvWeze2/TJqzmnI/Hkxd8nr8x5Ia/bTJZ5VpYb+gxcKHDQ/GDH
         DSnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=9KLNVn6bEXhcvVpe68MSrFXXlcUY2KC0genPlUXOOSU=;
        fh=UxP1HceJM0T1LJz3AZ4pRYR3KesS3Uwc4ek1/I2Z9pE=;
        b=OKIhjTEgWj2tJIVFhiza9MXsx+ytRiwstzjMN28YuiJ4w3UTYE/3qIb4ONF+pekgla
         ri3rD3HHo5TmAf0Td13KeGJgCew5h9lwPZ2FCmBcBjGYLEphgJLwYxsg4cWKKBlGfIXR
         /YYn2W+1NnDWQlmqy8SBpfu3MVOOQIn4gOUnyOAUtSikqcHeSOQQzsE8oWKH5dkj0TCT
         xaMO9IJ/Hd6gDWczKEQjQnczpYEWP1VdnHwh1h3lfqPay1yko4kKZSGFM0LEzR2oX2Mo
         hojpYM2nZBos+rrLj01vo/zhqfEE3mNkjprY6OaN2mN4zthpzXwdgdNMhb8jUIUz/n9U
         6S7A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1769846516; x=1770451316; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9KLNVn6bEXhcvVpe68MSrFXXlcUY2KC0genPlUXOOSU=;
        b=B2aEl7pm6ITm8qOtbrnbbsAGv4kCEtmbknn1MW8P9ZQsM8/lpZodwUtryK2R8vLxmq
         MgENhhFZ2uhigRIRJ2S7s4IpR+m2NToRMjjpNmih2h2tPSS4sNfnpYCI28e56O9BnOxY
         bnNquFcg1fEhu58N9vSqizX7+ZBBM8NQoLYHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769846516; x=1770451316;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9KLNVn6bEXhcvVpe68MSrFXXlcUY2KC0genPlUXOOSU=;
        b=VUqsvOvKJq0bm+P/vT4h6tVRrqJh83bz64Hl97kpZj3ZdMUl/YlZxgrBfIsEaqY7EO
         x6lkdL6uoPJhTiqdKIaqK1PjWXcERwaP3REJkaNZeHR84ntM8LglK404dL3wxKlqbksS
         h0sAEOL2xUW4Z2T02qbUOX2z4qa4b9l5J5M6hnerfC8B0ZWXHPOjy/50qSYQ53laUiRN
         LTM1KoD9YxF73edQHyZ6EPcO/OnEE5hteXgv/ycMOW41s/oa+vBjTJgPl0wopO+j8iv3
         3YvHNoX1eg9buXEItjA3fX6ZVy57VDRfDPNPmPL5ugrRvDVNdBc0A2Dq0ERLEKxooZIU
         Zd7A==
X-Gm-Message-State: AOJu0Yw74JUkAzAABVBTWfF+GJRxnq/NEh4dsf43A8F0x3iwiWcgsGFt
	VZUhPKFybxrPmqAQ4q8LMDdhRNIQEzVKE3UtVzILtUV0wBwmgmh1d2XV6r4kqHsNSXJiEChjYUA
	rKiE8hB2Pqi8JahzhjWXVnlYi3WKQpaLWgAGUHYPZjX2IdmWvVKfKpDo=
X-Gm-Gg: AZuq6aKJ3DI8mt0ebwts0JHFq/CVBbZ2sjzGuAmNJ/Av9BODVvXOE7xxvdXjxBITjjp
	JLyqsMmH1pqPv/0YZ/aYlcXEXAEaP35iSYsCS5MNHN8h/jydCx7Dh/ApoXMwGPgj0uY9OgO3FoT
	vBoDEXCixdjtu/ngKaxuoULEu/VSEvIPlYeAhO0D4VKA0f2E/KxdSIxPEGr6Nv1jFyxg1VFkPN/
	RXmyZwgDs84mbShLE16Rku0qQ6eWrScEtaQ8C51BVEDegBF82D4H4I0JWCGxAhHEXN9HuiNP/hj
	6crM9ySw9Tj+mQ6uiYiJYDsN7pdNqXygE+eKEYgR
X-Received: by 2002:a05:6000:18a8:b0:435:dba0:736c with SMTP id
 ffacd0b85a97d-435f3ab9ae7mr8219612f8f.56.1769846515867; Sat, 31 Jan 2026
 00:01:55 -0800 (PST)
MIME-Version: 1.0
References: <cover.1769845858.git.yoann.congal@smile.fr>
In-Reply-To: <cover.1769845858.git.yoann.congal@smile.fr>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Sat, 31 Jan 2026 09:01:29 +0100
X-Gm-Features: AZwV_QjINqB1x667TWjcfT7Uq0N51_37S5RCbxypXigcFHQ6wm7wYChGO2a2RjU
Message-ID: <CAMSfU+5r1TPGnE_H0WPQN+fqrj6gSWDpuGjeuJ=W+4QgKhSNuQ@mail.gmail.com>
Subject: Re: [OE-core][whinlatter 00/22] Patch review
To: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e2b3ca0649aa80bc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 31 Jan 2026 08:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230228

--000000000000e2b3ca0649aa80bc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 31 janv. 2026 =C3=A0 08:56, Yoann Congal <yoann.congal@smile.fr> a
=C3=A9crit :

> Please review this set of changes for whinlatter and have comments back b=
y
> end of day Tuesday, February 3.
>
> Passed a-full on autobuilder:
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/3151
>
> The following changes since commit
> fa31089d48cac2aa11279e932a77f4dbdc02c02d:
>
>   libarchive: upgrade 3.8.4 -> 3.8.5 (2026-01-26 08:44:38 +0000)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/openembedded-core-contrib
> stable/whinlatter-nut
>
> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/wh=
inlatter-nut
>
> Hemanth Kumar M D (1):
>   binutils: Upgrade to 2.45.1 release
>

Sorry, I mixed my branches :(
"binutils: Upgrade to 2.45.1 release" was not included in the tested
branch, please ignore.


>
> Hugo SIMELIERE (1):
>   libtasn1: Fix CVE-2025-13151
>
> Jiaying Song (1):
>   grub: fix CVE-2025-54770 CVE-2025-61661 CVE-2025-61662 CVE-2025-61663
>     CVE-2025-61664
>
> Jo=C3=A3o Marcos Costa (1):
>   mesa: fix build error with llvmpipe gallium driver
>
> Ken Kurematsu (1):
>   libtheora: set CVE_PRODUCT
>
> Khai Dang (1):
>   docbook-xml-dtd4: fix the fetching failure
>
> Mark Hatle (1):
>   dpkg: Fix ADMINDIR
>
> Mathieu Dubois-Briand (2):
>   oeqa/gitarchive: Fix git push URL parameter
>   oeqa/gitarchive: Push tag before copying log files
>
> Peter Marko (11):
>   go: upgrade 1.25.5 -> 1.25.6
>   zlib: ignore CVE-2026-22184
>   python3-urllib3: patch CVE-2026-21441
>   glibc: stable 2.42 branch updates
>   expat: patch CVE-2026-24515
>   dropbear: patch CVE-2025-14282
>   libpng: upgrade 1.6.53 -> 1.6.54
>   glib-2.0: patch CVE-2026-0988
>   libxml2: patch CVE-2026-0989
>   libxml2: patch CVE-2026-0990
>   openssl: upgrade 3.5.4 -> 3.5.5
>

"openssl: upgrade 3.5.4 -> 3.5.5" was not included in the tested branch,
please ignore.


>
> Richard Purdie (2):
>   scripts/oe-git-archive: Ensure new push parameter is specified
>   pseudo: Update to 1.9.3 release
>
>  meta/lib/oe/package_manager/deb/__init__.py   |    4 +
>  .../oeqa/selftest/cases/gitarchivetests.py    |    4 +-
>  meta/lib/oeqa/utils/gitarchive.py             |    8 +-
>  .../grub/files/CVE-2025-54770.patch           |   41 +
>  .../grub/files/CVE-2025-61661.patch           |   40 +
>  .../grub/files/CVE-2025-61662.patch           |   72 +
>  .../grub/files/CVE-2025-61663_61664.patch     |   64 +
>  meta/recipes-bsp/grub/grub2.inc               |    4 +
>  ...ke-history-reporting-when-test-fails.patch |   23 +-
>  .../0001-extend-check_cwm-test-timeout.patch  |    2 +-
>  .../{openssl_3.5.4.bb =3D> openssl_3.5.5.bb}    |    2 +-
>  .../dropbear/dropbear/CVE-2025-14282-01.patch |  280 +++
>  .../dropbear/dropbear/CVE-2025-14282-02.patch |   97 +
>  .../dropbear/dropbear/CVE-2025-14282-03.patch |  282 +++
>  .../dropbear/dropbear/CVE-2025-14282-04.patch |   72 +
>  .../dropbear/dropbear/CVE-2025-14282-05.patch |   46 +
>  .../recipes-core/dropbear/dropbear_2025.88.bb |    5 +
>  .../expat/expat/CVE-2026-24515-01.patch       |   43 +
>  .../expat/expat/CVE-2026-24515-02.patch       |  117 ++
>  meta/recipes-core/expat/expat_2.7.3.bb        |    2 +
>  .../glib-2.0/files/CVE-2026-0988.patch        |   58 +
>  meta/recipes-core/glib-2.0/glib.inc           |    1 +
>  meta/recipes-core/glibc/glibc-version.inc     |    2 +-
>  meta/recipes-core/glibc/glibc_2.42.bb         |    2 +-
>  .../libxml/libxml2/CVE-2026-0989.patch        |  309 +++
>  .../libxml/libxml2/CVE-2026-0990.patch        |   76 +
>  meta/recipes-core/libxml/libxml2_2.14.6.bb    |    2 +
>  meta/recipes-core/zlib/zlib_1.3.1.bb          |    2 +
>  .../binutils/binutils-2.45.inc                |    6 +-
>  ...-system-directories-when-cross-linki.patch |   38 +-
>  .../binutils/0008-Use-libtool-2.4.patch       | 1827 ++++++++---------
>  .../docbook-xml/docbook-xml-dtd4_4.5.bb       |   10 +-
>  ...-dirs.c-set_rootfs-was-not-checking-.patch |   46 +
>  meta/recipes-devtools/dpkg/dpkg_1.22.21.bb    |    1 +
>  .../go/{go-1.25.5.inc =3D> go-1.25.6.inc}       |    2 +-
>  ...e_1.25.5.bb =3D> go-binary-native_1.25.6.bb} |    6 +-
>  ..._1.25.5.bb =3D> go-cross-canadian_1.25.6.bb} |    0
>  ...{go-cross_1.25.5.bb =3D> go-cross_1.25.6.bb} |    0
>  ...osssdk_1.25.5.bb =3D> go-crosssdk_1.25.6.bb} |    0
>  ...runtime_1.25.5.bb =3D> go-runtime_1.25.6.bb} |    0
>  ...ent-based-hash-generation-less-pedan.patch |    8 +-
>  ...ng-cgo-on-386-call-C-sigaction-funct.patch |    4 +-
>  ...d-go-make-GOROOT-precious-by-default.patch |    2 +-
>  .../go/{go_1.25.5.bb =3D> go_1.25.6.bb}         |    0
>  meta/recipes-devtools/pseudo/pseudo_git.bb    |    4 +-
>  .../python3-urllib3/CVE-2026-21441.patch      |  111 +
>  .../python/python3-urllib3_2.5.0.bb           |    1 +
>  .../files/0001-gallivm-support-LLVM-21.patch  |   56 +
>  meta/recipes-graphics/mesa/mesa.inc           |    1 +
>  .../{libpng_1.6.53.bb =3D> libpng_1.6.54.bb}    |    4 +-
>  .../libtheora/libtheora_1.2.0.bb              |    2 +
>  .../gnutls/libtasn1/CVE-2025-13151.patch      |   30 +
>  .../recipes-support/gnutls/libtasn1_4.20.0.bb |    1 +
>  scripts/lib/resulttool/store.py               |    9 +-
>  scripts/oe-git-archive                        |    2 +-
>  55 files changed, 2752 insertions(+), 1079 deletions(-)
>  create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-54770.patch
>  create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-61661.patch
>  create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-61662.patch
>  create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-61663_61664.patc=
h
>  rename meta/recipes-connectivity/openssl/{openssl_3.5.4.bb =3D>
> openssl_3.5.5.bb} (99%)
>  create mode 100644
> meta/recipes-core/dropbear/dropbear/CVE-2025-14282-01.patch
>  create mode 100644
> meta/recipes-core/dropbear/dropbear/CVE-2025-14282-02.patch
>  create mode 100644
> meta/recipes-core/dropbear/dropbear/CVE-2025-14282-03.patch
>  create mode 100644
> meta/recipes-core/dropbear/dropbear/CVE-2025-14282-04.patch
>  create mode 100644
> meta/recipes-core/dropbear/dropbear/CVE-2025-14282-05.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-24515-01.patch
>  create mode 100644 meta/recipes-core/expat/expat/CVE-2026-24515-02.patch
>  create mode 100644 meta/recipes-core/glib-2.0/files/CVE-2026-0988.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0989.patch
>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0990.patch
>  create mode 100644
> meta/recipes-devtools/dpkg/dpkg/0001-lib-dpkg-options-dirs.c-set_rootfs-w=
as-not-checking-.patch
>  rename meta/recipes-devtools/go/{go-1.25.5.inc =3D> go-1.25.6.inc} (91%)
>  rename meta/recipes-devtools/go/{go-binary-native_1.25.5.bb =3D>
> go-binary-native_1.25.6.bb} (79%)
>  rename meta/recipes-devtools/go/{go-cross-canadian_1.25.5.bb =3D>
> go-cross-canadian_1.25.6.bb} (100%)
>  rename meta/recipes-devtools/go/{go-cross_1.25.5.bb =3D> go-cross_1.25.6=
.bb}
> (100%)
>  rename meta/recipes-devtools/go/{go-crosssdk_1.25.5.bb =3D>
> go-crosssdk_1.25.6.bb} (100%)
>  rename meta/recipes-devtools/go/{go-runtime_1.25.5.bb =3D>
> go-runtime_1.25.6.bb} (100%)
>  rename meta/recipes-devtools/go/{go_1.25.5.bb =3D> go_1.25.6.bb} (100%)
>  create mode 100644
> meta/recipes-devtools/python/python3-urllib3/CVE-2026-21441.patch
>  create mode 100644
> meta/recipes-graphics/mesa/files/0001-gallivm-support-LLVM-21.patch
>  rename meta/recipes-multimedia/libpng/{libpng_1.6.53.bb =3D>
> libpng_1.6.54.bb} (94%)
>  create mode 100644
> meta/recipes-support/gnutls/libtasn1/CVE-2025-13151.patch
>
>

--=20
Yoann Congal
Smile ECS

--000000000000e2b3ca0649aa80bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0sam. 31=
 janv. 2026 =C3=A0=C2=A008:56, Yoann Congal &lt;<a href=3D"mailto:yoann.con=
gal@smile.fr">yoann.congal@smile.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Please review this set of c=
hanges for whinlatter and have comments back by<br>
end of day Tuesday, February 3.<br>
<br>
Passed a-full on autobuilder:<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/bui=
lds/3151" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctopro=
ject.org/valkyrie/?#/builders/29/builds/3151</a><br>
<br>
The following changes since commit fa31089d48cac2aa11279e932a77f4dbdc02c02d=
:<br>
<br>
=C2=A0 libarchive: upgrade 3.8.4 -&gt; 3.8.5 (2026-01-26 08:44:38 +0000)<br=
>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/openembedded-core-contrib" r=
el=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/openembedd=
ed-core-contrib</a> stable/whinlatter-nut<br>
=C2=A0 <a href=3D"https://git.openembedded.org/openembedded-core-contrib/lo=
g/?h=3Dstable/whinlatter-nut" rel=3D"noreferrer" target=3D"_blank">https://=
git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/whinlatter-n=
ut</a><br>
<br>
Hemanth Kumar M D (1):<br>
=C2=A0 binutils: Upgrade to 2.45.1 release<br></blockquote><div><br></div><=
div>Sorry, I mixed my branches :(</div><div>&quot;binutils: Upgrade to 2.45=
.1 release&quot; was not included in the tested branch, please ignore.=C2=
=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
Hugo SIMELIERE (1):<br>
=C2=A0 libtasn1: Fix CVE-2025-13151<br>
<br>
Jiaying Song (1):<br>
=C2=A0 grub: fix CVE-2025-54770 CVE-2025-61661 CVE-2025-61662 CVE-2025-6166=
3<br>
=C2=A0 =C2=A0 CVE-2025-61664<br>
<br>
Jo=C3=A3o Marcos Costa (1):<br>
=C2=A0 mesa: fix build error with llvmpipe gallium driver<br>
<br>
Ken Kurematsu (1):<br>
=C2=A0 libtheora: set CVE_PRODUCT<br>
<br>
Khai Dang (1):<br>
=C2=A0 docbook-xml-dtd4: fix the fetching failure<br>
<br>
Mark Hatle (1):<br>
=C2=A0 dpkg: Fix ADMINDIR<br>
<br>
Mathieu Dubois-Briand (2):<br>
=C2=A0 oeqa/gitarchive: Fix git push URL parameter<br>
=C2=A0 oeqa/gitarchive: Push tag before copying log files<br>
<br>
Peter Marko (11):<br>
=C2=A0 go: upgrade 1.25.5 -&gt; 1.25.6<br>
=C2=A0 zlib: ignore CVE-2026-22184<br>
=C2=A0 python3-urllib3: patch CVE-2026-21441<br>
=C2=A0 glibc: stable 2.42 branch updates<br>
=C2=A0 expat: patch CVE-2026-24515<br>
=C2=A0 dropbear: patch CVE-2025-14282<br>
=C2=A0 libpng: upgrade 1.6.53 -&gt; 1.6.54<br>
=C2=A0 glib-2.0: patch CVE-2026-0988<br>
=C2=A0 libxml2: patch CVE-2026-0989<br>
=C2=A0 libxml2: patch CVE-2026-0990<br>
=C2=A0 openssl: upgrade 3.5.4 -&gt; 3.5.5<br></blockquote><div><br></div><d=
iv><div>&quot;openssl: upgrade 3.5.4 -&gt; 3.5.5&quot; was not included in =
the tested branch, please ignore.=C2=A0</div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
Richard Purdie (2):<br>
=C2=A0 scripts/oe-git-archive: Ensure new push parameter is specified<br>
=C2=A0 pseudo: Update to 1.9.3 release<br>
<br>
=C2=A0meta/lib/oe/package_manager/deb/__init__.py=C2=A0 =C2=A0|=C2=A0 =C2=
=A0 4 +<br>
=C2=A0.../oeqa/selftest/cases/gitarchivetests.py=C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 4 +-<br>
=C2=A0meta/lib/oeqa/utils/gitarchive.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 8 +-<br>
=C2=A0.../grub/files/CVE-2025-54770.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A041 +<br>
=C2=A0.../grub/files/CVE-2025-61661.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A040 +<br>
=C2=A0.../grub/files/CVE-2025-61662.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A072 +<br>
=C2=A0.../grub/files/CVE-2025-61663_61664.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A064 +<br>
=C2=A0meta/recipes-bsp/grub/grub2.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 4 +<br>
=C2=A0...ke-history-reporting-when-test-fails.patch |=C2=A0 =C2=A023 +-<br>
=C2=A0.../0001-extend-check_cwm-test-timeout.patch=C2=A0 |=C2=A0 =C2=A0 2 +=
-<br>
=C2=A0.../{<a href=3D"http://openssl_3.5.4.bb" rel=3D"noreferrer" target=3D=
"_blank">openssl_3.5.4.bb</a> =3D&gt; <a href=3D"http://openssl_3.5.5.bb" r=
el=3D"noreferrer" target=3D"_blank">openssl_3.5.5.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A0 2 +-<br>
=C2=A0.../dropbear/dropbear/CVE-2025-14282-01.patch |=C2=A0 280 +++<br>
=C2=A0.../dropbear/dropbear/CVE-2025-14282-02.patch |=C2=A0 =C2=A097 +<br>
=C2=A0.../dropbear/dropbear/CVE-2025-14282-03.patch |=C2=A0 282 +++<br>
=C2=A0.../dropbear/dropbear/CVE-2025-14282-04.patch |=C2=A0 =C2=A072 +<br>
=C2=A0.../dropbear/dropbear/CVE-2025-14282-05.patch |=C2=A0 =C2=A046 +<br>
=C2=A0.../recipes-core/dropbear/<a href=3D"http://dropbear_2025.88.bb" rel=
=3D"noreferrer" target=3D"_blank">dropbear_2025.88.bb</a> |=C2=A0 =C2=A0 5 =
+<br>
=C2=A0.../expat/expat/CVE-2026-24515-01.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A043 +<br>
=C2=A0.../expat/expat/CVE-2026-24515-02.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 117 ++<br>
=C2=A0meta/recipes-core/expat/<a href=3D"http://expat_2.7.3.bb" rel=3D"nore=
ferrer" target=3D"_blank">expat_2.7.3.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 2 +<br>
=C2=A0.../glib-2.0/files/CVE-2026-0988.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A058 +<br>
=C2=A0meta/recipes-core/glib-2.0/glib.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A0 1 +<br>
=C2=A0meta/recipes-core/glibc/glibc-version.inc=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A0 2 +-<br>
=C2=A0meta/recipes-core/glibc/<a href=3D"http://glibc_2.42.bb" rel=3D"noref=
errer" target=3D"_blank">glibc_2.42.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 2 +-<br>
=C2=A0.../libxml/libxml2/CVE-2026-0989.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 309 +++<br>
=C2=A0.../libxml/libxml2/CVE-2026-0990.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A076 +<br>
=C2=A0meta/recipes-core/libxml/<a href=3D"http://libxml2_2.14.6.bb" rel=3D"=
noreferrer" target=3D"_blank">libxml2_2.14.6.bb</a>=C2=A0 =C2=A0 |=C2=A0 =
=C2=A0 2 +<br>
=C2=A0meta/recipes-core/zlib/<a href=3D"http://zlib_1.3.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">zlib_1.3.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A0 2 +<br>
=C2=A0.../binutils/binutils-2.45.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 6 +-<br>
=C2=A0...-system-directories-when-cross-linki.patch |=C2=A0 =C2=A038 +-<br>
=C2=A0.../binutils/0008-Use-libtool-2.4.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
827 ++++++++---------<br>
=C2=A0.../docbook-xml/<a href=3D"http://docbook-xml-dtd4_4.5.bb" rel=3D"nor=
eferrer" target=3D"_blank">docbook-xml-dtd4_4.5.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A010 +-<br>
=C2=A0...-dirs.c-set_rootfs-was-not-checking-.patch |=C2=A0 =C2=A046 +<br>
=C2=A0meta/recipes-devtools/dpkg/<a href=3D"http://dpkg_1.22.21.bb" rel=3D"=
noreferrer" target=3D"_blank">dpkg_1.22.21.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 1 +<br>
=C2=A0.../go/{go-1.25.5.inc =3D&gt; go-1.25.6.inc}=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 2 +-<br>
=C2=A0...<a href=3D"http://e_1.25.5.bb" rel=3D"noreferrer" target=3D"_blank=
">e_1.25.5.bb</a> =3D&gt; <a href=3D"http://go-binary-native_1.25.6.bb" rel=
=3D"noreferrer" target=3D"_blank">go-binary-native_1.25.6.bb</a>} |=C2=A0 =
=C2=A0 6 +-<br>
=C2=A0..._<a href=3D"http://1.25.5.bb" rel=3D"noreferrer" target=3D"_blank"=
>1.25.5.bb</a> =3D&gt; <a href=3D"http://go-cross-canadian_1.25.6.bb" rel=
=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.25.6.bb</a>} |=C2=A0 =
=C2=A0 0<br>
=C2=A0...{<a href=3D"http://go-cross_1.25.5.bb" rel=3D"noreferrer" target=
=3D"_blank">go-cross_1.25.5.bb</a> =3D&gt; <a href=3D"http://go-cross_1.25.=
6.bb" rel=3D"noreferrer" target=3D"_blank">go-cross_1.25.6.bb</a>} |=C2=A0 =
=C2=A0 0<br>
=C2=A0...<a href=3D"http://osssdk_1.25.5.bb" rel=3D"noreferrer" target=3D"_=
blank">osssdk_1.25.5.bb</a> =3D&gt; <a href=3D"http://go-crosssdk_1.25.6.bb=
" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.25.6.bb</a>} |=C2=A0 =
=C2=A0 0<br>
=C2=A0...<a href=3D"http://runtime_1.25.5.bb" rel=3D"noreferrer" target=3D"=
_blank">runtime_1.25.5.bb</a> =3D&gt; <a href=3D"http://go-runtime_1.25.6.b=
b" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.25.6.bb</a>} |=C2=A0 =
=C2=A0 0<br>
=C2=A0...ent-based-hash-generation-less-pedan.patch |=C2=A0 =C2=A0 8 +-<br>
=C2=A0...ng-cgo-on-386-call-C-sigaction-funct.patch |=C2=A0 =C2=A0 4 +-<br>
=C2=A0...d-go-make-GOROOT-precious-by-default.patch |=C2=A0 =C2=A0 2 +-<br>
=C2=A0.../go/{<a href=3D"http://go_1.25.5.bb" rel=3D"noreferrer" target=3D"=
_blank">go_1.25.5.bb</a> =3D&gt; <a href=3D"http://go_1.25.6.bb" rel=3D"nor=
eferrer" target=3D"_blank">go_1.25.6.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 0<br>
=C2=A0meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_git.bb" rel=3D"=
noreferrer" target=3D"_blank">pseudo_git.bb</a>=C2=A0 =C2=A0 |=C2=A0 =C2=A0=
 4 +-<br>
=C2=A0.../python3-urllib3/CVE-2026-21441.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
111 +<br>
=C2=A0.../python/<a href=3D"http://python3-urllib3_2.5.0.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-urllib3_2.5.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +<br>
=C2=A0.../files/0001-gallivm-support-LLVM-21.patch=C2=A0 |=C2=A0 =C2=A056 +=
<br>
=C2=A0meta/recipes-graphics/mesa/mesa.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A0 1 +<br>
=C2=A0.../{<a href=3D"http://libpng_1.6.53.bb" rel=3D"noreferrer" target=3D=
"_blank">libpng_1.6.53.bb</a> =3D&gt; <a href=3D"http://libpng_1.6.54.bb" r=
el=3D"noreferrer" target=3D"_blank">libpng_1.6.54.bb</a>}=C2=A0 =C2=A0 |=C2=
=A0 =C2=A0 4 +-<br>
=C2=A0.../libtheora/<a href=3D"http://libtheora_1.2.0.bb" rel=3D"noreferrer=
" target=3D"_blank">libtheora_1.2.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +<br>
=C2=A0.../gnutls/libtasn1/CVE-2025-13151.patch=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A030 +<br>
=C2=A0.../recipes-support/gnutls/<a href=3D"http://libtasn1_4.20.0.bb" rel=
=3D"noreferrer" target=3D"_blank">libtasn1_4.20.0.bb</a> |=C2=A0 =C2=A0 1 +=
<br>
=C2=A0scripts/lib/resulttool/store.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 9 +-<br>
=C2=A0scripts/oe-git-archive=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-<br>
=C2=A055 files changed, 2752 insertions(+), 1079 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-54770.patch<b=
r>
=C2=A0create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-61661.patch<b=
r>
=C2=A0create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-61662.patch<b=
r>
=C2=A0create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-61663_61664.p=
atch<br>
=C2=A0rename meta/recipes-connectivity/openssl/{<a href=3D"http://openssl_3=
.5.4.bb" rel=3D"noreferrer" target=3D"_blank">openssl_3.5.4.bb</a> =3D&gt; =
<a href=3D"http://openssl_3.5.5.bb" rel=3D"noreferrer" target=3D"_blank">op=
enssl_3.5.5.bb</a>} (99%)<br>
=C2=A0create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-14282=
-01.patch<br>
=C2=A0create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-14282=
-02.patch<br>
=C2=A0create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-14282=
-03.patch<br>
=C2=A0create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-14282=
-04.patch<br>
=C2=A0create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2025-14282=
-05.patch<br>
=C2=A0create mode 100644 meta/recipes-core/expat/expat/CVE-2026-24515-01.pa=
tch<br>
=C2=A0create mode 100644 meta/recipes-core/expat/expat/CVE-2026-24515-02.pa=
tch<br>
=C2=A0create mode 100644 meta/recipes-core/glib-2.0/files/CVE-2026-0988.pat=
ch<br>
=C2=A0create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0989.pat=
ch<br>
=C2=A0create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-0990.pat=
ch<br>
=C2=A0create mode 100644 meta/recipes-devtools/dpkg/dpkg/0001-lib-dpkg-opti=
ons-dirs.c-set_rootfs-was-not-checking-.patch<br>
=C2=A0rename meta/recipes-devtools/go/{go-1.25.5.inc =3D&gt; go-1.25.6.inc}=
 (91%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-binary-native_1=
.25.5.bb" rel=3D"noreferrer" target=3D"_blank">go-binary-native_1.25.5.bb</=
a> =3D&gt; <a href=3D"http://go-binary-native_1.25.6.bb" rel=3D"noreferrer"=
 target=3D"_blank">go-binary-native_1.25.6.bb</a>} (79%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-cross-canadian_=
1.25.5.bb" rel=3D"noreferrer" target=3D"_blank">go-cross-canadian_1.25.5.bb=
</a> =3D&gt; <a href=3D"http://go-cross-canadian_1.25.6.bb" rel=3D"noreferr=
er" target=3D"_blank">go-cross-canadian_1.25.6.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-cross_1.25.5.bb=
" rel=3D"noreferrer" target=3D"_blank">go-cross_1.25.5.bb</a> =3D&gt; <a hr=
ef=3D"http://go-cross_1.25.6.bb" rel=3D"noreferrer" target=3D"_blank">go-cr=
oss_1.25.6.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-crosssdk_1.25.5=
.bb" rel=3D"noreferrer" target=3D"_blank">go-crosssdk_1.25.5.bb</a> =3D&gt;=
 <a href=3D"http://go-crosssdk_1.25.6.bb" rel=3D"noreferrer" target=3D"_bla=
nk">go-crosssdk_1.25.6.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go-runtime_1.25.5.=
bb" rel=3D"noreferrer" target=3D"_blank">go-runtime_1.25.5.bb</a> =3D&gt; <=
a href=3D"http://go-runtime_1.25.6.bb" rel=3D"noreferrer" target=3D"_blank"=
>go-runtime_1.25.6.bb</a>} (100%)<br>
=C2=A0rename meta/recipes-devtools/go/{<a href=3D"http://go_1.25.5.bb" rel=
=3D"noreferrer" target=3D"_blank">go_1.25.5.bb</a> =3D&gt; <a href=3D"http:=
//go_1.25.6.bb" rel=3D"noreferrer" target=3D"_blank">go_1.25.6.bb</a>} (100=
%)<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/python3-urllib3/CVE-2=
026-21441.patch<br>
=C2=A0create mode 100644 meta/recipes-graphics/mesa/files/0001-gallivm-supp=
ort-LLVM-21.patch<br>
=C2=A0rename meta/recipes-multimedia/libpng/{<a href=3D"http://libpng_1.6.5=
3.bb" rel=3D"noreferrer" target=3D"_blank">libpng_1.6.53.bb</a> =3D&gt; <a =
href=3D"http://libpng_1.6.54.bb" rel=3D"noreferrer" target=3D"_blank">libpn=
g_1.6.54.bb</a>} (94%)<br>
=C2=A0create mode 100644 meta/recipes-support/gnutls/libtasn1/CVE-2025-1315=
1.patch<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><font face=3D"Raleway, regular">Yoann Congal</font><div><fon=
t face=3D"Raleway, regular">Smile ECS</font></div></div></div></div>

--000000000000e2b3ca0649aa80bc--

