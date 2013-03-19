Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UI54q-0003A7-6l
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 23:32:18 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Mar 2013 15:15:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,874,1355126400"; d="scan'208";a="281920240"
Received: from envy.jf.intel.com (HELO localhost) ([10.7.199.65])
	by orsmga001.jf.intel.com with ESMTP; 19 Mar 2013 15:15:22 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Mar 2013 15:15:05 -0700
Message-Id: <54cd2fd02f17a7ad92325de43b54dac884f5b859.1363731212.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1363731212.git.dvhart@linux.intel.com>
References: <cover.1363731212.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1363731212.git.dvhart@linux.intel.com>
References: <cover.1363731212.git.dvhart@linux.intel.com>
Subject: [PATCH 5/6] mkefidisk: Remove startup.nsh
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
X-List-Received-Date: Tue, 19 Mar 2013 22:32:22 -0000

Most firmware implementations use the EFI specified
EFI/BOOT/bootia32.efi (and similar) boot paths. Only broken firmware
uses different paths for removable media. In those cases, the user can
add their own startup.nsh.

For the compliant case, selecting "Shell" from the EFI boot menu should
go to the shell.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 scripts/contrib/mkefidisk.sh | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index f8c08dd..6ff12af 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -255,10 +255,6 @@ sed -i "s/ LABEL=[^ ]*/ /" $GRUBCFG
 sed -i "s@ root=[^ ]*@ @" $GRUBCFG
 sed -i "s@vmlinuz @vmlinuz root=$TARGET_ROOTFS ro rootwait quiet @" $GRUBCFG
 
-# Provide a startup.nsh script for older firmware with non-standard boot
-# directories and paths.
-echo "bootia32.efi" > $BOOTFS_MNT/startup.nsh
-
 umount $BOOTFS_MNT
 umount $HDDIMG_MNT
 rm -rf $TMPDIR
-- 
1.8.1.2



