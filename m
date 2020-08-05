Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.7080.1596633754826775934
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 06:22:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qtec.com header.s=google header.b=gMBYxloX;
 spf=pass (domain: qtec.com, ip: 209.85.167.44, mailfrom: daniel@qtec.com)
Received: by mail-lf1-f44.google.com with SMTP id i80so24236343lfi.13
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 06:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uVQrJcSFdUIQ6bF59CR5TnJYrDaExRyR6GRHHGbFlmo=;
        b=gMBYxloXqCOYzk8a1d70vPKD6D1MTyd+dbXNuTM6FpXYQxABsh81T1NPP3XOviTJTP
         mzdaQpX2wO4Lm9uX7uJnqC/8WLOWX6IJjUu2FY7r/TmUchbvW+27pjCTcA8s9O1gS2nA
         9jQXxaSmeMhg1qHpbhc3MwwFqzDmSP6l6XSUlewBLspE8/sh5fmTMtMvTNB8qsOo9uyW
         LgG4CHz3gCxtft4Kt7szEss4KiuFlrlvyZkDVdEzTS+u/RXbaxeD96FgIXEXoIwjnl0f
         8KjTG+8rXuk763iiu+FLKcNl9YEaIJ3N86sH0HfnTfc3jt/nsut3MnLQKehZoMMRs6UZ
         NpbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uVQrJcSFdUIQ6bF59CR5TnJYrDaExRyR6GRHHGbFlmo=;
        b=YNxgqeqwDCi3bdKIHL0jQ18y8TXPFVBu9uPOyyDtRo6eqN80oSvZR/Hvgbdo9mC8aq
         LpkQ6RePCRCyGRt84DrL5Kl5cNJxM9mmkPSHu+pYMNBx1BuVzTKDcHvkpDoaodfH7wT7
         xe5fHV9DscvFUHCAIaHu/ub0RRxLm0iWtH2RENvq50XEnkrmY40FuDos/kWFUk/BgwB4
         HIPCr+unbcUYsPW/OucVkNY1ueu/oWD58Ev7SaQgcYzNz+qWn6/nSkKQ8rZCgI+wHlWG
         3UpDWiV+D3NlF99bLEijlZ6SaGt264B5pi07G80fmWFVFiFsyBetywtgq26+yg3E87BB
         asrg==
X-Gm-Message-State: AOAM532nskluHFoJw7AeCk8VqAK7qAoyXgMkp7EJScTo4vtjN5u4WZjM
	Caqyqwcgn3tgVKVI9oR4iLaSQYw4M9bRO+j19LIURCtEK/hWrlxJzQoySmoQME5H6ZnmaH+sEsq
	qYl8MzIAysoT8bwfO+2ksDGWU6Sc5O3ycGUhJRzNHSp6XJ9UybqIcgweF4fAI3/cgwraSTfJh/S
	k6T2RIVTnfsA==
X-Google-Smtp-Source: ABdhPJy2uh27kM6PEIhHNlT8vVAIGciMsMzx+9lGFmdy155xbwVd+hEu829TTb5UqtgUha4M9C60kQ==
X-Received: by 2002:a19:983:: with SMTP id 125mr1617852lfj.129.1596633752389;
        Wed, 05 Aug 2020 06:22:32 -0700 (PDT)
