Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id EA020773EF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 10:49:38 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 02 Jun 2016 03:49:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,405,1459839600"; d="scan'208";a="114740378"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga004.fm.intel.com with ESMTP; 02 Jun 2016 03:49:38 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2016 13:49:34 +0300
Message-Id: <6fc52f7a1fd0f41543130ce3c35c41d25ef8b913.1464863090.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <0948a4990dbf84db3529b68398e6d77297e035ae.1464863090.git.jussi.kukkonen@intel.com>
References: <0948a4990dbf84db3529b68398e6d77297e035ae.1464863090.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1464863090.git.jussi.kukkonen@intel.com>
References: <cover.1464863090.git.jussi.kukkonen@intel.com>
Subject: [PATCH 3/3] dosfstools: Upgrade 3.0.28 -> 4.0
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
X-List-Received-Date: Thu, 02 Jun 2016 10:49:39 -0000

* Build system is now autotools
* Patches are no longer required
* Enable compatibility symlinks

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../0001-mkfs.fat-fix-incorrect-int-type.patch     | 46 ----------------------
 .../dosfstools/dosfstools/largefile.patch          | 19 ---------
 .../{dosfstools_3.0.28.bb => dosfstools_4.0.bb}    | 18 +++------
 3 files changed, 6 insertions(+), 77 deletions(-)
 delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools/0001-mkfs.fat-fix-incorrect-int-type.patch
 delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools/largefile.patch
 rename meta/recipes-devtools/dosfstools/{dosfstools_3.0.28.bb => dosfstools_4.0.bb} (60%)

