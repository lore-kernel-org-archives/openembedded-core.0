Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RMk3R-00065C-GQ
	for openembedded-core@lists.openembedded.org;
	Sat, 05 Nov 2011 18:29:19 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Nov 2011 10:23:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,461,1315206000"; d="scan'208";a="33625120"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.12])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Nov 2011 10:23:02 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Nov 2011 10:22:40 -0700
Message-Id: <d18b1fbf8174d4b865b650d905b9de1c87a851c8.1320513631.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320513631.git.sgw@linux.intel.com>
References: <cover.1320513631.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320513631.git.sgw@linux.intel.com>
References: <cover.1320513631.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 10/28] udev-164: Update init script to do an explicit add action
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 05 Nov 2011 17:29:20 -0000

From: Kumar Gala <galak@kernel.crashing.org>

With udev 152 or greater the default action for 'udevadm trigger' was
modified to be 'change' instead of 'add.

To ensure initial coldplug events at boot are seen be scripts the are
expecting them as 'add' events we invoke udevadm with an explicit
'--action=add'.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/recipes-core/udev/udev-164/init |    4 ++--
 meta/recipes-core/udev/udev_164.bb   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/udev/udev-164/init b/meta/recipes-core/udev/udev-164/init
index 9ce95ee..073942f 100644
--- a/meta/recipes-core/udev/udev-164/init
+++ b/meta/recipes-core/udev/udev-164/init
@@ -48,10 +48,10 @@ kill_udevd > "/dev/null" 2>&1
 
         /sbin/udevadm control --env=STARTUP=1
 		if [ "$not_first_boot" != "" ];then
-			/sbin/udevadm trigger --subsystem-nomatch=tty --subsystem-nomatch=mem --subsystem-nomatch=vc --subsystem-nomatch=vtconsole --subsystem-nomatch=misc --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus  --subsystem-nomatch=graphics  --subsystem-nomatch=backlight --subsystem-nomatch=video4linux  --subsystem-nomatch=platform
+			/sbin/udevadm trigger --action=add --subsystem-nomatch=tty --subsystem-nomatch=mem --subsystem-nomatch=vc --subsystem-nomatch=vtconsole --subsystem-nomatch=misc --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus  --subsystem-nomatch=graphics  --subsystem-nomatch=backlight --subsystem-nomatch=video4linux  --subsystem-nomatch=platform
 			(/sbin/udevadm settle --timeout=3; /sbin/udevadm control --env=STARTUP=)&
 		else
-			/sbin/udevadm trigger
+			/sbin/udevadm trigger --action=add
 			/sbin/udevadm settle
 		fi
 
diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/udev_164.bb
index 7cbe4d8..d487add 100644
--- a/meta/recipes-core/udev/udev_164.bb
+++ b/meta/recipes-core/udev/udev_164.bb
@@ -1,6 +1,6 @@
 include udev-new.inc
 
-PR = "r6"
+PR = "r7"
 
 SRC_URI += "file://udev-166-v4l1-1.patch"
 
-- 
1.7.6.4



