Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1R4Ki7-0005n8-7f
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 00:47:11 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Sep 2011 15:42:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="48916295"
Received: from unknown (HELO localhost) ([10.7.199.145])
	by orsmga001.jf.intel.com with ESMTP; 15 Sep 2011 15:42:01 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Sep 2011 15:41:37 -0700
Message-Id: <646b5593ef8783e642feb6083a79e68ac434d1f2.1316126173.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1316126173.git.dvhart@linux.intel.com>
References: <cover.1316126173.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1316126173.git.dvhart@linux.intel.com>
References: <cover.1316126173.git.dvhart@linux.intel.com>
Subject: [PATCH 1/2] Set an explicit path for the initrd scripts
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
X-List-Received-Date: Thu, 15 Sep 2011 22:47:11 -0000

If we don't set PATH, then the shell will specify one for us.
Busybox adds the sbin dirs, but bash does not. I hit an
issue where bash (among other things) ended up in my initrd
and the boot scripts failed due to a bad default PATH. While
that is a separate issue, we should not be at the mercy of the
shell's default PATH. Update the initrdscripts to all specify:

PATH=/sbin:/bin:/usr/sbin:/usr/bin

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/recipes-core/initrdscripts/files/init-boot.sh |    2 ++
 .../initrdscripts/files/init-install.sh            |    2 ++
 meta/recipes-core/initrdscripts/files/init-live.sh |    4 +++-
 3 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-boot.sh b/meta/recipes-core/initrdscripts/files/init-boot.sh
index 9d804fc..e82eba0 100644
--- a/meta/recipes-core/initrdscripts/files/init-boot.sh
+++ b/meta/recipes-core/initrdscripts/files/init-boot.sh
@@ -1,5 +1,7 @@
 #!/bin/sh
 
+PATH=/sbin:/bin:/usr/sbin:/usr/bin
+
 mkdir /proc
 mkdir /sys
 mount -t proc proc /proc
diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index fb6cea8..d31d994 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -5,6 +5,8 @@
 # install.sh [device_name] [rootfs_name] [video_mode] [vga_mode]
 #
 
+PATH=/sbin:/bin:/usr/sbin:/usr/bin
+
 # We need 20 Mb for the boot partition
 boot_size=20
 
diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index 6a1deba..c054863 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -1,5 +1,7 @@
 #!/bin/sh
 
+PATH=/sbin:/bin:/usr/sbin:/usr/bin
+
 ROOT_MOUNT="/rootfs/"
 ROOT_IMAGE="rootfs.img"
 MOUNT="/bin/mount"
@@ -12,7 +14,7 @@ early_setup() {
     mount -t proc proc /proc
     mount -t sysfs sysfs /sys
     udevd --daemon
-    /sbin/udevadm trigger --action=add
+    udevadm trigger --action=add
 }
 
 read_args() {
-- 
1.7.6



