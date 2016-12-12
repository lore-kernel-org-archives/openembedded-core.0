Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1C9A760557
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 12:45:54 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id n21so81206527qka.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Dec 2016 04:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FtzJGg/3WudWvPhf23ORiCh5ra9qURjUY9VI9z+J7BA=;
	b=UJtCNnwzp6jM8frE9uJVB75A3bf+E533jwYKootnvyZea5qvAHvY+eJbLr4bySeCBq
	Xgd5ueE/ueZTrwd1lp4gp+J0+QGEQnsc+C5exG2qKeYse1viWUcNZKmDK5f77lIWR7zm
	+R7+Q/dy2zmRpwm3WKXWq35H/lNtiz+D4gJ1gR8Rgo/sJ7zu+F55IjVLlTw1d/w7LN+2
	8GXIndydBg8PQY3LDMrGyWfrm6S6rTv67QRaTzeXatpeTyBV7wz35pu+wLTBhPMJq2fE
	MMis5e6FB6YryEmsy9qXHmLr7RC9Xo3osRPNx/5G6xSEobDBcx17raooOirF7IXNy/Ez
	bwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FtzJGg/3WudWvPhf23ORiCh5ra9qURjUY9VI9z+J7BA=;
	b=bU04+cSyv2xPaaUZcC6oUvJp5yQ26SG6DHM3kyXw7oDlbxKUndDB994k7ru01or45B
	ocAcNz5ulGf2XaIpTf3rf38nzcybrRiu4nbX6c3vkFQTUF+jiODmOgm4o5Ln/jBVa4YD
	/BC0qpU1To/nEmdXcsASz46Jj4mSQgos2dvy0d8dK4hgCkFs28JuM4tZqQdUEDdB63np
	cxD10FveydmPvvuMyQ1YJYZOxD3CbnGHSSI3VqYtSLvR4Gq6PmB75Tf8dfCuUq2vnGiA
	OIbeKMpqdxK0LtVveuTQ5Fr4Fki/mJ0vBgMlacuIyhy6x7KdE+OTGgT6si5J9IQYumbq
	oruA==
X-Gm-Message-State: AKaTC03DOPVbmBTbB0FwUscFWXvSjABTWF341HrlaRXbv8pRAK3WIVtUn1TclaOMphlmW7cKOeinUOXrZI9dPzws
X-Received: by 10.55.39.88 with SMTP id n85mr77769914qkn.244.1481546755268;
	Mon, 12 Dec 2016 04:45:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Mon, 12 Dec 2016 04:45:34 -0800 (PST)
In-Reply-To: <20161211230719.28765-1-raj.khem@gmail.com>
References: <20161211230719.28765-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 12 Dec 2016 12:45:34 +0000
Message-ID: <CAJTo0La2dNp3SQ3AurR+QOq9mt-YgsMz6PVra56eJQVwXfvjpA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] fontconfig: Fix namespace conflicts with glibc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Dec 2016 12:45:55 -0000
Content-Type: multipart/alternative; boundary=94eb2c094b1610f54e0543757cf2

--94eb2c094b1610f54e0543757cf2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Has fallout, for example libxft:

| ../../libXft-2.3.2/src/xftfreetype.c:675:43: error: =E2=80=98FC_CHAR_WIDT=
H=E2=80=99
undeclared (first use in this function)

Ross

On 11 December 2016 at 23:07, Khem Raj <raj.khem@gmail.com> wrote:

> glibc 2.25 will come with TS 18661-1 macro definitions in limits.h which
> ends with following errors
>
> | ../../fontconfig-2.12.1/src/fcmatch.c:324:63: error:
> 'PRI_CHAR_WIDTH_STRONG' undeclared here (not in a function)
> |  #define FC_OBJECT(NAME, Type, Cmp) { FC_##NAME##_OBJECT, Cmp,
> PRI_##NAME##_STRONG, PRI_##NAME##_WEAK },
> |                                                                ^
> | ../../fontconfig-2.12.1/src/fcobjs.h:54:1: note: in expansion of macro
> 'FC_OBJECT'
> |  FC_OBJECT (CHAR_WIDTH,  FcTypeInteger, NULL)
> |  ^~~~~~~~~
> | ../../fontconfig-2.12.1/src/fcmatch.c:324:84: error:
> 'PRI_CHAR_WIDTH_WEAK' undeclared here (not in a function)
> |  #define FC_OBJECT(NAME, Type, Cmp) { FC_##NAME##_OBJECT, Cmp,
> PRI_##NAME##_STRONG, PRI_##NAME##_WEAK },
> |
>            ^
> | ../../fontconfig-2.12.1/src/fcobjs.h:54:1: note: in expansion of macro
> 'FC_OBJECT'
> |  FC_OBJECT (CHAR_WIDTH,  FcTypeInteger, NULL)
> |  ^~~~~~~~~
> | make[3]: *** [Makefile:632: fcmatch.lo] Error 1
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...icts-with-integer-width-macros-from-TS-18.patch | 74
> ++++++++++++++++++++++
>  .../fontconfig/fontconfig_2.12.1.bb                |  1 +
>  2 files changed, 75 insertions(+)
>  create mode 100644 meta/recipes-graphics/fontconfig/fontconfig/0001-
> Avoid-conflicts-with-integer-width-macros-from-TS-18.patch
>
> diff --git a/meta/recipes-graphics/fontconfig/fontconfig/0001-
> Avoid-conflicts-with-integer-width-macros-from-TS-18.patch
> b/meta/recipes-graphics/fontconfig/fontconfig/0001-
> Avoid-conflicts-with-integer-width-macros-from-TS-18.patch
> new file mode 100644
> index 0000000..326ff3c
> --- /dev/null
> +++ b/meta/recipes-graphics/fontconfig/fontconfig/0001-
> Avoid-conflicts-with-integer-width-macros-from-TS-18.patch
> @@ -0,0 +1,74 @@
> +From 20cddc824c6501c2082cac41b162c34cd5fcc530 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 11 Dec 2016 14:32:00 -0800
> +Subject: [PATCH] Avoid conflicts with integer width macros from TS
> + 18661-1:2014
> +
> +glibc 2.25+ has now defined these macros in <limits.h>
> +https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D
> 5b17fd0da62bf923cb61d1bb7b08cf2e1f1f9c1a
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> +Upstream-Status: Submitted
> +
> + fontconfig/fontconfig.h | 2 +-
> + src/fcobjs.h            | 2 +-
> + src/fcobjshash.gperf    | 2 +-
> + src/fcobjshash.h        | 2 +-
> + 4 files changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/fontconfig/fontconfig.h b/fontconfig/fontconfig.h
> +index 5c72b22..843c532 100644
> +--- a/fontconfig/fontconfig.h
> ++++ b/fontconfig/fontconfig.h
> +@@ -128,7 +128,7 @@ typedef int                FcBool;
> + #define FC_USER_CACHE_FILE        ".fonts.cache-" FC_CACHE_VERSION
> +
> + /* Adjust outline rasterizer */
> +-#define FC_CHAR_WIDTH     "charwidth" /* Int */
> ++#define FC_CHARWIDTH      "charwidth" /* Int */
> + #define FC_CHAR_HEIGHT            "charheight"/* Int */
> + #define FC_MATRIX         "matrix"    /* FcMatrix */
> +
> +diff --git a/src/fcobjs.h b/src/fcobjs.h
> +index 1fc4f65..d27864b 100644
> +--- a/src/fcobjs.h
> ++++ b/src/fcobjs.h
> +@@ -51,7 +51,7 @@ FC_OBJECT (DPI,                      FcTypeDouble,
>  NULL)
> + FC_OBJECT (RGBA,              FcTypeInteger,  NULL)
> + FC_OBJECT (SCALE,             FcTypeDouble,   NULL)
> + FC_OBJECT (MINSPACE,          FcTypeBool,     NULL)
> +-FC_OBJECT (CHAR_WIDTH,                FcTypeInteger,  NULL)
> ++FC_OBJECT (CHARWIDTH,         FcTypeInteger,  NULL)
> + FC_OBJECT (CHAR_HEIGHT,               FcTypeInteger,  NULL)
> + FC_OBJECT (MATRIX,            FcTypeMatrix,   NULL)
> + FC_OBJECT (CHARSET,           FcTypeCharSet,  FcCompareCharSet)
> +diff --git a/src/fcobjshash.gperf b/src/fcobjshash.gperf
> +index 80a0237..eb4ad84 100644
> +--- a/src/fcobjshash.gperf
> ++++ b/src/fcobjshash.gperf
> +@@ -44,7 +44,7 @@ int id;
> + "rgba",FC_RGBA_OBJECT
> + "scale",FC_SCALE_OBJECT
> + "minspace",FC_MINSPACE_OBJECT
> +-"charwidth",FC_CHAR_WIDTH_OBJECT
> ++"charwidth",FC_CHARWIDTH_OBJECT
> + "charheight",FC_CHAR_HEIGHT_OBJECT
> + "matrix",FC_MATRIX_OBJECT
> + "charset",FC_CHARSET_OBJECT
> +diff --git a/src/fcobjshash.h b/src/fcobjshash.h
> +index 5a4d1ea..4e66bb0 100644
> +--- a/src/fcobjshash.h
> ++++ b/src/fcobjshash.h
> +@@ -284,7 +284,7 @@ FcObjectTypeLookup (register const char *str,
> register unsigned int len)
> +       {(int)(long)&((struct FcObjectTypeNamePool_t
> *)0)->FcObjectTypeNamePool_str43,FC_CHARSET_OBJECT},
> +       {-1},
> + #line 47 "fcobjshash.gperf"
> +-      {(int)(long)&((struct FcObjectTypeNamePool_t
> *)0)->FcObjectTypeNamePool_str45,FC_CHAR_WIDTH_OBJECT},
> ++      {(int)(long)&((struct FcObjectTypeNamePool_t
> *)0)->FcObjectTypeNamePool_str45,FC_CHARWIDTH_OBJECT},
> + #line 48 "fcobjshash.gperf"
> +       {(int)(long)&((struct FcObjectTypeNamePool_t
> *)0)->FcObjectTypeNamePool_str46,FC_CHAR_HEIGHT_OBJECT},
> + #line 55 "fcobjshash.gperf"
> +--
> +2.10.2
> +
> diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.12.1.bb
> b/meta/recipes-graphics/fontconfig/fontconfig_2.12.1.bb
> index 115f558..8616154 100644
> --- a/meta/recipes-graphics/fontconfig/fontconfig_2.12.1.bb
> +++ b/meta/recipes-graphics/fontconfig/fontconfig_2.12.1.bb
> @@ -22,6 +22,7 @@ DEPENDS =3D "expat freetype zlib"
>
>  SRC_URI =3D "http://fontconfig.org/release/fontconfig-${PV}.tar.gz \
>             file://revert-static-pkgconfig.patch \
> +           file://0001-Avoid-conflicts-with-integer-width-macros-from-TS=
-18.patch
> \
>             "
>  SRC_URI[md5sum] =3D "ce55e525c37147eee14cc2de6cc09f6c"
>  SRC_URI[sha256sum] =3D "a9f42d03949f948a3a4f762287dbc1
> 6e53a927c91a07ee64207ebd90a9e5e292"
> --
> 2.10.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c094b1610f54e0543757cf2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Has fallout, for example libxft:<div><br></div><div>| ../.=
./libXft-2.3.2/src/xftfreetype.c:675:43: error: =E2=80=98FC_CHAR_WIDTH=E2=
=80=99 undeclared (first use in this function)<br></div><div><br></div><div=
>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 December 2016 at 23:07, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">glibc 2.25 will come with TS 1866=
1-1 macro definitions in limits.h which ends with following errors<br>
<br>
| ../../fontconfig-2.12.1/src/<wbr>fcmatch.c:324:63: error: &#39;PRI_CHAR_W=
IDTH_STRONG&#39; undeclared here (not in a function)<br>
|=C2=A0 #define FC_OBJECT(NAME, Type, Cmp) { FC_##NAME##_OBJECT, Cmp, PRI_#=
#NAME##_STRONG, PRI_##NAME##_WEAK },<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ^<br>
| ../../fontconfig-2.12.1/src/<wbr>fcobjs.h:54:1: note: in expansion of mac=
ro &#39;FC_OBJECT&#39;<br>
|=C2=A0 FC_OBJECT (CHAR_WIDTH,=C2=A0 FcTypeInteger, NULL)<br>
|=C2=A0 ^~~~~~~~~<br>
| ../../fontconfig-2.12.1/src/<wbr>fcmatch.c:324:84: error: &#39;PRI_CHAR_W=
IDTH_WEAK&#39; undeclared here (not in a function)<br>
|=C2=A0 #define FC_OBJECT(NAME, Type, Cmp) { FC_##NAME##_OBJECT, Cmp, PRI_#=
#NAME##_STRONG, PRI_##NAME##_WEAK },<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0^<br>
| ../../fontconfig-2.12.1/src/<wbr>fcobjs.h:54:1: note: in expansion of mac=
ro &#39;FC_OBJECT&#39;<br>
|=C2=A0 FC_OBJECT (CHAR_WIDTH,=C2=A0 FcTypeInteger, NULL)<br>
|=C2=A0 ^~~~~~~~~<br>
| make[3]: *** [Makefile:632: fcmatch.lo] Error 1<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@=
gmail.com</a>&gt;<br>
---<br>
=C2=A0...icts-with-integer-width-<wbr>macros-from-TS-18.patch | 74 ++++++++=
++++++++++++++<br>
=C2=A0.../fontconfig/<a href=3D"http://fontconfig_2.12.1.bb" rel=3D"norefer=
rer" target=3D"_blank">fontconfig_2.<wbr>12.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
=C2=A02 files changed, 75 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-graphics/<wbr>fontconfig/fontconfig/0=
001-<wbr>Avoid-conflicts-with-integer-<wbr>width-macros-from-TS-18.patch<br=
>
<br>
diff --git a/meta/recipes-graphics/<wbr>fontconfig/fontconfig/0001-<wbr>Avo=
id-conflicts-with-integer-<wbr>width-macros-from-TS-18.patch b/meta/recipes=
-graphics/<wbr>fontconfig/fontconfig/0001-<wbr>Avoid-conflicts-with-integer=
-<wbr>width-macros-from-TS-18.patch<br>
new file mode 100644<br>
index 0000000..326ff3c<br>
--- /dev/null<br>
+++ b/meta/recipes-graphics/<wbr>fontconfig/fontconfig/0001-<wbr>Avoid-conf=
licts-with-integer-<wbr>width-macros-from-TS-18.patch<br>
@@ -0,0 +1,74 @@<br>
+From 20cddc824c6501c2082cac41b162c3<wbr>4cd5fcc530 Mon Sep 17 00:00:00 200=
1<br>
+From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
+Date: Sun, 11 Dec 2016 14:32:00 -0800<br>
+Subject: [PATCH] Avoid conflicts with integer width macros from TS<br>
+ 18661-1:2014<br>
+<br>
+glibc 2.25+ has now defined these macros in &lt;limits.h&gt;<br>
+<a href=3D"https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3D5b17fd=
0da62bf923cb61d1bb7b08cf2e1f1f9c1a" rel=3D"noreferrer" target=3D"_blank">ht=
tps://sourceware.org/git/?<wbr>p=3Dglibc.git;a=3Dcommit;h=3D<wbr>5b17fd0da6=
2bf923cb61d1bb7b08cf<wbr>2e1f1f9c1a</a><br>
+<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
+---<br>
+Upstream-Status: Submitted<br>
+<br>
+ fontconfig/fontconfig.h | 2 +-<br>
+ src/fcobjs.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
+ src/fcobjshash.gperf=C2=A0 =C2=A0 | 2 +-<br>
+ src/fcobjshash.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
+ 4 files changed, 4 insertions(+), 4 deletions(-)<br>
+<br>
+diff --git a/fontconfig/fontconfig.h b/fontconfig/fontconfig.h<br>
+index 5c72b22..843c532 100644<br>
+--- a/fontconfig/fontconfig.h<br>
++++ b/fontconfig/fontconfig.h<br>
+@@ -128,7 +128,7 @@ typedef int=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 FcBool;<br>
+ #define FC_USER_CACHE_FILE=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;.fonts.cache-=
&quot; FC_CACHE_VERSION<br>
+<br>
+ /* Adjust outline rasterizer */<br>
+-#define FC_CHAR_WIDTH=C2=A0 =C2=A0 =C2=A0&quot;charwidth&quot; /* Int */<=
br>
++#define FC_CHARWIDTH=C2=A0 =C2=A0 =C2=A0 &quot;charwidth&quot; /* Int */<=
br>
+ #define FC_CHAR_HEIGHT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;cha=
rheight&quot;/* Int */<br>
+ #define FC_MATRIX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;matrix&quot;=C2=
=A0 =C2=A0 /* FcMatrix */<br>
+<br>
+diff --git a/src/fcobjs.h b/src/fcobjs.h<br>
+index 1fc4f65..d27864b 100644<br>
+--- a/src/fcobjs.h<br>
++++ b/src/fcobjs.h<br>
+@@ -51,7 +51,7 @@ FC_OBJECT (DPI,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FcTypeDouble,=C2=A0 =C2=A0NULL)<br>
+ FC_OBJECT (RGBA,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FcTypeIn=
teger,=C2=A0 NULL)<br>
+ FC_OBJECT (SCALE,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FcTypeDo=
uble,=C2=A0 =C2=A0NULL)<br>
+ FC_OBJECT (MINSPACE,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FcTypeBool,=C2=A0 =
=C2=A0 =C2=A0NULL)<br>
+-FC_OBJECT (CHAR_WIDTH,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 FcTypeInteger,=C2=A0 NULL)<br>
++FC_OBJECT (CHARWIDTH,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FcTypeInteger,=C2=
=A0 NULL)<br>
+ FC_OBJECT (CHAR_HEIGHT,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0FcTypeInteger,=C2=A0 NULL)<br>
+ FC_OBJECT (MATRIX,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FcTypeMatrix,=
=C2=A0 =C2=A0NULL)<br>
+ FC_OBJECT (CHARSET,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FcTypeCharSet=
,=C2=A0 FcCompareCharSet)<br>
+diff --git a/src/fcobjshash.gperf b/src/fcobjshash.gperf<br>
+index 80a0237..eb4ad84 100644<br>
+--- a/src/fcobjshash.gperf<br>
++++ b/src/fcobjshash.gperf<br>
+@@ -44,7 +44,7 @@ int id;<br>
+ &quot;rgba&quot;,FC_RGBA_OBJECT<br>
+ &quot;scale&quot;,FC_SCALE_OBJECT<br>
+ &quot;minspace&quot;,FC_MINSPACE_OBJECT<br>
+-&quot;charwidth&quot;,FC_CHAR_WIDTH_<wbr>OBJECT<br>
++&quot;charwidth&quot;,FC_CHARWIDTH_<wbr>OBJECT<br>
+ &quot;charheight&quot;,FC_CHAR_HEIGHT_<wbr>OBJECT<br>
+ &quot;matrix&quot;,FC_MATRIX_OBJECT<br>
+ &quot;charset&quot;,FC_CHARSET_OBJECT<br>
+diff --git a/src/fcobjshash.h b/src/fcobjshash.h<br>
+index 5a4d1ea..4e66bb0 100644<br>
+--- a/src/fcobjshash.h<br>
++++ b/src/fcobjshash.h<br>
+@@ -284,7 +284,7 @@ FcObjectTypeLookup (register const char *str, register=
 unsigned int len)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{(int)(long)&amp;((struct FcObjectTypeNamePool_=
t *)0)-&gt;FcObjectTypeNamePool_<wbr>str43,FC_CHARSET_OBJECT},<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{-1},<br>
+ #line 47 &quot;fcobjshash.gperf&quot;<br>
+-=C2=A0 =C2=A0 =C2=A0 {(int)(long)&amp;((struct FcObjectTypeNamePool_t *)0=
)-&gt;FcObjectTypeNamePool_<wbr>str45,FC_CHAR_WIDTH_OBJECT},<br>
++=C2=A0 =C2=A0 =C2=A0 {(int)(long)&amp;((struct FcObjectTypeNamePool_t *)0=
)-&gt;FcObjectTypeNamePool_<wbr>str45,FC_CHARWIDTH_OBJECT},<br>
+ #line 48 &quot;fcobjshash.gperf&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{(int)(long)&amp;((struct FcObjectTypeNamePool_=
t *)0)-&gt;FcObjectTypeNamePool_<wbr>str46,FC_CHAR_HEIGHT_OBJECT},<br>
+ #line 55 &quot;fcobjshash.gperf&quot;<br>
+--<br>
+2.10.2<br>
+<br>
diff --git a/meta/recipes-graphics/<wbr>fontconfig/<a href=3D"http://fontco=
nfig_2.12.1.bb" rel=3D"noreferrer" target=3D"_blank">fontconfig_2.12.1.<wbr=
>bb</a> b/meta/recipes-graphics/<wbr>fontconfig/<a href=3D"http://fontconfi=
g_2.12.1.bb" rel=3D"noreferrer" target=3D"_blank">fontconfig_2.12.1.<wbr>bb=
</a><br>
index 115f558..8616154 100644<br>
--- a/meta/recipes-graphics/<wbr>fontconfig/<a href=3D"http://fontconfig_2.=
12.1.bb" rel=3D"noreferrer" target=3D"_blank">fontconfig_2.12.1.<wbr>bb</a>=
<br>
+++ b/meta/recipes-graphics/<wbr>fontconfig/<a href=3D"http://fontconfig_2.=
12.1.bb" rel=3D"noreferrer" target=3D"_blank">fontconfig_2.12.1.<wbr>bb</a>=
<br>
@@ -22,6 +22,7 @@ DEPENDS =3D &quot;expat freetype zlib&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://fontconfig.org/release/fontconfig=
-${PV}.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://fontconfig.org/<=
wbr>release/fontconfig-${PV}.tar.<wbr>gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://revert-static-<wbr>pkgconf=
ig.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Avoid-conflicts-<wbr>=
with-integer-width-macros-<wbr>from-TS-18.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>ce55e525c37147eee14cc2de6cc09f<wbr>6c&=
quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;<wbr>a9f42d03949f948a3a4f762287dbc1<wbr>=
6e53a927c91a07ee64207ebd90a9e5<wbr>e292&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.10.2<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--94eb2c094b1610f54e0543757cf2--
