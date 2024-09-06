Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B74FCE7AF1
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 09:02:44 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.109])
 by mx.groups.io with SMTP id smtpd.web11.30524.1725613361254842639
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Sep 2024 02:02:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=oRdlwCJ/;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.109, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ppql1avp/zzcWACELxWfVq+/OFRAGeWc8+KJKtgLI8A3pUN7bFHMw43YdQHj7WgbbLJ17EQD00P036tpR3Lf2Cqvf8/FwhUMYmEa+6ors44lxBgY3P/jwGWs9dxPSYn7ovXGeQ4N4faCLHFuiOKGqs+z7hxCe/hKL2aDLYM7bxGcN2fHddNyLyyBj6VAbGx5t2saoeQMNldCjRZPCaw96TH3MRojDKimWvHA/2dBVdz/YXzFwvzxyrYZ0t2jsQIvzWxTDPTsbnGoFmBQQ6hKuzF0uVtZFpVaP7QHJ3zfcPELiM4wsoaxnRq6z0W+jlK+YrbZ8WlkRRQ66T3HE0Ltnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xry1Jh4ZAlxcMsj3jCGKc4Sn+wygqZXDuVqkQdDQ21Y=;
 b=hdGDbRuez3Lev7lAGo8C8o03ondd7wvKZt88GhoBvl1H7P5yaQ/4KnAK+QBDK9ftE7M5SVUP0mniNorRHCoarHD06tG+lRtjDPbs4YsEU/uZqRKu0FjISmwVDpUfv2K+C5LhxCKrXXQOQ8IyuOQnO+ui5a34r7NTCLLhOHYi4C4Yl9L2gWs0g4QL/2wgT4UJsS/rd5klOjLc2s+odi74kuXDXS0wQlqFYs31YioU3e1ihKlM/on1340VVZYKurnYEyKEp3k5cZ3N6aU+J569kZmkArCoG0+OwkzTKkRdmRau2zsMN+fbai+xguyKLhMX/s8Kmk3ZnrrfKzOItyJbbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xry1Jh4ZAlxcMsj3jCGKc4Sn+wygqZXDuVqkQdDQ21Y=;
 b=oRdlwCJ/KAhcG5qVmVw5TFeNGiVk3SEKhRK1eQoNduwAZIWiKBqWcEZfXOLQX0p3Cm2DqSHRSiTfZk/XI7/pspErxHyiRxOuO0iffEQWtTQ5FqVrNEmq5HIgKj3LWoO5abdjrTm+xtpm1gttMAX3rE9ha6e/Iih39xd/ZXc0SNUvrDlPqkss7cmkC4MACzy8fDQpSsNxAOLkMBKeuW8pXjkjBPGcA03bUMjnYtpHbH+7eHoJpr8zdUoAdKXLALuBzbkYu38fQayKmoGoDoiCa5li3Yf/JMlYGsZ2lU0LIfL1nocJVx5S4gy/45yy3lwnrdkJsHfx5EkxvGv9sc+GVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by VE1PR06MB7072.eurprd06.prod.outlook.com (2603:10a6:800:1ac::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Fri, 6 Sep
 2024 09:02:37 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7939.017; Fri, 6 Sep 2024
 09:02:37 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: steve@sakoman.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 1/7] iw: Fix LICENSE
