Return-Path: <heiko.thole@entwicklung.eq-3.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C2CFEB64DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 04:45:04 +0000 (UTC)
Received: from DEU01-BE0-obe.outbound.protection.outlook.com (DEU01-BE0-obe.outbound.protection.outlook.com [40.107.127.79])
 by mx.groups.io with SMTP id smtpd.web11.1629.1689569096984480290
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jul 2023 21:44:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: entwicklung.eq-3.de, ip: 40.107.127.79, mailfrom: heiko.thole@entwicklung.eq-3.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ne+cvlfmcljZ/Ui7qxB8CAggUKx8pTSiseob4EQW0I4Q+PcmaEO+ejG4Z/5OBcmss3WOay3wKj0ax9vrcd23chjYvl5RsScHgWk2lE1U8nPkndbD55l2v1utRFWWJmiNtgLcojxNe6afcDOVR/hdCEmlAV7z5cF2cNo/mYxZ2dc3JAhvDzQAPj+ZkUTpUHyY3DAaxBRUeTnbfSsFISOkdi1mVHxbNyNItfFWsQ3WsAntBLShRAid24ywf3AYJv+qCr3Xn7J2VsOgaQp/BlUfEu8kdXS46s6/W77eaR/UwV+ARylhFmRxp8bathCJn7ExbzbSiTgv6P6QNdjvStqA0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ow84axfbtasaixgOm/E90Fw7mm6/h3GlTdAcGYNYxq0=;
 b=XcG6YAbF2tFBFPZbOSB0Hv/OfoWMg1Xet7kxhC46CoZQrI3eW2moLROkQ+OLypTHNNBZhVt9ZhuOeAKCR5/SkgVdrsFTu3Pcw4gDd13tbrSCa+d9HU1WZw//R5WK4PJAXlG57az3WkpbL/+qj5agdnrrz34UeT81cHB5AVApgaXn2ouLNi70W5M/A++q9AAN+uZGnzbVgXpcVpSLrQt2mh9NSS3VBvUylMPeGMdgBVzNC8IxhbuCty9Bg5eS772dziCdv+uVOFa4K/pIvSNXUJapdp9fa3FLjqg9TCyjsLT+gxaSoJt0Nx7v5cP1mkqRJFP/v7TECybl/BOOPNOpfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 217.7.137.154) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=entwicklung.eq-3.de; dmarc=bestguesspass action=none
 header.from=entwicklung.eq-3.de; dkim=none (message not signed); arc=none
Received: from BE1P281CA0099.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:79::9) by
 BEZP281MB3381.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:25::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.31; Mon, 17 Jul 2023 04:44:52 +0000
Received: from BE0DEU01FT009.eop-deu01.prod.protection.outlook.com
 (2603:10a6:b10:79:cafe::ed) by BE1P281CA0099.outlook.office365.com
 (2603:10a6:b10:79::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.22 via Frontend
 Transport; Mon, 17 Jul 2023 04:44:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 217.7.137.154)
 smtp.mailfrom=entwicklung.eq-3.de; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none
 header.from=entwicklung.eq-3.de;
Received-SPF: Pass (protection.outlook.com: domain of entwicklung.eq-3.de
 designates 217.7.137.154 as permitted sender)
 receiver=protection.outlook.com; client-ip=217.7.137.154;
 helo=smtp03.elv.lan; pr=C
Received: from smtp03.elv.lan (217.7.137.154) by
 BE0DEU01FT009.mail.protection.outlook.com (20.128.125.111) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6609.22 via Frontend Transport; Mon, 17 Jul 2023 04:44:52 +0000
Received: from terminals.elv.lan ([172.25.239.241] helo=EQ3-52304.elv.lan)
	by smtp03.elv.lan with esmtp (Exim 4.94.2)
	(envelope-from <heiko.thole@entwicklung.eq-3.de>)
	id 1qLG6N-006uFk-DG; Mon, 17 Jul 2023 06:44:51 +0200
