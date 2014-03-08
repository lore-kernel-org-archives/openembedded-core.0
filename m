Return-Path: <ricardo.neri-calderon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DEF436E87A
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Mar 2014 00:31:30 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Mar 2014 16:27:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,611,1389772800"; d="scan'208";a="496148663"
Received: from ranerica-desk01.sc.intel.com ([10.3.52.86])
	by orsmga002.jf.intel.com with ESMTP; 07 Mar 2014 16:31:31 -0800
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Fri,  7 Mar 2014 16:30:10 -0800
Message-Id: <1394238610-25905-1-git-send-email-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH][resend] runqemu: Add option for custom BIOS directory
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
X-List-Received-Date: Sat, 08 Mar 2014 00:31:31 -0000

Add support to specify a directory for custom BIOS, VGA BIOS and
keymaps as supported by qemu (-L option). Even though this can be
done through qemuparams, having this option provides better user
experience by not having to specify a long and cluttered path along
other qemuparams that the user might want to specify.

This new options assumes that the path provided is relative to
OECORE_NATIVE_SYSROOT and will check whether it exists before proceeding.

Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
 scripts/runqemu | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 619ffb6..9eff90d 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -149,6 +149,9 @@ while true; do
             SCRIPT_KERNEL_OPT="$SCRIPT_KERNEL_OPT console=ttyS0"
             SERIALSTDIO="1"
             ;;
+	"biosdir="*)
+            CUSTOMBIOSDIR="${arg##biosdir=}"
+	    ;;
         "qemuparams="*)
             SCRIPT_QEMU_EXTRA_OPT="${arg##qemuparams=}"
 
@@ -489,5 +492,16 @@ if [ ! -f "$INTERNAL_SCRIPT" -o ! -r "$INTERNAL_SCRIPT" ]; then
 INTERNAL_SCRIPT=`which runqemu-internal`
 fi
 
+# Specify directory for BIOS, VGA BIOS and keymaps
+if [ ! -z "$CUSTOMBIOSDIR" ]; then
+    if [ -d "$OECORE_NATIVE_SYSROOT/$CUSTOMBIOSDIR" ]; then
+           echo "Assuming $CUSTOMBIOSDIR really means $OECORE_NATIVE_SYSROOT/$CUSTOMBIOSDIR"
+           SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -L $OECORE_NATIVE_SYSROOT/$CUSTOMBIOSDIR"
+       else
+           echo "Custom BIOS directory $OECORE_NATIVE_SYSROOT/$CUSTOMBIOSDIR not found."
+           exit 1;
+    fi
+fi
+
 . $INTERNAL_SCRIPT
 exit $?
-- 
1.8.1.2


