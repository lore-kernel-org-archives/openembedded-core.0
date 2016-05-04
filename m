Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BE9B660107
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 08:20:42 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 04 May 2016 01:20:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,576,1455004800"; d="scan'208";a="968335410"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 04 May 2016 01:20:43 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id EEB466A4007
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 02:08:17 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 May 2016 11:20:23 +0300
Message-Id: <1462350024-29932-10-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1462350024-29932-1-git-send-email-maxin.john@intel.com>
References: <1462350024-29932-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 09/10] sqlite3: upgrade to 3.12.2
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
X-List-Received-Date: Wed, 04 May 2016 08:20:42 -0000

3.11.0 -> 3.12.2

Remove upstreamed patch:
1. fix-disable-static-shell.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../sqlite/sqlite3/fix-disable-static-shell.patch  | 61 ----------------------
 meta/recipes-support/sqlite/sqlite3_3.11.0.bb      | 11 ----
 meta/recipes-support/sqlite/sqlite3_3.12.2.bb      |  9 ++++
 3 files changed, 9 insertions(+), 72 deletions(-)
 delete mode 100644 meta/recipes-support/sqlite/sqlite3/fix-disable-static-shell.patch
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.11.0.bb
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.12.2.bb

diff --git a/meta/recipes-support/sqlite/sqlite3/fix-disable-static-shell.patch b/meta/recipes-support/sqlite/sqlite3/fix-disable-static-shell.patch
deleted file mode 100644
index 6f39ae2..0000000
--- a/meta/recipes-support/sqlite/sqlite3/fix-disable-static-shell.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From ede5db83e38cc8ad8c9be291cd8985f7ad99f291 Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <armccurdy@gmail.com>
-Date: Tue, 16 Feb 2016 14:00:00 -0800
-Subject: [PATCH] fix --disable-static-shell
-
-Upstream sqlite seems to be moving further and further away from
-allowing the sqlite3 command line tool to be dynamically linked with
-sqlite.
-
-The --disable-static-shell configure option added in 3.10.0 no longer
-has any effect in 3.11.0. For now patch things up and make it work.
-
-Upstream-Status: Pending
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
----
- Makefile.am  | 13 +++++++++++--
- configure.ac |  2 +-
- 2 files changed, 12 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 0e09cfc..608c0fd 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -6,9 +6,18 @@ libsqlite3_la_SOURCES = sqlite3.c
- libsqlite3_la_LDFLAGS = -no-undefined -version-info 8:6:8
- 
- bin_PROGRAMS = sqlite3
--sqlite3_SOURCES = shell.c sqlite3.c sqlite3.h
--sqlite3_LDADD = @READLINE_LIBS@
-+sqlite3_SOURCES = shell.c sqlite3.h
-+EXTRA_sqlite3_SOURCES = sqlite3.c
-+sqlite3_LDADD = @EXTRA_SHELL_OBJ@ @READLINE_LIBS@
- sqlite3_DEPENDENCIES = @EXTRA_SHELL_OBJ@
-+
-+# Warning: Adding SQLITE_ENABLE_EXPLAIN_COMMENTS to sqlite3_CFLAGS doesn't
-+# actually have any effect if we link the sqlite3 command line tool with the
-+# libsqlite3.so shared library (which will contain a version of sqlite3.c
-+# compiled with the default AM_CFLAGS above). If SQLITE_ENABLE_EXPLAIN_COMMENTS
-+# debug is required, then sqlite3 must not be configured with
-+# --disable-static-shell
-+
- sqlite3_CFLAGS = $(AM_CFLAGS) -DSQLITE_ENABLE_EXPLAIN_COMMENTS
- 
- include_HEADERS = sqlite3.h sqlite3ext.h
-diff --git a/configure.ac b/configure.ac
-index 8e7fd69..ada559e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -130,7 +130,7 @@ AC_ARG_ENABLE(static-shell, [AS_HELP_STRING(
-   [statically link libsqlite3 into shell tool [default=yes]])], 
-   [], [enable_static_shell=yes])
- if test x"$enable_static_shell" == "xyes"; then
--  EXTRA_SHELL_OBJ=sqlite3.$OBJEXT
-+  EXTRA_SHELL_OBJ=sqlite3-sqlite3.$OBJEXT
- else
-   EXTRA_SHELL_OBJ=libsqlite3.la
- fi
--- 
-1.9.1
-
diff --git a/meta/recipes-support/sqlite/sqlite3_3.11.0.bb b/meta/recipes-support/sqlite/sqlite3_3.11.0.bb
deleted file mode 100644
index 992d20c..0000000
--- a/meta/recipes-support/sqlite/sqlite3_3.11.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require sqlite3.inc
-
-LICENSE = "PD"
-LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
-
-SRC_URI = "http://www.sqlite.org/2016/sqlite-autoconf-${SQLITE_PV}.tar.gz \
-           file://fix-disable-static-shell.patch \
-"
-
-SRC_URI[md5sum] = "a6cdc3e0a6e5087d620037ae0c48720d"
-SRC_URI[sha256sum] = "508d4dcbcf7a7181e95c717a1dc4ae3c0880b3d593be0c4b40abb6c3a0e201fb"
diff --git a/meta/recipes-support/sqlite/sqlite3_3.12.2.bb b/meta/recipes-support/sqlite/sqlite3_3.12.2.bb
new file mode 100644
index 0000000..9c073b3
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3_3.12.2.bb
@@ -0,0 +1,9 @@
+require sqlite3.inc
+
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=65f0a57ca6928710b418c094b3570bb0"
+
+SRC_URI = "http://www.sqlite.org/2016/sqlite-autoconf-${SQLITE_PV}.tar.gz"
+
+SRC_URI[md5sum] = "c552a133aca1ce1d647163d9e43bbcb1"
+SRC_URI[sha256sum] = "fd00770c9afd39db555c78400e52f55e8bd6568c78be23561abb472a22d09abb"
-- 
2.4.0


