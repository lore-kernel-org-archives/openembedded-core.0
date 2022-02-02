Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44341C43217
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 13:43:03 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.64039.1643809381934385849
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 05:43:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=it5MBUfA;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from localhost (dslb-002-205-233-038.002.205.pools.vodafone-ip.de
 [2.205.233.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 4EE51838E1;
	Wed,  2 Feb 2022 14:43:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1643809380;
	bh=JTF5dXz+f5gMw3K7kQvSd18+855jhGNSG/MNSfX8M+0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=it5MBUfAMLPxgXNHyTJqj4FyrnyZr0Eb8MNKE0IF3/+71vXPVEOowv4/cKjURAdzN
	 s+aYh9Mn9oliRQXRd7dP7D2BlolD+6CNL+tLfG8ruxrZ7D1Oh3eTKYjBTo4HlyxhbP
	 xL8GiQrP6XDekQY0aJ6M64PYnivVwfXKFAlOIur4UuvFtUeAHol4V7UVcrJlg6Flyg
	 IV9avZL6YR1rgaTKDx1P4zg5hk0W0/DOl1Au1QsD7873igYE8VHhUP+BLm+w2HT3eP
	 2xznuZudCx2z/t++CCE/zSbOO9bJpwJDqutrTeHEDTDaPXblkSQmt0pKZedqjHx4Vp
	 LmFi5oarebggw==
From: Claudius Heine <ch@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Jose Quaresma <quaresma.jose@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Claudius Heine <ch@denx.de>
Subject: [PATCH 04/12] gstreamer1.0-plugins-bad: 1.18.5 -> 1.19.90
Date: Wed,  2 Feb 2022 14:42:25 +0100
Message-Id: <20220202134233.2091916-5-ch@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220202134233.2091916-1-ch@denx.de>
References: <20220202134233.2091916-1-ch@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 13:43:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161200

Features `libmms` and `ofa` where removed upstream.

Patches where rebased.

Signed-off-by: Claudius Heine <ch@denx.de>
---
 ...missing-opencv-data-dir-in-yocto-buil.patch | 17 ++++++++---------
 .../0005-msdk-fix-includedir-path.patch        | 18 +++++++++---------
 ....bb =3D> gstreamer1.0-plugins-bad_1.19.90.bb} |  4 +---
 3 files changed, 18 insertions(+), 21 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.18.=
5.bb =3D> gstreamer1.0-plugins-bad_1.19.90.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0=
004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch b/meta/rec=
ipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-opencv-resolve-mi=
ssing-opencv-data-dir-in-yocto-buil.patch
index b816709066..2b9854b45e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-ope=
ncv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-ope=
ncv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
@@ -19,31 +19,30 @@ diff --git a/ext/opencv/meson.build b/ext/opencv/meso=
n.build
 index 0b0b3fc..0ed3344 100644
 --- a/ext/opencv/meson.build
 +++ b/ext/opencv/meson.build
-@@ -78,20 +78,21 @@ else
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
index cb3bb7d361..5a89be79d0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-msd=
k-fix-includedir-path.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-msd=
k-fix-includedir-path.patch
@@ -16,16 +16,16 @@ diff --git a/sys/msdk/meson.build b/sys/msdk/meson.bu=
ild
 index 6346c9451..068f38548 100644
 --- a/sys/msdk/meson.build
 +++ b/sys/msdk/meson.build
-@@ -40,7 +40,9 @@ endif
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
.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.1=
9.90.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.=
18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.19=
.90.bb
index f90dff693d..21ab28cc92 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.18.5.b=
b
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.19.90.=
bb
@@ -11,7 +11,7 @@ SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-=
plugins-bad/gst-plugins-bad
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-b=
uil.patch \
            file://0005-msdk-fix-includedir-path.patch \
            "
-SRC_URI[sha256sum] =3D "a164923b94f0d08578a6fcaeaac6e0c05da788a46903a108=
6870e9ca45ad678e"
+SRC_URI[sha256sum] =3D "817cde39be30609e562c5b99d0e40527d58bd2319bc7a46e=
b8bec27f713f55ca"
=20
 S =3D "${WORKDIR}/gst-plugins-bad-${PV}"
=20
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


