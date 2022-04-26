Return-Path: <sean.anderson@seco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D1EDC433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 18:54:56 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.43])
 by mx.groups.io with SMTP id smtpd.web12.1407.1650999283880038709
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Apr 2022 11:54:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@seco.com
 header.s=selector1 header.b=s0BxgZoB;
 spf=pass (domain: seco.com, ip: 40.107.21.43,
 mailfrom: sean.anderson@seco.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZUf4JROl7BFC3TTUruO/0pmj07o59VzzxrgKhBIvquuDx6pmfNQguA5GrRwChet9fimVw/4xEwJpVVK1/KDJ0EHu8Rp9f9DT2X90jl2H1t8Yy/ueDhZ4kZmSycVHubkgdSuNOCs9RXR+cy3CsLvzOuTjteaLj/OXpjJ5/XwbxKMcEhpFhdrnygAM8aSGw2k3li3yVvDpksW6UyuEdTdufz/x4F+pdWC+KHz6wHnFiLb13Sp9ggElCGAI9ybYortAE5MLw7YEHnYLA8ioA6jepqviGNzCzoQsZrJpeF2e8RP6rgTSsPdgOGsPILP/r4VZeBOQhKpZi3JU6TKRFHC/zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgiLNzb/oq/cRVS1sBiXKTqVaG3AfEH1EB3c0h5SHgY=;
 b=C9/c7sNYl8/wPKbKLuDEwl27s4vxe9joKy1AvwIvfQBZjUK+zmSCHRzyLk8S62SJjXSN5Wag0BQFgG7iH5TNNYimaNjvgfqm966v3fSLu5IdqlGl+kAZuuuBXuX8STc2mABXhZLEiB9w9xXH5neUXfuDTcmGQ2vOY5/lMUJKgwhoncaC/+aUGGN0E9oibiW+wuwAzHRSnArCLT/UO6cA5GqANbSbaT7bFy1LCT9XMkMGoy0oTVhiJHBOW912G7DtGgrByjQUESFV0NFx7VSHPJ0sfYvB94k3woXsNQlmdZXjVMgWpPwJQyRpLrLybtODn2X+grSl8zcxt+ni5NBF/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YgiLNzb/oq/cRVS1sBiXKTqVaG3AfEH1EB3c0h5SHgY=;
 b=s0BxgZoB5mxKZsXLGlFMM4Hv7D7hp+D8QhU3vESxaY6Lll63JK7MA4mr2q18zmgrVTw2r9Q/0qSfFEXZfYr2I7Q6DKofJpCV2+xX05oDM+Gzr6+KzdkcvBKMKOwCiw1Fx4GWXTF68hOGemdKopa1wt+U1ILve1iTkFoBBAxroRQD5EsgF3gcacvZuAFhXQ+zySma4CwzYswdseQyDQ718+qwqOqvU5LdW7Lorun8adMjSXGW0MRDeb0vv6z4vegpSYHBVjcAdEHbNT3mBEoc4F/sOVMmp/jboGtjAusOp1U0OpYSfJ6jnX1c1+TLQZVlQ7v6lIHSMuE2Hsm/+nJDYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by VE1PR03MB6030.eurprd03.prod.outlook.com (2603:10a6:803:105::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 18:54:38 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::714d:2b6:a995:51bd]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::714d:2b6:a995:51bd%4]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 18:54:38 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: openembedded-core@lists.openembedded.org
CC: Richard Weinberger <richard@nod.at>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Anuj Mittal <anuj.mittal@intel.com>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH] wic: Add dependencies for erofs-utils
Date: Tue, 26 Apr 2022 14:54:22 -0400
Message-ID: <20220426185422.3225421-1-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0015.namprd02.prod.outlook.com
 (2603:10b6:207:3c::28) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c50e934-e1a8-4380-c6e2-08da27b636b0
