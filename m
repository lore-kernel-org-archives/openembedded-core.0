Return-Path: <anuj.mittal@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9295D7F367
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 08:25:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Jul 2019 01:25:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,329,1559545200"; d="scan'208";a="371432624"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.182.62])
	by fmsmga005.fm.intel.com with ESMTP; 31 Jul 2019 01:25:25 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jul 2019 16:25:21 +0800
Message-Id: <20190731082521.30555-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] libtasn1: upgrade 4.13 -> 4.14
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
X-List-Received-Date: Wed, 31 Jul 2019 08:25:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

* For changes in this version, see:
https://gitlab.com/gnutls/libtasn1/-/releases

* Remove the musl patch as it's no longer needed.

* Backport a patch to ensure LDFLAGS are not over-ridden.

License-Update: License clarification, no change in actual terms.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...roduce-GNULIB_OVERRIDES_WINT_T-check.patch | 63 -------------------
 .../gnutls/libtasn1/fix-ldflags.patch         | 31 +++++++++
 .../{libtasn1_4.13.bb => libtasn1_4.14.bb}    | 12 ++--
 3 files changed, 37 insertions(+), 69 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/libtasn1/0001-stdint.m4-reintroduce-GNULIB_OVERRIDES_WINT_T-check.patch
 create mode 100644 meta/recipes-support/gnutls/libtasn1/fix-ldflags.patch
 rename meta/recipes-support/gnutls/{libtasn1_4.13.bb => libtasn1_4.14.bb} (47%)

