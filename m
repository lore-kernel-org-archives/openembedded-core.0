Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7E039736BA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Apr 2015 03:06:06 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Apr 2015 20:06:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,598,1422950400"; d="scan'208";a="711239189"
Received: from achsu-mobl2.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.254.72.158])
	by fmsmga002.fm.intel.com with ESMTP; 17 Apr 2015 20:06:06 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Fri, 17 Apr 2015 20:06:05 -0700
Message-Id: <1429326365-25767-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1429326365-25767-1-git-send-email-sgw@linux.intel.com>
References: <1429326365-25767-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH] dpkg: Fix patch to adjust for older code
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
X-List-Received-Date: Sat, 18 Apr 2015 03:06:06 -0000

The older version of dpkg uses subproc_wait_check() instead of the newer subproc_reap()

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../dpkg/dpkg/tar-error-code.patch                 | 27 +++++++++++-----------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg/tar-error-code.patch b/meta/recipes-devtools/dpkg/dpkg/tar-error-code.patch
index 7be2090..235f878 100644
--- a/meta/recipes-devtools/dpkg/dpkg/tar-error-code.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/tar-error-code.patch
@@ -16,11 +16,13 @@ place to avoid that kind of issue).
 Upsteam-Status: Inappropriate
 RP 2015/3/27
 
-Index: dpkg-1.17.21/dpkg-deb/build.c
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: dpkg-1.17.4/dpkg-deb/build.c
 ===================================================================
---- dpkg-1.17.21.orig/dpkg-deb/build.c
-+++ dpkg-1.17.21/dpkg-deb/build.c
-@@ -398,7 +398,7 @@ do_build(const char *const *argv)
+--- dpkg-1.17.4.orig/dpkg-deb/build.c
++++ dpkg-1.17.4/dpkg-deb/build.c
+@@ -443,7 +443,7 @@ do_build(const char *const *argv)
    bool subdir;
    char *tfbuf;
    int arfd;
@@ -29,26 +31,25 @@ Index: dpkg-1.17.21/dpkg-deb/build.c
    pid_t c1, c2;
  
    /* Decode our arguments. */
-@@ -493,7 +493,9 @@ do_build(const char *const *argv)
+@@ -536,7 +536,9 @@ do_build(const char *const *argv)
    }
    close(p1[0]);
-   subproc_reap(c2, "gzip -9c", 0);
--  subproc_reap(c1, "tar -cf", 0);
-+  rc = subproc_reap(c1, "tar -cf", SUBPROC_RETERROR);
+   subproc_wait_check(c2, "gzip -9c", 0);
+-  subproc_wait_check(c1, "tar -cf", 0);
++  rc = subproc_wait_check(c1, "tar -cf", PROCNOERR);
 +  if (rc && rc != 1)
 +    ohshite(_("subprocess %s returned error exit status %d"), "tar -cf", rc);
  
    if (lseek(gzfd, 0, SEEK_SET))
      ohshite(_("failed to rewind temporary file (%s)"), _("control member"));
-@@ -581,7 +583,10 @@ do_build(const char *const *argv)
+@@ -619,7 +621,9 @@ do_build(const char *const *argv)
    /* All done, clean up wait for tar and gzip to finish their job. */
    close(p1[1]);
-   subproc_reap(c2, _("<compress> from tar -cf"), 0);
--  subproc_reap(c1, "tar -cf", 0);
-+  rc = subproc_reap(c1, "tar -cf", SUBPROC_RETERROR);
+   subproc_wait_check(c2, _("<compress> from tar -cf"), 0);
+-  subproc_wait_check(c1, "tar -cf", 0);
++  rc = subproc_wait_check(c1, "tar -cf", PROCNOERR);
 +  if (rc && rc != 1)
 +    ohshite(_("subprocess %s returned error exit status %d"), "tar -cf", rc);
-+
    /* Okay, we have data.tar as well now, add it to the ar wrapper. */
    if (deb_format.major == 2) {
      char datamember[16 + 1];
-- 
2.1.0


