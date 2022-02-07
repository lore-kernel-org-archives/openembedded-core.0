X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Anuj Mittal" <anuj.mittal@intel.com>
Subject: [hardknott][PATCH 04/12] qemu: fix CVE-2021-20196
Date: Mon,  7 Feb 2022 17:06:54 +0800
Message-Id: <3014cb660e7128f65ee2aec004ede39e80cd891d.1644224643.git.anuj.mittal@intel.com>
In-Reply-To: <cover.1644224643.git.anuj.mittal@intel.com>
References: <cover.1644224643.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Sakib Sajal <sakib.sajal@windriver.com>

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  2 +
 .../qemu/qemu/CVE-2021-20196_1.patch          | 54 +++++++++++++++
 .../qemu/qemu/CVE-2021-20196_2.patch          | 67 +++++++++++++++++++
 3 files changed, 123 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20196_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20196_2.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 35aa3e1d7e..568ef1be94 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -73,6 +73,8 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3713.patch \
            file://CVE-2021-3748.patch \
            file://CVE-2021-3930.patch \
+           file://CVE-2021-20196_1.patch \
+           file://CVE-2021-20196_2.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-20196_1.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-20196_1.patch
new file mode 100644
index 0000000000..8b1ad0423b
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-20196_1.patch
@@ -0,0 +1,54 @@
+From e907ff3d4cb7fd20d402f45355059e67d0dc93e7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
+Date: Wed, 24 Nov 2021 17:15:34 +0100
+Subject: [PATCH 11/12] hw/block/fdc: Extract blk_create_empty_drive()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+We are going to re-use this code in the next commit,
+so extract it as a new blk_create_empty_drive() function.
+
+Inspired-by: Hanna Reitz <hreitz@redhat.com>
+Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
+Message-id: 20211124161536.631563-2-philmd@redhat.com
+Signed-off-by: John Snow <jsnow@redhat.com>
+
+Upstream-Status: Backport [b154791e7b6d4ca5cdcd54443484d97360bd7ad2]
+CVE: CVE-2021-20196
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/block/fdc.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/hw/block/fdc.c b/hw/block/fdc.c
+index 4c2c35e22..854b4f172 100644
+--- a/hw/block/fdc.c
++++ b/hw/block/fdc.c
+@@ -61,6 +61,12 @@
+     } while (0)
+ 
+ 
++/* Anonymous BlockBackend for empty drive */
++static BlockBackend *blk_create_empty_drive(void)
++{
++    return blk_new(qemu_get_aio_context(), 0, BLK_PERM_ALL);
++}
++
+ /********************************************************/
+ /* qdev floppy bus                                      */
+ 
+@@ -543,8 +549,7 @@ static void floppy_drive_realize(DeviceState *qdev, Error **errp)
+     }
+ 
+     if (!dev->conf.blk) {
+-        /* Anonymous BlockBackend for an empty drive */
+-        dev->conf.blk = blk_new(qemu_get_aio_context(), 0, BLK_PERM_ALL);
++        dev->conf.blk = blk_create_empty_drive();
+         ret = blk_attach_dev(dev->conf.blk, qdev);
+         assert(ret == 0);
+ 
+-- 
+2.31.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-20196_2.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-20196_2.patch
new file mode 100644
index 0000000000..dd442ccb8f
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-20196_2.patch
@@ -0,0 +1,67 @@
+From 1d48445a951fd5504190a38abeda70ea9372cf77 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
+Date: Wed, 24 Nov 2021 17:15:35 +0100
+Subject: [PATCH 12/12] hw/block/fdc: Kludge missing floppy drive to fix
+ CVE-2021-20196
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Guest might select another drive on the bus by setting the
+DRIVE_SEL bit of the DIGITAL OUTPUT REGISTER (DOR).
+The current controller model doesn't expect a BlockBackend
+to be NULL. A simple way to fix CVE-2021-20196 is to create
+an empty BlockBackend when it is missing. All further
+accesses will be safely handled, and the controller state
+machines keep behaving correctly.
+
+Cc: qemu-stable@nongnu.org
+Fixes: CVE-2021-20196
+Reported-by: Gaoning Pan (Ant Security Light-Year Lab) <pgn@zju.edu.cn>
+Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Hanna Reitz <hreitz@redhat.com>
+Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
+Message-id: 20211124161536.631563-3-philmd@redhat.com
+BugLink: https://bugs.launchpad.net/qemu/+bug/1912780
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/338
+Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
+Reviewed-by: Hanna Reitz <hreitz@redhat.com>
+Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
+Signed-off-by: John Snow <jsnow@redhat.com>
+
+Upstream-Status: Backport [1ab95af033a419e7a64e2d58e67dd96b20af5233]
+CVE: CVE-2021-20196
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/block/fdc.c | 14 +++++++++++++-
+ 1 file changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/hw/block/fdc.c b/hw/block/fdc.c
+index 854b4f172..a736c4d14 100644
+--- a/hw/block/fdc.c
++++ b/hw/block/fdc.c
+@@ -1365,7 +1365,19 @@ static FDrive *get_drv(FDCtrl *fdctrl, int unit)
+ 
+ static FDrive *get_cur_drv(FDCtrl *fdctrl)
+ {
+-    return get_drv(fdctrl, fdctrl->cur_drv);
++    FDrive *cur_drv = get_drv(fdctrl, fdctrl->cur_drv);
++
++    if (!cur_drv->blk) {
++        /*
++         * Kludge: empty drive line selected. Create an anonymous
++         * BlockBackend to avoid NULL deref with various BlockBackend
++         * API calls within this model (CVE-2021-20196).
++         * Due to the controller QOM model limitations, we don't
++         * attach the created to the controller device.
++         */
++        cur_drv->blk = blk_create_empty_drive();
++    }
++    return cur_drv;
+ }
+ 
+ /* Status A register : 0x00 (read-only) */
+-- 
+2.31.1
+
-- 
2.34.1