diff --git a/meta/recipes-devtools/dosfstools/dosfstools/0001-mkfs.fat-fix-incorrect-int-type.patch b/meta/recipes-devtools/dosfstools/dosfstools/0001-mkfs.fat-fix-incorrect-int-type.patch
deleted file mode 100644
index 3497ca5..0000000
--- a/meta/recipes-devtools/dosfstools/dosfstools/0001-mkfs.fat-fix-incorrect-int-type.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 3b95786af13e28157d889bd90a384ee255f2d91d Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sun, 16 Aug 2015 15:55:43 +0200
-Subject: [PATCH] mkfs.fat: fix incorrect int type
-
-u_int32_t is not a stanard type, while uint32_t is. This fixes builds
-with the musl C library, which only defines so-called "clean" headers;
-build failures are like (back-quotes and elision manually added for
-readability):
-
-    http://autobuild.buildroot.org/results/a09/a0923d7f6d4dbae02eba4c5024bbdae3a52aa85a/build-end.log
-
-    /home/peko/autobuild/instance-1/output/host/usr/bin/x86_64-linux-gcc -D_LARGEFILE_SOURCE \
-        -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os  -D_GNU_SOURCE -D_LARGEFILE_SOURCE \
-        -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -c -o mkfs.fat.o src/mkfs.fat.c
-    src/mkfs.fat.c: In function 'main':
-    src/mkfs.fat.c:1415:18: error: 'u_int32_t' undeclared (first use in this function)
-         volume_id = (u_int32_t) ((create_timeval.tv_sec << 20) | create_timeval.tv_usec); [...]
-                      ^
-    src/mkfs.fat.c:1415:18: note: each undeclared identifier is reported only once for each
-    function it appears in
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Signed-off-by: Andreas Bombe <aeb@debian.org>
----
-Upstream-Status: Backport
-
- src/mkfs.fat.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/mkfs.fat.c b/src/mkfs.fat.c
-index b38d116..dddbe24 100644
---- a/src/mkfs.fat.c
-+++ b/src/mkfs.fat.c
-@@ -1412,7 +1412,7 @@ int main(int argc, char **argv)
- 
-     gettimeofday(&create_timeval, NULL);
-     create_time = create_timeval.tv_sec;
--    volume_id = (u_int32_t) ((create_timeval.tv_sec << 20) | create_timeval.tv_usec);	/* Default volume ID = creation time, fudged for more uniqueness */
-+    volume_id = (uint32_t) ((create_timeval.tv_sec << 20) | create_timeval.tv_usec);	/* Default volume ID = creation time, fudged for more uniqueness */
-     check_atari();
- 
-     printf("mkfs.fat " VERSION " (" VERSION_DATE ")\n");
--- 
-2.7.0
-
diff --git a/meta/recipes-devtools/dosfstools/dosfstools/largefile.patch b/meta/recipes-devtools/dosfstools/dosfstools/largefile.patch
deleted file mode 100644
index 7f7d835..0000000
--- a/meta/recipes-devtools/dosfstools/dosfstools/largefile.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-defer setting largefile flags to build makery
-in a cross build we can not do runtime config tests
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Inappropriate[Cross compile Specific]
-Index: dosfstools-3.0.28/Makefile
-===================================================================
---- dosfstools-3.0.28.orig/Makefile
-+++ dosfstools-3.0.28/Makefile
-@@ -27,8 +27,7 @@ SBINDIR = $(PREFIX)/sbin
- DOCDIR = $(PREFIX)/share/doc
- MANDIR = $(PREFIX)/share/man
- 
--#OPTFLAGS = -O2 -fomit-frame-pointer -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64
--OPTFLAGS = -O2 -fomit-frame-pointer -D_GNU_SOURCE $(shell getconf LFS_CFLAGS)
-+OPTFLAGS = -O2 -fomit-frame-pointer
- #WARNFLAGS = -Wall -pedantic -std=c99
- WARNFLAGS = -Wall -Wextra -Wno-sign-compare -Wno-missing-field-initializers -Wmissing-prototypes -Wstrict-prototypes -Wwrite-strings
- DEBUGFLAGS = -g
diff --git a/meta/recipes-devtools/dosfstools/dosfstools_3.0.28.bb b/meta/recipes-devtools/dosfstools/dosfstools_4.0.bb
similarity index 60%
rename from meta/recipes-devtools/dosfstools/dosfstools_3.0.28.bb
rename to meta/recipes-devtools/dosfstools/dosfstools_4.0.bb
index 6fc3e41..e7b1f61 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools_3.0.28.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools_4.0.bb
@@ -9,23 +9,17 @@ SECTION = "base"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI = "https://github.com/dosfstools/dosfstools/releases/download/v3.0.28/dosfstools-3.0.28.tar.xz \
-           file://largefile.patch \
-           file://0001-mkfs.fat-fix-incorrect-int-type.patch \
+SRC_URI = "https://github.com/dosfstools/dosfstools/releases/download/v${PV}/${BP}.tar.xz \
           "
-SRC_URI[md5sum] = "6a047a6c65186b9ebb1853709adb36db"
-SRC_URI[sha256sum] = "ee95913044ecf2719b63ea11212917649709a6e53209a72d622135aaa8517ee2"
+SRC_URI[md5sum] = "20f8388b99702f276c973d228c7cff45"
+SRC_URI[sha256sum] = "9037738953559d1efe04fc5408b6846216cc0138f7f9d32de80b6ec3c35e7daf"
 
 UPSTREAM_CHECK_URI = "https://github.com/dosfstools/dosfstools/releases"
 
-CFLAGS += "-D_GNU_SOURCE ${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64', '', d)}"
+inherit autotools pkgconfig
 
-FILES_${PN} = "${base_sbindir}"
-FILES_${PN}-doc = "${mandir} ${docdir}"
+EXTRA_OECONF = "--without-udev --enable-compat-symlinks"
 
-do_install () {
-	oe_runmake "PREFIX=${D}${prefix}" "SBINDIR=${D}${base_sbindir}" \
-		   "MANDIR=${D}${mandir}" "DOCDIR=${D}${docdir}" install
-}
+CFLAGS += "-D_GNU_SOURCE ${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64', '', d)}"
 
 BBCLASSEXTEND = "native"
-- 
2.1.4


