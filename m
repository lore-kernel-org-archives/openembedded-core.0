Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE449C021AB
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 08:06:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17372.1739952382752042405
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 00:06:22 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=41458e6591=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J5UZLq018399
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 08:06:22 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00kgpq0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 08:06:21 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 19 Feb 2025 00:06:21 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 19 Feb 2025 00:06:20 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [kirkstone][PATCH 6/6] u-boot: fix CVE-2024-57259
Date: Wed, 19 Feb 2025 16:06:14 +0800
Message-ID: <20250219080614.902786-6-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219080614.902786-1-hongxu.jia@windriver.com>
References: <20250219080614.902786-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: VKAFlP4mIGNKHGlJJgAIKKdGQzr4lKgZ
X-Proofpoint-ORIG-GUID: VKAFlP4mIGNKHGlJJgAIKKdGQzr4lKgZ
X-Authority-Analysis: v=2.4 cv=BvtnwZX5 c=1 sm=1 tr=0 ts=67b590fd cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=T2h4t0Lz3GQA:10 a=PYnjg3YJAAAA:8 a=YfCOm-DyAAAA:8 a=t7CeM3EgAAAA:8 a=P-IC7800AAAA:8 a=Al2zql01oGyaSE7bB7UA:9
 a=zQLMK8awuJ6_Hvp-_9Ux:22 a=FdTzh2GWekK77mhwV6Dw:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_03,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502190063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 08:06:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211678

sqfs_search_dir in Das U-Boot before 2025.01-rc1 exhibits an off-by-one error
and resultant heap memory corruption for squashfs directory listing because the
path separator is not considered in a size calculation.

https://nvd.nist.gov/vuln/detail/CVE-2024-57259

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../u-boot/files/CVE-2024-57259.patch         | 41 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot_2022.01.bb     |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-57259.patch

diff --git a/meta/recipes-bsp/u-boot/files/CVE-2024-57259.patch b/meta/recipes-bsp/u-boot/files/CVE-2024-57259.patch
new file mode 100644
index 0000000000..fdf5fdfce4
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2024-57259.patch
@@ -0,0 +1,41 @@
+From 2c08fe306c6cbc60ec4beb434c71e56bb7abb678 Mon Sep 17 00:00:00 2001
+From: Richard Weinberger <richard@nod.at>
+Date: Fri, 2 Aug 2024 22:05:09 +0200
+Subject: [PATCH 8/8] squashfs: Fix heap corruption in sqfs_search_dir()
+
+res needs to be large enough to store both strings rem and target,
+plus the path separator and the terminator.
+Currently the space for the path separator is not accounted, so
+the heap is corrupted by one byte.
+
+Signed-off-by: Richard Weinberger <richard@nod.at>
+Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
+
+CVE: CVE-2024-57259
+Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit/048d795bb5b3d9c5701b4855f5e74bcf6849bf5e]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ fs/squashfs/sqfs.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/fs/squashfs/sqfs.c b/fs/squashfs/sqfs.c
+index a5b7890e..1bd9b2a4 100644
+--- a/fs/squashfs/sqfs.c
++++ b/fs/squashfs/sqfs.c
+@@ -563,8 +563,11 @@ static int sqfs_search_dir(struct squashfs_dir_stream *dirs, char **token_list,
+ 				ret = -ENOMEM;
+ 				goto out;
+ 			}
+-			/* Concatenate remaining tokens and symlink's target */
+-			res = malloc(strlen(rem) + strlen(target) + 1);
++			/*
++			 * Concatenate remaining tokens and symlink's target.
++			 * Allocate enough space for rem, target, '/' and '\0'.
++			 */
++			res = malloc(strlen(rem) + strlen(target) + 2);
+ 			if (!res) {
+ 				ret = -ENOMEM;
+ 				goto out;
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
index cdee9fc721..0ff2477c39 100644
--- a/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
+++ b/meta/recipes-bsp/u-boot/u-boot_2022.01.bb
@@ -18,6 +18,7 @@ SRC_URI +=       " file://0001-riscv32-Use-double-float-ABI-for-rv32.patch \
                    file://CVE-2024-57258-1.patch \
                    file://CVE-2024-57258-2.patch \
                    file://CVE-2024-57258-3.patch \
+                   file://CVE-2024-57259.patch \
                  "
 
 DEPENDS += "bc-native dtc-native python3-setuptools-native"
-- 
2.34.1


