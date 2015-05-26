Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2DD1A65C7E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 May 2015 07:20:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t4Q7KPrn013752
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 May 2015 00:20:25 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Tue, 26 May 2015 00:20:24 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 May 2015 15:14:43 +0800
Message-ID: <7198600b6f2ea611b288a2086d9adbb301a83718.1432624313.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1432624313.git.kai.kang@windriver.com>
References: <cover.1432624313.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 1/2] qemu: fix CVE-2015-3456
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
X-List-Received-Date: Tue, 26 May 2015 07:20:26 -0000
Content-Type: text/plain

Backport patch to fix qemuc CVE issue CVE-2015-3456.

Refs:
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-3456
http://git.qemu.org/?p=qemu.git;a=commit;h=e907746266721f305d67bc0718795fedee2e824c

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../qemu/qemu/qemu-CVE-2015-3456.patch             | 92 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.3.0.bb           |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-CVE-2015-3456.patch

diff --git a/meta/recipes-devtools/qemu/qemu/qemu-CVE-2015-3456.patch b/meta/recipes-devtools/qemu/qemu/qemu-CVE-2015-3456.patch
new file mode 100644
index 0000000..f05441f
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/qemu-CVE-2015-3456.patch
@@ -0,0 +1,92 @@
+qemu: CVE-2015-3456
+
+the patch comes from:
+https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-3456
+http://git.qemu.org/?p=qemu.git;a=commit;h=e907746266721f305d67bc0718795fedee2e824c
+
+fdc: force the fifo access to be in bounds of the allocated buffer
+
+During processing of certain commands such as FD_CMD_READ_ID and
+FD_CMD_DRIVE_SPECIFICATION_COMMAND the fifo memory access could
+get out of bounds leading to memory corruption with values coming
+from the guest.
+
+Fix this by making sure that the index is always bounded by the
+allocated memory.
+
+This is CVE-2015-3456.
+
+Signed-off-by: Petr Matousek <pmatouse@redhat.com>
+Reviewed-by: John Snow <jsnow@redhat.com>
+Signed-off-by: John Snow <jsnow@redhat.com>
+Signed-off-by: Li Wang <li.wang@windriver.com>
+
+Upstream-Status: Backport
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ hw/block/fdc.c |   17 +++++++++++------
+ 1 file changed, 11 insertions(+), 6 deletions(-)
+
+diff --git a/hw/block/fdc.c b/hw/block/fdc.c
+index 490d127..045459e 100644
+--- a/hw/block/fdc.c
++++ b/hw/block/fdc.c
+@@ -1436,7 +1436,7 @@ static uint32_t fdctrl_read_data(FDCtrl *fdctrl)
+ {
+     FDrive *cur_drv;
+     uint32_t retval = 0;
+-    int pos;
++    uint32_t pos;
+ 
+     cur_drv = get_cur_drv(fdctrl);
+     fdctrl->dsr &= ~FD_DSR_PWRDOWN;
+@@ -1445,8 +1445,8 @@ static uint32_t fdctrl_read_data(FDCtrl *fdctrl)
+         return 0;
+     }
+     pos = fdctrl->data_pos;
++    pos %= FD_SECTOR_LEN;
+     if (fdctrl->msr & FD_MSR_NONDMA) {
+-        pos %= FD_SECTOR_LEN;
+         if (pos == 0) {
+             if (fdctrl->data_pos != 0)
+                 if (!fdctrl_seek_to_next_sect(fdctrl, cur_drv)) {
+@@ -1790,10 +1790,13 @@ static void fdctrl_handle_option(FDCtrl *fdctrl, int direction)
+ static void fdctrl_handle_drive_specification_command(FDCtrl *fdctrl, int direction)
+ {
+     FDrive *cur_drv = get_cur_drv(fdctrl);
++    uint32_t pos;
+ 
+-    if (fdctrl->fifo[fdctrl->data_pos - 1] & 0x80) {
++    pos = fdctrl->data_pos - 1;
++    pos %= FD_SECTOR_LEN;
++    if (fdctrl->fifo[pos] & 0x80) {
+         /* Command parameters done */
+-        if (fdctrl->fifo[fdctrl->data_pos - 1] & 0x40) {
++        if (fdctrl->fifo[pos] & 0x40) {
+             fdctrl->fifo[0] = fdctrl->fifo[1];
+             fdctrl->fifo[2] = 0;
+             fdctrl->fifo[3] = 0;
+@@ -1893,7 +1896,7 @@ static uint8_t command_to_handler[256];
+ static void fdctrl_write_data(FDCtrl *fdctrl, uint32_t value)
+ {
+     FDrive *cur_drv;
+-    int pos;
++    uint32_t pos;
+ 
+     /* Reset mode */
+     if (!(fdctrl->dor & FD_DOR_nRESET)) {
+@@ -1941,7 +1944,9 @@ static void fdctrl_write_data(FDCtrl *fdctrl, uint32_t value)
+     }
+ 
+     FLOPPY_DPRINTF("%s: %02x\n", __func__, value);
+-    fdctrl->fifo[fdctrl->data_pos++] = value;
++    pos = fdctrl->data_pos++;
++    pos %= FD_SECTOR_LEN;
++    fdctrl->fifo[pos] = value;
+     if (fdctrl->data_pos == fdctrl->data_len) {
+         /* We now have all parameters
+          * and will be able to treat the command
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.3.0.bb b/meta/recipes-devtools/qemu/qemu_2.3.0.bb
index 25c5e4d..4782941 100644
--- a/meta/recipes-devtools/qemu/qemu_2.3.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.3.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
 SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://qemu-enlarge-env-entry-size.patch \
             file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
+            file://qemu-CVE-2015-3456.patch \
             "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "2fab3ea4460de9b57192e5b8b311f221"
-- 
1.9.1


