Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B687C021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 07:04:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.17082.1739948682677973962
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 23:04:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=41458e6591=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J5gvgA027882
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 23:04:42 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00k8mq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 23:04:42 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 18 Feb 2025 23:04:41 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 18 Feb 2025 23:04:41 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 3/6] u-boot: fix CVE-2024-57256
Date: Wed, 19 Feb 2025 15:04:35 +0800
Message-ID: <20250219070438.2320112-3-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219070438.2320112-1-hongxu.jia@windriver.com>
References: <20250219070438.2320112-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=N67TF39B c=1 sm=1 tr=0 ts=67b5828a cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=T2h4t0Lz3GQA:10 a=PYnjg3YJAAAA:8 a=YfCOm-DyAAAA:8 a=t7CeM3EgAAAA:8 a=r4y7CP4eWtFlPBpMJRAA:9 a=zQLMK8awuJ6_Hvp-_9Ux:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: qHa10DKmCdSYup3OA0sGVx-AClFsN9ku
X-Proofpoint-GUID: qHa10DKmCdSYup3OA0sGVx-AClFsN9ku
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_03,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=911
 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502190054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 07:04:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211669

An integer overflow in ext4fs_read_symlink in Das U-Boot before 2025.01-rc1
occurs for zalloc (adding one to an le32 variable) via a crafted ext4
filesystem with an inode size of 0xffffffff, resulting in a malloc of
zero and resultant memory overwrite.

https://nvd.nist.gov/vuln/detail/CVE-2024-57256

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../u-boot/files/CVE-2024-57256.patch         | 51 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-57256.patch

diff --git a/meta/recipes-bsp/u-boot/files/CVE-2024-57256.patch b/meta/recipes-bsp/u-boot/files/CVE-2024-57256.patch
new file mode 100644
index 0000000000..78cf4ac225
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2024-57256.patch
@@ -0,0 +1,51 @@
+From 49cab731abe7a98db4ac16666e3b5ab3bc799282 Mon Sep 17 00:00:00 2001
+From: Richard Weinberger <richard@nod.at>
+Date: Fri, 9 Aug 2024 11:54:28 +0200
+Subject: [PATCH 3/8] ext4: Fix integer overflow in ext4fs_read_symlink()
+
+While zalloc() takes a size_t type, adding 1 to the le32 variable
+will overflow.
+A carefully crafted ext4 filesystem can exhibit an inode size of 0xffffffff
+and as consequence zalloc() will do a zero allocation.
+
+Later in the function the inode size is again used for copying data.
+So an attacker can overwrite memory.
+
+Avoid the overflow by using the __builtin_add_overflow() helper.
+
+Signed-off-by: Richard Weinberger <richard@nod.at>
+
+CVE: CVE-2024-57256
+Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit/35f75d2a46e5859138c83a75cd2f4141c5479ab9]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ fs/ext4/ext4_common.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/fs/ext4/ext4_common.c b/fs/ext4/ext4_common.c
+index f50de7c0..a7798296 100644
+--- a/fs/ext4/ext4_common.c
++++ b/fs/ext4/ext4_common.c
+@@ -2188,13 +2188,18 @@ static char *ext4fs_read_symlink(struct ext2fs_node *node)
+ 	struct ext2fs_node *diro = node;
+ 	int status;
+ 	loff_t actread;
++	size_t alloc_size;
+ 
+ 	if (!diro->inode_read) {
+ 		status = ext4fs_read_inode(diro->data, diro->ino, &diro->inode);
+ 		if (status == 0)
+ 			return NULL;
+ 	}
+-	symlink = zalloc(le32_to_cpu(diro->inode.size) + 1);
++
++	if (__builtin_add_overflow(le32_to_cpu(diro->inode.size), 1, &alloc_size))
++		return NULL;
++
++	symlink = zalloc(alloc_size);
+ 	if (!symlink)
+ 		return NULL;
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index e907edd2eb..097ef685e9 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -17,6 +17,7 @@ SRCREV = "866ca972d6c3cabeaf6dbac431e8e08bb30b3c8e"
 SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master \
            file://CVE-2024-57254.patch \
            file://CVE-2024-57255.patch \
+           file://CVE-2024-57256.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.34.1


