Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C9A62705A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 16:37:21 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6GGQUho011074; Wed, 16 Jul 2014 17:26:32 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uzE3gbXmx9vE; Wed, 16 Jul 2014 17:26:32 +0100 (BST)
Received: from ted (bebox.config [87.81.244.161] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6GGQRe9011046
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 16 Jul 2014 17:26:29 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1X7S2A-0004Nh-Fg; Wed, 16 Jul 2014 17:26:22 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jul 2014 17:26:09 +0100
Message-Id: <bbf74e8fee607ac6a5b12926676ca66f46d6f508.1405527926.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <381d8ad7d600a74e21c8f8590dde2db0cdbd9584.1405527926.git.richard.purdie@linuxfoundation.org>
References: <381d8ad7d600a74e21c8f8590dde2db0cdbd9584.1405527926.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1405527926.git.richard.purdie@linuxfoundation.org>
References: <cover.1405527926.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 10/19] subversion: Upgrade 1.7.7 -> 1.8.9
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
X-List-Received-Date: Wed, 16 Jul 2014 16:37:22 -0000

Dropped neon patches as neon support was dropped.
Dropped CVE patches as applied in later version
Added patch to avoid OS-X check which doesn't cross compile
Add PACKAGECONFIG for gnome-keyring

Addition to license:

For the file subversion/libsvn_subr/utf_width.c
* Markus Kuhn -- 2007-05-26 (Unicode 5.0)
*
* Permission to use, copy, modify, and distribute this software
* for any purpose and without fee is hereby granted. The author
* disclaims all warranties with regard to this software.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../subversion-1.7.10/allow-updated-neon.patch     |  20 ----
 .../subversion-1.7.10/fix-install-depends.patch    |  48 --------
 .../neon.m4-fix-includes-and-cflags.patch          |  32 -----
 .../subversion-CVE-2013-4131.patch                 |  42 -------
 .../subversion-CVE-2013-4277.patch                 |  15 ---
 .../subversion-CVE-2013-4505.patch                 | 130 ---------------------
 .../subversion-1.8.9/disable_macos.patch           |  68 +++++++++++
 .../libtool2.patch                                 |   0
 .../{subversion_1.7.10.bb => subversion_1.8.9.bb}  |  15 +--
 9 files changed, 74 insertions(+), 296 deletions(-)
 delete mode 100644 meta/recipes-devtools/subversion/subversion-1.7.10/allow-updated-neon.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion-1.7.10/fix-install-depends.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion-1.7.10/neon.m4-fix-includes-and-cflags.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion-1.7.10/subversion-CVE-2013-4131.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion-1.7.10/subversion-CVE-2013-4277.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion-1.7.10/subversion-CVE-2013-4505.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.8.9/disable_macos.patch
 rename meta/recipes-devtools/subversion/{subversion-1.7.10 => subversion-1.8.9}/libtool2.patch (100%)
 rename meta/recipes-devtools/subversion/{subversion_1.7.10.bb => subversion_1.8.9.bb} (67%)

