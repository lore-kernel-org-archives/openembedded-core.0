Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1UI54n-0003A7-Nc
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 23:32:13 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Mar 2013 15:15:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,874,1355126400"; d="scan'208";a="281920239"
Received: from envy.jf.intel.com (HELO localhost) ([10.7.199.65])
	by orsmga001.jf.intel.com with ESMTP; 19 Mar 2013 15:15:22 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Mar 2013 15:15:02 -0700
Message-Id: <a45eaa0d5966fbb833744e2e3a85125312b2e0ea.1363731212.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1363731212.git.dvhart@linux.intel.com>
References: <cover.1363731212.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1363731212.git.dvhart@linux.intel.com>
References: <cover.1363731212.git.dvhart@linux.intel.com>
Subject: [PATCH 2/6] mkefidisk: Always specify a root= kernel parameter
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
X-List-Received-Date: Tue, 19 Mar 2013 22:32:14 -0000

The current script only replaces an existing root= kernel parameter
which can result images created without a root= paremeter, even though
the script expects a target rootfs parameter.

Rather than replacing the root= parameter, delete the root= parameter if
it exists, then append an appropriate root= parameter.

Fixes [YOCTO 4035] mkefidisk.sh forgets to add root= parameter

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>
---
 scripts/contrib/mkefidisk.sh | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index 701a4d0..c68c224 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -250,8 +250,10 @@ sed -i "/menuentry 'install'/,/^}/d" $GRUBCFG
 sed -i "/initrd /d" $GRUBCFG
 # Delete any LABEL= strings
 sed -i "s/ LABEL=[^ ]*/ /" $GRUBCFG
-# Replace the ramdisk root with the install device and include other options
-sed -i "s@ root=[^ ]*@ root=$TARGET_ROOTFS rw $ROOTWAIT quiet@" $GRUBCFG
+# Replace the ramdisk root (if any) with the install device and include other
+# kernel parameters
+sed -i "s@ root=[^ ]*@ @" $GRUBCFG
+sed -i "s@vmlinuz @vmlinuz root=$TARGET_ROOTFS rw $ROOTWAIT quiet @" $GRUBCFG
 
 # Provide a startup.nsh script for older firmware with non-standard boot
 # directories and paths.
-- 
1.8.1.2



