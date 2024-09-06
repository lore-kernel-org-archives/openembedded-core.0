Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17AC5E6FE23
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 15:17:36 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.130])
 by mx.groups.io with SMTP id smtpd.web10.1434.1725635854525499576
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Sep 2024 08:17:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=Evb5TnDG;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.130, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TR7RsITIx8upuszk7XU7jbw/BF1Hi04b0LOua3DbdhFqadjHaqJejNTK1MXljbtn3XasHjh4ef7Ds7CZjFsR8q+8RKzvmojO9lDkHwxcglGKshxOauXCr/dwGgNUQN+G+kgHW3hRK2q03YqKP2viuPnEBgg7Nis7rJhgWW1MTLwH5hZqAA7qG6ABZ5jptEzwanAcwn777M18R3FuZZSa1MNs18MYqZcUK6/OGXlDUXzqmEPa5/MbjYBGoA5Ix4ZskqHLztMbdG33kIFfTHYrt3rNIxSqyJ8RjGWhSuXASfIaW1BqvILaLQZzJxqC8wVNmhepbaMR45WQwid3WHmA/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ko17dUUOL5KME2h6FqGHs41IiP8oggFcdJ6mfGbx+ms=;
 b=GewEHPivqlV8BCupZNHzDI7StLRwW7phI3go+rNQPahq2KuM9+t/rd/lTZqKYM82ntAVYQjCWdoJW183O7OozTaDT4oim9SkYdP/RtAs/HjQo8cfYlkn+rpz3HTVIO4ZJiGapXyw4rJ6vL2QBq7HSgkYLW67PmDIvQQf27LpYgTUm/4yTGzV+FH7NxUb99Maq1gVv/2nk5gbtqJEaSo5yqHzkvftZnfahoXUANavegDz7CKlfc3hfnp0rhr8f7R+3LN1+1ulFbD48DE2mpCosJDYaHWWl7viseSoGBuEdmXHxjNp6xoryZh6dNxRMQuefos3CVeUwrwZYdzXwhmFjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ko17dUUOL5KME2h6FqGHs41IiP8oggFcdJ6mfGbx+ms=;
 b=Evb5TnDGFrDaCJYydQwuWPWnxeLmKb009i4Ntor67r9qbB376m+m8KkVQ2ZptSHBE/ZhiUQ2ZUzRralyefK02rxk9UIwUSRtDuuTYP9kcKK+pB3tU/35xHG45RnadYNLtLBlSNEa0t5e3B1ZtV4oQ/EJzB2iWh1fHy8eq1EydiEQOVevk++gZRDg8QGqUfFOLjSlSPe6KGTP7FLtTgiVloUSt9cioOF2liSKZxDHyLLtbeUUi2bh0hwiVrP12rz0DG3pGWhQQiDeLyPjiS+ghCj/o6YAM2+hiUxhiGCz1RJUVd+ysNcR8h8I+Idtlnzs487vshgsH310Mgg7YjBuIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PA4PR06MB8499.eurprd06.prod.outlook.com (2603:10a6:102:2a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Fri, 6 Sep
 2024 15:17:30 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7939.017; Fri, 6 Sep 2024
 15:17:30 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: steve@sakoman.com,
	Niko Mauno <niko.mauno@vaisala.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [kirkstone][PATCH 1/6] iw: Fix LICENSE
Date: Fri,  6 Sep 2024 15:16:57 +0000
Message-ID: <20240906151702.3006933-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0114.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::32) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PA4PR06MB8499:EE_
X-MS-Office365-Filtering-Correlation-Id: 05f38e62-67fc-4fc2-bdd3-08dcce870688
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FStYbxBXyfP9FOQwM/EECJgHx4RnUChsTzbcNm3QQ1yLsiHlXfIHx83nSazF?=
 =?us-ascii?Q?OQYWOrIcih9K4HtEOtnn5MU7pA5P7p8C8foAF3ikD2sXP4hN9piaViqtYUUo?=
 =?us-ascii?Q?kXipBtpIxYPa7y3O1rsrUEgIas4OCKreC2bYzg7XcWUYBotF0AtNbngHfczm?=
 =?us-ascii?Q?bD1u68TB3KGSkVAaMz0ZwyC+zjfwJy6fRc7I0qVgqApcVBRZNH/eTBR7VR7c?=
 =?us-ascii?Q?5OQUrkGRjMLnf47uHy7SUyvEUFrsPJchbLGtVDBIlJN84B5Nx2KC3kBHC70I?=
 =?us-ascii?Q?YAm3Y5R0PM/5N5amg67dOBOqm5Azs12UpEIaULd8r+PCYSrtY7VK82HWrFv1?=
 =?us-ascii?Q?k5qanktLUb5VupNdBYO2fN4XGuO3jQ2SXc/vDkNi/MjEoqFMM9t347E1GQn5?=
 =?us-ascii?Q?Ovr5q2a5Mf9gkRdAOnpISEuPRQKvJW03ePLDVIky6n+sbzlRY/IPDbRFj/rS?=
 =?us-ascii?Q?Xj3X3rEwvk4ArATgO+sgfUKt0RsxNQEnRp03R/+I3deJ8/RH1fx5cXV9PkPZ?=
 =?us-ascii?Q?qfPwumuzkadZidwOXV88B7LI34k9VqluewpmRxm+JpYES+VxvdlVcSAoVC9F?=
 =?us-ascii?Q?VdyGPqxTOWbhxbyHMUA1KRqCGr5zh58rKfJ1is1t16NNZaTTRTvWNDO5Hl+k?=
 =?us-ascii?Q?v40A/eTbjNSR0BtFwiy7ASMWDddfh0W8H1Neyi13AJIXkZmJRpZpeUCoJerK?=
 =?us-ascii?Q?PdumLyhNmN8q3xib89QBSO9nuFzqQepiw1Dvze6BqxD4IWdhd2RbY9NPTor5?=
 =?us-ascii?Q?5EGrGU/h94m3jF3CWNK35miweSRqtmDyPT5pWyLodn7JoeMF9ox+ahtMHXEf?=
 =?us-ascii?Q?Vbu852a3jXbPsX6t6gl2zULjSth40GMj3OOQjvf4wzK6ccMcEKj72zgiUqM/?=
 =?us-ascii?Q?kVikDnOxSOnatuT1x+YPq3ntmvOu/w5eABovyVs94KDbGXbYLMFxwx8uaMju?=
 =?us-ascii?Q?vILU/NvMgecL9k1UMiPBwCLWZDrYVXU7Ffdf4qwp3DlWOfX9PjC2wd7ds5Y6?=
 =?us-ascii?Q?QjzYFv9bVVcaBlXXk6zcYo24x0PdnshnD3BQ/6AiIUKPU+5H7MXAY7K1Z45A?=
 =?us-ascii?Q?ygz55+LRmtjaWuexWAVZZ558v4qB2q1Dp+BlcyCNYwwbwzA+lEbQq6/3skAJ?=
 =?us-ascii?Q?BH/TaYiN7nyclL6Jbi8rdVhAY0VUWF2jm/HwAsWSDhb4piQkt4SXfI/GcK9+?=
 =?us-ascii?Q?L3jUv+CTHZ7ZjPCA4w/hxrs4OALfu1unS1HXgvBfN1yj0Aw39XuCWOLDuJC1?=
 =?us-ascii?Q?Kuj4tHGA98uDY6AnVIPlxLSyYueKK445K3sZKHmwX2h9NuPQNVywsNSzwvJp?=
 =?us-ascii?Q?V0Dn4s2e32XeqtgAZvXtm/D/gPvDgJr6y6jFbP4R1Tn3Tj2C9y0/SH26Wz9H?=
 =?us-ascii?Q?7gOuZgx7X119BVypku1kugWShhoPbsQ3Cc4T9+jlL9GnkTxkiw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gfslD4DyAFNOpz3L/YagvMx/QpgdjY6NUeRCrNQ3tckULLOsTr2JyLot+nR4?=
 =?us-ascii?Q?T/VZeVpCCVVfYdXqoq7WxfccRz2Ejwdlr58u5giWvBw1SXRr1cB8u3g9bU1f?=
 =?us-ascii?Q?C+xcthhwThLbxg/W2olBojAcb1oZSKquEwjvWIPnoRnneA/iaW2mQehOyWFk?=
 =?us-ascii?Q?CqzBktZfFASDEjuatlHB/P3s9ecD7OXqCtHXk2NRhYFOV270pQ2FcJAN2Hr+?=
 =?us-ascii?Q?pZ6P3dJOrFEkKG6J9KgywdBz95XlThRNuwiNYzhsR1vTUOhh+wDECmT44CK4?=
 =?us-ascii?Q?tK0TYbmddTf6MyFaOrnjfMmm2Np3QNslKPzxk+7k43aEsgHTLhdCPWw5/2Lt?=
 =?us-ascii?Q?7EXt4ZDLlDqpUGEFUXM+8jyQsMPrdsGKftqfcSthoLTzNNMKSo1CVfmjHS2d?=
 =?us-ascii?Q?4rOOVB5uI5J9C1ZB2vd8ZDbl6j52JSjd5h7wK5bF3IAnIGUSCrz1Gs4htKz+?=
 =?us-ascii?Q?WEUv5g1CbADbWJ4RZYCE2CPreuzjw5yY82Txn3dBXxKNueKqs+UN/Xafzpi6?=
 =?us-ascii?Q?k2Yb8f4XAINU2gH4S3ZldUN9YSn4ljWg/XgdV1BztxvZE3LMgoUKUkbots9F?=
 =?us-ascii?Q?Pw7r70R6oTtvV+optFVYGAMjkD2EzQcGaegPIXTrfKAkhfGqw9Zy8V0LuBXB?=
 =?us-ascii?Q?RQpAmndUErS63TvDqrSaWYlNN1nGloqJTNaI75jN6e/9EfUk2NTTMvNfxOKx?=
 =?us-ascii?Q?eKFhSO47Nb4BVan1aOWR6SLY2Qf5UCWxG4d8/72VY3luchqmAA0owtOeKTHA?=
 =?us-ascii?Q?zZkUrnzdyV6drs/HIu3ci/Mq+I/zsZBO9NqDOXqucskWDqjxcDCPkQpNK/IQ?=
 =?us-ascii?Q?sMrJtk22qApnKYaQfvhUypginpInU4eIetflrxFSHOYRp59HC4fpArrOcPhr?=
 =?us-ascii?Q?Z08QQLaxtNzmD9Z9iq7wVkijvcvgWkVeI+NgW5jYYDHBC0mueYWGlr/wrLg0?=
 =?us-ascii?Q?q7V86ZT2vJ/gEQ7IcIHvYqHu4IOlZMilumZ3QBjB7XliiRL2G4W8VcMbVrsu?=
 =?us-ascii?Q?mCEVzfafjKCb4c/J4F8SNYRE4C+z7SbjbJNNMjlpeoTFL5UadsEicnqYI+X6?=
 =?us-ascii?Q?JIOo835b9teUc/AzLUlDi3pURLtuT4hmGr3p3PygiM10kQpKhQ+rfln0pVQu?=
 =?us-ascii?Q?RMS2ntBBiANfoZg1KAOXbkMhNwa1MrgLeHXhVzXUcCL0Any+s6FT0N3sV87Y?=
 =?us-ascii?Q?2hD3bJ5+moAQ0eXkrR5v33544XuWfAvX0p5GXR/oEzUplcO5TDFJhMMbxZRU?=
 =?us-ascii?Q?HXmeT6nWsIhfVqmUWOtLbSH7kQsHQFrVmGHJDAmUCPYbrwxefwl/I5UxzmT9?=
 =?us-ascii?Q?1o5RZsnDN1Tt5KBwnni5+7EpIAF6wS2/4FHmxXa46kgy7tbn/Dj4i5iD0f5L?=
 =?us-ascii?Q?H3DqFB0HqqbFRZ2dbTpSJqIfWf4sKWfIBS67BQ3sm4YoGR10AwTCiMJ6cRDu?=
 =?us-ascii?Q?ghhtmfKqBEMb+MAtMLWyj4zLTsce11YP4oj2SIzk39qWKP5bXwOlzF6gAcbb?=
 =?us-ascii?Q?0+ezcv3FkhViEycv0awuZh+94v6vgCyM8FUNnmDq/Z99ZrxDW0uGQxtJWXjS?=
 =?us-ascii?Q?1iWdZYtNw6bQ1KFqzcwQMr9cvK4xgJfj+kQTJ9Ta3fj/qELSB5chG/eu0Rqg?=
 =?us-ascii?Q?pA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05f38e62-67fc-4fc2-bdd3-08dcce870688
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 15:17:30.6509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lHcHZysEB8ZDhM49cl+jcUaCAAnT2tqfXo723kdvSj8dKU8PH4C9Qb6xGRzzJRroeTad21BXFF8nLcMMWran3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR06MB8499
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 15:17:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204269

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
 meta/recipes-connectivity/iw/iw_5.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/iw/iw_5.16.bb b/meta/recipes-connect=
ivity/iw/iw_5.16.bb
index cf176a349f..85f9a63998 100644
--- a/meta/recipes-connectivity/iw/iw_5.16.bb
+++ b/meta/recipes-connectivity/iw/iw_5.16.bb
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


