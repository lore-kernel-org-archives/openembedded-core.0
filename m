Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 05DBD6FFED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 06:53:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2E6r3a7012025
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 23:53:03 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 13 Mar 2016 23:53:03 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 13 Mar 2016 23:52:57 -0700
Message-ID: <cea699752e40c12aed2ca0a967193d59ccf5eb98.1457938286.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1457938286.git.liezhi.yang@windriver.com>
References: <cover.1457938286.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/7] runqemu: simplify checking for iso and ramfs
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
X-List-Received-Date: Mon, 14 Mar 2016 06:53:04 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu          |    7 +------
 scripts/runqemu-internal |    4 ++--
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index d95711b..b4cc9de 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -125,7 +125,7 @@ while true; do
             [ -z "$MACHINE" -o "$MACHINE" = "$arg" ] && MACHINE=$arg || \
                 error "conflicting MACHINE types [$MACHINE] and [$arg]"
             ;;
-        "ext"[234] | "jffs2" | "nfs" | "btrfs")
+        "ext"[234] | "jffs2" | "nfs" | "btrfs" | "iso")
             check_fstype_conflicts $arg
             ;;
         "hddimg" | "hdddirect" | "wic" | "vmdk" | "qcow2" | "vdi")
@@ -134,12 +134,7 @@ while true; do
             ;;
         "ramfs")
             FSTYPE=cpio.gz
-            RAMFS=true
             ;;
-        "iso")
-            FSTYPE=iso
-            ISOFS=true
-	    ;;
         "nographic")
             SCRIPT_QEMU_OPT="$SCRIPT_QEMU_OPT -nographic"
             SCRIPT_KERNEL_OPT="$SCRIPT_KERNEL_OPT console=ttyS0"
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index b7d80b2..d591c09 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -593,12 +593,12 @@ if [ "$MACHINE" = "qemuzynq" ]; then
     fi
 fi
 
-if [ "x$RAMFS" = "xtrue" ]; then
+if [ "$FSTYPE" = "cpio.gz" ]; then
     QEMUOPTIONS="-initrd $ROOTFS -nographic"
     KERNCMDLINE="root=/dev/ram0 console=ttyS0 debugshell"
 fi
 
-if [ "x$ISOFS" = "xtrue" ]; then
+if [ "$FSTYPE" = "iso" ]; then
     QEMUOPTIONS="$QEMU_NETWORK_CMD -cdrom $ROOTFS $QEMU_UI_OPTIONS"
 fi
 
-- 
1.7.9.5


