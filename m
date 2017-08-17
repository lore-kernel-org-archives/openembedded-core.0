Return-Path: <california.l.sullivan@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9674978276
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 22:47:30 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Aug 2017 15:47:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,390,1498546800"; d="scan'208";a="1163787597"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga001.jf.intel.com with ESMTP; 17 Aug 2017 15:47:31 -0700
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Aug 2017 15:47:30 -0700
Message-Id: <20170817224730.5317-1-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.9.5
Subject: [PATCH v2] initramfs-framework/setup-live: also boot live image if root=/dev/ram0
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
X-List-Received-Date: Thu, 17 Aug 2017 22:47:30 -0000

Our grub and syslinux bootloaders both define root=/dev/ram0 for live
images by default. Kernel docs show that root=/dev/ram0 is just a
sentinel value for the kernel to mount the initrd as root, which then
mounts and switches to the real root. This is exactly what our scripts
do, so just check for root=/dev/ram0 as well.

See: https://www.kernel.org/doc/html/v4.11/admin-guide/initrd.html#operation

This fixes the issue where the new initramfs-framework scripts would not
boot live images that use grub or syslinux bootloaders.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
I think the first one was missed because it was sent as a reply rather
than a top-level subject. This one has the same change but with a better
commit message.

 meta/recipes-core/initrdscripts/initramfs-framework/setup-live | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/setup-live b/meta/recipes-core/initrdscripts/initramfs-framework/setup-live
index 591c93a..b98a321 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/setup-live
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/setup-live
@@ -12,7 +12,7 @@ ISOLINUX=""
 ROOT_DISK=""
 shelltimeout=30
 
-	if [ -z $bootparam_root ]; then
+	if [ -z $bootparam_root -o $bootparam_root = "/dev/ram0" ]; then
 		echo "Waiting for removable media..."
 		C=0
 		while true
-- 
2.9.5


