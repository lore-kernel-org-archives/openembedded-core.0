Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 94ABA6B0DF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 09:29:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6C9TbvN028203
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 02:29:37 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Fri, 12 Jul 2013 02:29:36 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Jul 2013 17:29:27 +0800
Message-ID: <f1135779e125e010377ca69cd4f072e538c8390c.1373599041.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1373599041.git.hongxu.jia@windriver.com>
References: <cover.1373599041.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] udev-extraconf:fix xuser write to usb storage failed
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
X-List-Received-Date: Fri, 12 Jul 2013 09:29:35 -0000
Content-Type: text/plain

Rootless X is owned by xuser, the problem is xuser doesn't have permissions to
write usb storage when the type of filesystem is vfat.
...
$ mount
/dev/sdb1 on /media/sdb1 type vfat
...
$ ls /media/ -al
drwxr-xr-x    2 root     root         16384 Jan  1  1970 sdb1
...

The usb storage is mounted to `/media/sd**' by a udev's mount.sh script,
modify the script to invoke pmount by xuser to resolve this issue.

[YOCTO #4004]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 31 ++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)
 mode change 100644 => 100755 meta/recipes-core/udev/udev-extraconf/mount.sh

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
old mode 100644
new mode 100755
index d1419ed..07c8955
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -8,6 +8,7 @@
 MOUNT="/bin/mount"
 PMOUNT="/usr/bin/pmount"
 UMOUNT="/bin/umount"
+PUMOUNT="/usr/bin/pumount"
 for line in `grep -v ^# /etc/udev/mount.blacklist`
 do
 	if [ ` expr match "$DEVNAME" "$line" ` -gt 0 ];
@@ -37,6 +38,28 @@ automount() {
 	fi
 }
 	
+autopmount() {
+	name="`basename "$DEVNAME"`"
+	xusername="root"
+
+	# If rootless X is enable, use a normal user (xuser) to invoke
+	# pmount to mount devices, so the user could have permissions
+	# to access the storage device.
+	if [ -f /etc/X11/Xusername ]; then
+		xusername="`cat /etc/X11/Xusername`"
+	fi
+
+	su -l -c "$PMOUNT -f $DEVNAME >/dev/null 2>&1" $xusername
+	grep -q "^$DEVNAME " /proc/mounts
+	if [ $? -ne 0 ];then
+		# logger "mount.sh/autopmount" "$PMOUNT $DEVNAME \"/media/$name\" failed!"
+		rm_dir "/media/$name"
+	else
+		logger "mount.sh/autopmount" "Auto-mount of [/media/$name] successful"
+		touch "/tmp/.automount-$name"
+	fi
+}
+
 rm_dir() {
 	# We do not want to rm -r populated directories
 	if test "`find "$1" | wc -l | tr -d " "`" -lt 2 -a -d "$1"
@@ -49,7 +72,7 @@ rm_dir() {
 
 if [ "$ACTION" = "add" ] && [ -n "$DEVNAME" ] && [ -n "$ID_FS_TYPE" ]; then
 	if [ -x "$PMOUNT" ]; then
-		$PMOUNT $DEVNAME 2> /dev/null
+		autopmount
 	elif [ -x $MOUNT ]; then
     		$MOUNT $DEVNAME 2> /dev/null
 	fi
@@ -67,7 +90,11 @@ fi
 if [ "$ACTION" = "remove" ] && [ -x "$UMOUNT" ] && [ -n "$DEVNAME" ]; then
 	for mnt in `cat /proc/mounts | grep "$DEVNAME" | cut -f 2 -d " " `
 	do
-		$UMOUNT $mnt
+		if [ -x "$PUMOUNT" ]; then
+			$PUMOUNT $mnt
+		else
+			$UMOUNT $mnt
+		fi
 	done
 	
 	# Remove empty directories from auto-mounter
-- 
1.8.1.2