diff --git a/meta/recipes-devtools/subversion/subversion-1.7.10/allow-updated-neon.patch b/meta/recipes-devtools/subversion/subversion-1.7.10/allow-updated-neon.patch
deleted file mode 100644
index e8acb12..0000000
--- a/meta/recipes-devtools/subversion/subversion-1.7.10/allow-updated-neon.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-
-Allow neon 0.30 to be usable also
-
-Upstream-Status: Pending
-
-Signed-off-by: Saul Wold <sgw@linux.intel.com>
-
-Index: subversion-1.7.10/configure.ac
-===================================================================
---- subversion-1.7.10.orig/configure.ac
-+++ subversion-1.7.10/configure.ac
-@@ -118,7 +118,7 @@ AC_PATH_PROG(PKG_CONFIG, pkg-config)
- 
- # Either a space-separated list of allowable Neon versions, or "any" to
- # mean allow anything.
--NEON_ALLOWED_LIST="0\.25 0\.26 0\.27\.2 0\.28 0\.29"
-+NEON_ALLOWED_LIST="0\.25 0\.26 0\.27\.2 0\.28 0\.29 0\.30"
- NEON_RECOMMENDED_VER="0.29.6"
- NEON_URL="http://www.webdav.org/neon/neon-${NEON_RECOMMENDED_VER}.tar.gz"
- dnl You can skip the neon version check only if you know what you are doing 
diff --git a/meta/recipes-devtools/subversion/subversion-1.7.10/fix-install-depends.patch b/meta/recipes-devtools/subversion/subversion-1.7.10/fix-install-depends.patch
deleted file mode 100644
index fb79b8c..0000000
--- a/meta/recipes-devtools/subversion/subversion-1.7.10/fix-install-depends.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-install-neon-lib should depend on libsvn_delta's installation
-
-install-neon-lib needs libsvn_delta-1.la which will be regenerated
-during libsvn_delta-1.la's installation, if libsvn_delta-1.la is
-in regenerating and at the same time install-neon-lib links it, the
-error willl happen.
-
-Let install-neon-lib run after libsvn_delta-1.la is installed will fix
-the problem.
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- build-outputs.mk |    2 +-
- build.conf       |    2 ++
- 2 files changed, 3 insertions(+), 1 deletion(-)
-
---- subversion-1.7.6.orig/build-outputs.mk
-+++ subversion-1.7.6/build-outputs.mk
-@@ -983,11 +983,11 @@ install-locale: subversion/po/de.mo subv
- 	$(MKDIR) $(DESTDIR)$(localedir)/zh_CN/LC_MESSAGES
- 	cd subversion/po ; $(INSTALL_LOCALE) zh_CN.mo $(DESTDIR)$(localedir)/zh_CN/LC_MESSAGES/$(PACKAGE_NAME).mo
- 	$(MKDIR) $(DESTDIR)$(localedir)/zh_TW/LC_MESSAGES
- 	cd subversion/po ; $(INSTALL_LOCALE) zh_TW.mo $(DESTDIR)$(localedir)/zh_TW/LC_MESSAGES/$(PACKAGE_NAME).mo
- 
--install-neon-lib: subversion/libsvn_ra_neon/libsvn_ra_neon-1.la 
-+install-neon-lib: subversion/libsvn_ra_neon/libsvn_ra_neon-1.la $(SVN_FS_LIB_INSTALL_DEPS)
- 	$(MKDIR) $(DESTDIR)$(neon_libdir)
- 	cd subversion/libsvn_ra_neon ; $(INSTALL_NEON_LIB) libsvn_ra_neon-1.la $(DESTDIR)$(neon_libdir)/libsvn_ra_neon-1.la
- 
- install-ramod-lib: subversion/libsvn_fs/libsvn_fs-1.la subversion/libsvn_ra_svn/libsvn_ra_svn-1.la subversion/libsvn_repos/libsvn_repos-1.la subversion/libsvn_ra_local/libsvn_ra_local-1.la 
- 	$(MKDIR) $(DESTDIR)$(ramod_libdir)
---- subversion-1.7.6.orig/build.conf
-+++ subversion-1.7.6/build.conf
-@@ -270,10 +270,12 @@ msvc-export = svn_ra.h private\svn_ra_pr
- [libsvn_ra_neon]
- type = ra-module
- path = subversion/libsvn_ra_neon
- install = neon-lib
- libs = libsvn_delta libsvn_subr aprutil apriconv apr neon
-+# conditionally add more dependencies
-+add-install-deps = $(SVN_FS_LIB_INSTALL_DEPS)
- msvc-static = yes
- 
- # Accessing repositories via DAV through serf
- [libsvn_ra_serf]
- type = ra-module
diff --git a/meta/recipes-devtools/subversion/subversion-1.7.10/neon.m4-fix-includes-and-cflags.patch b/meta/recipes-devtools/subversion/subversion-1.7.10/neon.m4-fix-includes-and-cflags.patch
deleted file mode 100644
index 013d0c3..0000000
--- a/meta/recipes-devtools/subversion/subversion-1.7.10/neon.m4-fix-includes-and-cflags.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Fix to get correct SVN_NEON_CONFIG and CFLAGS when sysroot path contains '-D' and '-I'
-characters.
-
-Upstream-Status: Pending
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-
-index f951039..a813145 100644
---- a/build/ac-macros/neon.m4
-+++ b/build/ac-macros/neon.m4
-@@ -105,8 +105,8 @@ AC_DEFUN(SVN_NEON_CONFIG,
-            test "$svn_allowed_neon" = "any"; then
-             svn_allowed_neon_on_system="yes"
-             if test "$NEON_PKG_CONFIG" = "yes"; then
--              SVN_NEON_INCLUDES=[`$PKG_CONFIG neon --cflags | $SED -e 's/-D[^ ]*//g'`]
--              CFLAGS=["$CFLAGS `$PKG_CONFIG neon --cflags | $SED -e 's/-I[^ ]*//g'`"]
-+              SVN_NEON_INCLUDES=["`$PKG_CONFIG neon --cflags | $SED -e 's/^-D[^ ]*//g' -e 's/ -D[^ ]*//g'`"]
-+              CFLAGS=["$CFLAGS `$PKG_CONFIG neon --cflags | $SED -e 's/^-I[^ ]*//g' -e 's/ -I[^ ]*//g'`"]
-               old_CFLAGS="$CFLAGS"
-               old_LIBS="$LIBS"
-               NEON_LIBS=`$PKG_CONFIG neon --libs`
-@@ -126,8 +126,8 @@ int main()
-               CFLAGS="$old_CFLAGS"
-               LIBS="$old_LIBS"
-             else
--              SVN_NEON_INCLUDES=[`$neon_config --cflags | $SED -e 's/-D[^ ]*//g'`]
--              CFLAGS=["$CFLAGS `$neon_config --cflags | $SED -e 's/-I[^ ]*//g'`"]
-+              SVN_NEON_INCLUDES=[`$neon_config --cflags | $SED -e 's/^-D[^ ]*//g' -e 's/ -D[^ ]*//g'`]
-+              CFLAGS=["$CFLAGS `$neon_config --cflags | $SED -e 's/^-I[^ ]*//g' -e 's/ -I[^ ]*//g'`"]
-               NEON_LIBS=`$neon_config --libs`
-             fi
-             svn_lib_neon="yes"
diff --git a/meta/recipes-devtools/subversion/subversion-1.7.10/subversion-CVE-2013-4131.patch b/meta/recipes-devtools/subversion/subversion-1.7.10/subversion-CVE-2013-4131.patch
deleted file mode 100644
index 88bd25e..0000000
--- a/meta/recipes-devtools/subversion/subversion-1.7.10/subversion-CVE-2013-4131.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-Upstream-Status: Backport
-
-Index: subversion/mod_dav_svn/repos.c
-===================================================================
---- a/subversion/mod_dav_svn/repos.c	(revision 1503527)
-+++ b/subversion/mod_dav_svn/repos.c	(revision 1503528)
-@@ -2408,21 +2408,12 @@
-                 svn_boolean_t is_urlpath,
-                 apr_pool_t *pool)
- {
--  apr_size_t len;
--  char *tmp = apr_pstrdup(pool, path);
--
--  len = strlen(tmp);
--
--  if (len > 0)
-+  if (*path != '\0') /* not an empty string */
-     {
--      /* Remove any trailing slash; else svn_path_dirname() asserts. */
--      if (tmp[len-1] == '/')
--        tmp[len-1] = '\0';
--
-       if (is_urlpath)
--        return svn_urlpath__dirname(tmp, pool);
-+        return svn_urlpath__dirname(path, pool);
-       else
--        return svn_fspath__dirname(tmp, pool);
-+        return svn_fspath__dirname(path, pool);
-     }
- 
-   return path;
-@@ -2458,7 +2449,9 @@
-       parent->versioned = 1;
-       parent->hooks = resource->hooks;
-       parent->pool = resource->pool;
--      parent->uri = get_parent_path(resource->uri, TRUE, resource->pool);
-+      parent->uri = get_parent_path(svn_urlpath__canonicalize(resource->uri,
-+                                                              resource->pool),
-+                                    TRUE, resource->pool);
-       parent->info = parentinfo;
- 
-       parentinfo->uri_path =
diff --git a/meta/recipes-devtools/subversion/subversion-1.7.10/subversion-CVE-2013-4277.patch b/meta/recipes-devtools/subversion/subversion-1.7.10/subversion-CVE-2013-4277.patch
deleted file mode 100644
index a5900d8..0000000
--- a/meta/recipes-devtools/subversion/subversion-1.7.10/subversion-CVE-2013-4277.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Backport
-
---- a/subversion/svnserve/main.c
-+++ b/subversion/svnserve/main.c
-@@ -403,8 +403,9 @@ static svn_error_t *write_pid_file(const
-   const char *contents = apr_psprintf(pool, "%" APR_PID_T_FMT "\n",
-                                              getpid());
- 
-+  SVN_ERR(svn_io_remove_file2(filename, TRUE, pool));
-   SVN_ERR(svn_io_file_open(&file, filename,
--                           APR_WRITE | APR_CREATE | APR_TRUNCATE,
-+                           APR_WRITE | APR_CREATE | APR_EXCL,
-                            APR_OS_DEFAULT, pool));
-   SVN_ERR(svn_io_file_write_full(file, contents, strlen(contents), NULL,
-                                  pool));
diff --git a/meta/recipes-devtools/subversion/subversion-1.7.10/subversion-CVE-2013-4505.patch b/meta/recipes-devtools/subversion/subversion-1.7.10/subversion-CVE-2013-4505.patch
deleted file mode 100644
index a54d694..0000000
--- a/meta/recipes-devtools/subversion/subversion-1.7.10/subversion-CVE-2013-4505.patch
+++ /dev/null
@@ -1,130 +0,0 @@
-Upstream-Status: Backport
-
-Index: tools/server-side/mod_dontdothat/mod_dontdothat.c
-===================================================================
---- a/tools/server-side/mod_dontdothat/mod_dontdothat.c	(revision 1239695)
-+++ b/tools/server-side/mod_dontdothat/mod_dontdothat.c	(revision 1542078)
-@@ -30,12 +30,15 @@
- #include <util_filter.h>
- #include <ap_config.h>
- #include <apr_strings.h>
-+#include <apr_uri.h>
- 
- #include <expat.h>
- 
- #include "mod_dav_svn.h"
- #include "svn_string.h"
- #include "svn_config.h"
-+#include "svn_path.h"
-+#include "private/svn_fspath.h"
- 
- module AP_MODULE_DECLARE_DATA dontdothat_module;
- 
-@@ -161,26 +164,71 @@
-     }
- }
- 
-+/* duplicate of dav_svn__log_err() from mod_dav_svn/util.c */
-+static void
-+log_dav_err(request_rec *r,
-+            dav_error *err,
-+            int level)
-+{
-+    dav_error *errscan;
-+
-+    /* Log the errors */
-+    /* ### should have a directive to log the first or all */
-+    for (errscan = err; errscan != NULL; errscan = errscan->prev) {
-+        apr_status_t status;
-+
-+        if (errscan->desc == NULL)
-+            continue;
-+
-+#if AP_MODULE_MAGIC_AT_LEAST(20091119,0)
-+        status = errscan->aprerr;
-+#else
-+        status = errscan->save_errno;
-+#endif
-+
-+        ap_log_rerror(APLOG_MARK, level, status, r,
-+                      "%s  [%d, #%d]",
-+                      errscan->desc, errscan->status, errscan->error_id);
-+    }
-+}
-+
- static svn_boolean_t
- is_this_legal(dontdothat_filter_ctx *ctx, const char *uri)
- {
-   const char *relative_path;
-   const char *cleaned_uri;
-   const char *repos_name;
-+  const char *uri_path;
-   int trailing_slash;
-   dav_error *derr;
- 
--  /* Ok, so we need to skip past the scheme, host, etc. */
--  uri = ap_strstr_c(uri, "://");
--  if (uri)
--    uri = ap_strchr_c(uri + 3, '/');
-+  /* uri can be an absolute uri or just a path, we only want the path to match
-+   * against */
-+  if (uri && svn_path_is_url(uri))
-+    {
-+      apr_uri_t parsed_uri;
-+      apr_status_t rv = apr_uri_parse(ctx->r->pool, uri, &parsed_uri);
-+      if (APR_SUCCESS != rv)
-+        {
-+          /* Error parsing the URI, log and reject request. */
-+          ap_log_rerror(APLOG_MARK, APLOG_ERR, rv, ctx->r,
-+                        "mod_dontdothat: blocked request after failing "
-+                        "to parse uri: '%s'", uri);
-+          return FALSE;
-+        }
-+      uri_path = parsed_uri.path;
-+    }
-+  else
-+    {
-+      uri_path = uri;
-+    }
- 
--  if (uri)
-+  if (uri_path)
-     {
-       const char *repos_path;
- 
-       derr = dav_svn_split_uri(ctx->r,
--                               uri,
-+                               uri_path,
-                                ctx->cfg->base_path,
-                                &cleaned_uri,
-                                &trailing_slash,
-@@ -194,7 +242,7 @@
-           if (! repos_path)
-             repos_path = "";
- 
--          repos_path = apr_psprintf(ctx->r->pool, "/%s", repos_path);
-+          repos_path = svn_fspath__canonicalize(repos_path, ctx->r->pool);
- 
-           /* First check the special cases that are always legal... */
-           for (idx = 0; idx < ctx->allow_recursive_ops->nelts; ++idx)
-@@ -228,7 +276,20 @@
-                 }
-             }
-         }
-+      else
-+        {
-+          log_dav_err(ctx->r, derr, APLOG_ERR);
-+          return FALSE;
-+        }
-+
-     }
-+  else
-+    {
-+      ap_log_rerror(APLOG_MARK, APLOG_ERR, 0, ctx->r,
-+                    "mod_dontdothat: empty uri passed to is_this_legal(), "
-+                    "module bug?");
-+      return FALSE;
-+    }
- 
-   return TRUE;
- }
diff --git a/meta/recipes-devtools/subversion/subversion-1.8.9/disable_macos.patch b/meta/recipes-devtools/subversion/subversion-1.8.9/disable_macos.patch
new file mode 100644
index 0000000..ec3be49
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion-1.8.9/disable_macos.patch
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
diff --git a/meta/recipes-devtools/subversion/subversion-1.7.10/libtool2.patch b/meta/recipes-devtools/subversion/subversion-1.8.9/libtool2.patch
similarity index 100%
rename from meta/recipes-devtools/subversion/subversion-1.7.10/libtool2.patch
rename to meta/recipes-devtools/subversion/subversion-1.8.9/libtool2.patch
diff --git a/meta/recipes-devtools/subversion/subversion_1.7.10.bb b/meta/recipes-devtools/subversion/subversion_1.8.9.bb
similarity index 67%
rename from meta/recipes-devtools/subversion/subversion_1.7.10.bb
rename to meta/recipes-devtools/subversion/subversion_1.8.9.bb
index e745ce7..b1eee6a 100644
--- a/meta/recipes-devtools/subversion/subversion_1.7.10.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.8.9.bb
@@ -11,24 +11,21 @@ inherit gettext
 
 SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://libtool2.patch \
