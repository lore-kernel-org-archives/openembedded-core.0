Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QHPJg-0001zz-3I
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 01:47:44 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 May 2011 16:45:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,312,1301900400"; d="scan'208";a="637467296"
Received: from unknown (HELO localhost) ([10.255.13.11])
	by orsmga002.jf.intel.com with ESMTP; 03 May 2011 16:45:04 -0700
Message-Id: <acc901962b11bae08f220d4fe680f121c45817a0.1304465724.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304465724.git.sgw@linux.intel.com>
References: <cover.1304465724.git.sgw@linux.intel.com>
Old-Date: Tue, 3 May 2011 10:07:30 +0800
Date: Tue, 03 May 2011 16:45:04 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Xiaofeng Yan <xiaofeng.yan@windriver.com>, Ilya Yanok <yanok@emcraft.com>,
	Darren Hart <dvhart@linux.intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>, Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 33/33] qemuimagetest: Enable toolchain automation tests in qemuimagetest
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
X-List-Received-Date: Tue, 03 May 2011 23:47:44 -0000

From: Jiajun Xu <jiajun.xu@intel.com>

Enable toolchain automation tests in qemuimagetest framework. 3 C/C++ test
projects are added to test toolchain - cvs, iptables and sudoku-savant. User
needs to set TEST_SCEN to "toolchain" in local.conf to enable tests. Test case
will check if toolchain tarball exists under "${DEPLOY_DIR}/sdk". And it will
extract toolchain tarball into /opt. It requires user to chown /opt to non-root
user, who will run qemuimagetest.

Signed-off-by Jiajun Xu <jiajun.xu@intel.com>
---
 meta/classes/imagetest-qemu.bbclass                |    9 +-
 meta/conf/local.conf.sample                        |    2 +-
 meta/recipes-core/meta/meta-toolchain.bb           |    3 +-
 scripts/qemuimage-testlib                          |  232 +++++++++++++++++++-
 .../scenario/qemuarm/meta-toolchain-gmae           |    3 +
 .../scenario/qemumips/meta-toolchain-gmae          |    3 +
 .../scenario/qemuppc/meta-toolchain-gmae           |    3 +
 .../scenario/qemux86-64/meta-toolchain-gmae        |    3 +
 .../scenario/qemux86/meta-toolchain-gmae           |    3 +
 scripts/qemuimage-tests/toolchain/cvs              |   31 +++
 scripts/qemuimage-tests/toolchain/iptables         |   31 +++
 scripts/qemuimage-tests/toolchain/sudoku-savant    |   31 +++
 12 files changed, 349 insertions(+), 5 deletions(-)
 create mode 100644 scripts/qemuimage-tests/scenario/qemuarm/meta-toolchain-gmae
 create mode 100644 scripts/qemuimage-tests/scenario/qemumips/meta-toolchain-gmae
 create mode 100644 scripts/qemuimage-tests/scenario/qemuppc/meta-toolchain-gmae
 create mode 100644 scripts/qemuimage-tests/scenario/qemux86-64/meta-toolchain-gmae
 create mode 100644 scripts/qemuimage-tests/scenario/qemux86/meta-toolchain-gmae
 create mode 100644 scripts/qemuimage-tests/toolchain/cvs
 create mode 100644 scripts/qemuimage-tests/toolchain/iptables
 create mode 100644 scripts/qemuimage-tests/toolchain/sudoku-savant

diff --git a/meta/classes/imagetest-qemu.bbclass b/meta/classes/imagetest-qemu.bbclass
index daeb8d8..e259ae9 100644
--- a/meta/classes/imagetest-qemu.bbclass
+++ b/meta/classes/imagetest-qemu.bbclass
@@ -27,6 +27,7 @@ def qemuimagetest_main(d):
     import sys
     import re
     import os
