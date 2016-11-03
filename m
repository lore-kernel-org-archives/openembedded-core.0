Return-Path: <Adrian.Dudau@enea.com>
X-Greylist: delayed 799 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 03 Nov 2016 13:31:20 UTC
Received: from smtp-out11.electric.net (smtp-out11.electric.net
	[185.38.181.44])
	by mail.openembedded.org (Postfix) with ESMTP id 6EB68719F1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 13:31:20 +0000 (UTC)
Received: from 1c2Hu5-0006Ud-Uo by out11b.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <Adrian.Dudau@enea.com>) id 1c2Hu5-0006V6-WC
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2016 06:18:01 -0700
Received: by emcmailer; Thu, 03 Nov 2016 06:18:01 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out11b.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <Adrian.Dudau@enea.com>) id 1c2Hu5-0006Ud-Uo
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2016 06:18:01 -0700
Received: from sestofb11.enea.se (172.21.3.152) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.294.0; Thu, 3 Nov 2016
	14:18:01 +0100
Received: by sestofb11.enea.se (Postfix, from userid 4451)	id 41692440335;
	Thu,  3 Nov 2016 14:18:01 +0100 (CET)
From: Adrian Dudau <adrian.dudau@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 Nov 2016 14:18:01 +0100
Message-ID: <1478179081-34596-2-git-send-email-adrian.dudau@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1478179081-34596-1-git-send-email-adrian.dudau@enea.com>
References: <1478179081-34596-1-git-send-email-adrian.dudau@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: adrian.dudau@enea.com does not
	designate permitted sender hosts)
X-Outbound-IP: 192.36.1.72
X-Env-From: Adrian.Dudau@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:AES128-SHA:128
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: [krogoth][PATCH 2/2] qemu: Security fix CVE-2016-4952
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
X-List-Received-Date: Thu, 03 Nov 2016 13:31:21 -0000
Content-Type: text/plain

affects qemu < 2.7.0

Quick Emulator(Qemu) built with the VMWARE PVSCSI paravirtual SCSI bus
emulation support is vulnerable to an OOB r/w access issue. It could
occur while processing SCSI commands 'PVSCSI_CMD_SETUP_RINGS' or
'PVSCSI_CMD_SETUP_MSG_RING'.

A privileged user inside guest could use this flaw to crash the Qemu
process resulting in DoS.

References:
----------
http://www.openwall.com/lists/oss-security/2016/05/23/1

Signed-off-by: Adrian Dudau <adrian.dudau@enea.com>
---
 .../recipes-devtools/qemu/qemu/CVE-2016-4952.patch | 105 +++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.5.0.bb           |   1 +
 2 files changed, 106 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-4952.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2016-4952.patch b/meta/recipes-devtools/qemu/qemu/CVE-2016-4952.patch
