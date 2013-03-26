Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UKTUC-0006uN-LW
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 14:00:23 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 26 Mar 2013 05:43:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,911,1355126400"; d="scan'208";a="276100092"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.191])
	by azsmga001.ch.intel.com with ESMTP; 26 Mar 2013 05:43:09 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Mar 2013 12:43:05 +0000
Message-Id: <d83fc1249f83f8ffd7fa356ace6590751661c14c.1364301448.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1364301448.git.paul.eggleton@linux.intel.com>
References: <cover.1364301448.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1364301448.git.paul.eggleton@linux.intel.com>
References: <cover.1364301448.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] qemuimagetest: collect and print runqemu output
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
X-List-Received-Date: Tue, 26 Mar 2013 13:00:25 -0000

If runqemu (or qemu itself) fails we need to know why, so tee out to a
log file and print it when we can't find the qemu process or determine
its IP address.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/imagetest-qemu.bbclass |    1 +
 scripts/qemuimage-testlib           |   10 ++++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/classes/imagetest-qemu.bbclass b/meta/classes/imagetest-qemu.bbclass
index 0d18f06..63ba087 100644
--- a/meta/classes/imagetest-qemu.bbclass
+++ b/meta/classes/imagetest-qemu.bbclass
@@ -74,6 +74,7 @@ def qemuimagetest_main(d):
         os.environ["TARGET_IPSAVE"] = d.getVar("TARGET_IPSAVE", True)
         os.environ["TEST_SERIALIZE"] = d.getVar("TEST_SERIALIZE", True)
         os.environ["SDK_NAME"] = d.getVar("SDK_NAME", True)
+        os.environ["RUNQEMU_LOGFILE"] = d.expand("${T}/log.runqemutest.%s" % os.getpid())
 
         # Add in all variables from the user's original environment which
         # haven't subsequntly been set/changed
diff --git a/scripts/qemuimage-testlib b/scripts/qemuimage-testlib
index 6377c7f..a800f68 100755
--- a/scripts/qemuimage-testlib
+++ b/scripts/qemuimage-testlib
@@ -408,8 +408,8 @@ Test_Create_Qemu()
 		export MACHINE=$QEMUARCH
 
 		# Create Qemu in localhost VNC Port 1
-		echo "Running xterm -display ${DISPLAY} -e 'OE_TMPDIR=${OE_TMPDIR} ${RUNQEMU} ${KERNEL} ${TEST_ROOTFS_IMAGE} || /bin/sleep 60' &"
-		xterm -display ${DISPLAY} -e "OE_TMPDIR=${OE_TMPDIR} ${RUNQEMU} ${KERNEL} ${TEST_ROOTFS_IMAGE} || /bin/sleep 60" &
+		echo "Running xterm -display ${DISPLAY} -e 'OE_TMPDIR=${OE_TMPDIR} ${RUNQEMU} ${KERNEL} ${TEST_ROOTFS_IMAGE} | tee ${RUNQEMU_LOGFILE} || /bin/sleep 60' &"
+		xterm -display ${DISPLAY} -e "OE_TMPDIR=${OE_TMPDIR} ${RUNQEMU} ${KERNEL} ${TEST_ROOTFS_IMAGE} | tee ${RUNQEMU_LOGFILE} || /bin/sleep 60" &
 	
 		# Get the pid of the xterm processor, which will be used in Test_Kill_Qemu
 		XTERMPID=$!
@@ -436,6 +436,9 @@ Test_Create_Qemu()
 		Test_Info "No qemu process appeared to start, exiting"
 		ps axww -O ppid
 		Test_Info "Process list dumped for debugging purposes"
+		Test_Info "runqemu output log:"
+		cat ${RUNQEMU_LOGFILE}
+		echo
 		return 1
 	fi
 
@@ -446,6 +449,9 @@ Test_Create_Qemu()
 		Test_Info "There is no qemu process or qemu ip address found, return failed"
 		ps -wwf
 		ps axww -O ppid
+		Test_Info "runqemu output log:"
+		cat ${RUNQEMU_LOGFILE}
+		echo
 		return 1
 	fi
 
-- 
1.7.10.4



