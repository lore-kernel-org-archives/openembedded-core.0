Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 193D4C61DA4
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 06:00:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.27446.1678082417172159865
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Mar 2023 22:00:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=NJrkqhby;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=242910b39b=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3265undQ027339
	for <openembedded-core@lists.openembedded.org>; Sun, 5 Mar 2023 22:00:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=OGwpJrxuk/42Z8uVXs2tX0I85UtIvvNUHh3c+SkWHR4=;
 b=NJrkqhby6nYzV09ShCOij113Nu00lUki2ld+qURFLtKKFEGpOaANXwl0wDVqIAZYzlyU
 9eUBKozU1uwvwRPN1yarHKP3H+a0hR8b/UEscRELETlJ3bE0STLphxTJ3XyqIvegYJYm
 kYzXV7/eIHkhVJyzJl3rywKnIdGqdw8PadpIm+JWZ3D/CVwRZLP8rZidEAZbR0J7LxQv
 b5pr5+YegLo1zoh+3llzq4L2fk8LPxb9fzCtvVfoHFb/NcebemDtZjZxEUvAVw3/Q50J
 3ffh0gjVTO15q0W2qcHZg/L2SZaGevQIHeWZkKV5CGIyFQCPCr8PD2/8krLIXtIyZ0lb xg== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p46crh8yp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 05 Mar 2023 22:00:16 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.18; Sun, 5 Mar 2023 22:00:15 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Sun, 5 Mar 2023 22:00:14 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] grub2: support metadata_csum_seed feature
Date: Mon, 6 Mar 2023 14:00:11 +0800
Message-ID: <20230306060011.11815-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: Uvqr8Hqn8cHS0R3yJ78C3iWaZQZ27hck
X-Proofpoint-ORIG-GUID: Uvqr8Hqn8cHS0R3yJ78C3iWaZQZ27hck
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-05_12,2023-03-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303060049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 06:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178058

From: Kai Kang <kai.kang@windriver.com>

It enable the metadata_csum_seed feature by default in e2fsprogs 1.47.0
and causes grub doesn't work. Backport patch to make grub support this
feature.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...gnore-checksum-seed-incompat-feature.patch | 66 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0001-fs-ext2-Ignore-checksum-seed-incompat-feature.patch

diff --git a/meta/recipes-bsp/grub/files/0001-fs-ext2-Ignore-checksum-seed-incompat-feature.patch b/meta/recipes-bsp/grub/files/0001-fs-ext2-Ignore-checksum-seed-incompat-feature.patch
new file mode 100644
index 0000000000..a44d139375
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0001-fs-ext2-Ignore-checksum-seed-incompat-feature.patch
@@ -0,0 +1,66 @@
+It enable the metadata_csum_seed feature by default in e2fsprogs 1.47.0 and
+causes grub doesn't work. Backport patch to make grub support this feature.
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=7fd5fef]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 7fd5feff97c4b1f446f8fcf6d37aca0c64e7c763 Mon Sep 17 00:00:00 2001
+From: Javier Martinez Canillas <javierm@redhat.com>
+Date: Fri, 11 Jun 2021 21:36:16 +0200
+Subject: [PATCH] fs/ext2: Ignore checksum seed incompat feature
+
+This incompat feature is used to denote that the filesystem stored its
+metadata checksum seed in the superblock. This is used to allow tune2fs
+changing the UUID on a mounted metdata_csum filesystem without having
+to rewrite all the disk metadata. However, the GRUB doesn't use the
+metadata checksum at all. So, it can just ignore this feature if it
+is enabled. This is consistent with the GRUB filesystem code in general
+which just does a best effort to access the filesystem's data.
+
+The checksum seed incompat feature has to be removed from the ignore
+list if the support for metadata checksum verification is added to the
+GRUB ext2 driver later.
+
+Suggested-by: Eric Sandeen <esandeen@redhat.com>
+Suggested-by: Lukas Czerner <lczerner@redhat.com>
+Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
+Reviewed-by: Lukas Czerner <lczerner@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+---
+ grub-core/fs/ext2.c | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/grub-core/fs/ext2.c b/grub-core/fs/ext2.c
+index e7dd78e66..4953a1591 100644
+--- a/grub-core/fs/ext2.c
++++ b/grub-core/fs/ext2.c
+@@ -103,6 +103,7 @@ GRUB_MOD_LICENSE ("GPLv3+");
+ #define EXT4_FEATURE_INCOMPAT_64BIT		0x0080
+ #define EXT4_FEATURE_INCOMPAT_MMP		0x0100
+ #define EXT4_FEATURE_INCOMPAT_FLEX_BG		0x0200
++#define EXT4_FEATURE_INCOMPAT_CSUM_SEED		0x2000
+ #define EXT4_FEATURE_INCOMPAT_ENCRYPT          0x10000
+ 
+ /* The set of back-incompatible features this driver DOES support. Add (OR)
+@@ -123,10 +124,15 @@ GRUB_MOD_LICENSE ("GPLv3+");
+  * mmp:            Not really back-incompatible - was added as such to
+  *                 avoid multiple read-write mounts. Safe to ignore for this
+  *                 RO driver.
++ * checksum seed:  Not really back-incompatible - was added to allow tools
++ *                 such as tune2fs to change the UUID on a mounted metadata
++ *                 checksummed filesystem. Safe to ignore for now since the
++ *                 driver doesn't support checksum verification. However, it
++ *                 has to be removed from this list if the support is added later.
+  */
+ #define EXT2_DRIVER_IGNORED_INCOMPAT ( EXT3_FEATURE_INCOMPAT_RECOVER \
+-				     | EXT4_FEATURE_INCOMPAT_MMP)
+-
++				     | EXT4_FEATURE_INCOMPAT_MMP \
++				     | EXT4_FEATURE_INCOMPAT_CSUM_SEED)
+ 
+ #define EXT3_JOURNAL_MAGIC_NUMBER	0xc03b3998U
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index b92cbc2654..58b215d79c 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -41,6 +41,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2022-2601.patch \
            file://CVE-2022-3775.patch \
            file://0001-risc-v-Handle-R_RISCV_CALL_PLT-reloc.patch \
+           file://0001-fs-ext2-Ignore-checksum-seed-incompat-feature.patch \
 "
 
 SRC_URI[sha256sum] = "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
-- 
2.17.1