X-MS-TrafficTypeDiagnostic: VE1PR03MB6030:EE_
X-Microsoft-Antispam-PRVS: 
	<VE1PR03MB6030E70950A60456946225DB96FB9@VE1PR03MB6030.eurprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2N/YGkQKCeYJjBM59PC8JiYntlhD7i8NpfRrtoPs3JJCIJrfwPB7HCZ6V/np7qxCqyz3Sac0IFS4fFULqKlkODoTFCqPj5Vh1KlZWluhgRS80oqquiEDf/Z0vEJ0pHomCQ+HvLcZvb7NSEzjAig6oVMnToe8ZyAWlRkkJvLiV8HKYzIvVNI0b5FiPWUJ0g/X/tpmYYvW7OaP02+ZRMgkhBRRXxJDUaqcjZWYcyRjBqWpKiEDv8acXGfXHSiWiObmOj5fmQEs80BCk90jryK1em7L5HJzNLLCfqE8tYKsmTlRST7cpzCLa30DVIQVczB6s95zIWOMz+gSc9nTR5IOkYllRzSzqv1H/vP8Q9cR/HS1+xr4s1dtmDjQR4dSfVWxthMr/9+iqDXOH9ur3r9WmUlOYYGdA/YONtF4TcVcmutcbDbLUd1/z2+eKoNqfJa2q64Z9y2ek0MVHG1r47+FXecSp884CLL3efiZ47Ug2gg2mYsmWucbJZrdMZJZWNuhVDRr4qq33p7jtIYrPY6oPJKYPv0M4dpZWjmP5lBLCRyYYmcU0TYHVBJ4uz48lo/hZXHW7TxWgRozecUtrMBg7sVkUlY6qPGcTVoS00t92ugDLQe75n/qkSHFUkGUO+weHUKYq/FiIck5seDlydBxc2ji5DnBXBI8WcR91QvfhlYs2ldBwREInbtdQ2Hz7/NcXTSEzP9CJXEY5fDBsNSaYw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(508600001)(316002)(36756003)(8936002)(8676002)(1076003)(6916009)(66476007)(107886003)(54906003)(186003)(5660300002)(6512007)(86362001)(66556008)(38350700002)(38100700002)(4326008)(2616005)(6486002)(2906002)(83380400001)(6506007)(26005)(44832011)(6666004)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1DuAEpfRAfct7DKFpL38ODMGg+AtbK/26QmZIzEhIUfNTkQ3cX3lTphwmWqC?=
 =?us-ascii?Q?MmecUfL4L7AcbYuka9Ss0jFGk9CueMNjDUYqjMeGR66LJGdAnD2xf180JJGj?=
 =?us-ascii?Q?XGNOio4rxgP0sTXjlDOtWuqiMfH1D1gIMu42Ub9QQA+/z6MJ4l30Hg4ty25w?=
 =?us-ascii?Q?fCxi/ZbN4SXXPb/MiSk9ZAVkXNSjMJhcxGl03j5kOdP44ix4QqapqHXVku4S?=
 =?us-ascii?Q?2bflm4n7TnJmvUrLYfc0nwAypSRmEHqEOZ7gCFLuXmtI+AurLqWrI5uqCx2x?=
 =?us-ascii?Q?xON1pkWe0e6G/bDtNbzxgoJdToIAjsT/KK0wgMVi7cbW4AKBqDhConmFB+MN?=
 =?us-ascii?Q?EUArRawwFnWnFz732ih1dkXIlk4r8sgJ+o+LyVv8KrtaSkuafk8ZRGo5AI5Y?=
 =?us-ascii?Q?+8fn3Zewj38gzkhPZ/D2u80zgEg/sqqJdxugMQm1qAD0j7bjG61FCo0TcpZf?=
 =?us-ascii?Q?/M3/zCWKUBesDmqbxXsgkpUpd4DyEqvcVRHlRGhyRb5Q/bxvNL6m1koXhEHG?=
 =?us-ascii?Q?eATjUNTsclZ45qM/6gqyxE+POG3RbCz/wFCv6Z8tG6EhOpMPmcFdw3N/93qP?=
 =?us-ascii?Q?KYT7poKGsA5FVoVMAGcYV3lNfZf4HiFp7sLjXnKKYhajziCfmcHnzo3YELA6?=
 =?us-ascii?Q?cozCfRzEd7NwDbrFqTMM8gyguhfPN9gU8LmmoC89MAaFHD9D+4zaAH90bWhd?=
 =?us-ascii?Q?RJjpdBEl24xzerLkMNKef5WvZC79AA84VJX2SM3kbcbSimTg7aQAwmG/sKXX?=
 =?us-ascii?Q?LAVEK1wn2DwMxC261m4l4H7hzgOwHJ21bEu2Uf3t99Hhhw8EBd1Awl3xuYAb?=
 =?us-ascii?Q?z2aJckIMIU0dN4FDOG2mWbFLtZBXeFHEfPxmlDwG/i7AJDQ2FVeNyRtxkQ3T?=
 =?us-ascii?Q?tZe0KdWz+s2P2mxZW7OJEOZOnzh89444/S7kUXhv1GbjmMS20nPOIDIiuMGH?=
 =?us-ascii?Q?wUnxKrhrgr7k8MMZY/lqsTVjFIO51KzMiBFS3IViU9PDabLG+jglgtlTslYF?=
 =?us-ascii?Q?d4Pw4VktX3XC4NNDpNelqEK8k/T6zaGje4GfFt+WnEXccX8NndpS88DrEL/0?=
 =?us-ascii?Q?DjfgZW4XKwceUMnt5siuZ6MIWgGlC49SsE2AzVoWXuU22oLxDKCTFw6Bnj8q?=
 =?us-ascii?Q?i04jZ3fTGLX/jYWV9sJsxaIDHt8iZQoJDlbP67BFOC5ATSKAeRzNXhPsKcPx?=
 =?us-ascii?Q?nPDR/C5GmZeQrWScy58edQkXJn3+EH2moZoZbtC9nBRRUZA5xizjbZ/7CkAM?=
 =?us-ascii?Q?Fioq/VuzRRgSV/iymYEeJnpzU0qOkO52bCf2Z3EgrKxKsvD+7ZR9jk+G4Mxf?=
 =?us-ascii?Q?Ps2/QLYQjiZ0UUT3m3OvGr3tqCNAkYf5qavquV/Gk1cAmjbZepWtQzpSkIqv?=
 =?us-ascii?Q?sIQd+3wXi6d/Ko29BOWhtdfpxsmYPUtafp7322MoCvCjVi/0MAs7tE2vowVj?=
 =?us-ascii?Q?ecWeQSSFky72V5YBxR8B/g8VOuVRqI2mugidi0+Vek2JE+UOSRf2V1jCnxvj?=
 =?us-ascii?Q?bobR/YIVsm+8Wy+Hgifor4e1ygIrugNanV3NRWQL4y4mAyKSIueSVwinUy3O?=
 =?us-ascii?Q?Erm1CIMkLNplbnNgGMDdVvzJyuhsC/TCOF8LRn0hDDNQ4FPxDssXaZRpcdqm?=
 =?us-ascii?Q?kE5vdpVB2EIETd2oleSjmREolsO/DSvFcMrUGR5vlawRGSucgnc03egal/qA?=
 =?us-ascii?Q?Sb2uSbDEvPRPc/hPBiXAyLX9isf9VDtJrRGWrYLgcGlJ2Cw/w1Cmc5hv7bWT?=
 =?us-ascii?Q?QwBk7OPaEMRML0FrNTGPn/9Ij2GTdW0=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2c50e934-e1a8-4380-c6e2-08da27b636b0
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 18:54:38.2213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 RdtrF9BxrTmk+rwZZbjSvijPthRMtDjYI9qb8v6MjUgFLhx31rUYBB+1mc5CAo0NjwbnsdN4nmlGF8vgYxewUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR03MB6030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Apr 2022 18:54:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164880

