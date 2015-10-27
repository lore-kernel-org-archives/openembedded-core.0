Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0E6F075D4A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 15:54:46 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 27 Oct 2015 08:54:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,205,1444719600"; d="scan'208";a="836682527"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 27 Oct 2015 08:54:20 -0700
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 212356A4005
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 08:53:17 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Oct 2015 17:54:30 +0200
Message-Id: <1445961270-12307-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH v2] runqemu-export-rootfs: update location of unfsd binary
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
X-List-Received-Date: Tue, 27 Oct 2015 15:54:49 -0000

oe-core commit: 24b80d211f3808a0ffebee426932f11b8d4d46e0 sets
sbindir = "${bindir}"

So, update the location of unfsd binary from "/usr/sbin" to "/usr/bin" in
runqemu-export-rootfs. Also update unfs3-native to install unfsd under
"bin" directory.

[YOCTO #8315]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb | 1 +
 scripts/runqemu-export-rootfs                    | 8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb b/meta/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb
index 45cf545..5130895 100644
--- a/meta/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb
+++ b/meta/recipes-devtools/unfs3/unfs3_0.9.22.r490.bb
@@ -29,6 +29,7 @@ SRC_URI = "svn://svn.code.sf.net/p/unfs3/code;module=trunk;rev=${MOD_PV} \
 BBCLASSEXTEND = "native nativesdk"
 
 inherit autotools
+EXTRA_OECONF_append_class-native = " --sbindir=${bindir}"
 
 # Turn off these header detects else the inode search
 # will walk entire file systems and this is a real problem
diff --git a/scripts/runqemu-export-rootfs b/scripts/runqemu-export-rootfs
index 40ab201..3dee131 100755
--- a/scripts/runqemu-export-rootfs
+++ b/scripts/runqemu-export-rootfs
@@ -46,8 +46,8 @@ if [ -z "$SYSROOT_SETUP_SCRIPT" ]; then
 fi
 . $SYSROOT_SETUP_SCRIPT
 
-if [ ! -e "$OECORE_NATIVE_SYSROOT/usr/sbin/unfsd" ]; then
-	echo "Error: Unable to find unfsd binary in $OECORE_NATIVE_SYSROOT/usr/sbin/"
+if [ ! -e "$OECORE_NATIVE_SYSROOT/usr/bin/unfsd" ]; then
+	echo "Error: Unable to find unfsd binary in $OECORE_NATIVE_SYSROOT/usr/bin/"
 
 	if [ "x$OECORE_DISTRO_VERSION" = "x" ]; then
 		echo "Have you run 'bitbake meta-ide-support'?"
@@ -115,8 +115,8 @@ case "$1" in
 	fi
 
 	echo "Starting User Mode nfsd"
-	echo "  $PSEUDO $PSEUDO_OPTS $OECORE_NATIVE_SYSROOT/usr/sbin/unfsd $UNFSD_OPTS"
-	$PSEUDO $PSEUDO_OPTS $OECORE_NATIVE_SYSROOT/usr/sbin/unfsd $UNFSD_OPTS
+	echo "  $PSEUDO $PSEUDO_OPTS $OECORE_NATIVE_SYSROOT/usr/bin/unfsd $UNFSD_OPTS"
+	$PSEUDO $PSEUDO_OPTS $OECORE_NATIVE_SYSROOT/usr/bin/unfsd $UNFSD_OPTS
 	if [ ! $? = 0 ]; then
 		echo "Error starting nfsd"
 		exit 1
-- 
2.4.0


