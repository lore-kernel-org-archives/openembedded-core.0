Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web11.566.1591110909776517827
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 08:15:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: VYb9G8AgkS0OCqmXPjkXz/VS9c4QdBSDsrOHjyEtiOz1J3wnzMk9uNxmJmKDNNcOD748cvjn7s
 VJ/my5bzKpPQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2020 08:15:09 -0700
IronPort-SDR: OgTWTDhjO+E1wXa8AjIY0f0kBowhmY9+H1iQcZF772UyDyymhjSP8zhoqWbNbeizmoNN2BM1vW
 3ISdByDvnh7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,464,1583222400"; 
   d="scan'208";a="470752533"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by fmsmga005.fm.intel.com with ESMTP; 02 Jun 2020 08:15:07 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] glib-2.0: 2.64.2 -> 2.64.3
Date: Tue,  2 Jun 2020 23:15:07 +0800
Message-Id: <20200602151507.45901-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Lee Chee Yang <chee.yang.lee@intel.com>

remove patch which already upstream
https://gitlab.gnome.org/GNOME/glib/-/commit/3c5512222c203d916a0a2a02312d8415f921dce9

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 ...etect-stpcpy-on-windows-platforms-on.patch | 53 -------------------
 ...{glib-2.0_2.64.2.bb => glib-2.0_2.64.3.bb} |  5 +-
 2 files changed, 2 insertions(+), 56 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Don-t-misdetect-stpcpy-on-windows-platforms-on.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.64.2.bb => glib-2.0_2.64.3.bb} (89%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Don-t-misdetect-stpcpy-on-windows-platforms-on.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Don-t-misdetect-stpcpy-on-windows-platforms-on.patch
deleted file mode 100644
index 855bdfc0d9..0000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/0001-meson-Don-t-misdetect-stpcpy-on-windows-platforms-on.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From d4b1fd9cdb7ae07fa6be941ac95f97ece175fe55 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Martin=20Storsj=C3=B6?= <martin@martin.st>
-Date: Tue, 31 Mar 2020 23:54:17 +0300
-Subject: [PATCH] meson: Don't misdetect stpcpy on windows platforms on clang
-
-See https://github.com/mesonbuild/meson/issues/3672 and
-https://github.com/mesonbuild/meson/issues/5628 for explanations
-of cases where meson misdetects functions due to clang builtins (that
-always are available, regardless of whether the platform actually
-provides them).
-
-The same also happens on GCC 10, which added support for __has_builtin.
-
-Upstream-Status: Backport [https://github.com/GNOME/glib/commit/1b94bfbd72dbbfb696fa68f3742f40998096b438]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- meson.build | 16 +++++++++++++---
- 1 file changed, 13 insertions(+), 3 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 72ca194..bbdac1c 100644
---- a/meson.build
-+++ b/meson.build
-@@ -533,13 +533,23 @@ foreach f : functions
-   endif
- endforeach
- 
--# Check that stpcpy() is usable; must use header
--if cc.has_function('stpcpy', prefix : '#include <string.h>')
-+# Check that stpcpy() is usable; must use header.
-+# cc.has_function() in some cases (clang, gcc 10+) assumes that if the
-+# compiler provides a builtin of the same name that the function exists, while
-+# it's in fact not provided by any header or library. This is true for
-+# stpcpy() on Windows using clang and gcc as well as posix_memalign() using
-+# gcc on Windows. Skip these checks on Windows for now to avoid false
-+# positives. See https://github.com/mesonbuild/meson/pull/7116,
-+# https://github.com/mesonbuild/meson/issues/3672 and
-+# https://github.com/mesonbuild/meson/issues/5628.
-+# FIXME: Once meson no longer returns success for stpcpy() and
-+# posix_memalign() on Windows using GCC and clang we can remove this.
-+if host_system != 'windows' and cc.has_function('stpcpy', prefix : '#include <string.h>')
-   glib_conf.set('HAVE_STPCPY', 1)
- endif
- 
- # Check that posix_memalign() is usable; must use header
--if cc.has_function('posix_memalign', prefix : '#include <stdlib.h>')
-+if host_system != 'windows' and cc.has_function('posix_memalign', prefix : '#include <stdlib.h>')
-   glib_conf.set('HAVE_POSIX_MEMALIGN', 1)
- endif
- 
--- 
-2.26.2
-
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.64.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.64.3.bb
similarity index 89%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.64.2.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.64.3.bb
index d6207b5b1a..2e5f7a0e2a 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.64.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.64.3.bb
@@ -16,13 +16,12 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
-           file://0001-meson-Don-t-misdetect-stpcpy-on-windows-platforms-on.patch \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
 
-SRC_URI[md5sum] = "78b6bda8664763a09bd12d864c0ba46c"
-SRC_URI[sha256sum] = "9a2f21ed8f13b9303399de13a0252b7cbcede593d26971378ec6cb90e87f2277"
+SRC_URI[md5sum] = "ccc48e58545cac45f5b3df3b8aeaff13"
+SRC_URI[sha256sum] = "fe9cbc97925d14c804935f067a3ad77ef55c0bbe9befe68962318f5a767ceb22"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.17.1

