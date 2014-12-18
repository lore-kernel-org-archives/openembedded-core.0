Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f44.google.com (mail-qg0-f44.google.com
	[209.85.192.44])
	by mail.openembedded.org (Postfix) with ESMTP id 74AB572864
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 16:30:15 +0000 (UTC)
Received: by mail-qg0-f44.google.com with SMTP id q107so1091971qgd.31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 08:30:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vaA5rtYA2oNusYHsaYD5MJkg17EL8E8Z8YcaU+zMJSU=;
	b=Hb7Fn+BGRGR20G553yRPog23RYt9WRRAztIrGU8zX5MoVQW/QkgmfBx7xidFDwaHXz
	n+yp7Yeg+JG8Y6EQLBUji4YkU7PyrEKd6knpa9fXp43uoiI0JW+vXv9DFEDm+EfCFMAn
	OGVSe6cXA/H+yI8A18z5zotoTMH0E+C0GNyOc/1qYiTOTqe2m7g5kSBCJWVOwlNDjsl3
	lgz4iWoom7npPU/ej3lPdrXjZR0i0YEets7ORWqb4SzIOkSLqlmMQpuVZnkERoCN39LA
	OKdikMPWdXcwopuRjE8OCK4VcuboI+dy+5EGhbRiC0B0nLr6XwscArdqviu2Z9CaZJun
	ovJA==
X-Gm-Message-State: ALoCoQkwO3AZS9tjw5Eq/LvijffQT+F1txOfM4ZONa2DKcSmxIzZ7UMoLicMvjWY2TQIqi+W4OCG
X-Received: by 10.224.60.74 with SMTP id o10mr5073664qah.22.1418920216235;
	Thu, 18 Dec 2014 08:30:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Thu, 18 Dec 2014 08:29:55 -0800 (PST)
In-Reply-To: <1418221027-12371-3-git-send-email-Martin.Jansa@gmail.com>
References: <20141030082101.GE15148@jama>
	<1418221027-12371-1-git-send-email-Martin.Jansa@gmail.com>
	<1418221027-12371-3-git-send-email-Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Dec 2014 16:29:55 +0000
Message-ID: <CAJTo0LbA7rVxmFGZS9zcAiVbnLSpEhZqM0KutYJy9D02Gqfvag@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 3/4] libav: drop older 0.8.11 and use libav-9 by default
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
X-List-Received-Date: Thu, 18 Dec 2014 16:30:21 -0000
Content-Type: multipart/alternative; boundary=001a11c3f53e7428d4050a801b74

--001a11c3f53e7428d4050a801b74
Content-Type: text/plain; charset=UTF-8

Hi Martin,

Can this be squashed with the previous patch which makes changes to libav
0.8?  Merging the .inc and .bb together seems sensible too, especially as
the .inc contains the checksums so isn't actually useful for multiple
versions.  Also theres a version typo in the commit shortlog.

Ross

