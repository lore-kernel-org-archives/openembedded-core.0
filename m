Return-Path: <paul.barker@sancloud.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36B7FC433FE
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 10:52:18 +0000 (UTC)
Received: from GBR01-LO2-obe.outbound.protection.outlook.com
 (GBR01-LO2-obe.outbound.protection.outlook.com [40.107.10.132])
 by mx.groups.io with SMTP id smtpd.web11.4216.1664535133460486280
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 03:52:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@sancloud.onmicrosoft.com
 header.s=selector2-sancloud-onmicrosoft-com header.b=gCSDQLMY;
 spf=pass (domain: sancloud.com, ip: 40.107.10.132,
 mailfrom: paul.barker@sancloud.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gHZWL+1JyG/+4c1XkVFwDW04razWZSXxYqKZAXJme1cgpfFpIBIu3O9xVbpseUWTYau7IKmFHWyhC6EHV5OWsNFjupZ+nF/cInZMTxGTUq1TWFjDVp+JB02Rmz/b+Tkzx24IyTFzEWAZruS57oMhZTCNly6tGqg8s6bgRs+qf5sxMBRhXhJwCg5MAb2heVLDVy2K9abSAlX7+AA3aO9dBYB40HZWtbox7m8Prw5v3CuxM0bzwbSfXuihC3zS7IaM/L2GubOaXyHV+cDpw/EBaEyVp/gyC2SzdhLLKurExSdl9NyE6/TVNbD5Cry3w/svR8SRiL2Bb9uZcSMYMjl1/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o++t2n0Q8Lh37UvDLwYuFyd/RAm33oMqP/Ir50a5trs=;
 b=b8yLpjuKQwkcs7d3K2WbP7UlGKWjYrCTxiFvEDr+GSSnLPhAEUFcDttrGs8rb5bZEa86w5yKwGWOCyIiTI9/0dtHTUR+rA3o8YjFbqQ+s2m9SIYDdfGl+MnnvFu3zEQBj/3mjtSqFET/LBJEBi9Exh+dutK4bd6MpCSXvPi3lWmV96gC3Wve3lwPjwXNP1dL2rfuu/93TH+jNpU2Fp2TFrEyTkxvORVNt3PpqiK/HEi9MDIz9zoIwYg+G4ezyzXukx13s6wYfaZ4GYPUauSxNCSwqSknDpN4kf2Xb5tk2cVMIBrZ0R5mIc7FUi9A/tLhkVwBsh6RQsRC/Iz9v31/TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sancloud.onmicrosoft.com; s=selector2-sancloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o++t2n0Q8Lh37UvDLwYuFyd/RAm33oMqP/Ir50a5trs=;
 b=gCSDQLMYrDfCLoegKHg1dWpMOBC5AiSxlbg0JV9ywJkKA0r26ecrRrxhndBhtpVx7ZCLb8uRo2I/NuoVEQkz77AVTNfGaaoeSQOq9MsN4Z/Mzt05mZiWKFDucarkQibxNG7eJ5w2CbWY+cD7/9Ewic27b8BPqKFnG4MqX0Ua10Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sancloud.com;
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:61::19)
 by LO2P123MB7017.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:32e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.19; Fri, 30 Sep
 2022 10:52:10 +0000
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::11d5:40af:9060:6b08]) by CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::11d5:40af:9060:6b08%6]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 10:52:10 +0000
From: Paul Barker <paul.barker@sancloud.com>
To: openembedded-core@lists.openembedded.org,
	Steve Sakoman <steve@sakoman.com>
