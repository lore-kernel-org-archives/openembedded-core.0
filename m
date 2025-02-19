Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FC14C021B6
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 08:18:32 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.17520.1739953105160810703
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 00:18:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=41458e6591=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J6jrkM000955
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 00:18:24 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00krqd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 00:18:24 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 19 Feb 2025 00:18:23 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 19 Feb 2025 00:18:23 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH v2 4/8] u-boot: fix CVE-2024-57255
Date: Wed, 19 Feb 2025 16:18:15 +0800
Message-ID: <20250219081819.926163-4-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219081819.926163-1-hongxu.jia@windriver.com>
References: <20250219081819.926163-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 0OrfsqbLjeN0qwS39fB7J8V4c2QekI_9
X-Proofpoint-ORIG-GUID: 0OrfsqbLjeN0qwS39fB7J8V4c2QekI_9
X-Authority-Analysis: v=2.4 cv=Ao8U3P9P c=1 sm=1 tr=0 ts=67b593d0 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=T2h4t0Lz3GQA:10 a=PYnjg3YJAAAA:8 a=YfCOm-DyAAAA:8 a=t7CeM3EgAAAA:8 a=P-IC7800AAAA:8 a=a0NpaTvsPSIvdQCIlX4A:9
 a=zQLMK8awuJ6_Hvp-_9Ux:22 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_03,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 impostorscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502190064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 08:18:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211683

An integer overflow in sqfs_resolve_symlink in Das U-Boot before 2025.01-rc1
occurs via a crafted squashfs filesystem with an inode size of 0xffffffff,
resulting in a malloc of zero and resultant memory overwrite.

https://nvd.nist.gov/vuln/detail/CVE-2024-57255

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../u-boot/files/CVE-2024-57255.patch         | 53 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2022.01.bb     |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-57255.patch

diff --git a/meta/recipes-bsp/u-boot/files/CVE-2024-57255.patch b/meta/recipes-bsp/u-boot/files/CVE-2024-57255.patch
new file mode 100644
index 0000000000..4ca72da554
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2024-57255.patch
@@ -0,0 +1,53 @@
+From 5d7ca74388544bf8c95e104517a9120e94bfe40d Mon Sep 17 00:00:00 2001
+From: Richard Weinberger <richard@nod.at>
+Date: Fri, 2 Aug 2024 18:36:44 +0200
+Subject: [PATCH 2/8] squashfs: Fix integer overflow in sqfs_resolve_symlink()
+
+A carefully crafted squashfs filesystem can exhibit an inode size of 0xffffffff,
+as a consequence malloc() will do a zero allocation.
+Later in the function the inode size is again used for copying data.
+So an attacker can overwrite memory.
+Avoid the overflow by using the __builtin_add_overflow() helper.
+
+Signed-off-by: Richard Weinberger <richard@nod.at>
+Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
+
+CVE: CVE-2024-57255
+Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit/233945eba63e24061dffeeaeb7cd6fe985278356]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ fs/squashfs/sqfs.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/fs/squashfs/sqfs.c b/fs/squashfs/sqfs.c
+index 1430e671..16a07c06 100644
+--- a/fs/squashfs/sqfs.c
++++ b/fs/squashfs/sqfs.c
+@@ -422,8 +422,10 @@ static char *sqfs_resolve_symlink(struct squashfs_symlink_inode *sym,
+ 	char *resolved, *target;
+ 	u32 sz;
+ 
+-	sz = get_unaligned_le32(&sym->symlink_size);
+-	target = malloc(sz + 1);
++	if (__builtin_add_overflow(get_unaligned_le32(&sym->symlink_size), 1, &sz))
++		return NULL;
++
++	target = malloc(sz);
+ 	if (!target)
+ 		return NULL;
+ 
+@@ -431,9 +433,9 @@ static char *sqfs_resolve_symlink(struct squashfs_symlink_inode *sym,
+ 	 * There is no trailling null byte in the symlink's target path, so a
+ 	 * copy is made and a '\0' is added at its end.
+ 	 */
+-	target[sz] = '\0';
++	target[sz - 1] = '\0';
+ 	/* Get target name (relative path) */
+-	strncpy(target, sym->symlink, sz);
++	strncpy(target, sym->symlink, sz - 1);
+ 
+ 	/* Relative -> absolute path conversion */
+ 	resolved = sqfs_get_abs_path(base_path, target);
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
index d9c6fcb993..cfe36256f3 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
@@ -12,6 +12,7 @@ SRC_URI +=       " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch \
                    file://CVE-2022-2347_1.patch \
                    file://CVE-2022-2347_2.patch \
                    file://CVE-2024-57254.patch \
+                   file://CVE-2024-57255.patch \
                  "
 
 DEPENDS += "bc-native dtc-native python3-setuptools-native"
-- 
2.34.1


