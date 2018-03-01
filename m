Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 8302678817
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 14:06:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Mar 2018 06:06:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,408,1515484800"; d="scan'208";a="35134110"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 01 Mar 2018 06:06:49 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 16:00:41 +0200
Message-Id: <20180301140052.1388-4-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180301140052.1388-1-alexander.kanavin@linux.intel.com>
References: <20180301140052.1388-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 04/15] latencytop: remove recipe
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
X-List-Received-Date: Thu, 01 Mar 2018 14:06:48 -0000

Last commit and release were in 2009; website is down; it's a dead project.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/conf/distro/include/distro_alias.inc          |  1 -
 meta/conf/distro/include/maintainers.inc           |  1 -
 .../packagegroup-core-tools-profile.bb             |  1 -
 ...-function-signatures-to-fix-prototype-mis.patch | 64 ----------------------
 .../latencytop-0.5/latencytop-fsync.patch          | 49 -----------------
 .../latencytop-0.5/latencytop-makefile.patch       | 43 ---------------
 meta/recipes-kernel/latencytop/latencytop_0.5.bb   | 32 -----------
 7 files changed, 191 deletions(-)
 delete mode 100644 meta/recipes-kernel/latencytop/latencytop-0.5/0001-Rectify-the-function-signatures-to-fix-prototype-mis.patch
 delete mode 100644 meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-fsync.patch
 delete mode 100644 meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-makefile.patch
 delete mode 100644 meta/recipes-kernel/latencytop/latencytop_0.5.bb

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index 1a217daa390..8ec623befbd 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -159,7 +159,6 @@ DISTRO_PN_ALIAS_pn-kern-tools-native = "Windriver"
 DISTRO_PN_ALIAS_pn-keymaps = "OE-Core"
 DISTRO_PN_ALIAS_pn-kf = "OSPDT"
 DISTRO_PN_ALIAS_pn-lame = "Debian=lame Ubuntu=lame"
-DISTRO_PN_ALIAS_pn-latencytop = "Meego=latencytop Fedora=latencytop Debian=latencytop OpenSuSE=latencytop"
 DISTRO_PN_ALIAS_pn-ldconfig-native = "Ubuntu=libc-bin Fedora=glibc"
 DISTRO_PN_ALIAS_pn-liba52 = "Mandriva=a52dec Debian=a52dec"
 DISTRO_PN_ALIAS_pn-libacpi = "Ubuntu=libacpi Mandriva=libacpi"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 50392487903..965fd34ca04 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -304,7 +304,6 @@ RECIPE_MAINTAINER_pn-kmod-native = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-kmscube = "Carlos Rafael Giani <dv@pseudoterminal.org>"
 RECIPE_MAINTAINER_pn-l3afpad = "Maxin B. John <maxin.john@intel.com>"
 RECIPE_MAINTAINER_pn-lame = "Tanu Kaskinen <tanuk@iki.fi>"
-RECIPE_MAINTAINER_pn-latencytop = "Alexander Kanavin <alexander.kanavin@intel.com>"
 RECIPE_MAINTAINER_pn-ldconfig-native = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-less = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-liba52 = "Tanu Kaskinen <tanuk@iki.fi>"
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index a8e47da40cd..e3814a44bc2 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -26,7 +26,6 @@ RRECOMMENDS_${PN} = "\
 
 PROFILETOOLS = "\
     powertop \
-    latencytop \
     "
 PERF = "perf"
 PERF_libc-musl = ""