Date: Fri,  6 Sep 2024 09:01:45 +0000
Message-ID: <20240906090151.513160-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS4P192CA0020.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e1::6) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|VE1PR06MB7072:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ac677a2-11f9-4cb1-6915-08dcce52a745
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MdYJmCK9zXzpzExa+F5cZvTxn/kg9ll/1zSM+4jR18TRzD+IW6QFnMNuarVA?=
 =?us-ascii?Q?aQUNpZh9LNtcnTmU1QVGKv8rV7EaWnxfT6Zu1SPl6hdNoafAM11y3Ctkh4s+?=
 =?us-ascii?Q?6VCV8TD8+/A8SqhOBk++3D/UthoNSljEqq1DnjdgPisdTINfT3rlxRME1pSd?=
 =?us-ascii?Q?BWixVK4KnkC66wuOS/0rSMhZrKGmzvN7jW70xlZ2R9gJ0yRnquPTGDWIG1n5?=
 =?us-ascii?Q?oVPACySzWV4xHGxNV9NykVWFu4ywKH35pgIdgxFbQ5wo5pY9FESuVMNyhtyd?=
 =?us-ascii?Q?WbYPZVuI08K8wwSmTIBqFriaWciMBqdkPIUh51Rp+riKM71zHJRWS6l5jg1C?=
 =?us-ascii?Q?ZXzqy7nU89537Pu7gHIEpu/iJe8nCNszweFNT+8q8CtLV0f+C4FgdcjnwzEp?=
 =?us-ascii?Q?rD/gQpT/5vBEthz4KahrRc9Ojn9PWlEYYSiRjuE8M4lzW2l8/AhWVaUsoGAJ?=
 =?us-ascii?Q?R+6LRm2dzk/UOHHj43lDbxE9VOjHv534ebmb9hcmC1aifH3pHJEioWIACe/X?=
 =?us-ascii?Q?7+UC72lBpAp1NPVr1qtLMSYDVQkQ0oCg7GUWhYTIZhVPG5mWsOOYwQ6OeYm8?=
 =?us-ascii?Q?OukOwMHk1bVo/rQ04wy/u9gghpoTMvb3ORiL6vqhO1syUlEVFwdlRNLeryZk?=
 =?us-ascii?Q?k4/8jjCE+l92CYZLQgvIaPZKnFeDRHmSLf3lksrqFbyN2DUQTmT/NjLpfdac?=
 =?us-ascii?Q?SQ9KaZhlZUA7FczcgmfLOMlnLWIZNPZN3J7G8etIOfRRWHM/pH7eFqBxc2SJ?=
 =?us-ascii?Q?vEje++u/E2GLSvLofjx2TntfZA9p4XfGpvwnM3eVqVH4kaLb+xoJuXSJrwJQ?=
 =?us-ascii?Q?ZA8XZOmBZRdyKpxOTAiteaske366PglcZcDAFns7wK3X0DHi6xbUltEgvi4P?=
 =?us-ascii?Q?vFb0AJXlvNjS3R6GzI529aYj7UaVVbcdYhNla2ZHLswAXSyBI4PakG3A7kir?=
 =?us-ascii?Q?6Xj60PEETS4ji8owU39biHZRiXk7DX5CS+Fc2jzCnvsgd4Js3cu3liaX0nls?=
 =?us-ascii?Q?JhmMmzbjTipBEMMuXlzTCvqP6PhW99lMf0WHXsCBtNzPwACcRoZqg1Lm2MX1?=
 =?us-ascii?Q?3GOUM2AOBs8SmpslzLxuhg2cwKETKKaedwTiQdVPRxpOloU/IBLQ6y+d22V7?=
 =?us-ascii?Q?vXNIZxGo5w43UDNVz9NSv4ZjB7uFcRsk3vDrywfSSswGz1jXS4ZNRlWHH2Aw?=
 =?us-ascii?Q?cryM4CVnMbUgDMTW14KhKKwHTwACod1SJ7Ncw43EnWJQiSYP/M8C/v+0msWm?=
 =?us-ascii?Q?BJVMAGo0hWrwqesCLFCyFd9+MbfnoBabJudTnrjTcUh4NrKAgrcw/nJbHSh/?=
 =?us-ascii?Q?nz4maDEgo3bteAQmr0bACHomNijUPnsE1u6rPrzfgkG31P44Gg45tVhlYDBk?=
 =?us-ascii?Q?2HFvLqvnpeJxy93QSrf3ddjH0LlZ3ASvBMCjAWXj5RA2s7cpgw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?L6OpyZjmGMKrBV1eV0zrxuNHeo50AkGc3Qb2iwpVZ8eT6ddb6S7VDei/zo1I?=
 =?us-ascii?Q?6NOSTW8dsDzk+w4XPWTqwNcX4NqiWjF0UmlfYcdpmOdb+D7Wl9lXRuW+V1BG?=
 =?us-ascii?Q?KoYlj6L1Jpr4f+rP2krZ4owhPVtlQKGHuwhZLfA5NPeuuaKbtQkKMdUuPGqd?=
 =?us-ascii?Q?C9U18/14sITxyKbzedrdVv5IWy+k/zxgENn69lbaAK8SStosq4yUnefCsOTy?=
 =?us-ascii?Q?Ju+6Z4JPm6KA9+Q0c6OsklXkv4xUDrxQyULKTarw93cBuM/vIZ/a3JBVChpx?=
 =?us-ascii?Q?i5FoeKNF3LwItlYASRQ5kh+j52nMyWo/+SGvGAF5ssKkMsYLmZ+OBE5qKTvC?=
 =?us-ascii?Q?qdpyhxOgij/SUYtEOiLRuYg4tKtl+LX70I8WIWBdVCzPQRITuZASAzI1jTmV?=
 =?us-ascii?Q?bpZwWh/iQcRvlcxjrbqWfzaTrbX0ZjrjYzEGa5HpB8/1tLQdBjp5vKnrRG6i?=
 =?us-ascii?Q?oaCXL2KF5VVcPyauMfz9SmTLnvq/qgOcS2zyFydnDei2AnYes6BBlQPOSVA7?=
 =?us-ascii?Q?uK2qbFahVSuz6UVHkDjOfkk3++c5iWk7R5MDg/7AdoCfBnoYPUOUK8hh9jU9?=
 =?us-ascii?Q?gbXJhblpN1VYK4SftJN/CeThla7v2qD02mTFbn9mdnouw0RiogkZCnYv+VLd?=
 =?us-ascii?Q?aTqEd8w67oyFSQrhDOrymynDGsoH6crBxEaeSPxJ/oeb6iJYICINRaHBuoZH?=
 =?us-ascii?Q?OQ8WM1VnQJQ4vXoNQvlaXMbZLfgxBZBEAQJSizZXCFgqPlx4wGq1iXfMgSbr?=
 =?us-ascii?Q?2Xl5AoRCywkhuDioNDgMWY9dVB6IHbChClGA49jXRTXx6N3dYW5LMu/Xl3gq?=
 =?us-ascii?Q?j0qDdo9oC7blOr5J2HVHRF5k3SmZRRBR6N4xsG+ZlpJU2XDYi6NQ1Pt1pBUE?=
 =?us-ascii?Q?HPmUZjAFgrzkNvMHAGPCUVxsRIJiJxITWgmgWZ9lsd2H57LX7bDBdL+drq/s?=
 =?us-ascii?Q?pExRoxuGH0mbZH1Jf3yJQuBslVnLGGjYv+mt7/CrMFR33BPrEGdn7DI8uhf0?=
 =?us-ascii?Q?Ce3mQwFA3IJ589uPe4QonHTk1KeKejuvmhu0MQbqS2z7xYB6fTZdbgfKOisv?=
 =?us-ascii?Q?kRXvJrWLIpkL0OMKBo5UaauV7/n0tBWLSbhhpqTZEKJbtcbCk9fZyDzCgS/D?=
 =?us-ascii?Q?LOAMDHGEZIj0jYTSfVmsMrYUqbTzo6DnqqyrJi34GRbAarRTXPfhvGltaU1p?=
 =?us-ascii?Q?u+Ak5zFDxM94ooo1H99lUVo0EWbCv7JXlqgmVUCao9wxxZfugmhew9M7lki3?=
 =?us-ascii?Q?GWQgLw3lC7tXybH3fsQrbFc0sJILaQj3cnfFiYqMvhwWrMkQhl0J061Wbd+p?=
 =?us-ascii?Q?ZrdPL1yZCJ0S9VY3GrPD/hGUTXasJioVSf2s+bR4WDrISy0TUOu+k3lnfGGj?=
 =?us-ascii?Q?0MruSx66LAp3BzUvNU15y97rBnpjENNKecwM35H+m7PGrkzK+0sBKYA+nMtN?=
 =?us-ascii?Q?4WT+N4twidLxMgpjk8OK4HmbdVpqAB+g0SY9+oqSPFw8ocGrPrS7E9SGckPv?=
 =?us-ascii?Q?TWLrVIjSgv/WmlR14jmqwDJcLoXGt5y3/n7HCKYeMpfGx8ncvFrlfQ3F50JB?=
 =?us-ascii?Q?s3G7aBZA/fKHw7SppSo/NR7Kkdu0OnprB4wICBww+r0ZgyHncdsxUYsKDBtR?=
 =?us-ascii?Q?Eg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ac677a2-11f9-4cb1-6915-08dcce52a745
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 09:02:37.0260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mZswK9OXI2uCLzBtYFeX/qAjJhcBV+cFMiM2rL+7FeZzsMRJPckXpFMAALTUzS7cM5ddE8QvudExTvSG5MgzSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB7072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 09:02:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204255

