Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2AD3270101
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 20:28:23 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id yy13so1404383pab.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 12:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=KNFsDOfY9ybfLHqQVqwZ3/+PXkyyGav+fgIMP/nvHwU=;
	b=JQz77pYwbAZ58IMufRqZK4cp0jlYRYqpRd08nFtpTY9nf9l4mJ77762xfcA5cood1a
	lxttneRiB7HqamWsT6DcuiUHF97dsZIkTVS5/03Gx+3PX/d90lhxqOc8PJ36mkKPiNYO
	KU2Yx/JrWbs+vP7fhcsTj3C/ujnJCbrVLJDpLx2qPwOeiV2EgOWvsckNj5n0b4mxK7Gf
	JfSAEiBBw+3nKiabQu+zqcNzjJjGFXeN7N1/B4o/c/+8gNdumCloQvWHsByHrfMt6had
	tsyyJa18i0D0JKhlDuzdSii25AS7E20DSuAhOOfXRenV05Bl39iQ9MLbRdAXkd4rl5nS
	v9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=KNFsDOfY9ybfLHqQVqwZ3/+PXkyyGav+fgIMP/nvHwU=;
	b=U5n1HbwaZF0qFXQZb4Y/cHzKXKLt2rfwHK/ELSJaLM14XtHLzau5kOgbIrPotIhsVd
	tnZS43K+691AfPVyA82LHXEXHqKsQCMpDb6E4jXVtRsqcEJfSyHXJHroCMLB2R2YUmwT
	xCbiQGanXBzCxxjUh1KBoOgWkg1XHEua61ia62QKmuLn/MWgZytxLIv7Ojn+kd8HkO2z
	LQdi/xNuvqQvNsqFjGcY6sd3tsX8bRN6xpdGiHj+J0HnFbtCKGrkZ61SXLqUI1C0qdzk
	WYL4ARuRIAgxY2aPusCwDclS261SQZj+JQCgPfwYa3egW5nkugSKX+BMx1t0U1g1fRdU
	Zccw==
X-Gm-Message-State: AG10YOSt0KY7+ihEj14FgVI224aW1iQDk5m5TUEfFtzJAR/vG3zXhHUlLn8BuLN5UlzebA==
X-Received: by 10.67.23.134 with SMTP id ia6mr5296597pad.100.1455136104877;
	Wed, 10 Feb 2016 12:28:24 -0800 (PST)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id
	yl1sm7127443pac.35.2016.02.10.12.28.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Feb 2016 12:28:23 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 12:28:21 -0800
Message-Id: <1455136102-4951-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [[master][PATCH 1/2] qemu: Security fix CVE-2016-2197
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
X-List-Received-Date: Wed, 10 Feb 2016 20:28:25 -0000

From: Armin Kuster <akuster@mvista.com>

CVE-2016-2197 Qemu: ide: ahci null pointer dereference when using FIS CLB engines

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../recipes-devtools/qemu/qemu/CVE-2016-2197.patch | 59 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.5.0.bb           |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-2197.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2016-2197.patch b/meta/recipes-devtools/qemu/qemu/CVE-2016-2197.patch
new file mode 100644
index 0000000..946435c
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2016-2197.patch
@@ -0,0 +1,59 @@
+From: Prasad J Pandit <address@hidden>
+
+When IDE AHCI emulation uses Frame Information Structures(FIS)
+engine for data transfer, the mapped FIS buffer address is stored
+in a static 'bounce.buffer'. When a request is made to map another
+memory region, address_space_map() returns NULL because
+'bounce.buffer' is in_use. It leads to a null pointer dereference
+error while doing 'dma_memory_unmap'. Add a check to avoid it.
+
+Reported-by: Zuozhi fzz <address@hidden>
+Signed-off-by: Prasad J Pandit <address@hidden>
+
+Upstream-Status: Backport
+https://lists.gnu.org/archive/html/qemu-devel/2016-01/msg05740.html
+
+CVE: CVE-2016-2197
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ hw/ide/ahci.c | 16 ++++++++++------
+  1 file changed, 10 insertions(+), 6 deletions(-)
+
+  Update as per review
+    -> https://lists.gnu.org/archive/html/qemu-devel/2016-01/msg05715.html
+
+Index: qemu-2.5.0/hw/ide/ahci.c
+===================================================================
+--- qemu-2.5.0.orig/hw/ide/ahci.c
++++ qemu-2.5.0/hw/ide/ahci.c
+@@ -661,9 +661,11 @@ static bool ahci_map_fis_address(AHCIDev
+ 
+ static void ahci_unmap_fis_address(AHCIDevice *ad)
+ {
+-    dma_memory_unmap(ad->hba->as, ad->res_fis, 256,
+-                     DMA_DIRECTION_FROM_DEVICE, 256);
+-    ad->res_fis = NULL;
++    if (ad->res_fis) {
++        dma_memory_unmap(ad->hba->as, ad->res_fis, 256,
++                         DMA_DIRECTION_FROM_DEVICE, 256);
++        ad->res_fis = NULL;
++    }
+ }
+ 
+ static bool ahci_map_clb_address(AHCIDevice *ad)
+@@ -677,9 +679,11 @@ static bool ahci_map_clb_address(AHCIDev
+ 
+ static void ahci_unmap_clb_address(AHCIDevice *ad)
+ {
+-    dma_memory_unmap(ad->hba->as, ad->lst, 1024,
+-                     DMA_DIRECTION_FROM_DEVICE, 1024);
+-    ad->lst = NULL;
++    if (ad->lst) {
++        dma_memory_unmap(ad->hba->as, ad->lst, 1024,
++                         DMA_DIRECTION_FROM_DEVICE, 1024);
++        ad->lst = NULL;
++    }
+ }
+ 
+ static void ahci_write_fis_sdb(AHCIState *s, NCQTransferState *ncq_tfs)
diff --git a/meta/recipes-devtools/qemu/qemu_2.5.0.bb b/meta/recipes-devtools/qemu/qemu_2.5.0.bb
index e51ec16..3e7df2f 100644
--- a/meta/recipes-devtools/qemu/qemu_2.5.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.5.0.bb
@@ -8,6 +8,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
             file://no-valgrind.patch \
             file://CVE-2016-1568.patch \
+            file://CVE-2016-2197.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "f469f2330bbe76e3e39db10e9ac4f8db"
-- 
2.3.5


