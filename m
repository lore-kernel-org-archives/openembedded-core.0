Return-Path: <reinette.chatre@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CD2CA6ABF7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 18:45:34 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 14 Apr 2015 11:45:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,577,1422950400"; d="scan'208";a="680038856"
Received: from rchatre-builder.jf.intel.com ([10.23.232.93])
	by orsmga001.jf.intel.com with ESMTP; 14 Apr 2015 11:45:36 -0700
From: Reinette Chatre <reinette.chatre@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Apr 2015 11:46:39 -0700
Message-Id: <0b3eeeaba86f26bf57522d3ad2091198e70dfd48.1429036574.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] init-install-efi.sh: fix gummiboot entry installation
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
X-List-Received-Date: Tue, 14 Apr 2015 18:45:36 -0000

After selecting the "install" gummiboot option of a Live image we are
seeing boot failure resulting from the gummiboot entries not being
installed correctly. This seems to be a problem in this init-install-efi.sh
script where it incorrectly installs the gummiboot entries into the root
filesystem, not the boot partition. We fix it by installing the entries in
the boot partition.

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
---
Hi,

Is it perhaps possible to backport this into dizzy release?

Thank you very much

 meta/recipes-core/initrdscripts/files/init-install-efi.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index 89d0750..329586d 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -199,11 +199,11 @@ if [ -f /run/media/$1/EFI/BOOT/grub.cfg ]; then
 fi
 
 if [ -d /run/media/$1/loader ]; then
-    GUMMIBOOT_CFGS="/tgt_root/loader/entries/*.conf"
+    GUMMIBOOT_CFGS="/boot/loader/entries/*.conf"
     # copy config files for gummiboot
-    cp -dr /run/media/$1/loader /tgt_root
+    cp -dr /run/media/$1/loader /boot
     # delete the install entry
-    rm -f /tgt_root/loader/entries/install.conf
+    rm -f /boot/loader/entries/install.conf
     # delete the initrd lines
     sed -i "/initrd /d" $GUMMIBOOT_CFGS
     # delete any LABEL= strings
-- 
2.1.0


