Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXoOE-00085R-J8
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 08:52:46 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2012 23:42:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157115413"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by fmsmga001.fm.intel.com with ESMTP; 24 May 2012 23:42:27 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 23:41:47 -0700
Message-Id: <037fe5a79f7dae479aefb3b7583c0fc674d05f97.1337927956.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 08/45] ltp: Upgrade LTP to version 20120401
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
X-List-Received-Date: Fri, 25 May 2012 06:52:46 -0000

From: Jiajun Xu <jiajun.xu@intel.com>

Signed-off-by: Jiajun Xu <jiajun.xu@intel.com>
---
 .../ltp/ltp/uclibc-getcontext.patch                |   78 --------------------
 .../ltp/{ltp_20120104.bb => ltp_20120401.bb}       |    7 +-
 2 files changed, 3 insertions(+), 82 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/uclibc-getcontext.patch
 rename meta/recipes-extended/ltp/{ltp_20120104.bb => ltp_20120401.bb} (95%)

diff --git a/meta/recipes-extended/ltp/ltp/uclibc-getcontext.patch b/meta/recipes-extended/ltp/ltp/uclibc-getcontext.patch
deleted file mode 100644
index 310e2d4..0000000
--- a/meta/recipes-extended/ltp/ltp/uclibc-getcontext.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-Fix building disabled getcontext and profil01 tests for uclibc
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-
-Index: ltp-20110915/testcases/kernel/syscalls/getcontext/getcontext01.c
-===================================================================
---- ltp-20110915.orig/testcases/kernel/syscalls/getcontext/getcontext01.c	2012-01-19 16:39:24.391012507 -0800
-+++ ltp-20110915/testcases/kernel/syscalls/getcontext/getcontext01.c	2012-01-19 16:39:24.459012510 -0800
-@@ -34,6 +34,10 @@
-  **********************************************************/
- 
- #include <features.h>
-+#include "test.h"
-+#include "usctest.h"
-+char *TCID = "getcontext01";	/* Test program identifier.    */
-+
- #if !defined(__UCLIBC__)
- 
- #include <stdio.h>
-@@ -41,13 +45,9 @@
- #include <errno.h>
- #include <ucontext.h>
- 
--#include "test.h"
--#include "usctest.h"
--
- void setup();
- void cleanup();
- 
--char *TCID = "getcontext01";	/* Test program identifier.    */
- int TST_TOTAL = 1;		/* Total number of test cases. */
- 
- int exp_enos[] = { 0 };		/* must be a 0 terminated list */
-@@ -102,4 +102,4 @@
- {
- 	tst_brkm(TCONF, NULL, "system doesn't have getcontext support");
- }
--#endif
-\ No newline at end of file
-+#endif
-Index: ltp-20110915/testcases/kernel/syscalls/profil/profil01.c
-===================================================================
---- ltp-20110915.orig/testcases/kernel/syscalls/profil/profil01.c	2012-01-19 16:39:55.975014036 -0800
-+++ ltp-20110915/testcases/kernel/syscalls/profil/profil01.c	2012-01-19 16:40:23.475015322 -0800
-@@ -41,6 +41,8 @@
- #endif
- 
- #include <features.h>
-+#include "test.h"
-+char *TCID = "profil01";
- #ifndef __UCLIBC__
- 
- #ifdef __arm__
-@@ -58,7 +60,6 @@
- #include <errno.h>
- #include <sys/types.h>
- #include <sys/wait.h>
--#include "test.h"
- #include "usctest.h"
- #define FAILED 0
- #define PASSED 1
-@@ -73,7 +74,6 @@
- //char progname[]= "profil1()";
- 
- /*****	LTP Port	*****/
--char *TCID = "profil01";
- int local_flag = PASSED;
- int block_number;
- FILE *temp;
-@@ -310,4 +310,4 @@
- 	/* uClibc does not have profiling support */
- 	tst_exit();
- }
--#endif
-\ No newline at end of file
-+#endif
diff --git a/meta/recipes-extended/ltp/ltp_20120104.bb b/meta/recipes-extended/ltp/ltp_20120401.bb
similarity index 95%
rename from meta/recipes-extended/ltp/ltp_20120104.bb
rename to meta/recipes-extended/ltp/ltp_20120401.bb
index c82203a..821d9e4 100644
--- a/meta/recipes-extended/ltp/ltp_20120104.bb
+++ b/meta/recipes-extended/ltp/ltp_20120401.bb
@@ -19,14 +19,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 		    file://utils/benchmark/kernbench-0.42/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/ltp/ltp-full-${PV}.bz2 \
-           file://uclibc-getcontext.patch \
           "
 
-SRC_URI[md5sum] = "ac183bbdac67139f049b3755fda37179"
-SRC_URI[sha256sum] = "11b149b821d709e3351ac66f028f1b0dd5337ee9073dc20019ccffdac42d5c2e"
+SRC_URI[md5sum] = "e1d0acf1a6b6da0cb30dc1b0dcf5f26d"
+SRC_URI[sha256sum] = "f0f5845f9666f61332fdf0b7e396fc647f9372db0902a829af2cf9402b807bd1"
 
 export prefix = "/opt/ltp"
 export exec_prefix = "/opt/ltp"
-- 
1.7.7.6



