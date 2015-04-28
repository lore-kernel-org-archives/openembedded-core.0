Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8BCF072277
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 00:25:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3S0P1Jk005249
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Apr 2015 17:25:01 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.142) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Mon, 27 Apr 2015 17:25:00 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Apr 2015 08:24:59 +0800
Message-ID: <1430180699-12063-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH] subversion: remove 1.6.X recipes
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
X-List-Received-Date: Tue, 28 Apr 2015 00:25:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Roy Li <rongqing.li@windriver.com>

Removing the 1.6.X recipes, since there is a new version 1.8.X recipes,
and hope that all projects already upgraded their premirror caches to
use new format

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../subversion/disable-revision-install.patch      |  36 --
 .../subversion/fix-install-depends.patch           |  45 ---
 .../subversion/subversion/libtool2.patch           |  17 -
 .../subversion/subversion-CVE-2013-1845.patch      | 171 --------
 .../subversion-CVE-2013-1847-CVE-2013-1846.patch   |  53 ---
 .../subversion/subversion-CVE-2013-1849.patch      |  25 --
 .../subversion/subversion-CVE-2013-4277.patch      |  15 -
 .../subversion/subversion-CVE-2013-4505.patch      | 127 ------
 .../subversion/subversion-CVE-2014-3522.patch      | 439 ---------------------
 .../subversion/subversion-CVE-2014-3528.patch      |  29 --
 .../subversion/subversion_1.6.15.bb                |  48 ---
 11 files changed, 1005 deletions(-)
 delete mode 100644 meta/recipes-devtools/subversion/subversion/disable-revision-install.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion/fix-install-depends.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion/libtool2.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-1845.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-1847-CVE-2013-1846.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-1849.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-4277.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-4505.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion/subversion-CVE-2014-3522.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion/subversion-CVE-2014-3528.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion_1.6.15.bb

