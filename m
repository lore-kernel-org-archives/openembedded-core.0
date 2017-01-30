Return-Path: <maxin.john@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 08019760A6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 11:55:08 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP; 30 Jan 2017 03:55:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,311,1477983600"; d="scan'208";a="1100681442"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jan 2017 03:55:09 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id 0BD496A4006
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 03:54:09 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jan 2017 13:55:58 +0200
Message-Id: <1485777358-32699-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH v2] libtasn1: Upgrade 4.9 -> 4.10
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
X-List-Received-Date: Mon, 30 Jan 2017 11:55:09 -0000

Removed the following Backported patches:
 1. 0001-configure-don-t-add-Werror-to-build-flags.patch
 2. 0002-ASN.y-corrected-compiler-warning.patch
 3. 0003-parser_aux-corrected-potential-null-pointer-derefere.patch
 4. 0004-tools-eliminated-compiler-warnings.patch

fixed the following build error with musl
...
|                  from ../../libtasn1-4.10/gl/getopt.c:28:
| ./stdint.h:89:5: error: #if with no expression
|  #if
|      ^

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...configure-don-t-add-Werror-to-build-flags.patch | 28 ---------
 ...reintroduce-GNULIB_OVERRIDES_WINT_T-check.patch | 63 +++++++++++++++++++
 .../0002-ASN.y-corrected-compiler-warning.patch    | 28 ---------
 ...corrected-potential-null-pointer-derefere.patch | 73 ----------------------
 .../0004-tools-eliminated-compiler-warnings.patch  | 56 -----------------
 .../gnutls/{libtasn1_4.9.bb => libtasn1_4.10.bb}   |  9 +--
 6 files changed, 66 insertions(+), 191 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/libtasn1/0001-configure-don-t-add-Werror-to-build-flags.patch
 create mode 100644 meta/recipes-support/gnutls/libtasn1/0001-stdint.m4-reintroduce-GNULIB_OVERRIDES_WINT_T-check.patch
 delete mode 100644 meta/recipes-support/gnutls/libtasn1/0002-ASN.y-corrected-compiler-warning.patch
 delete mode 100644 meta/recipes-support/gnutls/libtasn1/0003-parser_aux-corrected-potential-null-pointer-derefere.patch
 delete mode 100644 meta/recipes-support/gnutls/libtasn1/0004-tools-eliminated-compiler-warnings.patch
 rename meta/recipes-support/gnutls/{libtasn1_4.9.bb => libtasn1_4.10.bb} (59%)

