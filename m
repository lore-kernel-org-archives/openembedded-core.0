Return-Path: <Yasir_Khan@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id B09916084E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 14:57:02 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1XHwSd-00068d-IC from Yasir_Khan@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Aug 2014 07:57:03 -0700
Received: from svr-pkl-eng-06.pkl.mentorg.com ([137.202.156.65]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 14 Aug 2014 07:57:03 -0700
From: Yasir Khan <yasir_khan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Aug 2014 19:56:37 +0500
Message-Id: <1408028197-21536-1-git-send-email-yasir_khan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
X-OriginalArrivalTime: 14 Aug 2014 14:57:03.0408 (UTC)
	FILETIME=[0224CB00:01CFB7D0]
Cc: Abbas Raza <Abbas_Raza@mentor.com>
Subject: [PATCH] udev-extraconf: Unmount SD card after ejection
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
X-List-Received-Date: Thu, 14 Aug 2014 14:57:03 -0000

From: Yasir-Khan <yasir_khan@mentor.com>

Adds udev rule to unmount SD card partitions in case of improper
ejection from card reader.

When SD card is ejected from card reader without being unmounted
first, kernel does not generate a REMOVE event, instead it
generates a CHANGE event(only if polling is enabled
/sys/module/block/parameters/events_dfl_poll_msecs) and we don't
have any udev rule in automount.rules to handle this event,so
partitions never get unmounted. Unmounting of partitions can be
done if udev rules handle this CHANGE event.

Signed-off-by: Abbas Raza <Abbas_Raza@mentor.com>
Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
---
 .../udev/udev-extraconf/automount.rules            |    2 +-
 meta/recipes-core/udev/udev-extraconf/mount.sh     |    3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/automount.rules b/meta/recipes-core/udev/udev-extraconf/automount.rules
index 7e844c3..62578ea 100644
--- a/meta/recipes-core/udev/udev-extraconf/automount.rules
+++ b/meta/recipes-core/udev/udev-extraconf/automount.rules
@@ -16,4 +16,4 @@
 # Media automounting
 SUBSYSTEM=="block", ACTION=="add"    RUN+="/etc/udev/scripts/mount.sh"
 SUBSYSTEM=="block", ACTION=="remove" RUN+="/etc/udev/scripts/mount.sh"
-
+SUBSYSTEM=="block", ACTION=="change", ENV{DISK_MEDIA_CHANGE}=="1" RUN+="/etc/udev/scripts/mount.sh"
diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index 7df1b6e..3eea910 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -78,8 +78,7 @@ if [ "$ACTION" = "add" ] && [ -n "$DEVNAME" ] && [ -n "$ID_FS_TYPE" -o "$media_t
 fi
 
 
-
-if [ "$ACTION" = "remove" ] && [ -x "$UMOUNT" ] && [ -n "$DEVNAME" ]; then
+if [ "$ACTION" = "remove" ] || [ "$ACTION" = "change" ] && [ -x "$UMOUNT" ] && [ -n "$DEVNAME" ]; then
 	for mnt in `cat /proc/mounts | grep "$DEVNAME" | cut -f 2 -d " " `
 	do
 		$UMOUNT $mnt
-- 
1.7.9.5


