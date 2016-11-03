Return-Path: <Adrian.Dudau@enea.com>
Received: from smtp-out11.electric.net (smtp-out11.electric.net
	[185.38.181.39])
	by mail.openembedded.org (Postfix) with ESMTP id 5E493719BE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 13:48:18 +0000 (UTC)
Received: from 1c2Hu5-0006Y4-Un by out11d.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <Adrian.Dudau@enea.com>) id 1c2Hu5-0006Yw-VF
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2016 06:18:01 -0700
Received: by emcmailer; Thu, 03 Nov 2016 06:18:01 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out11d.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <Adrian.Dudau@enea.com>) id 1c2Hu5-0006Y4-Un
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2016 06:18:01 -0700
Received: from sestofb11.enea.se (172.21.3.152) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.294.0; Thu, 3 Nov 2016
	14:18:01 +0100
Received: by sestofb11.enea.se (Postfix, from userid 4451)	id 3E43044158E;
	Thu,  3 Nov 2016 14:18:01 +0100 (CET)
From: Adrian Dudau <adrian.dudau@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 Nov 2016 14:18:00 +0100
Message-ID: <1478179081-34596-1-git-send-email-adrian.dudau@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: adrian.dudau@enea.com does not
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
Subject: [krogoth][PATCH 1/2] qemu: Security fix CVE-2016-4439
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
X-List-Received-Date: Thu, 03 Nov 2016 13:48:19 -0000
Content-Type: text/plain

affects qemu < 2.7.0

Quick Emulator(Qemu) built with the ESP/NCR53C9x controller emulation
support is vulnerable to an OOB write access issue. The controller uses
16-byte FIFO buffer for command and data transfer. The OOB write occurs
while writing to this command buffer in routine get_cmd().

A privileged user inside guest could use this flaw to crash the Qemu
process resulting in DoS.

References:
----------
http://www.openwall.com/lists/oss-security/2016/05/19/4
https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2016-4441

Signed-off-by: Adrian Dudau <adrian.dudau@enea.com>
---
 .../recipes-devtools/qemu/qemu/CVE-2016-4441.patch | 78 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.5.0.bb           |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-4441.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2016-4441.patch b/meta/recipes-devtools/qemu/qemu/CVE-2016-4441.patch
new file mode 100644
index 0000000..3cbe394
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2016-4441.patch
@@ -0,0 +1,78 @@
+From 6c1fef6b59563cc415f21e03f81539ed4b33ad90 Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Thu, 19 May 2016 16:09:31 +0530
+Subject: [PATCH] esp: check dma length before reading scsi command(CVE-2016-4441)
+
+The 53C9X Fast SCSI Controller(FSC) comes with an internal 16-byte
+FIFO buffer. It is used to handle command and data transfer.
+Routine get_cmd() uses DMA to read scsi commands into this buffer.
+Add check to validate DMA length against buffer size to avoid any
+overrun.
+
+Fixes CVE-2016-4441.
+
+Upstream-Status: Backport
+
+Reported-by: Li Qiang <liqiang6-s@360.cn>
+Cc: qemu-stable@nongnu.org
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Message-Id: <1463654371-11169-3-git-send-email-ppandit@redhat.com>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+Signed-off-by: Adrian Dudau <adrian.dudau@enea.com>
+---
+ hw/scsi/esp.c |   11 +++++++----
+ 1 files changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/hw/scsi/esp.c b/hw/scsi/esp.c
+index 01497e6..591c817 100644
+--- a/hw/scsi/esp.c
++++ b/hw/scsi/esp.c
+@@ -82,7 +82,7 @@ void esp_request_cancelled(SCSIRequest *req)
+     }
+ }
+ 
+-static uint32_t get_cmd(ESPState *s, uint8_t *buf)
++static uint32_t get_cmd(ESPState *s, uint8_t *buf, uint8_t buflen)
+ {
+     uint32_t dmalen;
+     int target;
+@@ -92,6 +92,9 @@ static uint32_t get_cmd(ESPState *s, uint8_t *buf)
+         dmalen = s->rregs[ESP_TCLO];
+         dmalen |= s->rregs[ESP_TCMID] << 8;
+         dmalen |= s->rregs[ESP_TCHI] << 16;
++        if (dmalen > buflen) {
++            return 0;
++        }
+         s->dma_memory_read(s->dma_opaque, buf, dmalen);
+     } else {
+         dmalen = s->ti_size;
+@@ -166,7 +169,7 @@ static void handle_satn(ESPState *s)
+         s->dma_cb = handle_satn;
+         return;
+     }
+-    len = get_cmd(s, buf);
++    len = get_cmd(s, buf, sizeof(buf));
+     if (len)
+         do_cmd(s, buf);
+ }
+@@ -180,7 +183,7 @@ static void handle_s_without_atn(ESPState *s)
+         s->dma_cb = handle_s_without_atn;
+         return;
+     }
+-    len = get_cmd(s, buf);
++    len = get_cmd(s, buf, sizeof(buf));
+     if (len) {
+         do_busid_cmd(s, buf, 0);
+     }
+@@ -192,7 +195,7 @@ static void handle_satn_stop(ESPState *s)
+         s->dma_cb = handle_satn_stop;
+         return;
+     }
+-    s->cmdlen = get_cmd(s, s->cmdbuf);
++    s->cmdlen = get_cmd(s, s->cmdbuf, sizeof(s->cmdbuf));
+     if (s->cmdlen) {
+         trace_esp_handle_satn_stop(s->cmdlen);
+         s->do_cmd = 1;
+-- 
+1.7.0.4
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.5.0.bb b/meta/recipes-devtools/qemu/qemu_2.5.0.bb
index ed8d911..58902b1 100644
--- a/meta/recipes-devtools/qemu/qemu_2.5.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.5.0.bb
@@ -26,6 +26,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://CVE-2016-6351_p2.patch \
             file://CVE-2016-4002.patch \
             file://CVE-2016-5403.patch \
+            file://CVE-2016-4441.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "f469f2330bbe76e3e39db10e9ac4f8db"
-- 
1.9.1


