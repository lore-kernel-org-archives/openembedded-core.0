Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8F9F177026
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 07:34:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u377YYnU008226
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Apr 2016 00:34:34 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 7 Apr 2016 00:34:33 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Apr 2016 00:34:30 -0700
Message-ID: <0b7c3eace4e33f9b8ad6d14511b07de425b8abe5.1460014426.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1460014426.git.liezhi.yang@windriver.com>
References: <cover.1460014426.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] libsolv: fix installed-vs-shipped for nativesdk
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
X-List-Received-Date: Thu, 07 Apr 2016 07:34:35 -0000
Content-Type: text/plain

Fixed:
ERROR: nativesdk-libsolv-0.6.19-r0 do_package: QA Issue: nativesdk-libsolv: Files/directories were installed but not shipped in any package:
  /opt/poky/2.0+snapshot/sysroots/x86_64-pokysdk-linux/usr/man
  /opt/poky/2.0+snapshot/sysroots/x86_64-pokysdk-linux/usr/man/man3
  /opt/poky/2.0+snapshot/sysroots/x86_64-pokysdk-linux/usr/man/man1
  /opt/poky/2.0+snapshot/sysroots/x86_64-pokysdk-linux/usr/man/man3/libsolv-constantids.3
  /opt/poky/2.0+snapshot/sysroots/x86_64-pokysdk-linux/usr/man/man3/libsolv.3
  /opt/poky/2.0+snapshot/sysroots/x86_64-pokysdk-linux/usr/man/man3/libsolv-history.3
  /opt/poky/2.0+snapshot/sysroots/x86_64-pokysdk-linux/usr/man/man3/libsolv-pool.3
  /opt/poky/2.0+snapshot/sysroots/x86_64-pokysdk-linux/usr/man/man3/libsolv-bindings.3
  /opt/poky/2.0+snapshot/sysroots/x86_64-pokysdk-linux/usr/man/man1/mergesolv.1
  /opt/poky/2.0+snapshot/sysroots/x86_64-pokysdk-linux/usr/man/man1/testsolv.1
  /opt/poky/2.0+snapshot/sysroots/x86_64-pokysdk-linux/usr/man/man1/installcheck.1
  /opt/poky/2.0+snapshot/sysroots/x86_64-pokysdk-linux/usr/man/man1/dumpsolv.1

It checks ${CMAKE_INSTALL_PREFIX}/share/man when configure, but it may
not exist when crosscompile, for example, when CMAKE_INSTALL_PREFIX="/",
it is OK, but when CMAKE_INSTALL_PREFIX="/some/path/else", then it
doesn't exist, and the man dir would be set to "/usr/man" which is
incorrect.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../0001-CMakeLists.txt-fix-MAN_INSTALL_DIR.patch  | 37 ++++++++++++++++++++++
 meta/recipes-extended/libsolv/libsolv_git.bb       |  4 ++-
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libsolv/libsolv/0001-CMakeLists.txt-fix-MAN_INSTALL_DIR.patch

diff --git a/meta/recipes-extended/libsolv/libsolv/0001-CMakeLists.txt-fix-MAN_INSTALL_DIR.patch b/meta/recipes-extended/libsolv/libsolv/0001-CMakeLists.txt-fix-MAN_INSTALL_DIR.patch
new file mode 100644
index 0000000..972ecc9
--- /dev/null
+++ b/meta/recipes-extended/libsolv/libsolv/0001-CMakeLists.txt-fix-MAN_INSTALL_DIR.patch
@@ -0,0 +1,37 @@
+From 280f0d37c642d68bad2a2e49ef437953474d99e6 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 6 Apr 2016 23:15:02 -0700
+Subject: [PATCH] CMakeLists.txt: fix MAN_INSTALL_DIR
+
+It checks ${CMAKE_INSTALL_PREFIX}/share/man when configure, but it may
+not exist when crosscompile, for example, when CMAKE_INSTALL_PREFIX="/",
+it is OK, but when CMAKE_INSTALL_PREFIX="/some/path/else", then it
+doesn't exist, and the man dir would be set to "/usr/man" which is
+incorrect.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ CMakeLists.txt | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index fd1426b..747db22 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -57,10 +57,7 @@ else (DEFINED INCLUDE)
+ ENDIF (DEFINED  INCLUDE)
+ MESSAGE (STATUS "Header files will be installed in ${INCLUDE_INSTALL_DIR}")
+ SET (BIN_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/bin")
+-SET (MAN_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/man")
+-IF (IS_DIRECTORY "${CMAKE_INSTALL_PREFIX}/share/man"  AND NOT IS_DIRECTORY "${CMAKE_INSTALL_PREFIX}/man")
+-  SET (MAN_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/share/man")
+-ENDIF (IS_DIRECTORY "${CMAKE_INSTALL_PREFIX}/share/man"  AND NOT IS_DIRECTORY "${CMAKE_INSTALL_PREFIX}/man")
++SET (MAN_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/share/man")
+ MESSAGE(STATUS "Man pages will be installed in ${MAN_INSTALL_DIR}")
+ 
+ ####################################################################
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/libsolv/libsolv_git.bb b/meta/recipes-extended/libsolv/libsolv_git.bb
index c0b0120..fb81c8a 100644
--- a/meta/recipes-extended/libsolv/libsolv_git.bb
+++ b/meta/recipes-extended/libsolv/libsolv_git.bb
@@ -9,7 +9,9 @@ DEPENDS = "expat zlib"
 
 PV = "0.6.19"
 
-SRC_URI = "git://github.com/openSUSE/libsolv.git"
+SRC_URI = "git://github.com/openSUSE/libsolv.git \
+           file://0001-CMakeLists.txt-fix-MAN_INSTALL_DIR.patch \
+"
 SRCREV = "4c5af401a89858d4cebbfe40c59a0031ff9db5b0"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.7.4


