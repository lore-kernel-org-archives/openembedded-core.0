Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 695887199F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 10:41:26 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 Oct 2016 03:41:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,344,1473145200"; d="scan'208";a="1070357473"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga002.fm.intel.com with ESMTP; 14 Oct 2016 03:41:28 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Oct 2016 13:41:26 +0300
Message-Id: <1476441686-26759-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH] rpm: prevent race in tempdir creation
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
X-List-Received-Date: Fri, 14 Oct 2016 10:41:30 -0000

This patch fixes an extramely rare race condition in creation of rpmdb
temporary directory. The "rpmdb-more-verbose-error-logging" patch is
still left in place, just for the case.

[YOCTO #9416]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 ...more-verbose-error-logging-in-rpmTempFile.patch | 26 ++------------
 .../rpmdb-prevent-race-in-tmpdir-creation.patch    | 41 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.16.bb            |  1 +
 3 files changed, 44 insertions(+), 24 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpmdb-prevent-race-in-tmpdir-creation.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpmdb-more-verbose-error-logging-in-rpmTempFile.patch b/meta/recipes-devtools/rpm/rpm/rpmdb-more-verbose-error-logging-in-rpmTempFile.patch
index 809e54e..3a6f874 100644
--- a/meta/recipes-devtools/rpm/rpm/rpmdb-more-verbose-error-logging-in-rpmTempFile.patch
+++ b/meta/recipes-devtools/rpm/rpm/rpmdb-more-verbose-error-logging-in-rpmTempFile.patch
@@ -5,32 +5,10 @@ Upstream-Status: Inappropriate [debugging]
 Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
 
 diff --git a/rpmdb/signature.c b/rpmdb/signature.c
-index dce6c4e..a1d0f06 100644
+index 100204b..e56ab3d 100644
 --- a/rpmdb/signature.c
 +++ b/rpmdb/signature.c
-@@ -37,6 +37,7 @@ int rpmTempFile(const char * prefix, const char ** fnptr, void * fdptr)
-     int temput;
-     FD_t fd = NULL;
-     unsigned int ran;
-+    int ret = 0;
- 
-     if (!prefix) prefix = "";
- 
-@@ -44,8 +45,11 @@ int rpmTempFile(const char * prefix, const char ** fnptr, void * fdptr)
-     if (!_initialized) {
- 	_initialized = 1;
- 	tempfn = rpmGenPath(prefix, tpmacro, NULL);
--	if (rpmioMkpath(tempfn, 0755, (uid_t) -1, (gid_t) -1))
--	    goto errxit;
-+        ret = rpmioMkpath(tempfn, 0755, (uid_t) -1, (gid_t) -1);
-+        if (ret) {
-+            rpmlog(RPMLOG_ERR, _("error creating temporary directory %s: %d\n"), tempfn, ret);
-+            goto errxit;
-+        }
-     }
- 
-     /* XXX should probably use mkstemp here */
-@@ -68,12 +72,16 @@ int rpmTempFile(const char * prefix, const char ** fnptr, void * fdptr)
+@@ -72,12 +72,16 @@ int rpmTempFile(const char * prefix, const char ** fnptr, void * fdptr)
  #endif
  
  	temput = urlPath(tempfn, &tfn);
diff --git a/meta/recipes-devtools/rpm/rpm/rpmdb-prevent-race-in-tmpdir-creation.patch b/meta/recipes-devtools/rpm/rpm/rpmdb-prevent-race-in-tmpdir-creation.patch
new file mode 100644
index 0000000..f483f3a
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpmdb-prevent-race-in-tmpdir-creation.patch
@@ -0,0 +1,41 @@
+rpmdb: prevent race in tmpdir creation
+
+If two (or more) instances of rpm are running at the same time they may
+be trying to create the same (base-)temporary directory at the same time
+which causes the other mkdir to fail with EEXIST. This patch prevents a
+failure caused by this race by ignoring EEXIST error on directory
+creation.
+
+Upstream-Status: Pending
+
+Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
+
+diff --git a/rpmdb/signature.c b/rpmdb/signature.c
+index dce6c4e..100204b 100644
+--- a/rpmdb/signature.c
++++ b/rpmdb/signature.c
+@@ -37,6 +37,7 @@ int rpmTempFile(const char * prefix, const char ** fnptr, void * fdptr)
+     int temput;
+     FD_t fd = NULL;
+     unsigned int ran;
++    int ret = 0;
+ 
+     if (!prefix) prefix = "";
+ 
+@@ -44,8 +45,11 @@ int rpmTempFile(const char * prefix, const char ** fnptr, void * fdptr)
+     if (!_initialized) {
+ 	_initialized = 1;
+ 	tempfn = rpmGenPath(prefix, tpmacro, NULL);
+-	if (rpmioMkpath(tempfn, 0755, (uid_t) -1, (gid_t) -1))
+-	    goto errxit;
++        ret = rpmioMkpath(tempfn, 0755, (uid_t) -1, (gid_t) -1);
++        if (ret && ret != EEXIST) {
++            rpmlog(RPMLOG_ERR, _("error creating temporary directory %s: %d\n"), tempfn, ret);
++            goto errxit;
++        }
+     }
+ 
+     /* XXX should probably use mkstemp here */
+-- 
+2.6.6
+
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
index dd6e103..1332397 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -154,6 +154,7 @@ SRC_URI += " \
 	   file://rpm-rpmdb-grammar.patch \
 	   file://rpm-disable-blaketest.patch \
 	   file://rpm-autogen-force.patch \
+	   file://rpmdb-prevent-race-in-tmpdir-creation.patch \
 	   file://rpmdb-more-verbose-error-logging-in-rpmTempFile.patch \
 "
 
-- 
2.6.6


