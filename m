Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 540916609A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 05:27:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4J5RW89004037
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 May 2014 22:27:32 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Sun, 18 May 2014 22:27:32 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 May 2014 13:27:22 +0800
Message-ID: <8eefa56c70713e772ed2bc42e421c0f371081cbd.1400476449.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1400476449.git.rongqing.li@windriver.com>
References: <cover.1400476449.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] subversion: fix for Security Advisory CVE-2013-1847 and CVE-2013-1846
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
X-List-Received-Date: Mon, 19 May 2014 05:27:31 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

The mod_dav_svn Apache HTTPD server module in Subversion 1.6.x before 1.6.21
and 1.7.0 through 1.7.8 allows remote authenticated users to cause a denial of
service (NULL pointer dereference and crash) via a LOCK on an activity URL.
http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-1846

The mod_dav_svn Apache HTTPD server module in Subversion 1.6.0 through 1.6.20
and 1.7.0 through 1.7.8 allows remote attackers to cause a denial of service
(NULL pointer dereference and crash) via an anonymous LOCK for a URL that does
not exist.
http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-1847

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../subversion-CVE-2013-1847-CVE-2013-1846.patch   |   53 ++++++++++++++++++++
 .../subversion/subversion_1.6.15.bb                |    3 +-
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-1847-CVE-2013-1846.patch

diff --git a/meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-1847-CVE-2013-1846.patch b/meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-1847-CVE-2013-1846.patch
new file mode 100644
index 0000000..f49b9a4
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion/subversion-CVE-2013-1847-CVE-2013-1846.patch
@@ -0,0 +1,53 @@
+Upstream-Status: Backport
+
+Index: subversion/mod_dav_svn/lock.c
+===================================================================
+--- a/subversion/mod_dav_svn/lock.c	(revision 1459696)
++++ b/subversion/mod_dav_svn/lock.c	(working copy)
+@@ -634,7 +634,20 @@ append_locks(dav_lockdb *lockdb,
+   svn_lock_t *slock;
+   svn_error_t *serr;
+   dav_error *derr;
++  dav_svn_repos *repos = resource->info->repos;
++      
++  /* We don't allow anonymous locks */
++  if (! repos->username)
++    return dav_new_error(resource->pool, HTTP_UNAUTHORIZED,
++                         DAV_ERR_LOCK_SAVE_LOCK,
++                         "Anonymous lock creation is not allowed.");
+ 
++  /* Not a path in the repository so can't lock it. */
++  if (! resource->info->repos_path)
++    return dav_new_error(resource->pool, HTTP_BAD_REQUEST,
++                         DAV_ERR_LOCK_SAVE_LOCK,
++                         "Attempted to lock path not in repository.");
++
+   /* If the resource's fs path is unreadable, we don't allow a lock to
+      be created on it. */
+   if (! dav_svn__allow_read_resource(resource, SVN_INVALID_REVNUM,
+@@ -657,7 +670,6 @@ append_locks(dav_lockdb *lockdb,
+       svn_fs_txn_t *txn;
+       svn_fs_root_t *txn_root;
+       const char *conflict_msg;
+-      dav_svn_repos *repos = resource->info->repos;
+       apr_hash_t *revprop_table = apr_hash_make(resource->pool);
+       apr_hash_set(revprop_table, SVN_PROP_REVISION_AUTHOR,
+                    APR_HASH_KEY_STRING, svn_string_create(repos->username,
+@@ -734,7 +746,7 @@ append_locks(dav_lockdb *lockdb,
+ 
+   /* Convert the dav_lock into an svn_lock_t. */
+   derr = dav_lock_to_svn_lock(&slock, lock, resource->info->repos_path,
+-                              info, resource->info->repos->is_svn_client,
++                              info, repos->is_svn_client,
+                               resource->pool);
+   if (derr)
+     return derr;
+@@ -741,7 +753,7 @@ append_locks(dav_lockdb *lockdb,
+ 
+   /* Now use the svn_lock_t to actually perform the lock. */
+   serr = svn_repos_fs_lock(&slock,
+-                           resource->info->repos->repos,
++                           repos->repos,
+                            slock->path,
+                            slock->token,
+                            slock->comment,
diff --git a/meta/recipes-devtools/subversion/subversion_1.6.15.bb b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
index 11bf5ee..b86e578 100644
--- a/meta/recipes-devtools/subversion/subversion_1.6.15.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
@@ -15,7 +15,8 @@ SRC_URI = "http://subversion.tigris.org/downloads/${BPN}-${PV}.tar.bz2 \
            file://fix-install-depends.patch \
            file://subversion-CVE-2013-1849.patch \
            file://subversion-CVE-2013-4505.patch \
-           file://subversion-CVE-2013-1845.patch"
+           file://subversion-CVE-2013-1845.patch \
+           file://subversion-CVE-2013-1847-CVE-2013-1846.patch"
 
 SRC_URI[md5sum] = "113fca1d9e4aa389d7dc2b210010fa69"
 SRC_URI[sha256sum] = "b2919d603a5f3c19f42e3265c4b930e2376c43b3969b90ef9c42b2f72d5aaa45"
-- 
1.7.10.4


