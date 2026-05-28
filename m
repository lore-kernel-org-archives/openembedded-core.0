Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D11ACD4F54
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 16:57:14 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.98])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15764.1779987423098973562
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 09:57:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=Va1LyuuO;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.130.98, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pfo1NF/yyP5l8+ZT+2m7kOM+N/i0MjHj9ga95uN6f0w7ZkNCN3dM6g/Bs5nclKVNwkVLngpOUTvlx7cIazqxQwwxoZDMbTd9ppssL7MAz/kuUq1753M7vTUWmWDRxaUJx7jeJ3GGDBGJE4JxFNacH7i5IH608kU8lWqF3W8mOKrf0GkOZyG4JDwmwtpk/5Ue1P05hPQxnuFojISKP7AAz401VhveDcgQY5LRDfbOaeDcHHpcuDpKMHdCuvqKv9m8khedx9rL+ROCuwqkEkOIioYyF9eP/a11zyZO/tb3epdYFiorQAsS8+oJ5JPilvsgLe7Sx/8og5gfMC9D3rom5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tFAq/mdEiZIMPd5ANLrSTuFyOItPODUeBnuURLAx+j0=;
 b=i4SVj30D0X1vafmkd95Lha0lymSd0+teSNP0orMKPDFDBid8L/3Pfx+t3MqJXDVpR6Z5sF7kZXCmglqejEsSQxTOO0s/kXYOiHE73SSxo3wZWxubRqGGFQIR9mvsX9l6fBNmaMaArNQi+KHc758pseeOFImil6YEjFccdJzUGTW9mFNxnYB8ldo/ch11Nm5pUiNQxi5DMIb2bOk19IBEAkWRs2gjWaWsNJUgOHvSwGnrH9xd45HuqPtl7T9asPTi5X6PSAjg+6mvLwFshAgssMNwcD7yhG9liTkBdEusSR4oaV5a0BFOyqVjc6N3OKt99lyPIGe64PMW0oIdMjm92g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tFAq/mdEiZIMPd5ANLrSTuFyOItPODUeBnuURLAx+j0=;
 b=Va1LyuuOLRXnpZSefLVmUDT024kc5ffQbWN2dJZFT3hJK/s2CP5djVcZNuRcA9zupqGUv2z7Sf8Zvzs3fOtlmcCAq4gMnSW4SS4HGECAkEMQrfwFonNcJvAGVpXUtGCCP9Eexj1XRGMKBq6bTda3BdD36DTfPfzM9aVCcFhDihvzhYzOLQOj59Z37TnQG/fN2C3i1GKr8fgUOoolie1aUOl5kmocVgatkrCsGCebjzMKcDq2PcsjdBHDi6jjbAwHw98xLK9rCfsfjbSlrf0PlK/APLwMg8MZxlXx9k6S/2nYMbn0vBXXg26pUAWbv84sMX5JvwMakjZTOU4u8oyuDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com (2603:10a6:20b:337::17)
 by PA2PR06MB9712.eurprd06.prod.outlook.com (2603:10a6:102:414::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 16:56:58 +0000
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16]) by AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16%4]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 16:56:58 +0000
From: niko.mauno@vaisala.com
To: openembedded-core@lists.openembedded.org
CC: richard.purdie@linuxfoundation.org,
	ross.burton@arm.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH v2 2/2] sbom-cve-check: Fix breakage with empty IMAGE_LINK_NAME
