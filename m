Return-Path: <sean.anderson@seco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 086E1C433FE
	for <webhook@archiver.kernel.org>; Fri, 21 Oct 2022 23:38:01 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.78])
 by mx.groups.io with SMTP id smtpd.web10.1487.1666395471881117197
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 16:37:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@seco.com header.s=selector1 header.b=MxMc6g3e;
 spf=pass (domain: seco.com, ip: 40.107.6.78, mailfrom: sean.anderson@seco.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WhVtvqOQavPidAoa2tzhEIQHW4oV+cqGPbmkyDdINg7R6WmUTAMXe6z6T3J/OSgN0G6dmCAaLOhhUkd++C/lxRNTbi3YVKmnTDXaYxmpVjzhCQJFfAdF4df6TA4T1CrZ6XaYyEf3ds8kEZzdDhCQWK9qKw7yUq3Wt0jMpzgjE1+t7h/RVex6jXsWj2ASrHXLG78/3IPSwDZvgBbEpAPDfgVy5g8y6+I2ZoIx/eNPuMz0rAP37nVd2eNWyE+avaBzOGZJnTgGClyZrlLKzBcx8JiuhILH6JL3YK/P/c9H7BwJhAGuIatZA3ElHtCIb48U2CphedbN5WlY7sc9vI/bjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=es2SWx+WMGSVns4dxwioyWhqU9axbqy7VF4PSQbO5VU=;
 b=RKPC+ri0NE23x3PTeZXyMdbmPE6Is3mnLYEeJs1B/XAYbKYOUJfJLwmHd8ltin0IcdLcZOhaOqIcqfT21EZjrwPMANAVvrL39To9omCoYUPcTMpVLofXZ/mQafLAQKb/9nyO89XHKMnfU73t4gl8OQtr5t+iT2B1YxdkrGVFt8T4cvF3+SR2tFjwFkUGkGdm5VG5DKn+0caI53udl3BD7mJG1UrD8rqcRofLO3XOl94bXSDR9Lk+41300AaHUW9WkM1eIVtY6j8usd1LUZBhqks1CkYX09Mq6Pn2AVjADnw4mprGfPS5bhemjy3QIbcMkKvTJ4c7fLGxoEsI3peBpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=es2SWx+WMGSVns4dxwioyWhqU9axbqy7VF4PSQbO5VU=;
 b=MxMc6g3ew9GENl6nnm4zUuKXP4mGUrEiiAu6BoWx8dQUhuFpBQ8JrUdsz9xy2RJSO8XTXePOxnTGcqTYp0WmII0QNXvDRyuHQ0kAyDDUBgz5SYGPonrA43J0kZyllM40LbdtM1e7AgzH0iGmej7uE6902t5plLIt2a0HDyPBEBpg71LQsfJALrjARcinAZhFYo+dJumolY+6IWeHyfJKNJf9dbEvypu6YZxUh5rwbAV6opBaG+PNJlvOQR2AZwPeyPT13yY182JqMoYgQw7bGOOuTbdVtxNdv6sbwbRDH30ZH8ieW3KiTPDclSJNVJi75GDDbuA+8fBEJEgKY0xAcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by VI1PR0301MB6656.eurprd03.prod.outlook.com (2603:10a6:800:17f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.32; Fri, 21 Oct
 2022 23:37:52 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d%6]) with mapi id 15.20.5723.034; Fri, 21 Oct 2022
 23:37:52 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
CC: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH 5/6] uboot-sign: Split off kernel-fitimage variables
Date: Fri, 21 Oct 2022 19:37:25 -0400
Message-ID: <20221021233726.1751124-6-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20221021233726.1751124-1-sean.anderson@seco.com>
References: <20221021233726.1751124-1-sean.anderson@seco.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MN2PR11CA0012.namprd11.prod.outlook.com
 (2603:10b6:208:23b::17) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|VI1PR0301MB6656:EE_
