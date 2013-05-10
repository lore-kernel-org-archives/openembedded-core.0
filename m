Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefanx.stanacar@intel.com>) id 1Uajnx-0003EB-4f
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 11:40:00 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 10 May 2013 02:21:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,646,1363158000"; d="scan'208";a="300376327"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 10 May 2013 02:21:50 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.149])
	by linux.intel.com (Postfix) with ESMTP id 87AC66A4087;
	Fri, 10 May 2013 02:21:40 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 May 2013 12:22:01 +0300
Message-Id: <1368177721-28945-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH] qemuimage-testlib: test all supported FSTYPES
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
X-List-Received-Date: Fri, 10 May 2013 09:40:54 -0000

Right now qemuimage-testlib hardcodes ext3 as fs type.
We should respect IMAGE_FSTYPES and boot all images
that runqemu supports.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/classes/imagetest-qemu.bbclass | 25 ++++++++++++++-----------
 scripts/qemuimage-testlib           | 21 ++++++++++-----------
 2 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/meta/classes/imagetest-qemu.bbclass b/meta/classes/imagetest-qemu.bbclass
index 94bed3b..ee1c699 100644
--- a/meta/classes/imagetest-qemu.bbclass
+++ b/meta/classes/imagetest-qemu.bbclass
@@ -37,6 +37,7 @@ def qemuimagetest_main(d):
     resultstr = re.compile(r'\s*(?P<case>\w+)\s*(?P<pass>\d+)\s*(?P<fail>\d+)\s*(?P<noresult>\d+)')
     machine = d.getVar('MACHINE', True)
     pname = d.getVar('PN', True)
+    fstypes = d.getVar("IMAGE_FSTYPES", True).split()
     
     """function to save test cases running status"""
     def teststatus(test, status, index, length):
@@ -50,7 +51,7 @@ def qemuimagetest_main(d):
         f.close()
 
     """funtion to run each case under scenario"""
-    def runtest(scen, case, fulltestpath):
+    def runtest(scen, case, fulltestpath, fstype):
         resultpath = d.getVar('TEST_RESULT', True)
         tmppath = d.getVar('TEST_TMP', True)
 
@@ -75,6 +76,7 @@ def qemuimagetest_main(d):
         os.environ["TEST_SERIALIZE"] = d.getVar("TEST_SERIALIZE", True)
         os.environ["SDK_NAME"] = d.getVar("SDK_NAME", True)
         os.environ["RUNQEMU_LOGFILE"] = d.expand("${T}/log.runqemutest.%s" % os.getpid())
+        os.environ["ROOTFS_EXT"] = fstype
 
         # Add in all variables from the user's original environment which
         # haven't subsequntly been set/changed
@@ -193,21 +195,22 @@ def qemuimagetest_main(d):
         os.remove(sresultfile)
     subprocess.call("touch %s" % resultfile, shell=True)
     os.symlink(resultfile, sresultfile)
-    f = open(sresultfile, "a")
-    f.write("\tTest Result for %s %s\n" % (machine, pname))
-    f.write("\t%-15s%-15s%-15s%-15s\n" % ("Testcase", "PASS", "FAIL", "NORESULT"))
-    f.close()
     
     """generate pre-defined testcase list"""
     testlist = d.getVar('TEST_SCEN', True)
     fulllist = generate_list(testlist)
 
     """Begin testing"""
-    for index,test in enumerate(fulllist):
-        (scen, case, fullpath) = test
-        teststatus(case, "running", index, (len(fulllist) - 1))
-        runtest(scen, case, fullpath)
-        teststatus(case, "finished", index, (len(fulllist) - 1))
+    for type in fstypes:
+        if type not in [ "tar.bz2", "live", "cpio.gz" ]:
+            with open(sresultfile, "a") as f:
+                f.write("\tTest Result for %s %s %s\n" % (machine, pname, type))
+                f.write("\t%-15s%-15s%-15s%-15s\n" % ("Testcase", "PASS", "FAIL", "NORESULT"))
+            for index,test in enumerate(fulllist):
+                (scen, case, fullpath) = test
+                teststatus(case, "running", index, (len(fulllist) - 1))
+                runtest(scen, case, fullpath, type)
+                teststatus(case, "finished", index, (len(fulllist) - 1))
     
     """Print Test Result"""
     ret = 0
@@ -230,5 +233,5 @@ def qemuimagetest_main(d):
     clean_tmp()
 
     if ret != 0:
-        raise bb.build.FuncFailed("Some testcases fail, pls. check test result and test log!!!")
+        raise bb.build.FuncFailed("Some tests failed. Please check the results file: %s and the log files found in: %s." % (resultsfile, d.getVar('TEST_LOG', True)))
 
diff --git a/scripts/qemuimage-testlib b/scripts/qemuimage-testlib
index 051fee8..4159312 100755
--- a/scripts/qemuimage-testlib
+++ b/scripts/qemuimage-testlib
@@ -14,8 +14,6 @@
 # Version 2.
 #
 
