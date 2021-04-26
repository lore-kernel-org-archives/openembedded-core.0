Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.917.1619398513291207353
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:55:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: VOKrF3JPR//A6wCfcFNwBLJr8CMt5EmCdOAlZ6EPnM8XO7RxF4jgn9ySMvF98i+vl1UcIDxXmm
 g47sBlAGHO2w==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="257568910"
X-IronPort-AV: E=Sophos;i="5.82,250,1613462400"; 
   d="scan'208";a="257568910"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:55:19 -0700
IronPort-SDR: LUYJ/gzPjRBY20pjhGoVdGCETy3wTSvo6LOcHOSLVsVDJsO9bi4jMBVJq6RmKvxTbB2rC/pCiJ
 g6Rtd+d+aoTA==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067610"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:55:18 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 61/64] qemu: fix CVE-2021-3409
Date: Mon, 26 Apr 2021 08:53:32 +0800
Message-Id: <e6fd06544018f37943d4758ea57206f994cd04d3.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

From: Sakib Sajal <sakib.sajal@windriver.com>

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e2fb8c15a64e1f5db678e8e95924da8c88a188c0)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   6 +
 .../qemu/qemu/CVE-2021-3409_1.patch           |  56 +++++++++
 .../qemu/qemu/CVE-2021-3409_2.patch           |  92 +++++++++++++++
 .../qemu/qemu/CVE-2021-3409_3.patch           | 109 ++++++++++++++++++
 .../qemu/qemu/CVE-2021-3409_4.patch           |  75 ++++++++++++
 .../qemu/qemu/CVE-2021-3409_5.patch           |  56 +++++++++
 .../qemu/qemu/CVE-2021-3409_6.patch           |  99 ++++++++++++++++
 7 files changed, 493 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3409_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3409_2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3409_3.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3409_4.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3409_5.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3409_6.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index f118772208..0ac33f87fc 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -37,6 +37,12 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-20181.patch \
            file://CVE-2020-29443.patch \
            file://CVE-2021-20221.patch \