diff --git a/meta/recipes-support/gnutls/libtasn1/0001-configure-don-t-add-Werror-to-build-flags.patch b/meta/recipes-support/gnutls/libtasn1/0001-configure-don-t-add-Werror-to-build-flags.patch
deleted file mode 100644
index ae64394..0000000
--- a/meta/recipes-support/gnutls/libtasn1/0001-configure-don-t-add-Werror-to-build-flags.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 908e9fa4c1172f09e0e45420a403dc25ed0a466c Mon Sep 17 00:00:00 2001
-From: Nikos Mavrogiannopoulos <nmav@redhat.com>
-Date: Tue, 26 Jul 2016 08:45:33 +0200
-Subject: [PATCH 1/4] configure: don't add -Werror to build flags
-
----
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- configure.ac | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 7a14e04..066f5fe 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -70,8 +70,6 @@ AC_ARG_ENABLE([gcc-warnings],
- )
- 
- if test "$gl_gcc_warnings" = yes; then
--  gl_WARN_ADD([-Werror], [WERROR_CFLAGS])
--
-   nw="$nw -Wsystem-headers"         # Don't let system headers trigger warnings
-   nw="$nw -Wc++-compat"             # We don't care strongly about C++ compilers
-   nw="$nw -Wtraditional"            # Warns on #elif which we use often
--- 
-1.9.1
-
diff --git a/meta/recipes-support/gnutls/libtasn1/0001-stdint.m4-reintroduce-GNULIB_OVERRIDES_WINT_T-check.patch b/meta/recipes-support/gnutls/libtasn1/0001-stdint.m4-reintroduce-GNULIB_OVERRIDES_WINT_T-check.patch
new file mode 100644
index 0000000..1e52d6a
--- /dev/null
+++ b/meta/recipes-support/gnutls/libtasn1/0001-stdint.m4-reintroduce-GNULIB_OVERRIDES_WINT_T-check.patch
@@ -0,0 +1,63 @@
+From b17dbb8d3c5605db3a1d82861fcaeef4636d1117 Mon Sep 17 00:00:00 2001
+From: "Maxin B. John" <maxin.john@intel.com>
+Date: Thu, 26 Jan 2017 18:54:48 +0200
+Subject: [PATCH] stdint.m4: reintroduce GNULIB_OVERRIDES_WINT_T check
+
+Partially revert the gnulib commit: 5a400b3f5a1f5483dbfd75d38bdb7080218a063b
+to fix the build error with musl library.
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Maxin B. John <maxin.john@intel.com>
+---
+ gl/m4/stdint.m4 | 27 +++++++++++++++++++++++++++
+ 1 file changed, 27 insertions(+)
+
+diff --git a/gl/m4/stdint.m4 b/gl/m4/stdint.m4
+index 4ac854d..3dc3da1 100644
+--- a/gl/m4/stdint.m4
++++ b/gl/m4/stdint.m4
+@@ -355,6 +355,32 @@ int32_t i32 = INT32_C (0x7fffffff);
+     gl_STDINT_TYPE_PROPERTIES
+   fi
+ 
++  dnl Determine whether gnulib's <wchar.h> or <wctype.h> would, if present,
++  dnl override 'wint_t'.
++    AC_CACHE_CHECK([whether wint_t is too small],
++      [gl_cv_type_wint_t_too_small],
++      [AC_COMPILE_IFELSE(
++           [AC_LANG_PROGRAM([[
++  /* Tru64 with Desktop Toolkit C has a bug: <stdio.h> must be included before
++     <wchar.h>.
++     BSD/OS 4.0.1 has a bug: <stddef.h>, <stdio.h> and <time.h> must be
++     included before <wchar.h>.  */
++  #if !(defined __GLIBC__ && !defined __UCLIBC__)
++  # include <stddef.h>
++  # include <stdio.h>
++  # include <time.h>
++  #endif
++  #include <wchar.h>
++              int verify[sizeof (wint_t) < sizeof (int) ? -1 : 1];
++              ]])],
++           [gl_cv_type_wint_t_too_small=no],
++           [gl_cv_type_wint_t_too_small=yes])])
++    if test $gl_cv_type_wint_t_too_small = yes; then
++      GNULIB_OVERRIDES_WINT_T=1
++    else
++      GNULIB_OVERRIDES_WINT_T=0
++    fi
++
+   dnl The substitute stdint.h needs the substitute limit.h's _GL_INTEGER_WIDTH.
+   LIMITS_H=limits.h
+   AM_CONDITIONAL([GL_GENERATE_LIMITS_H], [test -n "$LIMITS_H"])
+@@ -363,6 +389,7 @@ int32_t i32 = INT32_C (0x7fffffff);
+   AC_SUBST([HAVE_SYS_BITYPES_H])
+   AC_SUBST([HAVE_SYS_INTTYPES_H])
+   AC_SUBST([STDINT_H])
++  AC_SUBST([GNULIB_OVERRIDES_WINT_T])
+   AM_CONDITIONAL([GL_GENERATE_STDINT_H], [test -n "$STDINT_H"])
+ ])
+ 
+-- 
+2.4.0
+
diff --git a/meta/recipes-support/gnutls/libtasn1/0002-ASN.y-corrected-compiler-warning.patch b/meta/recipes-support/gnutls/libtasn1/0002-ASN.y-corrected-compiler-warning.patch
deleted file mode 100644
index dd36422..0000000
--- a/meta/recipes-support/gnutls/libtasn1/0002-ASN.y-corrected-compiler-warning.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 3542c01618fcde83b29640ea2c60bfd2629ae0b7 Mon Sep 17 00:00:00 2001
-From: Nikos Mavrogiannopoulos <nmav@redhat.com>
-Date: Tue, 26 Jul 2016 08:47:49 +0200
-Subject: [PATCH 2/4] ASN.y: corrected compiler warning
-
----
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- lib/ASN1.y | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/ASN1.y b/lib/ASN1.y
-index 731415d..6db638f 100644
---- a/lib/ASN1.y
-+++ b/lib/ASN1.y
-@@ -621,7 +621,7 @@ _asn1_create_errorDescription (int error, char *error_desc)
-     case ASN1_NAME_TOO_LONG:
-       snprintf (error_desc, ASN1_MAX_ERROR_DESCRIPTION_SIZE,
-                 "%s:%u: name too long (more than %u characters)", file_name,
--                line_number, ASN1_MAX_NAME_SIZE);
-+                line_number, (unsigned)ASN1_MAX_NAME_SIZE);
-       break;
-     case ASN1_IDENTIFIER_NOT_FOUND:
-       snprintf (error_desc, ASN1_MAX_ERROR_DESCRIPTION_SIZE,
--- 
-1.9.1
-
diff --git a/meta/recipes-support/gnutls/libtasn1/0003-parser_aux-corrected-potential-null-pointer-derefere.patch b/meta/recipes-support/gnutls/libtasn1/0003-parser_aux-corrected-potential-null-pointer-derefere.patch
deleted file mode 100644
index 2420143..0000000
--- a/meta/recipes-support/gnutls/libtasn1/0003-parser_aux-corrected-potential-null-pointer-derefere.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From c8903aa27dc9de1d9efeed9d1f7894f1019548f7 Mon Sep 17 00:00:00 2001
-From: Nikos Mavrogiannopoulos <nmav@redhat.com>
-Date: Tue, 26 Jul 2016 08:49:15 +0200
-Subject: [PATCH 3/4] parser_aux: corrected potential null pointer dereferences
-
----
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- lib/parser_aux.c | 12 ++++++------
- 1 file changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/lib/parser_aux.c b/lib/parser_aux.c
-index 2285b20..12ee16f 100644
---- a/lib/parser_aux.c
-+++ b/lib/parser_aux.c
-@@ -637,7 +637,7 @@ _asn1_change_integer_value (asn1_node node)
- 		      p = NULL;
- 		      break;
- 		    }
--		  if (p->right)
-+		  if (p && p->right)
- 		    {
- 		      p = p->right;
- 		      break;
-@@ -753,7 +753,7 @@ _asn1_expand_object_id (asn1_node node)
- 
-       if (move == RIGHT)
- 	{
--	  if (p->right)
-+	  if (p && p->right)
- 	    p = p->right;
- 	  else
- 	    move = UP;
-@@ -828,7 +828,7 @@ _asn1_expand_object_id (asn1_node node)
- 
-       if (move == RIGHT)
- 	{
--	  if (p->right)
-+	  if (p && p->right)
- 	    p = p->right;
- 	  else
- 	    move = UP;
-@@ -898,7 +898,7 @@ _asn1_type_set_config (asn1_node node)
- 
-       if (move == RIGHT)
- 	{
--	  if (p->right)
-+	  if (p && p->right)
- 	    p = p->right;
- 	  else
- 	    move = UP;
-@@ -1007,7 +1007,7 @@ _asn1_check_identifier (asn1_node node)
- 		  p = NULL;
- 		  break;
- 		}
--	      if (p->right)
-+	      if (p && p->right)
- 		{
- 		  p = p->right;
- 		  break;
-@@ -1067,7 +1067,7 @@ _asn1_set_default_tag (asn1_node node)
- 		  p = NULL;
- 		  break;
- 		}
--	      if (p->right)
-+	      if (p && p->right)
- 		{
- 		  p = p->right;
- 		  break;
--- 
-1.9.1
-
diff --git a/meta/recipes-support/gnutls/libtasn1/0004-tools-eliminated-compiler-warnings.patch b/meta/recipes-support/gnutls/libtasn1/0004-tools-eliminated-compiler-warnings.patch
deleted file mode 100644
index 7bda0e6..0000000
--- a/meta/recipes-support/gnutls/libtasn1/0004-tools-eliminated-compiler-warnings.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From d647bb2fa1bd288a6ac02c18318f3cba2a34c3a0 Mon Sep 17 00:00:00 2001
-From: Nikos Mavrogiannopoulos <nmav@redhat.com>
-Date: Tue, 26 Jul 2016 08:50:24 +0200
-Subject: [PATCH 4/4] tools: eliminated compiler warnings
-
----
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- src/asn1Coding.c   | 2 +-
- src/asn1Decoding.c | 2 +-
- src/asn1Parser.c   | 2 +-
- 3 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/asn1Coding.c b/src/asn1Coding.c
-index d4df593..b516bfe 100644
---- a/src/asn1Coding.c
-+++ b/src/asn1Coding.c
-@@ -188,7 +188,7 @@ main (int argc, char *argv[])
- 	default:
- 	  fprintf (stderr,
- 		   "asn1Coding: ?? getopt returned character code Ox%x ??\n",
--		   option_result);
-+		   (unsigned)option_result);
- 	}
-     }
- 
-diff --git a/src/asn1Decoding.c b/src/asn1Decoding.c
-index 078963e..20f91ac 100644
---- a/src/asn1Decoding.c
-+++ b/src/asn1Decoding.c
-@@ -131,7 +131,7 @@ main (int argc, char *argv[])
- 	default:
- 	  fprintf (stderr,
- 		   "asn1Decoding: ?? getopt returned character code Ox%x ??\n",
--		   option_result);
-+		   (unsigned)option_result);
- 	}
-     }
- 
-diff --git a/src/asn1Parser.c b/src/asn1Parser.c
-index 7a3ae67..475bfc9 100644
---- a/src/asn1Parser.c
-+++ b/src/asn1Parser.c
-@@ -139,7 +139,7 @@ main (int argc, char *argv[])
- 	default:
- 	  fprintf (stderr,
- 		   "asn1Parser: ?? getopt returned character code Ox%x ??\n",
--		   option_result);
-+		   (unsigned)option_result);
- 	}
- 
-     }
--- 
-1.9.1
-
diff --git a/meta/recipes-support/gnutls/libtasn1_4.9.bb b/meta/recipes-support/gnutls/libtasn1_4.10.bb
similarity index 59%
rename from meta/recipes-support/gnutls/libtasn1_4.9.bb
rename to meta/recipes-support/gnutls/libtasn1_4.10.bb
index b8ff9ea..2d9c4f2 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.9.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.10.bb
@@ -10,14 +10,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 
 SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
-           file://0001-configure-don-t-add-Werror-to-build-flags.patch \
-           file://0002-ASN.y-corrected-compiler-warning.patch \
-           file://0003-parser_aux-corrected-potential-null-pointer-derefere.patch \
-           file://0004-tools-eliminated-compiler-warnings.patch \
+           file://0001-stdint.m4-reintroduce-GNULIB_OVERRIDES_WINT_T-check.patch \
            "
 
-SRC_URI[md5sum] = "3018d0f466a32b66dde41bb122e6cab6"
-SRC_URI[sha256sum] = "4f6f7a8fd691ac2b8307c8ca365bad711db607d4ad5966f6938a9d2ecd65c920"
+SRC_URI[md5sum] = "f4faffdf63969d0e4e6df43b9679e8e5"
+SRC_URI[sha256sum] = "681a4d9a0d259f2125713f2e5766c5809f151b3a1392fd91390f780b4b8f5a02"
 
 inherit autotools texinfo binconfig lib_package gtk-doc
 
-- 
2.4.0


