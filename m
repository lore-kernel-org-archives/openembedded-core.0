Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Davide Gardenal" <davidegarde2000@gmail.com>
Subject: [oe-core][dunfell][PATCH v2] qemu: backport fix for CVE-2020-13253
Date: Fri, 18 Mar 2022 09:47:57 +0100
Message-Id: <20220318084757.51541-1-davide.gardenal@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>

Backport commits from the following MR:
https://git.qemu.org/?p=qemu.git;a=commit;h=3a9163af4e3dd61795a35d47b702e302f98f81d6

Two other commits have been backported in order to be able
to correctly apply the patches.

CVE: CVE-2020-13253

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   5 +
 .../qemu/qemu/CVE-2020-13253_1.patch          |  50 +++++++
 .../qemu/qemu/CVE-2020-13253_2.patch          | 112 ++++++++++++++
 .../qemu/qemu/CVE-2020-13253_3.patch          |  86 +++++++++++
 .../qemu/qemu/CVE-2020-13253_4.patch          | 139 ++++++++++++++++++
 .../qemu/qemu/CVE-2020-13253_5.patch          |  54 +++++++
 6 files changed, 446 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13253_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13253_2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13253_3.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13253_4.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-13253_5.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index ef9bc3f64a..0bdc917783 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -92,6 +92,11 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-27617.patch \
            file://CVE-2020-28916.patch \
            file://CVE-2021-3682.patch \
