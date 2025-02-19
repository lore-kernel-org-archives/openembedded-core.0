Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C452C021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 07:04:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.16820.1739948680728611858
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 23:04:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=41458e6591=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J5rqRZ011852
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 23:04:40 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00k8mq5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 23:04:40 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 18 Feb 2025 23:04:39 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 18 Feb 2025 23:04:39 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 1/6] u-boot: fix CVE-2024-57254
Date: Wed, 19 Feb 2025 15:04:33 +0800
Message-ID: <20250219070438.2320112-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=N67TF39B c=1 sm=1 tr=0 ts=67b58288 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=T2h4t0Lz3GQA:10 a=PYnjg3YJAAAA:8 a=YfCOm-DyAAAA:8 a=t7CeM3EgAAAA:8 a=P-IC7800AAAA:8 a=TPJKs4zHcULvXnfe0SAA:9
 a=zQLMK8awuJ6_Hvp-_9Ux:22 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: SzQhquQw1P9hCpDd1UahqqvJePNxcPLb
X-Proofpoint-GUID: SzQhquQw1P9hCpDd1UahqqvJePNxcPLb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_03,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=955
 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502190054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 07:04:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211667

An integer overflow in sqfs_inode_size in Das U-Boot before
2025.01-rc1 occurs in the symlink size calculation via a
crafted squashfs filesystem.

https://nvd.nist.gov/vuln/detail/CVE-2024-57254

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../u-boot/files/CVE-2024-57254.patch         | 47 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  4 +-
 2 files changed, 50 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-57254.patch

diff --git a/meta/recipes-bsp/u-boot/files/CVE-2024-57254.patch b/meta/recipes-bsp/u-boot/files/CVE-2024-57254.patch
new file mode 100644
index 0000000000..be00121224
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2024-57254.patch
@@ -0,0 +1,47 @@
+From 3f9deb424ecd6ecd50f165b42f0b0290d83853f5 Mon Sep 17 00:00:00 2001
+From: Richard Weinberger <richard@nod.at>
+Date: Fri, 2 Aug 2024 18:36:45 +0200
+Subject: [PATCH 1/8] squashfs: Fix integer overflow in sqfs_inode_size()
+
+A carefully crafted squashfs filesystem can exhibit an extremly large
+inode size and overflow the calculation in sqfs_inode_size().
+As a consequence, the squashfs driver will read from wrong locations.
+
+Fix by using __builtin_add_overflow() to detect the overflow.
+
+Signed-off-by: Richard Weinberger <richard@nod.at>
+Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
+
+CVE: CVE-2024-57254
+Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit/c8e929e5758999933f9e905049ef2bf3fe6b140d]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ fs/squashfs/sqfs_inode.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/fs/squashfs/sqfs_inode.c b/fs/squashfs/sqfs_inode.c
+index d25cfb53..bb3ccd37 100644
+--- a/fs/squashfs/sqfs_inode.c
++++ b/fs/squashfs/sqfs_inode.c
+@@ -78,11 +78,16 @@ int sqfs_inode_size(struct squashfs_base_inode *inode, u32 blk_size)
+ 
+ 	case SQFS_SYMLINK_TYPE:
+ 	case SQFS_LSYMLINK_TYPE: {
++		int size;
++
+ 		struct squashfs_symlink_inode *symlink =
+ 			(struct squashfs_symlink_inode *)inode;
+ 
+-		return sizeof(*symlink) +
+-			get_unaligned_le32(&symlink->symlink_size);
++		if (__builtin_add_overflow(sizeof(*symlink),
++		    get_unaligned_le32(&symlink->symlink_size), &size))
++			return -EINVAL;
++
++		return size;
+ 	}
+ 
+ 	case SQFS_BLKDEV_TYPE:
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 1f17bd7d0a..9ce42e829f 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -14,7 +14,9 @@ PE = "1"
 # repo during parse
 SRCREV = "866ca972d6c3cabeaf6dbac431e8e08bb30b3c8e"
 
-SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
+SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master \
+           file://CVE-2024-57254.patch \
+"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
-- 
2.34.1


