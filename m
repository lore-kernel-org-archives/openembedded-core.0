Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UWN1t-000127-Pr
	for openembedded-core@lists.openembedded.org;
	Sun, 28 Apr 2013 10:32:23 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r3S8ETdD020624
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Apr 2013 01:14:29 -0700 (PDT)
Received: from pek-hjia-d1.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 28 Apr 2013 01:14:28 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 28 Apr 2013 16:14:15 +0800
Message-ID: <56dc88629fbf58c9bfb0427320ac916f79e96364.1367133417.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1367133417.git.hongxu.jia@windriver.com>
References: <cover.1367133417.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] udev-extraconf:fix rootless X write to usb storage failed
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
X-List-Received-Date: Sun, 28 Apr 2013 08:32:23 -0000
Content-Type: text/plain

Rootless X is owned by xuser, the problem is xuser could not have
permissions to write to the usb storage when the file system is
vfat(fat16/fat32):

1)On my distribution(Ubuntu 12.10), usb storage is auto mounted by gnome
rather than udev, udev detects the plugin event and notify gnome to mount
the device, the UID and GID of usb storage is inherited from the gnome's.

  Login with username `jiahongxu', it has permissions to write usb storage:
  ...ubuntu log.......
  $ mount
  /dev/sdb1 on /media/jiahongxu/fat type vfat (uid=1000,gid=1000,dmask=0077)
  $ ls /media/jiahongxu/ -al
  drwx------  2 jiahongxu jiahongxu 16384 Jan  1  1970 fat
  ....................

  Login with username `tester', it has permissions to write usb storage:
  ...ubuntu log.......
  $ mount
  /dev/sdb1 on /media/tester/fat type vfat (uid=1001,gid=1002,dmask=0077)
  $ ls /media/root/ -al
  drwx------  2 tester    tester    16384 Jan  1  1970 fat
  ....................

2)Plug in the previous usb storage to yocto atom which rootless X is enable,
xuser doesn't have permissions to write usb storage, the UID and GID of usb
storage is inherited from udev's (root):
  ...yocto atom log...
  $mount
  /dev/sdb2 on /media/sdb2 type vfat
  $ls /media/ -al
  drwxr-xr-x    2 root     root         16384 Jan  1  1970 sdb2
  ....................

3)In this situation to reference ubuntu, if rootless X is enable, grant
xuser's UID and GID to usb storage while auto mounting by udev.

[YOCTO #4004]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index 97af608..1135472 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -27,6 +27,22 @@ automount() {
 		MOUNT="$MOUNT -o silent"
 	fi
 	
+	# Setting for rootless X
+	if [ -f /etc/X11/Xusername ]; then
+		xusername="`cat /etc/X11/Xusername`"
+		case $ID_FS_TYPE in
+		# Such as fat12,fat16,fat32,vfat,msdos
+		vfat)
+			# Set the owner and group of the storage to xuser, only grant xuser
+			# with w/r/x permissions.
+			MOUNT="$MOUNT -o uid=`id "$xusername" -u`,gid=`id "$xusername" -g`,umask=077"
+			;;
+		*)
+			# TODO
+			;;
+		esac
+	fi
+
 	if ! $MOUNT -t auto $DEVNAME "/media/$name"
 	then
 		#logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME \"/media/$name\" failed!"
-- 
1.7.10.4



