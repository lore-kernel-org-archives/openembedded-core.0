Return-Path: <riku.voipio@linaro.org>
Received: from afflict.kos.to (afflict.kos.to [92.243.29.197])
	by mail.openembedded.org (Postfix) with ESMTP id 9598D6D1E3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 08:17:02 +0000 (UTC)
Received: from localhost.localdomain (91-157-208-114.elisa-laajakaista.fi
	[91.157.208.114])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by afflict.kos.to (Postfix) with ESMTPSA id 19A7F26554;
	Mon, 21 Oct 2013 10:17:04 +0200 (CEST)
From: Riku Voipio <riku.voipio@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Oct 2013 11:16:55 +0300
Message-Id: <1382343415-30035-3-git-send-email-riku.voipio@linaro.org>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1382343415-30035-1-git-send-email-riku.voipio@linaro.org>
References: <1382343415-30035-1-git-send-email-riku.voipio@linaro.org>
Cc: patches@linaro.org
Subject: [PATCH 3/3] ltp: enable power management and realtime tests
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
X-List-Received-Date: Mon, 21 Oct 2013 08:17:03 -0000

ltp includes realtime and power management tests,
that are somewhat experimental and not enabled by default.
Add the configuration options to enable them, and a backported
patch that allows compilation with more pedantic toolchains.

You will still need to run the realtime tests explicitly,
so this should have no impact on people not interested in
testing realtime features.
---
 meta/recipes-extended/ltp/files/fix-pm-tests.patch | 30 ++++++++++++++++++++++
 meta/recipes-extended/ltp/ltp_20130904.bb          |  2 ++
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-extended/ltp/files/fix-pm-tests.patch

diff --git a/meta/recipes-extended/ltp/files/fix-pm-tests.patch b/meta/recipes-extended/ltp/files/fix-pm-tests.patch
new file mode 100644
index 0000000..e8f80de
--- /dev/null
+++ b/meta/recipes-extended/ltp/files/fix-pm-tests.patch
@@ -0,0 +1,30 @@
+Upstream-Status: Backport
+
+commit 6f3147f01229f3bb953202cde828d35e0d2bcb8a
+Author: Riku Voipio <riku.voipio@linaro.org>
+Date:   Mon Oct 14 11:50:28 2013 +0300
+
+    power_management: add TCID
+    
+    get_sched_values.c uses interfaces provided by -lltp which need
+    TCID defined. Not sure how this built successfully before.
+    
+    [v2] correct TCID to an unique one
+    
+    Cc: Wanlong Gao <gaowanlong@cn.fujitsu.com>
+    Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
+    Reviewed-by: Wanlong Gao <gaowanlong@cn.fujitsu.com>
+
+Index: ltp-full-20130904/testcases/kernel/power_management/get_sched_values.c
+===================================================================
+--- ltp-full-20130904.orig/testcases/kernel/power_management/get_sched_values.c	2013-09-04 10:18:22.000000000 +0300
++++ ltp-full-20130904/testcases/kernel/power_management/get_sched_values.c	2013-10-11 14:57:40.890551214 +0300
+@@ -17,6 +17,8 @@
+ #include <stdio.h>
+ #include "test.h"
+ 
++const char *TCID = "Power_Management";
++
+ int get_supp_sched_mc(void)
+ {
+ 	if (tst_kvercmp(2, 6, 29) < 0)
diff --git a/meta/recipes-extended/ltp/ltp_20130904.bb b/meta/recipes-extended/ltp/ltp_20130904.bb
index cf016f9..be553df 100644
--- a/meta/recipes-extended/ltp/ltp_20130904.bb
+++ b/meta/recipes-extended/ltp/ltp_20130904.bb
@@ -23,6 +23,7 @@ DEPENDS = "attr libaio libcap acl openssl"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/ltp/LTP%20Source/ltp-${PV}/ltp-full-${PV}.tar.bz2 \
            file://fix-arm64.patch \
+           file://fix-pm-tests.patch \
            "
 
 SRC_URI[md5sum] = "0cf2ccb7199f8318d413c62a085629f0"
@@ -36,6 +37,7 @@ inherit autotools
 S = "${WORKDIR}/ltp-full-${PV}"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
+EXTRA_OECONF = " --with-power-management-testsuite --with-realtime-testsuite "
 
 do_install(){
 	install -d ${D}/opt/ltp/
-- 
1.8.3.1