CC: Paul Barker <paul.barker@sancloud.com>
Subject: [dunfell PATCH] licenses: Handle newer SPDX license names
Date: Fri, 30 Sep 2022 11:52:02 +0100
Message-ID: <20220930105202.2485284-1-paul.barker@sancloud.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LNXP265CA0070.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::34) To CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:61::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB2241:EE_|LO2P123MB7017:EE_
X-MS-Office365-Filtering-Correlation-Id: fff045a9-5ca1-4e82-18ee-08daa2d1d31c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NxqJT6TKBBepHylRE4mj7ADMIMPJCmM3qyttyLYMr4uOAvf6f/5c3jo8yucCxBrBIApejTnDYjWsbd2sGq1Ep/9/4KOErR074AzgxmZ+vOsMuxLORYOC6rnPcxazAMZNSvA7FfJyXtbTZJmGWryuaomB4PEhCBAjy8B79kAfIb5gvEHLfJHiEPFbF1XPgRI9H6yqYsNaCkWzlRUKeYEbtpYG1i7Z930aFSK6z69mEbsa5t7sut5eUDx+/xW/LGTJRZgKC1InvBpDq5ccKNa7+m1IUO06ZC8bTiT+ZrdrbihkrZ7bn7qewc8NSo9B1FSDwXYvLaw3Q1P9lQ+CsTSx1gKX3ZVn6c3V4YsTd1wRb0/4bFbtS6osey1L4OaQfedA6X5yJDkfvcRVnFWjnqdUT2ec1WIy8cL0RzEXXl1uMKCDpQtU14i5rVgFZJElqC6iJndw9U6s5nDyiUl5ll9LsCGSlhfA0134tbFpsqmwxyAdaxz+P+7RPGp7PeKF+NMQIfCKSSOBWie76Pdxcte2IsZNEesAmLomAY5Vw+W5LDCo9H/b/iq/HkNcPs3B0Q+D0Ce83vjYKeHbGjYQ64kPEbqoPWoC49ZbDuVcA/laXZBwaxk0dp3nHMXl6zYmx/S1vPb2vD6c7hy+gadG4exWtReoaVNHHhRPYL0QlKPacErLyR1m1bCA5Y9qvy86nsLCDkmnh9SAmRfN5sbyUlMdgkioMrt5jwjtyQCDW1FAk21pLAAOX72QFC0hCocJ/0t4hvnQC0uJ11ofX3OU/1knaQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(39830400003)(366004)(376002)(136003)(396003)(346002)(451199015)(6506007)(86362001)(2906002)(1076003)(8936002)(44832011)(66556008)(6512007)(38100700002)(478600001)(186003)(8676002)(6666004)(4326008)(52116002)(107886003)(6916009)(38350700002)(66946007)(41300700001)(26005)(66476007)(83380400001)(2616005)(36756003)(316002)(6486002)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2RTUtZ3YyxL6dcCBQSZWX60cYWyFiN+giHCJMvogrtk4l1QA1Ok1vAKO/hoK?=
 =?us-ascii?Q?pXqRG4f4zvU6I+RS+JsklVxCTTtUyJJPDPvXhRWeZyWJuhQjljjKr0bfNWxc?=
 =?us-ascii?Q?HIpffl1CpIWq7BjpfxLZllGqP2NsyBKe6sRbH8xM/cjI2BCPbC2cmI2kv2aR?=
 =?us-ascii?Q?pXn+JHuENEts4I8Jqf18Rsn49UdZbsyNaSo3tozB4sEgQ/P+az39yGcLYorc?=
 =?us-ascii?Q?x5kJBa1tyoAbbje/uEbDoP369K0HWAvI5DczM0lli5BL9avSDWZE7DB2o3OA?=
 =?us-ascii?Q?dOLQBaMlm70cIbwrMYQ6jv+fZhuuR/5cup/N4SqWPCbDT9IS4R4C/2hOOAq9?=
 =?us-ascii?Q?mxnywh3Np+TrE8poypUeamZVonarPmb5YDm4rkEHNS3nzIqLlBps4FxakHf0?=
 =?us-ascii?Q?jLnew7xM+AWlpLQ63yRarVWuZ2xacmfC1Y+CMb4et5ClbJ8T8rFaz8XYmGGz?=
 =?us-ascii?Q?DdhwZMUCwTL1mvOFx3d83AF4dl58ADsXjIWS7SmyFU7twmsPL26SHUIqLYBS?=
 =?us-ascii?Q?6khqeRxQFkHh1KIpP4X1eKvlL/wiA8zcR4n1nfdgHjeZDAdQW1uuPZAB2czt?=
 =?us-ascii?Q?tOOjMHZoqv+jPqgVUIijlmYKEt1AVGJPjCxsDJyF2CqhXvHFh4OHIM/1TQnu?=
 =?us-ascii?Q?ELixPkKzzqD79tzbIISTkCfjZx5X0L49yjH29Wzip0RWhcujGxwzHQitlEzV?=
 =?us-ascii?Q?J9+fhpFf6QX3h9s+Vzs2mPEKNeEMYvjSMh7MgYL2sZk5kZMuMLKtREzvndso?=
 =?us-ascii?Q?LBu3Qq1l1RA3Oy9j67ydAPGoh+n2Mn+ohVGfTb8Kj3HDxIzkuayDaVpD7Vd2?=
 =?us-ascii?Q?1eZwCEBvvPmXRChDJZ7g28IY8wFOSvg8BRkgNXrsBcU/vOiUwNoidIH5ndCa?=
 =?us-ascii?Q?P/NymnVyOuPrw3JjUmB75Df/dYVpIs0xZ4i7yv4wzwO4LtR7k6SCTT2gp4ZJ?=
 =?us-ascii?Q?a1ySjcC7C00cuuBZ/r90wMTnIgQ41ttzhlV8SDYBgBv7B+WA9wp37QaVogdT?=
 =?us-ascii?Q?fsOpFbrfk96SS+soksQrrm/hCy2Fg+ujD4GDGieitsPqrPcXVuZxvUBt7i+5?=
 =?us-ascii?Q?65O4bFi5KS98LhpAl6f68RyaxVoQ4C/eELerbnMgdF1cRjoxSUP29VuNgIB3?=
 =?us-ascii?Q?1I8DNmjP+5FpjznOsNqCRVKGb3WWaIAmgauRKDfOa6IOvLzQma6IwhBdf3Rf?=
 =?us-ascii?Q?tCDy+o8bS7zYc4KmQjGsvMe0S+/M1CJQEBhSsIxlRrMXmOuLrEMNSa5joxmD?=
 =?us-ascii?Q?tdgEx+fOqyqlw4LxGqNDh7zQDvtc8MDupWw48pRs0c0UH+bk7JGTLdzQZSfh?=
 =?us-ascii?Q?dbgYo3pIEP4lsIXkV0qoM46A2J1iEVHdqsng97YyQN31ReWsLVD6aJIH8jFE?=
 =?us-ascii?Q?5vNyR5IA7EV1nOOK3C9igJvN6AwyHLXQSeIOv6At+sQUVnC8CukOIxIw51gJ?=
 =?us-ascii?Q?DbwXe6g4TA2trWHLToQdocODvyNhqqnXqaonVRUSSwiVjxbr6mgesLTDVNeD?=
 =?us-ascii?Q?e71n+8SSUelJvkpqQy8UNjzgMEzWnBS0nwmS4st0c2xYWC8/HRxw8Jt6foCi?=
 =?us-ascii?Q?ZYFmx2eI0StiZ/uptMgpVvm1BulH4buR+/swSg9pi3BFfPwDn6MRXewu9fAJ?=
 =?us-ascii?Q?GA=3D=3D?=
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fff045a9-5ca1-4e82-18ee-08daa2d1d31c
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 10:52:10.1763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 840be37c-244a-450e-9bcc-2064862de1f4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 r86/hVWw36TSdzm17x467wNtyLE673UglFpRmR+DNQ85hONnYDkwAzmxckRm1zl6h60MC/RlCjvPBSr3bMZLwsUOLcKXzClD2c6UjRkLlTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P123MB7017
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 10:52:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171220

