Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D014975D07
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jul 2015 09:43:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t679huqB007525
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Jul 2015 02:43:56 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Tue, 7 Jul 2015 02:43:56 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 Jul 2015 17:43:02 +0800
Message-ID: <91f81f2888d54fb4fd0fbd15cb71a5c878fe67b5.1436261380.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1436261380.git.kai.kang@windriver.com>
References: <cover.1436261380.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 1/1] qemu: fix CVE-2015-3209
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
X-List-Received-Date: Tue, 07 Jul 2015 09:43:57 -0000
Content-Type: text/plain

Backport patch to fix CVE-2015-3209.

http://git.qemu.org/?p=qemu.git;a=commit;h=9f7c594

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../qemu/qemu/qemu-fix-CVE-2015-3209.patch         | 53 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.3.0.bb           |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-fix-CVE-2015-3209.patch

diff --git a/meta/recipes-devtools/qemu/qemu/qemu-fix-CVE-2015-3209.patch b/meta/recipes-devtools/qemu/qemu/qemu-fix-CVE-2015-3209.patch
new file mode 100644
index 0000000..d2dbb94
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/qemu-fix-CVE-2015-3209.patch
@@ -0,0 +1,53 @@
+Upstream-Status: Backport
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 9f7c594c006289ad41169b854d70f5da6e400a2a Mon Sep 17 00:00:00 2001
+From: Petr Matousek <pmatouse@redhat.com>
+Date: Sun, 24 May 2015 10:53:44 +0200
+Subject: [PATCH] pcnet: force the buffer access to be in bounds during tx
+
+4096 is the maximum length per TMD and it is also currently the size of
+the relay buffer pcnet driver uses for sending the packet data to QEMU
+for further processing. With packet spanning multiple TMDs it can
+happen that the overall packet size will be bigger than sizeof(buffer),
+which results in memory corruption.
+
+Fix this by only allowing to queue maximum sizeof(buffer) bytes.
+
+This is CVE-2015-3209.
+
+[Fixed 3-space indentation to QEMU's 4-space coding standard.
+--Stefan]
+
+Signed-off-by: Petr Matousek <pmatouse@redhat.com>
+Reported-by: Matt Tait <matttait@google.com>
+Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
+Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
+Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
+---
+ hw/net/pcnet.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/hw/net/pcnet.c b/hw/net/pcnet.c
+index bdfd38f..68b9981 100644
+--- a/hw/net/pcnet.c
++++ b/hw/net/pcnet.c
+@@ -1241,6 +1241,14 @@ static void pcnet_transmit(PCNetState *s)
+         }
+ 
+         bcnt = 4096 - GET_FIELD(tmd.length, TMDL, BCNT);
++
++        /* if multi-tmd packet outsizes s->buffer then skip it silently.
++           Note: this is not what real hw does */
++        if (s->xmit_pos + bcnt > sizeof(s->buffer)) {
++            s->xmit_pos = -1;
++            goto txdone;
++        }
++
+         s->phys_mem_read(s->dma_opaque, PHYSADDR(s, tmd.tbadr),
+                          s->buffer + s->xmit_pos, bcnt, CSR_BSWP(s));
+         s->xmit_pos += bcnt;
+-- 
+2.4.1
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.3.0.bb b/meta/recipes-devtools/qemu/qemu_2.3.0.bb
index ec1b101..cae0ad1 100644
--- a/meta/recipes-devtools/qemu/qemu_2.3.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.3.0.bb
@@ -18,6 +18,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://09-xen-pt-mark-reserved-bits-in-PCI-config-space-fields-CVE-2015-4106.patch \
             file://10-xen-pt-add-a-few-PCI-config-space-field-descriptions-CVE-2015-4106.patch \
             file://11-xen-pt-unknown-PCI-config-space-fields-should-be-readonly-CVE-2015-4106.patch \
+            file://qemu-fix-CVE-2015-3209.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "2fab3ea4460de9b57192e5b8b311f221"
-- 
1.9.1


