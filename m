Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R8w8z-0008QR-1G
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 17:33:57 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Sep 2011 08:28:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="56793346"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.159])
	by orsmga001.jf.intel.com with ESMTP; 28 Sep 2011 08:28:28 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 16:28:25 +0100
Message-Id: <938a59ea7c2bdaba573001fa7677006b81f2f51f.1317223487.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1317223487.git.paul.eggleton@linux.intel.com>
References: <cover.1317223487.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1317223487.git.paul.eggleton@linux.intel.com>
References: <cover.1317223487.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] scripts: use OE_TMPDIR instead of TMPDIR external variable
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
X-List-Received-Date: Wed, 28 Sep 2011 15:33:57 -0000

On OpenSUSE within an X session, TMPDIR is set to the system temporary
directory (/tmp) which is incorrect for these scripts. Thus, change
runqemu and oe-setup-rpmrepo to use OE_TMPDIR from the external
environment rather than TMPDIR.

Fixes [YOCTO #1530]

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/imagetest-qemu.bbclass |    2 +-
 scripts/oe-setup-rpmrepo            |    8 +++++++-
 scripts/qemuimage-testlib           |    4 ++--
 scripts/runqemu                     |    7 ++++++-
 4 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/meta/classes/imagetest-qemu.bbclass b/meta/classes/imagetest-qemu.bbclass
index 18798e0..4ea86c0 100644
--- a/meta/classes/imagetest-qemu.bbclass
+++ b/meta/classes/imagetest-qemu.bbclass
@@ -70,7 +70,7 @@ def qemuimagetest_main(d):
         os.environ["DISPLAY"] = bb.data.getVar("DISPLAY", d, True)
         os.environ["COREBASE"] = bb.data.getVar("COREBASE", d, True)
         os.environ["TOPDIR"] = bb.data.getVar("TOPDIR", d, True)
-        os.environ["TMPDIR"] = bb.data.getVar("TMPDIR", d, True)
+        os.environ["OE_TMPDIR"] = bb.data.getVar("TMPDIR", d, True)
         os.environ["TEST_STATUS"] = bb.data.getVar("TEST_STATUS", d, True)
         os.environ["TARGET_IPSAVE"] = bb.data.getVar("TARGET_IPSAVE", d, True)
         os.environ["TEST_SERIALIZE"] = bb.data.getVar("TEST_SERIALIZE", d, True)
diff --git a/scripts/oe-setup-rpmrepo b/scripts/oe-setup-rpmrepo
index 03372b6..fc2f7a8 100755
--- a/scripts/oe-setup-rpmrepo
+++ b/scripts/oe-setup-rpmrepo
@@ -17,9 +17,15 @@
 # along with this program; if not, write to the Free Software
 # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
+
+# Don't use TMPDIR from the external environment, it may be a distro
+# variable pointing to /tmp (e.g. within X on OpenSUSE)
+# Instead, use OE_TMPDIR for passing this in externally.
+TMPDIR="$OE_TMPDIR"
+
 function usage() {
 	echo "Usage: $0 <rpm-dir>"
-	echo "  <rpm-dir>: default is $TPMDIR/deploy/rpm"
+	echo "  <rpm-dir>: default is $TMPDIR/deploy/rpm"
 }
 
 if [ $# -gt 1 ]; then
diff --git a/scripts/qemuimage-testlib b/scripts/qemuimage-testlib
index 9ffaa7c..6a1b900 100644
--- a/scripts/qemuimage-testlib
+++ b/scripts/qemuimage-testlib
@@ -467,8 +467,8 @@ Test_Create_Qemu()
 		export MACHINE=$QEMUARCH
 
 		# Create Qemu in localhost VNC Port 1
-		echo "Running xterm -display ${DISPLAY} -e 'TMPDIR=${TMPDIR} ${RUNQEMU} ${KERNEL} ${TEST_ROOTFS_IMAGE} && /bin/sleep 60' &"
-	    	xterm -display ${DISPLAY} -e "TMPDIR=${TMPDIR} ${RUNQEMU} ${KERNEL} ${TEST_ROOTFS_IMAGE} && /bin/sleep 60" &
+		echo "Running xterm -display ${DISPLAY} -e 'OE_TMPDIR=${OE_TMPDIR} ${RUNQEMU} ${KERNEL} ${TEST_ROOTFS_IMAGE} && /bin/sleep 60' &"
+		xterm -display ${DISPLAY} -e "OE_TMPDIR=${OE_TMPDIR} ${RUNQEMU} ${KERNEL} ${TEST_ROOTFS_IMAGE} && /bin/sleep 60" &
 	
 		# Get the pid of the xterm processor, which will be used in Test_Kill_Qemu
 		PID=$!
diff --git a/scripts/runqemu b/scripts/runqemu
index 0f943b5..31e9822 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -55,6 +55,11 @@ SCRIPT_QEMU_OPT=""
 SCRIPT_QEMU_EXTRA_OPT=""
 SCRIPT_KERNEL_OPT=""
 
+# Don't use TMPDIR from the external environment, it may be a distro
+# variable pointing to /tmp (e.g. within X on OpenSUSE)
+# Instead, use OE_TMPDIR for passing this in externally.
+TMPDIR="$OE_TMPDIR"
+
 # Determine whether the file is a kernel or QEMU image, and set the
 # appropriate variables
 process_filename() {
@@ -260,7 +265,7 @@ SPITZ_DEFAULT_FSTYPE=ext3
 
 setup_tmpdir() {
     if [ -z "$TMPDIR" ]; then
-        # BUILDDIR unset, try and get TMPDIR from bitbake
+        # Try to get TMPDIR from bitbake
         type -P bitbake &>/dev/null || {
             echo "In order for this script to dynamically infer paths";
             echo "to kernels or filesystem images, you either need";
-- 
1.7.4.1



