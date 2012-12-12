Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TirKU-0003Mk-2R
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 19:46:50 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 Dec 2012 10:32:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,267,1355126400"; d="scan'208";a="263101079"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.189])
	by fmsmga002.fm.intel.com with ESMTP; 12 Dec 2012 10:32:15 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Dec 2012 18:31:28 +0000
Message-Id: <715a12bfc2533b4ef29d4e8fa925b9b03feee218.1355337025.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1355337025.git.paul.eggleton@linux.intel.com>
References: <cover.1355337025.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1355337025.git.paul.eggleton@linux.intel.com>
References: <cover.1355337025.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v3 04/13] Update sanity tests to use smart instead of zypper
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
X-List-Received-Date: Wed, 12 Dec 2012 18:46:50 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/imagetest-qemu.bbclass                |    6 ++---
 .../sanity/{zypper_help => smart_help}             |   24 ++++++++++----------
 .../sanity/{zypper_search => smart_query}          |   24 ++++++++++----------
 .../scenario/qemuarm/core-image-lsb                |    4 ++--
 .../scenario/qemuarm/core-image-sato               |    4 ++--
 .../scenario/qemuarm/core-image-sato-sdk           |    4 ++--
 .../scenario/qemumips/core-image-lsb               |    4 ++--
 .../scenario/qemumips/core-image-sato              |    4 ++--
 .../scenario/qemumips/core-image-sato-sdk          |    4 ++--
 .../scenario/qemuppc/core-image-lsb                |    4 ++--
 .../scenario/qemuppc/core-image-sato               |    4 ++--
 .../scenario/qemuppc/core-image-sato-sdk           |    4 ++--
 .../scenario/qemux86-64/core-image-lsb             |    4 ++--
 .../scenario/qemux86-64/core-image-sato            |    4 ++--
 .../scenario/qemux86-64/core-image-sato-sdk        |    4 ++--
 .../scenario/qemux86/core-image-lsb                |    4 ++--
 .../scenario/qemux86/core-image-sato               |    4 ++--
 .../scenario/qemux86/core-image-sato-sdk           |    4 ++--
 .../tools/{zypper_test.sh => smart_test.sh}        |   22 +++++++++---------
 19 files changed, 68 insertions(+), 68 deletions(-)
 rename scripts/qemuimage-tests/sanity/{zypper_help => smart_help} (52%)
 rename scripts/qemuimage-tests/sanity/{zypper_search => smart_query} (50%)
 rename scripts/qemuimage-tests/tools/{zypper_test.sh => smart_test.sh} (46%)

diff --git a/meta/classes/imagetest-qemu.bbclass b/meta/classes/imagetest-qemu.bbclass
index ce20164..06ba3e3 100644
--- a/meta/classes/imagetest-qemu.bbclass
+++ b/meta/classes/imagetest-qemu.bbclass
@@ -86,10 +86,10 @@ def qemuimagetest_main(d):
         for test in list:
             (scen, case, fullpath) = test
 
-            """Skip rpm/zypper if package_rpm not set for PACKAGE_CLASSES"""
-            if case.find("zypper") != -1 or case.find("rpm") != -1:
+            """Skip rpm/smart if package_rpm not set for PACKAGE_CLASSES"""
+            if case.find("smart") != -1 or case.find("rpm") != -1:
                 if d.getVar("PACKAGE_CLASSES", True).find("rpm", 0, 11) == -1:
-                    bb.note("skip rpm/zypper cases since package_rpm not set in PACKAGE_CLASSES")
+                    bb.note("skip rpm/smart cases since package_rpm not set in PACKAGE_CLASSES")
                     continue
                 else:
                     final_list.append((scen, case, fullpath))
diff --git a/scripts/qemuimage-tests/sanity/zypper_help b/scripts/qemuimage-tests/sanity/smart_help
similarity index 52%
rename from scripts/qemuimage-tests/sanity/zypper_help
rename to scripts/qemuimage-tests/sanity/smart_help
index 94f82c4..0eeac26 100755
--- a/scripts/qemuimage-tests/sanity/zypper_help
+++ b/scripts/qemuimage-tests/sanity/smart_help
@@ -1,7 +1,7 @@
 #!/bin/bash
