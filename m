Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1EF8D600B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Apr 2016 14:40:05 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 13 Apr 2016 07:40:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,479,1455004800"; d="scan'208";a="685622185"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Apr 2016 07:40:05 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Apr 2016 17:40:04 +0300
Message-Id: <1460558404-20616-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH] rpm: more verbose errors in rpmTempFile
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
X-List-Received-Date: Wed, 13 Apr 2016 14:40:06 -0000

This patch adds better error logging inside the rpm tempfile function in
order to be able to better analyze a rare and very hard-to-reproduce
failure in oe-selftest for rpm signing.

[YOCTO #9416]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 ...more-verbose-error-logging-in-rpmTempFile.patch | 53 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.16.bb            |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpmdb-more-verbose-error-logging-in-rpmTempFile.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpmdb-more-verbose-error-logging-in-rpmTempFile.patch b/meta/recipes-devtools/rpm/rpm/rpmdb-more-verbose-error-logging-in-rpmTempFile.patch
new file mode 100644
index 0000000..809e54e
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpmdb-more-verbose-error-logging-in-rpmTempFile.patch
@@ -0,0 +1,53 @@
+rpmdb: more verbose error logging in rpmTempFile()
+
+Upstream-Status: Inappropriate [debugging]
+
+Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
+
+diff --git a/rpmdb/signature.c b/rpmdb/signature.c
+index dce6c4e..a1d0f06 100644
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
++        if (ret) {
++            rpmlog(RPMLOG_ERR, _("error creating temporary directory %s: %d\n"), tempfn, ret);
++            goto errxit;
++        }
+     }
+ 
+     /* XXX should probably use mkstemp here */
+@@ -68,12 +72,16 @@ int rpmTempFile(const char * prefix, const char ** fnptr, void * fdptr)
+ #endif
+ 
+ 	temput = urlPath(tempfn, &tfn);
+-	if (*tfn == '\0') goto errxit;
++	if (*tfn == '\0') {
++            rpmlog(RPMLOG_ERR, _("error creating tempfile: empty filename\n"));
++            goto errxit;
++        }
+ 
+ 	switch (temput) {
+ 	case URL_IS_DASH:
+ 	case URL_IS_HKP:
+ 	case URL_IS_MONGO:	/* XXX FIXME */
++            rpmlog(RPMLOG_ERR, _("error creating temporary file, invalid uri type: %d\n"), temput);
+ 	    goto errxit;
+ 	    /*@notreached@*/ /*@switchbreak@*/ break;
+ 	case URL_IS_HTTPS:
+-- 
+2.6.6
+
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.16.bb b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
index d42724c..9e2229a 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.16.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.16.bb
@@ -150,6 +150,7 @@ SRC_URI += " \
 	   file://rpm-rpmdb-grammar.patch \
 	   file://rpm-disable-blaketest.patch \
 	   file://rpm-autogen-force.patch \
+	   file://rpmdb-more-verbose-error-logging-in-rpmTempFile.patch \
 "
 
 SRC_URI_append_libc-musl = "\
-- 
2.6.6


