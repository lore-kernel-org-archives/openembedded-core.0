Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 27FE665FE5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 05:27:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4J5RU7k004034
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 May 2014 22:27:30 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Sun, 18 May 2014 22:27:29 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 May 2014 13:27:20 +0800
Message-ID: <4c629b8b94851047e7d2a6363ab2b2bd67be5b60.1400476449.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1400476449.git.rongqing.li@windriver.com>
References: <cover.1400476449.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] subversion: fix for Security Advisory CVE-2013-4131
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
X-List-Received-Date: Mon, 19 May 2014 05:27:29 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

The mod_dav_svn Apache HTTPD server module in Subversion 1.7.0 through
1.7.10 and 1.8.x before 1.8.1 allows remote authenticated users to cause
a denial of service (assertion failure or out-of-bounds read) via a
certain (1) COPY, (2) DELETE, or (3) MOVE request against a revision
root.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4131

Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../subversion-CVE-2013-4131.patch                 |   42 ++++++++++++++++++++
 .../subversion/subversion_1.7.10.bb                |    1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.7.10/subversion-CVE-2013-4131.patch

diff --git a/meta/recipes-devtools/subversion/subversion-1.7.10/subversion-CVE-2013-4131.patch b/meta/recipes-devtools/subversion/subversion-1.7.10/subversion-CVE-2013-4131.patch
new file mode 100644
index 0000000..88bd25e
--- /dev/null
+++ b/meta/recipes-devtools/subversion/subversion-1.7.10/subversion-CVE-2013-4131.patch
@@ -0,0 +1,42 @@
+Upstream-Status: Backport
+
+Index: subversion/mod_dav_svn/repos.c
+===================================================================
+--- a/subversion/mod_dav_svn/repos.c	(revision 1503527)
++++ b/subversion/mod_dav_svn/repos.c	(revision 1503528)
+@@ -2408,21 +2408,12 @@
+                 svn_boolean_t is_urlpath,
+                 apr_pool_t *pool)
+ {
+-  apr_size_t len;
+-  char *tmp = apr_pstrdup(pool, path);
+-
+-  len = strlen(tmp);
+-
+-  if (len > 0)
++  if (*path != '\0') /* not an empty string */
+     {
+-      /* Remove any trailing slash; else svn_path_dirname() asserts. */
+-      if (tmp[len-1] == '/')
+-        tmp[len-1] = '\0';
+-
+       if (is_urlpath)
+-        return svn_urlpath__dirname(tmp, pool);
++        return svn_urlpath__dirname(path, pool);
+       else
+-        return svn_fspath__dirname(tmp, pool);
++        return svn_fspath__dirname(path, pool);
+     }
+ 
+   return path;
+@@ -2458,7 +2449,9 @@
+       parent->versioned = 1;
+       parent->hooks = resource->hooks;
+       parent->pool = resource->pool;
+-      parent->uri = get_parent_path(resource->uri, TRUE, resource->pool);
++      parent->uri = get_parent_path(svn_urlpath__canonicalize(resource->uri,
++                                                              resource->pool),
++                                    TRUE, resource->pool);
+       parent->info = parentinfo;
+ 
+       parentinfo->uri_path =
diff --git a/meta/recipes-devtools/subversion/subversion_1.7.10.bb b/meta/recipes-devtools/subversion/subversion_1.7.10.bb
index 011d51b..2d06263 100644
--- a/meta/recipes-devtools/subversion/subversion_1.7.10.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.7.10.bb
@@ -15,6 +15,7 @@ SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://allow-updated-neon.patch \
            file://neon.m4-fix-includes-and-cflags.patch \
            file://subversion-CVE-2013-4505.patch \
+           file://subversion-CVE-2013-4131.patch \
 "
 SRC_URI[md5sum] = "4088a77e14232876c9b4ff1541e6e200"
 SRC_URI[sha256sum] = "c1df222bec83d014d17785e2ceba6bc80962f64b280967de0285836d8d77a8e7"
-- 
1.7.10.4


