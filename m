Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 8245B71C9B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2016 12:19:23 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1cHrTw-0006wV-Dm from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2016 04:19:24 -0800
Received: from awais-Precision-M4700.pkl.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.3.224.2; Fri, 16 Dec 2016 12:19:22 +0000
From: Awais Belal <awais_belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Dec 2016 17:19:16 +0500
Message-ID: <1481890756-18807-2-git-send-email-awais_belal@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1481890756-18807-1-git-send-email-awais_belal@mentor.com>
References: <1481890756-18807-1-git-send-email-awais_belal@mentor.com>
MIME-Version: 1.0
Subject: [PATCH v2 2/2] grub-efi/live-vm-common: allow grub as EFI_PROVIDER
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
X-List-Received-Date: Fri, 16 Dec 2016 12:19:24 -0000
Content-Type: text/plain

This allows grub to be used as EFI_PROVIDER and
extends the grub-efi class so it can be used as is
when EFI_PROVIDER is grub.
Currently this can only be leveraged if you are
using the grub_git recipe and GRUBPLATFORM plus
EFI_PROVIDER are set correctly.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 meta/classes/grub-efi.bbclass       | 23 +++++++++++++++++------
 meta/classes/live-vm-common.bbclass |  2 +-
 2 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index 17417ba..c847645 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -16,8 +16,8 @@
 # ${GRUB_TIMEOUT} - timeout before executing the deault label (optional)
 # ${GRUB_ROOT} - grub's root device.
 
-do_bootimg[depends] += "${MLPREFIX}grub-efi:do_deploy"
-do_bootdirectdisk[depends] += "${MLPREFIX}grub-efi:do_deploy"
+do_bootimg[depends] += "${MLPREFIX}${EFI_PROVIDER}:do_deploy"
+do_bootdirectdisk[depends] += "${MLPREFIX}${EFI_PROVIDER}:do_deploy"
 
 GRUB_SERIAL ?= "console=ttyS0,115200"
 GRUB_CFG_VM = "${S}/grub_vm.cfg"
@@ -40,10 +40,21 @@ efi_populate() {
 
 	install -d ${DEST}${EFIDIR}
 
-	GRUB_IMAGE="bootia32.efi"
-	if [ "${TARGET_ARCH}" = "x86_64" ]; then
-		GRUB_IMAGE="bootx64.efi"
-	fi
+    if [ "${EFI_PROVIDER}" = "grub" ]; then
+	    GRUB_IMAGE="bootia32.${GRUBPLATFORM}"
+	    if [ "${TARGET_ARCH}" = "x86_64" ]; then
+		    GRUB_IMAGE="bootx64.${GRUBPLATFORM}"
+	    elif [ "${TARGET_ARCH}" = "arm" ]; then
+            grubimage = "bootarm.${GRUBPLATFORM}"
+	    elif [ "${TARGET_ARCH}" = "aarch64" ]; then
+            grubimage = "bootaa64.${GRUBPLATFORM}"
+        fi
+    else
+        GRUB_IMAGE="bootia32.efi"
+	    if [ "${TARGET_ARCH}" = "x86_64" ]; then
+		    GRUB_IMAGE="bootx64.efi"
+        fi
+    fi
 	install -m 0644 ${DEPLOY_DIR_IMAGE}/${GRUB_IMAGE} ${DEST}${EFIDIR}
 	EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
 	printf 'fs0:%s\%s\n' "$EFIPATH" "$GRUB_IMAGE" >${DEST}/startup.nsh
diff --git a/meta/classes/live-vm-common.bbclass b/meta/classes/live-vm-common.bbclass
index 734697f..0af228b 100644
--- a/meta/classes/live-vm-common.bbclass
+++ b/meta/classes/live-vm-common.bbclass
@@ -13,7 +13,7 @@ def set_live_vm_vars(d, suffix):
 
 EFI = "${@bb.utils.contains("MACHINE_FEATURES", "efi", "1", "0", d)}"
 EFI_PROVIDER ?= "grub-efi"
-EFI_CLASS = "${@bb.utils.contains("MACHINE_FEATURES", "efi", "${EFI_PROVIDER}", "", d)}"
+EFI_CLASS = "${@bb.utils.contains("EFI_PROVIDER", "grub", "grub-efi", "${EFI_PROVIDER}", d)}"
 
 # Include legacy boot if MACHINE_FEATURES includes "pcbios" or if it does not
 # contain "efi". This way legacy is supported by default if neither is
-- 
1.9.1


