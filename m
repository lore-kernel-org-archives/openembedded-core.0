Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 17B16741CF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 15:16:48 +0000 (UTC)
Received: by pdbbh15 with SMTP id bh15so31931712pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 08:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=T5weibdiP86O75gU1bwEsAdlAQdz4leBpvYVZ930WR4=;
	b=HAtgK1mfat8dcf73Rj+Wl0ejbNFSxOrffzFcFN2ZWIOQYGwbUC+oHTWvI/HxLRBTv6
	1dozxa1wuVNU3urK9eOr/yP5sLRXQY04dnfWlwXbzbRUiGSXL4NzZvEF9fSKqHGT8UaX
	/Ol/ABmIWNdQyyw2Dp1zyYjK8phgw0FmMJ+P6aFXWsHs3tizmQwaQnlJ5TWo+e3Sssji
	Llt48B/AQS1FRNzKjoOpPAI2cgZPK5CfTd/zDjOdRbuSTu27UvcO2i64EZZ+htRmfzJa
	O1j13GnXTgt9OwZ5rkidENfDRH3zuOSot4d05ivuEnmbC1tdZhDL1dsr9tpVjMR4uKVM
	qmwA==
X-Received: by 10.70.129.102 with SMTP id nv6mr40748411pdb.55.1437232609204;
	Sat, 18 Jul 2015 08:16:49 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	of5sm5091952pdb.52.2015.07.18.08.16.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jul 2015 08:16:46 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id BE54CFC12F4; Sat, 18 Jul 2015 08:16:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jul 2015 08:16:19 -0700
Message-Id: <5a64fc937b6a891e6d29904b6a95b5ad1d12b18d.1437232180.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
Subject: [PATCH 12/25] qemu: fix CVE-2015-3456
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
X-List-Received-Date: Sat, 18 Jul 2015 15:16:52 -0000

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix qemuc CVE issue CVE-2015-3456.

Refs:
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-3456
http://git.qemu.org/?p=qemu.git;a=commit;h=e907746266721f305d67bc0718795fedee2e824c

(From OE-Core rev: 1d9e6ef173bea8181fabc6abf0dbb53990b15fd8)

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>

Conflicts:
	meta/recipes-devtools/qemu/qemu_2.1.0.bb
---
 .../qemu/qemu/qemu-CVE-2015-3456.patch             | 92 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.1.0.bb           |  1 +
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
diff --git a/meta/recipes-devtools/qemu/qemu_2.1.0.bb b/meta/recipes-devtools/qemu/qemu_2.1.0.bb
index a82d052..d0ce744 100644
--- a/meta/recipes-devtools/qemu/qemu_2.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.1.0.bb
@@ -7,6 +7,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://qemu-enlarge-env-entry-size.patch \
             file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
             file://0001-Back-porting-security-fix-CVE-2014-5388.patch \
+            file://qemu-CVE-2015-3456.patch \
             "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "6726977292b448cbc7f89998fac6983b"
-- 
1.9.1