diff --git a/meta/recipes-devtools/subversion/subversion/disable-revision-install.patch b/meta/recipes-devtools/subversion/subversion/disable-revision-install.patch
deleted file mode 100644
index 66450fa..0000000
--- a/meta/recipes-devtools/subversion/subversion/disable-revision-install.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-Index: subversion-1.6.15/Makefile.in
-===================================================================
---- subversion-1.6.15.orig/Makefile.in	2010-11-17 06:47:23.000000000 -0800
-+++ subversion-1.6.15/Makefile.in	2011-01-31 10:11:07.358779686 -0800
-@@ -305,7 +305,7 @@
- clean: external-clean local-clean
- distclean: external-distclean local-distclean
- extraclean: external-extraclean local-extraclean
--install: external-install local-install revision-install
-+install: external-install local-install #revision-install
- 
- @INCLUDE_OUTPUTS@
- 
-@@ -363,13 +363,13 @@
- local-install: @INSTALL_RULES@
- 
- ### HACK!! Find a better way to do this
--revision-install:
--	test -d $(DESTDIR)$(includedir)/subversion-1 || \
--	  $(MKDIR) $(DESTDIR)$(includedir)/subversion-1
--	(subversion/svnversion/svnversion $(top_srcdir) ||  \
--	 svnversion $(top_srcdir) ||                        \
--	 echo "unknown";                                    \
--	) > $(DESTDIR)$(includedir)/subversion-1/svn-revision.txt
-+#revision-install:
-+#	test -d $(DESTDIR)$(includedir)/subversion-1 || \
-+#	  $(MKDIR) $(DESTDIR)$(includedir)/subversion-1
-+#	(subversion/svnversion/svnversion $(top_srcdir) ||  \
-+#	 svnversion $(top_srcdir) ||                        \
-+#	 echo "unknown";                                    \
-+#	) > $(DESTDIR)$(includedir)/subversion-1/svn-revision.txt
- 
- install-static: @INSTALL_STATIC_RULES@
- 
diff --git a/meta/recipes-devtools/subversion/subversion/fix-install-depends.patch b/meta/recipes-devtools/subversion/subversion/fix-install-depends.patch
deleted file mode 100644
index 6f49ed4..0000000
--- a/meta/recipes-devtools/subversion/subversion/fix-install-depends.patch
+++ /dev/null
@@ -1,45 +0,0 @@
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
-diff --git a/build-outputs.mk b/build-outputs.mk
---- a/build-outputs.mk
-+++ b/build-outputs.mk
-@@ -979,7 +979,7 @@ install-locale: subversion/po/de.mo subversion/po/es.mo subversion/po/fr.mo subv
- 	$(MKDIR) $(DESTDIR)$(localedir)/zh_TW/LC_MESSAGES
- 	cd subversion/po ; $(INSTALL_LOCALE) zh_TW.mo $(DESTDIR)$(localedir)/zh_TW/LC_MESSAGES/$(PACKAGE_NAME).mo
- 
--install-neon-lib: subversion/libsvn_ra_neon/libsvn_ra_neon-1.la
-+install-neon-lib: subversion/libsvn_ra_neon/libsvn_ra_neon-1.la $(SVN_FS_LIB_INSTALL_DEPS)
- 	$(MKDIR) $(DESTDIR)$(neon_libdir)
- 	cd subversion/libsvn_ra_neon ; $(INSTALL_NEON_LIB) libsvn_ra_neon-1.la $(DESTDIR)$(neon_libdir)/libsvn_ra_neon-1.la
- 
-diff --git a/build.conf b/build.conf
---- a/build.conf
-+++ b/build.conf
-@@ -272,6 +272,8 @@ type = ra-module
- path = subversion/libsvn_ra_neon
- install = neon-lib
- libs = libsvn_delta libsvn_subr aprutil apriconv apr neon
-+# conditionally add more dependencies
-+add-install-deps = $(SVN_FS_LIB_INSTALL_DEPS)
- msvc-static = yes
- 
- # Accessing repositories via DAV through serf
--- 
-1.7.10.4
-
diff --git a/meta/recipes-devtools/subversion/subversion/libtool2.patch b/meta/recipes-devtools/subversion/subversion/libtool2.patch
deleted file mode 100644
index 32f88b7..0000000
--- a/meta/recipes-devtools/subversion/subversion/libtool2.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Inappropriate [embedded specific]
-
-Index: subversion-1.5.5/configure.ac
-===================================================================
---- subversion-1.5.5.orig/configure.ac	2008-08-26 18:27:56.000000000 +0100
-+++ subversion-1.5.5/configure.ac	2009-01-07 18:00:47.000000000 +0000
-@@ -153,8 +153,8 @@
-   LIBTOOL="$sh_libtool"
-   SVN_LIBTOOL="$sh_libtool"
- else
--  sh_libtool="$abs_builddir/libtool"
--  SVN_LIBTOOL="\$(SHELL) $sh_libtool"
-+  sh_libtool="$abs_builddir/$host_alias-libtool"
-+  SVN_LIBTOOL="\$(SHELL) \$(abs_builddir)/$host_alias-libtool"
-   dnl libtoolize requires that the following line not be indented
- ifdef([LT_INIT], [LT_INIT], [AC_PROG_LIBTOOL])
- fi
diff --git a/meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-1845.patch b/meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-1845.patch
deleted file mode 100644
index 29aeea5..0000000
--- a/meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-1845.patch
+++ /dev/null
@@ -1,171 +0,0 @@
-Upstream-Status: Backport
-
-Index: subversion/mod_dav_svn/dav_svn.h
-===================================================================
---- a/subversion/mod_dav_svn/dav_svn.h	(revision 1461956)
-+++ b/subversion/mod_dav_svn/dav_svn.h	(working copy)
-@@ -254,6 +254,9 @@ struct dav_resource_private {
-      interface (ie: /path/to/item?p=PEGREV]? */
-   svn_boolean_t pegged;
- 
-+  /* Cache any revprop change error */
-+  svn_error_t *revprop_error;
-+
-   /* Pool to allocate temporary data from */
-   apr_pool_t *pool;
- };
-Index: subversion/mod_dav_svn/deadprops.c
-===================================================================
---- a/subversion/mod_dav_svn/deadprops.c	(revision 1461956)
-+++ b/subversion/mod_dav_svn/deadprops.c	(working copy)
-@@ -49,8 +49,7 @@ struct dav_db {
- 
- 
- struct dav_deadprop_rollback {
--  dav_prop_name name;
--  svn_string_t value;
-+  int dummy;
- };
- 
- 
-@@ -134,6 +133,7 @@ save_value(dav_db *db, const dav_prop_name *name,
- {
-   const char *propname;
-   svn_error_t *serr;
-+  apr_pool_t *subpool;
- 
-   /* get the repos-local name */
-   get_repos_propname(db, name, &propname);
-@@ -151,10 +151,14 @@ save_value(dav_db *db, const dav_prop_name *name,
-     }
- 
-   /* Working Baseline or Working (Version) Resource */
-+
-+  /* A subpool to cope with mod_dav making multiple calls, e.g. during
-+     PROPPATCH with multiple values. */
-+  subpool = svn_pool_create(db->resource->pool);
-   if (db->resource->baselined)
-     if (db->resource->working)
-       serr = svn_repos_fs_change_txn_prop(db->resource->info->root.txn,
--                                          propname, value, db->resource->pool);
-+                                          propname, value, subpool);
-     else
-       {
-         /* ### VIOLATING deltaV: you can't proppatch a baseline, it's
-@@ -168,19 +172,29 @@ save_value(dav_db *db, const dav_prop_name *name,
-            propname, value, TRUE, TRUE,
-            db->authz_read_func,
-            db->authz_read_baton,
--           db->resource->pool);
-+           subpool);
- 
-+        /* mod_dav doesn't handle the returned error very well, it
-+           generates its own generic error that will be returned to
-+           the client.  Cache the detailed error here so that it can
-+           be returned a second time when the rollback mechanism
-+           triggers. */
-+        if (serr)
-+          db->resource->info->revprop_error = svn_error_dup(serr);
-+
-         /* Tell the logging subsystem about the revprop change. */
-         dav_svn__operational_log(db->resource->info,
-                                  svn_log__change_rev_prop(
-                                               db->resource->info->root.rev,
-                                               propname,
--                                              db->resource->pool));
-+                                              subpool));
-       }
-   else
-     serr = svn_repos_fs_change_node_prop(db->resource->info->root.root,
-                                          get_repos_path(db->resource->info),
--                                         propname, value, db->resource->pool);
-+                                         propname, value, subpool);
-+  svn_pool_destroy(subpool);
-+
-   if (serr != NULL)
-     return dav_svn__convert_err(serr, HTTP_INTERNAL_SERVER_ERROR,
-                                 NULL,
-@@ -395,6 +409,7 @@ db_remove(dav_db *db, const dav_prop_name *name)
- {
-   svn_error_t *serr;
-   const char *propname;
-+  apr_pool_t *subpool;
- 
-   /* get the repos-local name */
-   get_repos_propname(db, name, &propname);
-@@ -403,6 +418,10 @@ db_remove(dav_db *db, const dav_prop_name *name)
-   if (propname == NULL)
-     return NULL;
- 
-+  /* A subpool to cope with mod_dav making multiple calls, e.g. during
-+     PROPPATCH with multiple values. */
-+  subpool = svn_pool_create(db->resource->pool);
-+
-   /* Working Baseline or Working (Version) Resource */
-   if (db->resource->baselined)
-     if (db->resource->working)
-@@ -419,11 +438,12 @@ db_remove(dav_db *db, const dav_prop_name *name)
-                                            propname, NULL, TRUE, TRUE,
-                                            db->authz_read_func,
-                                            db->authz_read_baton,
--                                           db->resource->pool);
-+                                           subpool);
-   else
-     serr = svn_repos_fs_change_node_prop(db->resource->info->root.root,
-                                          get_repos_path(db->resource->info),
--                                         propname, NULL, db->resource->pool);
-+                                         propname, NULL, subpool);
-+  svn_pool_destroy(subpool);
-   if (serr != NULL)
-     return dav_svn__convert_err(serr, HTTP_INTERNAL_SERVER_ERROR,
-                                 "could not remove a property",
-@@ -598,19 +618,14 @@ db_get_rollback(dav_db *db,
-                 const dav_prop_name *name,
-                 dav_deadprop_rollback **prollback)
- {
--  dav_error *err;
--  dav_deadprop_rollback *ddp;
--  svn_string_t *propval;
-+  /* This gets called by mod_dav in preparation for a revprop change.
-+     mod_dav_svn doesn't need to make any changes during rollback, but
-+     we want the rollback mechanism to trigger.  Making changes in
-+     response to post-revprop-change hook errors would be positively
-+     wrong. */
- 
--  if ((err = get_value(db, name, &propval)) != NULL)
--    return err;
-+  *prollback = apr_palloc(db->p, sizeof(dav_deadprop_rollback));
- 
--  ddp = apr_palloc(db->p, sizeof(*ddp));
--  ddp->name = *name;
--  ddp->value.data = propval ? propval->data : NULL;
--  ddp->value.len = propval ? propval->len : 0;
--
--  *prollback = ddp;
-   return NULL;
- }
- 
-@@ -618,12 +633,20 @@ db_get_rollback(dav_db *db,
- static dav_error *
- db_apply_rollback(dav_db *db, dav_deadprop_rollback *rollback)
- {
--  if (rollback->value.data == NULL)
--    {
--      return db_remove(db, &rollback->name);
--    }
-+  dav_error *derr;
- 
--  return save_value(db, &rollback->name, &rollback->value);
-+  if (! db->resource->info->revprop_error)
-+    return NULL;
-+  
-+  /* Returning the original revprop change error here will cause this
-+     detailed error to get returned to the client in preference to the
-+     more generic error created by mod_dav. */
-+  derr = dav_svn__convert_err(db->resource->info->revprop_error,
-+                              HTTP_INTERNAL_SERVER_ERROR, NULL,
-+                              db->resource->pool);
-+  db->resource->info->revprop_error = NULL;
-+
-+  return derr;
- }
diff --git a/meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-1847-CVE-2013-1846.patch b/meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-1847-CVE-2013-1846.patch
deleted file mode 100644
index f49b9a4..0000000
--- a/meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-1847-CVE-2013-1846.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-Upstream-Status: Backport
-
-Index: subversion/mod_dav_svn/lock.c
-===================================================================
---- a/subversion/mod_dav_svn/lock.c	(revision 1459696)
-+++ b/subversion/mod_dav_svn/lock.c	(working copy)
-@@ -634,7 +634,20 @@ append_locks(dav_lockdb *lockdb,
-   svn_lock_t *slock;
-   svn_error_t *serr;
-   dav_error *derr;
-+  dav_svn_repos *repos = resource->info->repos;
-+      
-+  /* We don't allow anonymous locks */
-+  if (! repos->username)
-+    return dav_new_error(resource->pool, HTTP_UNAUTHORIZED,
-+                         DAV_ERR_LOCK_SAVE_LOCK,
-+                         "Anonymous lock creation is not allowed.");
- 
-+  /* Not a path in the repository so can't lock it. */
-+  if (! resource->info->repos_path)
-+    return dav_new_error(resource->pool, HTTP_BAD_REQUEST,
-+                         DAV_ERR_LOCK_SAVE_LOCK,
-+                         "Attempted to lock path not in repository.");
-+
-   /* If the resource's fs path is unreadable, we don't allow a lock to
-      be created on it. */
-   if (! dav_svn__allow_read_resource(resource, SVN_INVALID_REVNUM,
-@@ -657,7 +670,6 @@ append_locks(dav_lockdb *lockdb,
-       svn_fs_txn_t *txn;
-       svn_fs_root_t *txn_root;
-       const char *conflict_msg;
--      dav_svn_repos *repos = resource->info->repos;
-       apr_hash_t *revprop_table = apr_hash_make(resource->pool);
-       apr_hash_set(revprop_table, SVN_PROP_REVISION_AUTHOR,
-                    APR_HASH_KEY_STRING, svn_string_create(repos->username,
-@@ -734,7 +746,7 @@ append_locks(dav_lockdb *lockdb,
- 
-   /* Convert the dav_lock into an svn_lock_t. */
-   derr = dav_lock_to_svn_lock(&slock, lock, resource->info->repos_path,
--                              info, resource->info->repos->is_svn_client,
-+                              info, repos->is_svn_client,
-                               resource->pool);
-   if (derr)
-     return derr;
-@@ -741,7 +753,7 @@ append_locks(dav_lockdb *lockdb,
- 
-   /* Now use the svn_lock_t to actually perform the lock. */
-   serr = svn_repos_fs_lock(&slock,
--                           resource->info->repos->repos,
-+                           repos->repos,
-                            slock->path,
-                            slock->token,
-                            slock->comment,
diff --git a/meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-1849.patch b/meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-1849.patch
deleted file mode 100644
index 734f9b0..0000000
--- a/meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-1849.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Upstream-Status: Backport
-
---- a/subversion/mod_dav_svn/liveprops.c
-+++ b/subversion/mod_dav_svn/liveprops.c
-@@ -410,7 +410,8 @@ insert_prop(const dav_resource *resource
-         svn_filesize_t len = 0;
- 
-         /* our property, but not defined on collection resources */
--        if (resource->collection || resource->baselined)
-+        if (resource->type == DAV_RESOURCE_TYPE_ACTIVITY
-+            || resource->collection || resource->baselined)
-           return DAV_PROP_INSERT_NOTSUPP;
- 
-         serr = svn_fs_file_length(&len, resource->info->root.root,
-@@ -434,7 +435,9 @@ insert_prop(const dav_resource *resource
-         svn_string_t *pval;
-         const char *mime_type = NULL;
- 
--        if (resource->baselined && resource->type == DAV_RESOURCE_TYPE_VERSION)
-+        if (resource->type == DAV_RESOURCE_TYPE_ACTIVITY
-+            || (resource->baselined
-+                && resource->type == DAV_RESOURCE_TYPE_VERSION))
-           return DAV_PROP_INSERT_NOTSUPP;
- 
-         if (resource->type == DAV_RESOURCE_TYPE_PRIVATE
diff --git a/meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-4277.patch b/meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-4277.patch
deleted file mode 100644
index 21b8ef0..0000000
--- a/meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-4277.patch
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
-+  SVN_ERR(svn_io_remove_file(filename, pool));
-   SVN_ERR(svn_io_file_open(&file, filename,
--                           APR_WRITE | APR_CREATE | APR_TRUNCATE,
-+                           APR_WRITE | APR_CREATE | APR_EXCL,
-                            APR_OS_DEFAULT, pool));
-   SVN_ERR(svn_io_file_write_full(file, contents, strlen(contents), NULL,
-                                  pool));
diff --git a/meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-4505.patch b/meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-4505.patch
deleted file mode 100644
index 7d73a6b..0000000
--- a/meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-4505.patch
+++ /dev/null
@@ -1,127 +0,0 @@
-Upstream-Status: Backport
-
---- ./contrib/server-side/mod_dontdothat/mod_dontdothat.c.old	2014-04-15 10:18:54.692655905 +0800
-+++ ./contrib/server-side/mod_dontdothat/mod_dontdothat.c	2014-04-15 10:29:55.559603676 +0800
-@@ -25,12 +25,15 @@
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
-@@ -156,26 +159,71 @@ matches(const char *wc, const char *p)
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
-@@ -189,7 +237,7 @@ is_this_legal(dontdothat_filter_ctx *ctx
-           if (! repos_path)
-             repos_path = "";
- 
--          repos_path = apr_psprintf(ctx->r->pool, "/%s", repos_path);
-+          repos_path = svn_fspath__canonicalize(repos_path, ctx->r->pool);
- 
-           /* First check the special cases that are always legal... */
-           for (idx = 0; idx < ctx->allow_recursive_ops->nelts; ++idx)
-@@ -223,6 +271,19 @@ is_this_legal(dontdothat_filter_ctx *ctx
-                 }
-             }
-         }
-+      else
-+        {
-+          log_dav_err(ctx->r, derr, APLOG_ERR);
-+          return FALSE;
-+        }
-+
-+    }
-+  else
-+    {
-+      ap_log_rerror(APLOG_MARK, APLOG_ERR, 0, ctx->r,
-+                    "mod_dontdothat: empty uri passed to is_this_legal(), "
-+                    "module bug?");
-+      return FALSE;
-     }
- 
-   return TRUE;
diff --git a/meta/recipes-devtools/subversion/subversion/subversion-CVE-2014-3522.patch b/meta/recipes-devtools/subversion/subversion/subversion-CVE-2014-3522.patch
deleted file mode 100644
index 03d5b97..0000000
--- a/meta/recipes-devtools/subversion/subversion/subversion-CVE-2014-3522.patch
+++ /dev/null
@@ -1,439 +0,0 @@
-Upstream-Status: Backport
-
-Signed-off-by: Yue Tao <yue.tao@windriver.com>
-
-diff --git a/subversion/libsvn_ra_serf/util.c.old b/subversion/libsvn_ra_serf/util.c
-index b6c0141..8b09770 100644
---- a/subversion/libsvn_ra_serf/util.c.old
-+++ b/subversion/libsvn_ra_serf/util.c
-@@ -21,7 +21,6 @@
- #define APR_WANT_STRFUNC
- #include <apr.h>
- #include <apr_want.h>
--#include <apr_fnmatch.h>
- 
- #include <serf.h>
- #include <serf_bucket_types.h>
-@@ -30,6 +29,7 @@
- #include "svn_private_config.h"
- #include "svn_xml.h"
- #include "private/svn_dep_compat.h"
-+#include "private/svn_cert.h"
- 
- #include "ra_serf.h"
- 
-@@ -113,7 +113,12 @@ ssl_server_cert(void *baton, int failures,
-   apr_uint32_t svn_failures;
-   svn_error_t *err;
-   apr_hash_t *issuer, *subject, *serf_cert;
-+  apr_array_header_t *san;
-   void *creds;
-+  svn_boolean_t found_matching_hostname = FALSE;
-+  svn_boolean_t found_san_entry = FALSE;
-+  svn_string_t *actual_hostname =
-+      svn_string_create(conn->hostname, scratch_pool);
- 
-   /* Implicitly approve any non-server certs. */
-   if (serf_ssl_cert_depth(cert) > 0)
-@@ -129,6 +134,7 @@ ssl_server_cert(void *baton, int failures,
-   serf_cert = serf_ssl_cert_certificate(cert, subpool);
- 
-   cert_info.hostname = apr_hash_get(subject, "CN", APR_HASH_KEY_STRING);
-+  san = apr_hash_get(serf_cert, "subjectAltName", APR_HASH_KEY_STRING);
-   cert_info.fingerprint = apr_hash_get(serf_cert, "sha1", APR_HASH_KEY_STRING);
-   if (! cert_info.fingerprint)
-     cert_info.fingerprint = apr_pstrdup(subpool, "<unknown>");
-@@ -145,16 +145,43 @@ ssl_server_cert(void *baton, int failures,
- 
-   svn_failures = ssl_convert_serf_failures(failures);
- 
--  /* Match server certificate CN with the hostname of the server */
--  if (cert_info.hostname)
-+  /* Try to find matching server name via subjectAltName first... */
-+  if (san)
-     {
--      if (apr_fnmatch(cert_info.hostname, conn->hostinfo,
--                      APR_FNM_PERIOD) == APR_FNM_NOMATCH)
-+      int i;
-+      found_san_entry = san->nelts > 0;
-+      for (i = 0; i < san->nelts; i++)
-         {
--          svn_failures |= SVN_AUTH_SSL_CNMISMATCH;
-+          char *s = APR_ARRAY_IDX(san, i, char*);
-+          svn_string_t *cert_hostname = svn_string_create(s, scratch_pool);
-+
-+          if (svn_cert__match_dns_identity(cert_hostname, actual_hostname))
-+             {
-+              found_matching_hostname = TRUE;
-+              cert_info.hostname = s;
-+              break;
-+            }
-         }
-     }
- 
-+  /* Match server certificate CN with the hostname of the server iff
-+   * we didn't find any subjectAltName fields and try to match them.
-+   * Per RFC 2818 they are authoritative if present and CommonName
-+   * should be ignored. */
-+  if (!found_matching_hostname && !found_san_entry && cert_info.hostname)
-+    {
-+      svn_string_t *cert_hostname = svn_string_create(cert_info.hostname,
-+                                                      scratch_pool);
-+
-+      if (svn_cert__match_dns_identity(cert_hostname, actual_hostname))
-+        {
-+          found_matching_hostname = TRUE;
-+        }
-+    }
-+
-+  if (!found_matching_hostname)
-+    svn_failures |= SVN_AUTH_SSL_CNMISMATCH;
-+
-   svn_auth_set_parameter(conn->session->wc_callbacks->auth_baton,
-                          SVN_AUTH_PARAM_SSL_SERVER_FAILURES,
-                          &svn_failures);
-@@ -261,6 +293,10 @@ svn_ra_serf__conn_setup(apr_socket_t *sock,
-       if (!conn->ssl_context)
-         {
-           conn->ssl_context = serf_bucket_ssl_encrypt_context_get(rb);
-+
-+#if SERF_VERSION_AT_LEAST(1,0,0)
-+          serf_ssl_set_hostname(conn->ssl_context, conn->hostinfo);
-+#endif
-   
-           serf_ssl_client_cert_provider_set(conn->ssl_context,
-                                             svn_ra_serf__handle_client_cert,
-diff --git a/subversion/libsvn_subr/dirent_uri.c.old b/subversion/libsvn_subr/dirent_uri.c
-index eef99ba..a5f9e7e 100644
---- a/subversion/libsvn_subr/dirent_uri.c.old
-+++ b/subversion/libsvn_subr/dirent_uri.c
-@@ -30,6 +30,7 @@
- #include "svn_path.h"
- 
- #include "private_uri.h"
-+#include "private/svn_cert.h"
- 
- /* The canonical empty path.  Can this be changed?  Well, change the empty
-    test below and the path library will work, not so sure about the fs/wc
-@@ -1194,3 +1195,81 @@ svn_uri_is_canonical(const char *uri, apr_pool_t *pool)
- 
-   return TRUE;
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
-diff --git a/subversion/tests/libsvn_subr/dirent_uri-test.c.old b/subversion/tests/libsvn_subr/dirent_uri-test.c
-index d71d9c1..370b64a 100644
---- a/subversion/tests/libsvn_subr/dirent_uri-test.c.old
-+++ b/subversion/tests/libsvn_subr/dirent_uri-test.c
-@@ -31,6 +31,7 @@
- 
- #include "svn_pools.h"
- #include "svn_dirent_uri.h"
-+#include "private/svn_cert.h"
- 
- #include "../svn_test.h"
- #include "../../libsvn_subr/private_uri.h"
-@@ -1671,6 +1672,145 @@ test_uri_internal_style(const char **msg,
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
-@@ -1699,5 +1839,7 @@ struct svn_test_descriptor_t test_funcs[] =
-     SVN_TEST_PASS(test_uri_local_style),
-     SVN_TEST_PASS(test_dirent_internal_style),
-     SVN_TEST_PASS(test_uri_internal_style),
-+    SVN_TEST_PASS(test_cert_match_dns_identity),
-+    SVN_TEST_XFAIL(test_rule3),
-     SVN_TEST_NULL
-   };
-diff --git a/subversion/include/private/svn_cert.h b/subversion/include/private/svn_cert.h
-new file mode 100644
-index 0000000..32e32a0
---- /dev/null
-+++ b/subversion/include/private/svn_cert.h
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
-+ * in the left-most label (i.e. we support RFC 6125 § 6.4.3
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
diff --git a/meta/recipes-devtools/subversion/subversion/subversion-CVE-2014-3528.patch b/meta/recipes-devtools/subversion/subversion/subversion-CVE-2014-3528.patch
deleted file mode 100644
index 23e738e..0000000
--- a/meta/recipes-devtools/subversion/subversion/subversion-CVE-2014-3528.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Upstream-Status: Backport
-
-Signed-off-by: Yue Tao <yue.tao@windriver.com>
-
-diff --git a/subversion/libsvn_subr/config_auth.c.old b/subversion/libsvn_subr/config_auth.c
-index ff50270..c511d04 100644
---- a/subversion/libsvn_subr/config_auth.c.old
-+++ b/subversion/libsvn_subr/config_auth.c
-@@ -85,6 +85,7 @@ svn_config_read_auth_data(apr_hash_t **hash,
-   if (kind == svn_node_file)
-     {
-       svn_stream_t *stream;
-+      svn_string_t *stored_realm;
- 
-       SVN_ERR_W(svn_stream_open_readonly(&stream, auth_path, pool, pool),
-                 _("Unable to open auth file for reading"));
-@@ -95,6 +96,12 @@ svn_config_read_auth_data(apr_hash_t **hash,
-                 apr_psprintf(pool, _("Error parsing '%s'"),
-                              svn_path_local_style(auth_path, pool)));
- 
-+      stored_realm = apr_hash_get(*hash, SVN_CONFIG_REALMSTRING_KEY,
-+                                  APR_HASH_KEY_STRING);
-+
-+      if (!stored_realm || strcmp(stored_realm->data, realmstring) != 0)
-+        *hash = NULL; /* Hash collision, or somebody tampering with storage */
-+
-       SVN_ERR(svn_stream_close(stream));
-     }
- 
diff --git a/meta/recipes-devtools/subversion/subversion_1.6.15.bb b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
deleted file mode 100644
index 28163e5..0000000
--- a/meta/recipes-devtools/subversion/subversion_1.6.15.bb
+++ /dev/null
@@ -1,48 +0,0 @@
-SUMMARY = "Subversion (svn) version control system client"
-SECTION = "console/network"
-DEPENDS = "apr-util neon sqlite3"
-RDEPENDS_${PN} = "neon"
-LICENSE = "Apache-2"
-HOMEPAGE = "http://subversion.tigris.org"
-
-BBCLASSEXTEND = "native"
-
-PR = "r3"
-
-SRC_URI = "http://subversion.tigris.org/downloads/${BPN}-${PV}.tar.bz2 \
-           file://disable-revision-install.patch \
-           file://libtool2.patch \
-           file://fix-install-depends.patch \
-           file://subversion-CVE-2013-1849.patch \
-           file://subversion-CVE-2013-4505.patch \
-           file://subversion-CVE-2013-1845.patch \
-           file://subversion-CVE-2013-1847-CVE-2013-1846.patch \
-           file://subversion-CVE-2013-4277.patch \
-           file://subversion-CVE-2014-3522.patch \
-           file://subversion-CVE-2014-3528.patch \
-"
-
-SRC_URI[md5sum] = "113fca1d9e4aa389d7dc2b210010fa69"
-SRC_URI[sha256sum] = "b2919d603a5f3c19f42e3265c4b930e2376c43b3969b90ef9c42b2f72d5aaa45"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=2a69fef414e2cb907b4544298569300b"
-
-PACKAGECONFIG[sasl] = "--with-sasl,--without-sasl,cyrus-sasl"
-
-EXTRA_OECONF = " \
-                --without-berkeley-db --without-apxs \
-                --without-swig --with-apr=${STAGING_BINDIR_CROSS} \
-                --with-apr-util=${STAGING_BINDIR_CROSS} \
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
-	rm -f ${S}/build/libtool.m4
-	sed -i -e 's:with_sasl="/usr/local":with_sasl="${STAGING_DIR}":' ${S}/build/ac-macros/sasl.m4
-}
-- 
2.1.0


