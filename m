Return-Path: <cristiana.voicu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 228626D3D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2013 07:57:05 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 24 Oct 2013 00:57:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,560,1378882800"; d="scan'208";a="421820184"
Received: from cvoicu-vostro-460.rb.intel.com ([10.237.105.65])
	by fmsmga002.fm.intel.com with ESMTP; 24 Oct 2013 00:57:06 -0700
From: Cristiana Voicu <cristiana.voicu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Oct 2013 11:01:48 +0300
Message-Id: <6c2f4f1b0f2e102d02dea470d20b69485488dcfe.1382601179.git.cristiana.voicu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1382601179.git.cristiana.voicu@intel.com>
References: <cover.1382601179.git.cristiana.voicu@intel.com>
In-Reply-To: <cover.1382601179.git.cristiana.voicu@intel.com>
References: <cover.1382601179.git.cristiana.voicu@intel.com>
Subject: [PATCH 2/4] at: upgrade to 3.1.14
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
X-List-Received-Date: Thu, 24 Oct 2013 07:57:05 -0000

Removed 2 patches because they were merged upstream

Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
---
 .../at/{at_3.1.13.bb => at_3.1.14.bb}              |    7 ++---
 meta/recipes-extended/at/files/configure.patch     |   29 --------------------
 meta/recipes-extended/at/files/use-ldflags.patch   |   24 ----------------
 3 files changed, 2 insertions(+), 58 deletions(-)
 rename meta/recipes-extended/at/{at_3.1.13.bb => at_3.1.14.bb} (90%)
 delete mode 100644 meta/recipes-extended/at/files/configure.patch
 delete mode 100644 meta/recipes-extended/at/files/use-ldflags.patch

diff --git a/meta/recipes-extended/at/at_3.1.13.bb b/meta/recipes-extended/at/at_3.1.14.bb
similarity index 90%
rename from meta/recipes-extended/at/at_3.1.13.bb
rename to meta/recipes-extended/at/at_3.1.14.bb
index 6fa13b9..f80b620 100644
--- a/meta/recipes-extended/at/at_3.1.13.bb
+++ b/meta/recipes-extended/at/at_3.1.14.bb
@@ -16,11 +16,8 @@ PAM_DEPS = "libpam libpam-runtime pam-plugin-env pam-plugin-limits"
 
 RCONFLICTS_${PN} = "atd"
 RREPLACES_${PN} = "atd"
-PR = "r5"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/a/at/at_${PV}.orig.tar.gz \
-    file://configure.patch \
-    file://use-ldflags.patch \
     file://fix_parallel_build_error.patch \
     file://posixtm.c \
     file://posixtm.h \
@@ -31,8 +28,8 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/at/at_${PV}.orig.tar.gz \
 PAM_SRC_URI = "file://pam.conf.patch \
                file://configure-add-enable-pam.patch"
 
-SRC_URI[md5sum] = "1da61af6c29e323abaaf13ee1a8dad79"
-SRC_URI[sha256sum] = "3a8b90868d615d21a92f4986ea9a823886329af8fae8dd7ab4eed9b273bca072"
+SRC_URI[md5sum] = "d41cfd79033b6e49a8838add59a42ac6"
+SRC_URI[sha256sum] = "cd092bf05d29c25b286f55a960ce8b8c3c5beb571d86ed8eb1dfb3b61291b3ae"
 
 EXTRA_OECONF += "ac_cv_path_SENDMAIL=/bin/true \
                  --with-daemon_username=root \
diff --git a/meta/recipes-extended/at/files/configure.patch b/meta/recipes-extended/at/files/configure.patch
deleted file mode 100644
index 14310e3..0000000
--- a/meta/recipes-extended/at/files/configure.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-
-Fix cross-compilation issues in configure.ac
-Derived from an OE patch for at-3.1.8
-
-Upstream-Status: Pending
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
-Index: at-3.1.12/configure.ac
-===================================================================
---- at-3.1.12.orig/configure.ac
-+++ at-3.1.12/configure.ac
-@@ -38,12 +38,11 @@ case "$host" in
-     AC_MSG_RESULT(no)
-     ;;
- esac
-+if [ X"${cross_compiling}" = Xno ]; then
- AC_MSG_CHECKING(Trying to compile a trivial ANSI C program)
--AC_TRY_RUN([ main(int ac, char **av) { return 0; } ],
--    AC_MSG_RESULT(yes),
--    AC_MSG_RESULT(no)
--    AC_MSG_ERROR(Could not compile and run even a trivial ANSI C program - check CC.),
--    AC_MSG_ERROR(Could not compile and run even a trivial ANSI C program - check CC.))
-+AC_RUN_IFELSE([AC_LANG_SOURCE([[ main(int ac, char **av) { return 0; } ]])],[AC_MSG_RESULT(yes)],[AC_MSG_RESULT(no)
-+    AC_MSG_ERROR(Could not compile and run even a trivial ANSI C program - check CC.)],[AC_MSG_ERROR(Could not compile and run even a trivial ANSI C program - check CC.)])
-+fi
- 
- AC_MSG_CHECKING(__attribute__((noreturn)))
- AC_TRY_COMPILE([], [void __attribute__((noreturn)) panic(void);],
diff --git a/meta/recipes-extended/at/files/use-ldflags.patch b/meta/recipes-extended/at/files/use-ldflags.patch
deleted file mode 100644
index 4c69800..0000000
--- a/meta/recipes-extended/at/files/use-ldflags.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Upstream-Status: Pending
-
-Ensure use of $LDFLAGS during build
-Derived from an OE patch for at-3.1.8
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---- at-3.1.12.orig/Makefile.in	2009-11-23 07:11:52.000000000 -0800
-+++ at-3.1.12/Makefile.in	2010-07-20 16:28:04.000000000 -0700
-@@ -65,13 +65,13 @@
- all: at atd atrun
- 
- at: $(ATOBJECTS)
--	$(CC) $(CFLAGS) -o at $(ATOBJECTS) $(LIBS) $(LEXLIB)
-+	$(CC) $(CFLAGS) -o at $(ATOBJECTS) $(LIBS) $(LEXLIB) $(LDFLAGS)
- 	rm -f $(CLONES)
- 	$(LN_S) -f at atq
- 	$(LN_S) -f at atrm
- 
- atd: $(RUNOBJECTS)
--	$(CC) $(CFLAGS) -o atd $(RUNOBJECTS) $(LIBS) $(PAMLIB)
-+	$(CC) $(CFLAGS) -o atd $(RUNOBJECTS) $(LIBS) $(PAMLIB) $(LDFLAGS)
- 
- y.tab.c y.tab.h: parsetime.y
- 	$(YACC) -d parsetime.y
-- 
1.7.9.5


