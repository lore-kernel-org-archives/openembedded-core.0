Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2733A79F3F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 06:08:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wA268kRh001800
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Nov 2018 23:08:47 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 1 Nov 2018 23:08:46 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Nov 2018 14:08:45 +0800
Message-ID: <1541138925-68201-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] qemu: fix for CVE-2018-10839
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
X-List-Received-Date: Fri, 02 Nov 2018 06:08:46 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../qemu/qemu/CVE-2018-10839.patch                 | 52 ++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2018-10839.patch

diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2018-10839.patch b/meta/recipes-devtools/qemu/qemu/CVE-2018-10839.patch
new file mode 100644
index 0000000..7e1e442
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2018-10839.patch
@@ -0,0 +1,52 @@
+From fdc89e90fac40c5ca2686733df17b6423fb8d8fb Mon Sep 17 00:00:00 2001
+From: Jason Wang <jasowang@redhat.com>
+Date: Wed, 30 May 2018 13:08:15 +0800
+Subject: [PATCH] ne2000: fix possible out of bound access in ne2000_receive
+
+In ne2000_receive(), we try to assign size_ to size which converts
+from size_t to integer. This will cause troubles when size_ is greater
+INT_MAX, this will lead a negative value in size and it can then pass
+the check of size < MIN_BUF_SIZE which may lead out of bound access of
+for both buf and buf1.
+
+Fixing by converting the type of size to size_t.
+
+CC: qemu-stable@nongnu.org
+Reported-by: Daniel Shapira <daniel@twistlock.com>
+Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commitdiff
+;h=fdc89e90fac40c5ca2686733df17b6423fb8d8fb#patch1]
+
+CVE: CVE-2018-10839
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ hw/net/ne2000.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/hw/net/ne2000.c b/hw/net/ne2000.c
+index 07d79e3..869518e 100644
+--- a/hw/net/ne2000.c
++++ b/hw/net/ne2000.c
+@@ -174,7 +174,7 @@ static int ne2000_buffer_full(NE2000State *s)
+ ssize_t ne2000_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
+ {
+     NE2000State *s = qemu_get_nic_opaque(nc);
+-    int size = size_;
++    size_t size = size_;
+     uint8_t *p;
+     unsigned int total_len, next, avail, len, index, mcast_idx;
+     uint8_t buf1[60];
+@@ -182,7 +182,7 @@ ssize_t ne2000_receive(NetClientState *nc, const uint8_t *buf, size_t size_)
+         { 0xff, 0xff, 0xff, 0xff, 0xff, 0xff };
+ 
+ #if defined(DEBUG_NE2000)
+-    printf("NE2000: received len=%d\n", size);
++    printf("NE2000: received len=%zu\n", size);
+ #endif
+ 
+     if (s->cmd & E8390_STOP || ne2000_buffer_full(s))
+-- 
+1.8.3.1
-- 
2.7.4