diff --git a/meta/recipes-kernel/latencytop/latencytop-0.5/0001-Rectify-the-function-signatures-to-fix-prototype-mis.patch b/meta/recipes-kernel/latencytop/latencytop-0.5/0001-Rectify-the-function-signatures-to-fix-prototype-mis.patch
deleted file mode 100644
index b248133460e..00000000000
--- a/meta/recipes-kernel/latencytop/latencytop-0.5/0001-Rectify-the-function-signatures-to-fix-prototype-mis.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From db112739dc4f608a968b8104b382955dc3d96ca3 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 7 Sep 2015 07:40:10 +0000
-Subject: [PATCH] Rectify the function signatures to fix prototype mismatches
-
-clang is less forgiving when it comes to coding standards, correct the
-function signatures to reflect the function logic
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- fsync.c      | 7 ++++---
- latencytop.h | 2 +-
- 2 files changed, 5 insertions(+), 4 deletions(-)
-
-diff --git a/fsync.c b/fsync.c
-index 82dff0e..5cefba9 100644
---- a/fsync.c
-+++ b/fsync.c
-@@ -51,7 +51,7 @@ struct fsync_files {
- static GList *fsync_data;
- 
- 
--static chain_file(struct fsync_process *proc, char *filename)
-+static void chain_file(struct fsync_process *proc, char *filename)
- {
- 	struct fsync_files *file;
- 	GList *item;
-@@ -75,7 +75,7 @@ static chain_file(struct fsync_process *proc, char *filename)
- 	proc->files = g_list_append(proc->files, file);
- }
- 
--static report_file(char *process, char *file)
-+static void report_file(char *process, char *file)
- {
- 	struct fsync_process *proc;
- 	GList *item;
-@@ -157,9 +157,10 @@ int enable_fsync_tracer(void)
- 	write_to_file("/sys/kernel/debug/tracing/current_tracer", "fsync");	
- 	write_to_file("/sys/kernel/debug/tracing/iter_ctrl", "ftrace_printk");	
- 	write_to_file("/sys/kernel/debug/tracing/tracing_on", "1");
-+	return ret;
- }
- 
--int disable_fsync_tracer(void)
-+void disable_fsync_tracer(void)
- {
- 	write_to_file("/sys/kernel/debug/tracing/tracing_on", "0");
- }
-diff --git a/latencytop.h b/latencytop.h
-index 5394d73..9d107a8 100644
---- a/latencytop.h
-+++ b/latencytop.h
-@@ -54,5 +54,5 @@ extern char *translate(char *line);
- extern void init_translations(char *filename);
- extern int fsync_display(int duration);
- extern int enable_fsync_tracer(void);
--extern int disable_fsync_tracer(void);
-+extern void disable_fsync_tracer(void);
- extern void update_list(void);
--- 
-2.5.1
-
diff --git a/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-fsync.patch b/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-fsync.patch
deleted file mode 100644
index 7848ccf2aea..00000000000
--- a/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-fsync.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-linux: sysfs: use tracing_on as tracing_enabled is deprecated
-
-tracing_enabled use in the kernel is being deprecated as per commit
-6752ab4a9c30 [tracing: Deprecate tracing_enabled for tracing_on] in
-the linux mainline kernel. tracing_enabled use will generate a warning
-and may no longer function as expected, therefore move to use tracing_on.
-
-Upstream-Status: Pending
-
-Signed-off-by: Dennis Hall <dennis.hall@windriver.com>
-
-Index: latencytop-0.5/fsync.c
-===================================================================
---- latencytop-0.5.orig/fsync.c	2012-08-03 10:45:49.000000000 -0400
-+++ latencytop-0.5/fsync.c	2012-08-03 10:48:39.000000000 -0400
-@@ -149,19 +149,19 @@
-  * cd /sys/kernel/debug/tracing
-  * echo fsync > current_tracer
-  * echo ftrace_printk > iter_ctrl 
-- * echo 1 > tracing_enabled
-+ * echo 1 > tracing_on
-  */
- 	ret = system("/bin/mount -t debugfs none /sys/kernel/debug/");
- 	if (!ret) 
- 		return -1;
- 	write_to_file("/sys/kernel/debug/tracing/current_tracer", "fsync");	
- 	write_to_file("/sys/kernel/debug/tracing/iter_ctrl", "ftrace_printk");	
--	write_to_file("/sys/kernel/debug/tracing/tracing_enabled", "1");
-+	write_to_file("/sys/kernel/debug/tracing/tracing_on", "1");
- }
- 
- int disable_fsync_tracer(void)
- {
--	write_to_file("/sys/kernel/debug/tracing/tracing_enabled", "0");
-+	write_to_file("/sys/kernel/debug/tracing/tracing_on", "0");
- }
- 
- 
-@@ -339,8 +339,8 @@
- 		if (curduration > 5)
- 			curduration = 5;
- 		/* clear the ftrace buffer */
--		write_to_file("/sys/kernel/debug/tracing/tracing_enabled", "0");
--		write_to_file("/sys/kernel/debug/tracing/tracing_enabled", "1");
-+		write_to_file("/sys/kernel/debug/tracing/tracing_on", "0");
-+		write_to_file("/sys/kernel/debug/tracing/tracing_on", "1");
- 		key = select(1, &rfds, NULL, NULL, &end);
- 		parse_ftrace();
- 		print_global_list();
diff --git a/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-makefile.patch b/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-makefile.patch
deleted file mode 100644
index 7147fda5d35..00000000000
--- a/meta/recipes-kernel/latencytop/latencytop-0.5/latencytop-makefile.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-
-Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
-Upstream-Status: Pending
-
-diff --git a/Makefile.orig b/Makefile
-index 16a2369..fa797a2 100644
---- a/Makefile.orig
-+++ b/Makefile
-@@ -1,10 +1,11 @@
--# FIXME: Use autoconf ?
--HAS_GTK_GUI = 1
-+#
-+#
- 
- DESTDIR =
- SBINDIR = /usr/sbin
- XCFLAGS = -W  -g `pkg-config --cflags glib-2.0` -D_FORTIFY_SOURCE=2 -Wno-sign-compare
--LDF = -Wl,--as-needed `pkg-config --libs glib-2.0`   -lncursesw 
-+LDF = -Wl,--as-needed `pkg-config --libs glib-2.0`   -lncurses $(LDFLAGS)
-+CC ?= gcc
- 
- OBJS= latencytop.o text_display.o translate.o fsync.o
- 
-@@ -26,16 +27,17 @@ endif
- 
- # We write explicity this "implicit rule"
- %.o : %.c
--	gcc -c $(CFLAGS) $(XCFLAGS) $< -o $@
-+	$(CC) -c $(CFLAGS) $(XCFLAGS) $< -o $@
- 
- latencytop:  $(OBJS) latencytop.h Makefile
--	gcc $(CFLAGS) $(OBJS) $(LDF) -o latencytop 
-+	$(CC) $(CFLAGS) $(OBJS) $(LDF) -o latencytop
- 
- clean:
- 	rm -f *~ latencytop DEADJOE *.o
- 
- install: latencytop
- 	mkdir -p $(DESTDIR)/usr/share/latencytop
-+	mkdir -p $(DESTDIR)/$(SBINDIR)
- 	install -m 0644 latencytop.trans $(DESTDIR)/usr/share/latencytop/latencytop.trans
- 	install -m 0644 *.png $(DESTDIR)/usr/share/latencytop/
- 	install -m 0755 latencytop $(DESTDIR)$(SBINDIR)/
diff --git a/meta/recipes-kernel/latencytop/latencytop_0.5.bb b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
deleted file mode 100644
index eb19471ce8b..00000000000
--- a/meta/recipes-kernel/latencytop/latencytop_0.5.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "Linux tool for measuring and fixing latency"
-HOMEPAGE = "http://www.latencytop.org/"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://latencytop.c;endline=23;md5=ee9ea9b1415356e5734adad4a87dc7fa"
-
-inherit pkgconfig
-
-DEPENDS = "virtual/libintl ncurses glib-2.0"
-
-PR = "r3"
-
-SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/${BPN}/${BP}.tar.gz/73bb3371c6ee0b0e68e25289027e865c/${BP}.tar.gz \
-            file://latencytop-makefile.patch \
-            file://latencytop-fsync.patch \
-            file://0001-Rectify-the-function-signatures-to-fix-prototype-mis.patch \
-"
-
-SRC_URI[md5sum] = "73bb3371c6ee0b0e68e25289027e865c"
-SRC_URI[sha256sum] = "9e7f72fbea7bd918e71212a1eabaad8488d2c602205d2e3c95d62cd57e9203ef"
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
-
-PACKAGECONFIG[x11] = ",,gtk+"
-
-EXTRA_OEMAKE_X = "${@bb.utils.contains('PACKAGECONFIG', 'x11', 'HAS_GTK_GUI=1', '', d)}"
-
-#CFLAGS += "${LDFLAGS}"
-
-do_install() {
-    oe_runmake install DESTDIR=${D} ${EXTRA_OEMAKE_X}
-}
-- 
2.15.1


