Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 88F44731E8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 16:18:30 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 12 Jan 2016 08:18:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,558,1444719600"; d="scan'208";a="879853668"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 12 Jan 2016 08:18:29 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 9E4B16A4002
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 09:06:26 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jan 2016 18:20:32 +0200
Message-Id: <1452615632-5232-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1452615632-5232-1-git-send-email-maxin.john@intel.com>
References: <1452615632-5232-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/2] sqlite3: upgrade to version 3.10.0
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
X-List-Received-Date: Tue, 12 Jan 2016 16:18:30 -0000

3.9.2 -> 3.10.0

Fixed a parallel build problem.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/sqlite/sqlite3/parallel.patch | 24 ++++++++++++++++++++++
 .../sqlite/{sqlite3_3.9.2.bb => sqlite3_3.10.0.bb} |  8 +++++---
 2 files changed, 29 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-support/sqlite/sqlite3/parallel.patch
 rename meta/recipes-support/sqlite/{sqlite3_3.9.2.bb => sqlite3_3.10.0.bb} (71%)

diff --git a/meta/recipes-support/sqlite/sqlite3/parallel.patch b/meta/recipes-support/sqlite/sqlite3/parallel.patch
new file mode 100644
index 0000000..87471f0
--- /dev/null
+++ b/meta/recipes-support/sqlite/sqlite3/parallel.patch
@@ -0,0 +1,24 @@
+build: Fix parallel build problems
+
+Avoid parallel build errors related to sqlite3.o target.
+
+Upstream-Status: Pending
+
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+diff -Naur sqlite-autoconf-3100000-orig/Makefile.am sqlite-autoconf-3100000/Makefile.am
+--- sqlite-autoconf-3100000-orig/Makefile.am	2016-01-06 14:03:00.000000000 +0200
++++ sqlite-autoconf-3100000/Makefile.am	2016-01-12 13:14:03.620117514 +0200
+@@ -6,10 +6,8 @@
+ libsqlite3_la_LDFLAGS = -no-undefined -version-info 8:6:8
+ 
+ bin_PROGRAMS = sqlite3
+-sqlite3_SOURCES = shell.c sqlite3.h
+-EXTRA_sqlite3_SOURCES = sqlite3.c
+-sqlite3_LDADD = @EXTRA_SHELL_OBJ@ @READLINE_LIBS@
+-sqlite3_DEPENDENCIES = @EXTRA_SHELL_OBJ@
++sqlite3_SOURCES = shell.c sqlite3.c sqlite3.h
++sqlite3_LDADD = @READLINE_LIBS@
+ sqlite3_CFLAGS = $(AM_CFLAGS)
+ 
+ include_HEADERS = sqlite3.h sqlite3ext.h
diff --git a/meta/recipes-support/sqlite/sqlite3_3.9.2.bb b/meta/recipes-support/sqlite/sqlite3_3.10.0.bb
similarity index 71%
rename from meta/recipes-support/sqlite/sqlite3_3.9.2.bb
rename to meta/recipes-support/sqlite/sqlite3_3.10.0.bb
index 18b1a2b..092f782 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.9.2.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.10.0.bb
@@ -10,10 +10,12 @@ def sqlite_download_version(d):
 
 PE = "3"
 SQLITE_PV = "${@sqlite_download_version(d)}"
-SRC_URI = "http://www.sqlite.org/2015/sqlite-autoconf-${SQLITE_PV}.tar.gz"
+SRC_URI = "http://www.sqlite.org/2016/sqlite-autoconf-${SQLITE_PV}.tar.gz \
+           file://parallel.patch \
+          "
 
-SRC_URI[md5sum] = "bc4eb5b3fc5cfcb6e059794306cac1ca"
-SRC_URI[sha256sum] = "064c0abe9c9177534d4c770bca7a5902f9924b629ac886b4c08956be6dfbc36b"
+SRC_URI[md5sum] = "274364e6ca5c1104d42912f11e61ed26"
+SRC_URI[sha256sum] = "43cc292d70711fa7580250c8a1cd7c64813a4a0a479dbd502cce5f10b5d91042"
 
 UPSTREAM_CHECK_URI = "http://www.sqlite.org/"
 UPSTREAM_CHECK_REGEX = "releaselog/(?P<pver>(\d+[\.\-_]*)+)\.html"
-- 
2.4.0