+           file://CVE-2021-3409_1.patch \
+           file://CVE-2021-3409_2.patch \
+           file://CVE-2021-3409_3.patch \
+           file://CVE-2021-3409_4.patch \
+           file://CVE-2021-3409_5.patch \
+           file://CVE-2021-3409_6.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_1.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_1.patch
new file mode 100644
index 0000000000..f9395add43
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_1.patch
@@ -0,0 +1,56 @@
+From c01ae9a35b3c6b4a8e1f1bfa0a0caafe394f8b5c Mon Sep 17 00:00:00 2001
+From: Bin Meng <bmeng.cn@gmail.com>
+Date: Tue, 16 Feb 2021 11:46:52 +0800
+Subject: [PATCH 1/6] hw/sd: sdhci: Simplify updating s->prnsts in
+ sdhci_sdma_transfer_multi_blocks()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+s->prnsts is updated in both branches of the if () else () statement.
+Move the common bits outside so that it is cleaner.
+
+Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
+Tested-by: Alexander Bulekov <alxndr@bu.edu>
+Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
+Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
+Message-Id: <1613447214-81951-5-git-send-email-bmeng.cn@gmail.com>
+Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
+
+Upstream-Status: Backport [8bc1f1aa51d32c3184e7b19d5b94c35ecc06f056]
+CVE: CVE-2021-3409
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/sd/sdhci.c | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
+index 2f8b74a84..f83c5e295 100644
+--- a/hw/sd/sdhci.c
++++ b/hw/sd/sdhci.c
+@@ -596,9 +596,9 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
+         page_aligned = true;
+     }
+ 
++    s->prnsts |= SDHC_DATA_INHIBIT | SDHC_DAT_LINE_ACTIVE;
+     if (s->trnmod & SDHC_TRNS_READ) {
+-        s->prnsts |= SDHC_DOING_READ | SDHC_DATA_INHIBIT |
+-                SDHC_DAT_LINE_ACTIVE;
++        s->prnsts |= SDHC_DOING_READ;
+         while (s->blkcnt) {
+             if (s->data_count == 0) {
+                 sdbus_read_data(&s->sdbus, s->fifo_buffer, block_size);
+@@ -625,8 +625,7 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCIState *s)
+             }
+         }
+     } else {
+-        s->prnsts |= SDHC_DOING_WRITE | SDHC_DATA_INHIBIT |
+-                SDHC_DAT_LINE_ACTIVE;
++        s->prnsts |= SDHC_DOING_WRITE;
+         while (s->blkcnt) {
+             begin = s->data_count;
+             if (((boundary_count + begin) < block_size) && page_aligned) {
+-- 
+2.29.2
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_2.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_2.patch
new file mode 100644
index 0000000000..f3d2bb1375
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_2.patch
@@ -0,0 +1,92 @@
+From b9bb4700798bce98888c51d7b6dbc19ec49159d5 Mon Sep 17 00:00:00 2001
+From: Bin Meng <bmeng.cn@gmail.com>
+Date: Wed, 3 Mar 2021 20:26:35 +0800
+Subject: [PATCH 2/6] hw/sd: sdhci: Don't transfer any data when command time
+ out
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+At the end of sdhci_send_command(), it starts a data transfer if the
+command register indicates data is associated. But the data transfer
+should only be initiated when the command execution has succeeded.
+
+With this fix, the following reproducer:
+
+outl 0xcf8 0x80001810
+outl 0xcfc 0xe1068000
+outl 0xcf8 0x80001804
+outw 0xcfc 0x7
+write 0xe106802c 0x1 0x0f
+write 0xe1068004 0xc 0x2801d10101fffffbff28a384
+write 0xe106800c 0x1f 0x9dacbbcad9e8f7061524334251606f7e8d9cabbac9d8e7f60514233241505f
+write 0xe1068003 0x28 0x80d000251480d000252280d000253080d000253e80d000254c80d000255a80d000256880d0002576
+write 0xe1068003 0x1 0xfe
+
+cannot be reproduced with the following QEMU command line:
+
+$ qemu-system-x86_64 -nographic -M pc-q35-5.0 \
+      -device sdhci-pci,sd-spec-version=3 \
+      -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive \
+      -device sd-card,drive=mydrive \
+      -monitor none -serial none -qtest stdio
+
+Cc: qemu-stable@nongnu.org
+Fixes: CVE-2020-17380
+Fixes: CVE-2020-25085
+Fixes: CVE-2021-3409
+Fixes: d7dfca0807a0 ("hw/sdhci: introduce standard SD host controller")
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Reported-by: Cornelius Aschermann (Ruhr-Universität Bochum)
+Reported-by: Sergej Schumilo (Ruhr-Universität Bochum)
+Reported-by: Simon Wörner (Ruhr-Universität Bochum)
+Buglink: https://bugs.launchpad.net/qemu/+bug/1892960
+Buglink: https://bugs.launchpad.net/qemu/+bug/1909418
+Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1928146
+Acked-by: Alistair Francis <alistair.francis@wdc.com>
+Tested-by: Alexander Bulekov <alxndr@bu.edu>
+Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
+Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
+Message-Id: <20210303122639.20004-2-bmeng.cn@gmail.com>
+Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
+
+Upstream-Status: Backport [b263d8f928001b5cfa2a993ea43b7a5b3a1811e8]
+CVE: CVE-2021-3409
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/sd/sdhci.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
+index f83c5e295..44f8a82ea 100644
+--- a/hw/sd/sdhci.c
++++ b/hw/sd/sdhci.c
+@@ -326,6 +326,7 @@ static void sdhci_send_command(SDHCIState *s)
+     SDRequest request;
+     uint8_t response[16];
+     int rlen;
++    bool timeout = false;
+ 
+     s->errintsts = 0;
+     s->acmd12errsts = 0;
+@@ -349,6 +350,7 @@ static void sdhci_send_command(SDHCIState *s)
+             trace_sdhci_response16(s->rspreg[3], s->rspreg[2],
+                                    s->rspreg[1], s->rspreg[0]);
+         } else {
++            timeout = true;
+             trace_sdhci_error("timeout waiting for command response");
+             if (s->errintstsen & SDHC_EISEN_CMDTIMEOUT) {
+                 s->errintsts |= SDHC_EIS_CMDTIMEOUT;
+@@ -369,7 +371,7 @@ static void sdhci_send_command(SDHCIState *s)
+ 
+     sdhci_update_irq(s);
+ 
+-    if (s->blksize && (s->cmdreg & SDHC_CMD_DATA_PRESENT)) {
++    if (!timeout && s->blksize && (s->cmdreg & SDHC_CMD_DATA_PRESENT)) {
+         s->data_count = 0;
+         sdhci_data_transfer(s);
+     }
+-- 
+2.29.2
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_3.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_3.patch
new file mode 100644
index 0000000000..c3b37ed616
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_3.patch
@@ -0,0 +1,109 @@
+From 405ca416ccc8135544a4fe5732974497244128c9 Mon Sep 17 00:00:00 2001
+From: Bin Meng <bmeng.cn@gmail.com>
+Date: Wed, 3 Mar 2021 20:26:36 +0800
+Subject: [PATCH 3/6] hw/sd: sdhci: Don't write to SDHC_SYSAD register when
+ transfer is in progress
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Per "SD Host Controller Standard Specification Version 7.00"
+chapter 2.2.1 SDMA System Address Register:
+
+This register can be accessed only if no transaction is executing
+(i.e., after a transaction has stopped).
+
+With this fix, the following reproducer:
+
+outl 0xcf8 0x80001010
+outl 0xcfc 0xfbefff00
+outl 0xcf8 0x80001001
+outl 0xcfc 0x06000000
+write 0xfbefff2c 0x1 0x05
+write 0xfbefff0f 0x1 0x37
+write 0xfbefff0a 0x1 0x01
+write 0xfbefff0f 0x1 0x29
+write 0xfbefff0f 0x1 0x02
+write 0xfbefff0f 0x1 0x03
+write 0xfbefff04 0x1 0x01
+write 0xfbefff05 0x1 0x01
+write 0xfbefff07 0x1 0x02
+write 0xfbefff0c 0x1 0x33
+write 0xfbefff0e 0x1 0x20
+write 0xfbefff0f 0x1 0x00
+write 0xfbefff2a 0x1 0x01
+write 0xfbefff0c 0x1 0x00
+write 0xfbefff03 0x1 0x00
+write 0xfbefff05 0x1 0x00
+write 0xfbefff2a 0x1 0x02
+write 0xfbefff0c 0x1 0x32
+write 0xfbefff01 0x1 0x01
+write 0xfbefff02 0x1 0x01
+write 0xfbefff03 0x1 0x01
+
+cannot be reproduced with the following QEMU command line:
+
+$ qemu-system-x86_64 -nographic -machine accel=qtest -m 512M \
+       -nodefaults -device sdhci-pci,sd-spec-version=3 \
+       -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive \
+       -device sd-card,drive=mydrive -qtest stdio
+
+Cc: qemu-stable@nongnu.org
+Fixes: CVE-2020-17380
+Fixes: CVE-2020-25085
+Fixes: CVE-2021-3409
+Fixes: d7dfca0807a0 ("hw/sdhci: introduce standard SD host controller")
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Reported-by: Cornelius Aschermann (Ruhr-Universität Bochum)
+Reported-by: Sergej Schumilo (Ruhr-Universität Bochum)
+Reported-by: Simon Wörner (Ruhr-Universität Bochum)
+Buglink: https://bugs.launchpad.net/qemu/+bug/1892960
+Buglink: https://bugs.launchpad.net/qemu/+bug/1909418
+Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1928146
+Tested-by: Alexander Bulekov <alxndr@bu.edu>
+Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
+Message-Id: <20210303122639.20004-3-bmeng.cn@gmail.com>
+Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
+
+Upstream-Status: Backport [8be45cc947832b3c02144c9d52921f499f2d77fe]
+CVE: CVE-2021-3409
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/sd/sdhci.c | 20 +++++++++++---------
+ 1 file changed, 11 insertions(+), 9 deletions(-)
+
+diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
+index 44f8a82ea..d8a46f307 100644
+--- a/hw/sd/sdhci.c
++++ b/hw/sd/sdhci.c
+@@ -1121,15 +1121,17 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
+ 
+     switch (offset & ~0x3) {
+     case SDHC_SYSAD:
+-        s->sdmasysad = (s->sdmasysad & mask) | value;
+-        MASKED_WRITE(s->sdmasysad, mask, value);
+-        /* Writing to last byte of sdmasysad might trigger transfer */
+-        if (!(mask & 0xFF000000) && TRANSFERRING_DATA(s->prnsts) && s->blkcnt &&
+-                s->blksize && SDHC_DMA_TYPE(s->hostctl1) == SDHC_CTRL_SDMA) {
+-            if (s->trnmod & SDHC_TRNS_MULTI) {
+-                sdhci_sdma_transfer_multi_blocks(s);
+-            } else {
+-                sdhci_sdma_transfer_single_block(s);
++        if (!TRANSFERRING_DATA(s->prnsts)) {
++            s->sdmasysad = (s->sdmasysad & mask) | value;
++            MASKED_WRITE(s->sdmasysad, mask, value);
++            /* Writing to last byte of sdmasysad might trigger transfer */
++            if (!(mask & 0xFF000000) && s->blkcnt && s->blksize &&
++                SDHC_DMA_TYPE(s->hostctl1) == SDHC_CTRL_SDMA) {
++                if (s->trnmod & SDHC_TRNS_MULTI) {
++                    sdhci_sdma_transfer_multi_blocks(s);
++                } else {
++                    sdhci_sdma_transfer_single_block(s);
++                }
+             }
+         }
+         break;
+-- 
+2.29.2
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_4.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_4.patch
new file mode 100644
index 0000000000..d5be99759d
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_4.patch
@@ -0,0 +1,75 @@
+From b672bcaf5522294a4d8de3e88e0932d55585ee3b Mon Sep 17 00:00:00 2001
+From: Bin Meng <bmeng.cn@gmail.com>
+Date: Wed, 3 Mar 2021 20:26:37 +0800
+Subject: [PATCH 4/6] hw/sd: sdhci: Correctly set the controller status for
+ ADMA
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When an ADMA transfer is started, the codes forget to set the
+controller status to indicate a transfer is in progress.
+
+With this fix, the following 2 reproducers:
+
+https://paste.debian.net/plain/1185136
+https://paste.debian.net/plain/1185141
+
+cannot be reproduced with the following QEMU command line:
+
+$ qemu-system-x86_64 -nographic -machine accel=qtest -m 512M \
+      -nodefaults -device sdhci-pci,sd-spec-version=3 \
+      -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive \
+      -device sd-card,drive=mydrive -qtest stdio
+
+Cc: qemu-stable@nongnu.org
+Fixes: CVE-2020-17380
+Fixes: CVE-2020-25085
+Fixes: CVE-2021-3409
+Fixes: d7dfca0807a0 ("hw/sdhci: introduce standard SD host controller")
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Reported-by: Cornelius Aschermann (Ruhr-Universität Bochum)
+Reported-by: Sergej Schumilo (Ruhr-Universität Bochum)
+Reported-by: Simon Wörner (Ruhr-Universität Bochum)
+Buglink: https://bugs.launchpad.net/qemu/+bug/1892960
+Buglink: https://bugs.launchpad.net/qemu/+bug/1909418
+Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1928146
+Tested-by: Alexander Bulekov <alxndr@bu.edu>
+Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
+Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
+Message-Id: <20210303122639.20004-4-bmeng.cn@gmail.com>
+Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
+
+Upstream-Status: Backport [bc6f28995ff88f5d82c38afcfd65406f0ae375aa]
+CVE: CVE-2021-3409
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/sd/sdhci.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
+index d8a46f307..7de03c6dd 100644
+--- a/hw/sd/sdhci.c
++++ b/hw/sd/sdhci.c
+@@ -768,7 +768,9 @@ static void sdhci_do_adma(SDHCIState *s)
+ 
+         switch (dscr.attr & SDHC_ADMA_ATTR_ACT_MASK) {
+         case SDHC_ADMA_ATTR_ACT_TRAN:  /* data transfer */
++            s->prnsts |= SDHC_DATA_INHIBIT | SDHC_DAT_LINE_ACTIVE;
+             if (s->trnmod & SDHC_TRNS_READ) {
++                s->prnsts |= SDHC_DOING_READ;
+                 while (length) {
+                     if (s->data_count == 0) {
+                         sdbus_read_data(&s->sdbus, s->fifo_buffer, block_size);
+@@ -796,6 +798,7 @@ static void sdhci_do_adma(SDHCIState *s)
+                     }
+                 }
+             } else {
++                s->prnsts |= SDHC_DOING_WRITE;
+                 while (length) {
+                     begin = s->data_count;
+                     if ((length + begin) < block_size) {
+-- 
+2.29.2
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_5.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_5.patch
new file mode 100644
index 0000000000..7199056838
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_5.patch
@@ -0,0 +1,56 @@
+From c2298884cf6bcf2b047b4bae5f78432b052b5729 Mon Sep 17 00:00:00 2001
+From: Bin Meng <bmeng.cn@gmail.com>
+Date: Wed, 3 Mar 2021 20:26:38 +0800
+Subject: [PATCH 5/6] hw/sd: sdhci: Limit block size only when SDHC_BLKSIZE
+ register is writable
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The codes to limit the maximum block size is only necessary when
+SDHC_BLKSIZE register is writable.
+
+Tested-by: Alexander Bulekov <alxndr@bu.edu>
+Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
+Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
+Message-Id: <20210303122639.20004-5-bmeng.cn@gmail.com>
+Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
+
+Upstream-Status: Backport [5cd7aa3451b76bb19c0f6adc2b931f091e5d7fcd]
+CVE: CVE-2021-3409
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/sd/sdhci.c | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
+index 7de03c6dd..6c780126e 100644
+--- a/hw/sd/sdhci.c
++++ b/hw/sd/sdhci.c
+@@ -1142,15 +1142,15 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
+         if (!TRANSFERRING_DATA(s->prnsts)) {
+             MASKED_WRITE(s->blksize, mask, extract32(value, 0, 12));
+             MASKED_WRITE(s->blkcnt, mask >> 16, value >> 16);
+-        }
+ 
+-        /* Limit block size to the maximum buffer size */
+-        if (extract32(s->blksize, 0, 12) > s->buf_maxsz) {
+-            qemu_log_mask(LOG_GUEST_ERROR, "%s: Size 0x%x is larger than "
+-                          "the maximum buffer 0x%x\n", __func__, s->blksize,
+-                          s->buf_maxsz);
++            /* Limit block size to the maximum buffer size */
++            if (extract32(s->blksize, 0, 12) > s->buf_maxsz) {
++                qemu_log_mask(LOG_GUEST_ERROR, "%s: Size 0x%x is larger than "
++                              "the maximum buffer 0x%x\n", __func__, s->blksize,
++                              s->buf_maxsz);
+ 
+-            s->blksize = deposit32(s->blksize, 0, 12, s->buf_maxsz);
++                s->blksize = deposit32(s->blksize, 0, 12, s->buf_maxsz);
++            }
+         }
+ 
+         break;
+-- 
+2.29.2
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_6.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_6.patch
new file mode 100644
index 0000000000..624c1f6496
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_6.patch
@@ -0,0 +1,99 @@
+From db916870a839346767b6d5ca7d0eed3128ba5fea Mon Sep 17 00:00:00 2001
+From: Bin Meng <bmeng.cn@gmail.com>
+Date: Wed, 3 Mar 2021 20:26:39 +0800
+Subject: [PATCH 6/6] hw/sd: sdhci: Reset the data pointer of s->fifo_buffer[]
+ when a different block size is programmed
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+If the block size is programmed to a different value from the
+previous one, reset the data pointer of s->fifo_buffer[] so that
+s->fifo_buffer[] can be filled in using the new block size in
+the next transfer.
+
+With this fix, the following reproducer:
+
+outl 0xcf8 0x80001010
+outl 0xcfc 0xe0000000
+outl 0xcf8 0x80001001
+outl 0xcfc 0x06000000
+write 0xe000002c 0x1 0x05
+write 0xe0000005 0x1 0x02
+write 0xe0000007 0x1 0x01
+write 0xe0000028 0x1 0x10
+write 0x0 0x1 0x23
+write 0x2 0x1 0x08
+write 0xe000000c 0x1 0x01
+write 0xe000000e 0x1 0x20
+write 0xe000000f 0x1 0x00
+write 0xe000000c 0x1 0x32
+write 0xe0000004 0x2 0x0200
+write 0xe0000028 0x1 0x00
+write 0xe0000003 0x1 0x40
+
+cannot be reproduced with the following QEMU command line:
+
+$ qemu-system-x86_64 -nographic -machine accel=qtest -m 512M \
+      -nodefaults -device sdhci-pci,sd-spec-version=3 \
+      -drive if=sd,index=0,file=null-co://,format=raw,id=mydrive \
+      -device sd-card,drive=mydrive -qtest stdio
+
+Cc: qemu-stable@nongnu.org
+Fixes: CVE-2020-17380
+Fixes: CVE-2020-25085
+Fixes: CVE-2021-3409
+Fixes: d7dfca0807a0 ("hw/sdhci: introduce standard SD host controller")
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Reported-by: Cornelius Aschermann (Ruhr-Universität Bochum)
+Reported-by: Sergej Schumilo (Ruhr-Universität Bochum)
+Reported-by: Simon Wörner (Ruhr-Universität Bochum)
+Buglink: https://bugs.launchpad.net/qemu/+bug/1892960
+Buglink: https://bugs.launchpad.net/qemu/+bug/1909418
+Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1928146
+Tested-by: Alexander Bulekov <alxndr@bu.edu>
+Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
+Message-Id: <20210303122639.20004-6-bmeng.cn@gmail.com>
+Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
+
+Upstream-Status: Backport [cffb446e8fd19a14e1634c7a3a8b07be3f01d5c9]
+CVE: CVE-2021-3409
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/sd/sdhci.c | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
+index 6c780126e..216842420 100644
+--- a/hw/sd/sdhci.c
++++ b/hw/sd/sdhci.c
+@@ -1140,6 +1140,8 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
+         break;
+     case SDHC_BLKSIZE:
+         if (!TRANSFERRING_DATA(s->prnsts)) {
++            uint16_t blksize = s->blksize;
++
+             MASKED_WRITE(s->blksize, mask, extract32(value, 0, 12));
+             MASKED_WRITE(s->blkcnt, mask >> 16, value >> 16);
+ 
+@@ -1151,6 +1153,16 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t val, unsigned size)
+ 
+                 s->blksize = deposit32(s->blksize, 0, 12, s->buf_maxsz);
+             }
++
++            /*
++             * If the block size is programmed to a different value from
++             * the previous one, reset the data pointer of s->fifo_buffer[]
++             * so that s->fifo_buffer[] can be filled in using the new block
++             * size in the next transfer.
++             */
++            if (blksize != s->blksize) {
++                s->data_count = 0;
++            }
+         }
+ 
+         break;
+-- 
+2.29.2
+
-- 
2.30.2

