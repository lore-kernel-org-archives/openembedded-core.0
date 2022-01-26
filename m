Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ADF3C63682
	for <webhook@archiver.kernel.org>; Wed, 26 Jan 2022 10:28:40 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.11070.1643192917182218606
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 02:28:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=epWGIFgL;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-002-205-233-038.002.205.pools.vodafone-ip.de
 [2.205.233.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 68B638069C;
	Wed, 26 Jan 2022 11:28:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643192915;
	bh=heYtq4JgbNC9K6Cji4I1zVMsax4hFuI0D2lbL4ER5Yc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=epWGIFgLATpVAZ9YRvp+A/x059F27PQU5FMYiG4GzMIPI5AR3PaOFCmguckeqELTd
	 BgH0ViSbsnWBqJFVTKHzaeXc9EEL6b4B58M1UtrkXXRgYLLdpMfcZJ2B+WRSACRAQ2
	 10DFrx14iMwdvE89RYlxggkMFFr1VN11o1vV4aT8/CpPkc3KXIOIjKPYajtAAeyw2B
	 q0bjSAY9pal/2sbJzK7a1RtMDTeliU7gwql6rjFDcDlggo7yMpR/9kl65f7U9c8No+
	 UcNEOu2B7/F9SGInhDEtXIPx0ntkVTcashU9QY6o5idmCy42yvu3+atXik7BMf3g51
	 Thugycm/KOFMg==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Jose Quaresma <quaresma.jose@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Claudius Heine <ch@denx.de>
Subject: [OE-core][RFC PATCH 04/12] gstreamer1.0-plugins-bad: 1.18.5 -> 1.20.0
Date: Wed, 26 Jan 2022 11:28:06 +0100
Message-Id: <20220126102814.4173943-5-ch@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126102814.4173943-1-ch@denx.de>
References: <20220126102814.4173943-1-ch@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jan 2022 10:28:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160969

Feature `ofa` and `libmms` are no longer available and where removed.

Signed-off-by: Claudius Heine <ch@denx.de>
---
 ...ialized-warnings-when-compiling-with.patch |  8 +++---
 ...-avoid-including-sys-poll.h-directly.patch |  8 +++---
 ...-sentinals-for-gst_structure_get-etc.patch | 24 ++++++++---------
 ...issing-opencv-data-dir-in-yocto-buil.patch | 25 +++++++++---------
 .../0005-msdk-fix-includedir-path.patch       | 26 +++++++++----------
 ....bb =3D> gstreamer1.0-plugins-bad_1.20.0.bb} | 20 +++++++-------
 6 files changed, 54 insertions(+), 57 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.18.=
5.bb =3D> gstreamer1.0-plugins-bad_1.20.0.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0=
001-fix-maybe-uninitialized-warnings-when-compiling-with.patch b/meta/rec=
ipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix-maybe-uniniti=
alized-warnings-when-compiling-with.patch
index 13a673cd50..ae8af094cb 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix=
-maybe-uninitialized-warnings-when-compiling-with.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-fix=
-maybe-uninitialized-warnings-when-compiling-with.patch
@@ -7,13 +7,13 @@ Upstream-Status: Pending
=20
 Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
 ---
- gst-libs/gst/codecparsers/gstvc1parser.c | 2 +-
+ subprojects/gst-plugins-bad/gst-libs/gst/codecparsers/gstvc1parser.c | =
2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
-diff --git a/gst-libs/gst/codecparsers/gstvc1parser.c b/gst-libs/gst/cod=
ecparsers/gstvc1parser.c
+diff --git a/subprojects/gst-plugins-bad/gst-libs/gst/codecparsers/gstvc=
1parser.c b/subprojects/gst-plugins-bad/gst-libs/gst/codecparsers/gstvc1p=
arser.c
 index 2c60ced..e8226d8 100644
