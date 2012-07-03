Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SlxPp-0006zt-6S
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 09:20:54 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Jul 2012 00:09:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="166158043"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.182])
	by orsmga002.jf.intel.com with ESMTP; 03 Jul 2012 00:09:48 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2012 00:09:31 -0700
Message-Id: <3fd5d0334439b6231a6afd2a544a16b87ae81c99.1341299168.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1341299168.git.sgw@linux.intel.com>
References: <cover.1341299168.git.sgw@linux.intel.com>
In-Reply-To: <cover.1341299168.git.sgw@linux.intel.com>
References: <cover.1341299168.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 02/17] icu 3.6: do_install failed: Segmentation fault
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Jul 2012 07:20:54 -0000

From: Robert Yang <liezhi.yang@windriver.com>

There is a "Segmentation fault" error when the tmpdir is longer than 470
(or less), this is because it used "char cmd[1024]" which is not enough
for the command line. Allocate a larger memory size should fix this problem.

[YOCTO #2664]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../icu/files/larger-cmd-size.patch                |   27 ++++++++++++++++++++
 meta/recipes-support/icu/icu-3.6.inc               |    1 +
 meta/recipes-support/icu/icu_3.6.bb                |    2 +-
 3 files changed, 29 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-support/icu/files/larger-cmd-size.patch

diff --git a/meta/recipes-support/icu/files/larger-cmd-size.patch b/meta/recipes-support/icu/files/larger-cmd-size.patch
new file mode 100644
index 0000000..74a84f1
--- /dev/null
+++ b/meta/recipes-support/icu/files/larger-cmd-size.patch
@@ -0,0 +1,27 @@
+Allocate a larger memory size for cmd
+
+The length of the command line can be longer than 1024 sometimes,
+which will cause a "Segmentation fault" error.
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+Upstream-Status: Pending
+---
+ tools/pkgdata/pkgdata.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/pkgdata/pkgdata.c b/tools/pkgdata/pkgdata.c
+--- a/tools/pkgdata/pkgdata.c
++++ b/tools/pkgdata/pkgdata.c
+@@ -439,7 +439,7 @@ main(int argc, char* argv[]) {
+ /* POSIX - execute makefile */
+ static int executeMakefile(const UPKGOptions *o)
+ {
+-    char cmd[1024];
++    char cmd[2048];
+     /*char pwd[1024];*/
+     const char *make;
+     int rc;
+-- 
+1.7.10.2
+
diff --git a/meta/recipes-support/icu/icu-3.6.inc b/meta/recipes-support/icu/icu-3.6.inc
index d3391fe..d969caa 100644
--- a/meta/recipes-support/icu/icu-3.6.inc
+++ b/meta/recipes-support/icu/icu-3.6.inc
@@ -6,6 +6,7 @@ BASE_SRC_URI = "ftp://ftp.software.ibm.com/software/globalization/icu/3.6/icu4c-
            file://gccfix.patch \
            file://fix-parallel-build.patch \
            file://use-g++-for-linking.patch \
+           file://larger-cmd-size.patch \
            "
 SRC_URI = "${BASE_SRC_URI} \
            file://noldlibpath.patch \
diff --git a/meta/recipes-support/icu/icu_3.6.bb b/meta/recipes-support/icu/icu_3.6.bb
index d7be522..f941acf 100644
--- a/meta/recipes-support/icu/icu_3.6.bb
+++ b/meta/recipes-support/icu/icu_3.6.bb
@@ -1,6 +1,6 @@
 require icu-3.6.inc
 
-PR = "r8"
+PR = "r9"
 
 SRC_URI[md5sum] = "6243f7a19e03e05403ce84e597510d4c"
 SRC_URI[sha256sum] = "5135e8d69d6206d320515df7aeee7027711ab1aef9d8dbf29571a97a9746b041"
-- 
1.7.7.6