In order to build erofs filesystems, wic must have the erofs-utils
package installed into its sysroot.

Fixes: 30375ce97 ("Add support for erofs filesystems")
Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

 meta/classes/image_types_wic.bbclass | 2 +-
 meta/recipes-core/meta/wic-tools.bb  | 2 +-
 scripts/lib/wic/misc.py              | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_type=
s_wic.bbclass
index e3863c88a9..79f8d93b94 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -83,7 +83,7 @@ do_image_wic[recrdeptask] +=3D "do_deploy"
 do_image_wic[deptask] +=3D "do_image_complete"
=20
 WKS_FILE_DEPENDS_DEFAULT =3D '${@bb.utils.contains_any("BUILD_ARCH", [ 'x8=
6_64', 'i686' ], "syslinux-native", "",d)}'
-WKS_FILE_DEPENDS_DEFAULT +=3D "bmap-tools-native cdrtools-native btrfs-too=
ls-native squashfs-tools-native e2fsprogs-native"
+WKS_FILE_DEPENDS_DEFAULT +=3D "bmap-tools-native cdrtools-native btrfs-too=
ls-native squashfs-tools-native e2fsprogs-native erofs-utils-native"
 WKS_FILE_DEPENDS_BOOTLOADERS =3D ""
 WKS_FILE_DEPENDS_BOOTLOADERS:x86 =3D "syslinux grub-efi systemd-boot os-re=
lease"
 WKS_FILE_DEPENDS_BOOTLOADERS:x86-64 =3D "syslinux grub-efi systemd-boot os=
-release"
diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta/w=
ic-tools.bb
index ba0916cb56..b9580d7e33 100644
--- a/meta/recipes-core/meta/wic-tools.bb
+++ b/meta/recipes-core/meta/wic-tools.bb
@@ -6,7 +6,7 @@ DEPENDS =3D "\
            parted-native gptfdisk-native dosfstools-native \
            mtools-native bmap-tools-native grub-native cdrtools-native \
            btrfs-tools-native squashfs-tools-native pseudo-native \
-           e2fsprogs-native util-linux-native tar-native\
+           e2fsprogs-native util-linux-native tar-native erofs-utils-nativ=
e \
            "
 DEPENDS:append:x86 =3D " syslinux-native syslinux grub-efi systemd-boot"
 DEPENDS:append:x86-64 =3D " syslinux-native syslinux grub-efi systemd-boot=
"
diff --git a/scripts/lib/wic/misc.py b/scripts/lib/wic/misc.py
index 3e11822996..3bc165fd7d 100644
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
--=20
2.35.1.1320.gc452695387.dirty