---- a/gst-libs/gst/codecparsers/gstvc1parser.c
-+++ b/gst-libs/gst/codecparsers/gstvc1parser.c
+--- a/subprojects/gst-plugins-bad/gst-libs/gst/codecparsers/gstvc1parser=
.c
++++ b/subprojects/gst-plugins-bad/gst-libs/gst/codecparsers/gstvc1parser=
.c
 @@ -1730,7 +1730,7 @@ gst_vc1_parse_sequence_layer (const guint8 * data,=
 gsize size,
      GstVC1SeqLayer * seqlayer)
  {
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0=
002-avoid-including-sys-poll.h-directly.patch b/meta/recipes-multimedia/g=
streamer/gstreamer1.0-plugins-bad/0002-avoid-including-sys-poll.h-directl=
y.patch
index ead6897f67..b1aaff864b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avo=
id-including-sys-poll.h-directly.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-avo=
id-including-sys-poll.h-directly.patch
@@ -9,13 +9,13 @@ Upstream-Status: Pending
=20
 Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
 ---
- sys/dvb/gstdvbsrc.c | 2 +-
+ subprojects/gst-plugins-bad/sys/dvb/gstdvbsrc.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
-diff --git a/sys/dvb/gstdvbsrc.c b/sys/dvb/gstdvbsrc.c
+diff --git a/subprojects/gst-plugins-bad/sys/dvb/gstdvbsrc.c b/subprojec=
ts/gst-plugins-bad/sys/dvb/gstdvbsrc.c
 index ca6b92a..b2772db 100644
---- a/sys/dvb/gstdvbsrc.c
-+++ b/sys/dvb/gstdvbsrc.c
+--- a/subprojects/gst-plugins-bad/sys/dvb/gstdvbsrc.c
++++ b/subprojects/gst-plugins-bad/sys/dvb/gstdvbsrc.c
 @@ -97,7 +97,7 @@
  #include <gst/gst.h>
  #include <gst/glib-compat-private.h>
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0=
003-ensure-valid-sentinals-for-gst_structure_get-etc.patch b/meta/recipes=
-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-ensure-valid-sentinal=
s-for-gst_structure_get-etc.patch
index 88fbc40dcd..a53a840e98 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-ens=
ure-valid-sentinals-for-gst_structure_get-etc.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-ens=
ure-valid-sentinals-for-gst_structure_get-etc.patch
@@ -18,15 +18,15 @@ Upstream-Status: Pending
=20
 Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
 ---
- sys/decklink/gstdecklink.cpp          | 10 +++++-----
- sys/decklink/gstdecklinkaudiosrc.cpp  |  2 +-
- sys/decklink/gstdecklinkvideosink.cpp |  2 +-
+ subprojects/gst-plugins-bad/sys/decklink/gstdecklink.cpp          | 10 =
+++++-----
+ subprojects/gst-plugins-bad/sys/decklink/gstdecklinkaudiosrc.cpp  |  2 =
+-
+ subprojects/gst-plugins-bad/sys/decklink/gstdecklinkvideosink.cpp |  2 =
+-
  3 files changed, 7 insertions(+), 7 deletions(-)
=20
-diff --git a/sys/decklink/gstdecklink.cpp b/sys/decklink/gstdecklink.cpp
+diff --git a/subprojects/gst-plugins-bad/sys/decklink/gstdecklink.cpp b/=
subprojects/gst-plugins-bad/sys/decklink/gstdecklink.cpp
 index 4dac7e1..43762ce 100644
---- a/sys/decklink/gstdecklink.cpp
-+++ b/sys/decklink/gstdecklink.cpp
+--- a/subprojects/gst-plugins-bad/sys/decklink/gstdecklink.cpp
++++ b/subprojects/gst-plugins-bad/sys/decklink/gstdecklink.cpp
 @@ -674,7 +674,7 @@ gst_decklink_mode_get_generic_structure (GstDecklink=
ModeEnum e)
        "pixel-aspect-ratio", GST_TYPE_FRACTION, mode->par_n, mode->par_d=
,
        "interlace-mode", G_TYPE_STRING,
@@ -57,10 +57,10 @@ index 4dac7e1..43762ce 100644
        break;
      case bmdFormat10BitRGB:    /* 'r210' Big-endian RGB 10-bit per comp=
onent with SMPTE video levels (64-960). Packed as 2:10:10:10 */
      case bmdFormat12BitRGB:    /* 'R12B' Big-endian RGB 12-bit per comp=
onent with full range (0-4095). Packed as 12-bit per component */
-diff --git a/sys/decklink/gstdecklinkaudiosrc.cpp b/sys/decklink/gstdeck=
linkaudiosrc.cpp
+diff --git a/subprojects/gst-plugins-bad/sys/decklink/gstdecklinkaudiosr=
c.cpp b/subprojects/gst-plugins-bad/sys/decklink/gstdecklinkaudiosrc.cpp
 index 2fef934..c47229a 100644
---- a/sys/decklink/gstdecklinkaudiosrc.cpp
-+++ b/sys/decklink/gstdecklinkaudiosrc.cpp
+--- a/subprojects/gst-plugins-bad/sys/decklink/gstdecklinkaudiosrc.cpp
++++ b/subprojects/gst-plugins-bad/sys/decklink/gstdecklinkaudiosrc.cpp
 @@ -379,7 +379,7 @@ gst_decklink_audio_src_start (GstDecklinkAudioSrc * =
self)
        g_mutex_unlock (&self->input->lock);
 =20
@@ -70,10 +70,10 @@ index 2fef934..c47229a 100644
          gst_object_unref (videosrc);
 =20
          switch (vconn) {
-diff --git a/sys/decklink/gstdecklinkvideosink.cpp b/sys/decklink/gstdec=
klinkvideosink.cpp
+diff --git a/subprojects/gst-plugins-bad/sys/decklink/gstdecklinkvideosi=
nk.cpp b/subprojects/gst-plugins-bad/sys/decklink/gstdecklinkvideosink.cp=
p
 index e3a6775..f1a5aae 100644
---- a/sys/decklink/gstdecklinkvideosink.cpp
-+++ b/sys/decklink/gstdecklinkvideosink.cpp
+--- a/subprojects/gst-plugins-bad/sys/decklink/gstdecklinkvideosink.cpp
++++ b/subprojects/gst-plugins-bad/sys/decklink/gstdecklinkvideosink.cpp
 @@ -286,7 +286,7 @@ reset_framerate (GstCapsFeatures * features, GstStru=
cture * structure,
      gpointer user_data)
  {
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0=
004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch b/meta/rec=
ipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-mi=
ssing-opencv-data-dir-in-yocto-buil.patch
index b816709066..47dbb4b54d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-ope=
ncv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-ope=
ncv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
@@ -12,38 +12,37 @@ Upstream-Status: Inappropriate [OE-specific]
=20
 Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
 ---
- ext/opencv/meson.build | 7 ++++---
+ subprojects/gst-plugins-bad/ext/opencv/meson.build | 7 ++++---
  1 file changed, 4 insertions(+), 3 deletions(-)
=20
-diff --git a/ext/opencv/meson.build b/ext/opencv/meson.build
+diff --git a/subprojects/gst-plugins-bad/ext/opencv/meson.build b/subpro=
jects/gst-plugins-bad/ext/opencv/meson.build
 index 0b0b3fc..0ed3344 100644
---- a/ext/opencv/meson.build
-+++ b/ext/opencv/meson.build
-@@ -78,20 +78,21 @@ else
+--- a/subprojects/gst-plugins-bad/ext/opencv/meson.build
++++ b/subprojects/gst-plugins-bad/ext/opencv/meson.build
+@@ -84,20 +84,21 @@ if not opencv_found
  endif
 =20
  if opencv_found
 +  pkgconf_sysroot =3D run_command(python3, '-c', 'import os; print(os.e=
nviron.get("PKG_CONFIG_SYSROOT_DIR"))').stdout().strip()
-   opencv_prefix =3D opencv_dep.get_pkgconfig_variable('prefix')
+   opencv_prefix =3D opencv_dep.get_variable('prefix')
    gstopencv_cargs +=3D ['-DOPENCV_PREFIX=3D"' + opencv_prefix + '"']
 =20
    # Check the data dir used by opencv for its xml data files
    # Use prefix from pkg-config to be compatible with cross-compilation
--  r =3D run_command('test', '-d', opencv_prefix + '/share/opencv')
-+  r =3D run_command('test', '-d', pkgconf_sysroot + opencv_prefix + '/s=
hare/opencv')
+-  r =3D run_command('test', '-d', opencv_prefix + '/share/opencv', chec=
k: false)
++  r =3D run_command('test', '-d', pkgconf_sysroot + opencv_prefix + '/s=
hare/opencv', check: false)
    if r.returncode() =3D=3D 0
      gstopencv_cargs +=3D '-DOPENCV_PATH_NAME=3D"opencv"'
    else
--    r =3D run_command('test', '-d', opencv_prefix + '/share/OpenCV')
-+    r =3D run_command('test', '-d', pkgconf_sysroot + opencv_prefix + '=
/share/OpenCV')
+-    r =3D run_command('test', '-d', opencv_prefix + '/share/OpenCV', ch=
eck: false)
++    r =3D run_command('test', '-d', pkgconf_sysroot + opencv_prefix + '=
/share/OpenCV', check: false)
      if r.returncode() =3D=3D 0
        gstopencv_cargs +=3D '-DOPENCV_PATH_NAME=3D"OpenCV"'
      else
--      r =3D run_command('test', '-d', opencv_prefix + '/share/opencv4')
-+      r =3D run_command('test', '-d', pkgconf_sysroot + opencv_prefix +=
 '/share/opencv4')
+-      r =3D run_command('test', '-d', opencv_prefix + '/share/opencv4',=
 check: false)
++      r =3D run_command('test', '-d', pkgconf_sysroot + opencv_prefix +=
 '/share/opencv4', check: false)
        if r.returncode() =3D=3D 0
          gstopencv_cargs +=3D '-DOPENCV_PATH_NAME=3D"opencv4"'
        else
 --=20
 2.28.0
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0=
005-msdk-fix-includedir-path.patch b/meta/recipes-multimedia/gstreamer/gs=
treamer1.0-plugins-bad/0005-msdk-fix-includedir-path.patch
index cb3bb7d361..5cda092353 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-msd=
k-fix-includedir-path.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-msd=
k-fix-includedir-path.patch
@@ -9,23 +9,23 @@ Upstream-Status: Inappropriate [OE-specific]
=20
 Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
 ---
- sys/msdk/meson.build | 2 ++
+ subprojects/gst-plugins-bad/sys/msdk/meson.build | 2 ++
  1 file changed, 2 insertions(+)
=20
-diff --git a/sys/msdk/meson.build b/sys/msdk/meson.build
+diff --git a/subprojects/gst-plugins-bad/sys/msdk/meson.build b/subproje=
cts/gst-plugins-bad/sys/msdk/meson.build
 index 6346c9451..068f38548 100644
---- a/sys/msdk/meson.build
-+++ b/sys/msdk/meson.build
-@@ -40,7 +40,9 @@ endif
+--- a/subprojects/gst-plugins-bad/sys/msdk/meson.build
++++ b/subprojects/gst-plugins-bad/sys/msdk/meson.build
+@@ -46,7 +46,9 @@ if mfx_api !=3D 'oneVPL'
+   mfx_dep =3D dependency('libmfx', version: ['>=3D 1.0', '<=3D 1.99'], =
required: false)
 =20
- mfx_dep =3D dependency('libmfx', required: false)
- if mfx_dep.found()
-+  pkgconf_sysroot =3D run_command(python3, '-c', 'import os; print(os.e=
nviron.get("PKG_CONFIG_SYSROOT_DIR"))').stdout().strip()
-   mfx_incdir =3D mfx_dep.get_pkgconfig_variable('includedir')
-+  mfx_incdir =3D pkgconf_sysroot +  mfx_incdir
-   mfx_inc =3D []
- else
-   # Old versions of MediaSDK don't provide a pkg-config file
+   if mfx_dep.found()
++    pkgconf_sysroot =3D run_command(python3, '-c', 'import os; print(os=
.environ.get("PKG_CONFIG_SYSROOT_DIR"))').stdout().strip()
+     mfx_incdir =3D mfx_dep.get_variable('includedir')
++    mfx_incdir =3D pkgconf_sysroot +  mfx_incdir
+     mfx_inc =3D []
+     use_msdk =3D true
+   else
 --=20
 2.17.1
=20
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1=
.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2=
0.0.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.=
18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20=
.0.bb
index f90dff693d..2e5627cfea 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.5.b=
b
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.b=
b
@@ -4,16 +4,16 @@ DESCRIPTION =3D "'Bad' GStreamer plugins and helper lib=
raries "
 HOMEPAGE =3D "https://gstreamer.freedesktop.org/"
 BUGTRACKER =3D "https://gitlab.freedesktop.org/gstreamer/gst-plugins-bad=
/-/issues"
=20
-SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-p=
lugins-bad-${PV}.tar.xz \
-           file://0001-fix-maybe-uninitialized-warnings-when-compiling-w=
ith.patch \
-           file://0002-avoid-including-sys-poll.h-directly.patch \
-           file://0003-ensure-valid-sentinals-for-gst_structure_get-etc.=
patch \
-           file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-b=
uil.patch \
-           file://0005-msdk-fix-includedir-path.patch \
-           "
-SRC_URI[sha256sum] =3D "a164923b94f0d08578a6fcaeaac6e0c05da788a46903a108=
6870e9ca45ad678e"
+require gstreamer1.0-source.inc
=20
-S =3D "${WORKDIR}/gst-plugins-bad-${PV}"
+S =3D "${SRC_BASE}/subprojects/gst-plugins-bad"
+
+SRC_URI +=3D "file://0001-fix-maybe-uninitialized-warnings-when-compilin=
g-with.patch;patchdir=3D${SRC_BASE} \
+            file://0002-avoid-including-sys-poll.h-directly.patch;patchd=
ir=3D${SRC_BASE} \
+            file://0003-ensure-valid-sentinals-for-gst_structure_get-etc=
.patch;patchdir=3D${SRC_BASE} \
+            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-=
buil.patch;patchdir=3D${SRC_BASE} \
+            file://0005-msdk-fix-includedir-path.patch;patchdir=3D${SRC_=
BASE} \
+            "
=20
 LICENSE =3D "GPLv2+ & LGPLv2+ & LGPLv2.1+"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
@@ -61,7 +61,6 @@ PACKAGECONFIG[gcrypt]          =3D "-Dhls-crypto=3Dlibg=
crypt,,libgcrypt"
 PACKAGECONFIG[gl]              =3D "-Dgl=3Denabled,-Dgl=3Ddisabled,"
 PACKAGECONFIG[kms]             =3D "-Dkms=3Denabled,-Dkms=3Ddisabled,lib=
drm"
 PACKAGECONFIG[libde265]        =3D "-Dlibde265=3Denabled,-Dlibde265=3Ddi=
sabled,libde265"
-PACKAGECONFIG[libmms]          =3D "-Dlibmms=3Denabled,-Dlibmms=3Ddisabl=
ed,libmms"
 PACKAGECONFIG[libssh2]         =3D "-Dcurl-ssh2=3Denabled,-Dcurl-ssh2=3D=
disabled,libssh2"
 PACKAGECONFIG[lcms2]           =3D "-Dcolormanagement=3Denabled,-Dcolorm=
anagement=3Ddisabled,lcms"
 PACKAGECONFIG[modplug]         =3D "-Dmodplug=3Denabled,-Dmodplug=3Ddisa=
bled,libmodplug"
@@ -132,7 +131,6 @@ EXTRA_OEMESON +=3D " \
     -Dmplex=3Ddisabled \
     -Dmusepack=3Ddisabled \
     -Dnvcodec=3Ddisabled \
-    -Dofa=3Ddisabled \
     -Dopenexr=3Ddisabled \
     -Dopenni2=3Ddisabled \
     -Dopensles=3Ddisabled \
--=20
2.34.1


