Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3A93261018
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 13:27:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8ADRGgq017338
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 06:27:16 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 10 Sep 2013 06:27:15 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Sep 2013 21:27:55 +0800
Message-ID: <e15dc0911656d4fe44025e71ed3b6763841b05db.1378819627.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1378819627.git.Qi.Chen@windriver.com>
References: <cover.1378819627.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] mount.sh: automount cdrom device even if no ID_FS_TYPE available
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
X-List-Received-Date: Tue, 10 Sep 2013 13:27:14 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

This script was modified to check whether $ID_FS_TYPE is empty before
automount, however, for cdrom devices on qemu, the ID_FS_TYPE is not
set, yet the device should be mounted. Otherwise, when booting an iso
image with runqemu, the boot process hangs at 'waiting for removable
media'.

This patch fixes this problem by first checking whether the block device
is a cdrom.

[YOCTO #4487]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index 327cfc6..cb57e47 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -58,7 +58,11 @@ rm_dir() {
 	fi
 }
 
-if [ "$ACTION" = "add" ] && [ -n "$DEVNAME" ] && [ -n "$ID_FS_TYPE" ]; then
+# No ID_FS_TYPE for cdrom device, yet it should be mounted
+name="`basename "$DEVNAME"`"
+[ -e /sys/block/$name/device/media ] && media_type=`cat /sys/block/$name/device/media`
+
+if [ "$ACTION" = "add" ] && [ -n "$DEVNAME" ] && [ -n "$ID_FS_TYPE" -o "$media_type" = "cdrom" ]; then
 	if [ -x "$PMOUNT" ]; then
 		$PMOUNT $DEVNAME 2> /dev/null
 	elif [ -x $MOUNT ]; then
-- 
1.7.9.5