+    import shutil
     
     """
     Test Controller for automated testing.
@@ -72,6 +73,7 @@ def qemuimagetest_main(d):
         os.environ["TEST_STATUS"] = bb.data.getVar("TEST_STATUS", d, True)
         os.environ["TARGET_IPSAVE"] = bb.data.getVar("TARGET_IPSAVE", d, True)
         os.environ["TEST_SERIALIZE"] = bb.data.getVar("TEST_SERIALIZE", d, True)
+        os.environ["SDK_NAME"] = bb.data.getVar("SDK_NAME", d, True)
 
         """run Test Case"""
         bb.note("Run %s test in scenario %s" % (case, scen))
@@ -120,7 +122,10 @@ def qemuimagetest_main(d):
         if os.path.isdir(tmppath):
             for f in os.listdir(tmppath):
                 tmpfile = os.path.join(tmppath, f)
-                os.remove(tmpfile)
+		if os.path.isfile(tmpfile):
+                    os.remove(tmpfile)
+                elif os.path.isdir(tmpfile):
+                    shutil.rmtree(tmpfile, True)
 
     """Before running testing, clean temp folder first"""
     clean_tmp()
@@ -154,7 +159,7 @@ def qemuimagetest_main(d):
     os.system("touch %s" % resultfile)
     os.symlink(resultfile, sresultfile)
     f = open(sresultfile, "a")
-    f.write("\tTest Result for %s\n" % machine)
+    f.write("\tTest Result for %s %s\n" % (machine, pname))
     f.write("\t%-15s%-15s%-15s%-15s\n" % ("Testcase", "PASS", "FAIL", "NORESULT"))
     f.close()
     
diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index ba92df8..cf7f33f 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -145,7 +145,7 @@ ENABLE_BINARY_LOCALE_GENERATION = "1"
 # By default test cases in sanity suite will be ran. If you want to run other 
 # test suite or specific test case(e.g. bat or boot test case under sanity suite), 
 # list them like following.
-#TEST_SCEN = "sanity bat sanity:boot"
+#TEST_SCEN = "sanity bat sanity:boot toolchain"
 
 #Because of the QEMU booting slowness issue(see bug #646 and #618), autobuilder
 #may suffer a timeout issue when running sanity test. We introduce variable
diff --git a/meta/recipes-core/meta/meta-toolchain.bb b/meta/recipes-core/meta/meta-toolchain.bb
index 94c8a91..ab98bf9 100644
--- a/meta/recipes-core/meta/meta-toolchain.bb
+++ b/meta/recipes-core/meta/meta-toolchain.bb
@@ -6,6 +6,7 @@ PR = "r4"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-inherit populate_sdk
+IMAGETEST ?= "dummy"
+inherit populate_sdk imagetest-${IMAGETEST}
 
 CONFIG_SITE := "${@siteinfo_get_files(d)}"
diff --git a/scripts/qemuimage-testlib b/scripts/qemuimage-testlib
index 5318ca6..c39fb7a 100644
--- a/scripts/qemuimage-testlib
+++ b/scripts/qemuimage-testlib
@@ -19,6 +19,9 @@ TYPE="ext3"
 # The folder to hold all scripts running on targets
 TOOLS="$COREBASE/scripts/qemuimage-tests/tools"
 
+# The folder to hold all projects for toolchain testing
+TOOLCHAIN_PROJECTS="$COREBASE/scripts/qemuimage-tests/toolchain_projects"
+
 # Test Directory on target for testing
 TARGET_TEST_DIR="/opt/test"
 
@@ -28,6 +31,24 @@ PID=0
 # Global variable for target ip address
 TARGET_IPADDR=0
 
+# Global variable for test project version during toolchain test
+# Version of cvs is 1.11.23
+# Version of iptables is 1.4.9
+# Version of sudoku-savant is 1.3
+PROJECT_PV=0
+
+# Global variable for test project download URL during toolchain test
+# URL of cvs is http://ftp.gnu.org/non-gnu/cvs/source/stable/1.11.23/cvs-1.11.23.tar.bz2
+# URL of iptables is http://netfilter.org/projects/iptables/files/iptables-1.4.9.tar.bz2
+# URL of sudoku-savant is http://downloads.sourceforge.net/project/sudoku-savant/sudoku-savant/sudoku-savant-1.3/sudoku-savant-1.3.tar.bz2
+PROJECT_DOWNLOAD_URL=0
+
+# SDK folder to hold toolchain tarball
+TOOLCHAIN_DIR="${DEPLOY_DIR}/sdk"
+
+# Toolchain test folder to hold extracted toolchain tarball
+TOOLCHAIN_TEST="/opt"
+
 # common function for information print
 Test_Error()
 {
@@ -400,7 +421,7 @@ Test_Create_Qemu()
 		RUNQEMU=`which runqemu`
 	else
 		Test_Error "Can not find runqemu in \$PATH, return fail"
-		exit 1
+		return 1
 	fi
 	
 	if [ "$QEMUARCH" = "qemux86" -o "$QEMUARCH" = "qemux86-64" ]; then
@@ -499,3 +520,212 @@ Test_Create_Qemu()
 		return $ret
 	fi
 }
+
+# Function to prepare test project for toolchain test
+# $1 is the folder holding test project file
+# $2 is the test project name
+Test_Project_Prepare()
+{
+	local toolchain_dir=$1
+	local ret=1
+
+	if [ ! -d ${toolchain_dir} ]; then
+		mkdir -p ${toolchain_dir}
+		ret=$?
+
+		if [ $ret -ne 0 ]; then
+			Test_Info "Create ${toolchain_dir} fail, return"
+			return $ret
+		fi
+	fi
+
+	ret=0
+	# Download test project tarball if it does not exist
+	if [ ! -f ${toolchain_dir}/${2}-${PROJECT_PV}.${suffix} ]; then
+		wget -c -t 5 $PROJECT_DOWNLOAD_URL -O ${toolchain_dir}/${2}-${PROJECT_PV}.${suffix}
+		ret=$?
+	fi
+
+	# Extract the test project into ${TEST_TMP}
+	if [ $ret -eq 0 ]; then
+		tar jxf ${toolchain_dir}/${2}-${PROJECT_PV}.${suffix} -C ${TEST_TMP}
+		ret=$?
+		if [ $ret -eq 0 ]; then
+			Test_Info "Extract ${2}-${PROJECT_PV}.${suffix} into ${TEST_TMP} successfully"
+			return $ret
+		else
+			Test_Info "Fail to extract ${2}-${PROJECT_PV}.${suffix} into ${TEST_TMP}"
+			return $ret
+		fi
+	else
+		Test_Info "Fail to download ${2}-${PROJECT_PV}.${suffix} from $PROJECT_DOWNLOAD_URL"
+		rm -rf ${toolchain_dir}/${2}-${PROJECT_PV}.${suffix}
+		return $ret
+	fi
+}
+
+# Function to prepare toolchain environment
+# $1 is toolchain directory to hold toolchain tarball
+# $2 is prefix name for toolchain tarball
+Test_Toolchain_Prepare()
+{
+	local toolchain_dir=$1
+	local sdk_name=$2
+	local ret=1
+
+	if [ ! -d ${toolchain_dir} ]; then
+		Test_Info "No directory ${toolchain_dir}, which holds toolchain tarballs"
+		return 1
+	fi
+
+	# Check if there is any toolchain tarball under $toolchain_dir with prefix $sdk_name
+	for i in `dir ${toolchain_dir}`
+	do
+		echo $i | grep "${sdk_name}-toolchain-gmae"
+		if [ $? -eq 0 ]; then
+			rm -rf ${TEST_TMP}/opt
+			tar jxf ${toolchain_dir}/${i} -C ${TEST_TMP}
+			ret=$?
+			break
+		fi
+	done
+
+	if [ $ret -eq 0 ]; then
+		Test_Info "Check if /opt is accessible for non-root user"
+
+		# Check if the non-root test user has write access of $TOOLCHAIN_TEST
+		if [ -d ${TOOLCHAIN_TEST} ]; then
+			touch ${TOOLCHAIN_TEST}
+			if [ $? -ne 0 ]; then
+				Test_Info "Has no right to modify folder $TOOLCHAIN_TEST, pls. chown it to test user"
+				return 2
+			fi
+		else
+			mkdir -p ${TOOLCHAIN_TEST}
+			if [ $? -ne 0 ]; then
+				Test_Info "Has no right to create folder $TOOLCHAIN_TEST, pls. create it and chown it to test user"
+				return 2
+			fi
+		fi
+
+		# If there is a toolchain folder under $TOOLCHAIN_TEST, let's remove it
+		if [ -d ${TOOLCHAIN_TEST}/poky ]; then
+			rm -rf ${TOOLCHAIN_TEST}/poky
+		fi
+
+		# Copy toolchain into $TOOLCHAIN_TEST
+		cp -r ${TEST_TMP}/opt/poky ${TOOLCHAIN_TEST}
+		ret=$?
+
+		if [ $ret -eq 0 ]; then
+			Test_Info "Successfully copy toolchain into $TOOLCHAIN_TEST"
+			return $ret
+		else
+			Test_Info "Meet error when copy toolchain into $TOOLCHAIN_TEST"
+			return $ret
+		fi
+	else
+		Test_Info "No tarball named ${sdk_name}-toolchain-gmae under ${toolchain_dir}"
+		return $ret
+	fi
+}
+
+# Function to execute command and exit if run out of time
+# $1 is timeout value
+# $2 is the command to be executed
+Test_Time_Out()
+{
+	local timeout=$1
+	shift
+	local command=$*
+	local date=0
+	local tmp=`mktemp`
+	local ret=1
+
+	# Run command in background
+	($command; echo $? > $tmp) &
+	while ps -e -o pid | grep -qw $!; do
+		if [ $date -ge $timeout ]; then
+			Test_Info "$timeout Timeout when running command $command"
+			rm -rf $tmp
+			return 1
+		fi
+		sleep 5
+		date=`expr $date + 5`
+	done
+	ret=`cat $tmp`
+	rm -rf $tmp
+	return $ret
+}
+
+# Function to test toolchain
+# $1 is test project name
+# $2 is the timeout value
+Test_Toolchain()
+{
+	local test_project=$1
+	local timeout=$2
+	local ret=1
+	local suffix="tar.bz2"
+	local env_setup=""
+	local pro_install="${TEST_TMP}/pro_install"
+
+	# Set value for PROJECT_PV and PROJECT_DOWNLOAD_URL accordingly
+	if [ $test_project == "cvs" ]; then
+		PROJECT_PV=1.11.23
+		PROJECT_DOWNLOAD_URL="http://ftp.gnu.org/non-gnu/cvs/source/stable/1.11.23/cvs-1.11.23.tar.bz2"
+	elif [ $test_project == "iptables" ]; then
+		PROJECT_PV=1.4.9
+		PROJECT_DOWNLOAD_URL="http://netfilter.org/projects/iptables/files/iptables-1.4.9.tar.bz2"
+	elif [ $test_project == "sudoku-savant" ]; then
+		PROJECT_PV=1.3
+		PROJECT_DOWNLOAD_URL="http://downloads.sourceforge.net/project/sudoku-savant/sudoku-savant/sudoku-savant-1.3/sudoku-savant-1.3.tar.bz2"
+	else
+		Test_Info "Unknown test project name $test_project"
+		return 1
+	fi
+
+	# Download test project and extract it
+	Test_Project_Prepare $TOOLCHAIN_PROJECTS $test_project
+	if [ $? -ne 0 ]; then
+		Test_Info "Prepare test project file failed"
+		return 1
+	fi
+
+	# Extract toolchain tarball into ${TEST_TMP}
+	Test_Toolchain_Prepare $TOOLCHAIN_DIR $SDK_NAME
+	ret=$?
+	if [ $ret -ne 0 ]; then
+		Test_Info "Prepare toolchain test environment failed"
+		return $ret
+	fi
+
+	if [ ! -d ${pro_install} ]; then
+		mkdir -p ${pro_install}
+	fi
+
+	# Begin to build test project in toolchain environment
+	env_setup=`find ${TOOLCHAIN_TEST}/poky -name "environment-setup*"`
+
+	source $env_setup
+
+	if [ $test_project == "cvs" -o $test_project == "iptables" ]; then
+		cd ${TEST_TMP}/${test_project}-${PROJECT_PV}
+		Test_Time_Out $timeout ./configure ${CONFIGURE_FLAGS} || { Test_Info "configure failed with $test_project"; return 1; }
+		Test_Time_Out $timeout make -j4 || { Test_Info "make failed with $test_project"; return 1; }
+		Test_Time_Out $timeout make install DESTDIR=${pro_install} || { Test_Info "make failed with $test_project"; return 1; }
+		cd -
+		ret=0
+	elif [ $test_project == "sudoku-savant" ]; then
+		cd ${TEST_TMP}/${test_project}-${PROJECT_PV}
+		Test_Time_Out $timeout ./configure ${CONFIGURE_FLAGS} || { Test_Info "configure failed with $test_project"; return 1; }
+		Test_Time_Out $timeout make -j4 || { Test_Info "make failed with $test_project"; return 1; }
+		cd -
+		ret=0
+	else
+		Test_Info "Unknown test project $test_project"
+		ret=1
+	fi
+
+	return $ret
+}
diff --git a/scripts/qemuimage-tests/scenario/qemuarm/meta-toolchain-gmae b/scripts/qemuimage-tests/scenario/qemuarm/meta-toolchain-gmae
new file mode 100644
index 0000000..199176e
--- /dev/null
+++ b/scripts/qemuimage-tests/scenario/qemuarm/meta-toolchain-gmae
@@ -0,0 +1,3 @@
+toolchain cvs
+toolchain iptables
+toolchain sudoku-savant
diff --git a/scripts/qemuimage-tests/scenario/qemumips/meta-toolchain-gmae b/scripts/qemuimage-tests/scenario/qemumips/meta-toolchain-gmae
new file mode 100644
index 0000000..199176e
--- /dev/null
+++ b/scripts/qemuimage-tests/scenario/qemumips/meta-toolchain-gmae
@@ -0,0 +1,3 @@
+toolchain cvs
+toolchain iptables
+toolchain sudoku-savant
diff --git a/scripts/qemuimage-tests/scenario/qemuppc/meta-toolchain-gmae b/scripts/qemuimage-tests/scenario/qemuppc/meta-toolchain-gmae
new file mode 100644
index 0000000..199176e
--- /dev/null
+++ b/scripts/qemuimage-tests/scenario/qemuppc/meta-toolchain-gmae
@@ -0,0 +1,3 @@
+toolchain cvs
+toolchain iptables
+toolchain sudoku-savant
diff --git a/scripts/qemuimage-tests/scenario/qemux86-64/meta-toolchain-gmae b/scripts/qemuimage-tests/scenario/qemux86-64/meta-toolchain-gmae
new file mode 100644
index 0000000..199176e
--- /dev/null
+++ b/scripts/qemuimage-tests/scenario/qemux86-64/meta-toolchain-gmae
@@ -0,0 +1,3 @@
+toolchain cvs
+toolchain iptables
+toolchain sudoku-savant
diff --git a/scripts/qemuimage-tests/scenario/qemux86/meta-toolchain-gmae b/scripts/qemuimage-tests/scenario/qemux86/meta-toolchain-gmae
new file mode 100644
index 0000000..199176e
--- /dev/null
+++ b/scripts/qemuimage-tests/scenario/qemux86/meta-toolchain-gmae
@@ -0,0 +1,3 @@
+toolchain cvs
+toolchain iptables
+toolchain sudoku-savant
diff --git a/scripts/qemuimage-tests/toolchain/cvs b/scripts/qemuimage-tests/toolchain/cvs
new file mode 100644
index 0000000..871d991
--- /dev/null
+++ b/scripts/qemuimage-tests/toolchain/cvs
@@ -0,0 +1,31 @@
+#!/bin/bash
+#
+# CVS compile Test for toolchain test
+# The case extract toolchain tarball into temp folder
+# Then compile CVS with the toolchain environment
+#
+# Author: Jiajun Xu <jiajun.xu@intel.com>
+#
+# This file is licensed under the GNU General Public License,
+# Version 2.
+#
+. $COREBASE/scripts/qemuimage-testlib
+
+TIMEOUT=120
+
+# Extract and test toolchain tarball
+Test_Toolchain cvs ${TIMEOUT}
+
+if [ $? -eq 0 ]; then
+	Test_Info "CVS Test PASS"
+	Test_Print_Result "CVS" 0
+	exit 0
+elif [ $? -eq 1 ]; then
+	Test_Info "CVS Test FAIL"
+	Test_Print_Result "CVS" 1
+	exit 1
+else
+	Test_Info "Skip CVS Test due to some configuration problem"
+	Test_Print_Result "CVS" 2
+	exit 2
+fi
diff --git a/scripts/qemuimage-tests/toolchain/iptables b/scripts/qemuimage-tests/toolchain/iptables
new file mode 100644
index 0000000..af89bbe
--- /dev/null
+++ b/scripts/qemuimage-tests/toolchain/iptables
@@ -0,0 +1,31 @@
+#!/bin/bash
+#
+# iptables compile Test for toolchain test
+# The case extract toolchain tarball into temp folder
+# Then compile iptables with the toolchain environment
+#
+# Author: Jiajun Xu <jiajun.xu@intel.com>
+#
+# This file is licensed under the GNU General Public License,
+# Version 2.
+#
+. $COREBASE/scripts/qemuimage-testlib
+
+TIMEOUT=120
+
+# Extract and test toolchain tarball
+Test_Toolchain iptables ${TIMEOUT}
+
+if [ $? -eq 0 ]; then
+	Test_Info "iptables Test PASS"
+	Test_Print_Result "iptables" 0
+	exit 0
+elif [ $? -eq 1 ]; then
+	Test_Info "iptables Test FAIL"
+	Test_Print_Result "iptables" 1
+	exit 1
+else
+	Test_Info "Skip iptables Test due to some configuration problem"
+	Test_Print_Result "iptables" 2
+	exit 2
+fi
diff --git a/scripts/qemuimage-tests/toolchain/sudoku-savant b/scripts/qemuimage-tests/toolchain/sudoku-savant
new file mode 100644
index 0000000..603afe6
--- /dev/null
+++ b/scripts/qemuimage-tests/toolchain/sudoku-savant
@@ -0,0 +1,31 @@
+#!/bin/bash
+#
+# sudoku-savant compile Test for toolchain test
+# The case extract toolchain tarball into temp folder
+# Then compile sudoku-savant with the toolchain environment
+#
+# Author: Jiajun Xu <jiajun.xu@intel.com>
+#
+# This file is licensed under the GNU General Public License,
+# Version 2.
+#
+. $COREBASE/scripts/qemuimage-testlib
+
+TIMEOUT=120
+
+# Extract and test toolchain tarball
+Test_Toolchain sudoku-savant ${TIMEOUT}
+
+if [ $? -eq 0 ]; then
+	Test_Info "sudoku-savant Test PASS"
+	Test_Print_Result "sudoku-savant" 0
+	exit 0
+elif [ $? -eq 1 ]; then
+	Test_Info "sudoku-savant Test FAIL"
+	Test_Print_Result "sudoku-savant" 1
+	exit 1
+else
+	Test_Info "Skip sudoku-savant Test due to some configuration problem"
+	Test_Print_Result "sudoku-savant" 2
+	exit 2
+fi
-- 
1.7.4.1



