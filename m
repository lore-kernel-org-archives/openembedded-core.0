Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R8qUy-0007DT-HW
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 11:32:16 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Sep 2011 02:26:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,454,1312182000"; d="scan'208";a="71534358"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.175])
	by fmsmga002.fm.intel.com with ESMTP; 28 Sep 2011 02:26:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 10:26:08 +0100
Message-Id: <40d529f9c3368edfef349f447355eb986b5c843a.1317201529.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1317201529.git.paul.eggleton@linux.intel.com>
References: <cover.1317201529.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1317201529.git.paul.eggleton@linux.intel.com>
References: <cover.1317201529.git.paul.eggleton@linux.intel.com>
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
X-List-Received-Date: Wed, 28 Sep 2011 09:32:16 -0000

On OpenSUSE within an X session, TMPDIR is set to the system temporary
directory (/tmp) which is incorrect for these scripts. Thus, change
runqemu and oe-setup-rpmrepo to use OE_TMPDIR from the external
environment rather than TMPDIR.

Fixes [YOCTO #1530]

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/oe-setup-rpmrepo |    8 +++++++-
 scripts/runqemu          |    7 ++++++-
 2 files changed, 13 insertions(+), 2 deletions(-)

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



