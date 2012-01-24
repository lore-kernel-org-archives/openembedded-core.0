Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RpkWK-0000Go-Uq
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jan 2012 18:51:01 +0100
Received: by iabz21 with SMTP id z21so7118204iab.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2012 09:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=yec3pLM5mHNnAFaUoigTTQrJUB0Z3gjnvNIoB3pCrOQ=;
	b=fgLUlRNxJY7t/KTZjgBeYEE+amU+NkAwKrhabtgpSFbfvwVJPaJVj4fkbSG7mqDROy
	mR8wEctti4hgu4mel8D6HaC3rLZd8v4uMf+qSyK9TS+tNwzgHiYozrY5Qho3DJuYUe7z
	XuvFySOuNQvX2vN1LLSv0gfAC5JMqJpfzlk7s=
Received: by 10.42.168.202 with SMTP id x10mr12354687icy.4.1327426994233;
	Tue, 24 Jan 2012 09:43:14 -0800 (PST)
Received: from leto.gateway.2wire.net
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id wn6sm9360062igb.3.2012.01.24.09.43.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Jan 2012 09:43:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2012 09:42:55 -0800
Message-Id: <e035a903e7718b712b60ed33807b9ead906cee2f.1327426808.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.8.3
In-Reply-To: <cover.1327426808.git.raj.khem@gmail.com>
References: <cover.1327426808.git.raj.khem@gmail.com>
Subject: [PATCH 1/7] ltp: Update recipe and fix building on uclibc
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
X-List-Received-Date: Tue, 24 Jan 2012 17:51:01 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ltp/ltp/uclibc-getcontext.patch                |   78 ++++++++++++++++++++
 .../ltp/{ltp_20110915.bb => ltp_20120104.bb}       |   10 +-
 2 files changed, 83 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-extended/ltp/ltp/uclibc-getcontext.patch
 rename meta/recipes-extended/ltp/{ltp_20110915.bb => ltp_20120104.bb} (93%)

diff --git a/meta/recipes-extended/ltp/ltp/uclibc-getcontext.patch b/meta/recipes-extended/ltp/ltp/uclibc-getcontext.patch
new file mode 100644
index 0000000..310e2d4
--- /dev/null
+++ b/meta/recipes-extended/ltp/ltp/uclibc-getcontext.patch
@@ -0,0 +1,78 @@
+Fix building disabled getcontext and profil01 tests for uclibc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Pending
+
+Index: ltp-20110915/testcases/kernel/syscalls/getcontext/getcontext01.c
+===================================================================
+--- ltp-20110915.orig/testcases/kernel/syscalls/getcontext/getcontext01.c	2012-01-19 16:39:24.391012507 -0800
++++ ltp-20110915/testcases/kernel/syscalls/getcontext/getcontext01.c	2012-01-19 16:39:24.459012510 -0800
+@@ -34,6 +34,10 @@
+  **********************************************************/
+ 
+ #include <features.h>
++#include "test.h"
++#include "usctest.h"
++char *TCID = "getcontext01";	/* Test program identifier.    */
++
+ #if !defined(__UCLIBC__)
+ 
+ #include <stdio.h>
+@@ -41,13 +45,9 @@
+ #include <errno.h>
+ #include <ucontext.h>
+ 
+-#include "test.h"
+-#include "usctest.h"
+-
+ void setup();
+ void cleanup();
+ 
+-char *TCID = "getcontext01";	/* Test program identifier.    */
+ int TST_TOTAL = 1;		/* Total number of test cases. */
+ 
+ int exp_enos[] = { 0 };		/* must be a 0 terminated list */
+@@ -102,4 +102,4 @@
+ {
+ 	tst_brkm(TCONF, NULL, "system doesn't have getcontext support");
+ }
+-#endif
+\ No newline at end of file
++#endif
+Index: ltp-20110915/testcases/kernel/syscalls/profil/profil01.c
+===================================================================
+--- ltp-20110915.orig/testcases/kernel/syscalls/profil/profil01.c	2012-01-19 16:39:55.975014036 -0800
++++ ltp-20110915/testcases/kernel/syscalls/profil/profil01.c	2012-01-19 16:40:23.475015322 -0800
+@@ -41,6 +41,8 @@
+ #endif
+ 
+ #include <features.h>
++#include "test.h"
++char *TCID = "profil01";
+ #ifndef __UCLIBC__
+ 
+ #ifdef __arm__
+@@ -58,7 +60,6 @@
+ #include <errno.h>
+ #include <sys/types.h>
+ #include <sys/wait.h>
+-#include "test.h"
+ #include "usctest.h"
+ #define FAILED 0
+ #define PASSED 1
+@@ -73,7 +74,6 @@
+ //char progname[]= "profil1()";
+ 
+ /*****	LTP Port	*****/
+-char *TCID = "profil01";
+ int local_flag = PASSED;
+ int block_number;
+ FILE *temp;
+@@ -310,4 +310,4 @@
+ 	/* uClibc does not have profiling support */
+ 	tst_exit();
+ }
+-#endif
+\ No newline at end of file
++#endif
diff --git a/meta/recipes-extended/ltp/ltp_20110915.bb b/meta/recipes-extended/ltp/ltp_20120104.bb
similarity index 93%
rename from meta/recipes-extended/ltp/ltp_20110915.bb
rename to meta/recipes-extended/ltp/ltp_20120104.bb
index f1e58b2..07e1fcc 100644
--- a/meta/recipes-extended/ltp/ltp_20110915.bb
+++ b/meta/recipes-extended/ltp/ltp_20120104.bb
@@ -3,8 +3,6 @@ DESCRIPTION = "The Linux Test Project is a joint project with SGI, IBM, OSDL, an
 HOMEPAGE = "http://ltp.sourceforge.net"
 SECTION = "console/utils"
 
-PR = "r1"
-
 LICENSE = "GPLv2 & GPLv2+ & LGPLv2+ & LGPLv2.1+ & BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 		    file://testcases/kernel/mce-test/COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
@@ -21,10 +19,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 		    file://utils/benchmark/kernbench-0.42/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/ltp/ltp-full-${PV}.bz2"
+SRC_URI = "${SOURCEFORGE_MIRROR}/ltp/ltp-full-${PV}.bz2 \
+           file://uclibc-getcontext.patch \
+          "
 
-SRC_URI[md5sum] = "582fb78d7bf78a624a4387f29327d166"
-SRC_URI[sha256sum] = "013f7f2f6fdf46b7d73216533c3d4c2d91f0a2cec522bf026f7c8920ede83d2c"
+SRC_URI[md5sum] = "ac183bbdac67139f049b3755fda37179"
+SRC_URI[sha256sum] = "11b149b821d709e3351ac66f028f1b0dd5337ee9073dc20019ccffdac42d5c2e"
 
 export prefix = "/opt/ltp"
 export exec_prefix = "/opt/ltp"
-- 
1.7.8.3