-# Zypper Check Test Case for Sanity Test
+# Smart Check Test Case for Sanity Test
 # The case boot up the Qemu target with `runqemu qemuxxx`.
-# Then check if zypper command can work in target.
+# Then check if smart command can work in target.
 #
 # Author: Jiajun Xu <jiajun.xu@intel.com>
 #
@@ -26,13 +26,13 @@ else
 	RET=1
 fi
 
-# Check if zypper help can work in target
-if [ $RET -eq 0 -a -f $TOOLS/zypper_test.sh ]; then
-	# Copy zypper_test.sh into target
-	Test_Target_Pre ${TARGET_IPADDR} $TOOLS/zypper_test.sh
+# Check if smart --help can work in target
+if [ $RET -eq 0 -a -f $TOOLS/smart_test.sh ]; then
+	# Copy smart_test.sh into target
+	Test_Target_Pre ${TARGET_IPADDR} $TOOLS/smart_test.sh
 	if [ $? -eq 0 ]; then
-		# Run zypper_test.sh to check if zypper help can work in target
-		Test_SSH ${TARGET_IPADDR} "sh $TARGET_TEST_DIR/zypper_test.sh help"
+		# Run smart_test.sh to check if smart --help can work in target
+		Test_SSH ${TARGET_IPADDR} "sh $TARGET_TEST_DIR/smart_test.sh --help"
 		RET=$?
 	else
 		RET=1
@@ -40,13 +40,13 @@ if [ $RET -eq 0 -a -f $TOOLS/zypper_test.sh ]; then
 fi
 
 if [ ${RET} -eq 0 ]; then
-	Test_Info "zypper help Test PASS"
+	Test_Info "smart --help Test PASS"
 	Test_Kill_Qemu
-	Test_Print_Result "zypper_help" 0
+	Test_Print_Result "smart_help" 0
 	exit 0
 else
-	Test_Info "zypper help FAIL, Pls. check above error log"
+	Test_Info "smart --help FAIL, Pls. check above error log"
 	Test_Kill_Qemu
-	Test_Print_Result "zypper_help" 1
+	Test_Print_Result "smart_help" 1
 	exit 1
 fi
diff --git a/scripts/qemuimage-tests/sanity/zypper_search b/scripts/qemuimage-tests/sanity/smart_query
similarity index 50%
rename from scripts/qemuimage-tests/sanity/zypper_search
rename to scripts/qemuimage-tests/sanity/smart_query
index e687ead..779ee63 100755
--- a/scripts/qemuimage-tests/sanity/zypper_search
+++ b/scripts/qemuimage-tests/sanity/smart_query
@@ -1,7 +1,7 @@
 #!/bin/bash
-# Zypper Check Test Case for Sanity Test
+# Smart Check Test Case for Sanity Test
 # The case boot up the Qemu target with `runqemu qemuxxx`.
-# Then check if zypper command can work in target.
+# Then check if smart command can work in target.
 #
 # Author: Jiajun Xu <jiajun.xu@intel.com>
 #
@@ -26,13 +26,13 @@ else
 	RET=1
 fi
 
-# Check if zypper search can work in target
-if [ $RET -eq 0 -a -f $TOOLS/zypper_test.sh ]; then
-	# Copy zypper_test.sh into target
-	Test_Target_Pre ${TARGET_IPADDR} $TOOLS/zypper_test.sh
+# Check if smart query can work in target
+if [ $RET -eq 0 -a -f $TOOLS/smart_test.sh ]; then
+	# Copy smart_test.sh into target
+	Test_Target_Pre ${TARGET_IPADDR} $TOOLS/smart_test.sh
 	if [ $? -eq 0 ]; then
-		# Run zypper_test.sh to check if zypper search can work in target
-		Test_SSH ${TARGET_IPADDR} "sh $TARGET_TEST_DIR/zypper_test.sh search avahi"
+		# Run smart_test.sh to check if smart query can work in target
+		Test_SSH ${TARGET_IPADDR} "sh $TARGET_TEST_DIR/smart_test.sh query avahi*"
 		RET=$?
 	else
 		RET=1
