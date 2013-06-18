Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E1506A622
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 12:14:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5ICEITd005990
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 05:14:18 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.153) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 18 Jun 2013 05:14:17 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Jun 2013 20:14:14 +0800
Message-ID: <70ec44838fde3db834022ba74df461a7d90456a9.1371554453.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1371554453.git.hongxu.jia@windriver.com>
References: <cover.1371554453.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] init-live.sh: fix automount failed occasionally
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
X-List-Received-Date: Tue, 18 Jun 2013 12:14:18 -0000
Content-Type: text/plain

Reboot system repeatedly, occasionally found usb automount failed, a
low probability but it happens.
$ df
Filesystem           1K-blocks      Used Available Use% Mounted on
none                   1024972         4   1024968   0% /dev
/dev/sda3              7689384   3540940   3757840  49% /media/sda3
/dev/sda2            146127424   1238432 137466120   1% /media/sda2
/dev/sda1                17845     14570      2354  86% /media/sda1
/dev/sdb                293400    288560      4840  98% /media/sdb
/dev/sdc4               457632        32    457600   0% /media/sdc4
/dev/sdc1               475018      2321    447749   1% /media/sdc1
/dev/sdd               1382298   1382298         0 100% /media/sdd
/dev/sdc2               475694      2320    448374   1% /media/sdc2
/dev/loop0              270649    181249     75644  71% /
df: /media/sdc3: No such file or directory
tmpfs                  1029352         0   1029352   0% /dev/shm
tmpfs                  1029352      2816   1026536   0% /run
tmpfs                  1029352         0   1029352   0% /sys/fs/cgroup
tmpfs                  1029352         4   1029348   0% /tmp
tmpfs                  1029352         0   1029352   0% /media/ram
tmpfs                  1029352       116   1029236   0% /var/volatile

When boot media has been found, udev will be killed. If udev is busy
to mount other medias at the killing time (especially medias is many),
the above issue will occur occasionally.

Invoke `udevadm settle' before killing udev will resolve this
issue, it watches the udev event queue, and exits if all current
events are handled.

Use variable `_UDEV_DAEMON' to replace hardcoded `udevd' to keep
consistent with previous.

[YOCTO #4745]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/initrdscripts/files/init-live.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index 804e16e..82042bf 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -75,7 +75,9 @@ read_args() {
 }
 
 boot_live_root() {
-    killall udevd 2>/dev/null
+    # Watches the udev event queue, and exits if all current events are handled
+    udevadm settle --timeout=3 --quiet
+    killall "${_UDEV_DAEMON##*/}" 2>/dev/null
 
     # Move the mount points of some filesystems over to
     # the corresponding directories under the real root filesystem.
-- 
1.8.1.2


