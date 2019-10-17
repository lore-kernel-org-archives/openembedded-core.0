Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 457156C3B1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2019 02:52:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id x9H2qSVx014654
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2019 19:52:29 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Wed, 16 Oct 2019 19:52:28 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Oct 2019 10:52:27 +0800
Message-ID: <1571280747-265169-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH V2] qemu: Fix CVE-2019-12068
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
X-List-Received-Date: Thu, 17 Oct 2019 02:52:28 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc                |   1 +
 .../qemu/qemu/CVE-2019-12068.patch                 | 108 +++++++++++++++++++++
 2 files changed, 109 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2019-12068.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 88ae68a..bb444b6 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -28,6 +28,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0009-Fix-webkitgtk-builds.patch \
            file://0010-configure-Add-pkg-config-handling-for-libgcrypt.patch \
            file://CVE-2019-15890.patch \
+           file://CVE-2019-12068.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2019-12068.patch b/meta/recipes-devtools/qemu/qemu/CVE-2019-12068.patch
new file mode 100644
index 0000000..f1655e4
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2019-12068.patch
@@ -0,0 +1,108 @@
+From de594e47659029316bbf9391efb79da0a1a08e08 Mon Sep 17 00:00:00 2001
+From: Paolo Bonzini <pbonzini@redhat.com>
+Date: Wed, 14 Aug 2019 17:35:21 +0530
+Subject: [PATCH] scsi: lsi: exit infinite loop while executing script
+ (CVE-2019-12068)
+
+When executing script in lsi_execute_script(), the LSI scsi adapter
+emulator advances 's->dsp' index to read next opcode. This can lead
+to an infinite loop if the next opcode is empty. Move the existing
+loop exit after 10k iterations so that it covers no-op opcodes as
+well.
+
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=de594e47659029316bbf9391efb79da0a1a08e08]
+CVE: CVE-2019-12068
+
+Reported-by: Bugs SysSec <bugs-syssec@rub.de>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ hw/scsi/lsi53c895a.c | 41 +++++++++++++++++++++++++++--------------
+ 1 file changed, 27 insertions(+), 14 deletions(-)
+
+diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
+index 222a286..ec53b14 100644
+--- a/hw/scsi/lsi53c895a.c
++++ b/hw/scsi/lsi53c895a.c
+@@ -186,6 +186,9 @@ static const char *names[] = {
+ /* Flag set if this is a tagged command.  */
+ #define LSI_TAG_VALID     (1 << 16)
+ 
++/* Maximum instructions to process. */
++#define LSI_MAX_INSN    10000
++
+ typedef struct lsi_request {
+     SCSIRequest *req;
+     uint32_t tag;
+@@ -1133,7 +1136,21 @@ static void lsi_execute_script(LSIState *s)
+ 
+     s->istat1 |= LSI_ISTAT1_SRUN;
+ again:
+-    insn_processed++;
++    if (++insn_processed > LSI_MAX_INSN) {
++        /* Some windows drivers make the device spin waiting for a memory
++           location to change.  If we have been executed a lot of code then
++           assume this is the case and force an unexpected device disconnect.
++           This is apparently sufficient to beat the drivers into submission.
++         */
++        if (!(s->sien0 & LSI_SIST0_UDC)) {
++            qemu_log_mask(LOG_GUEST_ERROR,
++                          "lsi_scsi: inf. loop with UDC masked");
++        }
++        lsi_script_scsi_interrupt(s, LSI_SIST0_UDC, 0);
++        lsi_disconnect(s);
++        trace_lsi_execute_script_stop();
++        return;
++    }
+     insn = read_dword(s, s->dsp);
+     if (!insn) {
+         /* If we receive an empty opcode increment the DSP by 4 bytes
+@@ -1570,19 +1587,7 @@ again:
+             }
+         }
+     }
+-    if (insn_processed > 10000 && s->waiting == LSI_NOWAIT) {
+-        /* Some windows drivers make the device spin waiting for a memory
+-           location to change.  If we have been executed a lot of code then
+-           assume this is the case and force an unexpected device disconnect.
+-           This is apparently sufficient to beat the drivers into submission.
+-         */
+-        if (!(s->sien0 & LSI_SIST0_UDC)) {
+-            qemu_log_mask(LOG_GUEST_ERROR,
+-                          "lsi_scsi: inf. loop with UDC masked");
+-        }
+-        lsi_script_scsi_interrupt(s, LSI_SIST0_UDC, 0);
+-        lsi_disconnect(s);
+-    } else if (s->istat1 & LSI_ISTAT1_SRUN && s->waiting == LSI_NOWAIT) {
++    if (s->istat1 & LSI_ISTAT1_SRUN && s->waiting == LSI_NOWAIT) {
+         if (s->dcntl & LSI_DCNTL_SSM) {
+             lsi_script_dma_interrupt(s, LSI_DSTAT_SSI);
+         } else {
+@@ -1970,6 +1975,10 @@ static void lsi_reg_writeb(LSIState *s, int offset, uint8_t val)
+     case 0x2f: /* DSP[24:31] */
+         s->dsp &= 0x00ffffff;
+         s->dsp |= val << 24;
++        /*
++         * FIXME: if s->waiting != LSI_NOWAIT, this will only execute one
++         * instruction.  Is this correct?
++         */
+         if ((s->dmode & LSI_DMODE_MAN) == 0
+             && (s->istat1 & LSI_ISTAT1_SRUN) == 0)
+             lsi_execute_script(s);
+@@ -1988,6 +1997,10 @@ static void lsi_reg_writeb(LSIState *s, int offset, uint8_t val)
+         break;
+     case 0x3b: /* DCNTL */
+         s->dcntl = val & ~(LSI_DCNTL_PFF | LSI_DCNTL_STD);
++        /*
++         * FIXME: if s->waiting != LSI_NOWAIT, this will only execute one
++         * instruction.  Is this correct?
++         */
+         if ((val & LSI_DCNTL_STD) && (s->istat1 & LSI_ISTAT1_SRUN) == 0)
+             lsi_execute_script(s);
+         break;
+-- 
+2.7.4
+
-- 
2.7.4


