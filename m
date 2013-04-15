Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1URd5C-0002Kr-Jx
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 08:40:26 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r3F6Mb4G021640
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Apr 2013 23:22:37 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Sun, 14 Apr 2013 23:22:37 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Apr 2013 14:22:32 +0800
Message-ID: <91285501c1167a2e642490b19fc0bb47c94a6512.1366006383.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1366006383.git.hongxu.jia@windriver.com>
References: <cover.1366006383.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] udev-extraconf:fix rootless X write to usb storage failed
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
X-List-Received-Date: Mon, 15 Apr 2013 06:40:29 -0000
Content-Type: text/plain

Rootless X is owned by xuser, the problem is xuser doesn't have permissions to
write usb storage when the type of filesystem is not one of ext2/3/4 and btrfs.
...
mount
/dev/sdb1 on /media/sdb1 type ext4
/dev/sdb2 on /media/sdb2 type vfat
/dev/sdb3 on /media/sdb3 type ntfs
/dev/sdb4 on /media/sdb4 type btrfs
/dev/sdb2 on /media/sdb5 type jfs
/dev/sdb1 on /media/sdb6 type xfs
...
ls /media/ -al
drwx------    3 xuser    xuser         1024 Apr 10 09:08 sdb1
drwxr-xr-x    2 root     root         16384 Jan  1  1970 sdb2
drwx------    1 root     root          4096 Apr 10 09:12 sdb3
drwx------    1 xuser    xuser            0 Apr 10 09:14 sdb4
drwxr-xr-x    2 root     root             6 Apr 10 09:39 sdb5
drwxr-xr-x    2 root     root           256 Apr 10 09:39 sdb6
...

The usb storage is mounted to dir `/media/sd**' by a udev's mount.sh script,
Modify the script to change the group owner of dir to `disk', and grant w/r/x
permissions to it, so the one (such as xuser) in the disk group could access
the storage.

There are two solutions to do according to the type of USB's filesystem.
1, For vfat, fat, ntfs, add mount option `gid' and `umask'.
2, For others, invoke chgrp and chmod after mount.

[YOCTO #4004]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index 97af608..fbec5b4 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -27,11 +27,30 @@ automount() {
 		MOUNT="$MOUNT -o silent"
 	fi
 	
+	local invoke_chown=""
+	# According to the type of filesystem, there are two solutions to change
+	# the group owner of storage to `disk' and grant w/r/x permissions.
+	case $ID_FS_TYPE in
+	vfat|fat|ntfs)
+		# By mount.
+		MOUNT="$MOUNT -o umask=007,gid=`awk -F':' '/^disk/{print $3}' /etc/group`"
+		;;
+	# Such as btrfs, minix, xfs, jfs, ext2, ext3, ext4, nilfs2.
+	*)
+		# By invoking chgrp and chmod after mount.
+		invoke_chgrp="1"
+		;;
+	esac
+
 	if ! $MOUNT -t auto $DEVNAME "/media/$name"
 	then
 		#logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME \"/media/$name\" failed!"
 		rm_dir "/media/$name"
 	else
+		if [ "$invoke_chgrp" = "1" ]; then
+			chgrp "disk" "/media/$name"
+			chmod g+wrx "/media/$name"
+		fi
 		logger "mount.sh/automount" "Auto-mount of [/media/$name] successful"
 		touch "/tmp/.automount-$name"
 	fi
-- 
1.7.10.4



