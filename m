Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE534CFA443
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 20:29:37 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4230.1763670568980829024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 12:29:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DQaWbmbn;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: raj.khem@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-640aaa89697so1844658a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 12:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763670567; x=1764275367; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qx6cVH0HW5+rVRVmUoB1Cv21CMFBXjrDogwiXrdj2Xw=;
        b=DQaWbmbn6Rua1cZT0Ae0ZYR4mm0af4W/X3yyQ5u8qqLz7LccsUhMaWbPNmNS7Wp5/O
         yULM9+E5B0QoSa9jafsBvvyb3oOuLiEjzWlM+uPqAjOX7Ia2KZX3l6m2Sjui9cwdeVFy
         ZtTL17+LGv7CfHiszpZV/4J3yPCgrEo0kHS88mYk5C8u+En7pRfJZr08Hypnwm4rW5yS
         c5yk7iQLjv3so8SZ1yv+5Xob0OooFyql/jNmKvQodwqrcoU6Vd27BHPcaT1ZupC33OwY
         lMctc1CcpVVWcvkphLqqxEkewKV7SPcizbeGQkiQi7wsE4joKEQERhMJjHuHNnJs8qh5
         QZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763670567; x=1764275367;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qx6cVH0HW5+rVRVmUoB1Cv21CMFBXjrDogwiXrdj2Xw=;
        b=qux9/gKnyEvXhbmybRnvxpQRQoGKnPIVHneyU1XY4sAYP/Zo5q/4NGD+2UfN/LO2EW
         WDjDMoVr9c+0Dv2rMPkO3Tr6m39B7fL0rU80EipebY0xRk7fmbc+1NVD9ZQ3pFg1Hk7n
         HYNoGjJXZmVLwqbK0sA3Hh0zUlmTma9IujXqYC6Exj3uq/8TUI5feoio+eAH13Ja0CU0
         27PSkXnW5zaM60ct+zp/qBDg2RxH5NMOPzj2bBJv0bpQPbK+6x1yyPLc7e0gpMITZneC
         y5b0yyFxdmdr6jQxQjH5UVKGmw3oMvthi2wX5WeBULHFng31Ee3F6pWnwAnudw4tPQ7J
         9iDQ==
X-Gm-Message-State: AOJu0Yy3f/DFzVk4tZhJBhrQdFBX8hmiXes3Bs+0a7brL9Lobzy7Me+9
	LZhIkHnu31qjG+AF9oB2Kzaaw0oZKcaDM1paRoK38Od19+sLxkljDNre7GWs7Vb2BUjdlTtiWpe
	A8RMiVXpp0RwE/5w1Gmq2vg0xrihT/5E=
X-Gm-Gg: ASbGnctNMF4mrhy/5zaFctXhmBQ5ncoIBj0+ZFtEcbDOqqFKzuiFF7KjUqqv/taYFEw
	LgYsrmy7qErsq+w/lOmlDhsas6HZXmuHDEe7kJTQ8dDdkiUEjPPsZLSZLb5yg1ssZl0rA4JbKQW
	6pOqvE8UnORgpBG7uqhha3t1bPE2nHRO7W4JZFtUfh08r7WKW5VynuQaIp/pY+AsOOYGQZD73f4
	29F+gnI9x8LZUKKkEhermNnNyMxm8xTVlFByucM/GDiYA/qZD6W3Qkx5LnsABZVGUQOufAreHeP
	TFFKkmBvJNsm5/oZ0ral1dw7n6wANm4OsvAh719Gyhu0L+eHY4NzM/qF0Z6OLDb5yJCJA/GKDjH
	0H5OH+zNlcMEWty8e8y7L+cnNOl0rRmcuBpCCTxUiSe2k4g==
X-Google-Smtp-Source: AGHT+IGOK5RB0qjN3vhsgIwNdXO/jmMnWUw1S/Ym519W3jyO4TB2rUl4fuQZGmPh/cLlME5kv1+d3+cC4lzchfH4kp0=
X-Received: by 2002:a05:6402:1ed6:b0:640:abd5:864d with SMTP id
 4fb4d7f45d1cf-645546855cdmr17689a12.21.1763670567098; Thu, 20 Nov 2025
 12:29:27 -0800 (PST)
MIME-Version: 1.0
References: <20251120121947.3473848-1-skandigraun@gmail.com> <20251120121947.3473848-2-skandigraun@gmail.com>
In-Reply-To: <20251120121947.3473848-2-skandigraun@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Nov 2025 12:28:59 -0800
X-Gm-Features: AWmQ_bnSV0gxlXh1ghVoujbOk1m4iYDUQNJ6e5RgEaDhW8r7Z_WJ7TK96Q8oHdo
Message-ID: <CAMKF1sp=cf43ctwARpH0q44rL42ShD3vh2S+RtKzweYT5V75gw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] bitbake.conf, gcc toolchain: add
 -fcanon-prefix-map to map-prefixes
