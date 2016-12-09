Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 9B5F960684
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2016 14:19:19 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 09 Dec 2016 06:19:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,324,1477983600"; d="scan'208";a="1070074474"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 09 Dec 2016 06:19:20 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 0C00B6A4006;
	Fri,  9 Dec 2016 06:18:33 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Dec 2016 16:19:05 +0200
Message-Id: <1481293145-7680-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oe-setup-rpmrepo: standardize usage output
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
X-List-Received-Date: Fri, 09 Dec 2016 14:19:20 -0000

Made usage output of oe-setup-rpmrepo to look similar to the
output of other oe scripts.

[YOCTO #10751]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/oe-setup-rpmrepo | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/scripts/oe-setup-rpmrepo b/scripts/oe-setup-rpmrepo
index 917b98b..7dcded8 100755
--- a/scripts/oe-setup-rpmrepo
+++ b/scripts/oe-setup-rpmrepo
@@ -23,16 +23,6 @@
 # Instead, use OE_TMPDIR for passing this in externally.
 TMPDIR="$OE_TMPDIR"
 
-function usage() {
-	echo "Usage: $0 <rpm-dir>"
-	echo "  <rpm-dir>: default is $TMPDIR/deploy/rpm"
-}
-
-if [ $# -gt 1 ]; then
-	usage
-	exit 1
-fi
-
 setup_tmpdir() {
     if [ -z "$TMPDIR" ]; then
         # Try to get TMPDIR from bitbake
@@ -53,6 +43,23 @@ setup_tmpdir() {
     fi
 }
 
+setup_tmpdir
+
+function usage() {
+    echo 'Usage: oe-setup-rpmrepo rpm-dir'
+    echo ''
+    echo 'OpenEmbedded setup-rpmrepo - setup rpm repository'
+    echo ''
+    echo 'arguments:'
+    echo "  rpm-dir               rpm repo directory, default is $TMPDIR/deploy/rpm"
+    echo ''
+}
+
+if [ $# -gt 1 -o "$1" = '--help' -o "$1" = '-h' ]; then
+    usage
+    exit 2
+fi
+
 setup_sysroot() {
 	# Toolchain installs set up $OECORE_NATIVE_SYSROOT in their
 	# environment script. If that variable isn't set, we're
@@ -68,7 +75,6 @@ setup_sysroot() {
 	fi 
 }
 
-setup_tmpdir
 setup_sysroot
 
 
-- 
2.1.4


