Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1URoWN-0003UC-Pi
	for Openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 20:53:08 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 Apr 2013 11:34:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,477,1363158000"; d="scan'208";a="318580299"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by orsmga002.jf.intel.com with ESMTP; 15 Apr 2013 11:33:46 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2013 11:33:46 -0700
Message-Id: <daabc4661d7ffcfd6663e43fc921a8bb17434470.1366050697.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1366050697.git.nitin.a.kamble@intel.com>
References: <cover.1366050697.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/1] initramfs-live-install*: fix the "install" boot option
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
X-List-Received-Date: Mon, 15 Apr 2013 18:53:11 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The install boot option was giving the following error when one tried to
install the live image on a  permanent storage of a BSP.

cat: write error Invalid argument
Installation image failed
sh: can't access tty: job control turned off

Further digging into the issue, found out that the install script was trying
to do this:
 cat /proc/mounts > /etc/mtab

And in the base-files recipe the /etc/mtab is made soft link to /proc/mounts.
So the cat command was failing to write on /etc/mtab. As the contents of
the /proc/mounts is already reflected in the /etc/mtab file due to the
symlink-ing, there is no need for this step to recreate /etc/mtab in the
install script. So just removing this unnecessary step, which solves the
install issue of the live images.

Fixes this bug:
[YOCTO #4229]

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../initrdscripts/files/init-install-efi.sh        |    1 -
 .../initrdscripts/files/init-install.sh            |    1 -
 .../initramfs-live-install-efi_1.0.bb              |    2 +-
 .../initrdscripts/initramfs-live-install_1.0.bb    |    2 +-
 4 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index 23228c9..9f7a9e7 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -66,7 +66,6 @@ rm -f /etc/udev/scripts/mount*
 umount /dev/${device}* 2> /dev/null || /bin/true
 
 mkdir -p /tmp
-cat /proc/mounts > /etc/mtab
 
 disk_size=$(parted /dev/${device} unit mb print | grep Disk | cut -d" " -f 3 | sed -e "s/MB//")
 
diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index d2a0db3..2ecd333 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -78,7 +78,6 @@ if [ ! -b /dev/loop0 ] ; then
 fi
 
 mkdir -p /tmp
-cat /proc/mounts > /etc/mtab
 
 disk_size=$(parted /dev/${device} unit mb print | grep Disk | cut -d" " -f 3 | sed -e "s/MB//")
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
index 8ad47d4..264931f 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install-efi_1.0.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 SRC_URI = "file://init-install-efi.sh"
 
-PR = "r0"
+PR = "r1"
 
 RDEPENDS_${PN} = "parted e2fsprogs-mke2fs dosfstools"
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
index 0f80f0e..3a8836d 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-install_1.0.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 SRC_URI = "file://init-install.sh"
 
-PR = "r8"
+PR = "r9"
 
 RDEPENDS_${PN} = "grub parted e2fsprogs-mke2fs"
 
-- 
1.7.3.4



