Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dennis.yxun@gmail.com>) id 1SpGLp-0007dF-Db
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 12:10:25 +0200
Received: by lbol5 with SMTP id l5so2901167lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 02:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=nvxJbK4ZvCRMXsqN9hUAWq2hx6ls/i+ckDWNbmz0BWA=;
	b=1Jx8lWc5y3kmdT05eoIcRJQ/0y7yUSFllemPuxETCUrVq5DeJBIf0T2GU3NO9JG+BE
	6YWdY4zTGyWdcDKaq1N/P4MOOQ0Q2lEuDhHfcPfNuR/k+fI7lrxuB0BSsP7ZUGejE4oJ
	9u5IZOz58U/r6EHsm3Wi7T4W7vFVoubJ6lNktQDuTxPn5qoql7DYRX7D/jM3nTegaU1O
	qtYwC4g6nhAY4B7Cpbn625WV+ug8P63mr1Ut7tgcEtneikOYFzC2Pn1p0H21cypj1ZMR
	hKr04VReKff8t4YvK+8YJHKSA6i1a0Rhir2izpKSMMYWInjaQp+DfojRmOBngSTJtx9P
	KFQw==
Received: by 10.152.102.137 with SMTP id fo9mr53024113lab.35.1342087152400;
	Thu, 12 Jul 2012 02:59:12 -0700 (PDT)
Received: from localhost.localdomain ([64.191.99.80])
	by mx.google.com with ESMTPS id xx8sm4261636lab.10.2012.07.12.02.59.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jul 2012 02:59:11 -0700 (PDT)
From: Dennis Lan <dennis.yxun@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jul 2012 09:58:51 +0000
Message-Id: <1342087131-14277-1-git-send-email-dennis.yxun@gmail.com>
X-Mailer: git-send-email 1.7.7
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH v2] runqemu/mips: adjust runqemu script to support mipsel machine
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
X-List-Received-Date: Thu, 12 Jul 2012 10:10:25 -0000

Signed-off-by: Dennis Lan <dennis.yxun@gmail.com>
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
1.7.9.rc2



