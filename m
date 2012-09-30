Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TI7Mz-0001nj-29
	for openembedded-core@lists.openembedded.org;
	Sun, 30 Sep 2012 02:26:53 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8U0Dvar027492
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2012 17:13:57 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Sat, 29 Sep 2012 17:13:57 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2012 19:19:17 -0500
Message-ID: <851d6b47cf9ff427c66ae7ac3ab235e693957693.1348963477.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1348963477.git.mark.hatle@windriver.com>
References: <cover.1348963477.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 11/12] rpm: Add rpm patch to fix git_strerror issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 30 Sep 2012 00:26:53 -0000
Content-Type: text/plain

Remove the optimzation append from recipe and add the patch that is in the rpm
cvs repo, http://www.mail-archive.com/rpm-cvs@rpm5.org/msg08907.html. The -O2
optimzation append is removed since it can limit debugging options that are
provided when -O0 is used.

This was tested by setting: SELECTED_OPTIMIZATION = "-O0"

Signed-off-by: Morgan Little <morgan.little@windriver.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../rpm/rpm/rpm-stub-out-git_strerror.patch        |   60 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    3 +-
 2 files changed, 62 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-stub-out-git_strerror.patch

diff --git a/meta/recipes-devtools/rpm/rpm/rpm-stub-out-git_strerror.patch b/meta/recipes-devtools/rpm/rpm/rpm-stub-out-git_strerror.patch
new file mode 100644
index 0000000..2cfc163
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/rpm-stub-out-git_strerror.patch
@@ -0,0 +1,60 @@
+git: fix: stud-out git_strerror when --without-git
+
+Patch taken from the cvs repo,http://www.mail-archive.com/rpm-cvs@rpm5.org/msg08907.html. 
+
+Upstream-status: Backport
+
+Signed-off-by: Morgan Little <morgan.little@windriver.com>
+
+Server: rpm5.org                         Name:   Jeff Johnson
+Root:   /v/rpm/cvs                       Email:  j...@rpm5.org
+Module: rpm                              Date:   07-Jun-2012 16:17:02
+Branch: rpm-5_4                          Handle: 2012060714165803
+
+Modified files:           (Branch: rpm-5_4)
+  rpm                     CHANGES
+  rpm/rpmio               rpmgit.c tgit.c
+
+Log:
+  - git: fix: stub-out git_strerror when --without-git.
+
+Summary:
+  Revision    Changes     Path
+  2.1.2.11    +3  -1      rpm/rpmio/rpmgit.c
+  1.1.2.7     +0  -1      rpm/rpmio/tgit.c
+____________________________________________________________________________
+Index: rpm/rpmio/rpmgit.c
+============================================================================
+--- rpm/rpmio/rpmgit.c
++++ rpm/rpmio/rpmgit.c
+@@ -145,6 +145,9 @@
+ #endif       /* defined(WITH_LIBGT2) */
+ 
+ /*==============================================================*/
++#if !defined(WITH_LIBGIT2)
++#define      git_strerror(_rc) ""
++#endif
+ 
+ static int Xchkgit(/*@unused@*/ rpmgit git, const char * msg,
+                 int error, int printit,
+@@ -157,7 +157,6 @@
+     int rc = error;
+ 
+     if (printit && rc) {
+-	/* XXX git_strerror? */
+         rpmlog(RPMLOG_ERR, "%s:%s:%u: %s(%d): %s\n",
+                 func, fn, ln, msg, rc, git_strerror(rc));
+     }
+Index: rpm/rpmio/tgit.c
+============================================================================
+--- rpm/rpmio/tgit.c
++++ rpm/rpmio/tgit.c
+@@ -34,7 +34,6 @@
+     int rc = error;
+ 
+     if (printit && rc) {
+-	/* XXX git_strerror? */
+         rpmlog(RPMLOG_ERR, "%s:%s:%u: %s(%d): %s\n",
+                 func, fn, ln, msg, rc, git_strerror(rc));
+     }
+
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
index 4aea2f6..dda5611 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
@@ -43,7 +43,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "libpcre attr acl popt ossp-uuid file bison-native"
-PR = "r50"
+PR = "r51"
 
 # rpm2cpio is a shell script, which is part of the rpm src.rpm.  It is needed
 # in order to extract the distribution SRPM into a format we can extract...
@@ -78,6 +78,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;ex
 	   file://dbconvert.patch \
 	   file://rpm-uuid-include.patch \
 	   file://makefile-am-exec-hook.path \
+	   file://rpm-stub-out-git_strerror.patch \
 	  "
 
 SRC_URI[md5sum] = "60d56ace884340c1b3fcac6a1d58e768"
-- 
1.7.3.4



