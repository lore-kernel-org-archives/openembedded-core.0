Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1TY0CK-0003H8-Fv
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Nov 2012 21:01:32 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 12 Nov 2012 11:47:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,764,1344236400"; d="scan'208";a="167352644"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.32])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Nov 2012 11:47:36 -0800
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Nov 2012 21:52:11 +0200
Message-Id: <1352749931-10687-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Alexandru Damian <alexandru.damian@intel.com>
Subject: [PATCH] initrd: add recovery feature
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
X-List-Received-Date: Mon, 12 Nov 2012 20:01:32 -0000

Allows you to use as root a partition instead of the rootfs.img
for recovering an old install, and fails safe when no rootfs is
found, dropping the user to a shell if something goes wrong.

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
Signed-off-by: Alexandru Damian <alexandru.damian@intel.com>
---
 meta/recipes-core/initrdscripts/files/init-live.sh |   44 +++++++++++++++++++-
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index 5682fd1..0ef30ea 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -68,13 +68,49 @@ fatal() {
 
 early_setup
 
+# wait for the udevd to settle
+echo "Waiting for udev to settle..."
+sleep 3
+
 [ -z "$CONSOLE" ] && CONSOLE="/dev/console"
 
 read_args
 
-echo "Waiting for removable media..."
-while true
+# boot partiton menu, if one or more bootable partitions exist
+BOOTMENU=`ls /media/sd*/sbin/init 2>/dev/null | wc -l`
+if [ $BOOTMENU -gt 0 ]; then
+   choice=0
+   while [ $choice -le 0 ]; do
+       echo "1). boot live ramfs image"
+       count=2
+       for i in `ls /media/sd*/sbin/init 2>/dev/null | cut -d "/" -f 3`; do
+           echo $count"). boot /dev/"$i
+           choicecmd[$count]=$i
+           count=$(( count + 1))
+       done
+       echo
+       echo -n "Your choice: "
+       read choice
+   done
+
+   if [ $choice -gt 1 ]; then
+       #ROOT_MOUNT=/media/${choicecmd[${choice}]}
+       ROOT_MOUNT=none #testing
+       echo "Booting local root ... $ROOT_MOUNT"
+       if [ -d $ROOT_MOUNT ]; then
+           boot_live_root
+       else
+           fatal "Rootfs partition not mounted"
+       fi
+   fi
+fi
+
+echo -n "Waiting for removable media... "
+CNT=0
+while [ $CNT -le 3 ];
 do
+  echo -n "$CNT "
+  CNT=$(( $CNT + 1 ))
   for i in `ls /media 2>/dev/null`; do
       if [ -f /media/$i/$ROOT_IMAGE ] ; then
 		found="yes"
@@ -91,6 +127,10 @@ do
   sleep 1
 done
 
+if [ "$found" != "yes" ]; then
+   fatal "...could not mount removable media, drop to shell"
+fi
+
 case $label in
     boot)
 	mkdir $ROOT_MOUNT
-- 
1.7.9.5