-           file://fix-install-depends.patch \
-           file://allow-updated-neon.patch \
-           file://neon.m4-fix-includes-and-cflags.patch \
-           file://subversion-CVE-2013-4505.patch \
-           file://subversion-CVE-2013-4131.patch \
-           file://subversion-CVE-2013-4277.patch \
+           file://disable_macos.patch \
 "
-SRC_URI[md5sum] = "4088a77e14232876c9b4ff1541e6e200"
-SRC_URI[sha256sum] = "c1df222bec83d014d17785e2ceba6bc80962f64b280967de0285836d8d77a8e7"
+SRC_URI[md5sum] = "bd495517a760ddd764ce449a891971db"
+SRC_URI[sha256sum] = "45d708a5c3ffbef4b2a1044c4716a053e680763743d1f7ba99d0369f6da49e33"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4a14fd2da3134e40a087eb4326a4ecd4"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1c2f0119e478700b5428e26386cff923"
 
 PACKAGECONFIG[sasl] = "--with-sasl,--without-sasl,cyrus-sasl"
+PACKAGECONFIG[gnome-keyring] = "--with-gnome-keyring,--without-gnome-keyring,glib-2.0 gnome-keyring"
 
 EXTRA_OECONF = " \
                 --without-berkeley-db --without-apxs \
                 --without-swig --with-apr=${STAGING_BINDIR_CROSS} \
                 --with-apr-util=${STAGING_BINDIR_CROSS} \
+                --disable-keychain \
                 ac_cv_path_RUBY=none"
 
 inherit autotools
-- 
1.9.2


