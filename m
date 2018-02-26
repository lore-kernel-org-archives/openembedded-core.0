Return-Path: <california.l.sullivan@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C1C52787DD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Feb 2018 20:12:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Feb 2018 12:12:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,397,1515484800"; d="scan'208";a="203914584"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga005.jf.intel.com with ESMTP; 26 Feb 2018 12:12:30 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Feb 2018 12:12:06 -0800
Message-Id: <20180226201216.33204-7-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180226201216.33204-1-california.l.sullivan@intel.com>
References: <20180226201216.33204-1-california.l.sullivan@intel.com>
Subject: [PATCH 06/16] live-vm-common.bbclass: Don't use vmlinuz or VM_DEFAULT_KERNEL
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
X-List-Received-Date: Mon, 26 Feb 2018 20:12:29 -0000

I can't find VM_DEFAULT_KERNEL used anywhere else, and we should not be
statically installing the kernel as vmlinuz.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/classes/live-vm-common.bbclass | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/classes/live-vm-common.bbclass b/meta/classes/live-vm-common.bbclass
index e1d8b1843b6..714d6d4788c 100644
--- a/meta/classes/live-vm-common.bbclass
+++ b/meta/classes/live-vm-common.bbclass
@@ -33,18 +33,17 @@ inherit ${EFI_CLASS}
 inherit ${PCBIOS_CLASS}
 
 KERNEL_IMAGETYPE ??= "bzImage"
-VM_DEFAULT_KERNEL ??= "${KERNEL_IMAGETYPE}"
 
 populate_kernel() {
 	dest=$1
 	install -d $dest
 
 	# Install bzImage, initrd, and rootfs.img in DEST for all loaders to use.
-	bbnote "Trying to install ${DEPLOY_DIR_IMAGE}/${VM_DEFAULT_KERNEL} as $dest/vmlinuz"
-	if [ -e ${DEPLOY_DIR_IMAGE}/${VM_DEFAULT_KERNEL} ]; then
-		install -m 0644 ${DEPLOY_DIR_IMAGE}/${VM_DEFAULT_KERNEL} $dest/vmlinuz
+	bbnote "Trying to install ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE} as $dest/${KERNEL_IMAGETYPE}"
+	if [ -e ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE} ]; then
+		install -m 0644 ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE} $dest/${KERNEL_IMAGETYPE}
 	else
-		bbwarn "${DEPLOY_DIR_IMAGE}/${VM_DEFAULT_KERNEL} doesn't exist"
+		bbwarn "${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE} doesn't exist"
 	fi
 
 	# initrd is made of concatenation of multiple filesystem images
-- 
2.14.3


