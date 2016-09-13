Return-Path: <juro.bystricky@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A038377262
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Sep 2016 21:52:54 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 13 Sep 2016 14:52:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,330,1470726000"; d="scan'208";a="878435205"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga003.jf.intel.com with ESMTP; 13 Sep 2016 14:52:54 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Sep 2016 14:52:48 -0700
Message-Id: <1473803568-13012-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1473803568-13012-1-git-send-email-juro.bystricky@intel.com>
References: <1473803568-13012-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 1/1] busybox: Avoid race building libbb
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
X-List-Received-Date: Tue, 13 Sep 2016 21:52:54 -0000

When building busybox, an occasional error was observed.
The error is consistently the same:

libbb/appletlib.c:164:13: error: 'NUM_APPLETS' undeclared (first use in this function)
  while (i < NUM_APPLETS) {

The reason is the include file where NUM_APPLETS is defined is not yet generated (or is being modified)
at the time libbb/appletlib.c is compiled.
The attached patchset fixes the problem by assuring libb is compiled as the last directory.

[YOCTO#10116]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 .../busybox-kbuild-race-fix-commit-d8e61bb.patch   | 45 +++++++++++++++
 .../commit-applet_tables-fix-commit-0dddbc1.patch  | 53 ++++++++++++++++++
 .../busybox/busybox/makefile-libbb-race.patch      | 34 +++++++++++
 .../busybox/busybox/parallel-make-fix.patch        | 65 ----------------------
 meta/recipes-core/busybox/busybox_1.24.1.bb        |  4 +-
 5 files changed, 135 insertions(+), 66 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox/busybox-kbuild-race-fix-commit-d8e61bb.patch
 create mode 100644 meta/recipes-core/busybox/busybox/commit-applet_tables-fix-commit-0dddbc1.patch
 create mode 100644 meta/recipes-core/busybox/busybox/makefile-libbb-race.patch
 delete mode 100644 meta/recipes-core/busybox/busybox/parallel-make-fix.patch

diff --git a/meta/recipes-core/busybox/busybox/busybox-kbuild-race-fix-commit-d8e61bb.patch b/meta/recipes-core/busybox/busybox/busybox-kbuild-race-fix-commit-d8e61bb.patch
new file mode 100644
index 0000000..d8fd3e4
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/busybox-kbuild-race-fix-commit-d8e61bb.patch
@@ -0,0 +1,45 @@
+From d8e61bbf13d0cf38d477255cfd5dc71c5d51d575 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Sun, 21 Aug 2016 22:00:20 +0200
+Subject: build system: different fix for
+ include/applet_tables.h/include/NUM_APPLETS.h
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+diff --git a/applets/Kbuild.src b/applets/Kbuild.src
+index 5cc1827..3aedbbf 100644
+--- a/applets/Kbuild.src
++++ b/applets/Kbuild.src
+@@ -29,7 +29,7 @@ applets/applets.o: include/usage_compressed.h include/applet_tables.h
+ 
+ applets/applet_tables: .config include/applets.h
+ applets/usage:         .config include/applets.h
+-applets/usage_pod:     .config include/applets.h include/applet_tables.h include/NUM_APPLETS.h
++applets/usage_pod:     .config include/applets.h include/applet_tables.h
+ 
+ quiet_cmd_gen_usage_compressed = GEN     include/usage_compressed.h
+       cmd_gen_usage_compressed = $(srctree_slash)applets/usage_compressed include/usage_compressed.h applets
+@@ -37,8 +37,21 @@ quiet_cmd_gen_usage_compressed = GEN     include/usage_compressed.h
+ include/usage_compressed.h: applets/usage $(srctree_slash)applets/usage_compressed
+ 	$(call cmd,gen_usage_compressed)
+ 
+-quiet_cmd_gen_applet_tables = GEN     include/applet_tables.h
++quiet_cmd_gen_applet_tables = GEN     include/applet_tables.h include/NUM_APPLETS.h
+       cmd_gen_applet_tables = applets/applet_tables include/applet_tables.h include/NUM_APPLETS.h
+ 
+-include/applet_tables.h include/NUM_APPLETS.h: applets/applet_tables
++include/NUM_APPLETS.h: applets/applet_tables
++	$(call cmd,gen_applet_tables)
++
++# In fact, include/applet_tables.h depends only on applets/applet_tables,
++# and is generated by it. But specifying only it can run
++# applets/applet_tables twice, possibly in parallel.
++# We say that it also needs NUM_APPLETS.h
++#
++# Unfortunately, we need to list the same command,
++# and it can be executed twice (sequentially).
++# The alternative is to not list any command,
++# and then if include/applet_tables.h is deleted, it won't be rebuilt.
++#
++include/applet_tables.h: include/NUM_APPLETS.h applets/applet_tables
+ 	$(call cmd,gen_applet_tables)
diff --git a/meta/recipes-core/busybox/busybox/commit-applet_tables-fix-commit-0dddbc1.patch b/meta/recipes-core/busybox/busybox/commit-applet_tables-fix-commit-0dddbc1.patch
new file mode 100644
index 0000000..b2dca53
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/commit-applet_tables-fix-commit-0dddbc1.patch
@@ -0,0 +1,53 @@
+From 0dddbc1a59795a77679d8c5ef48a2795cb470563 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Tue, 23 Aug 2016 20:21:36 +0200
+Subject: build system: always rewrite NUM_APPLETS.h
+
+Conditional rewrite can keep NUM_APPLETS.h mtime old,
+this causes make to try to regenerate it at every invocation.
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+diff --git a/applets/applet_tables.c b/applets/applet_tables.c
+index 8401a15..ef911a4 100644
+--- a/applets/applet_tables.c
++++ b/applets/applet_tables.c
+@@ -192,27 +192,28 @@ int main(int argc, char **argv)
+ 	printf("};\n");
+ #endif
+ 	//printf("#endif /* SKIP_definitions */\n");
++
+ //	printf("\n");
+ //	printf("#define MAX_APPLET_NAME_LEN %u\n", MAX_APPLET_NAME_LEN);
+ 
+ 	if (argv[2]) {
+-		char line_old[80];
+-		char line_new[80];
+ 		FILE *fp;
++		char line_new[80];
++//		char line_old[80];
+ 
+-		line_old[0] = 0;
+-		fp = fopen(argv[2], "r");
+-		if (fp) {
+-			fgets(line_old, sizeof(line_old), fp);
+-			fclose(fp);
+-		}
+ 		sprintf(line_new, "#define NUM_APPLETS %u\n", NUM_APPLETS);
+-		if (strcmp(line_old, line_new) != 0) {
++//		line_old[0] = 0;
++//		fp = fopen(argv[2], "r");
++//		if (fp) {
++//			fgets(line_old, sizeof(line_old), fp);
++//			fclose(fp);
++//		}
++//		if (strcmp(line_old, line_new) != 0) {
+ 			fp = fopen(argv[2], "w");
+ 			if (!fp)
+ 				return 1;
+ 			fputs(line_new, fp);
+-		}
++//		}
+ 	}
+ 
+ 	return 0;
diff --git a/meta/recipes-core/busybox/busybox/makefile-libbb-race.patch b/meta/recipes-core/busybox/busybox/makefile-libbb-race.patch
new file mode 100644
index 0000000..97278ab
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/makefile-libbb-race.patch
@@ -0,0 +1,34 @@
+There is a potential race when building libbb, as some header files  
+needed by libbb are not generated yet (or are being modified) at the time
+libbb is compiled.
+This patch avoids this scenario by building libbb as the last directory.
+
+Upstream-Status: Submitted
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+
+Index: busybox-1.24.1/Makefile
+===================================================================
+diff --git a/Makefile b/Makefile
+index 5cfc763..69f3831 100644
+--- a/Makefile
++++ b/Makefile
+@@ -738,9 +738,18 @@ $(sort $(busybox-all)): $(busybox-dirs) ;
+ # Error messages still appears in the original language
+ 
+ PHONY += $(busybox-dirs)
+-$(busybox-dirs): prepare scripts
++
++libbb-dir = $(filter libbb,$(busybox-dirs))
++busybox-dirs1 = $(filter-out libbb,$(busybox-dirs))
++
++$(busybox-dirs1): prepare scripts
+ 	$(Q)$(MAKE) $(build)=$@
+ 
++ifneq ($(libbb-dir),)
++$(libbb-dir): | $(busybox-dirs1)
++	$(Q)$(MAKE) $(build)=$@
++endif
++
+ # Build the kernel release string
+ # The KERNELRELEASE is stored in a file named .kernelrelease
+ # to be used when executing for example make install or make modules_install
diff --git a/meta/recipes-core/busybox/busybox/parallel-make-fix.patch b/meta/recipes-core/busybox/busybox/parallel-make-fix.patch
deleted file mode 100644
index 120dff1..0000000
--- a/meta/recipes-core/busybox/busybox/parallel-make-fix.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-When applet_tables is run, we need it to touch both output files,
-else make will keep calling the command, potentially leading to races
-as the files are potentially rewritten.
-
-We also need to ensure that applet_tables is called once, not twice, 
-potentially in parallel. To do this, make one file depend upon the other.
-
-Upstream-Status: Submitted
-RP 2016/8/19
-
-Index: busybox-1.24.1/applets/Kbuild.src
-===================================================================
---- busybox-1.24.1.orig/applets/Kbuild.src
-+++ busybox-1.24.1/applets/Kbuild.src
-@@ -29,7 +29,7 @@ applets/applets.o: include/usage_compres
- 
- applets/applet_tables: .config include/applets.h
- applets/usage:         .config include/applets.h
--applets/usage_pod:     .config include/applets.h include/applet_tables.h include/NUM_APPLETS.h
-+applets/usage_pod:     .config include/applets.h include/applet_tables.h
- 
- quiet_cmd_gen_usage_compressed = GEN     include/usage_compressed.h
-       cmd_gen_usage_compressed = $(srctree_slash)applets/usage_compressed include/usage_compressed.h applets
-@@ -40,5 +40,7 @@ include/usage_compressed.h: applets/usag
- quiet_cmd_gen_applet_tables = GEN     include/applet_tables.h
-       cmd_gen_applet_tables = applets/applet_tables include/applet_tables.h include/NUM_APPLETS.h
- 
--include/applet_tables.h include/NUM_APPLETS.h: applets/applet_tables
-+include/NUM_APPLETS.h: applets/applet_tables
- 	$(call cmd,gen_applet_tables)
-+
-+include/applet_tables.h: include/NUM_APPLETS.h
-Index: busybox-1.24.1/applets/applet_tables.c
-===================================================================
---- busybox-1.24.1.orig/applets/applet_tables.c
-+++ busybox-1.24.1/applets/applet_tables.c
-@@ -151,23 +151,15 @@ int main(int argc, char **argv)
- //	printf("#define MAX_APPLET_NAME_LEN %u\n", MAX_APPLET_NAME_LEN);
- 
- 	if (argv[2]) {
--		char line_old[80];
- 		char line_new[80];
- 		FILE *fp;
- 
--		line_old[0] = 0;
--		fp = fopen(argv[2], "r");
--		if (fp) {
--			fgets(line_old, sizeof(line_old), fp);
--			fclose(fp);
--		}
- 		sprintf(line_new, "#define NUM_APPLETS %u\n", NUM_APPLETS);
--		if (strcmp(line_old, line_new) != 0) {
--			fp = fopen(argv[2], "w");
--			if (!fp)
--				return 1;
--			fputs(line_new, fp);
--		}
-+		fp = fopen(argv[2], "w");
-+		if (!fp)
-+			return 1;
-+		fputs(line_new, fp);
-+		fclose(fp);
- 	}
- 
- 	return 0;
diff --git a/meta/recipes-core/busybox/busybox_1.24.1.bb b/meta/recipes-core/busybox/busybox_1.24.1.bb
index f370451..df0e131 100644
--- a/meta/recipes-core/busybox/busybox_1.24.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.24.1.bb
@@ -49,8 +49,10 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://CVE-2016-2147_2.patch \
            file://ip_fix_problem_on_mips64_n64_big_endian_musl_systems.patch \
            file://makefile-fix-backport.patch \
-           file://parallel-make-fix.patch \
            file://0001-sed-fix-sed-n-flushes-pattern-space-terminates-early.patch \
+           file://busybox-kbuild-race-fix-commit-d8e61bb.patch \
+           file://commit-applet_tables-fix-commit-0dddbc1.patch \
+           file://makefile-libbb-race.patch \
 "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.7.4


