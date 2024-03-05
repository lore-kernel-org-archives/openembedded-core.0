Return-Path: <christian.taedcke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E391C54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 08:46:13 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.104])
 by mx.groups.io with SMTP id smtpd.web10.17320.1709628363994576567
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Mar 2024 00:46:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=hIhtqKmy;
 spf=pass (domain: weidmueller.com, ip: 40.107.6.104, mailfrom: christian.taedcke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a+GO1m25xvKdtLYfHD36cIejDnGrTrhxZ/+Xd+NS7xhDT6I8h6yFfIc1DewHwRQPRsCw5Fho95ocYTMlfs0R62UG0oiATt468jM2pBjc8d9lsAz5kPpClCAeyk3qz5NK32M5wNW7ZW5k/FYkI4IfAy9/lK3s6rnX81+gfU9vUzf4TEmn9dc1YCzQGT7WbAPC10l4IH4QqloBJjTj1wcK5rux9NwFYYAL98+nOqZy4t8bvCThvz4da5f0oJzFIWb0guT5YDR1N1THwGPAP8IzlJHqpfYzjw6G1vGeFBdaISEHQKRrFJ2XQQHQYCK4/fails0sZiAhp8bVLcW5PQB5Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yyKRqmwVYHxMd6FYlgRRmxOLCll/pTSkl/ntsmH9Wh4=;
 b=I949qJyiZa8CYuxwR50j7o/tjYoRcXhdJYX+olJ4LsTRcW/g86kbkjAjd2rebJdzrUJRCrhvkXY1fALOIo24oaOCg3kzXysF7WnpiXuR+9yg3kthPbD9V84gA5AQv+nY560utBDPcus0Ms1tqKC342VQWW7kz+5fXKQsxJfjuO2tbfghrkirAMQwhl0JNsUgCq2WElaXO7OZJeIrZ89WRWG2m8BYfk3IVhZtxX/Zq1N418dHgbarpTFZ5i9AJ5KeYiBElrb3x2Y1TM8OaozckvHRwawoupl0n2At35N1WE2mf10SB8094Bc3dCr1U43FPDRwBQkiCeZlfFTyZvqWAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yyKRqmwVYHxMd6FYlgRRmxOLCll/pTSkl/ntsmH9Wh4=;
 b=hIhtqKmy0xKujWLviieJR9CoB6pCXrVyhRsbhfyHbfIEe6Ah0XGkpaIUMQ80Tzay37LrI48bN2bE13wFRFeKBNJxcbkQmeZ5YwpjLOrBM0y7XOQkXanJvywBR2o5SUz9iv0xkhXJ1nrt/W+8202NrgzndG9qED5A3zfpRhK3dCE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB9199.eurprd08.prod.outlook.com (2603:10a6:20b:578::22)
 by PA4PR08MB6143.eurprd08.prod.outlook.com (2603:10a6:102:ed::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Tue, 5 Mar
 2024 08:46:00 +0000
Received: from AS2PR08MB9199.eurprd08.prod.outlook.com
 ([fe80::f092:6b68:ac4e:ff7f]) by AS2PR08MB9199.eurprd08.prod.outlook.com
 ([fe80::f092:6b68:ac4e:ff7f%7]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 08:46:00 +0000
From: christian.taedcke-oss@weidmueller.com
To: openembedded-core@lists.openembedded.org
CC: Christian Taedcke <christian.taedcke@weidmueller.com>
Subject: [OE-core] image_types.bbclass: fix vfat image names
Date: Tue,  5 Mar 2024 09:45:40 +0100
Message-ID: <20240305084540.12235-1-christian.taedcke-oss@weidmueller.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::10) To AS2PR08MB9199.eurprd08.prod.outlook.com
 (2603:10a6:20b:578::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB9199:EE_|PA4PR08MB6143:EE_
X-MS-Office365-Filtering-Correlation-Id: a8d1b5b3-fb73-4d2d-8091-08dc3cf0aeef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BjFCvSdJrDzAXxPsJ6a4uwLLk+veApXDQjTydKnrYckyT4HYIOfrA8nTEh27o9uOXFG6TId76KGH6QJCTpJTm1o/PKVWTylIy1i9m4+Ku4XngyCujL4GDMkztJOr4MSEOlIOnwi2c6sua+pk1ARt5UtGc8hFe5gs0wbr38PkTxW/A76Ku2rVWJw3YqLCfbQRpCtIfp6Al7CnkonBei34A8ZA77C+muxuV57RJI58fPopYwFo2IPQNL66TkpfiKqVqdTFTVMhRb0eTs5rE3R73KT1bQAxqstCJAOSNKbNGBC8H/d0KVzZdUhhPNwbf7ejnypRo/zU82vaxKHGSmXc/efGj59oxHLSKyM/xNWP4ocekDVGNNbTi2WAZ3IpnE1FMzwRzrupvczwmKfHBMLldlqCuANfNkljKcc6gLhn1cSFAfC7MvjBOg1DL7nV1tRrRh/ZnZeMimklRBCzoumvyd8HawTcwtTLbgUwiHgGPGp972InLQsPnbn7gTLp695qJt/nfsR11CZ8jGGMjoOFfEzMCuATklKijRPyXsYLw7ubJHOGBiCrTO3Bweo7hStXylQkaeZIt8zYTGBPqIffXBeAMLYWclJprqHBgYtPGzFnaNRaQP5dJJsRgxJ4wrle51VBTcgN8aIVHAhpow5Ddh6ALyHakSBONHLl6eB0qMBgNeXbh4lOGUBfnvv4p+VD+FiUCEE/Ec774zqgnsIPFJB9N+LOTvWLKphRaOM09cs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB9199.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4TUyJPRHoLZPKtl8ui9veGLZ2vyOW/P8IuKKVSvMggBreCUUfRki9QL+5Cb0?=
 =?us-ascii?Q?yy2Bv3VX/xPz0RKmM6BN1EAZnFkV3/PcpSeSjScsUk6Cm/eEa5Uo2JrlPPwD?=
 =?us-ascii?Q?/aCfqr0FxrL7ZUaCDc/TnwtHmeHmwSh6o/LfAKsjhK8WYVyfrq/Qane1clCb?=
 =?us-ascii?Q?Ti8GCE/BaAOCa+4QbpTRyXIriMm5GL4dfdkqQSYI2VFR77VE33XWQxpj+PaO?=
 =?us-ascii?Q?wBTGuiTsQuOnOLN03ZIyfYe/kePXzgj9mVvzC5FAB6lXKDnXYazXTCTpb7SC?=
 =?us-ascii?Q?Ant3fGKqGRjXpN1cHPPjyp51JL25MxZ/gNu49N0wXzsWts4gws6Rv2lP7PNt?=
 =?us-ascii?Q?Zac2vD7Tj2Am8nC68ArShjvgJp6RaXXLOz2qQQMDvsOuInXwiEx634P5jcJj?=
 =?us-ascii?Q?w2WwsaUg8YN0JTcGRMpLC1OCIOWGQDrBsyD9acFz/hDDAj2zeav7Br6cs/Ji?=
 =?us-ascii?Q?yul4xLV5ytjNBZceWsIWE0UJCHD6jhIFaXmjeWCr7QwTSVk3TvHFN84IOG8o?=
 =?us-ascii?Q?TtId9GCK/iN2p3NFUs0EMHOjwJ+W4j9K4E7owg7BXFAJ1CCZWxl6rYQq0tCe?=
 =?us-ascii?Q?ZFAP1XdbhoE89kCAT6q6pZPSBh/dO6/z5TcdZEnW3DmvrbMF68lvqWf5TJk6?=
 =?us-ascii?Q?vh64abfHxsSRPyr6lP6BALpj+6dE7arIFG1jfTRrMmSFOJUvqKHaajFPuzp0?=
 =?us-ascii?Q?zaiAebRntmtW6FIgy4uAomBMv2PO+7tfLslNkIEl+oec1rQYpRqCQgv+P3va?=
 =?us-ascii?Q?GloljBc3N0Kba0ZZknusjIoJDLVTIbTBhFu7jKR0X2tZfm4d29QdW2XDHsfZ?=
 =?us-ascii?Q?7TN6aeuhRdS+lvTDNTJMeh03ljMmLhwiU7dhI6PiCXAF1v9VZAlftlUaYNfD?=
 =?us-ascii?Q?9EtbZQT0JLmS8U+6pXxoAzWGabKZl4Ft4+KxDN/RimS1hGCUvTWHPyI+GHpj?=
 =?us-ascii?Q?iWPGYGwZYTuC/NQGlFVrvhvu8Cp5fxCntbLeMCZVOz1if6p1RN8ne4Qwhs7y?=
 =?us-ascii?Q?xuvxwnOWeibHw/7zgtzhTnAhYC2qSwqfW7FnF/S2IdvxbltKBAjYvAQuCMGi?=
 =?us-ascii?Q?0sEfqBSRCoz8IVfOzowuTJnTjYoGaa1OYrIlTuvMR1ZKLsYgOgY4vnWwg10j?=
 =?us-ascii?Q?mN/ynFrAO0dOlVrAadVKN19Co94HnXekW8OMAHPFIlye3X1AhU6KCmSVN/rK?=
 =?us-ascii?Q?IPbTQJbDAt/CPWmmxet7qu8hBS855DSx+lGTTLRkf4LY+RCF/AxM9rkSu39r?=
 =?us-ascii?Q?Ettzb09iubDF8mN4R0vqmNGiytY+CpIrwQXNMwoYu3+F/kJBbjf/4kxgAxYt?=
 =?us-ascii?Q?SJzvIL7bmPDjQEs2wUq1G5/K0jY+wIQPJU8iUb3g3SHYkWUPd5GunCtg8iBb?=
 =?us-ascii?Q?K86+Ft5ZjgihANlbm0IwIW6Y5ZD4tn0+cRAOC1ir4uYUtBqKpxfQQ+WiVCC1?=
 =?us-ascii?Q?Gg+x/GXK+YDpaKXUM9KQIATMRBgeyFgEIHCnr8KRNEcBDjQB00TEYMxXAxMp?=
 =?us-ascii?Q?3Vsx3Y36WT/EUtCtbQaxJgnBzkCRt+sYMxXVUrQr53mIbfotWI5PAA/ii8or?=
 =?us-ascii?Q?RiOYzsKcSNFfPpztvfgKbrJ86KjYAUHhG8xJhrgFqyCjzmIGSimR2+GMvWAj?=
 =?us-ascii?Q?9e8pmucNiWGBVWK7IPFnXbiYmkSZRANXbxold9QeZmKt?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8d1b5b3-fb73-4d2d-8091-08dc3cf0aeef
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB9199.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2024 08:46:00.6000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s4Di9soV5U8u0NBxKIQ7dth2m/RjYXdPUr2YOr02QUVPx2aQbyQ243iSDeN2iUxS8/5mFJjhJcUoza60luFxQJOqzfb1cBQ8SBnhUwY1BKIojKXkIsVPDdRNMBv+wOpO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6143
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Mar 2024 08:46:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196627

From: Christian Taedcke <christian.taedcke@weidmueller.com>

Remove the appended ${IMAGE_NAME_SUFFIX}, since it is already included
in ${IMAGE_NAME}.

In commit 26d97acc7137 ("image-artifact-names: include
${IMAGE_NAME_SUFFIX} directly in both ${IMAGE_NAME} and
${IMAGE_LINK_NAME}") ${IMAGE_NAME_SUFFIX} was included into
${IMAGE_NAME}. In this commit all other filesystems in
image_types.bbclass were adapted.

Signed-off-by: Christian Taedcke <christian.taedcke@weidmueller.com>
---
 meta/classes-recipe/image_types.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/image_types.bbclass b/meta/classes-recipe/=
image_types.bbclass
index 3733bdfc20..1c3a88bd0f 100644
--- a/meta/classes-recipe/image_types.bbclass
+++ b/meta/classes-recipe/image_types.bbclass
@@ -133,8 +133,8 @@ IMAGE_CMD:erofs-lz4hc =3D "mkfs.erofs -zlz4hc ${EXTRA_I=
MAGECMD} ${IMGDEPLOYDIR}/${
 # can (e.g. device files, symlinks, etc.) and therefore it not suitable fo=
r all
 # use cases
 oe_mkvfatfs () {
-    mkfs.vfat $@ -C ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.vfat=
 ${ROOTFS_SIZE}
-    mcopy -i "${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.vfat" -vsm=
pQ ${IMAGE_ROOTFS}/* ::/
+    mkfs.vfat $@ -C ${IMGDEPLOYDIR}/${IMAGE_NAME}.vfat ${ROOTFS_SIZE}
+    mcopy -i "${IMGDEPLOYDIR}/${IMAGE_NAME}.vfat" -vsmpQ ${IMAGE_ROOTFS}/*=
 ::/
 }
=20
 IMAGE_CMD:vfat =3D "oe_mkvfatfs ${EXTRA_IMAGECMD}"
--=20
2.34.1


