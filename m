Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dennis.yxun@gmail.com>) id 1SorA0-0008Su-Bp
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 09:16:32 +0200
Received: by wgbdr1 with SMTP id dr1so659325wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2012 00:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=KYt6jE7K84C7fRBKHf0L7EeuVaplSMVMh2l/S6ZywjQ=;
	b=M1+CCOENsEuzuUMSTL0STguiFLX5/8bqZy1A/6NQXBzkLsC04qsDDPtk2CoPGm3+JO
	7mJaEmLLLLpWiqu9lDVsjA4Sbr66uGOMGQQ+X9tCTZMwqiemZinCTSePiZgEpWdwc/+T
	iCp+ii3LgODcHmzb2HSYOsOGfZCkYnfUeWMaTzy/RkizjTSy1tOZexcmG2FSRy5Q7nTg
	oNAgkJTmctyvV3iUXMaxtAbhM11RfmStM/lba+ar3PQhV6XTpCkoB21K4vOCPSS/WOzx
	iRHMXyRVS9jA9bQSf9EekupFZ991L3EecTFbAUHWfv/yD5qupaNK+p3D9HvXiGZQeY9K
	VC5w==
Received: by 10.180.99.196 with SMTP id es4mr44428313wib.18.1341990320035;
	Wed, 11 Jul 2012 00:05:20 -0700 (PDT)
Received: from localhost.localdomain ([64.191.99.80])
	by mx.google.com with ESMTPS id t7sm2915358wix.6.2012.07.11.00.05.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Jul 2012 00:05:19 -0700 (PDT)
From: Dennis Lan <dennis.yxun@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jul 2012 07:05:02 +0000
Message-Id: <1341990302-30459-1-git-send-email-dennis.yxun@gmail.com>
X-Mailer: git-send-email 1.7.7
Subject: [PATCH] runqemu/mips: adjust runqemu script to support mipsel machine
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
X-List-Received-Date: Wed, 11 Jul 2012 07:16:32 -0000

Signed-off-by: Dennis Lan <dennis.yxun@gmail.com>
---
 scripts/runqemu          |    5 ++++-
 scripts/runqemu-internal |    9 +++------
 2 files changed, 7 insertions(+), 7 deletions(-)

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
index 041464d..bdf1a37 100755
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
@@ -375,12 +376,8 @@ if [ "$MACHINE" = "spitz" ]; then
     fi
 fi
 
-if [ "$MACHINE" = "qemumips" -o "$MACHINE" = "qemumips64" ]; then
-    if [ "$MACHINE" = "qemumips64" ]; then
-	QEMU=qemu-system-mips64
-    else
-	QEMU=qemu-system-mips
-    fi
+if [ "$MACHINE" = "qemumips" -o "$MACHINE" = "qemumipsel" -o "$MACHINE" = "qemumips64" ]; then
+    QEMU=${MACHINE/qemu/qemu-system-}
     MACHINE_SUBTYPE=malta
     QEMU_UI_OPTIONS="-vga cirrus $QEMU_UI_OPTIONS"
     if [ "$FSTYPE" = "ext3" -o "$FSTYPE" = "btrfs" ]; then
-- 
1.7.9.rc2