new file mode 100644
index 0000000..52d2a1e
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2016-4952.patch
@@ -0,0 +1,105 @@
+From 3e831b40e015ba34dfb55ff11f767001839425ff Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Mon, 23 May 2016 16:18:05 +0530
+Subject: [PATCH] scsi: pvscsi: check command descriptor ring buffer size (CVE-2016-4952)
+
+Vmware Paravirtual SCSI emulation uses command descriptors to
+process SCSI commands. These descriptors come with their ring
+buffers. A guest could set the ring buffer size to an arbitrary
+value leading to OOB access issue. Add check to avoid it.
+
+Upstream-Status: Backported
+
+Reported-by: Li Qiang <liqiang6-s@360.cn>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Cc: qemu-stable@nongnu.org
+Message-Id: <1464000485-27041-1-git-send-email-ppandit@redhat.com>
+Reviewed-by: Shmulik Ladkani <shmulik.ladkani@ravellosystems.com>
+Reviewed-by: Dmitry Fleytman <dmitry@daynix.com>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+Signed-off-by: Adrian Dudau <adrian.dudau@enea.com>
+---
+ hw/scsi/vmw_pvscsi.c |   24 ++++++++++++++++++++----
+ 1 files changed, 20 insertions(+), 4 deletions(-)
+
+diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
+index f67b5bf..2d7528d 100644
+--- a/hw/scsi/vmw_pvscsi.c
++++ b/hw/scsi/vmw_pvscsi.c
+@@ -153,7 +153,7 @@ pvscsi_log2(uint32_t input)
+     return log;
+ }
+ 
+-static void
++static int
+ pvscsi_ring_init_data(PVSCSIRingInfo *m, PVSCSICmdDescSetupRings *ri)
+ {
+     int i;
+@@ -161,6 +161,10 @@ pvscsi_ring_init_data(PVSCSIRingInfo *m, PVSCSICmdDescSetupRings *ri)
+     uint32_t req_ring_size, cmp_ring_size;
+     m->rs_pa = ri->ringsStatePPN << VMW_PAGE_SHIFT;
+ 
++    if ((ri->reqRingNumPages > PVSCSI_SETUP_RINGS_MAX_NUM_PAGES)
++        || (ri->cmpRingNumPages > PVSCSI_SETUP_RINGS_MAX_NUM_PAGES)) {
++        return -1;
++    }
+     req_ring_size = ri->reqRingNumPages * PVSCSI_MAX_NUM_REQ_ENTRIES_PER_PAGE;
+     cmp_ring_size = ri->cmpRingNumPages * PVSCSI_MAX_NUM_CMP_ENTRIES_PER_PAGE;
+     txr_len_log2 = pvscsi_log2(req_ring_size - 1);
+@@ -192,15 +196,20 @@ pvscsi_ring_init_data(PVSCSIRingInfo *m, PVSCSICmdDescSetupRings *ri)
+ 
+     /* Flush ring state page changes */
+     smp_wmb();
++
++    return 0;
+ }
+ 
+-static void
++static int
+ pvscsi_ring_init_msg(PVSCSIRingInfo *m, PVSCSICmdDescSetupMsgRing *ri)
+ {
+     int i;
+     uint32_t len_log2;
+     uint32_t ring_size;
+ 
++    if (ri->numPages > PVSCSI_SETUP_MSG_RING_MAX_NUM_PAGES) {
++        return -1;
++    }
+     ring_size = ri->numPages * PVSCSI_MAX_NUM_MSG_ENTRIES_PER_PAGE;
+     len_log2 = pvscsi_log2(ring_size - 1);
+ 
+@@ -220,6 +229,8 @@ pvscsi_ring_init_msg(PVSCSIRingInfo *m, PVSCSICmdDescSetupMsgRing *ri)
+ 
+     /* Flush ring state page changes */
+     smp_wmb();
++
++    return 0;
+ }
+ 
+ static void
+@@ -770,7 +781,10 @@ pvscsi_on_cmd_setup_rings(PVSCSIState *s)
+     trace_pvscsi_on_cmd_arrived("PVSCSI_CMD_SETUP_RINGS");
+ 
+     pvscsi_dbg_dump_tx_rings_config(rc);
+-    pvscsi_ring_init_data(&s->rings, rc);
++    if (pvscsi_ring_init_data(&s->rings, rc) < 0) {
++        return PVSCSI_COMMAND_PROCESSING_FAILED;
++    }
++
+     s->rings_info_valid = TRUE;
+     return PVSCSI_COMMAND_PROCESSING_SUCCEEDED;
+ }
+@@ -850,7 +864,9 @@ pvscsi_on_cmd_setup_msg_ring(PVSCSIState *s)
+     }
+ 
+     if (s->rings_info_valid) {
+-        pvscsi_ring_init_msg(&s->rings, rc);
++        if (pvscsi_ring_init_msg(&s->rings, rc) < 0) {
++            return PVSCSI_COMMAND_PROCESSING_FAILED;
++        }
+         s->msg_ring_info_valid = TRUE;
+     }
+     return sizeof(PVSCSICmdDescSetupMsgRing) / sizeof(uint32_t);
+-- 
+1.7.0.4
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.5.0.bb b/meta/recipes-devtools/qemu/qemu_2.5.0.bb
index 58902b1..b965f69 100644
--- a/meta/recipes-devtools/qemu/qemu_2.5.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.5.0.bb
@@ -27,6 +27,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://CVE-2016-4002.patch \
             file://CVE-2016-5403.patch \
             file://CVE-2016-4441.patch \
+            file://CVE-2016-4952.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "f469f2330bbe76e3e39db10e9ac4f8db"
-- 
1.9.1