diff --git a/meta/recipes-support/gnutls/libtasn1/0001-stdint.m4-reintroduce-GNULIB_OVERRIDES_WINT_T-check.patch b/meta/recipes-support/gnutls/libtasn1/0001-stdint.m4-reintroduce-GNULIB_OVERRIDES_WINT_T-check.patch
deleted file mode 100644
index 1e52d6abf5..0000000000
--- a/meta/recipes-support/gnutls/libtasn1/0001-stdint.m4-reintroduce-GNULIB_OVERRIDES_WINT_T-check.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From b17dbb8d3c5605db3a1d82861fcaeef4636d1117 Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@intel.com>
-Date: Thu, 26 Jan 2017 18:54:48 +0200
-Subject: [PATCH] stdint.m4: reintroduce GNULIB_OVERRIDES_WINT_T check
-
-Partially revert the gnulib commit: 5a400b3f5a1f5483dbfd75d38bdb7080218a063b
-to fix the build error with musl library.
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- gl/m4/stdint.m4 | 27 +++++++++++++++++++++++++++
- 1 file changed, 27 insertions(+)
-
-diff --git a/gl/m4/stdint.m4 b/gl/m4/stdint.m4
-index 4ac854d..3dc3da1 100644
---- a/gl/m4/stdint.m4
-+++ b/gl/m4/stdint.m4
-@@ -355,6 +355,32 @@ int32_t i32 = INT32_C (0x7fffffff);
-     gl_STDINT_TYPE_PROPERTIES
-   fi
- 
-+  dnl Determine whether gnulib's <wchar.h> or <wctype.h> would, if present,
-+  dnl override 'wint_t'.
-+    AC_CACHE_CHECK([whether wint_t is too small],
-+      [gl_cv_type_wint_t_too_small],
-+      [AC_COMPILE_IFELSE(
-+           [AC_LANG_PROGRAM([[
-+  /* Tru64 with Desktop Toolkit C has a bug: <stdio.h> must be included before
-+     <wchar.h>.
-+     BSD/OS 4.0.1 has a bug: <stddef.h>, <stdio.h> and <time.h> must be
-+     included before <wchar.h>.  */
-+  #if !(defined __GLIBC__ && !defined __UCLIBC__)
-+  # include <stddef.h>
-+  # include <stdio.h>
-+  # include <time.h>
-+  #endif
-+  #include <wchar.h>
-+              int verify[sizeof (wint_t) < sizeof (int) ? -1 : 1];
-+              ]])],
-+           [gl_cv_type_wint_t_too_small=no],
-+           [gl_cv_type_wint_t_too_small=yes])])
-+    if test $gl_cv_type_wint_t_too_small = yes; then
-+      GNULIB_OVERRIDES_WINT_T=1
-+    else
-+      GNULIB_OVERRIDES_WINT_T=0
-+    fi
-+
-   dnl The substitute stdint.h needs the substitute limit.h's _GL_INTEGER_WIDTH.
-   LIMITS_H=limits.h
-   AM_CONDITIONAL([GL_GENERATE_LIMITS_H], [test -n "$LIMITS_H"])
-@@ -363,6 +389,7 @@ int32_t i32 = INT32_C (0x7fffffff);
-   AC_SUBST([HAVE_SYS_BITYPES_H])
-   AC_SUBST([HAVE_SYS_INTTYPES_H])
-   AC_SUBST([STDINT_H])
-+  AC_SUBST([GNULIB_OVERRIDES_WINT_T])
-   AM_CONDITIONAL([GL_GENERATE_STDINT_H], [test -n "$STDINT_H"])
- ])
- 
--- 
-2.4.0
-
diff --git a/meta/recipes-support/gnutls/libtasn1/fix-ldflags.patch b/meta/recipes-support/gnutls/libtasn1/fix-ldflags.patch
new file mode 100644
index 0000000000..f18f3c6267
--- /dev/null
+++ b/meta/recipes-support/gnutls/libtasn1/fix-ldflags.patch
@@ -0,0 +1,31 @@
+From a6f93b7ace347bc4fe29eb4a8fe4383d786cc8d0 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
+Date: Tue, 23 Jul 2019 20:44:01 +0200
+Subject: [PATCH] Fix LDFLAGS to AM_LDFLAGS in src/Makefile.am
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Tim Rühsen <tim.ruehsen@gmx.de>
+Upstream-Status: Backport
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ src/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 5bf3622..4459767 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -21,7 +21,7 @@ AM_CPPFLAGS = -I$(top_builddir)/lib/includes -I$(top_srcdir)/lib/includes \
+  -I$(top_builddir)/lib/gl -I$(top_srcdir)/lib/gl $(CODE_COVERAGE_CPPFLAGS)
+ 
+ LDADD = ../lib/libtasn1.la
+-LDFLAGS = $(CODE_COVERAGE_LDFLAGS)
++AM_LDFLAGS = $(CODE_COVERAGE_LDFLAGS)
+ 
+ bin_PROGRAMS = asn1Parser asn1Coding asn1Decoding
+ 
+-- 
+2.21.0
+
diff --git a/meta/recipes-support/gnutls/libtasn1_4.13.bb b/meta/recipes-support/gnutls/libtasn1_4.14.bb
similarity index 47%
rename from meta/recipes-support/gnutls/libtasn1_4.13.bb
rename to meta/recipes-support/gnutls/libtasn1_4.14.bb
index 9ee1913091..cb7fed4449 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.13.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.14.bb
@@ -4,19 +4,19 @@ HOMEPAGE = "http://www.gnu.org/software/libtasn1/"
 LICENSE = "GPLv3+ & LGPLv2.1+"
 LICENSE_${PN}-bin = "GPLv3+"
 LICENSE_${PN} = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
-                    file://README;endline=8;md5=c3803a3e8ca5ab5eb1e5912faa405351"
+LIC_FILES_CHKSUM = "file://doc/COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://doc/COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c \
+                    file://LICENSE;md5=75ac100ec923f959898182307970c360"
 
 SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
-           file://0001-stdint.m4-reintroduce-GNULIB_OVERRIDES_WINT_T-check.patch \
+           file://fix-ldflags.patch \
            "
 
 DEPENDS = "bison-native"
 
-SRC_URI[md5sum] = "ce2ba4d3088119b48e7531a703669c52"
-SRC_URI[sha256sum] = "7e528e8c317ddd156230c4e31d082cd13e7ddeb7a54824be82632209550c8cca"
+SRC_URI[md5sum] = "e9918200ed4a778e2b3cbe34c1be4205"
+SRC_URI[sha256sum] = "9e604ba5c5c8ea403487695c2e407405820d98540d9de884d6e844f9a9c5ba08"
 
 inherit autotools texinfo lib_package gtk-doc
 
-- 
2.21.0


