Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D2854770DF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 16:11:44 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jan 2016 08:10:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,345,1449561600"; d="scan'208";a="641143926"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 25 Jan 2016 08:10:54 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 18:07:17 +0200
Message-Id: <c825f41f9a6e7a13764de348e90d3f81cabe11ca.1453737141.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0.rc3
In-Reply-To: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
References: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
References: <cover.1453737141.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 07/16] gdk-pixbuf: update to 2.32.3
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
X-List-Received-Date: Mon, 25 Jan 2016 16:11:45 -0000

Drop backported libc_memfuncs.patch

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../gdk-pixbuf/gdk-pixbuf/libc_memfuncs.patch      | 63 ----------------------
 .../{gdk-pixbuf_2.32.1.bb => gdk-pixbuf_2.32.3.bb} |  5 +-
 2 files changed, 2 insertions(+), 66 deletions(-)
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/libc_memfuncs.patch
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.32.1.bb => gdk-pixbuf_2.32.3.bb} (95%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/libc_memfuncs.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/libc_memfuncs.patch
deleted file mode 100644
index 82a27c3..0000000
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/libc_memfuncs.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 205a3b04e1216c1df199aec95185f7f48b8e0491 Mon Sep 17 00:00:00 2001
-From: Natanael Copa <ncopa@alpinelinux.org>
-Date: Tue, 6 Oct 2015 09:11:38 +0200
-Subject: Run only pixbuf-lowmem test on GNU libc
-
-The test case depends on GNU libc specific internals so we only run it
-on GNU libc.
-
-This fixes build on Linux with musl libc.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=756078
----
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Backport
-
- tests/Makefile.am     | 5 -----
- tests/pixbuf-lowmem.c | 8 ++++++++
- 2 files changed, 8 insertions(+), 5 deletions(-)
-
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index bdd68f3..c122188 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -19,13 +19,8 @@ LDADD = \
- noinst_PROGRAMS += 			\
- 	pixbuf-read			\
- 	pixbuf-random			\
--	$(NULL)
--
--if OS_LINUX
--noinst_PROGRAMS += 			\
- 	pixbuf-lowmem			\
- 	$(NULL)
--endif
- 
- test_programs = 			\
- 	animation			\
-diff --git a/tests/pixbuf-lowmem.c b/tests/pixbuf-lowmem.c
-index ae71788..9e9571f 100644
---- a/tests/pixbuf-lowmem.c
-+++ b/tests/pixbuf-lowmem.c
-@@ -24,6 +24,7 @@
- #include <time.h>
- #include <string.h>
- 
-+#ifdef __GLIBC__
- #define PRETEND_MEM_SIZE (16 * 1024 * 1024)
- #define REMAINING_MEM_SIZE 100000
- 
-@@ -225,3 +226,10 @@ main (int argc, char **argv)
-   
-   return 0;
- }
-+#else
-+int
-+main (int argc, char **argv)
-+{
-+	return 0;
-+}
-+#endif
--- 
-cgit v0.11.2
-
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.3.bb
similarity index 95%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.1.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.3.bb
index 104c743..ed9c232 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.1.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.3.bb
@@ -17,11 +17,10 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://extending-libinstall-dependencies.patch \
            file://run-ptest \
            file://fatal-loader.patch \
-           file://libc_memfuncs.patch \
            "
 
-SRC_URI[md5sum] = "b1590189a2e89fab9f871959c168508c"
-SRC_URI[sha256sum] = "4432b74f25538c7d6bcb3ca51adabdd666168955f25812a2568dc9637697f3bc"
+SRC_URI[md5sum] = "9275076639baa24a342f3e02c402920e"
+SRC_URI[sha256sum] = "2b6771f1ac72f687a8971e59810b8dc658e65e7d3086bd2e676e618fd541d031"
 
 inherit autotools pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even
 
-- 
2.7.0.rc3