+           file://CVE-2020-13253_1.patch \
+           file://CVE-2020-13253_2.patch \
+           file://CVE-2020-13253_3.patch \
+           file://CVE-2020-13253_4.patch \
+           file://CVE-2020-13253_5.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-13253_1.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-13253_1.patch
new file mode 100644
index 0000000000..7f8383987c
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-13253_1.patch
@@ -0,0 +1,50 @@
+From 6dd3a164f5b31c703c7d8372841ad3bd6a57de6d Mon Sep 17 00:00:00 2001
+From: =?utf8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
+Date: Tue, 5 Jun 2018 22:28:51 -0300
+Subject: [PATCH 1/1] hw/sd/sdcard: Simplify realize() a bit
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf8
+Content-Transfer-Encoding: 8bit
+
+We don't need to check if sd->blk is set twice.
+
+Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
+Signed-off-by: Philippe Mathieu-DaudÃ© <f4bug@amsat.org>
+Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
+Message-Id: <20200630133912.9428-18-f4bug@amsat.org>
+
+Upstram-Status: Backport:
+https://git.qemu.org/?p=qemu.git;a=commit;f=hw/sd/sd.c;h=6dd3a164f5b31c703c7d8372841ad3bd6a57de6d
+
+CVE: CVE-2020-13253
+
+Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
+---
+ hw/sd/sd.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/hw/sd/sd.c b/hw/sd/sd.c
+index 1cc16bf..edd60a0 100644
+--- a/hw/sd/sd.c
++++ b/hw/sd/sd.c
+@@ -2105,12 +2105,12 @@ static void sd_realize(DeviceState *dev, Error **errp)
+         return;
+     }
+ 
+-    if (sd->blk && blk_is_read_only(sd->blk)) {
+-        error_setg(errp, "Cannot use read-only drive as SD card");
+-        return;
+-    }
+-
+     if (sd->blk) {
++        if (blk_is_read_only(sd->blk)) {
++            error_setg(errp, "Cannot use read-only drive as SD card");
++            return;
++        }
++
+         ret = blk_set_perm(sd->blk, BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE,
+                            BLK_PERM_ALL, errp);
+         if (ret < 0) {
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-13253_2.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-13253_2.patch
new file mode 100644
index 0000000000..53145d059f
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-13253_2.patch
@@ -0,0 +1,112 @@
+From a9bcedd15a5834ca9ae6c3a97933e85ac7edbd36 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
+Date: Tue, 7 Jul 2020 13:02:34 +0200
+Subject: [PATCH] hw/sd/sdcard: Do not allow invalid SD card sizes
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+QEMU allows to create SD card with unrealistic sizes. This could
+work, but some guests (at least Linux) consider sizes that are not
+a power of 2 as a firmware bug and fix the card size to the next
+power of 2.
+
+While the possibility to use small SD card images has been seen as
+a feature, it became a bug with CVE-2020-13253, where the guest is
+able to do OOB read/write accesses past the image size end.
+
+In a pair of commits we will fix CVE-2020-13253 as:
+
+    Read command is rejected if BLOCK_LEN_ERROR or ADDRESS_ERROR
+    occurred and no data transfer is performed.
+
+    Write command is rejected if BLOCK_LEN_ERROR or ADDRESS_ERROR
+    occurred and no data transfer is performed.
+
+    WP_VIOLATION errors are not modified: the error bit is set, we
+    stay in receive-data state, wait for a stop command. All further
+    data transfer is ignored. See the check on sd->card_status at the
+    beginning of sd_read_data() and sd_write_data().
+
+While this is the correct behavior, in case QEMU create smaller SD
+cards, guests still try to access past the image size end, and QEMU
+considers this is an invalid address, thus "all further data transfer
+is ignored". This is wrong and make the guest looping until
+eventually timeouts.
+
+Fix by not allowing invalid SD card sizes (suggesting the expected
+size as a hint):
+
+  $ qemu-system-arm -M orangepi-pc -drive file=rootfs.ext2,if=sd,format=raw
+  qemu-system-arm: Invalid SD card size: 60 MiB
+  SD card size has to be a power of 2, e.g. 64 MiB.
+  You can resize disk images with 'qemu-img resize <imagefile> <new-size>'
+  (note that this will lose data if you make the image smaller than it currently is).
+
+Cc: qemu-stable@nongnu.org
+Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
+Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
+Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
+Message-Id: <20200713183209.26308-8-f4bug@amsat.org>
+
+Upstram-Status: Backport:
+https://git.qemu.org/?p=qemu.git;a=commit;h=a9bcedd15a5834ca9ae6c3a97933e85ac7edbd36
+
+CVE: CVE-2020-13253
+
+Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
+---
+ hw/sd/sd.c | 25 +++++++++++++++++++++++++
+ 1 file changed, 25 insertions(+)
+
+diff --git a/hw/sd/sd.c b/hw/sd/sd.c
+index edd60a09c0..76d68359a4 100644
+--- a/hw/sd/sd.c
++++ b/hw/sd/sd.c
+@@ -32,6 +32,7 @@
+ 
+ #include "qemu/osdep.h"
+ #include "qemu/units.h"
++#include "qemu/cutils.h"
+ #include "hw/irq.h"
+ #include "hw/registerfields.h"
+ #include "sysemu/block-backend.h"
+@@ -2106,11 +2107,35 @@ static void sd_realize(DeviceState *dev, Error **errp)
+     }
+ 
+     if (sd->blk) {
++        int64_t blk_size;
++
+         if (blk_is_read_only(sd->blk)) {
+             error_setg(errp, "Cannot use read-only drive as SD card");
+             return;
+         }
+ 
++        blk_size = blk_getlength(sd->blk);
++        if (blk_size > 0 && !is_power_of_2(blk_size)) {
++            int64_t blk_size_aligned = pow2ceil(blk_size);
++            char *blk_size_str;
++
++            blk_size_str = size_to_str(blk_size);
++            error_setg(errp, "Invalid SD card size: %s", blk_size_str);
++            g_free(blk_size_str);
++
++            blk_size_str = size_to_str(blk_size_aligned);
++            error_append_hint(errp,
++                              "SD card size has to be a power of 2, e.g. %s.\n"
++                              "You can resize disk images with"
++                              " 'qemu-img resize <imagefile> <new-size>'\n"
++                              "(note that this will lose data if you make the"
++                              " image smaller than it currently is).\n",
++                              blk_size_str);
++            g_free(blk_size_str);
++
++            return;
++        }
++
+         ret = blk_set_perm(sd->blk, BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE,
+                            BLK_PERM_ALL, errp);
+         if (ret < 0) {
+-- 
+2.32.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-13253_3.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-13253_3.patch
new file mode 100644
index 0000000000..b512b2bd7f
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-13253_3.patch
@@ -0,0 +1,86 @@
+From 794d68de2f021a6d3874df41d6bbe8590ec05207 Mon Sep 17 00:00:00 2001
+From: =?utf8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
+Date: Mon, 13 Jul 2020 09:27:35 +0200
+Subject: [PATCH] hw/sd/sdcard: Update coding style to make checkpatch.pl happy
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf8
+Content-Transfer-Encoding: 8bit
+
+To make the next commit easier to review, clean this code first.
+
+Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
+Signed-off-by: Philippe Mathieu-DaudÃ© <f4bug@amsat.org>
+Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
+Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
+Message-Id: <20200630133912.9428-3-f4bug@amsat.org>
+
+Upstram-Status: Backport:
+https://git.qemu.org/?p=qemu.git;a=commit;f=hw/sd/sd.c;h=794d68de2f021a6d3874df41d6bbe8590ec05207
+
+CVE: CVE-2020-13253
+
+Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
+---
+diff --git a/hw/sd/sd.c b/hw/sd/sd.c
+--- a/hw/sd/sd.c	(revision b0ca999a43a22b38158a222233d3f5881648bb4f)
++++ b/hw/sd/sd.c	(date 1647514442924)
+@@ -1154,8 +1154,9 @@
+             sd->data_start = addr;
+             sd->data_offset = 0;
+ 
+-            if (sd->data_start + sd->blk_len > sd->size)
++            if (sd->data_start + sd->blk_len > sd->size) {
+                 sd->card_status |= ADDRESS_ERROR;
++            }
+             return sd_r1;
+ 
+         default:
+@@ -1170,8 +1171,9 @@
+             sd->data_start = addr;
+             sd->data_offset = 0;
+ 
+-            if (sd->data_start + sd->blk_len > sd->size)
++            if (sd->data_start + sd->blk_len > sd->size) {
+                 sd->card_status |= ADDRESS_ERROR;
++            }
+             return sd_r1;
+ 
+         default:
+@@ -1216,12 +1218,15 @@
+             sd->data_offset = 0;
+             sd->blk_written = 0;
+ 
+-            if (sd->data_start + sd->blk_len > sd->size)
++            if (sd->data_start + sd->blk_len > sd->size) {
+                 sd->card_status |= ADDRESS_ERROR;
+-            if (sd_wp_addr(sd, sd->data_start))
++            }
++            if (sd_wp_addr(sd, sd->data_start)) {
+                 sd->card_status |= WP_VIOLATION;
+-            if (sd->csd[14] & 0x30)
++            }
++            if (sd->csd[14] & 0x30) {
+                 sd->card_status |= WP_VIOLATION;
++            }
+             return sd_r1;
+ 
+         default:
+@@ -1240,12 +1245,15 @@
+             sd->data_offset = 0;
+             sd->blk_written = 0;
+ 
+-            if (sd->data_start + sd->blk_len > sd->size)
++            if (sd->data_start + sd->blk_len > sd->size) {
+                 sd->card_status |= ADDRESS_ERROR;
+-            if (sd_wp_addr(sd, sd->data_start))
++            }
++            if (sd_wp_addr(sd, sd->data_start)) {
+                 sd->card_status |= WP_VIOLATION;
+-            if (sd->csd[14] & 0x30)
++            }
++            if (sd->csd[14] & 0x30) {
+                 sd->card_status |= WP_VIOLATION;
++            }
+             return sd_r1;
+ 
+         default:
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-13253_4.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-13253_4.patch
new file mode 100644
index 0000000000..6b4c1ec050
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-13253_4.patch
@@ -0,0 +1,139 @@
+From 790762e5487114341cccc5bffcec4cb3c022c3cd Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
+Date: Thu, 4 Jun 2020 19:22:29 +0200
+Subject: [PATCH] hw/sd/sdcard: Do not switch to ReceivingData if address is
+ invalid
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Only move the state machine to ReceivingData if there is no
+pending error. This avoids later OOB access while processing
+commands queued.
+
+  "SD Specifications Part 1 Physical Layer Simplified Spec. v3.01"
+
+  4.3.3 Data Read
+
+  Read command is rejected if BLOCK_LEN_ERROR or ADDRESS_ERROR
+  occurred and no data transfer is performed.
+
+  4.3.4 Data Write
+
+  Write command is rejected if BLOCK_LEN_ERROR or ADDRESS_ERROR
+  occurred and no data transfer is performed.
+
+WP_VIOLATION errors are not modified: the error bit is set, we
+stay in receive-data state, wait for a stop command. All further
+data transfer is ignored. See the check on sd->card_status at the
+beginning of sd_read_data() and sd_write_data().
+
+Fixes: CVE-2020-13253
+
+Cc: qemu-stable@nongnu.org
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Buglink: https://bugs.launchpad.net/qemu/+bug/1880822
+Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
+Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
+Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
+Message-Id: <20200630133912.9428-6-f4bug@amsat.org>
+
+Upstram-Status: Backport:
+https://git.qemu.org/?p=qemu.git;a=commit;h=790762e5487114341cccc5bffcec4cb3c022c3cd
+
+CVE: CVE-2020-13253
+
+Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
+---
+ hw/sd/sd.c | 38 ++++++++++++++++++++++++--------------
+ 1 file changed, 24 insertions(+), 14 deletions(-)
+
+diff --git a/hw/sd/sd.c b/hw/sd/sd.c
+index f4f76f8fd2..fad9cf1ee7 100644
+--- a/hw/sd/sd.c
++++ b/hw/sd/sd.c
+@@ -1171,13 +1171,15 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
+     case 17:	/* CMD17:  READ_SINGLE_BLOCK */
+         switch (sd->state) {
+         case sd_transfer_state:
+-            sd->state = sd_sendingdata_state;
+-            sd->data_start = addr;
+-            sd->data_offset = 0;
+ 
+-            if (sd->data_start + sd->blk_len > sd->size) {
++            if (addr + sd->blk_len > sd->size) {
+                 sd->card_status |= ADDRESS_ERROR;
++                return sd_r1;
+             }
++
++            sd->state = sd_sendingdata_state;
++            sd->data_start = addr;
++            sd->data_offset = 0;
+             return sd_r1;
+ 
+         default:
+@@ -1188,13 +1190,15 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
+     case 18:	/* CMD18:  READ_MULTIPLE_BLOCK */
+         switch (sd->state) {
+         case sd_transfer_state:
+-            sd->state = sd_sendingdata_state;
+-            sd->data_start = addr;
+-            sd->data_offset = 0;
+ 
+-            if (sd->data_start + sd->blk_len > sd->size) {
++            if (addr + sd->blk_len > sd->size) {
+                 sd->card_status |= ADDRESS_ERROR;
++                return sd_r1;
+             }
++
++            sd->state = sd_sendingdata_state;
++            sd->data_start = addr;
++            sd->data_offset = 0;
+             return sd_r1;
+ 
+         default:
+@@ -1234,14 +1238,17 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
+             /* Writing in SPI mode not implemented.  */
+             if (sd->spi)
+                 break;
++
++            if (addr + sd->blk_len > sd->size) {
++                sd->card_status |= ADDRESS_ERROR;
++                return sd_r1;
++            }
++
+             sd->state = sd_receivingdata_state;
+             sd->data_start = addr;
+             sd->data_offset = 0;
+             sd->blk_written = 0;
+ 
+-            if (sd->data_start + sd->blk_len > sd->size) {
+-                sd->card_status |= ADDRESS_ERROR;
+-            }
+             if (sd_wp_addr(sd, sd->data_start)) {
+                 sd->card_status |= WP_VIOLATION;
+             }
+@@ -1261,14 +1268,17 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
+             /* Writing in SPI mode not implemented.  */
+             if (sd->spi)
+                 break;
++
++            if (addr + sd->blk_len > sd->size) {
++                sd->card_status |= ADDRESS_ERROR;
++                return sd_r1;
++            }
++
+             sd->state = sd_receivingdata_state;
+             sd->data_start = addr;
+             sd->data_offset = 0;
+             sd->blk_written = 0;
+ 
+-            if (sd->data_start + sd->blk_len > sd->size) {
+-                sd->card_status |= ADDRESS_ERROR;
+-            }
+             if (sd_wp_addr(sd, sd->data_start)) {
+                 sd->card_status |= WP_VIOLATION;
+             }
+-- 
+2.32.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-13253_5.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-13253_5.patch
new file mode 100644
index 0000000000..ffce610f79
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-13253_5.patch
@@ -0,0 +1,54 @@
+From 9157dd597d293ab7f599f4d96c3fe8a6e07c633d Mon Sep 17 00:00:00 2001
+From: =?utf8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
+Date: Wed, 3 Jun 2020 19:59:16 +0200
+Subject: [PATCH] hw/sd/sdcard: Restrict Class 6 commands to SCSD cards
+MIME-Version: 1.0
+Content-Type: text/plain; charset=utf8
+Content-Transfer-Encoding: 8bit
+
+Only SCSD cards support Class 6 (Block Oriented Write Protection)
+commands.
+
+  "SD Specifications Part 1 Physical Layer Simplified Spec. v3.01"
+
+  4.3.14 Command Functional Difference in Card Capacity Types
+
+  * Write Protected Group
+
+  SDHC and SDXC do not support write-protected groups. Issuing
+  CMD28, CMD29 and CMD30 generates the ILLEGAL_COMMAND error.
+
+Cc: qemu-stable@nongnu.org
+Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
+Signed-off-by: Philippe Mathieu-DaudÃ© <f4bug@amsat.org>
+Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
+Message-Id: <20200630133912.9428-7-f4bug@amsat.org>
+
+Upstram-Status: Backport:
+https://git.qemu.org/?p=qemu.git;a=commit;h=9157dd597d293ab7f599f4d96c3fe8a6e07c633d
+
+CVE: CVE-2020-13253
+
+Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
+---
+ hw/sd/sd.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/hw/sd/sd.c b/hw/sd/sd.c
+index 5137168..1cc16bf 100644
+--- a/hw/sd/sd.c
++++ b/hw/sd/sd.c
+@@ -920,6 +920,11 @@ static sd_rsp_type_t sd_normal_command(SDState *sd, SDRequest req)
+         sd->multi_blk_cnt = 0;
+     }
+ 
++    if (sd_cmd_class[req.cmd] == 6 && FIELD_EX32(sd->ocr, OCR, CARD_CAPACITY)) {
++        /* Only Standard Capacity cards support class 6 commands */
++        return sd_illegal;
++    }
++
+     switch (req.cmd) {
+     /* Basic commands (Class 0 and Class 1) */
+     case 0:	/* CMD0:   GO_IDLE_STATE */
+-- 
+1.8.3.1 
-- 
2.32.0

