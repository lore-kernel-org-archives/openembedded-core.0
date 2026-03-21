Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87DF81099B5A
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 01:40:44 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4095.1774057243545087190
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 18:40:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ef5LW0ub;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-79a2ee65171so12007457b3.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 18:40:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774057243; cv=none;
        d=google.com; s=arc-20240605;
        b=IoCvKnGz7JIhmP+63Kx/XffhP9SFGirNkg4Dl+xAyVb5j6lDNQnXpUJy3tejLtLj9Z
         0TmaWcq5sUZOxO66SpwUF7QIvx3RLByL/RAz64zFMhmZolVbczVfKbmCAA62duDMSfIh
         TyGuwbJpmQEvYWExjbR4hlg+XPsljREXiiR7hFoaYx2foubRl5oXSfZcHTe0i29vZ15v
         fHbwjwJ67r/gCY+rnIqah6PmTFFPkhFVzcc//AQosTks56g0lDUvE5KZ4hL78KjUgoLQ
         8EKsj2unEVM91S8rPmF9HksXflEfmD0RGF8Zh89ZHwbu1w9zW8UvVgJ+KXw7ILA6WXjh
         nMKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WUjS96wh6evS3ftrQeTf7MSYc757B/JdumbYsqsva8Q=;
        fh=Ab5QchtAs08eZNSFiBl6MfJNprT6k/vVQ8w3IX57Q1U=;
        b=BChxLkiGPTI+8HcMTrv3GyLR7mA+UpJOgzt6S8RRan17mT67/njegtlOaJ7ZwOX5vQ
         Ww32xcOJDAvU6I8OphHCQakaMsofjZRz9LeBhfvymKBKIjUiAUqZcT8ZGbFW1mNxRtPW
         7wMxaxUPtKKGhHN/01irDq+PhoAuPYCg3W6Atm9UbEIIvwJsOTrI5Hm7csthlPhpA7U9
         pllv0E8tGKyCxvcnBDG95CD0KvUWcIE1NFBjXNORw+gtoBJ1JjRXDHdK+rZhSTWiyABx
         vzu/HnM8KC2GfArFtkbtFEtxRfoACqmCpQECHSRcs90VUnqUO3RPEe1QZd72SiNfcGYu
         SkUw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774057243; x=1774662043; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WUjS96wh6evS3ftrQeTf7MSYc757B/JdumbYsqsva8Q=;
        b=Ef5LW0ub5IKrOM2VY0vMC4MucKir7EGBdqhOBK8zwp7pcctah3DdqL7asmDkBs233k
         BzomkNwo/8wpf4cZ3LyO9i9RzfJxVTqn/dkTveVdumNhMMqfWdBkFH80OgPwjtu0zXkt
         5pXwMJ5gXt620z+e/Yj14vNm8RtBXxStrvZPUPksgk7+Uuu0vQqI0+IJW+Wwlcv5hbsX
         FxiB1xu+xWhgS/gy4cYmr3ch7Sey5D7oQ7OsIhJ4c3BOqqtyB4ZR3ZXNKHL2V4ndPWDi
         CSj2jPoNKDVoz1b/HCMgmaYf0JVjlk5OVRVaq8Fmt2znr/FJ3GYKSgFGtvSjBzb3N+/T
         goKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774057243; x=1774662043;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WUjS96wh6evS3ftrQeTf7MSYc757B/JdumbYsqsva8Q=;
        b=OR4W9dtEjt/WIx3bPC1rkXgdc19xGX84wX7Yei4euZkxY02msrkdDxlJsUTZZ6PigO
         xP7DbUFKx0igF+lujyzZ27VbicfXz5QHImde+FGWe3ea8wOOkHVwPTJXRH3iQIAsrVbW
         181JCm9ICZJLv4ghGNDauHkO8Q0RRkoaODA6GofJySGzJVVPXuLRWfnTidUekJRjJbgL
         Nl601QnV0STqQupRGFwVx07tAmFsPq4NweybdRRlABKWzYqSdkKdlCO3kLKqS0jwTilU
         r//aML1Zlh9c9tmeUms46hRUpHv76vsXwzefwh0GD9uDLvZeHmX1Opet06bx4VQEFE7s
         A7Sg==
