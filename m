Return-Path: <jose.alarcon@ge.com>
X-Greylist: delayed 6099 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 21 Aug 2017 12:05:29 UTC
Received: from mx0a-00176a03.pphosted.com (mx0a-00176a03.pphosted.com
	[67.231.149.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6F07B78315
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 12:05:29 +0000 (UTC)
Received: from pps.filterd (m0047961.ppops.net [127.0.0.1])
	by m0047961.ppops.net-00176a03. (8.16.0.21/8.16.0.21) with SMTP id
	v7LANMhd020133 for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 06:23:52 -0400
From: Jose Alarcon <jose.alarcon@ge.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Aug 2017 13:23:42 +0300
Message-Id: <20170821102342.167780-1-jose.alarcon@ge.com>
X-Mailer: git-send-email 2.10.1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-08-21_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
	lowpriorityscore=0 impostorscore=0 adultscore=0 classifier=spam
	adjust=0
	reason=mlx scancount=1 engine=8.0.1-1707230000
	definitions=main-1708210168
Subject: [meta-oe][PATCH] Dhrystone: add recipe 2.1
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
X-List-Received-Date: Mon, 21 Aug 2017 12:05:30 -0000

Dhrystone is a synthetic computing benchmark program developed
in 1984 by Reinhold P. Weicker intended to be representative of
system (integer) programming.

https://en.wikipedia.org/wiki/Dhrystone

Signed-off-by: Jose Alarcon <jose.alarcon@ge.com>
---
 .../dhrystone/dhrystone-2.1/dhrystone.patch        | 81 ++++++++++++++++++++++
 .../recipes-benchmark/dhrystone/dhrystone_2.1.bb   | 26 +++++++
 2 files changed, 107 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/dhrystone/dhrystone-2.1/dhrystone.patch
 create mode 100644 meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb

diff --git a/meta-oe/recipes-benchmark/dhrystone/dhrystone-2.1/dhrystone.patch b/meta-oe/recipes-benchmark/dhrystone/dhrystone-2.1/dhrystone.patch
new file mode 100644
index 0000000..ae93aba
--- /dev/null
+++ b/meta-oe/recipes-benchmark/dhrystone/dhrystone-2.1/dhrystone.patch
@@ -0,0 +1,81 @@
+dhrystone: fix compilation problems
+
+This patch fixes two compilation errors with original
+dhrystone sources:
+* Redefinition of times() with wrong return type
+  - Fixed by commenting out the unnecessary redefinition
+* Undefined identifier HZ
+  - Originally HZ was supposed to be the clock frequency
+    value for times()
+  - For Linux, the frequency should come from sysconf
+  - This patch defines global varible HZ and initializes
+    it from sysconf
+
+Additionally, this patch adds a simple Makefile.
+
+upstream-status : Pending
+
+Sign-off-by: Kimmo Surakka <kimmo.surakka@ge.com>
+Signed-off-by: Jose Alarcon <jose.alarcon@ge.com>
+---
+
+diff -Naur dhry.orig/dhry_1.c dhry/dhry_1.c
+--- dhry.orig/dhry_1.c	2015-07-20 14:25:58.059945353 +0300
++++ dhry/dhry_1.c	2015-07-20 12:43:25.318945353 +0300
+@@ -45,11 +45,15 @@
+ 
+ #ifdef TIMES
+ struct tms      time_info;
+-extern  int     times ();
++/* extern  int     times (); */
+                 /* see library function "times" */
+ #define Too_Small_Time 120
+                 /* Measurements should last at least about 2 seconds */
+ #endif
++#ifndef HZ
++#include <unistd.h>  /* sysconf */
++   long HZ;
++#endif
+ #ifdef TIME
+ extern long     time();
+                 /* see library function "time"  */
+@@ -84,6 +88,9 @@
+ 
+   /* Initializations */
+ 
++#ifndef HZ
++  HZ = sysconf(_SC_CLK_TCK);
++#endif
+   Next_Ptr_Glob = (Rec_Pointer) malloc (sizeof (Rec_Type));
+   Ptr_Glob = (Rec_Pointer) malloc (sizeof (Rec_Type));
+ 
+diff -Naur dhry.orig/dhry.h dhry/dhry.h
+--- dhry.orig/dhry.h	2015-07-20 14:25:58.054945353 +0300
++++ dhry/dhry.h	2015-07-20 12:42:59.903945353 +0300
+@@ -420,4 +420,6 @@
+           } variant;
+       } Rec_Type, *Rec_Pointer;
+ 
+-
++#ifndef HZ
++   extern long HZ;
++#endif
+diff -Naur dhry.orig/Makefile dhry/Makefile
+--- dhry.orig/Makefile	1970-01-01 02:00:00.000000000 +0200
++++ dhry/Makefile	2015-07-20 14:10:45.832945353 +0300
+@@ -0,0 +1,15 @@
++CC=gcc
++
++all: dhry
++
++dhry: dhry_1.o dhry_2.o
++	$(CC) $(LDFLAGS) -o $@ $^ $(LOADLIBES) $(LDLIBS)
++
++dhry_1.o: dhry_1.c dhry.h
++
++dhry_2.o: dhry_2.c dhry.h
++
++clean:
++	rm -f *.o *~
++
++.PHONY: all clean
diff --git a/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb b/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
new file mode 100644
index 0000000..a11e8cf
--- /dev/null
+++ b/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Dhrystone CPU benchmark"
+LICENSE = "Proprietary"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/Proprietary;md5=0557f9d92cf58f2ccdd50f62f8ac0b28"
+
+SRC_URI = "http://www.netlib.org/benchmark/dhry-c;downloadfilename=dhry-c.shar \
+           file://dhrystone.patch"
+SRC_URI[md5sum] = "75aa5909c174eed98c134be2f56307da"
+SRC_URI[sha256sum] = "038a7e9169787125c3451a6c941f3aca5db2d2f3863871afcdce154ef17f4e3e"
+
+# Need to override Makefile variables
+EXTRA_OEMAKE = "-e MAKEFLAGS="
+
+do_unpack() {
+    [ -d ${S} ] || mkdir -p ${S}
+    cd ${S}
+    sh ${DL_DIR}/dhry-c.shar
+}
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${S}/dhry ${D}${bindir}
+}
+
+# Prevent procedure merging as required by dhrystone.c:
+CFLAGS += "-fno-lto"
+
+LDFLAGS += "-fno-lto"
-- 
2.10.1