To: skandigraun@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a71cef06440c8db7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 20:29:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226637

--000000000000a71cef06440c8db7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looks good to me. Covers all cases that I brought up.

On Thu, Nov 20, 2025 at 4:19=E2=80=AFAM Gyorgy Sarvari via lists.openembedd=
ed.org
<skandigraun=3Dgmail.com@lists.openembedded.org> wrote:

> This patch adds -fcanon-prefix-map to the list of compile file-prefixes
> list in case at least gcc 13 is used (it's a gcc-only flag).
>
> This flag used to be part of this list in the past, but was removed with
> [1].
>
> Since then the source file paths are not canonicalized, which makes
> the system to miss some (and sometimes all) source files to include
> in the corresponding -src packages. As an example sqlite3 and audiofile
> (from meta-oe) produces empty src packages, mostly due to the pathes:
> they frequently use relative paths that don't match up with the
> absolute path specified in the file-preifx map:
> `pwd`/../../foo.cpp and ${S}/foo.cpp might refer to the same file, but
> the first one won't match the prefix-map, so it is omitted.
>
> This patch adds this option again with gcc: for class-target it is uses
> always, and for class-native it is used when the host gcc is at least
> version 13.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  meta/classes/toolchain/gcc-native.bbclass | 3 +++
>  meta/classes/toolchain/gcc.bbclass        | 2 ++
>  meta/conf/bitbake.conf                    | 2 +-
>  3 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/toolchain/gcc-native.bbclass
> b/meta/classes/toolchain/gcc-native.bbclass
> index a708bd0389..8708ad0211 100644
> --- a/meta/classes/toolchain/gcc-native.bbclass
> +++ b/meta/classes/toolchain/gcc-native.bbclass
> @@ -13,3 +13,6 @@ BUILD_OBJDUMP =3D "${BUILD_PREFIX}objdump"
>  BUILD_NM =3D "${BUILD_PREFIX}nm"
>  BUILD_READELF =3D "${BUILD_PREFIX}readelf"
>
> +# gcc started to support -fcanon-prefix-map from version 13
> +DEBUG_PREFIX_MAP_EXTRA:class-native =3D \
> +    "${@'-fcanon-prefix-map' if
> bb.utils.vercmp_string_op(oe.utils.get_host_gcc_version(d), '13.0.0', '>=
=3D')
> else ''}"
> diff --git a/meta/classes/toolchain/gcc.bbclass
> b/meta/classes/toolchain/gcc.bbclass
> index a5adb5ca37..0ed49ba892 100644
> --- a/meta/classes/toolchain/gcc.bbclass
> +++ b/meta/classes/toolchain/gcc.bbclass
> @@ -30,4 +30,6 @@
> PREFERRED_PROVIDER_virtual/nativesdk-cross-cc:class-cross-canadian =3D
> "gcc-crosss
>  PREFERRED_PROVIDER_virtual/nativesdk-cross-c++:class-cross-canadian =3D
> "gcc-crosssdk-${SDK_SYS}"
>  PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs:class-cross-canadian =
=3D
> "nativesdk-gcc-runtime"
>
> +DEBUG_PREFIX_MAP_EXTRA =3D "-fcanon-prefix-map"
> +
>  TCOVERRIDE =3D "toolchain-gcc"
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 5406e542db..600d4baffb 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -650,7 +650,7 @@ EXTRA_OEMAKE:prepend:task-install =3D
> "${PARALLEL_MAKEINST} "
>  ##################################################################
>  TARGET_DBGSRC_DIR ?=3D "/usr/src/debug/${PN}/${PV}"
>  # Beware: applied last to first
> -DEBUG_PREFIX_MAP ?=3D "\
> +DEBUG_PREFIX_MAP ?=3D "${DEBUG_PREFIX_MAP_EXTRA} \
>   -ffile-prefix-map=3D${S}=3D${TARGET_DBGSRC_DIR} \
>   -ffile-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR} \
>   -ffile-prefix-map=3D${STAGING_DIR_HOST}=3D \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226618):
> https://lists.openembedded.org/g/openembedded-core/message/226618
> Mute This Topic: https://lists.openembedded.org/mt/116389619/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000a71cef06440c8db7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Looks good to me. Covers all cases that I brought up.</div=
><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Thu, Nov 20, 2025 at 4:19=E2=80=AFAM Gyorgy Sarvari via=
 <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;s=
