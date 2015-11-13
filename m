Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7D313771CA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 02:08:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAD28h8o009177
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Nov 2015 18:08:44 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 12 Nov 2015 18:08:43 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Fri, 13 Nov 2015 10:08:31 +0800
Message-ID: <045246b6c32f228f97105548143563ac0a9bac14.1447380260.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1447380260.git.hongxu.jia@windriver.com>
References: <cover.1447380260.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] qemu: fix CVE-2015-5279
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
X-List-Received-Date: Fri, 13 Nov 2015 02:08:45 -0000
Content-Type: text/plain

Backport from upstream and cherry picked the commit
http://git.qemu.org/?p=qemu.git;a=commit;h=7aa2bcad0ca837dd6d4bf4fa38a80314b4a6b755

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../qemu/qemu/qemu-CVE-2015-5279.patch             | 78 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.4.0.bb           |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-CVE-2015-5279.patch

diff --git a/meta/recipes-devtools/qemu/qemu/qemu-CVE-2015-5279.patch b/meta/recipes-devtools/qemu/qemu/qemu-CVE-2015-5279.patch
new file mode 100644
index 0000000..7d6eccd
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/qemu-CVE-2015-5279.patch
@@ -0,0 +1,78 @@
+From 7e299c93b27902bd37c86b80cb00e0f030e9ef37 Mon Sep 17 00:00:00 2001
+From: P J P <pjp@fedoraproject.org>
+Date: Tue, 15 Sep 2015 16:40:49 +0530
+Subject: [PATCH] net: add checks to validate ring buffer
+ pointers(CVE-2015-5279)
+
+Ne2000 NIC uses ring buffer of NE2000_MEM_SIZE(49152)
+bytes to process network packets. While receiving packets
+via ne2000_receive() routine, a local 'index' variable
+could exceed the ring buffer size, which could lead to a
+memory buffer overflow. Added other checks at initialisation.
+
+Reported-by: Qinghao Tang <luodalongde@gmail.com>
+Signed-off-by: P J P <pjp@fedoraproject.org>
+Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
+(cherry picked from commit 9bbdbc66e5765068dce76e9269dce4547afd8ad4)
+Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
+
+Upstream-Status: Backport [cherry picked from commit
+http://git.qemu.org/?p=qemu.git;a=patch;
+h=7aa2bcad0ca837dd6d4bf4fa38a80314b4a6b755]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ hw/net/ne2000.c | 19 +++++++++++++++----
+ 1 file changed, 15 insertions(+), 4 deletions(-)
+
+diff --git a/hw/net/ne2000.c b/hw/net/ne2000.c
+index 3492db3..9278571 100644
+--- a/hw/net/ne2000.c
++++ b/hw/net/ne2000.c
+@@ -230,6 +230,9 @@ ssize_t ne2000_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
+     }
+ 
+     index = s->curpag << 8;
++    if (index >= NE2000_PMEM_END) {
++        index = s->start;
++    }
+     /* 4 bytes for header */
+     total_len = size + 4;
+     /* address for next packet (4 bytes for CRC) */
+@@ -315,13 +318,19 @@ static void ne2000_ioport_write(void *opaque, uint32_t addr, uint32_t val)
+         offset = addr | (page << 4);
+         switch(offset) {
+         case EN0_STARTPG:
+-            s->start = val << 8;
++            if (val << 8 <= NE2000_PMEM_END) {
++                s->start = val << 8;
++            }
+             break;
+         case EN0_STOPPG:
+-            s->stop = val << 8;
++            if (val << 8 <= NE2000_PMEM_END) {
++                s->stop = val << 8;
++            }
+             break;
+         case EN0_BOUNDARY:
+-            s->boundary = val;
++            if (val << 8 < NE2000_PMEM_END) {
++                s->boundary = val;
++            }
+             break;
+         case EN0_IMR:
+             s->imr = val;
+@@ -362,7 +371,9 @@ static void ne2000_ioport_write(void *opaque, uint32_t addr, uint32_t val)
+             s->phys[offset - EN1_PHYS] = val;
+             break;
+         case EN1_CURPAG:
+-            s->curpag = val;
++            if (val << 8 < NE2000_PMEM_END) {
++                s->curpag = val;
++            }
+             break;
+         case EN1_MULT ... EN1_MULT + 7:
+             s->mult[offset - EN1_MULT] = val;
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/qemu/qemu_2.4.0.bb b/meta/recipes-devtools/qemu/qemu_2.4.0.bb
index 1505b80..b3ae48b 100644
--- a/meta/recipes-devtools/qemu/qemu_2.4.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.4.0.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
             file://smc91c111_fix2.patch \
             file://smc91c111_fix3.patch \
             file://no-valgrind.patch \
+            file://qemu-CVE-2015-5279.patch \
            "
 SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
 SRC_URI[md5sum] = "186ee8194140a484a455f8e3c74589f4"
-- 
1.9.1


