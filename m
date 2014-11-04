Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4C62071F74
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 11:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA4Bd1md009455; Tue, 4 Nov 2014 11:39:02 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id MxKb1aTZUV7U; Tue,  4 Nov 2014 11:39:02 +0000 (GMT)
Received: from ted (5751f4a1.skybroadband.com [87.81.244.161])
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA4Bcd4G009422
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 4 Nov 2014 11:38:41 GMT
Received: from richard by ted with local (Exim 4.82)
	(envelope-from <richard@dan.rpsys.net>)
	id 1XlcS5-0000JD-Mn; Tue, 04 Nov 2014 11:39:09 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Nov 2014 11:39:03 +0000
Message-Id: <1415101148-1142-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1415101148-1142-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1415101148-1142-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/8] subversion: 1.8.9 -> 1.8.10
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
X-List-Received-Date: Tue, 04 Nov 2014 11:39:42 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../subversion-1.8.10/disable_macos.patch          |  68 ++++
 .../subversion/subversion-1.8.10/libtool2.patch    |  15 +
 .../subversion-1.8.9/disable_macos.patch           |  68 ----
 .../subversion/subversion-1.8.9/libtool2.patch     |  15 -
 .../subversion-CVE-2014-3522.patch                 | 444 ---------------------
 .../subversion/subversion_1.8.10.bb                |  49 +++
 .../subversion/subversion_1.8.9.bb                 |  51 ---
 7 files changed, 132 insertions(+), 578 deletions(-)
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.8.10/disable_macos.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.8.10/libtool2.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion-1.8.9/disable_macos.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion-1.8.9/libtool2.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion-1.8.9/subversion-CVE-2014-3522.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion_1.8.10.bb
 delete mode 100644 meta/recipes-devtools/subversion/subversion_1.8.9.bb

