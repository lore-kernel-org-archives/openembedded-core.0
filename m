Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by mx.groups.io with SMTP id smtpd.web11.44201.1590461608907147239
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 19:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denx.de, ip: 212.18.0.10, mailfrom: marex@denx.de)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 49WJS73Hcnz1rx8y;
	Tue, 26 May 2020 04:53:27 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 49WJS72sgpz1qr4y;
	Tue, 26 May 2020 04:53:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
	with ESMTP id 7OseCjKV67YQ; Tue, 26 May 2020 04:53:25 +0200 (CEST)
X-Auth-Info: 6u8UD8HoFR23FA8izMT+jg2D8mdVvDxVv1vnziDSjnE=
Received: from desktop.lan (ip-86-49-35-8.net.upcbroadband.cz [86.49.35.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 26 May 2020 04:53:25 +0200 (CEST)
From: "Marek Vasut" <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: akuster808@gmail.com,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH 01/12] [zeus] gstreamer1.0-python: add a patch to fix python 3.8 builds
Date: Tue, 26 May 2020 04:52:49 +0200
Message-Id: <20200526025300.295408-1-marex@denx.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...son.build-fix-builds-with-python-3.8.patch | 24 +++++++++++++++++++
 .../gstreamer/gstreamer1.0-python_1.16.1.bb   |  4 +++-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-python=
/0001-meson.build-fix-builds-with-python-3.8.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-m=
eson.build-fix-builds-with-python-3.8.patch b/meta/recipes-multimedia/gst=
reamer/gstreamer1.0-python/0001-meson.build-fix-builds-with-python-3.8.pa=
tch
new file mode 100644
index 0000000000..053108ad50
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python/0001-meson.bu=
ild-fix-builds-with-python-3.8.patch
@@ -0,0 +1,24 @@
+From 61cfd1b49dc82baf14bb36d88b6c5be7b8c3d23a Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Mon, 2 Dec 2019 18:16:41 +0100
+Subject: [PATCH] meson.build: fix builds with python 3.8
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/gstreamer/gst=
-python/merge_requests/14]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 1da81d5..3e0db38 100644
+--- a/meson.build
++++ b/meson.build
+@@ -24,7 +24,7 @@ pygobject_dep =3D dependency('pygobject-3.0', fallback=
: ['pygobject', 'pygobject_d
+=20
+ pymod =3D import('python')
+ python =3D pymod.find_installation(get_option('python'))
+-python_dep =3D python.dependency(required : true)
++python_dep =3D dependency('python3-embed', required : true)
+=20
+ python_abi_flags =3D python.get_variable('ABIFLAGS', '')
+ pylib_loc =3D get_option('libpython-dir')
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1=
.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
index 5a950f183c..c0f8b5aaa3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.16.1.bb
@@ -5,7 +5,9 @@ SECTION =3D "multimedia"
 LICENSE =3D "LGPLv2.1"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc34deae4e395ca07e725ab0076a5f=
740"
=20
-SRC_URI =3D "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-$=
{PV}.tar.xz"
+SRC_URI =3D "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-$=
{PV}.tar.xz \
+           file://0001-meson.build-fix-builds-with-python-3.8.patch \
+           "
 SRC_URI[md5sum] =3D "499645fbd1790c5845c02a3998dccc1b"
 SRC_URI[sha256sum] =3D "b469c8955126f41b8ce0bf689b7029f182cd305f422b3a8d=
f35b780bd8347489"
=20
--=20
2.25.1

