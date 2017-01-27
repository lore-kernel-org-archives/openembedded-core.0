Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B6075774DD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 20:43:14 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP; 27 Jan 2017 12:43:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,297,1477983600"; d="scan'208";a="58074713"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 27 Jan 2017 12:43:15 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 5D52F6A4006
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 12:42:17 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 22:19:46 +0200
Message-Id: <1f985eb904ef7bfe913475fa69b1b032f999fd43.1485547221.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485547221.git.ed.bartosh@linux.intel.com>
References: <cover.1485547221.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v3 09/11] grub-efi.bbclass: use 'grub-efi-' prefix
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
X-List-Received-Date: Fri, 27 Jan 2017 20:43:14 -0000

grub-efi recipe added 'grub-efi-' prefix to the file name of
efi binary. Changed grub-efi.bbclass accordingly.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/classes/grub-efi.bbclass | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/classes/grub-efi.bbclass b/meta/classes/grub-efi.bbclass
index 3dc9146..8adda09 100644
--- a/meta/classes/grub-efi.bbclass
+++ b/meta/classes/grub-efi.bbclass
@@ -40,13 +40,15 @@ efi_populate() {
 
 	install -d ${DEST}${EFIDIR}
 
-	GRUB_IMAGE="bootia32.efi"
+	GRUB_IMAGE="grub-efi-bootia32.efi"
+	DEST_IMAGE="bootia32.efi"
 	if [ "${TARGET_ARCH}" = "x86_64" ]; then
-		GRUB_IMAGE="bootx64.efi"
+		GRUB_IMAGE="grub-efi-bootx64.efi"
+		DEST_IMAGE="bootx64.efi"
 	fi
-	install -m 0644 ${DEPLOY_DIR_IMAGE}/${GRUB_IMAGE} ${DEST}${EFIDIR}
+	install -m 0644 ${DEPLOY_DIR_IMAGE}/${GRUB_IMAGE} ${DEST}${EFIDIR}/${DEST_IMAGE}
 	EFIPATH=$(echo "${EFIDIR}" | sed 's/\//\\/g')
-	printf 'fs0:%s\%s\n' "$EFIPATH" "$GRUB_IMAGE" >${DEST}/startup.nsh
+	printf 'fs0:%s\%s\n' "$EFIPATH" "$DEST_IMAGE" >${DEST}/startup.nsh
 
 	install -m 0644 ${GRUB_CFG} ${DEST}${EFIDIR}/grub.cfg
 }
-- 
2.1.4


