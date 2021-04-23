Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.5590.1619154715047915273
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 22:11:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 13N5BsZZ024586
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 22:11:54 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 22 Apr 2021 22:11:54 -0700
Received: from localhost.localdomain (128.224.72.54) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Thu, 22 Apr 2021 22:11:53 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH 4/6] qemu: fix CVE-2021-3409
Date: Fri, 23 Apr 2021 01:11:38 -0400
Message-ID: <20210423051140.106348-4-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210423051140.106348-1-sakib.sajal@windriver.com>
References: <20210423051140.106348-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail5.wrs.com id 13N5BsZZ024586
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
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

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
index 8821ab8f1c..13bf6373be 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -34,6 +34,12 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.ta=
r.xz \
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
 UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_1.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3409_1.patch
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
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+s->prnsts is updated in both branches of the if () else () statement.
+Move the common bits outside so that it is cleaner.
+
+Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
+Tested-by: Alexander Bulekov <alxndr@bu.edu>
+Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
+Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
+Message-Id: <1613447214-81951-5-git-send-email-bmeng.cn@gmail.com>
+Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
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
+@@ -596,9 +596,9 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCISt=
ate *s)
+         page_aligned =3D true;
+     }
+=20
++    s->prnsts |=3D SDHC_DATA_INHIBIT | SDHC_DAT_LINE_ACTIVE;
+     if (s->trnmod & SDHC_TRNS_READ) {
+-        s->prnsts |=3D SDHC_DOING_READ | SDHC_DATA_INHIBIT |
+-                SDHC_DAT_LINE_ACTIVE;
++        s->prnsts |=3D SDHC_DOING_READ;
+         while (s->blkcnt) {
+             if (s->data_count =3D=3D 0) {
+                 sdbus_read_data(&s->sdbus, s->fifo_buffer, block_size);
+@@ -625,8 +625,7 @@ static void sdhci_sdma_transfer_multi_blocks(SDHCISt=
ate *s)
+             }
+         }
+     } else {
+-        s->prnsts |=3D SDHC_DOING_WRITE | SDHC_DATA_INHIBIT |
+-                SDHC_DAT_LINE_ACTIVE;
++        s->prnsts |=3D SDHC_DOING_WRITE;
+         while (s->blkcnt) {
+             begin =3D s->data_count;
+             if (((boundary_count + begin) < block_size) && page_aligned=
) {
+--=20
+2.29.2
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_2.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3409_2.patch
new file mode 100644
index 0000000000..f3d2bb1375
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_2.patch
@@ -0,0 +1,92 @@
+From b9bb4700798bce98888c51d7b6dbc19ec49159d5 Mon Sep 17 00:00:00 2001
+From: Bin Meng <bmeng.cn@gmail.com>
+Date: Wed, 3 Mar 2021 20:26:35 +0800
+Subject: [PATCH 2/6] hw/sd: sdhci: Don't transfer any data when command =
time
+ out
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
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
+write 0xe106800c 0x1f 0x9dacbbcad9e8f7061524334251606f7e8d9cabbac9d8e7f6=
0514233241505f
+write 0xe1068003 0x28 0x80d000251480d000252280d000253080d000253e80d00025=
4c80d000255a80d000256880d0002576
+write 0xe1068003 0x1 0xfe
+
+cannot be reproduced with the following QEMU command line:
+
+$ qemu-system-x86_64 -nographic -M pc-q35-5.0 \
+      -device sdhci-pci,sd-spec-version=3D3 \
+      -drive if=3Dsd,index=3D0,file=3Dnull-co://,format=3Draw,id=3Dmydri=
ve \
+      -device sd-card,drive=3Dmydrive \
+      -monitor none -serial none -qtest stdio
+
+Cc: qemu-stable@nongnu.org
+Fixes: CVE-2020-17380
+Fixes: CVE-2020-25085
+Fixes: CVE-2021-3409
+Fixes: d7dfca0807a0 ("hw/sdhci: introduce standard SD host controller")
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Reported-by: Cornelius Aschermann (Ruhr-Universit=C3=A4t Bochum)
+Reported-by: Sergej Schumilo (Ruhr-Universit=C3=A4t Bochum)
+Reported-by: Simon W=C3=B6rner (Ruhr-Universit=C3=A4t Bochum)
+Buglink: https://bugs.launchpad.net/qemu/+bug/1892960
+Buglink: https://bugs.launchpad.net/qemu/+bug/1909418
+Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1928146
+Acked-by: Alistair Francis <alistair.francis@wdc.com>
+Tested-by: Alexander Bulekov <alxndr@bu.edu>
+Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
+Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
+Message-Id: <20210303122639.20004-2-bmeng.cn@gmail.com>
+Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
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
++    bool timeout =3D false;
+=20
+     s->errintsts =3D 0;
+     s->acmd12errsts =3D 0;
+@@ -349,6 +350,7 @@ static void sdhci_send_command(SDHCIState *s)
+             trace_sdhci_response16(s->rspreg[3], s->rspreg[2],
+                                    s->rspreg[1], s->rspreg[0]);
+         } else {
++            timeout =3D true;
+             trace_sdhci_error("timeout waiting for command response");
+             if (s->errintstsen & SDHC_EISEN_CMDTIMEOUT) {
+                 s->errintsts |=3D SDHC_EIS_CMDTIMEOUT;
+@@ -369,7 +371,7 @@ static void sdhci_send_command(SDHCIState *s)
+=20
+     sdhci_update_irq(s);
+=20
+-    if (s->blksize && (s->cmdreg & SDHC_CMD_DATA_PRESENT)) {
++    if (!timeout && s->blksize && (s->cmdreg & SDHC_CMD_DATA_PRESENT)) =
{
+         s->data_count =3D 0;
+         sdhci_data_transfer(s);
+     }
+--=20
+2.29.2
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_3.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3409_3.patch
new file mode 100644
index 0000000000..c3b37ed616
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_3.patch
@@ -0,0 +1,109 @@
+From 405ca416ccc8135544a4fe5732974497244128c9 Mon Sep 17 00:00:00 2001
+From: Bin Meng <bmeng.cn@gmail.com>
+Date: Wed, 3 Mar 2021 20:26:36 +0800
+Subject: [PATCH 3/6] hw/sd: sdhci: Don't write to SDHC_SYSAD register wh=
en
+ transfer is in progress
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
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
+$ qemu-system-x86_64 -nographic -machine accel=3Dqtest -m 512M \
+       -nodefaults -device sdhci-pci,sd-spec-version=3D3 \
+       -drive if=3Dsd,index=3D0,file=3Dnull-co://,format=3Draw,id=3Dmydr=
ive \
+       -device sd-card,drive=3Dmydrive -qtest stdio
+
+Cc: qemu-stable@nongnu.org
+Fixes: CVE-2020-17380
+Fixes: CVE-2020-25085
+Fixes: CVE-2021-3409
+Fixes: d7dfca0807a0 ("hw/sdhci: introduce standard SD host controller")
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Reported-by: Cornelius Aschermann (Ruhr-Universit=C3=A4t Bochum)
+Reported-by: Sergej Schumilo (Ruhr-Universit=C3=A4t Bochum)
+Reported-by: Simon W=C3=B6rner (Ruhr-Universit=C3=A4t Bochum)
+Buglink: https://bugs.launchpad.net/qemu/+bug/1892960
+Buglink: https://bugs.launchpad.net/qemu/+bug/1909418
+Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1928146
+Tested-by: Alexander Bulekov <alxndr@bu.edu>
+Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
+Message-Id: <20210303122639.20004-3-bmeng.cn@gmail.com>
+Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
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
+@@ -1121,15 +1121,17 @@ sdhci_write(void *opaque, hwaddr offset, uint64_=
t val, unsigned size)
+=20
+     switch (offset & ~0x3) {
+     case SDHC_SYSAD:
+-        s->sdmasysad =3D (s->sdmasysad & mask) | value;
+-        MASKED_WRITE(s->sdmasysad, mask, value);
+-        /* Writing to last byte of sdmasysad might trigger transfer */
+-        if (!(mask & 0xFF000000) && TRANSFERRING_DATA(s->prnsts) && s->=
blkcnt &&
+-                s->blksize && SDHC_DMA_TYPE(s->hostctl1) =3D=3D SDHC_CT=
RL_SDMA) {
+-            if (s->trnmod & SDHC_TRNS_MULTI) {
+-                sdhci_sdma_transfer_multi_blocks(s);
+-            } else {
+-                sdhci_sdma_transfer_single_block(s);
++        if (!TRANSFERRING_DATA(s->prnsts)) {
++            s->sdmasysad =3D (s->sdmasysad & mask) | value;
++            MASKED_WRITE(s->sdmasysad, mask, value);
++            /* Writing to last byte of sdmasysad might trigger transfer=
 */
++            if (!(mask & 0xFF000000) && s->blkcnt && s->blksize &&
++                SDHC_DMA_TYPE(s->hostctl1) =3D=3D SDHC_CTRL_SDMA) {
++                if (s->trnmod & SDHC_TRNS_MULTI) {
++                    sdhci_sdma_transfer_multi_blocks(s);
++                } else {
++                    sdhci_sdma_transfer_single_block(s);
++                }
+             }
+         }
+         break;
+--=20
+2.29.2
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_4.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3409_4.patch
new file mode 100644
index 0000000000..d5be99759d
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_4.patch
@@ -0,0 +1,75 @@
+From b672bcaf5522294a4d8de3e88e0932d55585ee3b Mon Sep 17 00:00:00 2001
+From: Bin Meng <bmeng.cn@gmail.com>
+Date: Wed, 3 Mar 2021 20:26:37 +0800
+Subject: [PATCH 4/6] hw/sd: sdhci: Correctly set the controller status f=
or
+ ADMA
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
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
+$ qemu-system-x86_64 -nographic -machine accel=3Dqtest -m 512M \
+      -nodefaults -device sdhci-pci,sd-spec-version=3D3 \
+      -drive if=3Dsd,index=3D0,file=3Dnull-co://,format=3Draw,id=3Dmydri=
ve \
+      -device sd-card,drive=3Dmydrive -qtest stdio
+
+Cc: qemu-stable@nongnu.org
+Fixes: CVE-2020-17380
+Fixes: CVE-2020-25085
+Fixes: CVE-2021-3409
+Fixes: d7dfca0807a0 ("hw/sdhci: introduce standard SD host controller")
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Reported-by: Cornelius Aschermann (Ruhr-Universit=C3=A4t Bochum)
+Reported-by: Sergej Schumilo (Ruhr-Universit=C3=A4t Bochum)
+Reported-by: Simon W=C3=B6rner (Ruhr-Universit=C3=A4t Bochum)
+Buglink: https://bugs.launchpad.net/qemu/+bug/1892960
+Buglink: https://bugs.launchpad.net/qemu/+bug/1909418
+Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1928146
+Tested-by: Alexander Bulekov <alxndr@bu.edu>
+Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
+Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
+Message-Id: <20210303122639.20004-4-bmeng.cn@gmail.com>
+Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
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
+=20
+         switch (dscr.attr & SDHC_ADMA_ATTR_ACT_MASK) {
+         case SDHC_ADMA_ATTR_ACT_TRAN:  /* data transfer */
++            s->prnsts |=3D SDHC_DATA_INHIBIT | SDHC_DAT_LINE_ACTIVE;
+             if (s->trnmod & SDHC_TRNS_READ) {
++                s->prnsts |=3D SDHC_DOING_READ;
+                 while (length) {
+                     if (s->data_count =3D=3D 0) {
+                         sdbus_read_data(&s->sdbus, s->fifo_buffer, bloc=
k_size);
+@@ -796,6 +798,7 @@ static void sdhci_do_adma(SDHCIState *s)
+                     }
+                 }
+             } else {
++                s->prnsts |=3D SDHC_DOING_WRITE;
+                 while (length) {
+                     begin =3D s->data_count;
+                     if ((length + begin) < block_size) {
+--=20
+2.29.2
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_5.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3409_5.patch
new file mode 100644
index 0000000000..7199056838
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_5.patch
@@ -0,0 +1,56 @@
+From c2298884cf6bcf2b047b4bae5f78432b052b5729 Mon Sep 17 00:00:00 2001
+From: Bin Meng <bmeng.cn@gmail.com>
+Date: Wed, 3 Mar 2021 20:26:38 +0800
+Subject: [PATCH 5/6] hw/sd: sdhci: Limit block size only when SDHC_BLKSI=
ZE
+ register is writable
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+The codes to limit the maximum block size is only necessary when
+SDHC_BLKSIZE register is writable.
+
+Tested-by: Alexander Bulekov <alxndr@bu.edu>
+Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
+Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
+Message-Id: <20210303122639.20004-5-bmeng.cn@gmail.com>
+Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
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
+@@ -1142,15 +1142,15 @@ sdhci_write(void *opaque, hwaddr offset, uint64_=
t val, unsigned size)
+         if (!TRANSFERRING_DATA(s->prnsts)) {
+             MASKED_WRITE(s->blksize, mask, extract32(value, 0, 12));
+             MASKED_WRITE(s->blkcnt, mask >> 16, value >> 16);
+-        }
+=20
+-        /* Limit block size to the maximum buffer size */
+-        if (extract32(s->blksize, 0, 12) > s->buf_maxsz) {
+-            qemu_log_mask(LOG_GUEST_ERROR, "%s: Size 0x%x is larger tha=
n "
+-                          "the maximum buffer 0x%x\n", __func__, s->blk=
size,
+-                          s->buf_maxsz);
++            /* Limit block size to the maximum buffer size */
++            if (extract32(s->blksize, 0, 12) > s->buf_maxsz) {
++                qemu_log_mask(LOG_GUEST_ERROR, "%s: Size 0x%x is larger=
 than "
++                              "the maximum buffer 0x%x\n", __func__, s-=
>blksize,
++                              s->buf_maxsz);
+=20
+-            s->blksize =3D deposit32(s->blksize, 0, 12, s->buf_maxsz);
++                s->blksize =3D deposit32(s->blksize, 0, 12, s->buf_maxs=
z);
++            }
+         }
+=20
+         break;
+--=20
+2.29.2
+
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_6.patch b/meta=
/recipes-devtools/qemu/qemu/CVE-2021-3409_6.patch
new file mode 100644
index 0000000000..624c1f6496
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3409_6.patch
@@ -0,0 +1,99 @@
+From db916870a839346767b6d5ca7d0eed3128ba5fea Mon Sep 17 00:00:00 2001
+From: Bin Meng <bmeng.cn@gmail.com>
+Date: Wed, 3 Mar 2021 20:26:39 +0800
+Subject: [PATCH 6/6] hw/sd: sdhci: Reset the data pointer of s->fifo_buf=
fer[]
+ when a different block size is programmed
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
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
+$ qemu-system-x86_64 -nographic -machine accel=3Dqtest -m 512M \
+      -nodefaults -device sdhci-pci,sd-spec-version=3D3 \
+      -drive if=3Dsd,index=3D0,file=3Dnull-co://,format=3Draw,id=3Dmydri=
ve \
+      -device sd-card,drive=3Dmydrive -qtest stdio
+
+Cc: qemu-stable@nongnu.org
+Fixes: CVE-2020-17380
+Fixes: CVE-2020-25085
+Fixes: CVE-2021-3409
+Fixes: d7dfca0807a0 ("hw/sdhci: introduce standard SD host controller")
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Reported-by: Cornelius Aschermann (Ruhr-Universit=C3=A4t Bochum)
+Reported-by: Sergej Schumilo (Ruhr-Universit=C3=A4t Bochum)
+Reported-by: Simon W=C3=B6rner (Ruhr-Universit=C3=A4t Bochum)
+Buglink: https://bugs.launchpad.net/qemu/+bug/1892960
+Buglink: https://bugs.launchpad.net/qemu/+bug/1909418
+Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1928146
+Tested-by: Alexander Bulekov <alxndr@bu.edu>
+Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
+Message-Id: <20210303122639.20004-6-bmeng.cn@gmail.com>
+Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
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
+@@ -1140,6 +1140,8 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t =
val, unsigned size)
+         break;
+     case SDHC_BLKSIZE:
+         if (!TRANSFERRING_DATA(s->prnsts)) {
++            uint16_t blksize =3D s->blksize;
++
+             MASKED_WRITE(s->blksize, mask, extract32(value, 0, 12));
+             MASKED_WRITE(s->blkcnt, mask >> 16, value >> 16);
+=20
+@@ -1151,6 +1153,16 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t=
 val, unsigned size)
+=20
+                 s->blksize =3D deposit32(s->blksize, 0, 12, s->buf_maxs=
z);
+             }
++
++            /*
++             * If the block size is programmed to a different value fro=
m
++             * the previous one, reset the data pointer of s->fifo_buff=
er[]
++             * so that s->fifo_buffer[] can be filled in using the new =
block
++             * size in the next transfer.
++             */
++            if (blksize !=3D s->blksize) {
++                s->data_count =3D 0;
++            }
+         }
+=20
+         break;
+--=20
+2.29.2
+
--=20
2.25.1

