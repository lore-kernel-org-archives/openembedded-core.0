Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Qiai3-0000Wo-IJ
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jul 2011 01:25:15 +0200
Received: from mizar.localdomain (87.5.51.182) by smtp206.alice.it (8.5.124.08)
	id 4DE63E3204945C4D; Mon, 18 Jul 2011 01:21:12 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Jul 2011 01:20:45 +0200
Message-Id: <1310944845-15037-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH] device_table-minimal: add more devices, sync with org.openembedded.dev
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Jul 2011 23:25:15 -0000

* add a layered structure (IMAGE_DEVICE_TABLES foresees that)
*
* In some cases static devices can be of use (e.g. initramfs) but
* unfortunately the file in oe-core lacks input events and more.
* People do not notice the issues because IMAGE_DEV_MANAGER
* recreates the device nodes in userland.
* Though, in the case of e.g. special purposed initramfs images you may
* not have any udev/mdev, nor initscripts.
* Typically one would use smthg like
*
* IMAGE_DEVICE_TABLES = "files/device_table-minimal.txt \
*                        files/device_table_add-scsi.txt \
*                        files/device_table_add-loop.txt \
*                       "

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta/files/device_table-minimal.txt  |   16 +++++++++++++++-
 meta/files/device_table_add-loop.txt |    1 +
 meta/files/device_table_add-scsi.txt |    6 ++++++
 3 files changed, 22 insertions(+), 1 deletions(-)
 create mode 100644 meta/files/device_table_add-loop.txt
 create mode 100644 meta/files/device_table_add-scsi.txt

diff --git a/meta/files/device_table-minimal.txt b/meta/files/device_table-minimal.txt
index 495b5d5..8f455fd 100644
--- a/meta/files/device_table-minimal.txt
+++ b/meta/files/device_table-minimal.txt
@@ -13,7 +13,7 @@
 /dev/apm_bios	c	660	0	46	10	134	-	-	-
 /dev/fb0	c	600	0	0	29	0	-	-	-
 /dev/hda	b	660	0	6	3	0	-	-	-
-/dev/hda	b	660	0	6	3	1	1	1	20
+/dev/hda	b	660	0	6	3	1	1	1	19
 /dev/kmem	c	640	0	15	1	2	-	-	-
 /dev/mem	c	640	0	15	1	1	-	-	-
 /dev/null	c	666	0	0	1	3	-	-	-
@@ -28,3 +28,17 @@
 /dev/console	c	662	0	5	5	1	-	-	-
 /dev/random	c	644	0	0	1	8	-	-	-
 /dev/urandom	c	644	0	0	1	9	-	-	-
+/dev/ptmx	c	644	0	0	5	2	-	-	-
+
+# Input stuff
+/dev/input	d	755	0	0	-	-	-	-	-
+/dev/input/event c	660	0	0	13	64	0	1	8
+
+/dev/mmcblk0	b	660	0	6	179	0	-	-	-
+/dev/mmcblk0p	b	660	0	6	179	1	1	1	7
+
+# for older kernels before 2.6.22
+# mmc numbers are assigned dynamicly so if you have other dynamic assigned block devices it may be wrong
+#
+#/dev/mmcblk0    b       660     0       6       254     0       -       -       -
+#/dev/mmcblk0p   b       660     0       6       254     1       1       1       7
diff --git a/meta/files/device_table_add-loop.txt b/meta/files/device_table_add-loop.txt
new file mode 100644
index 0000000..0176135
--- /dev/null
+++ b/meta/files/device_table_add-loop.txt
@@ -0,0 +1 @@
+/dev/loop	b	664	0	0	7	0	0	1	2
diff --git a/meta/files/device_table_add-scsi.txt b/meta/files/device_table_add-scsi.txt
new file mode 100644
index 0000000..d15f236
--- /dev/null
+++ b/meta/files/device_table_add-scsi.txt
@@ -0,0 +1,6 @@
+/dev/sda	b	660	0	6	8	0	-	-	-
+/dev/sda	b	660	0	6	8	1	1	1	15
+/dev/sdb	b	660	0	6	8	16	-	-	-
+/dev/sdb	b	660	0	6	8	17	1	1	4
+/dev/sdc	b	660	0	6	8	32	-	-	-
+/dev/sdc	b	660	0	6	8	33	1	1	4
-- 
1.7.3.4



