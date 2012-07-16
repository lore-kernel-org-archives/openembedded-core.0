Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SqnhM-0006t0-Lr
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 17:59:01 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jul 2012 08:47:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="193443316"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.178])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jul 2012 08:47:39 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2012 08:47:13 -0700
Message-Id: <a12e2409af246d4c1d0e0c9a2457fb9c850bd8ca.1342453118.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1342453118.git.sgw@linux.intel.com>
References: <cover.1342453118.git.sgw@linux.intel.com>
In-Reply-To: <cover.1342453118.git.sgw@linux.intel.com>
References: <cover.1342453118.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 07/30] runqemu/mips: adjust runqemu script to support mipsel machine
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
X-List-Received-Date: Mon, 16 Jul 2012 15:59:01 -0000

From: Dennis Lan <dennis.yxun@gmail.com>

Signed-off-by: Dennis Lan <dennis.yxun@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 scripts/runqemu          |    5 ++++-
 scripts/runqemu-internal |   13 +++++++------
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 8d149a2..650d1df 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -94,7 +94,7 @@ KVM_ENABLED="no"
 while true; do
     arg=${1}
     case "$arg" in
-        "qemux86" | "qemux86-64" | "qemuarm" | "qemumips" | "qemumips64" | "qemush4"  | "qemuppc")
+        "qemux86" | "qemux86-64" | "qemuarm" | "qemumips" | "qemumipsel" | "qemumips64" | "qemush4"  | "qemuppc")
             [ -z "$MACHINE" ] && MACHINE=$arg || \
                 error "conflicting MACHINE types [$MACHINE] and [$arg]"
             ;;
@@ -245,6 +245,9 @@ QEMUARM_DEFAULT_FSTYPE=ext3
 QEMUMIPS_DEFAULT_KERNEL=vmlinux-qemumips.bin
 QEMUMIPS_DEFAULT_FSTYPE=ext3
 
+QEMUMIPSEL_DEFAULT_KERNEL=vmlinux-qemumipsel.bin
+QEMUMIPSEL_DEFAULT_FSTYPE=ext3
+
 QEMUMIPS64_DEFAULT_KERNEL=vmlinux-qemumips64.bin
 QEMUMIPS64_DEFAULT_FSTYPE=ext3
 
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 041464d..a21ea93 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -236,6 +236,7 @@ fi
 case "$MACHINE" in
     "qemuarm") ;;
     "qemumips") ;;
+    "qemumipsel") ;;
     "qemumips64") ;;
     "qemush4") ;;
     "qemuppc") ;;
@@ -375,12 +376,12 @@ if [ "$MACHINE" = "spitz" ]; then
     fi
 fi
 
-if [ "$MACHINE" = "qemumips" -o "$MACHINE" = "qemumips64" ]; then
-    if [ "$MACHINE" = "qemumips64" ]; then
-	QEMU=qemu-system-mips64
-    else
-	QEMU=qemu-system-mips
-    fi
+if [ "$MACHINE" = "qemumips" -o "$MACHINE" = "qemumipsel" -o "$MACHINE" = "qemumips64" ]; then
+    case "$MACHINE" in
+       qemumips)   QEMU=qemu-system-mips ;;
+       qemumipsel) QEMU=qemu-system-mipsel ;;
+       qemumips64) QEMU=qemu-system-mips64 ;;
+    esac
     MACHINE_SUBTYPE=malta
     QEMU_UI_OPTIONS="-vga cirrus $QEMU_UI_OPTIONS"
     if [ "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs" ]; then
-- 
1.7.7.6