-TYPE="ext3"
-
 # The folder to hold all scripts running on targets
 TOOLS="$COREBASE/scripts/qemuimage-tests/tools"
 
@@ -306,19 +304,19 @@ Test_Find_Image()
 	extension=""
 	rootfs=""
 
-	while getopts "l:k:a:t:" Option
+	while getopts "l:k:a:t:e:" Option
 	do
 		case $Option in
 			l) where="$OPTARG"
 			   ;;
 			k) kernel="$OPTARG"
-			   extension="bin"
 			   ;;
 			a) arch="$OPTARG"
 			   ;;
 			t) target="$OPTARG"
-			   extension="ext3"
 			   ;;
+                        e) extension="$OPTARG"
+                           ;;
 			*) echo "invalid option: -$Option" && return 1
 			   ;;
 		 esac
@@ -396,11 +394,11 @@ Test_Create_Qemu()
 	fi
 	
 	if [ "$QEMUARCH" = "qemux86" -o "$QEMUARCH" = "qemux86-64" ]; then
-		KERNEL=$(Test_Find_Image -l ${DEPLOY_DIR}/images -k bzImage -a ${QEMUARCH})
+		KERNEL=$(Test_Find_Image -l ${DEPLOY_DIR}/images -k bzImage -a ${QEMUARCH} -e "bin")
 	elif [ "$QEMUARCH" = "qemuarm" -o "$QEMUARCH" = "spitz" -o "$QEMUARCH" = "borzoi" -o "$QEMUARCH" = "akita" -o "$QEMUARCH" = "nokia800" ]; then
 		KERNEL=$(Test_Find_Image -l ${DEPLOY_DIR}/images -k zImage -a ${QEMUARCH})
 	elif [ "$QEMUARCH" = "qemumips" -o "$QEMUARCH" = "qemuppc" ]; then
-		KERNEL=$(Test_Find_Image -l ${DEPLOY_DIR}/images -k vmlinux -a ${QEMUARCH})
+		KERNEL=$(Test_Find_Image -l ${DEPLOY_DIR}/images -k vmlinux -a ${QEMUARCH} -e "bin")
 	fi
 
 	# If there is no kernel image found, return failed directly
@@ -409,7 +407,8 @@ Test_Create_Qemu()
 		return 1
 	fi
 	
-	ROOTFS_IMAGE=$(Test_Find_Image -l ${DEPLOY_DIR}/images -t ${QEMUTARGET} -a ${QEMUARCH})
+        Test_Info "rootfs image extension selected: $ROOTFS_EXT"
+        ROOTFS_IMAGE=$(Test_Find_Image -l ${DEPLOY_DIR}/images -t ${QEMUTARGET} -a ${QEMUARCH} -e "$ROOTFS_EXT")
 
 	# If there is no rootfs image found, return failed directly
 	if [ $? -eq 1 ]; then
@@ -417,7 +416,7 @@ Test_Create_Qemu()
 		return 1
 	fi
 
-	TEST_ROOTFS_IMAGE="${TEST_TMP}/${QEMUTARGET}-${QEMUARCH}-test.ext3"
+	TEST_ROOTFS_IMAGE="${TEST_TMP}/${QEMUTARGET}-${QEMUARCH}-test.${ROOTFS_EXT}"
 	
 	CP=`which cp`
 
@@ -438,8 +437,8 @@ Test_Create_Qemu()
 		export MACHINE=$QEMUARCH
 
 		# Create Qemu in localhost VNC Port 1
-		echo "Running xterm -display ${DISPLAY} -e 'OE_TMPDIR=${OE_TMPDIR} ${RUNQEMU} ${KERNEL} ${TEST_ROOTFS_IMAGE} 2>&1 | tee ${RUNQEMU_LOGFILE} || /bin/sleep 60' &"
-		xterm -display ${DISPLAY} -e "OE_TMPDIR=${OE_TMPDIR} ${RUNQEMU} ${KERNEL} ${TEST_ROOTFS_IMAGE} 2>&1 | tee ${RUNQEMU_LOGFILE} || /bin/sleep 60" &
+		echo "Running xterm -display ${DISPLAY} -e 'OE_TMPDIR=${OE_TMPDIR} ${RUNQEMU} ${KERNEL} ${TEST_ROOTFS_IMAGE} ${ROOTFS_EXT} 2>&1 | tee ${RUNQEMU_LOGFILE} || /bin/sleep 60' &"
+		xterm -display ${DISPLAY} -e "OE_TMPDIR=${OE_TMPDIR} ${RUNQEMU} ${KERNEL} ${TEST_ROOTFS_IMAGE} ${ROOTFS_EXT}  2>&1 | tee ${RUNQEMU_LOGFILE} || /bin/sleep 60" &
 	
 		# Get the pid of the xterm processor, which will be used in Test_Kill_Qemu
 		XTERMPID=$!
-- 
1.8.1.4



