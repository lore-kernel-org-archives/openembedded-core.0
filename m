Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 193D265FE5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 05:27:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4J5RVJ5026424
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 May 2014 22:27:31 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Sun, 18 May 2014 22:27:30 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 May 2014 13:27:21 +0800
Message-ID: <8b19ddf473a323efa673e58254d09ceec1175ce2.1400476449.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1400476449.git.rongqing.li@windriver.com>
References: <cover.1400476449.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/6] subversion: fix for Security Advisory CVE-2013-1845
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
X-List-Received-Date: Mon, 19 May 2014 05:27:30 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

The mod_dav_svn Apache HTTPD server module in Subversion 1.6.x before
1.6.21 and 1.7.0 through 1.7.8 allows remote authenticated users to
cause a denial of service (memory consumption) by (1) setting or (2)
deleting a large number of properties for a file or directory.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-1845

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../subversion/subversion-CVE-2013-1845.patch      |  171 ++++++++++++++++++++
 .../subversion/subversion_1.6.15.bb                |    3 +-
 2 files changed, 173 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-1845.patch

diff --git a/meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-1845.patch b/meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-1845.patch
new file mode 100644
index 0000000..29aeea5
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-1845.patch
@@ -0,0 +1,171 @@
+Upstream-Status: Backport
+
+Index: subversion/mod_dav_svn/dav_svn.h
+===================================================================
+--- a/subversion/mod_dav_svn/dav_svn.h	(revision 1461956)
++++ b/subversion/mod_dav_svn/dav_svn.h	(working copy)
+@@ -254,6 +254,9 @@ struct dav_resource_private {
+      interface (ie: /path/to/item?p=PEGREV]? */
+   svn_boolean_t pegged;
+ 
++  /* Cache any revprop change error */
++  svn_error_t *revprop_error;
++
+   /* Pool to allocate temporary data from */
+   apr_pool_t *pool;
+ };
+Index: subversion/mod_dav_svn/deadprops.c
+===================================================================
+--- a/subversion/mod_dav_svn/deadprops.c	(revision 1461956)
++++ b/subversion/mod_dav_svn/deadprops.c	(working copy)
+@@ -49,8 +49,7 @@ struct dav_db {
+ 
+ 
+ struct dav_deadprop_rollback {
+-  dav_prop_name name;
+-  svn_string_t value;
++  int dummy;
+ };
+ 
+ 
+@@ -134,6 +133,7 @@ save_value(dav_db *db, const dav_prop_name *name,
+ {
+   const char *propname;
+   svn_error_t *serr;
++  apr_pool_t *subpool;
+ 
+   /* get the repos-local name */
+   get_repos_propname(db, name, &propname);
+@@ -151,10 +151,14 @@ save_value(dav_db *db, const dav_prop_name *name,
+     }
+ 
+   /* Working Baseline or Working (Version) Resource */
++
++  /* A subpool to cope with mod_dav making multiple calls, e.g. during
++     PROPPATCH with multiple values. */
++  subpool = svn_pool_create(db->resource->pool);
+   if (db->resource->baselined)
+     if (db->resource->working)
+       serr = svn_repos_fs_change_txn_prop(db->resource->info->root.txn,
+-                                          propname, value, db->resource->pool);
++                                          propname, value, subpool);
+     else
+       {
+         /* ### VIOLATING deltaV: you can't proppatch a baseline, it's
+@@ -168,19 +172,29 @@ save_value(dav_db *db, const dav_prop_name *name,
+            propname, value, TRUE, TRUE,
+            db->authz_read_func,
+            db->authz_read_baton,
+-           db->resource->pool);
++           subpool);
+ 
++        /* mod_dav doesn't handle the returned error very well, it
++           generates its own generic error that will be returned to
++           the client.  Cache the detailed error here so that it can
++           be returned a second time when the rollback mechanism
++           triggers. */
++        if (serr)
++          db->resource->info->revprop_error = svn_error_dup(serr);
++
+         /* Tell the logging subsystem about the revprop change. */
+         dav_svn__operational_log(db->resource->info,
+                                  svn_log__change_rev_prop(
+                                               db->resource->info->root.rev,
+                                               propname,
+-                                              db->resource->pool));
++                                              subpool));
+       }
+   else
+     serr = svn_repos_fs_change_node_prop(db->resource->info->root.root,
+                                          get_repos_path(db->resource->info),
+-                                         propname, value, db->resource->pool);
++                                         propname, value, subpool);
++  svn_pool_destroy(subpool);
++
+   if (serr != NULL)
+     return dav_svn__convert_err(serr, HTTP_INTERNAL_SERVER_ERROR,
+                                 NULL,
+@@ -395,6 +409,7 @@ db_remove(dav_db *db, const dav_prop_name *name)
+ {
+   svn_error_t *serr;
+   const char *propname;
++  apr_pool_t *subpool;
+ 
+   /* get the repos-local name */
+   get_repos_propname(db, name, &propname);
+@@ -403,6 +418,10 @@ db_remove(dav_db *db, const dav_prop_name *name)
+   if (propname == NULL)
+     return NULL;
+ 
++  /* A subpool to cope with mod_dav making multiple calls, e.g. during
++     PROPPATCH with multiple values. */
++  subpool = svn_pool_create(db->resource->pool);
++
+   /* Working Baseline or Working (Version) Resource */
+   if (db->resource->baselined)
+     if (db->resource->working)
+@@ -419,11 +438,12 @@ db_remove(dav_db *db, const dav_prop_name *name)
+                                            propname, NULL, TRUE, TRUE,
+                                            db->authz_read_func,
+                                            db->authz_read_baton,
+-                                           db->resource->pool);
++                                           subpool);
+   else
+     serr = svn_repos_fs_change_node_prop(db->resource->info->root.root,
+                                          get_repos_path(db->resource->info),
+-                                         propname, NULL, db->resource->pool);
++                                         propname, NULL, subpool);
++  svn_pool_destroy(subpool);
+   if (serr != NULL)
+     return dav_svn__convert_err(serr, HTTP_INTERNAL_SERVER_ERROR,
+                                 "could not remove a property",
+@@ -598,19 +618,14 @@ db_get_rollback(dav_db *db,
+                 const dav_prop_name *name,
+                 dav_deadprop_rollback **prollback)
+ {
+-  dav_error *err;
+-  dav_deadprop_rollback *ddp;
+-  svn_string_t *propval;
++  /* This gets called by mod_dav in preparation for a revprop change.
++     mod_dav_svn doesn't need to make any changes during rollback, but
++     we want the rollback mechanism to trigger.  Making changes in
++     response to post-revprop-change hook errors would be positively
++     wrong. */
+ 
+-  if ((err = get_value(db, name, &propval)) != NULL)
+-    return err;
++  *prollback = apr_palloc(db->p, sizeof(dav_deadprop_rollback));
+ 
+-  ddp = apr_palloc(db->p, sizeof(*ddp));
+-  ddp->name = *name;
+-  ddp->value.data = propval ? propval->data : NULL;
+-  ddp->value.len = propval ? propval->len : 0;
+-
+-  *prollback = ddp;
+   return NULL;
+ }
+ 
+@@ -618,12 +633,20 @@ db_get_rollback(dav_db *db,
+ static dav_error *
+ db_apply_rollback(dav_db *db, dav_deadprop_rollback *rollback)
+ {
+-  if (rollback->value.data == NULL)
+-    {
+-      return db_remove(db, &rollback->name);
+-    }
++  dav_error *derr;
+ 
+-  return save_value(db, &rollback->name, &rollback->value);
++  if (! db->resource->info->revprop_error)
++    return NULL;
++  
++  /* Returning the original revprop change error here will cause this
++     detailed error to get returned to the client in preference to the
++     more generic error created by mod_dav. */
++  derr = dav_svn__convert_err(db->resource->info->revprop_error,
++                              HTTP_INTERNAL_SERVER_ERROR, NULL,
++                              db->resource->pool);
++  db->resource->info->revprop_error = NULL;
++
++  return derr;
+ }
diff --git a/meta/recipes-devtools/subversion/subversion_1.6.15.bb b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
index cb36276..11bf5ee 100644
--- a/meta/recipes-devtools/subversion/subversion_1.6.15.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
@@ -14,7 +14,8 @@ SRC_URI = "http://subversion.tigris.org/downloads/${BPN}-${PV}.tar.bz2 \
            file://libtool2.patch \
            file://fix-install-depends.patch \
            file://subversion-CVE-2013-1849.patch \
-           file://subversion-CVE-2013-4505.patch"
+           file://subversion-CVE-2013-4505.patch \
+           file://subversion-CVE-2013-1845.patch"
 
 SRC_URI[md5sum] = "113fca1d9e4aa389d7dc2b210010fa69"
 SRC_URI[sha256sum] = "b2919d603a5f3c19f42e3265c4b930e2376c43b3969b90ef9c42b2f72d5aaa45"
-- 
1.7.10.4