From: Heiko Thole <heiko.thole@entwicklung.eq-3.de>
To: openembedded-core@lists.openembedded.org
Cc: Heiko Thole <heiko.thole@entwicklung.eq-3.de>
Subject: [PATCH] wic: Add dependencies for erofs-utils
Date: Mon, 17 Jul 2023 06:44:49 +0200
Message-ID: <20230717044449.11556-1-heiko.thole@entwicklung.eq-3.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BE0DEU01FT009:EE_|BEZP281MB3381:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6647f08b-74b5-4176-ec61-08db86808f47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	dHzgEEv1BxjgFGtNC7YuQfa5Z2hy3hfEfP9/ndw+zqyVk49dtpYFhHVSA0qeqWUeCHZhFB5kPpbChNeChrR4jMHSuVTCLp9+wNFvUbjpPLsOEBbdwLYEjiKM9MryxM+dHNsdxz2VWgHJxjS4N+YtntP9/NhVIeMmHNUBxQ6xsyxzxkabokvI+rghRdmbYQOz6Kk6RG5MtSLhvPBiWuGTMfok3CcLk/orwnWT722jIv6ZmxR9sChqWI1RnQJ65BqFmy3dxh8+pAjphPBjQOlgpFKQ6YW0AfqDrPjpk7UtNM1RP7tGigycpXPYu1BwiZkaVuAagSTEmaiDFrHoJDp7MDj9UOLQlELIhxhNGydBygwFoHwbfTQCUJ5fWtly2DlTVYLkpOVDc0SYfO1U3J03HG6YxCwR1tmUdyH4nG2AUYw+IPWxJe6xAms89ngWDAH4IRVOri5uhX3CZoHnD9JlWdQNIhx6mQwQA5dZoT+5ttwnbU8AC8SK8utdCqP/yOBT4O47Qp2V4w0CBU6TP32WBXtvQWdncNFe01fqfzQMGIgc17n4nnAsFpy0xpVNIi+LwDQC0A/YpqCGlApE5RHUXMUDcDoZ+9qzB2s5gzRfmQ5L2Wg+5QQA9PL54k/Uyr/cDQxB/4GxoriYiwFepWHSZxFr3aWyEwPUdaCDq+jA92yWrBy+Rka/TqfIX8aSTmqMpncqtmgzmFNwmHrYqN5xOuWPuRhDjUYAxb+hE98Vz7Way9/x42Cd2v+UTfDzqPxV
X-Forefront-Antispam-Report: 
	CIP:217.7.137.154;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp03.elv.lan;PTR:thor.elv.de;CAT:NONE;SFS:(13230028)(4636009)(39840400004)(346002)(396003)(136003)(376002)(451199021)(82310400008)(36840700001)(46966006)(40480700001)(356005)(70206006)(478600001)(41300700001)(5660300002)(8936002)(8676002)(9786002)(316002)(6916009)(70586007)(4326008)(2616005)(336012)(186003)(36860700001)(83380400001)(47076005)(26005)(1076003)(107886003)(86362001)(44832011)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: entwicklung.eq-3.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 04:44:52.0848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6647f08b-74b5-4176-ec61-08db86808f47
X-MS-Exchange-CrossTenant-Id: 6bb70bfd-56fb-4f95-99c8-16d0dd9d5592
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=6bb70bfd-56fb-4f95-99c8-16d0dd9d5592;Ip=[217.7.137.154];Helo=[smtp03.elv.lan]
X-MS-Exchange-CrossTenant-AuthSource: 
	BE0DEU01FT009.eop-deu01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEZP281MB3381
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 04:45:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184427

In order to build erofs filesystems, wic must have the erofs-utils package =
installed into its sysroot.

Signed-off-by: Heiko Thole <heiko.thole@entwicklung.eq-3.de>
---
 meta/classes/image_types_wic.bbclass | 2 +-
 meta/recipes-core/meta/wic-tools.bb  | 2 +-
 scripts/lib/wic/misc.py              | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_type=
s_wic.bbclass
index 6453dd1b74..8497916d48 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -83,7 +83,7 @@ do_image_wic[recrdeptask] +=3D "do_deploy"
 do_image_wic[deptask] +=3D "do_image_complete"

 WKS_FILE_DEPENDS_DEFAULT =3D '${@bb.utils.contains_any("BUILD_ARCH", [ 'x8=
6_64', 'i686' ], "syslinux-native", "",d)}'
-WKS_FILE_DEPENDS_DEFAULT +=3D "bmap-tools-native cdrtools-native btrfs-too=
ls-native squashfs-tools-native e2fsprogs-native"
+WKS_FILE_DEPENDS_DEFAULT +=3D "bmap-tools-native cdrtools-native btrfs-too=
ls-native squashfs-tools-native e2fsprogs-native erofs-utils-native"
 # Unified kernel images need objcopy
 WKS_FILE_DEPENDS_DEFAULT +=3D "virtual/${MLPREFIX}${TARGET_PREFIX}binutils=
"
 WKS_FILE_DEPENDS_BOOTLOADERS =3D ""
diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta/w=
ic-tools.bb
index daaf3ea576..9282d36a4d 100644
--- a/meta/recipes-core/meta/wic-tools.bb
+++ b/meta/recipes-core/meta/wic-tools.bb
@@ -6,7 +6,7 @@ DEPENDS =3D "\
            parted-native gptfdisk-native dosfstools-native \
            mtools-native bmap-tools-native grub-native cdrtools-native \
            btrfs-tools-native squashfs-tools-native pseudo-native \
-           e2fsprogs-native util-linux-native tar-native \
+           e2fsprogs-native util-linux-native tar-native erofs-utils-nativ=
e \
            virtual/${TARGET_PREFIX}binutils \
            "
 DEPENDS:append:x86 =3D " syslinux-native syslinux grub-efi systemd-boot"
diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
index a8aab6c524..2b90821b30 100644
--- a/scripts/lib/wic/misc.py
+++ b/scripts/lib/wic/misc.py
@@ -36,6 +36,7 @@ NATIVE_RECIPES =3D {"bmaptool": "bmap-tools",
                   "mkdosfs": "dosfstools",
                   "mkisofs": "cdrtools",
                   "mkfs.btrfs": "btrfs-tools",
+                  "mkfs.erofs": "erofs-utils",
                   "mkfs.ext2": "e2fsprogs",
                   "mkfs.ext3": "e2fsprogs",
                   "mkfs.ext4": "e2fsprogs",
--
2.41.0

eQ-3 Entwicklung GmbH, Maiburger Str. 36, 26789 Leer
Gesch=E4ftsf=FChrer: Prof. Heinz-G. Redeker
Registergericht: Amtsgericht Aurich, HRB 110388
eQ-3 AG, Maiburger Str. 29, 26789 Leer
Vorstand: Prof. Heinz-G. Redeker (Vorsitzender), Helga Redeker
Vorsitzende des Aufsichtsrats: Irmgard Keplin
Registergericht: Amtsgericht Aurich, HRB 200335