kandigraun=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@=
lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">This patch adds -fcanon-prefix-map to the list of com=
pile file-prefixes<br>
list in case at least gcc 13 is used (it&#39;s a gcc-only flag).<br>
<br>
This flag used to be part of this list in the past, but was removed with [1=
].<br>
<br>
Since then the source file paths are not canonicalized, which makes<br>
the system to miss some (and sometimes all) source files to include<br>
in the corresponding -src packages. As an example sqlite3 and audiofile<br>
(from meta-oe) produces empty src packages, mostly due to the pathes:<br>
they frequently use relative paths that don&#39;t match up with the<br>
absolute path specified in the file-preifx map:<br>
`pwd`/../../foo.cpp and ${S}/foo.cpp might refer to the same file, but<br>
the first one won&#39;t match the prefix-map, so it is omitted.<br>
<br>
This patch adds this option again with gcc: for class-target it is uses<br>
always, and for class-native it is used when the host gcc is at least<br>
version 13.<br>
<br>
Signed-off-by: Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com" =
target=3D"_blank">skandigraun@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/toolchain/gcc-native.bbclass | 3 +++<br>
=C2=A0meta/classes/toolchain/gcc.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++<=
br>
=C2=A0meta/conf/bitbake.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A03 files changed, 6 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/toolchain/gcc-native.bbclass b/meta/classes/toolc=
hain/gcc-native.bbclass<br>
index a708bd0389..8708ad0211 100644<br>
--- a/meta/classes/toolchain/gcc-native.bbclass<br>
+++ b/meta/classes/toolchain/gcc-native.bbclass<br>
@@ -13,3 +13,6 @@ BUILD_OBJDUMP =3D &quot;${BUILD_PREFIX}objdump&quot;<br>
=C2=A0BUILD_NM =3D &quot;${BUILD_PREFIX}nm&quot;<br>
=C2=A0BUILD_READELF =3D &quot;${BUILD_PREFIX}readelf&quot;<br>
<br>
+# gcc started to support -fcanon-prefix-map from version 13<br>
+DEBUG_PREFIX_MAP_EXTRA:class-native =3D \<br>
+=C2=A0 =C2=A0 &quot;${@&#39;-fcanon-prefix-map&#39; if bb.utils.vercmp_str=
ing_op(oe.utils.get_host_gcc_version(d), &#39;13.0.0&#39;, &#39;&gt;=3D&#39=
;) else &#39;&#39;}&quot;<br>
diff --git a/meta/classes/toolchain/gcc.bbclass b/meta/classes/toolchain/gc=
c.bbclass<br>
index a5adb5ca37..0ed49ba892 100644<br>
--- a/meta/classes/toolchain/gcc.bbclass<br>
+++ b/meta/classes/toolchain/gcc.bbclass<br>
@@ -30,4 +30,6 @@ PREFERRED_PROVIDER_virtual/nativesdk-cross-cc:class-cross=
-canadian =3D &quot;gcc-crosss<br>
=C2=A0PREFERRED_PROVIDER_virtual/nativesdk-cross-c++:class-cross-canadian =
=3D &quot;gcc-crosssdk-${SDK_SYS}&quot;<br>
=C2=A0PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs:class-cross-canadia=
n =3D &quot;nativesdk-gcc-runtime&quot;<br>
<br>
+DEBUG_PREFIX_MAP_EXTRA =3D &quot;-fcanon-prefix-map&quot;<br>
+<br>
=C2=A0TCOVERRIDE =3D &quot;toolchain-gcc&quot;<br>
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
index 5406e542db..600d4baffb 100644<br>
--- a/meta/conf/bitbake.conf<br>
+++ b/meta/conf/bitbake.conf<br>
@@ -650,7 +650,7 @@ EXTRA_OEMAKE:prepend:task-install =3D &quot;${PARALLEL_=
MAKEINST} &quot;<br>
=C2=A0##################################################################<br=
>
=C2=A0TARGET_DBGSRC_DIR ?=3D &quot;/usr/src/debug/${PN}/${PV}&quot;<br>
=C2=A0# Beware: applied last to first<br>
-DEBUG_PREFIX_MAP ?=3D &quot;\<br>
+DEBUG_PREFIX_MAP ?=3D &quot;${DEBUG_PREFIX_MAP_EXTRA} \<br>
=C2=A0 -ffile-prefix-map=3D${S}=3D${TARGET_DBGSRC_DIR} \<br>
=C2=A0 -ffile-prefix-map=3D${B}=3D${TARGET_DBGSRC_DIR} \<br>
=C2=A0 -ffile-prefix-map=3D${STAGING_DIR_HOST}=3D \<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#226618): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/226618" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/226618</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116389619/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116389619/1997914</a><br>
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

--000000000000a71cef06440c8db7--

