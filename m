Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C4D6260097
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 08:47:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9M8lx24025102
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 01:47:59 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 22 Oct 2014 01:47:59 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Oct 2014 04:47:57 -0400
Message-ID: <1413967677-3705-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [PATCH v2] mtd-utils: Fix alignment trap triggered by NEON instructions
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
X-List-Received-Date: Wed, 22 Oct 2014 08:48:00 -0000
Content-Type: text/plain

From: Yuanjie Huang <Yuanjie.Huang@windriver.com>

NEON instruction VLD1.64 was used to copy 64 bits data after type
casting, and they will trigger alignment trap.
This patch uses memcpy to avoid alignment problem.

Signed-off-by: Yuanjie Huang <Yuanjie.Huang@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../mtd/mtd-utils/fix-armv7-neon-alignment.patch   | 44 ++++++++++++++++++++++
 meta/recipes-devtools/mtd/mtd-utils_git.bb         |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-devtools/mtd/mtd-utils/fix-armv7-neon-alignment.patch

diff --git a/meta/recipes-devtools/mtd/mtd-utils/fix-armv7-neon-alignment.patch b/meta/recipes-devtools/mtd/mtd-utils/fix-armv7-neon-alignment.patch
new file mode 100644
index 0000000..05f1629
--- /dev/null
+++ b/meta/recipes-devtools/mtd/mtd-utils/fix-armv7-neon-alignment.patch
@@ -0,0 +1,44 @@
+Upstream-Status: Pending
+
+NEON instruction VLD1.64 was used to copy 64 bits data after type
+casting, and they will trigger alignment trap.
+This patch uses memcpy to avoid alignment problem.
+
+Signed-off-by: Yuanjie Huang <Yuanjie.Huang@windriver.com>
+
+diff --git a/mkfs.ubifs/key.h b/mkfs.ubifs/key.h
+index d3a02d4..e7e9218 100644
+--- a/mkfs.ubifs/key.h
++++ b/mkfs.ubifs/key.h
+@@ -141,10 +141,12 @@ static inline void data_key_init(union ubifs_key *key, ino_t inum,
+  */
+ static inline void key_write(const union ubifs_key *from, void *to)
+ {
+-	union ubifs_key *t = to;
++	__le32 x[2];
+ 
+-	t->j32[0] = cpu_to_le32(from->u32[0]);
+-	t->j32[1] = cpu_to_le32(from->u32[1]);
++	x[0] = cpu_to_le32(from->u32[0]);
++	x[1] = cpu_to_le32(from->u32[1]);
++
++	memcpy(to, &x, 8);
+ 	memset(to + 8, 0, UBIFS_MAX_KEY_LEN - 8);
+ }
+ 
+@@ -156,10 +158,12 @@ static inline void key_write(const union ubifs_key *from, void *to)
+  */
+ static inline void key_write_idx(const union ubifs_key *from, void *to)
+ {
+-	union ubifs_key *t = to;
++	__le32 x[2];
++
++	x[0] = cpu_to_le32(from->u32[0]);
++	x[1] = cpu_to_le32(from->u32[1]);
+ 
+-	t->j32[0] = cpu_to_le32(from->u32[0]);
+-	t->j32[1] = cpu_to_le32(from->u32[1]);
++	memcpy(to, &x, 8);
+ }
+ 
+ /**
diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index f78bc7e..52297c6 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 SRCREV = "9f107132a6a073cce37434ca9cda6917dd8d866b"
 SRC_URI = "git://git.infradead.org/mtd-utils.git \
 		file://add-exclusion-to-mkfs-jffs2-git-2.patch \
+		file://fix-armv7-neon-alignment.patch \
 "
 
 PV = "1.5.1+git${SRCPV}"
-- 
2.0.0


