Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RutvQ-0004HG-9A
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 23:54:13 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Feb 2012 14:46:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122206434"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.116])
	by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2012 14:46:02 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2012 14:45:44 -0800
Message-Id: <cfd84a05581e068d705b0804829c4833a06bffa6.1328654424.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328654424.git.sgw@linux.intel.com>
References: <cover.1328654424.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328654424.git.sgw@linux.intel.com>
References: <cover.1328654424.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 24/35] runqemu-internal: qemuarm can handle 256M
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
X-List-Received-Date: Tue, 07 Feb 2012 22:54:13 -0000

From: Khem Raj <raj.khem@gmail.com>

Raise the check for max RAM supported for QEMU/arm
its 256M since we patched it to be so in OE

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 scripts/runqemu-internal |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 21fbce3..73b8b41 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -67,13 +67,14 @@ fi
 # QEMU_MEMORY has 'M' appended to mem_size
 QEMU_MEMORY="$mem_size"M
 
-# Bug 433: qemuarm cannot use > 128 MB RAM
+# Bug 433: qemuarm cannot use > 256 MB RAM
 if [ "$MACHINE" = "qemuarm" ]; then
-    if [[ -z "$mem_size" || $mem_size -gt 128 ]]; then
-        echo "WARNING: qemuarm does not support > 128M of RAM."
-        echo "Changing QEMU_MEMORY to default of 128M."
-        QEMU_MEMORY="128M"
-        SCRIPT_QEMU_EXTRA_OPT=`echo $SCRIPT_QEMU_EXTRA_OPT | sed -e "s/$mem_set/-m 128/" `
+    if [[ -z "$mem_size" || $mem_size -gt 256 ]]; then
+        echo "WARNING: qemuarm does not support > 256M of RAM."
+        echo "Changing QEMU_MEMORY to default of 256M."
+        QEMU_MEMORY="256M"
+	mem_size="256"
+        SCRIPT_QEMU_EXTRA_OPT=`echo $SCRIPT_QEMU_EXTRA_OPT | sed -e "s/$mem_set/-m 256/" `
     fi
 fi
 
-- 
1.7.6.5