Date: Thu, 28 May 2026 19:55:57 +0300
Message-ID: <20260528165557.19677-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260528165557.19677-1-niko.mauno@vaisala.com>
References: <20260528165557.19677-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00023948.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::345) To AS8PR06MB7557.eurprd06.prod.outlook.com
 (2603:10a6:20b:337::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR06MB7557:EE_|PA2PR06MB9712:EE_
X-MS-Office365-Filtering-Correlation-Id: 130d5869-f43b-4ff7-47e3-08debcda2180
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|18002099003|3023799007|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	vqC8taook6KF7wWWUAzcCMzVJtOzn0N8UcQVSo7txv+lCWEEImjD1SWcX3dq2Jpf4WansP6yfX++wh5QYZekAoy7ebcfT7lLpe6TOIYQVH8pjM9mJvJgq2PE2AfeoQZExII9kSxVXx9cMrDrdqGkXuW2EnyL/FdLHuUFd3SDhLYZ36Bx7B+nuJ4850nCZ8QBuSti3zTaETVdBpE1pxq8Tmhg+iQkxYbJ23y6Pqs1guuN4YaML0TYVewUZI4AzTP4wGQvYbYz/PVZUMEwTlg7Sx9fjDlacG19exS5pbLVvC27qovCNZRudJNWvDejeyR94lQKsOOUYN/Y7wpB1hkd/pVJw1bufsGoD977OK/xgIeTaNjmmS6HVHZTiVBFGzRcN6OXHMem8eY+Zuz7z/S43lUGw82ubVeZQLauhzoib+ZK1GjbzVZtbcUQZJi8A+Obi4AJ01l5lDTeFQYraVzQRmFi9jdaPuSJX9qoXUMyvFAuiPOqRVBWKgoOYPxfbEeHDG19BeJiSk5LBFkA6clNkCJLATS65ONyQii/ewkeOwCFkQ4zgYgLJUxMmyE+7mfkf+RFBnDWTVwIECEd2wNd4jE9sT5Jp+yPz81jmpqlZmXdA0TjX3L5QUYuJ5q1TrYvkmlFo5x0IGv98Q8Fnza7OX/froOAXUEm8AfkyN+lvrojqkeUP6H36fjfKtxU9yvTrCssEvlTKV4H2INHF28oZHBVgFg7XjhE5wX+y+9WYoa/mTUzhWUH3y+xdSPfuUMN
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR06MB7557.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(18002099003)(3023799007)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LElVhOu3x7RvJO0yCkDBr3fXWN2B+OhNALd609dn+xwCRzCVg31l45e1OSEq?=
 =?us-ascii?Q?y2WB/3ZTCowupacINQBWKS4B4P9IU08w7Ip/ttkKdRoPs08ug6jN26dNdp7q?=
 =?us-ascii?Q?RAPoE+Wc2bhKjfjwVWY0QqmZl2icqNE62iMHWJ6uEVvXxe3ofdzgMvsqUqej?=
 =?us-ascii?Q?KpMZjc/HyF+SZfiRPRK6xVqTMDqJvUzUYqcVQsu7B4Is5ldVnAVp6MseMMDv?=
 =?us-ascii?Q?/Rzu5oIYSndxH1DJaSwPEwQEydsVjmsfAr2zdCwtKkxbCnDS+So/9cusZNmO?=
 =?us-ascii?Q?NDEiX0z2rJp8Sa7CsaeXfhbO+Y4yeqV7enuUPS9fyDuJoz4DmzyA3L7ULyQD?=
 =?us-ascii?Q?Tmh9t5dyetNPrJlnGJ8C9ooj3O7LOWKuvNqxtcyTAtyTsZK9RAwkZrzB4Dya?=
 =?us-ascii?Q?5/jOP5USGy5UEh8cA1j98+TVf1FphoJAXEKi55KiW7ohz+IDHeYmAf/KnkrT?=
 =?us-ascii?Q?FEJNX4u35eCIPqyBApletKM7GyAWHH88dM7WbgtuI2YWUUw7ZPfIRolwDm5i?=
 =?us-ascii?Q?lKmiKjGyBj0GUZQnlq3jJjinf6U0a+jztoFQryH5hH/lBAkpS8LZUjwud6tG?=
 =?us-ascii?Q?fprkGDS2CvpkznCmO9zSbKru6tiSpidzQPNtE/X7KM5WZZkzO1myMuGXJnU4?=
 =?us-ascii?Q?9iX61CqsNp83S1KpIW4jUij8jKb/n7xAZ0pQQ6TXLS18kUg1k5dw9o4vviN9?=
 =?us-ascii?Q?EvPQHTmksHXZFMfWBPsAtDzhH0X9MdRhRZCp/hzBx3Qe4EWBgnIMzgOjl1Jy?=
 =?us-ascii?Q?AqNWm2abbzZkvvLx3wVJuc13XCnydEfqqE0BD5IJKK6ll7S+01axvOPKjp+j?=
 =?us-ascii?Q?axTn1876Z5olqxwUQi7l99trP/j3BBtxmbCxvnaicQzf6L3r9wJFKXvOmfZ2?=
 =?us-ascii?Q?0byeYeo8d/PuOqq1XdcNm6HPOcVqweDuSOzTHX0KPxDh3sPAvpMJxTvRX9dR?=
 =?us-ascii?Q?1VXYwBos51B5s20jH+C8pdslqL9gtUYWN+xl+J/3/yKIaShxpriUZ2hPx8G+?=
 =?us-ascii?Q?ArbhNV40d2QOibGArHYhNhl7JkRhHO0JVcCUvMl1k/Z11tMEq5/NUmjvXkZT?=
 =?us-ascii?Q?cs4blYK4FIzYzsKz79fLbuL53lxmwUfzGKnjIRFjIbnnqKliVld/GIgRoNaa?=
 =?us-ascii?Q?VMPrV9bCoX6hAioUR1J0f4KNz/HKhOoEfld7bQ4QWjTz4cXeqf4hRJAB/C/h?=
 =?us-ascii?Q?FFHPha7cmsqjMJtuQu33hzJuefMcSRxe620CtWCPH++Ajo+NDCiIhFJMHZ7t?=
 =?us-ascii?Q?SL9JeRoS0Cbmjl7ohjHfGccmP5hrHSoJKYCebYh8UUAM5O2KUaxd/+7Itr7N?=
 =?us-ascii?Q?plXVdaOTBe5/34wm6AyP6CLGov5Q4yTUrx7r6UO2XdVjAmTsBTRIU32zH6ph?=
 =?us-ascii?Q?XwmsrTFaF+vub/DxAdeJnW5zL/H2M2YDk+/l3HEnmciDgG2Wr+iL0abtmRNd?=
 =?us-ascii?Q?rN+CDA0irEbiLv51Euqfz9SYpCABAd/iLz6qJv3Yptfvh9wXvw+SLLI1+/VW?=
 =?us-ascii?Q?NIycunE2M3ZT85Kb+v0wCM/DOhO++vbZy3u5SsYYHHqcpxwZc2ND1J55xf8v?=
 =?us-ascii?Q?ITDl3JSNn481rMTuL8RqVORYDNCs8VI0II6r27ccbCG+tHQawLFOmwyUkhxu?=
 =?us-ascii?Q?nXtlBaamW35933cOBtCjJyv9FvZMaU/QNdxOwQA7J4k7buhNgJatwqpNxS3/?=
 =?us-ascii?Q?zEPu5QDDezvJe/sLPlCWjo7768It38oUvNQ6PYHG8Y2CyGyY2rznFu0Ki5fz?=
 =?us-ascii?Q?1gWkmV5bkw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 130d5869-f43b-4ff7-47e3-08debcda2180
X-MS-Exchange-CrossTenant-AuthSource: AS8PR06MB7557.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 16:56:58.6344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KE3vsWF7lhGbbJNjVNKrHmuDndNmi/lQ3JmvkeoKBRdpKORHtgP4gi5jxLNraNdint0FI1ZWIX+5kP5ZKqCpew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR06MB9712
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 16:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237716

From: Niko Mauno <niko.mauno@vaisala.com>

Avoid following build breakage:

  sbom-cve-check: error: [Errno 2] No such file or directory: '/build/layer=
s/openembedded-core/build/tmp/deploy/images/qemuarm/.spdx.json'

when IMAGE_LINK_NAME is set as empty string, by changing the reference
to IMAGE_NAME instead.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/classes-recipe/sbom-cve-check.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/sbom-cve-check.bbclass b/meta/classes-reci=
pe/sbom-cve-check.bbclass
index fe145a2212..451595f1d7 100644
--- a/meta/classes-recipe/sbom-cve-check.bbclass
+++ b/meta/classes-recipe/sbom-cve-check.bbclass
@@ -14,7 +14,7 @@ python do_sbom_cve_check() {
     """
     Task: Run sbom-cve-check analysis on SBOM.
     """
-    sbom_path =3D d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.spdx.js=
on")
+    sbom_path =3D d.expand("${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.spdx.json")
     image_name =3D d.getVar("IMAGE_NAME")
     link_name =3D d.getVar("IMAGE_LINK_NAME")
     run_sbom_cve_check(d, sbom_path, image_name, link_name)
--=20
2.47.3


