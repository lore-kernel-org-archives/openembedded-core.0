Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4677B73DA5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 May 2015 15:47:18 +0000 (UTC)
Received: by qcbgu10 with SMTP id gu10so4915437qcb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 May 2015 08:47:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=VXkZUhKxRgWAnYgg1MaOtzqgVsACMfcrXzTF1R3DQOI=;
	b=hP/l21//0hgABGUky58lcAtlV6uROXe/4qqq5ID+eSPoCY6PjxARqQkwnGLg2Aha3U
	H5ioAB9iNFuAiPFeq0CeeCAAZ9VQ+/Ytd2NfMqPNyHV5NZUm/K6VNye+/aKVpNup9qth
	qW2VydikXedtx/G8+zb4bSCLsGRBoSGXPl2t2mHLwzDaa4Cs3H0705mdz4M1NMX09a/I
	kemJXma/s8nJHm3w2/cjOyECWnjLVxl/dYWFI+CTZU7ZYUAZMLWmiYlZt2Ve2P3KLOKN
	ZkaloyEh0rKLOBSo7hmMEE5bo1XFPcFGTB2iZ/fPn9jGVAwgbJ6/bE1RrNUy8GzsrPbG
	6nJw==
X-Gm-Message-State: ALoCoQnLuKq1eydiAD54Q3rDyZWaXBKH11yjOp4vGZduvPD7TlRI1JZzj90+pg5eKZWaqk6K+5e9
X-Received: by 10.140.88.35 with SMTP id s32mr11353336qgd.59.1430495239456;
	Fri, 01 May 2015 08:47:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 1 May 2015 08:46:58 -0700 (PDT)
In-Reply-To: <7109a33ad37ba0f8193de18a2c7f113acc087990.1430292378.git.liezhi.yang@windriver.com>
References: <cover.1430292378.git.liezhi.yang@windriver.com>
	<7109a33ad37ba0f8193de18a2c7f113acc087990.1430292378.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 May 2015 16:46:58 +0100
Message-ID: <CAJTo0LZcADEC1Y3rjcEs61+S8jSe9C+28sT0r2xvGpSO5vR3Xw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libxml2: fix python path and add libxml2-python
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
X-List-Received-Date: Fri, 01 May 2015 15:47:20 -0000
Content-Type: multipart/alternative; boundary=001a11c11d0299e0c805150720ab

--001a11c11d0299e0c805150720ab
Content-Type: text/plain; charset=UTF-8

buildhistory says:

packages/corei7-64-poky-linux/libxml2/libxml2: RDEPENDS: added "python-core"

Why does the library package gain a dependency on python?

Ross

On 29 April 2015 at 08:26, Robert Yang <liezhi.yang@windriver.com> wrote:

> We have libxml2-python for native and nativesdk, but don't have it for
> target, and can't find the reason from the git log, libxml2-python is
> widely used, after looked into it's configure.in, we can add it
> by PACKAGECONFIG.
>
> The previous --with-python=${STAGING_BINDIR}/python is incorrect, it
> acted as work becase it's conigure can check automatically, python is in
> ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}, as known as
> ${PYTHON}.
>
> Add python to PACKAGECONFIG, since createrepo rdepends on
> libxml2-python, otherwise the target createrepo can't work.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-core/libxml/libxml2.inc |   18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
>
> diff --git a/meta/recipes-core/libxml/libxml2.inc
> b/meta/recipes-core/libxml/libxml2.inc
> index 1314bbf..4886705 100644
> --- a/meta/recipes-core/libxml/libxml2.inc
> +++ b/meta/recipes-core/libxml/libxml2.inc
> @@ -9,8 +9,6 @@ LIC_FILES_CHKSUM =
> "file://Copyright;md5=2044417e2e5006b65a8b9067b683fcf1 \
>
>  file://list.c;beginline=4;endline=13;md5=cdbfa3dee51c099edb04e39f762ee907 \
>
>  file://trio.c;beginline=5;endline=14;md5=6c025753c86d958722ec76e94cae932e"
>
> -DEPENDS_class-nativesdk = "nativesdk-python"
> -DEPENDS_class-native = "python-native"
>  DEPENDS =+ "zlib"
>
>  SRC_URI = "ftp://xmlsoft.org/libxml2/libxml2-${PV}.tar.gz;name=libtar \
> @@ -37,16 +35,16 @@ do_configure_prepend () {
>         sed -i -e '/.*ansidecl.h.*/d' ${S}/configure.ac
>  }
>
> -do_configure_prepend_class-nativesdk () {
> -       # Ensure we get the correct site-packages path
> -       export PYTHON_SITE_PACKAGES="${PYTHON_SITEPACKAGES_DIR}"
> -}
> +export PYTHON_SITE_PACKAGES="${PYTHON_SITEPACKAGES_DIR}"
> +
> +PACKAGECONFIG ??= "python"
>
> +PACKAGECONFIG[python] =
> "--with-python=${PYTHON},--without-python,python,python-core"
>  # WARNING: zlib is require for RPM use
> -EXTRA_OECONF = "--without-python --without-debug --without-legacy
> --with-catalog --without-docbook --with-c14n --without-lzma
> --with-fexceptions"
> -EXTRA_OECONF_class-native = "--with-python=${STAGING_BINDIR}/python
> --without-legacy --without-docbook --with-c14n --without-lzma --with-zlib"
> -EXTRA_OECONF_class-nativesdk = "--with-python=${STAGING_BINDIR}/python
> --without-legacy --without-docbook --with-c14n --without-lzma --with-zlib"
> -EXTRA_OECONF_linuxstdbase = "--without-python --with-debug --with-legacy
> --with-docbook --with-c14n --without-lzma --with-zlib"
> +EXTRA_OECONF = "--without-debug --without-legacy --with-catalog
> --without-docbook --with-c14n --without-lzma --with-fexceptions"
> +EXTRA_OECONF_class-native = "--without-legacy --without-docbook
> --with-c14n --without-lzma --with-zlib"
> +EXTRA_OECONF_class-nativesdk = "--without-legacy --without-docbook
> --with-c14n --without-lzma --with-zlib"
> +EXTRA_OECONF_linuxstdbase = "--with-debug --with-legacy --with-docbook
> --with-c14n --without-lzma --with-zlib"
>
>  # required for pythong binding
>  export HOST_SYS
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11c11d0299e0c805150720ab
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>buildhistory says:</div><div><br></div>packages/corei=
7-64-poky-linux/libxml2/libxml2: RDEPENDS: added &quot;python-core&quot;<br=
><div><br></div><div>Why does the library package gain a dependency on pyth=
on?</div><div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br=
><div class=3D"gmail_quote">On 29 April 2015 at 08:26, Robert Yang <span di=
r=3D"ltr">&lt;<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank=
">liezhi.yang@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">We have libxml2-python for native and nativesdk, but don&#39;t hav=
e it for<br>
target, and can&#39;t find the reason from the git log, libxml2-python is<b=
r>
widely used, after looked into it&#39;s <a href=3D"http://configure.in" tar=
get=3D"_blank">configure.in</a>, we can add it<br>
by PACKAGECONFIG.<br>
<br>
The previous --with-python=3D${STAGING_BINDIR}/python is incorrect, it<br>
acted as work becase it&#39;s conigure can check automatically, python is i=
n<br>
${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}, as known as<br>
${PYTHON}.<br>
<br>
Add python to PACKAGECONFIG, since createrepo rdepends on<br>
libxml2-python, otherwise the target createrepo can&#39;t work.<br>
<br>
Signed-off-by: Robert Yang &lt;<a href=3D"mailto:liezhi.yang@windriver.com"=
>liezhi.yang@windriver.com</a>&gt;<br>
---<br>
<span class=3D"">=C2=A0meta/recipes-core/libxml/libxml2.inc |=C2=A0 =C2=A01=
8 ++++++++----------<br>
=C2=A01 file changed, 8 insertions(+), 10 deletions(-)<br>
<br>
</span>diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-cor=
e/libxml/libxml2.inc<br>
index 1314bbf..4886705 100644<br>
--- a/meta/recipes-core/libxml/libxml2.inc<br>
+++ b/meta/recipes-core/libxml/libxml2.inc<br>
@@ -9,8 +9,6 @@ LIC_FILES_CHKSUM =3D &quot;file://Copyright;md5=3D2044417e2=
e5006b65a8b9067b683fcf1 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://list.c;beginline=3D4;endline=3D13;md5=3Dcdbfa3dee51c099edb04e39f7=
62ee907 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://trio.c;beginline=3D5;endline=3D14;md5=3D6c025753c86d958722ec76e94=
cae932e&quot;<br>
<br>
-DEPENDS_class-nativesdk =3D &quot;nativesdk-python&quot;<br>
-DEPENDS_class-native =3D &quot;python-native&quot;<br>
=C2=A0DEPENDS =3D+ &quot;zlib&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"ftp://xmlsoft.org/libxml2/libxml2-${PV}.=
tar.gz;name=3Dlibtar" target=3D"_blank">ftp://xmlsoft.org/libxml2/libxml2-$=
{PV}.tar.gz;name=3Dlibtar</a> \<br>
@@ -37,16 +35,16 @@ do_configure_prepend () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;/.*ansidecl.h.*/d&#39; ${S}/<a h=
ref=3D"http://configure.ac" target=3D"_blank">configure.ac</a><br>
=C2=A0}<br>
<br>
-do_configure_prepend_class-nativesdk () {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Ensure we get the correct site-packages path<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0export PYTHON_SITE_PACKAGES=3D&quot;${PYTHON_SI=
TEPACKAGES_DIR}&quot;<br>
-}<br>
+export PYTHON_SITE_PACKAGES=3D&quot;${PYTHON_SITEPACKAGES_DIR}&quot;<br>
+<br>
+PACKAGECONFIG ??=3D &quot;python&quot;<br>
<br>
+PACKAGECONFIG[python] =3D &quot;--with-python=3D${PYTHON},--without-python=
,python,python-core&quot;<br>
=C2=A0# WARNING: zlib is require for RPM use<br>
-EXTRA_OECONF =3D &quot;--without-python --without-debug --without-legacy -=
-with-catalog --without-docbook --with-c14n --without-lzma --with-fexceptio=
ns&quot;<br>
-EXTRA_OECONF_class-native =3D &quot;--with-python=3D${STAGING_BINDIR}/pyth=
on --without-legacy --without-docbook --with-c14n --without-lzma --with-zli=
b&quot;<br>
-EXTRA_OECONF_class-nativesdk =3D &quot;--with-python=3D${STAGING_BINDIR}/p=
ython --without-legacy --without-docbook --with-c14n --without-lzma --with-=
zlib&quot;<br>
-EXTRA_OECONF_linuxstdbase =3D &quot;--without-python --with-debug --with-l=
egacy --with-docbook --with-c14n --without-lzma --with-zlib&quot;<br>
+EXTRA_OECONF =3D &quot;--without-debug --without-legacy --with-catalog --w=
ithout-docbook --with-c14n --without-lzma --with-fexceptions&quot;<br>
+EXTRA_OECONF_class-native =3D &quot;--without-legacy --without-docbook --w=
ith-c14n --without-lzma --with-zlib&quot;<br>
+EXTRA_OECONF_class-nativesdk =3D &quot;--without-legacy --without-docbook =
--with-c14n --without-lzma --with-zlib&quot;<br>
+EXTRA_OECONF_linuxstdbase =3D &quot;--with-debug --with-legacy --with-docb=
ook --with-c14n --without-lzma --with-zlib&quot;<br>
<br>
=C2=A0# required for pythong binding<br>
=C2=A0export HOST_SYS<br>
<div class=3D"HOEnZb"><div class=3D"h5">--<br>
1.7.9.5<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</div></div></blockquote></div><br></div>

--001a11c11d0299e0c805150720ab--
