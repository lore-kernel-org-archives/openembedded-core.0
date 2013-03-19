Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UI556-0003A7-RZ
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 23:32:34 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 19 Mar 2013 15:15:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,874,1355126400"; d="scan'208";a="304767351"
Received: from envy.jf.intel.com (HELO localhost) ([10.7.199.65])
	by orsmga002.jf.intel.com with ESMTP; 19 Mar 2013 15:15:22 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Mar 2013 15:15:03 -0700
Message-Id: <0b664a4bee7c5f6a1a6226621679bedd1b28ffa5.1363731212.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1363731212.git.dvhart@linux.intel.com>
References: <cover.1363731212.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1363731212.git.dvhart@linux.intel.com>
References: <cover.1363731212.git.dvhart@linux.intel.com>
Subject: [PATCH 3/6] mkefidisk: Boot with ro kernel parameter instead of rw
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Mar 2013 22:32:38 -0000

There is no need to boot with "rw". Booting with "ro" will allow for
fsck to be run during boot, and a proper /etc/fstab will still ensure
the rootfs is "rw" by the time the user can interact with the system.

Change the "rw" to "ro" in the kernel parameters specified in the
generated grub.cfg file.

Fixes [YOCTO 4036] mkefidisk.sh hardcodes 'rw' as root mount option

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
---
 scripts/contrib/mkefidisk.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index c68c224..9275ecf 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -253,7 +253,7 @@ sed -i "s/ LABEL=[^ ]*/ /" $GRUBCFG
 # Replace the ramdisk root (if any) with the install device and include other
 # kernel parameters
 sed -i "s@ root=[^ ]*@ @" $GRUBCFG
-sed -i "s@vmlinuz @vmlinuz root=$TARGET_ROOTFS rw $ROOTWAIT quiet @" $GRUBCFG
+sed -i "s@vmlinuz @vmlinuz root=$TARGET_ROOTFS ro $ROOTWAIT quiet @" $GRUBCFG
 
 # Provide a startup.nsh script for older firmware with non-standard boot
 # directories and paths.
-- 
1.8.1.2



