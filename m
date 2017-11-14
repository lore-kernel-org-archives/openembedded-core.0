Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EDBE6784B8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 14:58:11 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2017 06:58:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,395,1505804400"; d="scan'208";a="173402277"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 14 Nov 2017 06:58:12 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 16:57:49 +0200
Message-Id: <20171114145754.9643-22-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
References: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 22/27] icu: update to 60.1
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
X-List-Received-Date: Tue, 14 Nov 2017 14:58:12 -0000

Rebase a couple of patches.

LICENSE checksum change due to typo fix.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../icu/icu/0001-i18n-Drop-include-xlocale.h.patch | 28 ++++++++++++----------
 .../recipes-support/icu/icu/fix-install-manx.patch | 25 ++++++++++++-------
 .../icu/{icu_59.1.bb => icu_60.1.bb}               |  6 ++---
 3 files changed, 35 insertions(+), 24 deletions(-)
 rename meta/recipes-support/icu/{icu_59.1.bb => icu_60.1.bb} (78%)

diff --git a/meta/recipes-support/icu/icu/0001-i18n-Drop-include-xlocale.h.patch b/meta/recipes-support/icu/icu/0001-i18n-Drop-include-xlocale.h.patch
index add0d765b7f..0c61893d7c1 100644
--- a/meta/recipes-support/icu/icu/0001-i18n-Drop-include-xlocale.h.patch
+++ b/meta/recipes-support/icu/icu/0001-i18n-Drop-include-xlocale.h.patch
@@ -1,31 +1,33 @@
-From c4254fd8ff1888ca285e3242b812010357ce2b3e Mon Sep 17 00:00:00 2001
+From d6b57c1b4eb9a24d9d95342a961c93946539c93b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 24 Jun 2017 22:52:40 -0700
-Subject: [PATCH] i18n: Drop include <xlocale.h>
+Subject: [PATCH 3/4] i18n: Drop include <xlocale.h>
 
 glibc 2.26 drops this header
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
 
- i18n/digitlst.cpp | 6 +-----
+---
+ source/i18n/digitlst.cpp | 6 +-----
  1 file changed, 1 insertion(+), 5 deletions(-)
 
-Index: source/i18n/digitlst.cpp
-===================================================================
---- source.orig/i18n/digitlst.cpp
-+++ source/i18n/digitlst.cpp
-@@ -61,11 +61,7 @@
+diff --git a/source/i18n/digitlst.cpp b/source/i18n/digitlst.cpp
+index 8e86fa7..0bdbb2c 100644
+--- a/i18n/digitlst.cpp
++++ b/i18n/digitlst.cpp
+@@ -62,11 +62,7 @@
  #endif
  
  #if U_USE_STRTOD_L
--# if U_PLATFORM_USES_ONLY_WIN32_API || U_PLATFORM == U_PF_CYGWIN
--#   include <locale.h>
--# else
+-# if U_HAVE_XLOCALE_H
 -#   include <xlocale.h>
+-# else
+-#   include <locale.h>
 -# endif
 +# include <locale.h>
  #endif
  
  // ***************************************************************************
+-- 
+2.14.2
+
diff --git a/meta/recipes-support/icu/icu/fix-install-manx.patch b/meta/recipes-support/icu/icu/fix-install-manx.patch
index ec63f50c469..8186fb41227 100644
--- a/meta/recipes-support/icu/icu/fix-install-manx.patch
+++ b/meta/recipes-support/icu/icu/fix-install-manx.patch
@@ -1,3 +1,8 @@
+From 3063a9211669bee673840ee81f81d30699b9b702 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Fri, 9 Oct 2015 17:50:41 +0100
+Subject: [PATCH 2/4] icu: fix install race
+
 The generic recursive target calls target-local so also adding it to the
 dependency list results in races due to install-local being executed twice in
 parallel.  For example, install-manx can fail if the two install processes race