diff --git a/meta/recipes-devtools/subversion/subversion-1.8.10/disable_macos.patch b/meta/recipes-devtools/subversion/subversion-1.8.10/disable_macos.patch
new file mode 100644
index 0000000..ec3be49
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion-1.8.10/disable_macos.patch
@@ -0,0 +1,68 @@
+These tests don't work in cross compiling, just disable them for now, we don't
+build subversion on OS-X at this time.
+
+RP 1014/7/16
+
+Upstream-Status: Pending [needs a rewrite to support a cache value]
+
+Index: subversion-1.8.9/build/ac-macros/macosx.m4
+===================================================================
+--- subversion-1.8.9.orig/build/ac-macros/macosx.m4	2012-11-26 03:04:27.000000000 +0000
++++ subversion-1.8.9/build/ac-macros/macosx.m4	2014-07-16 12:28:58.357300403 +0000
+@@ -24,21 +24,7 @@
+ AC_DEFUN(SVN_LIB_MACHO_ITERATE,
+ [
+   AC_MSG_CHECKING([for Mach-O dynamic module iteration functions])
+-  AC_RUN_IFELSE([AC_LANG_PROGRAM([[
+-    #include <mach-o/dyld.h>
+-    #include <mach-o/loader.h>
+-  ]],[[
+-    const struct mach_header *header = _dyld_get_image_header(0);
+-    const char *name = _dyld_get_image_name(0);
+-    if (name && header) return 0;
+-    return 1;
+-  ]])],[
+-    AC_DEFINE([SVN_HAVE_MACHO_ITERATE], [1],
+-              [Is Mach-O low-level _dyld API available?])
+-    AC_MSG_RESULT([yes])
+-  ],[
+     AC_MSG_RESULT([no])
+-  ])
+ ])
+ 
+ dnl SVN_LIB_MACOS_PLIST
+@@ -46,34 +32,7 @@
+ AC_DEFUN(SVN_LIB_MACOS_PLIST,
+ [
+   AC_MSG_CHECKING([for Mac OS property list utilities])
+-
+-  AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
+-    #include <AvailabilityMacros.h>
+-    #if !defined(MAC_OS_X_VERSION_MAX_ALLOWED) \
+-     || !defined(MAC_OS_X_VERSION_10_0) \
+-     || (MAC_OS_X_VERSION_MAX_ALLOWED <= MAC_OS_X_VERSION_10_0)
+-    #error ProperyList API unavailable.
+-    #endif
+-  ]],[[]])],[
+-    dnl ### Hack.  We should only need to pass the -framework options when
+-    dnl linking libsvn_subr, since it is the only library that uses Keychain.
+-    dnl
+-    dnl Unfortunately, libtool 1.5.x doesn't track transitive dependencies for
+-    dnl OS X frameworks like it does for normal libraries, so we need to
+-    dnl explicitly pass the option to all the users of libsvn_subr to allow
+-    dnl static builds to link successfully.
+-    dnl
+-    dnl This does mean that all executables we link will be linked directly
+-    dnl to these frameworks - even when building shared libraries - but that
+-    dnl shouldn't cause any problems.
+-
+-    LIBS="$LIBS -framework CoreFoundation"
+-    AC_DEFINE([SVN_HAVE_MACOS_PLIST], [1],
+-              [Is Mac OS property list API available?])
+-    AC_MSG_RESULT([yes])
+-  ],[
+     AC_MSG_RESULT([no])
+-  ])
+ ])
+ 
+ dnl SVN_LIB_MACOS_KEYCHAIN
diff --git a/meta/recipes-devtools/subversion/subversion-1.8.10/libtool2.patch b/meta/recipes-devtools/subversion/subversion-1.8.10/libtool2.patch
new file mode 100644
index 0000000..5cd572b
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion-1.8.10/libtool2.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+--- a/configure.ac	2011-10-20 21:56:02.230663987 +0200
++++ b/configure.ac	2011-08-17 15:01:30.000000000 +0200
+@@ -227,8 +227,8 @@
+   LIBTOOL="$sh_libtool"
+   SVN_LIBTOOL="$sh_libtool"
+ else
+-  sh_libtool="$abs_builddir/libtool"
+-  SVN_LIBTOOL="\$(SHELL) $sh_libtool"
++  sh_libtool="$abs_builddir/$host_alias-libtool"
++  SVN_LIBTOOL="\$(SHELL) \$(abs_builddir)/$host_alias-libtool"
+ fi
+ AC_SUBST(SVN_LIBTOOL)
+ 
diff --git a/meta/recipes-devtools/subversion/subversion-1.8.9/disable_macos.patch b/meta/recipes-devtools/subversion/subversion-1.8.9/disable_macos.patch
deleted file mode 100644
index ec3be49..0000000
--- a/meta/recipes-devtools/subversion/subversion-1.8.9/disable_macos.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-These tests don't work in cross compiling, just disable them for now, we don't
-build subversion on OS-X at this time.
-
-RP 1014/7/16
-
-Upstream-Status: Pending [needs a rewrite to support a cache value]
-
-Index: subversion-1.8.9/build/ac-macros/macosx.m4
-===================================================================
---- subversion-1.8.9.orig/build/ac-macros/macosx.m4	2012-11-26 03:04:27.000000000 +0000
-+++ subversion-1.8.9/build/ac-macros/macosx.m4	2014-07-16 12:28:58.357300403 +0000
-@@ -24,21 +24,7 @@
- AC_DEFUN(SVN_LIB_MACHO_ITERATE,
- [
-   AC_MSG_CHECKING([for Mach-O dynamic module iteration functions])
--  AC_RUN_IFELSE([AC_LANG_PROGRAM([[
--    #include <mach-o/dyld.h>
--    #include <mach-o/loader.h>
--  ]],[[
--    const struct mach_header *header = _dyld_get_image_header(0);
--    const char *name = _dyld_get_image_name(0);
--    if (name && header) return 0;
--    return 1;
--  ]])],[
--    AC_DEFINE([SVN_HAVE_MACHO_ITERATE], [1],
--              [Is Mach-O low-level _dyld API available?])
--    AC_MSG_RESULT([yes])
--  ],[
-     AC_MSG_RESULT([no])
--  ])
- ])
- 
- dnl SVN_LIB_MACOS_PLIST
-@@ -46,34 +32,7 @@
- AC_DEFUN(SVN_LIB_MACOS_PLIST,
- [
-   AC_MSG_CHECKING([for Mac OS property list utilities])
--
--  AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
--    #include <AvailabilityMacros.h>
--    #if !defined(MAC_OS_X_VERSION_MAX_ALLOWED) \
--     || !defined(MAC_OS_X_VERSION_10_0) \
--     || (MAC_OS_X_VERSION_MAX_ALLOWED <= MAC_OS_X_VERSION_10_0)
--    #error ProperyList API unavailable.
--    #endif
--  ]],[[]])],[
--    dnl ### Hack.  We should only need to pass the -framework options when
--    dnl linking libsvn_subr, since it is the only library that uses Keychain.
--    dnl
--    dnl Unfortunately, libtool 1.5.x doesn't track transitive dependencies for
--    dnl OS X frameworks like it does for normal libraries, so we need to
--    dnl explicitly pass the option to all the users of libsvn_subr to allow
--    dnl static builds to link successfully.
--    dnl
--    dnl This does mean that all executables we link will be linked directly
--    dnl to these frameworks - even when building shared libraries - but that
--    dnl shouldn't cause any problems.
--
--    LIBS="$LIBS -framework CoreFoundation"
--    AC_DEFINE([SVN_HAVE_MACOS_PLIST], [1],
--              [Is Mac OS property list API available?])
--    AC_MSG_RESULT([yes])
--  ],[
-     AC_MSG_RESULT([no])
--  ])
- ])
- 
- dnl SVN_LIB_MACOS_KEYCHAIN
diff --git a/meta/recipes-devtools/subversion/subversion-1.8.9/libtool2.patch b/meta/recipes-devtools/subversion/subversion-1.8.9/libtool2.patch
deleted file mode 100644
index 5cd572b..0000000
--- a/meta/recipes-devtools/subversion/subversion-1.8.9/libtool2.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
---- a/configure.ac	2011-10-20 21:56:02.230663987 +0200
-+++ b/configure.ac	2011-08-17 15:01:30.000000000 +0200
-@@ -227,8 +227,8 @@
-   LIBTOOL="$sh_libtool"
-   SVN_LIBTOOL="$sh_libtool"
- else
--  sh_libtool="$abs_builddir/libtool"
--  SVN_LIBTOOL="\$(SHELL) $sh_libtool"
-+  sh_libtool="$abs_builddir/$host_alias-libtool"
-+  SVN_LIBTOOL="\$(SHELL) \$(abs_builddir)/$host_alias-libtool"
- fi
- AC_SUBST(SVN_LIBTOOL)
- 
diff --git a/meta/recipes-devtools/subversion/subversion-1.8.9/subversion-CVE-2014-3522.patch b/meta/recipes-devtools/subversion/subversion-1.8.9/subversion-CVE-2014-3522.patch
deleted file mode 100644
index f259e54..0000000
--- a/meta/recipes-devtools/subversion/subversion-1.8.9/subversion-CVE-2014-3522.patch
+++ /dev/null
@@ -1,444 +0,0 @@
-Upstream-Status: Backport
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
-
-Index: subversion/include/private/svn_cert.h
-===================================================================
---- subversion/include/private/svn_cert.h	(nonexistent)
-+++ subversion/include/private/svn_cert.h	(working copy)
-@@ -0,0 +1,68 @@
-+/**
-+ * @copyright
-+ * ====================================================================
-+ *    Licensed to the Apache Software Foundation (ASF) under one
-+ *    or more contributor license agreements.  See the NOTICE file
-+ *    distributed with this work for additional information
-+ *    regarding copyright ownership.  The ASF licenses this file
-+ *    to you under the Apache License, Version 2.0 (the
-+ *    "License"); you may not use this file except in compliance
-+ *    with the License.  You may obtain a copy of the License at
-+ *
-+ *      http://www.apache.org/licenses/LICENSE-2.0
-+ *
-+ *    Unless required by applicable law or agreed to in writing,
-+ *    software distributed under the License is distributed on an
-+ *    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
-+ *    KIND, either express or implied.  See the License for the
-+ *    specific language governing permissions and limitations
-+ *    under the License.
-+ * ====================================================================
-+ * @endcopyright
-+ *
-+ * @file svn_cert.h
-+ * @brief Implementation of certificate validation functions
-+ */
-+
-+#ifndef SVN_CERT_H
-+#define SVN_CERT_H
-+
-+#include <apr.h>
-+
-+#include "svn_types.h"
-+#include "svn_string.h"
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif /* __cplusplus */
-+
-+
-+/* Return TRUE iff @a pattern matches @a hostname as defined
-+ * by the matching rules of RFC 6125.  In the context of RFC
-+ * 6125 the pattern is the domain name portion of the presented
-+ * identifier (which comes from the Common Name or a DNSName
-+ * portion of the subjectAltName of an X.509 certificate) and
-+ * the hostname is the source domain (i.e. the host portion
-+ * of the URI the user entered).
-+ *
-+ * @note With respect to wildcards we only support matching
-+ * wildcards in the left-most label and as the only character
-+ * in the left-most label (i.e. we support RFC 6125 s. 6.4.3
-+ * Rule 1 and 2 but not the optional Rule 3).  This may change
-+ * in the future.
-+ *
-+ * @note Subversion does not at current support internationalized
-+ * domain names.  Both values are presumed to be in NR-LDH label
-+ * or A-label form (see RFC 5890 for the definition).
-+ *
-+ * @since New in 1.9.
-+ */
-+svn_boolean_t
-+svn_cert__match_dns_identity(svn_string_t *pattern, svn_string_t *hostname);
-+
-+
-+#ifdef __cplusplus
-+}
-+#endif /* __cplusplus */
-+
-+#endif /* SVN_CERT_H */
-Index: subversion/libsvn_ra_serf/util.c
-===================================================================
---- subversion/libsvn_ra_serf/util.c	(revision 1615128)
-+++ subversion/libsvn_ra_serf/util.c	(working copy)
-@@ -28,7 +28,6 @@
- #define APR_WANT_STRFUNC
- #include <apr.h>
- #include <apr_want.h>
--#include <apr_fnmatch.h>
- 
- #include <serf.h>
- #include <serf_bucket_types.h>
-@@ -49,6 +48,7 @@
- #include "private/svn_fspath.h"
- #include "private/svn_subr_private.h"
- #include "private/svn_auth_private.h"
-+#include "private/svn_cert.h"
- 
- #include "ra_serf.h"
- 
-@@ -274,7 +274,6 @@ ssl_server_cert(void *baton, int failures,
-   apr_hash_t *subject = NULL;
-   apr_hash_t *serf_cert = NULL;
-   void *creds;
--  int found_matching_hostname = 0;
- 
-   svn_failures = (ssl_convert_serf_failures(failures)
-       | conn->server_cert_failures);
-@@ -286,26 +285,37 @@ ssl_server_cert(void *baton, int failures,
-       ### This should really be handled by serf, which should pass an error
-           for this case, but that has backwards compatibility issues. */
-       apr_array_header_t *san;
-+      svn_boolean_t found_san_entry = FALSE;
-+      svn_boolean_t found_matching_hostname = FALSE;
-+      svn_string_t *actual_hostname =
-+          svn_string_create(conn->session->session_url.hostname, scratch_pool);
- 
-       serf_cert = serf_ssl_cert_certificate(cert, scratch_pool);
- 
-       san = svn_hash_gets(serf_cert, "subjectAltName");
-       /* Try to find matching server name via subjectAltName first... */
--      if (san) {
-+      if (san)
-+        {
-           int i;
--          for (i = 0; i < san->nelts; i++) {
-+          found_san_entry = san->nelts > 0;
-+          for (i = 0; i < san->nelts; i++)
-+            {
-               const char *s = APR_ARRAY_IDX(san, i, const char*);
--              if (apr_fnmatch(s, conn->session->session_url.hostname,
--                  APR_FNM_PERIOD | APR_FNM_CASE_BLIND) == APR_SUCCESS)
--              {
--                  found_matching_hostname = 1;
-+              svn_string_t *cert_hostname = svn_string_create(s, scratch_pool);
-+
-+              if (svn_cert__match_dns_identity(cert_hostname, actual_hostname))
-+                {
-+                  found_matching_hostname = TRUE;
-                   break;
--              }
--          }
--      }
-+                }
-+            }
-+        }
- 
--      /* Match server certificate CN with the hostname of the server */
--      if (!found_matching_hostname)
-+      /* Match server certificate CN with the hostname of the server iff
-+       * we didn't find any subjectAltName fields and try to match them.
-+       * Per RFC 2818 they are authoritative if present and CommonName
-+       * should be ignored. */
-+      if (!found_matching_hostname && !found_san_entry)
-         {
-           const char *hostname = NULL;
- 
-@@ -314,13 +324,20 @@ ssl_server_cert(void *baton, int failures,
-           if (subject)
-             hostname = svn_hash_gets(subject, "CN");
- 
--          if (!hostname
--              || apr_fnmatch(hostname, conn->session->session_url.hostname,
--                             APR_FNM_PERIOD | APR_FNM_CASE_BLIND) != APR_SUCCESS)
--          {
--              svn_failures |= SVN_AUTH_SSL_CNMISMATCH;
--          }
--      }
-+          if (hostname)
-+            {
-+              svn_string_t *cert_hostname = svn_string_create(hostname,
-+                                                              scratch_pool);
-+
-+              if (svn_cert__match_dns_identity(cert_hostname, actual_hostname))
-+                {
-+                  found_matching_hostname = TRUE;
-+                }
-+            }
-+        }
-+
-+      if (!found_matching_hostname)
-+        svn_failures |= SVN_AUTH_SSL_CNMISMATCH;
-     }
- 
-   if (!svn_failures)
-Index: subversion/libsvn_subr/dirent_uri.c
-===================================================================
---- subversion/libsvn_subr/dirent_uri.c	(revision 1615128)
-+++ subversion/libsvn_subr/dirent_uri.c	(working copy)
-@@ -38,6 +38,7 @@
- 
- #include "dirent_uri.h"
- #include "private/svn_fspath.h"
-+#include "private/svn_cert.h"
- 
- /* The canonical empty path.  Can this be changed?  Well, change the empty
-    test below and the path library will work, not so sure about the fs/wc
-@@ -2597,3 +2598,81 @@ svn_urlpath__canonicalize(const char *uri,
-     }
-   return uri;
- }
-+
-+
-+/* -------------- The cert API (see private/svn_cert.h) ------------- */
-+
-+svn_boolean_t
-+svn_cert__match_dns_identity(svn_string_t *pattern, svn_string_t *hostname)
-+{
-+  apr_size_t pattern_pos = 0, hostname_pos = 0;
-+
-+  /* support leading wildcards that composed of the only character in the
-+   * left-most label. */
-+  if (pattern->len >= 2 &&
-+      pattern->data[pattern_pos] == '*' &&
-+      pattern->data[pattern_pos + 1] == '.')
-+    {
-+      while (hostname_pos < hostname->len &&
-+             hostname->data[hostname_pos] != '.')
-+        {
-+          hostname_pos++;
-+        }
-+      /* Assume that the wildcard must match something.  Rule 2 says
-+       * that *.example.com should not match example.com.  If the wildcard
-+       * ends up not matching anything then it matches .example.com which
-+       * seems to be essentially the same as just example.com */
-+      if (hostname_pos == 0)
-+        return FALSE;
-+
-+      pattern_pos++;
-+    }
-+
-+  while (pattern_pos < pattern->len && hostname_pos < hostname->len)
-+    {
-+      char pattern_c = pattern->data[pattern_pos];
-+      char hostname_c = hostname->data[hostname_pos];
-+
-+      /* fold case as described in RFC 4343.
-+       * Note: We actually convert to lowercase, since our URI
-+       * canonicalization code converts to lowercase and generally
-+       * most certs are issued with lowercase DNS names, meaning
-+       * this avoids the fold operation in most cases.  The RFC
-+       * suggests the opposite transformation, but doesn't require
-+       * any specific implementation in any case.  It is critical
-+       * that this folding be locale independent so you can't use
-+       * tolower(). */
-+      pattern_c = canonicalize_to_lower(pattern_c);
-+      hostname_c = canonicalize_to_lower(hostname_c);
-+
-+      if (pattern_c != hostname_c)
-+        {
-+          /* doesn't match */
-+          return FALSE;
-+        }
-+      else
-+        {
-+          /* characters match so skip both */
-+          pattern_pos++;
-+          hostname_pos++;
-+        }
-+    }
-+
-+  /* ignore a trailing period on the hostname since this has no effect on the
-+   * security of the matching.  See the following for the long explanation as
-+   * to why:
-+   * https://bugzilla.mozilla.org/show_bug.cgi?id=134402#c28
-+   */
-+  if (pattern_pos == pattern->len &&
-+      hostname_pos == hostname->len - 1 &&
-+      hostname->data[hostname_pos] == '.')
-+    hostname_pos++;
-+
-+  if (pattern_pos != pattern->len || hostname_pos != hostname->len)
-+    {
-+      /* end didn't match */
-+      return FALSE;
-+    }
-+
-+  return TRUE;
-+}
-Index: subversion/tests/libsvn_subr/dirent_uri-test.c
-===================================================================
---- subversion/tests/libsvn_subr/dirent_uri-test.c	(revision 1615128)
-+++ subversion/tests/libsvn_subr/dirent_uri-test.c	(working copy)
-@@ -37,6 +37,7 @@
- #include "svn_pools.h"
- #include "svn_dirent_uri.h"
- #include "private/svn_fspath.h"
-+#include "private/svn_cert.h"
- 
- #include "../svn_test.h"
- 
-@@ -2714,6 +2715,145 @@ test_fspath_get_longest_ancestor(apr_pool_t *pool)
-   return SVN_NO_ERROR;
- }
- 
-+struct cert_match_dns_test {
-+  const char *pattern;
-+  const char *hostname;
-+  svn_boolean_t expected;
-+};
-+
-+static svn_error_t *
-+run_cert_match_dns_tests(struct cert_match_dns_test *tests, apr_pool_t *pool)
-+{
-+  struct cert_match_dns_test *ct;
-+  apr_pool_t *iterpool = svn_pool_create(pool);
-+
-+  for (ct = tests; ct->pattern; ct++)
-+    {
-+      svn_boolean_t result;
-+      svn_string_t *pattern, *hostname;
-+
-+      svn_pool_clear(iterpool);
-+
-+      pattern = svn_string_create(ct->pattern, iterpool);
-+      hostname = svn_string_create(ct->hostname, iterpool);
-+
-+      result = svn_cert__match_dns_identity(pattern, hostname);
-+      if (result != ct->expected)
-+        return svn_error_createf(SVN_ERR_TEST_FAILED, NULL,
-+                                 "Expected %s but got %s for pattern '%s' on "
-+                                 "hostname '%s'",
-+                                 ct->expected ? "match" : "no match",
-+                                 result ? "match" : "no match",
-+                                 pattern->data, hostname->data);
-+
-+    }
-+
-+  svn_pool_destroy(iterpool);
-+
-+  return SVN_NO_ERROR;
-+}
-+
-+static struct cert_match_dns_test cert_match_dns_tests[] = {
-+  { "foo.example.com", "foo.example.com", TRUE }, /* exact match */
-+  { "foo.example.com", "FOO.EXAMPLE.COM", TRUE }, /* case differences */
-+  { "FOO.EXAMPLE.COM", "foo.example.com", TRUE },
-+  { "*.example.com", "FoO.ExAmPlE.CoM", TRUE },
-+  { "*.ExAmPlE.CoM", "foo.example.com", TRUE },
-+  { "ABCDEFGHIJKLMNOPQRSTUVWXYZ", "abcdefghijklmnopqrstuvwxyz", TRUE },
-+  { "abcdefghijklmnopqrstuvwxyz", "ABCDEFGHIJKLMNOPQRSTUVWXYZ", TRUE },
-+  { "foo.example.com", "bar.example.com", FALSE }, /* difference at start */
-+  { "foo.example.com", "foo.example.net", FALSE }, /* difference at end */
-+  { "foo.example.com", "foo.example.commercial", FALSE }, /* hostname longer */
-+  { "foo.example.commercial", "foo.example.com", FALSE }, /* pattern longer */
-+  { "foo.example.comcom", "foo.example.com", FALSE }, /* repeated suffix */
-+  { "foo.example.com", "foo.example.comcom", FALSE },
-+  { "foo.example.com.com", "foo.example.com", FALSE },
-+  { "foo.example.com", "foo.example.com.com", FALSE },
-+  { "foofoo.example.com", "foo.example.com", FALSE }, /* repeated prefix */
-+  { "foo.example.com", "foofoo.example.com", FALSE },
-+  { "foo.foo.example.com", "foo.example.com", FALSE },
-+  { "foo.example.com", "foo.foo.example.com", FALSE },
-+  { "foo.*.example.com", "foo.bar.example.com", FALSE }, /* RFC 6125 s. 6.4.3
-+                                                            Rule 1 */
-+  { "*.example.com", "foo.example.com", TRUE }, /* RFC 6125 s. 6.4.3 Rule 2 */
-+  { "*.example.com", "bar.foo.example.com", FALSE }, /* Rule 2 */
-+  { "*.example.com", "example.com", FALSE }, /* Rule 2 */
-+  { "*.example.com", ".example.com", FALSE }, /* RFC doesn't say what to do
-+                                                 here and a leading period on
-+                                                 a hostname doesn't make sense
-+                                                 so we'll just reject this. */
-+  { "*", "foo.example.com", FALSE }, /* wildcard must be left-most label,
-+                                        implies that there must be more than
-+                                        one label. */
-+  { "*", "example.com", FALSE },
-+  { "*", "com", FALSE },
-+  { "*.example.com", "foo.example.net", FALSE }, /* difference in literal text
-+                                                    with a wildcard. */
-+  { "*.com", "example.com", TRUE }, /* See Errata ID 3090 for RFC 6125,
-+                                       probably shouldn't allow this but
-+                                       we do for now. */
-+  { "*.", "example.com", FALSE }, /* test some dubious 2 character wildcard
-+                                     patterns */
-+  { "*.", "example.", TRUE }, /* This one feels questionable */
-+  { "*.", "example", FALSE },
-+  { "*.", ".", FALSE },
-+  { "a", "a", TRUE }, /* check that single letter exact matches work */
-+  { "a", "b", FALSE }, /* and single letter not matches shouldn't */
-+  { "*.*.com", "foo.example.com", FALSE }, /* unsupported wildcards */
-+  { "*.*.com", "example.com", FALSE },
-+  { "**.example.com", "foo.example.com", FALSE },
-+  { "**.example.com", "example.com", FALSE },
-+  { "f*.example.com", "foo.example.com", FALSE },
-+  { "f*.example.com", "bar.example.com", FALSE },
-+  { "*o.example.com", "foo.example.com", FALSE },
-+  { "*o.example.com", "bar.example.com", FALSE },
-+  { "f*o.example.com", "foo.example.com", FALSE },
-+  { "f*o.example.com", "bar.example.com", FALSE },
-+  { "foo.e*.com", "foo.example.com", FALSE },
-+  { "foo.*e.com", "foo.example.com", FALSE },
-+  { "foo.e*e.com", "foo.example.com", FALSE },
-+  { "foo.example.com", "foo.example.com.", TRUE }, /* trailing dot */
-+  { "*.example.com", "foo.example.com.", TRUE },
-+  { "foo", "foo.", TRUE },
-+  { "foo.example.com.", "foo.example.com", FALSE },
-+  { "*.example.com.", "foo.example.com", FALSE },
-+  { "foo.", "foo", FALSE },
-+  { "foo.example.com", "foo.example.com..", FALSE },
-+  { "*.example.com", "foo.example.com..", FALSE },
-+  { "foo", "foo..", FALSE },
-+  { "foo.example.com..", "foo.example.com", FALSE },
-+  { "*.example.com..", "foo.example.com", FALSE },
-+  { "foo..", "foo", FALSE },
-+  { NULL }
-+};
-+
-+static svn_error_t *
-+test_cert_match_dns_identity(apr_pool_t *pool)
-+{
-+  return run_cert_match_dns_tests(cert_match_dns_tests, pool);
-+}
-+
-+/* This test table implements results that should happen if we supported
-+ * RFC 6125 s. 6.4.3 Rule 3.  We don't so it's expected to fail for now. */
-+static struct cert_match_dns_test rule3_tests[] = {
-+  { "baz*.example.net", "baz1.example.net", TRUE },
-+  { "*baz.example.net", "foobaz.example.net", TRUE },
-+  { "b*z.example.net", "buuz.example.net", TRUE },
-+  { "b*z.example.net", "bz.example.net", FALSE }, /* presume wildcard can't
-+                                                     match nothing */
-+  { "baz*.example.net", "baz.example.net", FALSE },
-+  { "*baz.example.net", "baz.example.net", FALSE },
-+  { "b*z.example.net", "buuzuuz.example.net", TRUE }, /* presume wildcard
-+                                                         should be greedy */
-+  { NULL }
-+};
-+
-+static svn_error_t *
-+test_rule3(apr_pool_t *pool)
-+{
-+  return run_cert_match_dns_tests(rule3_tests, pool);
-+}
-+
- 
- /* The test table.  */
- 
-@@ -2812,5 +2952,9 @@ struct svn_test_descriptor_t test_funcs[] =
-                    "test svn_fspath__dirname/basename/split"),
-     SVN_TEST_PASS2(test_fspath_get_longest_ancestor,
-                    "test svn_fspath__get_longest_ancestor"),
-+    SVN_TEST_PASS2(test_cert_match_dns_identity,
-+                   "test svn_cert__match_dns_identity"),
-+    SVN_TEST_XFAIL2(test_rule3,
-+                    "test match with RFC 6125 s. 6.4.3 Rule 3"),
-     SVN_TEST_NULL
-   };
diff --git a/meta/recipes-devtools/subversion/subversion_1.8.10.bb b/meta/recipes-devtools/subversion/subversion_1.8.10.bb
new file mode 100644
index 0000000..b223d26
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion_1.8.10.bb
@@ -0,0 +1,49 @@
+SUMMARY = "Subversion (svn) version control system client"
+SECTION = "console/network"
+DEPENDS = "apr-util serf sqlite3 file"
+RDEPENDS_${PN} = "serf"
+LICENSE = "Apache-2"
+HOMEPAGE = "http://subversion.tigris.org"
+
+BBCLASSEXTEND = "native"
+
+inherit gettext
+
+SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
+           file://libtool2.patch \
+           file://disable_macos.patch \
+"
+SRC_URI[md5sum] = "3068256761b40863df96128834d6b71b"
+SRC_URI[sha256sum] = "1cc900c8a7974337c3ed389dc6b5c59012ec48c7d4107ae31fd7c929ded47dcc"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1c2f0119e478700b5428e26386cff923"
+
+PACKAGECONFIG[sasl] = "--with-sasl,--without-sasl,cyrus-sasl"
+PACKAGECONFIG[gnome-keyring] = "--with-gnome-keyring,--without-gnome-keyring,glib-2.0 gnome-keyring"
+
+EXTRA_OECONF = " \
+                --without-berkeley-db --without-apxs \
+                --without-swig --with-apr=${STAGING_BINDIR_CROSS} \
+                --with-apr-util=${STAGING_BINDIR_CROSS} \
+                --disable-keychain \
+                ac_cv_path_RUBY=none"
+
+inherit autotools
+
+export LDFLAGS += " -L${STAGING_LIBDIR} "
+
+acpaths = "-I build/ -I build/ac-macros/"
+
+do_configure_prepend () {
+	rm -f ${S}/libtool
+	rm -f ${S}/build/libtool.m4 ${S}/build/ltmain.sh ${S}/build/ltoptions.m4 ${S}/build/ltsugar.m4 ${S}/build/ltversion.m4 ${S}/build/lt~obsolete.m4
+	rm -f ${S}/aclocal.m4
+	sed -i -e 's:with_sasl="/usr/local":with_sasl="${STAGING_DIR}":' ${S}/build/ac-macros/sasl.m4
+}
+
+#| x86_64-linux-libtool: install: warning: `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-r0/build/subversion/libsvn_ra_local/libsvn_ra_local-1.la' has not been installed in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'| x86_64-linux-libtool: install: warning: `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-r0/build/subversion/libsvn_repos/libsvn_repos-1.la' has not been installed in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'| /usr/bin/ld: cannot find -lsvn_delta-1| collect2: ld returned 1 exit status| x86_64-linux-libtool: install: warning: `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-r0/build/su!
 bversion/libsvn_ra_svn/libsvn_ra_svn-1.la' has not been installed in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'| x86_64-linux-libtool: install: warning: `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-r0/build/subversion/libsvn_ra_serf/libsvn_ra_serf-1.la' has not been installed in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'
+#| x86_64-linux-libtool: install: error: relink `libsvn_ra_serf-1.la' with the above command before installing it
+#| x86_64-linux-libtool: install: warning: `../../subversion/libsvn_repos/libsvn_repos-1.la' has not been installed in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'
+#| /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-r0/subversion-1.8.9/build-outputs.mk:1090: recipe for target 'install-serf-lib' failed
+#| make: *** [install-serf-lib] Error 1
+PARALLEL_MAKEINST = ""
diff --git a/meta/recipes-devtools/subversion/subversion_1.8.9.bb b/meta/recipes-devtools/subversion/subversion_1.8.9.bb
deleted file mode 100644
index 1ef59a0..0000000
--- a/meta/recipes-devtools/subversion/subversion_1.8.9.bb
+++ /dev/null
@@ -1,51 +0,0 @@
-SUMMARY = "Subversion (svn) version control system client"
-SECTION = "console/network"
-DEPENDS = "apr-util serf sqlite3 file"
-RDEPENDS_${PN} = "serf"
-LICENSE = "Apache-2"
-HOMEPAGE = "http://subversion.tigris.org"
-
-BBCLASSEXTEND = "native"
-
-inherit gettext
-
-SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://libtool2.patch \
-           file://disable_macos.patch \
-           file://subversion-CVE-2014-3522.patch;striplevel=0 \
-           file://subversion-CVE-2014-3528.patch \
-"
-SRC_URI[md5sum] = "bd495517a760ddd764ce449a891971db"
-SRC_URI[sha256sum] = "45d708a5c3ffbef4b2a1044c4716a053e680763743d1f7ba99d0369f6da49e33"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1c2f0119e478700b5428e26386cff923"
-
-PACKAGECONFIG[sasl] = "--with-sasl,--without-sasl,cyrus-sasl"
-PACKAGECONFIG[gnome-keyring] = "--with-gnome-keyring,--without-gnome-keyring,glib-2.0 gnome-keyring"
-
-EXTRA_OECONF = " \
-                --without-berkeley-db --without-apxs \
-                --without-swig --with-apr=${STAGING_BINDIR_CROSS} \
-                --with-apr-util=${STAGING_BINDIR_CROSS} \
-                --disable-keychain \
-                ac_cv_path_RUBY=none"
-
-inherit autotools
-
-export LDFLAGS += " -L${STAGING_LIBDIR} "
-
-acpaths = "-I build/ -I build/ac-macros/"
-
-do_configure_prepend () {
-	rm -f ${S}/libtool
-	rm -f ${S}/build/libtool.m4 ${S}/build/ltmain.sh ${S}/build/ltoptions.m4 ${S}/build/ltsugar.m4 ${S}/build/ltversion.m4 ${S}/build/lt~obsolete.m4
-	rm -f ${S}/aclocal.m4
-	sed -i -e 's:with_sasl="/usr/local":with_sasl="${STAGING_DIR}":' ${S}/build/ac-macros/sasl.m4
-}
-
-#| x86_64-linux-libtool: install: warning: `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-r0/build/subversion/libsvn_ra_local/libsvn_ra_local-1.la' has not been installed in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'| x86_64-linux-libtool: install: warning: `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-r0/build/subversion/libsvn_repos/libsvn_repos-1.la' has not been installed in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'| /usr/bin/ld: cannot find -lsvn_delta-1| collect2: ld returned 1 exit status| x86_64-linux-libtool: install: warning: `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-r0/build/su!
 bversion/libsvn_ra_svn/libsvn_ra_svn-1.la' has not been installed in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'| x86_64-linux-libtool: install: warning: `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-r0/build/subversion/libsvn_ra_serf/libsvn_ra_serf-1.la' has not been installed in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'
-#| x86_64-linux-libtool: install: error: relink `libsvn_ra_serf-1.la' with the above command before installing it
-#| x86_64-linux-libtool: install: warning: `../../subversion/libsvn_repos/libsvn_repos-1.la' has not been installed in `/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/sysroots/x86_64-linux/usr/lib'
-#| /home/pokybuild/yocto-autobuilder/yocto-worker/nightly-qa-logrotate/build/build/tmp/work/x86_64-linux/subversion-native/1.8.9-r0/subversion-1.8.9/build-outputs.mk:1090: recipe for target 'install-serf-lib' failed
-#| make: *** [install-serf-lib] Error 1
-PARALLEL_MAKEINST = ""
-- 
2.0.2


