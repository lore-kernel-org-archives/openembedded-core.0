Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id C001B7586F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 19:28:50 +0000 (UTC)
Received: by wiwd19 with SMTP id d19so57880573wiw.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 12:28:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=vCDpx+yioTGxnuKq2LMrriyy2sPVbw+p3Fe++wdMQ08=;
	b=eywWYPaaSjArs3hLZ3FiFj9qIvXLVw3ARK2jVhQm/dg+pIs17Axqej4xud6kgxaVhl
	Temdg4W1zX61a7dWeYVIvmbn68MslQKXhVIMwaVJ2FztxOluCMvq6sW2az1MRW3/4nAU
	g1kgh6UW3wOOXCPA4u1ZExAXEgVLu5JaUQYPJJbWZlby0IbwXenxO8S8mlpjVegtWU1o
	OMSjoMn4HkXL4cCVbm0eMvCeNj6Xmiv2IMS2cw6f29MIXweVbkdOrb2V1p/exdkCuEzV
	jH8WyyoOqgSGGJm1jX9jwYQUvTGmzwka3cNyoqEInd60pKPwSMHWDWWo7epILhn5KD7s
	NIpQ==
X-Gm-Message-State: ALoCoQlBign1wwrE9gD39lf0TrYO9hEK0ZRf90WzSzvi3ugIDXi6/tCEPU0GrqynVva7p2lB763L
X-Received: by 10.194.81.169 with SMTP id b9mr8801041wjy.126.1433964531578;
	Wed, 10 Jun 2015 12:28:51 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id k2sm9326010wix.4.2015.06.10.12.28.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Jun 2015 12:28:50 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jun 2015 20:24:09 +0100
Message-Id: <1433964249-24794-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] piglit: upgrade to more recent srvrev
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
X-List-Received-Date: Wed, 10 Jun 2015 19:28:50 -0000

Upgrade to 126c7d from December 2014.  Still not the latest but it's got no
added build dependencies and importantly handles installs out of the box instead
of us having to hack and kludge, and builds with cmake 3.x.

The usage has changed: now there's a "piglit" binary that has run/resume/summary
subcommands, for example:

$ piglit run quick quick-results/

For reference the quick test suite on a IvyBridge NUC results in:

[27714/27714] crash: 3, fail: 326, pass: 18275, skip: 9107, warn: 3 -

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../piglit/piglit/cmake-module-path.patch          | 29 ++++++++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb         | 40 +++++-----------------
 2 files changed, 37 insertions(+), 32 deletions(-)
 create mode 100644 meta/recipes-graphics/piglit/piglit/cmake-module-path.patch

diff --git a/meta/recipes-graphics/piglit/piglit/cmake-module-path.patch b/meta/recipes-graphics/piglit/piglit/cmake-module-path.patch
new file mode 100644
index 0000000..0afe088
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/cmake-module-path.patch
@@ -0,0 +1,29 @@
+It turns out that project() reads the toolchain file which then forcibly sets
+CMAKE_MODULE_PATH, so piglit can find its own modules (eg FindNumpy).
+
+So, move the extension of CMAKE_MODULE_PATH to after project() so the build
+succeeds.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index db5f718..aea9534 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,7 +1,5 @@
+ cmake_minimum_required(VERSION 2.8.5)
+ 
+-list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/Modules")
+-
+ INCLUDE (GNUInstallDirs)
+ INCLUDE (CheckCCompilerFlag)
+ INCLUDE (CheckCSourceCompiles)
+@@ -11,6 +9,7 @@ INCLUDE (CheckIncludeFile)
+ INCLUDE (FindPkgConfig)
+ 
+ project (piglit)
++list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake/Modules")
+ 
+ # Require MSVC 2013 U4
+ if (MSVC)
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index e33e4a7..b201a0a 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -2,10 +2,11 @@ SUMMARY = "OpenGL driver testing framework"
 LICENSE = "MIT & LGPLv2+ & GPLv3 & GPLv2+ & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
 
-SRC_URI = "git://anongit.freedesktop.org/piglit"
+SRC_URI = "git://anongit.freedesktop.org/piglit \
+           file://cmake-module-path.patch"
 
-# From 2012/12/30.
-SRCREV = "bbeff5d21b06d37338ad28e42d88f499bef13268"
+# From 2014/12/04
+SRCREV = "126c7d049b8f32e541625d5a35fbc5f5e4e7fbf8"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
@@ -17,40 +18,15 @@ inherit cmake pythonnative distro_features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-# As piglit doesn't install, enforce in-tree builds so that we can easily copy
-# contents out of $S and $B.
-B="${S}"
-
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[freeglut] = "-DPIGLIT_USE_GLUT=1,-DPIGLIT_USE_GLUT=0,freeglut,"
 
-# CMake sets the rpath at build time with the source tree, and will reset it at
-# install time. As we don't install this doesn't happen, so force the rpath to
-# what we need.
-EXTRA_OECMAKE = "-DCMAKE_BUILD_WITH_INSTALL_RPATH=1 -DCMAKE_INSTALL_RPATH=${libdir}/piglit/lib"
-
-do_install() {
-	install -d ${D}${bindir}
-	install -m 0755 piglit-*.py ${D}${bindir}
-
-	install -d ${D}${libdir}/piglit/
-
-	install -d ${D}${libdir}/piglit/bin
-	install -m 755 ${S}/bin/* ${D}${libdir}/piglit/bin
-
-	cp -Pr lib/ ${D}${libdir}/piglit/
-	cp -Pr framework/ ${D}${libdir}/piglit/
-	cp -Pr generated_tests/ ${D}${libdir}/piglit/
-	cp -Pr tests/ ${D}${libdir}/piglit/
-	cp -Pr templates/ ${D}${libdir}/piglit/
-
-	sed -i -e 's|sys.path.append(.*)|sys.path.append("${libdir}/piglit")|' ${D}${bindir}/piglit-*.py
-	sed -i -e 's|^templatedir = .*$|templatedir = "${libdir}/piglit/templates"|' ${D}${bindir}/piglit-summary-html.py
-}
-
 FILES_${PN}-dbg += "${libdir}/piglit/*/.debug/"
 
-RDEPENDS_${PN} = "python waffle python-json python-subprocess \
+RDEPENDS_${PN} = "waffle python python-mako python-json python-subprocess \
+	python-argparse python-importlib python-unixadmin \
 	python-multiprocessing python-textutils python-netserver python-shell \
 	mesa-demos bash \
 	"
+
+INSANE_SKIP_${PN} += "dev-so"
\ No newline at end of file
-- 
2.1.4