@@ -40,13 +40,13 @@ if [ $RET -eq 0 -a -f $TOOLS/zypper_test.sh ]; then
 fi
 
 if [ ${RET} -eq 0 ]; then
-	Test_Info "zypper search package avahi Test PASS"
+	Test_Info "smart query package avahi Test PASS"
 	Test_Kill_Qemu
-	Test_Print_Result "zypper_search" 0
+	Test_Print_Result "smart_query" 0
 	exit 0
 else
-	Test_Info "zypper search package avahi FAIL, Pls. check above error log"
+	Test_Info "smart query package avahi FAIL, Pls. check above error log"
 	Test_Kill_Qemu
-	Test_Print_Result "zypper_search" 1
+	Test_Print_Result "smart_query" 1
 	exit 1
 fi
diff --git a/scripts/qemuimage-tests/scenario/qemuarm/core-image-lsb b/scripts/qemuimage-tests/scenario/qemuarm/core-image-lsb
index 4fa6068..c0fff0e 100644
--- a/scripts/qemuimage-tests/scenario/qemuarm/core-image-lsb
+++ b/scripts/qemuimage-tests/scenario/qemuarm/core-image-lsb
@@ -1,7 +1,7 @@
 sanity ssh
 sanity scp
 sanity dmesg
-sanity zypper_help
-sanity zypper_search
+sanity smart_help
+sanity smart_query
 sanity rpm_query
 sanity shutdown
diff --git a/scripts/qemuimage-tests/scenario/qemuarm/core-image-sato b/scripts/qemuimage-tests/scenario/qemuarm/core-image-sato
index 0e79703..1ddcab4 100644
--- a/scripts/qemuimage-tests/scenario/qemuarm/core-image-sato
+++ b/scripts/qemuimage-tests/scenario/qemuarm/core-image-sato
@@ -1,8 +1,8 @@
 sanity ssh
 sanity scp
 sanity dmesg
-sanity zypper_help
-sanity zypper_search
+sanity smart_help
+sanity smart_query
 sanity rpm_query
 sanity connman
 sanity shutdown
diff --git a/scripts/qemuimage-tests/scenario/qemuarm/core-image-sato-sdk b/scripts/qemuimage-tests/scenario/qemuarm/core-image-sato-sdk
index 726842c..50d7ad0 100644
--- a/scripts/qemuimage-tests/scenario/qemuarm/core-image-sato-sdk
+++ b/scripts/qemuimage-tests/scenario/qemuarm/core-image-sato-sdk
@@ -1,8 +1,8 @@
 sanity ssh
 sanity scp
 sanity dmesg
-sanity zypper_help
-sanity zypper_search
+sanity smart_help
+sanity smart_query
 sanity rpm_query
 sanity compiler
 sanity connman
diff --git a/scripts/qemuimage-tests/scenario/qemumips/core-image-lsb b/scripts/qemuimage-tests/scenario/qemumips/core-image-lsb
index 4fa6068..c0fff0e 100644
--- a/scripts/qemuimage-tests/scenario/qemumips/core-image-lsb
+++ b/scripts/qemuimage-tests/scenario/qemumips/core-image-lsb
@@ -1,7 +1,7 @@
 sanity ssh
 sanity scp
 sanity dmesg
-sanity zypper_help
-sanity zypper_search
+sanity smart_help
+sanity smart_query
 sanity rpm_query
 sanity shutdown
diff --git a/scripts/qemuimage-tests/scenario/qemumips/core-image-sato b/scripts/qemuimage-tests/scenario/qemumips/core-image-sato
index 0e79703..1ddcab4 100644
--- a/scripts/qemuimage-tests/scenario/qemumips/core-image-sato
+++ b/scripts/qemuimage-tests/scenario/qemumips/core-image-sato
@@ -1,8 +1,8 @@
 sanity ssh
 sanity scp
 sanity dmesg
-sanity zypper_help
-sanity zypper_search
+sanity smart_help
+sanity smart_query
 sanity rpm_query
 sanity connman
 sanity shutdown
diff --git a/scripts/qemuimage-tests/scenario/qemumips/core-image-sato-sdk b/scripts/qemuimage-tests/scenario/qemumips/core-image-sato-sdk
index 726842c..50d7ad0 100644
--- a/scripts/qemuimage-tests/scenario/qemumips/core-image-sato-sdk
+++ b/scripts/qemuimage-tests/scenario/qemumips/core-image-sato-sdk
@@ -1,8 +1,8 @@
 sanity ssh
 sanity scp
 sanity dmesg