Return-Path: <daniel@qtec.com>
Received: from turia.fritz.box (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id x6sm1091667lff.64.2020.08.05.06.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 06:22:31 -0700 (PDT)
From: "Daniel Gomez" <daniel@qtec.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel Gomez <daniel@qtec.com>
Subject: [OE-core][PATCH] allarch: Fix wrong dependencies
Date: Wed,  5 Aug 2020 15:22:24 +0200
Message-Id: <20200805132224.616205-1-daniel@qtec.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In all these cases, allarch is used but the package dependencies are not
allarch. It generates a conflict when the same package is built for different
MACHINES at the same time.

Here a build error for the ttf-ubuntu-font-family in a multiconfig enviroment:

ERROR: mc:qt5507:ttf-ubuntu-font-family-0.83-r1
do_package_write_deb:
Fatal errors occurred in subprocesses:
Command
'PATH="/workdir/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/workdir/repo/poky/scripts:/workdir/build/tmp/work/all-poky-linux/ttf-ubuntu-font-family/0.83-r1/recipe-sysroot-native/usr/bin/allarch-poky-linux:/workdir/build/tmp/work/all-poky-linux/ttf-ubuntu-font-family/0.83-r1/recipe-sysroot/usr/bin/crossscripts:/workdir/build/tmp/work/all-poky-linux/ttf-ubuntu-font-family/0.83-r1/recipe-sysroot-native/usr/sbin:/workdir/build/tmp/work/all-poky-linux/ttf-ubuntu-font-family/0.83-r1/recipe-sysroot-native/usr/bin:/workdir/build/tmp/work/all-poky-linux/ttf-ubuntu-font-family/0.83-r1/recipe-sysroot-native/sbin:/workdir/build/tmp/work/all-poky-linux/ttf-ubuntu-font-family/0.83-r1/recipe-sysroot-native/bin:/workdir/repo/poky/bitbake/bin:/workdir/build/tmp/hosttools"
dpkg-deb -b
/workdir/build/tmp/work/all-poky-linux/ttf-ubuntu-font-family/0.83-r1/packages-split/ttf-ubuntu-sans
/workdir/build/tmp/work/all-poky-linux/ttf-ubuntu-font-family/0.83-r1/deploy-debs/all'
returned non-zero exit status 2
Subprocess output:dpkg-deb: building package 'ttf-ubuntu-sans' in
'/workdir/build/tmp/work/all-poky-linux/ttf-ubuntu-font-family/0.83-r1/deploy-debs/all'.
dpkg-deb: error: unable to create
'/workdir/build/tmp/work/all-poky-linux/ttf-ubuntu-font-family/0.83-r1/deploy-debs/all':
No such file or directory

ERROR: mc:qt5507:ttf-ubuntu-font-family-0.83-r1
do_package_write_deb:
ERROR: mc:qt5507:ttf-ubuntu-font-family-0.83-r1
do_package_write_deb:
Function failed: do_package_deb
ERROR: Logfile of failure stored in:
/workdir/build/tmp/work/all-poky-linux/ttf-ubuntu-font-family/0.83-r1/temp/log.do_package_write_deb.11826
NOTE: recipe ttf-ubuntu-font-family-0.83-r1: task
do_package_write_deb:
Failed
ERROR: Task
(multiconfig:qt5507:/workdir/repo/poky/../meta-qtec-hockey/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.83.bb:do_package_write_deb)
failed with exit code '1'

Similar patch:
https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-graphics/ttf-fonts?id=0d9f7900dec4ec68d8ad6c8a455e5b4f068e3715

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---
 meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb    | 2 +-
 .../ttf-fonts/source-han-sans-cn-fonts_1.004.bb                 | 2 +-
 .../ttf-fonts/source-han-sans-jp-fonts_1.004.bb                 | 2 +-
 .../ttf-fonts/source-han-sans-kr-fonts_1.004.bb                 | 2 +-
 .../ttf-fonts/source-han-sans-tw-fonts_1.004.bb                 | 2 +-
 meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb           | 2 +-
 meta-oe/recipes-graphics/ttf-fonts/ttf.inc                      | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb b/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb
index c460fc35c..23a73b37b 100644
--- a/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb
+++ b/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
 SRC_URI[md5sum] = "a8e792fe6e84c86ed2b6ed3e2a12ba66"
 SRC_URI[sha256sum] = "f6f4876a4dabe6a37c270c20bb9e141e38fb50e0bba200e1b9d0470e5eed97b7"

-inherit allarch fontcache
+inherit fontcache

 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[x11] = ""
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_1.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_1.004.bb
index 9fbfc8b49..04ab188e6 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_1.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-cn-fonts_1.004.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/adobe-fonts/source-han-sans"
 LICENSE = "OFL-1.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=55719faa0112708e946b820b24b14097"

-inherit allarch fontcache
+inherit fontcache

 # Download tends to break - so - or not?
 #EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_1.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_1.004.bb
index 4a26a2f57..bb54e8aa5 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_1.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-jp-fonts_1.004.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/adobe-fonts/source-han-sans"
 LICENSE = "OFL-1.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=55719faa0112708e946b820b24b14097"

-inherit allarch fontcache
+inherit fontcache

 # Download tends to break - so - or not?
 #EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_1.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_1.004.bb
index c91d1671f..52df396da 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_1.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-kr-fonts_1.004.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/adobe-fonts/source-han-sans"
 LICENSE = "OFL-1.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=55719faa0112708e946b820b24b14097"

-inherit allarch fontcache
+inherit fontcache

 # Download tends to break - so - or not?
 #EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_1.004.bb b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_1.004.bb
index 728250538..3586836e6 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_1.004.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/source-han-sans-tw-fonts_1.004.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/adobe-fonts/source-han-sans"
 LICENSE = "OFL-1.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=55719faa0112708e946b820b24b14097"

-inherit allarch fontcache
+inherit fontcache

 # Download tends to break - so - or not?
 #EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb
index ac60a365f..ee5cf6b3a 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-pt-sans_1.1.bb
@@ -7,7 +7,7 @@ SECTION = "x11/fonts"
 LICENSE = "ParaTypeFFL-1.3"
 LIC_FILES_CHKSUM = "file://../PT%20Free%20Font%20License_eng.txt;md5=d720f3a281ed81c3f4cfc465e11b1d0d"

-inherit allarch fontcache
+inherit fontcache

 # Downloading from fedora because upstream doesn't version its zip file
 # and causes hash build failures
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf.inc b/meta-oe/recipes-graphics/ttf-fonts/ttf.inc
index c77af3993..9faa43a07 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf.inc
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf.inc
@@ -9,4 +9,4 @@ do_install() {
     find ./ -name '*.tt[cf]' -exec install -m 0644 {} ${D}${datadir}/fonts/truetype/ \;
 }

-inherit allarch fontcache
+inherit fontcache
--
2.27.0

