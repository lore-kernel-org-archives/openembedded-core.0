Return-Path: <california.l.sullivan@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AC5E96022E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 20:58:11 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP; 04 Jan 2017 12:58:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,317,1477983600"; d="scan'208";a="45767673"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga004.jf.intel.com with ESMTP; 04 Jan 2017 12:58:12 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Jan 2017 12:57:59 -0800
Message-Id: <1483563479-4673-1-git-send-email-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.5.5
Cc: bruce.ashfield@windriver.com
Subject: [PATCH RFC] kernel.bbclass: symlink initramfs kernel bundle to kernel
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
X-List-Received-Date: Wed, 04 Jan 2017 20:58:13 -0000

Image creation seems to always grab ${type} (usually bzImage), even if
we specifically use INITRAMFS_IMAGE_BUNDLE to create a bundled
initramfs/kernel. Work around this by linking ${type}.initramfs to
${type} as a final step when it exists.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
I've been experimenting with initramfs stuff lately and discovered that
despite the bundled initramfs being built, it isn't being used by image
creation by default. This is one way to solve the issue, but ultimately
its probably a deficiency with image creation. Anyone with more
knowledge in this area have some thoughts?

 meta/classes/kernel.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 3630042..5b5a642 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -618,6 +618,10 @@ kernel_do_deploy() {
 			initramfs_symlink_name=${type}-initramfs-${MACHINE}
 			install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}.initramfs ${DEPLOYDIR}/${initramfs_base_name}.bin
 			ln -sf ${initramfs_base_name}.bin ${DEPLOYDIR}/${initramfs_symlink_name}.bin
+			if [ x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
+				echo "INITRAMFS_IMAGE_BUNDLE is set. Linking to ${type}..."
+				ln -sf ${initramfs_base_name}.bin ${DEPLOYDIR}/${type}
+			fi
 		fi
 	done
 }
-- 
2.5.5