On 10 December 2014 at 14:17, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  .../gstreamer/gst-ffmpeg_0.10.13.bb                |  3 +--
>  meta/recipes-multimedia/libav/libav.inc            |  8 ++++++++
>  .../0001-configure-enable-pic-for-AArch64.patch    | 23
> ----------------------
>  meta/recipes-multimedia/libav/libav_0.8.15.bb      | 20
> -------------------
>  meta/recipes-multimedia/libav/libav_9.16.bb        | 12 -----------
>  5 files changed, 9 insertions(+), 57 deletions(-)
>  delete mode 100644
> meta/recipes-multimedia/libav/libav/0001-configure-enable-pic-for-AArch64.patch
>  delete mode 100644 meta/recipes-multimedia/libav/libav_0.8.15.bb
>
> diff --git a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
> b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
> index 7304fff..219feaa 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb
> @@ -57,7 +57,7 @@ SRC_URI = "
> http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
>
> file://0001-h264-skip-error-concealment-when-SPS-and-slices-are-.patch \
>             file://0001-avcodec-smc-fix-off-by-1-error.patch \
>
> file://0002-avcodec-mjpegdec-check-bits-per-pixel-for-changes-si.patch \
> -           ${@bb.utils.contains('PACKAGECONFIG', 'libav9',
> 'file://libav-9.patch', '', d)} \
> +           file://libav-9.patch \
>  "
>
>  SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
> @@ -84,7 +84,6 @@ EXTRA_OECONF = "${FFMPEG_EXTRA_CONFIGURE_COMMON}"
>  PACKAGECONFIG ??= "external-libav"
>  PACKAGECONFIG[external-libav] = "--with-system-ffmpeg,,libav"
>  PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc"
> -PACKAGECONFIG[libav9] = ",,,"
>
>  FILES_${PN} += "${libdir}/gstreamer-0.10/*.so"
>  FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug"
> diff --git a/meta/recipes-multimedia/libav/libav.inc
> b/meta/recipes-multimedia/libav/libav.inc
> index 8b470c1..21c29fc 100644
> --- a/meta/recipes-multimedia/libav/libav.inc
> +++ b/meta/recipes-multimedia/libav/libav.inc
> @@ -10,6 +10,13 @@ SECTION = "libs"
>  LICENSE = "GPLv2+"
>  LICENSE_FLAGS = "commercial"
>
> +LIC_FILES_CHKSUM =
> "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> +
> file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
> +
> file://COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
> +
> file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
> +
> +SRC_URI = "http://libav.org/releases/${BP}.tar.xz"
> +
>  # Provides ffmpeg compat, see http://libav.org/about.html
>  PROVIDES = "ffmpeg"
>
> @@ -86,6 +93,7 @@ do_install_append() {
>  }
>
>  PACKAGES += "${PN}-vhook-dbg ${PN}-vhook ffmpeg-x264-presets"
> +PACKAGES_DYNAMIC += "^lib(av(codec|device|filter|format|util)|swscale).*"
>
>  RSUGGESTS_${PN} = "mplayer"
>  FILES_${PN} = "${bindir}"
> diff --git
> a/meta/recipes-multimedia/libav/libav/0001-configure-enable-pic-for-AArch64.patch
> b/meta/recipes-multimedia/libav/libav/0001-configure-enable-pic-for-AArch64.patch
> deleted file mode 100644
> index d9b22b9..0000000
> ---
> a/meta/recipes-multimedia/libav/libav/0001-configure-enable-pic-for-AArch64.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -From 58db99e98f615d79ea90cac8f4bcf11c94e3e7c7 Mon Sep 17 00:00:00 2001
> -From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> -Date: Thu, 10 Jan 2013 12:42:19 +0100
> -Subject: [PATCH] configure: enable pic for AArch64
> -
> -Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> -
> -Upstream-Status: Backport
> ----
> - configure |    2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> ---- git.orig/configure
> -+++ git/configure
> -@@ -2393,7 +2393,7 @@ check_host_cflags -std=c99
> - check_host_cflags -Wall
> -
> - case "$arch" in
> --    alpha|ia64|mips|parisc|ppc|sparc)
> -+    alpha|ia64|mips|parisc|ppc|sparc|aarch64)
> -         spic=$shared
> -     ;;
> -     x86)
> diff --git a/meta/recipes-multimedia/libav/libav_0.8.15.bb
> b/meta/recipes-multimedia/libav/libav_0.8.15.bb
> deleted file mode 100644
> index 127a088..0000000
> --- a/meta/recipes-multimedia/libav/libav_0.8.15.bb
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -require libav.inc
> -
> -SRC_URI = "http://libav.org/releases/${BP}.tar.xz \
> -           file://0001-configure-enable-pic-for-AArch64.patch"
> -
> -SRC_URI[md5sum] = "e483ea8f482b5ecd65ee1d09251b0a5b"
> -SRC_URI[sha256sum] =
> "495789ec547e93632937f0f36b06f4dd3180bc61518181f124af6746c6218710"
> -
> -LIC_FILES_CHKSUM =
> "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> -
> file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
> -
> file://COPYING.LGPLv2.1;md5=e344c8fa836c3a41c4cbd79d7bd3a379 \
> -
> file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
> -
> -PROVIDES += "libpostproc"
> -
> -EXTRA_OECONF += " \
> -    --enable-postproc \
> -"
> -
> -PACKAGES_DYNAMIC +=
> "^lib(av(codec|device|filter|format|util)|postproc|swscale).*"
> diff --git a/meta/recipes-multimedia/libav/libav_9.16.bb
> b/meta/recipes-multimedia/libav/libav_9.16.bb
> index 8ced2dc..79ff3f8 100644
> --- a/meta/recipes-multimedia/libav/libav_9.16.bb
> +++ b/meta/recipes-multimedia/libav/libav_9.16.bb
> @@ -1,16 +1,4 @@
>  require libav.inc
>
> -LIC_FILES_CHKSUM =
> "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> -
> file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
> -
> file://COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
> -
> file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
> -
> -SRC_URI = "http://libav.org/releases/${BP}.tar.xz"
> -
>  SRC_URI[md5sum] = "7b44b75cec24b8e7545e5029e76917e0"
>  SRC_URI[sha256sum] =
> "ca846473b0b8ed8e3404c52e5e92df6d35cb5fa487eec498525de3ffda4367a0"
> -
> -DEFAULT_PREFERENCE = "-1"
> -
> -# unlike 0.8.11 we don't provide libpostproc
> -PACKAGES_DYNAMIC += "^lib(av(codec|device|filter|format|util)|swscale).*"
> --
> 2.1.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11c3f53e7428d4050a801b74
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Martin,<div><br></div><div>Can this be squashed with th=
e previous patch which makes changes to libav 0.8?=C2=A0 Merging the .inc a=
nd .bb together seems sensible too, especially as the .inc contains the che=
cksums so isn&#39;t actually useful for multiple versions.=C2=A0 Also there=
s a version typo in the commit shortlog.</div><div><br></div><div>Ross</div=
></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 10 Dece=
mber 2014 at 14:17, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:ma=
rtin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</spa=
n> wrote:<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">Signed-off-by: Martin Jansa &lt;<a =
href=3D"mailto:Martin.Jansa@gmail.com">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../gstreamer/<a href=3D"http://gst-ffmpeg_0.10.13.bb" target=3D"_bla=
nk">gst-ffmpeg_0.10.13.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 3 +--<br>
=C2=A0meta/recipes-multimedia/libav/libav.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 8 ++++++++<br>
=C2=A0.../0001-configure-enable-pic-for-AArch64.patch=C2=A0 =C2=A0 | 23 ---=
-------------------<br>
=C2=A0meta/recipes-multimedia/libav/<a href=3D"http://libav_0.8.15.bb" targ=
et=3D"_blank">libav_0.8.15.bb</a>=C2=A0 =C2=A0 =C2=A0 | 20 ----------------=
---<br>
=C2=A0meta/recipes-multimedia/libav/<a href=3D"http://libav_9.16.bb" target=
=3D"_blank">libav_9.16.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 12 -----------<b=
r>
=C2=A05 files changed, 9 insertions(+), 57 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-multimedia/libav/libav/0001-configure=
-enable-pic-for-AArch64.patch<br>
=C2=A0delete mode 100644 meta/recipes-multimedia/libav/<a href=3D"http://li=
bav_0.8.15.bb" target=3D"_blank">libav_0.8.15.bb</a><br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gst-ffmpeg=
_0.10.13.bb" target=3D"_blank">gst-ffmpeg_0.10.13.bb</a> b/meta/recipes-mul=
timedia/gstreamer/<a href=3D"http://gst-ffmpeg_0.10.13.bb" target=3D"_blank=
">gst-ffmpeg_0.10.13.bb</a><br>
index 7304fff..219feaa 100644<br>
--- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gst-ffmpeg_0.10.1=
3.bb" target=3D"_blank">gst-ffmpeg_0.10.13.bb</a><br>
+++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gst-ffmpeg_0.10.1=
3.bb" target=3D"_blank">gst-ffmpeg_0.10.13.bb</a><br>
@@ -57,7 +57,7 @@ SRC_URI =3D &quot;<a href=3D"http://gstreamer.freedesktop=
.org/src/${BPN}/${BPN}-${PV}.tar.bz2" target=3D"_blank">http://gstreamer.fr=
eedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-h264-skip-error-conce=
alment-when-SPS-and-slices-are-.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-avcodec-smc-fix-off-b=
y-1-error.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-avcodec-mjpegdec-chec=
k-bits-per-pixel-for-changes-si.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;PACKAGE=
CONFIG&#39;, &#39;libav9&#39;, &#39;file://libav-9.patch&#39;, &#39;&#39;, =
d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://libav-9.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;7f5beacaf1312db2db30a026b36888c4&quot;<br>
@@ -84,7 +84,6 @@ EXTRA_OECONF =3D &quot;${FFMPEG_EXTRA_CONFIGURE_COMMON}&q=
uot;<br>
=C2=A0PACKAGECONFIG ??=3D &quot;external-libav&quot;<br>
=C2=A0PACKAGECONFIG[external-libav] =3D &quot;--with-system-ffmpeg,,libav&q=
uot;<br>
=C2=A0PACKAGECONFIG[orc] =3D &quot;--enable-orc,--disable-orc,orc&quot;<br>
-PACKAGECONFIG[libav9] =3D &quot;,,,&quot;<br>
<br>
=C2=A0FILES_${PN} +=3D &quot;${libdir}/gstreamer-0.10/*.so&quot;<br>
=C2=A0FILES_${PN}-dbg +=3D &quot;${libdir}/gstreamer-0.10/.debug&quot;<br>
diff --git a/meta/recipes-multimedia/libav/libav.inc b/meta/recipes-multime=
dia/libav/libav.inc<br>
index 8b470c1..21c29fc 100644<br>
--- a/meta/recipes-multimedia/libav/libav.inc<br>
+++ b/meta/recipes-multimedia/libav/libav.inc<br>
@@ -10,6 +10,13 @@ SECTION =3D &quot;libs&quot;<br>
=C2=A0LICENSE =3D &quot;GPLv2+&quot;<br>
=C2=A0LICENSE_FLAGS =3D &quot;commercial&quot;<br>
<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING.GPLv2;md5=3Db234ee4d69f5fce4486a=
80fdaf4a4263 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://COPYING.GPLv3;md5=3Dd32239bcb673463ab874e80d47fae504 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://COPYING.LGPLv2.1;md5=3Dbd7a443320af8c812e4c18d1b79df004 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://COPYING.LGPLv3;md5=3De6a600fd5e1d9cbde2d983680233ad02&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"http://libav.org/releases/${BP}.tar.xz" targe=
t=3D"_blank">http://libav.org/releases/${BP}.tar.xz</a>&quot;<br>
+<br>
=C2=A0# Provides ffmpeg compat, see <a href=3D"http://libav.org/about.html"=
 target=3D"_blank">http://libav.org/about.html</a><br>
=C2=A0PROVIDES =3D &quot;ffmpeg&quot;<br>
<br>
@@ -86,6 +93,7 @@ do_install_append() {<br>
=C2=A0}<br>
<br>
=C2=A0PACKAGES +=3D &quot;${PN}-vhook-dbg ${PN}-vhook ffmpeg-x264-presets&q=
uot;<br>
+PACKAGES_DYNAMIC +=3D &quot;^lib(av(codec|device|filter|format|util)|swsca=
le).*&quot;<br>
<br>
=C2=A0RSUGGESTS_${PN} =3D &quot;mplayer&quot;<br>
=C2=A0FILES_${PN} =3D &quot;${bindir}&quot;<br>
diff --git a/meta/recipes-multimedia/libav/libav/0001-configure-enable-pic-=
for-AArch64.patch b/meta/recipes-multimedia/libav/libav/0001-configure-enab=
le-pic-for-AArch64.patch<br>
deleted file mode 100644<br>
index d9b22b9..0000000<br>
--- a/meta/recipes-multimedia/libav/libav/0001-configure-enable-pic-for-AAr=
ch64.patch<br>
+++ /dev/null<br>
@@ -1,23 +0,0 @@<br>
-From 58db99e98f615d79ea90cac8f4bcf11c94e3e7c7 Mon Sep 17 00:00:00 2001<br>
-From: Marcin Juszkiewicz &lt;<a href=3D"mailto:marcin.juszkiewicz@linaro.o=
rg">marcin.juszkiewicz@linaro.org</a>&gt;<br>
-Date: Thu, 10 Jan 2013 12:42:19 +0100<br>
-Subject: [PATCH] configure: enable pic for AArch64<br>
-<br>
-Signed-off-by: Marcin Juszkiewicz &lt;<a href=3D"mailto:marcin.juszkiewicz=
@linaro.org">marcin.juszkiewicz@linaro.org</a>&gt;<br>
-<br>
-Upstream-Status: Backport<br>
----<br>
- configure |=C2=A0 =C2=A0 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
---- git.orig/configure<br>
-+++ git/configure<br>
-@@ -2393,7 +2393,7 @@ check_host_cflags -std=3Dc99<br>
- check_host_cflags -Wall<br>
-<br>
- case &quot;$arch&quot; in<br>
--=C2=A0 =C2=A0 alpha|ia64|mips|parisc|ppc|sparc)<br>
-+=C2=A0 =C2=A0 alpha|ia64|mips|parisc|ppc|sparc|aarch64)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0spic=3D$shared<br>
-=C2=A0 =C2=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 =C2=A0x86)<br>
diff --git a/meta/recipes-multimedia/libav/<a href=3D"http://libav_0.8.15.b=
b" target=3D"_blank">libav_0.8.15.bb</a> b/meta/recipes-multimedia/libav/<a=
 href=3D"http://libav_0.8.15.bb" target=3D"_blank">libav_0.8.15.bb</a><br>
deleted file mode 100644<br>
index 127a088..0000000<br>
--- a/meta/recipes-multimedia/libav/<a href=3D"http://libav_0.8.15.bb" targ=
et=3D"_blank">libav_0.8.15.bb</a><br>
+++ /dev/null<br>
@@ -1,20 +0,0 @@<br>
-require libav.inc<br>
-<br>
-SRC_URI =3D &quot;<a href=3D"http://libav.org/releases/${BP}.tar.xz" targe=
t=3D"_blank">http://libav.org/releases/${BP}.tar.xz</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-configure-enable-pic-=
for-AArch64.patch&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;e483ea8f482b5ecd65ee1d09251b0a5b&quot;<br>
-SRC_URI[sha256sum] =3D &quot;495789ec547e93632937f0f36b06f4dd3180bc6151818=
1f124af6746c6218710&quot;<br>
-<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING.GPLv2;md5=3Db234ee4d69f5fce4486a=
80fdaf4a4263 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://COPYING.GPLv3;md5=3Dd32239bcb673463ab874e80d47fae504 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://COPYING.LGPLv2.1;md5=3De344c8fa836c3a41c4cbd79d7bd3a379 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://COPYING.LGPLv3;md5=3De6a600fd5e1d9cbde2d983680233ad02&quot;<br>
-<br>
-PROVIDES +=3D &quot;libpostproc&quot;<br>
-<br>
-EXTRA_OECONF +=3D &quot; \<br>
-=C2=A0 =C2=A0 --enable-postproc \<br>
-&quot;<br>
-<br>
-PACKAGES_DYNAMIC +=3D &quot;^lib(av(codec|device|filter|format|util)|postp=
roc|swscale).*&quot;<br>
diff --git a/meta/recipes-multimedia/libav/<a href=3D"http://libav_9.16.bb"=
 target=3D"_blank">libav_9.16.bb</a> b/meta/recipes-multimedia/libav/<a hre=
f=3D"http://libav_9.16.bb" target=3D"_blank">libav_9.16.bb</a><br>
index 8ced2dc..79ff3f8 100644<br>
--- a/meta/recipes-multimedia/libav/<a href=3D"http://libav_9.16.bb" target=
=3D"_blank">libav_9.16.bb</a><br>
+++ b/meta/recipes-multimedia/libav/<a href=3D"http://libav_9.16.bb" target=
=3D"_blank">libav_9.16.bb</a><br>
@@ -1,16 +1,4 @@<br>
=C2=A0require libav.inc<br>
<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING.GPLv2;md5=3Db234ee4d69f5fce4486a=
80fdaf4a4263 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://COPYING.GPLv3;md5=3Dd32239bcb673463ab874e80d47fae504 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://COPYING.LGPLv2.1;md5=3Dbd7a443320af8c812e4c18d1b79df004 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file=
://COPYING.LGPLv3;md5=3De6a600fd5e1d9cbde2d983680233ad02&quot;<br>
-<br>
-SRC_URI =3D &quot;<a href=3D"http://libav.org/releases/${BP}.tar.xz" targe=
t=3D"_blank">http://libav.org/releases/${BP}.tar.xz</a>&quot;<br>
-<br>
=C2=A0SRC_URI[md5sum] =3D &quot;7b44b75cec24b8e7545e5029e76917e0&quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;ca846473b0b8ed8e3404c52e5e92df6d35cb5fa4=
87eec498525de3ffda4367a0&quot;<br>
-<br>
-DEFAULT_PREFERENCE =3D &quot;-1&quot;<br>
-<br>
-# unlike 0.8.11 we don&#39;t provide libpostproc<br>
-PACKAGES_DYNAMIC +=3D &quot;^lib(av(codec|device|filter|format|util)|swsca=
le).*&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.1.3<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
</font></span></blockquote></div></div>

--001a11c3f53e7428d4050a801b74--