-sanity zypper_help
-sanity zypper_search
+sanity smart_help
+sanity smart_query
 sanity rpm_query
 sanity compiler
 sanity connman
diff --git a/scripts/qemuimage-tests/scenario/qemuppc/core-image-lsb b/scripts/qemuimage-tests/scenario/qemuppc/core-image-lsb
index 4fa6068..c0fff0e 100644
--- a/scripts/qemuimage-tests/scenario/qemuppc/core-image-lsb
+++ b/scripts/qemuimage-tests/scenario/qemuppc/core-image-lsb
@@ -1,7 +1,7 @@
 sanity ssh
 sanity scp
 sanity dmesg
-sanity zypper_help
-sanity zypper_search
+sanity smart_help
+sanity smart_query
 sanity rpm_query
 sanity shutdown
diff --git a/scripts/qemuimage-tests/scenario/qemuppc/core-image-sato b/scripts/qemuimage-tests/scenario/qemuppc/core-image-sato
index 0e79703..1ddcab4 100644
--- a/scripts/qemuimage-tests/scenario/qemuppc/core-image-sato
+++ b/scripts/qemuimage-tests/scenario/qemuppc/core-image-sato
@@ -1,8 +1,8 @@
 sanity ssh
 sanity scp
 sanity dmesg
-sanity zypper_help
-sanity zypper_search
+sanity smart_help
+sanity smart_query
 sanity rpm_query
 sanity connman
 sanity shutdown
diff --git a/scripts/qemuimage-tests/scenario/qemuppc/core-image-sato-sdk b/scripts/qemuimage-tests/scenario/qemuppc/core-image-sato-sdk
index 726842c..50d7ad0 100644
--- a/scripts/qemuimage-tests/scenario/qemuppc/core-image-sato-sdk
+++ b/scripts/qemuimage-tests/scenario/qemuppc/core-image-sato-sdk
@@ -1,8 +1,8 @@
 sanity ssh
 sanity scp
 sanity dmesg
-sanity zypper_help
-sanity zypper_search
+sanity smart_help
+sanity smart_query
 sanity rpm_query
 sanity compiler
 sanity connman
diff --git a/scripts/qemuimage-tests/scenario/qemux86-64/core-image-lsb b/scripts/qemuimage-tests/scenario/qemux86-64/core-image-lsb
index 4fa6068..c0fff0e 100644
--- a/scripts/qemuimage-tests/scenario/qemux86-64/core-image-lsb
+++ b/scripts/qemuimage-tests/scenario/qemux86-64/core-image-lsb
@@ -1,7 +1,7 @@
 sanity ssh
 sanity scp
 sanity dmesg
-sanity zypper_help
-sanity zypper_search
+sanity smart_help
+sanity smart_query
 sanity rpm_query
 sanity shutdown
diff --git a/scripts/qemuimage-tests/scenario/qemux86-64/core-image-sato b/scripts/qemuimage-tests/scenario/qemux86-64/core-image-sato
index 0e79703..1ddcab4 100644
--- a/scripts/qemuimage-tests/scenario/qemux86-64/core-image-sato
+++ b/scripts/qemuimage-tests/scenario/qemux86-64/core-image-sato
@@ -1,8 +1,8 @@
 sanity ssh
 sanity scp
 sanity dmesg
-sanity zypper_help
-sanity zypper_search
+sanity smart_help
+sanity smart_query
 sanity rpm_query
 sanity connman
 sanity shutdown
diff --git a/scripts/qemuimage-tests/scenario/qemux86-64/core-image-sato-sdk b/scripts/qemuimage-tests/scenario/qemux86-64/core-image-sato-sdk
index 726842c..50d7ad0 100644
--- a/scripts/qemuimage-tests/scenario/qemux86-64/core-image-sato-sdk
+++ b/scripts/qemuimage-tests/scenario/qemux86-64/core-image-sato-sdk
@@ -1,8 +1,8 @@
 sanity ssh
 sanity scp
 sanity dmesg