X-Gm-Message-State: AOJu0YwgzOcwSC50Tkrqx+GeMbpC61cYbXbYAoyqbuPnd3LVyZnfJPh8
	3WY0d66QXArmV7Bw4bNppu/CJy9ksnb+IlA8RefzhVH1R7/foiXMEEvMwIkyL0LfWm03nqvf1L+
	C7oYuAmZVja6LvMtVkMrkwfzACgrNoZq0asy6CWo=
X-Gm-Gg: ATEYQzwVO38YFavnyZf2cTO8S68DiChLcWlv+N5hdsnwoFQNhxO18w1+iiSt2y7u8id
	KYaN+hqEOW9/6JGgDBib2Shabq+jT2B7XqYxTBMu4I8lVsz03gcuFEH4HO037EbaZfzVUsezDdl
	Fan9JcHtYq6pVVpW0k7c3qhyN2ATd8gGC15kiE8Ap9VB1M9bS3/WplOUSA3ycpstCT6OnvjqYNB
	FKAiiEojpojJ+ByZ+wzQxMccc10CkmrN/x9MJvedoxX0yB+UQflWJMpKXOoiFSUBJOn/OTjRZAG
	8bsO9aCUnMtkKnHrLkbB8ORff3fUDrFXNUp+ou6yQopDxMMW/VPXTqjuyxfCy3as57E5JrufaYg
	L8J5yoQaFLcOcCT2Bt3WFEzDB
X-Received: by 2002:a05:690c:6e81:b0:79a:3cea:9154 with SMTP id
 00721157ae682-79a90aaea10mr57402197b3.13.1774057242487; Fri, 20 Mar 2026
 18:40:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260320122732.1630715-1-ross.burton@arm.com> <20260320122732.1630715-5-ross.burton@arm.com>
In-Reply-To: <20260320122732.1630715-5-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 20 Mar 2026 18:40:16 -0700
X-Gm-Features: AaiRm513VSNzvgeLROhnEWSbDehRKVZOafPDIiHkwFHCtztSnEOAwcoRpM8ZLhc
Message-ID: <CAMKF1sorLiSe3ip43iPs1vQrfO1LBr5D7BuvvyfEmH6KKCRF2g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/7] class/pkgconfig: use pkgconf instead of pkgconfig
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000bff09f064d7ee302"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2026 01:40:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233645

--000000000000bff09f064d7ee302
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

FWIW there are two recipes in meta-oe which are regressing with this

xmlsec1 and protobuf

https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5941365/raw_inlin=
e

On Fri, Mar 20, 2026 at 5:27=E2=80=AFAM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:

> The last meaningful change to freedesktop.org pkgconfig was in 2019, but
> pkgconf is actively maintained.
>
> Major distributions such as Fedora (and derivates), Debian (ditto), Arch
> Linux, Buildroot, and Alpine have all moved to pkgconf already.
>
> There's a subtle behaviour change between pkgconfig and pkgconf, whereas
> pkgconfig appends the sysroot to PKG_CONFIG_SYSTEM_INCLUDE_PATH pkgconf
> does not, so we need to sysroot-prefix those variables.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes-recipe/pkgconfig.bbclass          | 6 +++---
>  meta/conf/distro/include/default-providers.inc | 6 +++---
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta/classes-recipe/pkgconfig.bbclass
> b/meta/classes-recipe/pkgconfig.bbclass
> index c0d91393b36..4912b9904ba 100644
> --- a/meta/classes-recipe/pkgconfig.bbclass
> +++ b/meta/classes-recipe/pkgconfig.bbclass
> @@ -4,7 +4,7 @@
>  # SPDX-License-Identifier: MIT
>  #
>
> -DEPENDS:prepend =3D "pkgconfig-native "
> +DEPENDS:prepend =3D "pkgconf-native "
>
>  export PKG_CONFIG_PATH ?=3D ""
>  export PKG_CONFIG_LIBDIR ?=3D
> "${STAGING_LIBDIR}/pkgconfig:${STAGING_DATADIR}/pkgconfig"
> @@ -12,5 +12,5 @@ export PKG_CONFIG_LIBDIR ?=3D
> "${STAGING_LIBDIR}/pkgconfig:${STAGING_DATADIR}/pkgc
>  export PKG_CONFIG_SYSROOT_DIR ?=3D "${STAGING_DIR_HOST}"
>  export PKG_CONFIG_DISABLE_UNINSTALLED ?=3D "yes"
>
> -export PKG_CONFIG_SYSTEM_LIBRARY_PATH ?=3D "${base_libdir}:${libdir}"
> -export PKG_CONFIG_SYSTEM_INCLUDE_PATH ?=3D "${includedir}"
> +export PKG_CONFIG_SYSTEM_LIBRARY_PATH ?=3D
> "${STAGING_BASELIBDIR}:${STAGING_LIBDIR}"
> +export PKG_CONFIG_SYSTEM_INCLUDE_PATH ?=3D "${STAGING_INCDIR}"
> diff --git a/meta/conf/distro/include/default-providers.inc
> b/meta/conf/distro/include/default-providers.inc
> index 5101ad78f88..c0a5d1c75e5 100644
> --- a/meta/conf/distro/include/default-providers.inc
> +++ b/meta/conf/distro/include/default-providers.inc
> @@ -56,9 +56,9 @@ PREFERRED_PROVIDER_getopt ?=3D "util-linux-getopt"
>  PREFERRED_PROVIDER_openssl ?=3D "openssl"
>  PREFERRED_PROVIDER_openssl-native ?=3D "openssl-native"
>  PREFERRED_PROVIDER_nativesdk-openssl ?=3D "nativesdk-openssl"
> -PREFERRED_PROVIDER_pkgconfig ?=3D "pkgconfig"
> -PREFERRED_PROVIDER_nativesdk-pkgconfig ?=3D "nativesdk-pkgconfig"
> -PREFERRED_PROVIDER_pkgconfig-native ?=3D "pkgconfig-native"
> +PREFERRED_PROVIDER_pkgconfig ?=3D "pkgconf"
> +PREFERRED_PROVIDER_nativesdk-pkgconfig ?=3D "nativesdk-pkgconf"
> +PREFERRED_PROVIDER_pkgconfig-native ?=3D "pkgconf-native"
>  PREFERRED_RPROVIDER_initd-functions ?=3D "initscripts"
>
>  PREFERRED_PROVIDER_nativesdk-mesa ?=3D "nativesdk-mesa"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#233603):
> https://lists.openembedded.org/g/openembedded-core/message/233603
> Mute This Topic: https://lists.openembedded.org/mt/118416246/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000bff09f064d7ee302
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FWIW there are two recipes in meta-oe which are regressing=
 with this<div><br></div><div>xmlsec1 and protobuf</div><div><br></div><div=
><a href=3D"https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/59413=
65/raw_inline">https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/59=
41365/raw_inline</a></div></div><br><div class=3D"gmail_quote gmail_quote_c=
ontainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 20, 2026 at 5:2=
7=E2=80=AFAM Ross Burton via <a href=3D"http://lists.openembedded.org">list=
s.openembedded.org</a> &lt;ross.burton=3D<a href=3D"mailto:arm.com@lists.op=
enembedded.org">arm.com@lists.openembedded.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">The last meaningful change to=
 <a href=3D"http://freedesktop.org" rel=3D"noreferrer" target=3D"_blank">fr=
