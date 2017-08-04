Return-Path: <california.l.sullivan@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E5D966067C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Aug 2017 21:20:59 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Aug 2017 14:21:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,322,1498546800"; d="scan'208";a="1159331349"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga001.jf.intel.com with ESMTP; 04 Aug 2017 14:21:00 -0700
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Aug 2017 14:20:54 -0700
Message-Id: <20170804212054.17000-1-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <72844ead-b913-5246-b5b6-99a05fdfae7e@intel.com>
References: <72844ead-b913-5246-b5b6-99a05fdfae7e@intel.com>
Cc: wei.tee.ng@intel.com
Subject: [PATCH] initramfs-framework/setup-live: also boot live image if root=/dev/ram0
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
X-List-Received-Date: Fri, 04 Aug 2017 21:21:00 -0000

Our grub and syslinux bootloaders both define root=/dev/ram0 for live
images by default. Kernel docs show that root=/dev/ram0 is just a
sentinel value to mount the initrd as root, which we're already doing
in this path, so just check for a missing root= parameter OR
root=/dev/ram0.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
NOTE: for the selftests to be fixed, the patch
"initramfs-framework/setup-live: remove superfluous break" needs to be
merged as well.

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
2.9.4