-sanity zypper_help
-sanity zypper_search
+sanity smart_help
+sanity smart_query
 sanity rpm_query
 sanity compiler
 sanity connman
diff --git a/scripts/qemuimage-tests/scenario/qemux86/core-image-lsb b/scripts/qemuimage-tests/scenario/qemux86/core-image-lsb
index 4fa6068..c0fff0e 100644
--- a/scripts/qemuimage-tests/scenario/qemux86/core-image-lsb
+++ b/scripts/qemuimage-tests/scenario/qemux86/core-image-lsb
@@ -1,7 +1,7 @@
 sanity ssh
 sanity scp
 sanity dmesg
-sanity zypper_help
-sanity zypper_search
+sanity smart_help
+sanity smart_query
 sanity rpm_query
 sanity shutdown
diff --git a/scripts/qemuimage-tests/scenario/qemux86/core-image-sato b/scripts/qemuimage-tests/scenario/qemux86/core-image-sato
index 0e79703..1ddcab4 100644
--- a/scripts/qemuimage-tests/scenario/qemux86/core-image-sato
+++ b/scripts/qemuimage-tests/scenario/qemux86/core-image-sato
@@ -1,8 +1,8 @@
 sanity ssh
 sanity scp
 sanity dmesg
-sanity zypper_help
-sanity zypper_search
+sanity smart_help
+sanity smart_query
 sanity rpm_query
 sanity connman
 sanity shutdown
diff --git a/scripts/qemuimage-tests/scenario/qemux86/core-image-sato-sdk b/scripts/qemuimage-tests/scenario/qemux86/core-image-sato-sdk
index 726842c..50d7ad0 100644
--- a/scripts/qemuimage-tests/scenario/qemux86/core-image-sato-sdk
+++ b/scripts/qemuimage-tests/scenario/qemux86/core-image-sato-sdk
@@ -1,8 +1,8 @@
 sanity ssh
 sanity scp
 sanity dmesg
-sanity zypper_help
-sanity zypper_search
+sanity smart_help
+sanity smart_query
 sanity rpm_query
 sanity compiler
 sanity connman
diff --git a/scripts/qemuimage-tests/tools/zypper_test.sh b/scripts/qemuimage-tests/tools/smart_test.sh
similarity index 46%
rename from scripts/qemuimage-tests/tools/zypper_test.sh
rename to scripts/qemuimage-tests/tools/smart_test.sh
index 5e8e7aa..f278a25 100644
--- a/scripts/qemuimage-tests/tools/zypper_test.sh
+++ b/scripts/qemuimage-tests/tools/smart_test.sh
@@ -1,5 +1,5 @@
 #!/bin/bash
-# zypper test script running in target
+# smart test script running in target
 #
 # Author: Jiajun Xu <jiajun.xu@intel.com>
 #
@@ -14,32 +14,32 @@ Target_Info()
 
 Target_Err()
 {
-	echo -e "\tTARGET: zypper command has issue when running, Pls. check the error log"
+	echo -e "\tTARGET: smart command has issue when running, Pls. check the error log"
 	echo -e "\tTARGET: ##### Error Log #####"
 	$1
 	echo -e "\tTARGET: #####    End    #####"
 }
 
-which zypper
+which smart
 if [ $? -ne 0 ]; then
-	Target_Info "No zypper command found"
+	Target_Info "No smart command found"
 	exit 1
 fi
 
-if [ zypper > /dev/null 2>&1 ]; then
-	Target_Info "zypper command run without problem"
+if [ smart > /dev/null 2>&1 ]; then
+	Target_Info "smart command run without problem"
 else
-	Target_Err zypper
+	Target_Err smart
 	exit 1
 fi
 
-# run zypper with specific command parsed to zypper_test.sh
-zypper $* > /dev/null 2>&1
+# run smart with specific command parsed to smart_test.sh
+smart $* > /dev/null 2>&1
 
 if [ $? -eq 0 ]; then
-	Target_Info "zypper $* work without problem"
+	Target_Info "smart $* work without problem"
 	exit 0
 else
-	Target_Err zypper $*
+	Target_Err "smart $*"
 	exit 1
 fi
-- 
1.7.10.4



