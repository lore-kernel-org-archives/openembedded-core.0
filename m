Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7472A7001D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 12:50:54 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 20 May 2016 05:50:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,339,1459839600"; d="scan'208";a="971116497"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 20 May 2016 05:50:55 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 06C4F6A4007
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2016 06:38:25 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 May 2016 15:51:21 +0300
Message-Id: <1463748682-22067-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1463748682-22067-1-git-send-email-maxin.john@intel.com>
References: <1463748682-22067-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 3/4] libsolv: update to 0.6.21
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
X-List-Received-Date: Fri, 20 May 2016 12:50:55 -0000

0.6.20 -> 0.6.21

Remove upstreamed patch:
        1. 0001-CMakeLists.txt-fix-MAN_INSTALL_DIR.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../0001-CMakeLists.txt-fix-MAN_INSTALL_DIR.patch  | 37 ----------------------
 meta/recipes-extended/libsolv/libsolv_git.bb       |  5 ++-
 2 files changed, 2 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-extended/libsolv/libsolv/0001-CMakeLists.txt-fix-MAN_INSTALL_DIR.patch

diff --git a/meta/recipes-extended/libsolv/libsolv/0001-CMakeLists.txt-fix-MAN_INSTALL_DIR.patch b/meta/recipes-extended/libsolv/libsolv/0001-CMakeLists.txt-fix-MAN_INSTALL_DIR.patch
deleted file mode 100644
index 972ecc9..0000000
--- a/meta/recipes-extended/libsolv/libsolv/0001-CMakeLists.txt-fix-MAN_INSTALL_DIR.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 280f0d37c642d68bad2a2e49ef437953474d99e6 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Wed, 6 Apr 2016 23:15:02 -0700
-Subject: [PATCH] CMakeLists.txt: fix MAN_INSTALL_DIR
-
-It checks ${CMAKE_INSTALL_PREFIX}/share/man when configure, but it may
-not exist when crosscompile, for example, when CMAKE_INSTALL_PREFIX="/",
-it is OK, but when CMAKE_INSTALL_PREFIX="/some/path/else", then it
-doesn't exist, and the man dir would be set to "/usr/man" which is
-incorrect.
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- CMakeLists.txt | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index fd1426b..747db22 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -57,10 +57,7 @@ else (DEFINED INCLUDE)
- ENDIF (DEFINED  INCLUDE)
- MESSAGE (STATUS "Header files will be installed in ${INCLUDE_INSTALL_DIR}")
- SET (BIN_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/bin")
--SET (MAN_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/man")
--IF (IS_DIRECTORY "${CMAKE_INSTALL_PREFIX}/share/man"  AND NOT IS_DIRECTORY "${CMAKE_INSTALL_PREFIX}/man")
--  SET (MAN_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/share/man")
--ENDIF (IS_DIRECTORY "${CMAKE_INSTALL_PREFIX}/share/man"  AND NOT IS_DIRECTORY "${CMAKE_INSTALL_PREFIX}/man")
-+SET (MAN_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/share/man")
- MESSAGE(STATUS "Man pages will be installed in ${MAN_INSTALL_DIR}")
- 
- ####################################################################
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/libsolv/libsolv_git.bb b/meta/recipes-extended/libsolv/libsolv_git.bb
index a16897e..b41347d 100644
--- a/meta/recipes-extended/libsolv/libsolv_git.bb
+++ b/meta/recipes-extended/libsolv/libsolv_git.bb
@@ -7,14 +7,13 @@ LIC_FILES_CHKSUM = "file://LICENSE.BSD;md5=62272bd11c97396d4aaf1c41bc11f7d8"
 
 DEPENDS = "expat zlib"
 
-PV = "0.6.20"
+PV = "0.6.21"
 
 SRC_URI = "git://github.com/openSUSE/libsolv.git \
-           file://0001-CMakeLists.txt-fix-MAN_INSTALL_DIR.patch \
           "
 SRC_URI_append_libc-musl = " file://0001-Add-fallback-fopencookie-implementation.patch"
 
-SRCREV = "513c572b10e18bea5ac78709267de4b739cb31e7"
+SRCREV = "bdb5c63245923ed95cf04086b65b2e5a5b5d7b04"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.4.0


