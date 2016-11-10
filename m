Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6DD6960103
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2016 07:08:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uAA78UeG016553
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Nov 2016 23:08:30 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 9 Nov 2016 23:08:29 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Nov 2016 15:01:25 +0800
Message-ID: <b6f19b7a6a3ac9d868daf06ccc1376831c230438.1478760924.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <cover.1478760924.git.kai.kang@windriver.com>
References: <cover.1478760924.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] qemu: fix CVE-2016-7909
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
X-List-Received-Date: Thu, 10 Nov 2016 07:08:30 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix CVE-2016-7909 of qemu.

Ref:
https://security-tracker.debian.org/tracker/CVE-2016-7909

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../qemu/qemu/0004-fix-CVE-2016-7909.patch         | 42 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.7.0.bb           |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0004-fix-CVE-2016-7909.patch

diff --git a/meta/recipes-devtools/qemu/qemu/0004-fix-CVE-2016-7909.patch b/meta/recipes-devtools/qemu/qemu/0004-fix-CVE-2016-7909.patch
new file mode 100644
index 0000000..e71bbf6
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0004-fix-CVE-2016-7909.patch
@@ -0,0 +1,42 @@
+Upstream-Status: Backport [http://git.qemu.org/?p=qemu.git;a=commit;h=34e29ce]
+CVE: CVE-2016-7909
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+From 34e29ce754c02bb6b3bdd244fbb85033460feaff Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Fri, 30 Sep 2016 00:27:33 +0530
+Subject: [PATCH] net: pcnet: check rx/tx descriptor ring length
+
+The AMD PC-Net II emulator has set of control and status(CSR)
+registers. Of these, CSR76 and CSR78 hold receive and transmit
+descriptor ring length respectively. This ring length could range
+from 1 to 65535. Setting ring length to zero leads to an infinite
+loop in pcnet_rdra_addr() or pcnet_transmit(). Add check to avoid it.
+
+Reported-by: Li Qiang <liqiang6-s@360.cn>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+---
+ hw/net/pcnet.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/hw/net/pcnet.c b/hw/net/pcnet.c
+index 198a01f..3078de8 100644
+--- a/hw/net/pcnet.c
++++ b/hw/net/pcnet.c
+@@ -1429,8 +1429,11 @@ static void pcnet_csr_writew(PCNetState *s, uint32_t rap, uint32_t new_value)
+     case 47: /* POLLINT */
+     case 72:
+     case 74:
++        break;
+     case 76: /* RCVRL */
+     case 78: /* XMTRL */
++        val = (val > 0) ? val : 512;
++        break;
+     case 112:
+        if (CSR_STOP(s) || CSR_SPND(s))
+            break;
+-- 
+2.10.1
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.7.0.bb b/meta/recipes-devtools/qemu/qemu_2.7.0.bb
index a75bcdf..cef181d 100644
--- a/meta/recipes-devtools/qemu/qemu_2.7.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.7.0.bb
@@ -12,6 +12,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://0001-virtio-zero-vq-inuse-in-virtio_reset.patch \
             file://0002-fix-CVE-2016-7423.patch \
             file://0003-fix-CVE-2016-7908.patch \
+            file://0004-fix-CVE-2016-7909.patch \
 "
 
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
-- 
2.10.1