@@ -9,12 +14,15 @@ in the install command.
 Upstream-Status: Pending
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
+---
+ source/Makefile.in | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
 
-diff --git a/Makefile.in b/Makefile.in
-index 9db6c52..3441afa 100644
+diff --git a/source/Makefile.in b/source/Makefile.in
+index c1db15b..4948deb 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -71,7 +71,7 @@ EXTRA_DATA =
+@@ -73,7 +73,7 @@ EXTRA_DATA =
  
  ## List of phony targets
  .PHONY : all all-local all-recursive install install-local install-udata install-udata-files install-udata-dlls		\
@@ -23,7 +31,7 @@ index 9db6c52..3441afa 100644
  distclean-local distclean-recursive doc dist dist-local dist-recursive	\
  check check-local check-recursive clean-recursive-with-twist install-icu \
  doc install-doc tests icu4j-data icu4j-data-install update-windows-makefiles xcheck-local xcheck-recursive xperf xcheck xperf-recursive \
-@@ -82,10 +82,10 @@ check-exhaustive check-exhaustive-local check-exhaustive-recursive releaseDist
+@@ -84,9 +84,9 @@ check-exhaustive check-exhaustive-local check-exhaustive-recursive releaseDist
  
  ## List of standard targets
  all: all-local all-recursive
@@ -31,13 +39,11 @@ index 9db6c52..3441afa 100644
 +install: install-recursive
  clean: clean-recursive-with-twist clean-local
 -distclean : distclean-recursive distclean-local
--dist: dist-recursive dist-local
 +distclean : distclean-recursive
-+dist: dist-recursive
+ dist: dist-recursive
  check: all check-recursive
  check-recursive: all
- xcheck: all xcheck-recursive
-@@ -352,7 +352,7 @@ config.status: $(srcdir)/configure $(srcdir)/common/unicode/uvernum.h
+@@ -350,7 +350,7 @@ config.status: $(srcdir)/configure $(srcdir)/common/unicode/uvernum.h
  
  install-manx: $(MANX_FILES)
  	$(MKINSTALLDIRS) $(DESTDIR)$(mandir)/man$(SECTION)
@@ -46,3 +52,6 @@ index 9db6c52..3441afa 100644
  
  config/%.$(SECTION): $(srcdir)/config/%.$(SECTION).in
  	cd $(top_builddir) \
+-- 
+2.14.2
+
diff --git a/meta/recipes-support/icu/icu_59.1.bb b/meta/recipes-support/icu/icu_60.1.bb
similarity index 78%
rename from meta/recipes-support/icu/icu_59.1.bb
rename to meta/recipes-support/icu/icu_60.1.bb
index 31f017b3701..d9d6b37ce96 100644
--- a/meta/recipes-support/icu/icu_59.1.bb
+++ b/meta/recipes-support/icu/icu_60.1.bb
@@ -1,6 +1,6 @@
 require icu.inc
 
-LIC_FILES_CHKSUM = "file://../LICENSE;md5=fe9e1f2c500466d8f18df2cd068e4b74"
+LIC_FILES_CHKSUM = "file://../LICENSE;md5=675f2d069434d8a1e4e6b0dcf4379226"
 
 def icu_download_version(d):
     pvsplit = d.getVar('PV').split('.')
@@ -22,8 +22,8 @@ SRC_URI = "${BASE_SRC_URI} \
 SRC_URI_append_class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[md5sum] = "54923fa9fab5b2b83f235fb72523de37"
-SRC_URI[sha256sum] = "7132fdaf9379429d004005217f10e00b7d2319d0fea22bdfddef8991c45b75fe"
+SRC_URI[md5sum] = "3d164a2d1bcebd1464c6160ebb8315ef"
+SRC_URI[sha256sum] = "f8f5a6c8fbf32c015a467972bdb1477dc5f5d5dfea908b6ed218715eeb5ee225"
 
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
 UPSTREAM_CHECK_URI = "http://download.icu-project.org/files/icu4c/"
-- 
2.15.0


