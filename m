Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1TYNwX-0006Pc-JJ
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 22:22:50 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 Nov 2012 13:07:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,768,1352102400"; d="scan'208";a="246539782"
Received: from dell-desktop (HELO localhost.localdomain) ([10.237.105.32])
	by fmsmga001.fm.intel.com with ESMTP; 13 Nov 2012 13:07:48 -0800
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2012 23:12:24 +0200
Message-Id: <1352841144-31228-1-git-send-email-radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Alexandru Damian <alexandru.damian@intel.com>
Subject: [PATCH v2] initrd: add recovery feature
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
X-List-Received-Date: Tue, 13 Nov 2012 21:22:50 -0000

Allows you to use as root a partition instead of the rootfs.img
for recovering an old install, and fails safe when no rootfs is
found, dropping the user to a shell if something goes wrong.

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
Signed-off-by: Alexandru Damian <alexandru.damian@intel.com>
---
 meta/recipes-core/initrdscripts/files/init-live.sh |   44 +++++++++++++++++++-
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index 5682fd1..81686b9 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -68,13 +68,49 @@ fatal() {
 
 early_setup
 
+# wait for the udevd to settle
+echo "Waiting for udev to settle..."
+udevadm settle --timeout=3
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