License names were updated in commit 2456f523cfbb (after the dunfell
release) to match the current SPDX license list. We don't want to do any
wholesale renaming on the dunfell stable branch but we should add
mappings for the newer '*-only' names to allow for layers which support
both dunfell and newer releases.

Signed-off-by: Paul Barker <paul.barker@sancloud.com>
---
 meta/conf/licenses.conf | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index 5b309eb3851f..0149b1dc4445 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -13,24 +13,31 @@
 SPDXLICENSEMAP[AGPL-3] =3D "AGPL-3.0"
 SPDXLICENSEMAP[AGPLv3] =3D "AGPL-3.0"
 SPDXLICENSEMAP[AGPLv3.0] =3D "AGPL-3.0"
+SPDXLICENSEMAP[AGPL-3.0-only] =3D "AGPL-3.0"
=20
 # GPL variations
 SPDXLICENSEMAP[GPL-1] =3D "GPL-1.0"
 SPDXLICENSEMAP[GPLv1] =3D "GPL-1.0"
 SPDXLICENSEMAP[GPLv1.0] =3D "GPL-1.0"
+SPDXLICENSEMAP[GPL-1.0-only] =3D "GPL-1.0"
 SPDXLICENSEMAP[GPL-2] =3D "GPL-2.0"
 SPDXLICENSEMAP[GPLv2] =3D "GPL-2.0"
 SPDXLICENSEMAP[GPLv2.0] =3D "GPL-2.0"
+SPDXLICENSEMAP[GPL-2.0-only] =3D "GPL-2.0"
 SPDXLICENSEMAP[GPL-3] =3D "GPL-3.0"
 SPDXLICENSEMAP[GPLv3] =3D "GPL-3.0"
 SPDXLICENSEMAP[GPLv3.0] =3D "GPL-3.0"
+SPDXLICENSEMAP[GPL-3.0-only] =3D "GPL-3.0"
=20
 #LGPL variations
 SPDXLICENSEMAP[LGPLv2] =3D "LGPL-2.0"
 SPDXLICENSEMAP[LGPLv2.0] =3D "LGPL-2.0"
+SPDXLICENSEMAP[LGPL-2.0-only] =3D "LGPL-2.0"
 SPDXLICENSEMAP[LGPL2.1] =3D "LGPL-2.1"
 SPDXLICENSEMAP[LGPLv2.1] =3D "LGPL-2.1"
+SPDXLICENSEMAP[LGPL-2.1-only] =3D "LGPL-2.1"
 SPDXLICENSEMAP[LGPLv3] =3D "LGPL-3.0"
+SPDXLICENSEMAP[LGPL-3.0-only] =3D "LGPL-3.0"
=20
 #MPL variations
 SPDXLICENSEMAP[MPL-1] =3D "MPL-1.0"
--=20
2.25.1


