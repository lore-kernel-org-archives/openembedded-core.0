Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E0CF578773
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 06:08:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vAH687jL010859
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 16 Nov 2017 22:08:07 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 16 Nov 2017 22:08:06 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Fri, 17 Nov 2017 01:08:03 -0500
Message-ID: <1510898885-256081-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 1/3] systemd: fix formatting IDE storage does not trigger "change" uevents
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
X-List-Received-Date: Fri, 17 Nov 2017 06:08:08 -0000
Content-Type: text/plain

Formatting IDE storage does not trigger "change" uevents. As a result
clients using udev API don't get any updates afterwards and get outdated
information about the device.
...
root@qemux86-64:~# mkfs.ext4 -F /dev/hda1
Creating filesystem with 262144 4k blocks and 65536 inodes
Filesystem UUID: 98791eb2-2bf3-47ad-b4d8-4cf7e914eee2

root@qemux86-64:~# ls /dev/disk/by-uuid/98791eb2-2bf3-47ad-b4d8-4cf7e914eee2
ls: cannot access '/dev/disk/by-uuid/98791eb2-2bf3-47ad-b4d8-4cf7e914eee2': No such file or directory
...
Include hd* in a match for watch option assignment.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...les-watch-metadata-changes-in-ide-devices.patch | 43 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_234.bb           |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0020-rules-watch-metadata-changes-in-ide-devices.patch

diff --git a/meta/recipes-core/systemd/systemd/0020-rules-watch-metadata-changes-in-ide-devices.patch b/meta/recipes-core/systemd/systemd/0020-rules-watch-metadata-changes-in-ide-devices.patch
new file mode 100644
index 0000000..17d698a
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0020-rules-watch-metadata-changes-in-ide-devices.patch
@@ -0,0 +1,43 @@
+From 8207d645582e96c56950674e104653d0cd552d60 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 17 Nov 2017 09:46:00 +0800
+Subject: [PATCH] rules: watch metadata changes in ide devices
+
+Formatting IDE storage does not trigger "change" uevents. As a result
+clients using udev API don't get any updates afterwards and get outdated
+information about the device.
+...
+root@qemux86-64:~# mkfs.ext4 -F /dev/hda1
+Creating filesystem with 262144 4k blocks and 65536 inodes
+Filesystem UUID: 98791eb2-2bf3-47ad-b4d8-4cf7e914eee2
+
+root@qemux86-64:~# ls /dev/disk/by-uuid/98791eb2-2bf3-47ad-b4d8-4cf7e914eee2
+ls: cannot access '/dev/disk/by-uuid/98791eb2-2bf3-47ad-b4d8-4cf7e914eee2': No such file or directory
+...
+Include hd* in a match for watch option assignment.
+
+Upstream-Status: Denied
+
+qemu by default emulates IDE and the linux-yocto kernel(s) use
+CONFIG_IDE instead of the more modern libsata, so disks appear as
+/dev/hd*. A similar patch rejected by upstream because CONFIG_IDE
+is deprecated.
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ rules/60-block.rules | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/rules/60-block.rules b/rules/60-block.rules
+index 343fc06..b5237da 100644
+--- a/rules/60-block.rules
++++ b/rules/60-block.rules
+@@ -8,4 +8,4 @@ ACTION=="add", SUBSYSTEM=="module", KERNEL=="block", ATTR{parameters/events_dfl_
+ ACTION=="change", SUBSYSTEM=="scsi", ENV{DEVTYPE}=="scsi_device", TEST=="block", ATTR{block/*/uevent}="change"
+ 
+ # watch metadata changes, caused by tools closing the device node which was opened for writing
+-ACTION!="remove", SUBSYSTEM=="block", KERNEL=="loop*|nvme*|sd*|vd*|xvd*|pmem*|mmcblk*", OPTIONS+="watch"
++ACTION!="remove", SUBSYSTEM=="block", KERNEL=="loop*|nvme*|sd*|vd*|xvd*|pmem*|mmcblk*|hd*", OPTIONS+="watch"
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-core/systemd/systemd_234.bb
index 6b8745b..4283d3d 100644
--- a/meta/recipes-core/systemd/systemd_234.bb
+++ b/meta/recipes-core/systemd/systemd_234.bb
@@ -27,6 +27,7 @@ SRC_URI = "git://github.com/systemd/systemd.git;protocol=git \
            file://0017-remove-duplicate-include-uchar.h.patch \
            file://0018-check-for-uchar.h-in-configure.patch \
            file://0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch \
+           file://0020-rules-watch-metadata-changes-in-ide-devices.patch \
            file://0001-add-fallback-parse_printf_format-implementation.patch \
            file://0002-src-basic-missing.h-check-for-missing-strndupa.patch \
            file://0003-don-t-fail-if-GLOB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch \
-- 
2.8.1


