Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SirKU-0004YM-MT
	for openembedded-core@lists.openembedded.org;
	Sun, 24 Jun 2012 20:14:34 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2012 11:03:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="161983143"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.175])
	by orsmga002.jf.intel.com with ESMTP; 24 Jun 2012 11:03:42 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Jun 2012 11:03:29 -0700
Message-Id: <da406c3c7f0e904f0ab11e26d02dfa0f8e5ffa69.1340560914.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340560914.git.sgw@linux.intel.com>
References: <cover.1340560914.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340560914.git.sgw@linux.intel.com>
References: <cover.1340560914.git.sgw@linux.intel.com>
Subject: [PATCH 04/14] util-linux: Update to 2.21.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 24 Jun 2012 18:14:35 -0000

Remove patch that was corrected upstream

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../util-linux/fix_NL_TIME_FIRST_WEEKDAY.patch     |   24 --------------------
 .../{util-linux_2.21.1.bb => util-linux_2.21.2.bb} |    7 ++---
 2 files changed, 3 insertions(+), 28 deletions(-)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/fix_NL_TIME_FIRST_WEEKDAY.patch
 rename meta/recipes-core/util-linux/{util-linux_2.21.1.bb => util-linux_2.21.2.bb} (86%)

diff --git a/meta/recipes-core/util-linux/util-linux/fix_NL_TIME_FIRST_WEEKDAY.patch b/meta/recipes-core/util-linux/util-linux/fix_NL_TIME_FIRST_WEEKDAY.patch
deleted file mode 100644
index 545c3a9..0000000
--- a/meta/recipes-core/util-linux/util-linux/fix_NL_TIME_FIRST_WEEKDAY.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-configure uses AC_CHECK_DECLS to check for _NL_TIME_WEEK_1STDAY
-which means we will get HAVE_DECL__NL_TIME_WEEK_1STDAY
-defined to 1 if symbol is declared, otherwise to 0 in config.h
-
-Therefore we cannot rely on conditionals which check for it
-being defined or not since it always will be defined so correct
-thing is to use #if instead of #ifdef
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-Index: util-linux-2.21/misc-utils/cal.c
-===================================================================
---- util-linux-2.21.orig/misc-utils/cal.c	2012-02-29 23:41:54.413347665 -0800
-+++ util-linux-2.21/misc-utils/cal.c	2012-02-29 23:42:44.573350057 -0800
-@@ -297,7 +297,7 @@
-  * the locale database, which can be overridden with the
-  * -s (Sunday) or -m (Monday) options.
-  */
--#ifdef HAVE_DECL__NL_TIME_WEEK_1STDAY
-+#if HAVE_DECL__NL_TIME_WEEK_1STDAY
- 	/*
- 	 * You need to use 2 locale variables to get the first day of the week.
- 	 * This is needed to support first_weekday=2 and first_workday=1 for
diff --git a/meta/recipes-core/util-linux/util-linux_2.21.1.bb b/meta/recipes-core/util-linux/util-linux_2.21.2.bb
similarity index 86%
rename from meta/recipes-core/util-linux/util-linux_2.21.1.bb
rename to meta/recipes-core/util-linux/util-linux_2.21.2.bb
index 8492cdf..7f2c2a9 100644
--- a/meta/recipes-core/util-linux/util-linux_2.21.1.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.21.2.bb
@@ -1,5 +1,5 @@
 MAJOR_VERSION = "2.21"
-PR = "r1"
+PR = "r0"
 require util-linux.inc
 
 # note that `lscpu' is under GPLv3+
@@ -8,11 +8,10 @@ LICENSE_${PN}-lscpu = "GPLv3+"
 SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
             file://util-linux-ng-2.16-mount_lock_path.patch \
             file://uclibc-__progname-conflict.patch \
-            file://fix_NL_TIME_FIRST_WEEKDAY.patch \
 "
 
-SRC_URI[md5sum] = "3d9ad37bf8c5a8e6d0e165b020cf9ba5"
-SRC_URI[sha256sum] = "4bf9641fd58454106589be8a8d1cfd61e7694f0a6912d8095d17b1fb94b85abe"
+SRC_URI[md5sum] = "b75b3cfecb943f74338382fde693c2c3"
+SRC_URI[sha256sum] = "066f9d8e51bfabd809d266edcd54eefba1cdca57725b95c074fd47fe6fba3d30"
 
 # Only lscpu part is gplv3; rest of the code is not, 
 # so take out the lscpu parts while running non-gplv3 build.
-- 
1.7.7.6