X-MS-Office365-Filtering-Correlation-Id: ae6d7c2a-e2c0-47a5-d6e9-08dab3bd4562
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pch8zeG/z7zltcG0o31DaQ7E+ZrIgtXVmmvB0mGuI7hxRo6wa5GX1fFpFxajHTTnl+VgRexQVIakxjkrhCfdRn2ji/CS3OAOmIV/iqxuXMHLnki26b8hLbdIC9wTxEO2xIZX8kCt4bkgfCFPViTg4+E+BzUthUZ1BvBbdIp56h4b3hNYudtKnhdk6rOcETVjk8Dr9nySgwVmAQl40uuVeQn2C6F7+rPQtj7X4icsGrzGUK71Q7dqAGsYlFXe4aX9673T+cFz+ZoCdA5F8/f94WpIJWW7rLWEJVt/AChGvip6QZazmTpUCJmB7Fm1MikwyYVK+doQQ8wB9e2oU8xjnUOs1lNcT21o7k7D9NV5OmWNDqao/1C8H3uh2VYRypfOqtgwuPijJ3jOMJik1xrzWjCKZYR9tqrJc53uvmzr/Rn2V2xZWhX/rdj36fhYgNcyBTw8edQvB9dbr+8raprzL3YEai+ZcWY+WUf5upPMOv50Zkp7CZ3KvwCks+Pmpx6qCTUWvUHJrHZ2OQJPeyfTzZCi56isaMQT3WebeHu2+AoZu4ZtMTGNrBanUOqIyIfLLxB7mhK+N1TIS7BjwT1EPpRzjDSrOTzoU1B+vT1dwcZSivFrLHlECV3sQONSQAocW3ZJpPZEkK1Z2JEyVrtWZzzbK/bh18PCY9nQmT5EzBCi8e+or29Hts0q1NKN6ibv16MLh8gaPkaylieaHcIme0lm4OsPu6lOSW1A79biIDjpFDAm5g7IDnfbeQhtGEBI9xJEyYc+/hskj5Dg7+otmQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39840400004)(136003)(346002)(376002)(396003)(451199015)(478600001)(83380400001)(86362001)(6486002)(4326008)(8676002)(66476007)(66556008)(66946007)(54906003)(316002)(107886003)(6666004)(52116002)(36756003)(6506007)(8936002)(5660300002)(6512007)(41300700001)(26005)(110136005)(38350700002)(38100700002)(1076003)(186003)(2616005)(44832011)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?H7MVOwXT17n0PCA4cBUxZ8vnoco9EIHUcG1+H2+OBJz4UQCdsuApEGyDBOT8?=
 =?us-ascii?Q?iiHFWAHrgO7Rb+fkI3508kuNgfy8U8y/pJuVOgEK2i3s3aYavQz2QkWE1oRH?=
 =?us-ascii?Q?Ym1AltGqtX5nXToJN5PbXtDuWhxUH/BSy+q0slNWiisGmdap0h47fvBz24sx?=
 =?us-ascii?Q?qF0x8GJjmJLHM9+ttXIjwpDHUuI4ujrRsDlVar+pkwg4HMsfMDaPs7HCquio?=
 =?us-ascii?Q?qWrc+/vezMZfTcSK71s+6GASxLY3UzUQnfVQrT7KqTczINEAuy8tWCT9aHdy?=
 =?us-ascii?Q?7v6BsGqoMSahQ8Ux24aRihiybjwyCbwyFbGlClNyQCI3fWLLXykW/F0esiih?=
 =?us-ascii?Q?+wHWyMclv6cyo4yyk1yig/IqCDJ64ZE+NvTLoudu3NS+x78oKishjdpAuraK?=
 =?us-ascii?Q?2Gck4pe7S9CcifDtEzAtkt7Yee5WbpgHGJO5QBu4sUtROzf+g1piOqUsnSQt?=
 =?us-ascii?Q?KSA9MMWQ7VyWph9/kpnBiTu185VnNq0h4iqHblXeZIOY/5vdnkedF8LVSC7n?=
 =?us-ascii?Q?ttRc6RVtSUPiqcIVjkSSlrj+hoDMrTtIJiw3w22Iq7LoSIczWKLZRc/HqnOB?=
 =?us-ascii?Q?NvK/WvhB0gV+Td0A0QNM4DFZrNztgvYvqWE6k5c1qZ+mzj64vxPlxPC5dIpe?=
 =?us-ascii?Q?LGoMeH97c8AYz1k4qfayC1/W7ZjluY6t5vOPxqJ7FYW1hrdpNAujRPdQ9QLN?=
 =?us-ascii?Q?8NVKju34kXxDhwBfLHlYmrk8LVR4jAaTJRPJQaYHSVeDCSaad5lLMmb8+iu/?=
 =?us-ascii?Q?frgJye5kebfu11bT/xLk09wId4HsMs8lX7LQDzexfxI1DlTmSqmp0b8hD78k?=
 =?us-ascii?Q?6iWzhYi7/UPisbFgPdDKSkZXAHjwQ5kJqsrejM3jkXLPGe5SS2Ix84URmPPp?=
 =?us-ascii?Q?7yihUSafX3JbPP+WR5hOqECfoeGczPCFp/fLV3EliukK+6makIgsCUQQOPS/?=
 =?us-ascii?Q?mIXjrYZvvReULeKk2Se0gTvM4xwGv9bz6TIKQaue+V5UqVIDcCqWOkec5XUJ?=
 =?us-ascii?Q?Mfe0xmQcD9+h4IEqKOGnTnK5wsZXC5S8H6zIEy+KrfX7feQRdKOBlXTDVBv8?=
 =?us-ascii?Q?r5DufqrJ0SJ3jyM50bdtkCajK1FopkGbFhaW0txdFfDMlUdpX859x8dnslrF?=
 =?us-ascii?Q?p4koWtSS9LlfUsJ3wFvYWv+NBjQvKd8QzOTmUvdhCftgNegngP/yF/yVDH46?=
 =?us-ascii?Q?Y6rIrNxpLUH9W8rr+MuuRvKgs9y50N9fT1i4v36vnr6a30GbIsE/ywTOYAnY?=
 =?us-ascii?Q?3eBAxesSxOkj+wRbnGeDbe2Yx64RuwBvqq9/CBMQsrnvkPcAhbpbnLgpLR24?=
 =?us-ascii?Q?zs8KSVPSmoqB9et7OvBT+rGPG2IVnz2/Qt6CnzGc9bnwWIYQFluBcS/0YB+5?=
 =?us-ascii?Q?TisCyAviOBdYaY5I/1yFNMnFajd3mTOx6OEf+XyciwvVfCYi5X2nsK4i6nVl?=
 =?us-ascii?Q?xkSypsoT/fECNdXch+aUHLbKAVcN6k3CcACbJPvDIJdSF2pWCem/MCIMdwny?=
 =?us-ascii?Q?M9paJDDTR0HU/p5EZwx0qWgiBjXtS42EOpmk40cB3ZhEbgFVQWQkp/igMuV2?=
 =?us-ascii?Q?FLHlAXCSLCGAUrNICFEjAop3FVyWL3MaK5PTrlVfb6defTbju6NMmQWc5GOs?=
 =?us-ascii?Q?DQ=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae6d7c2a-e2c0-47a5-d6e9-08dab3bd4562
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 23:37:52.2205
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: suPU0mrIeQlNi4o8XOH+vqkIVR0LnuFSrL/ki00oyhaV6AZWnblxCDZ9Uey84APvqsU6oETXfMwRRbSfqgkIKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0301MB6656
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 23:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172054