eedesktop.org</a> pkgconfig was in 2019, but<br>
pkgconf is actively maintained.<br>
<br>
Major distributions such as Fedora (and derivates), Debian (ditto), Arch<br=
>
Linux, Buildroot, and Alpine have all moved to pkgconf already.<br>
<br>
There&#39;s a subtle behaviour change between pkgconfig and pkgconf, wherea=
s<br>
pkgconfig appends the sysroot to PKG_CONFIG_SYSTEM_INCLUDE_PATH pkgconf<br>
does not, so we need to sysroot-prefix those variables.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/pkgconfig.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 6 +++---<br>
=C2=A0meta/conf/distro/include/default-providers.inc | 6 +++---<br>
=C2=A02 files changed, 6 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/pkgconfig.bbclass b/meta/classes-recipe/pk=
gconfig.bbclass<br>
index c0d91393b36..4912b9904ba 100644<br>
--- a/meta/classes-recipe/pkgconfig.bbclass<br>
+++ b/meta/classes-recipe/pkgconfig.bbclass<br>
@@ -4,7 +4,7 @@<br>
=C2=A0# SPDX-License-Identifier: MIT<br>
=C2=A0#<br>
<br>
-DEPENDS:prepend =3D &quot;pkgconfig-native &quot;<br>
+DEPENDS:prepend =3D &quot;pkgconf-native &quot;<br>
<br>
=C2=A0export PKG_CONFIG_PATH ?=3D &quot;&quot;<br>
=C2=A0export PKG_CONFIG_LIBDIR ?=3D &quot;${STAGING_LIBDIR}/pkgconfig:${STA=
GING_DATADIR}/pkgconfig&quot;<br>
@@ -12,5 +12,5 @@ export PKG_CONFIG_LIBDIR ?=3D &quot;${STAGING_LIBDIR}/pkg=
config:${STAGING_DATADIR}/pkgc<br>
=C2=A0export PKG_CONFIG_SYSROOT_DIR ?=3D &quot;${STAGING_DIR_HOST}&quot;<br=
>
=C2=A0export PKG_CONFIG_DISABLE_UNINSTALLED ?=3D &quot;yes&quot;<br>
<br>
-export PKG_CONFIG_SYSTEM_LIBRARY_PATH ?=3D &quot;${base_libdir}:${libdir}&=
quot;<br>
-export PKG_CONFIG_SYSTEM_INCLUDE_PATH ?=3D &quot;${includedir}&quot;<br>
+export PKG_CONFIG_SYSTEM_LIBRARY_PATH ?=3D &quot;${STAGING_BASELIBDIR}:${S=
TAGING_LIBDIR}&quot;<br>
+export PKG_CONFIG_SYSTEM_INCLUDE_PATH ?=3D &quot;${STAGING_INCDIR}&quot;<b=
r>
diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/dis=
tro/include/default-providers.inc<br>
index 5101ad78f88..c0a5d1c75e5 100644<br>
--- a/meta/conf/distro/include/default-providers.inc<br>
+++ b/meta/conf/distro/include/default-providers.inc<br>
@@ -56,9 +56,9 @@ PREFERRED_PROVIDER_getopt ?=3D &quot;util-linux-getopt&qu=
ot;<br>
=C2=A0PREFERRED_PROVIDER_openssl ?=3D &quot;openssl&quot;<br>
=C2=A0PREFERRED_PROVIDER_openssl-native ?=3D &quot;openssl-native&quot;<br>
=C2=A0PREFERRED_PROVIDER_nativesdk-openssl ?=3D &quot;nativesdk-openssl&quo=
t;<br>
-PREFERRED_PROVIDER_pkgconfig ?=3D &quot;pkgconfig&quot;<br>
-PREFERRED_PROVIDER_nativesdk-pkgconfig ?=3D &quot;nativesdk-pkgconfig&quot=
;<br>
-PREFERRED_PROVIDER_pkgconfig-native ?=3D &quot;pkgconfig-native&quot;<br>
+PREFERRED_PROVIDER_pkgconfig ?=3D &quot;pkgconf&quot;<br>
+PREFERRED_PROVIDER_nativesdk-pkgconfig ?=3D &quot;nativesdk-pkgconf&quot;<=
br>
+PREFERRED_PROVIDER_pkgconfig-native ?=3D &quot;pkgconf-native&quot;<br>
=C2=A0PREFERRED_RPROVIDER_initd-functions ?=3D &quot;initscripts&quot;<br>
<br>
=C2=A0PREFERRED_PROVIDER_nativesdk-mesa ?=3D &quot;nativesdk-mesa&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#233603): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/233603" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/233603</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118416246/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118416246/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000bff09f064d7ee302--

