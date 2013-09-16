Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 16FB260F85
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 08:26:31 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id hn9so3083030wib.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 01:26:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=031O0J+x7wRmLwbDE0qDsHqYVua6aRbad3KFhHOksTk=;
	b=Ie/fvnwLmNh2J/2pvG03M3nIQmUz0As6i/Yz89p+75nwmzFUCnz0S5D6pemrZm+ztA
	Qq3zZfaaZy89BMqs4PPDI74x1rm1/P5lhxidYoySz/Watg9kIjE6IZrXQ0ButAboHgaV
	sS1UbWPuAaCqKiU3t72q9yX/C5tB+2vhNW6/gNnAZE1YvRw4Ss+1aXLfEezRleDzGQwY
	jzuLbJKri5GFwKhLjgDg9pDPRMDGIwWtcL/nIjMxnxY+fp+ghjs3v+jLlxGMJXk2V8GL
	CrqWTWQVUoyIcWb8ee8craoYtPB/W2IQRP4a8dh6Gx43Pm4sWyEd7h0bBhMx3hUUzuSL
	mheA==
X-Gm-Message-State: ALoCoQkteTJfVkTT4+EjP3BgBIXycnFUdfZfwuWSicNwTMIFiEw/gvNkhKUZyS3MCshLsQT16jNO
X-Received: by 10.195.13.164 with SMTP id ez4mr21510336wjd.11.1379319992908;
	Mon, 16 Sep 2013 01:26:32 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id li9sm21747874wic.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 16 Sep 2013 01:26:32 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Sep 2013 09:26:28 +0100
Message-Id: <1379319989-9475-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] transfig-native: remove, nothing depends on it
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
X-List-Received-Date: Mon, 16 Sep 2013 08:26:33 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../transfig/transfig-native_3.2.5d.bb             |   39 --------------------
 .../packagegroups/packagegroup-toolset-native.bb   |    1 -
 2 files changed, 40 deletions(-)
 delete mode 100644 meta/recipes-devtools/transfig/transfig-native_3.2.5d.bb

diff --git a/meta/recipes-devtools/transfig/transfig-native_3.2.5d.bb b/meta/recipes-devtools/transfig/transfig-native_3.2.5d.bb
deleted file mode 100644
index c20a243..0000000
--- a/meta/recipes-devtools/transfig/transfig-native_3.2.5d.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY = "Utilities for converting XFig figure files"
-DESCRIPTION = "This package contains utilities (mainly fig2dev) to \
-handle XFig (Facility for Interactive Generation of figures) files."
-HOMEPAGE = "http://www-epb.lbl.gov/xfig/"
-SECTION = "console/utils"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://fig2dev/fig2dev.c;endline=16;md5=6bab01e017409cf9ab21d3e953b793f7"
-PR = "r1"
-
-DEPENDS = "imake-native xorg-cf-files-native zlib-native jpeg-native libpng-native libxpm-native"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/mcj/transfig.${PV}.tar.gz"
-
-SRC_URI[md5sum] = "f9eac7f265668ecbfda6aaf7581989ad"
-SRC_URI[sha256sum] = "ae81214177fb05f91f6e43b0b42633b6e0024570cbc6591a3858e12100ce8aaa"
-
-S = "${WORKDIR}/transfig.${PV}"
-
-EXTRA_OEMAKE = "-I${S}"
-
-inherit native
-
-do_configure() {
-	xmkmf
-	make Makefiles
-
-	# Fix hardcoded references to host build locations
-	sed -i -e "s|SYSTEMUSRLIBDIR = /usr/lib64|SYSTEMUSRLIBDIR = ${libdir}|g" fig2dev/Makefile
-	sed -i -e "s|SYSTEMUSRINCDIR = /usr/include|SYSTEMUSRINCDIR = ${includedir}|g" fig2dev/Makefile
-	sed -i -e "s|XPMINC = -I/usr/include/X11|XPMINC = -I${includedir}/X11|g" fig2dev/Makefile 
-	sed -i -e "s|/usr/lib64|/usr/lib|g" fig2dev/Makefile || true
-	sed -i -e "s|/usr/lib64|/usr/lib|g" fig2dev/dev/Makefile || true
-	sed -i -e "s|/usr/local/lib|${libdir}|g" fig2dev/Makefile
-	sed -i -e "s|/usr/local/lib|${libdir}|g" fig2dev/dev/Makefile
-}
-
-do_install() {
-	oe_runmake install DESTDIR=${D}
-}
diff --git a/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb b/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb
index 82ee820..934b1be 100644
--- a/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb
+++ b/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb
@@ -213,7 +213,6 @@ DEPENDS = "\
     tcl-native \
     texinfo-native \
     tiff-native \
-    transfig-native \
     tzcode-native \
     u-boot-mkimage-native \
     unfs-server-native \
-- 
1.7.10.4