In preparation for the next commit, split off several

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

 meta/classes-recipe/kernel-fitimage.bbclass | 25 +++++++++++++++++++++
 meta/classes-recipe/uboot-config.bbclass    |  3 +++
 meta/classes-recipe/uboot-sign.bbclass      | 19 ++++------------
 3 files changed, 32 insertions(+), 15 deletions(-)

diff --git a/meta/classes-recipe/kernel-fitimage.bbclass b/meta/classes-rec=
ipe/kernel-fitimage.bbclass
index 8ddebf8dd8..e4a130a0f2 100644
--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -65,6 +65,31 @@ python __anonymous () {
 # Description string
 FIT_DESC ?=3D "Kernel fitImage for ${DISTRO_NAME}/${PV}/${MACHINE}"
=20
+# Kernel fitImage Hash Algo
+FIT_HASH_ALG ?=3D "sha256"
+
+# Kernel fitImage Signature Algo
+FIT_SIGN_ALG ?=3D "rsa2048"
+
+# Kernel / U-Boot fitImage Padding Algo
+FIT_PAD_ALG ?=3D "pkcs-1.5"
+
+# Generate keys for signing Kernel fitImage
+FIT_GENERATE_KEYS ?=3D "0"
+
+# Size of private keys in number of bits
+FIT_SIGN_NUMBITS ?=3D "2048"
+
+# args to openssl genrsa (Default is just the public exponent)
+FIT_KEY_GENRSA_ARGS ?=3D "-F4"
+
+# args to openssl req (Default is -batch for non interactive mode and
+# -new for new certificate)
+FIT_KEY_REQ_ARGS ?=3D "-batch -new"
+
+# Standard format for public key certificate
+FIT_KEY_SIGN_PKCS ?=3D "-x509"
+
 # Sign individual images as well
 FIT_SIGN_INDIVIDUAL ?=3D "0"
=20
diff --git a/meta/classes-recipe/uboot-config.bbclass b/meta/classes-recipe=
/uboot-config.bbclass
index 7ab006a20d..73dc464444 100644
--- a/meta/classes-recipe/uboot-config.bbclass
+++ b/meta/classes-recipe/uboot-config.bbclass
@@ -80,6 +80,9 @@ SPL_MKIMAGE_DTCOPTS ??=3D ""
 UBOOT_MKIMAGE ?=3D "uboot-mkimage"
 UBOOT_MKIMAGE_SIGN ?=3D "${UBOOT_MKIMAGE}"
=20
+# Signature activation - this requires KERNEL_IMAGETYPE =3D "fitImage"
+UBOOT_SIGN_ENABLE ?=3D "0"
+
 # Arguments passed to mkimage for signing
 UBOOT_MKIMAGE_SIGN_ARGS ?=3D ""
 SPL_MKIMAGE_SIGN_ARGS ?=3D ""
diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/u=
boot-sign.bbclass
index 85e23b963f..569907fa68 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -43,8 +43,7 @@ inherit uboot-config
 # Enable use of a U-Boot fitImage
 UBOOT_FITIMAGE_ENABLE ?=3D "0"
=20
-# Signature activation - these require their respective fitImages
-UBOOT_SIGN_ENABLE ?=3D "0"
+# Signature activation - this requires UBOOT_FITIMAGE_ENABLE =3D "1"
 SPL_SIGN_ENABLE ?=3D "0"
=20
 # Default value for deployment filenames.
@@ -71,36 +70,26 @@ SPL_NODTB_SYMLINK ?=3D "u-boot-spl-nodtb-${MACHINE}.bin=
"
 # U-Boot fitImage description
 UBOOT_FIT_DESC ?=3D "U-Boot fitImage for ${DISTRO_NAME}/${PV}/${MACHINE}"
=20
-# Kernel / U-Boot fitImage Hash Algo
-FIT_HASH_ALG ?=3D "sha256"
+# U-Boot fitImage Hash Algo
 UBOOT_FIT_HASH_ALG ?=3D "sha256"
=20
-# Kernel / U-Boot fitImage Signature Algo
-FIT_SIGN_ALG ?=3D "rsa2048"
+# U-Boot fitImage Signature Algo
 UBOOT_FIT_SIGN_ALG ?=3D "rsa2048"
=20
-# Kernel / U-Boot fitImage Padding Algo
-FIT_PAD_ALG ?=3D "pkcs-1.5"
-
-# Generate keys for signing Kernel / U-Boot fitImage
-FIT_GENERATE_KEYS ?=3D "0"
+# Generate keys for signing U-Boot fitImage
 UBOOT_FIT_GENERATE_KEYS ?=3D "0"
=20
 # Size of private keys in number of bits
-FIT_SIGN_NUMBITS ?=3D "2048"
 UBOOT_FIT_SIGN_NUMBITS ?=3D "2048"
=20
 # args to openssl genrsa (Default is just the public exponent)
-FIT_KEY_GENRSA_ARGS ?=3D "-F4"
 UBOOT_FIT_KEY_GENRSA_ARGS ?=3D "-F4"
=20
 # args to openssl req (Default is -batch for non interactive mode and
 # -new for new certificate)
-FIT_KEY_REQ_ARGS ?=3D "-batch -new"
 UBOOT_FIT_KEY_REQ_ARGS ?=3D "-batch -new"
=20
 # Standard format for public key certificate
-FIT_KEY_SIGN_PKCS ?=3D "-x509"
 UBOOT_FIT_KEY_SIGN_PKCS ?=3D "-x509"
=20
 # Functions on this bbclass can apply to either U-boot or Kernel,
--=20
2.35.1.1320.gc452695387.dirty