The contents of the COPYING file included in the source code match
those of ISC license:
https://git.kernel.org/pub/scm/linux/kernel/git/jberg/iw.git/tree/COPYING?h=
=3Dv6.9
which seems to have been in effect since 2008 commit
https://git.kernel.org/pub/scm/linux/kernel/git/jberg/iw.git/commit?id=3D62=
2c36ae94a880fb53f7f051f1b26616f5b553c1
("license under ISC").

(From OE-Core rev: 87da7445a2a77fe73e3524cd50112842e91235b6)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-connectivity/iw/iw_6.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/iw/iw_6.7.bb b/meta/recipes-connecti=
vity/iw/iw_6.7.bb
index b46b54bc93..162b4e922b 100644
--- a/meta/recipes-connectivity/iw/iw_6.7.bb
+++ b/meta/recipes-connectivity/iw/iw_6.7.bb
@@ -4,7 +4,7 @@ wireless devices. It supports almost all new drivers that h=
ave been added \
 to the kernel recently. "
 HOMEPAGE =3D "https://wireless.wiki.kernel.org/en/users/documentation/iw"
 SECTION =3D "base"
-LICENSE =3D "BSD-2-Clause"
+LICENSE =3D "ISC"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D878618a5c4af25e9b93ef0be1a93f77=
4"
=20
 DEPENDS =3D "libnl"
--=20
2.39.2


