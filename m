Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FCADC43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:00:00 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.122])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.155941.1783357193339076282
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 09:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=rSeeSae9;
 spf=pass (domain: navimatix.de, ip: 52.101.69.122, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HgbBMUJhJpktv1kVVi4TfekL4V+zoNZt3nPIHzin8p54rFMg0CU6rdslqh67ZNxP7z4JA53tssxDSKi657o0bSsDoxIXe3asirvTIqQ2xt+nViu94WnhfkvcBX9D8ljp5QLYt9CuTTs/DbABccBEtdhWG5v2gHDqGdI1jyjPYv0XFhYb6gkFvLqOIgB0Qxc1hir2LrBNqAOrhF7ipb0cibG6RJAX3rnDCs/nfmVNTc3XLJkObpjGF/LatFwll3Jm/YGJKSWfZYqMLLdJPJzVga0XxYy5ZDtBPA2D35Tp+EExRZrYZwVz/KR2+iznq2RZ5lEdwcsvY5mlswdUXNEwww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tcCy2W1gul1lPF6YQ05VZPu61C0humMmiSpSgam0rZk=;
 b=QarSKHea9oyMiBbE+7XsGrP8QFPvFKjkjSPvcSBaOvc7CfJKl5f8PLg7oMlojSJbtZPCKhDETP/LSMJktYQpbkOMCRVtL69+r3couoSXfk5Vh5xU82jGB2DREiCmKRhukroVj1vqYUHIaZ14bxQcB3ZXptecIn6/UK1oXSkkw+r46fV9w/sdK+IF/ppojtTkLOBcWDV0g3g1BhgVUtac/q6LzyCGeMGt5ysdKMbOHe3w+AT0Qnu5vwwPJj2yy4eaamnbWlKfHQuU81w3Z1ln6haAstlJ7yiuef+/3GTjSUnimRnX/XRxTGH6RYviR3OnGHutCFMLxA1HdJ0TOCAQHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcCy2W1gul1lPF6YQ05VZPu61C0humMmiSpSgam0rZk=;
 b=rSeeSae9BghpGovqFKtFcYsUJ97cSM57yOJovBpeyDkOLLwmcV90bv4jxnbfe9k2OV+igdH1Vqpo/1W8YXqW1sC4Tn5bKfHMqbY3h2fPp0wE8Kix9YwrqVvD6ntbY1Q17pncj67i/nSWXNsIWJbLzDB8I2z/9/zlsoO02xARH+I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AMDPR01MB11651.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:719::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 6 Jul
 2026 16:59:48 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0181.008; Mon, 6 Jul 2026 16:59:47 +0000
Date: Mon, 6 Jul 2026 18:59:45 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 1/4] files/fs-perms.txt: Replace /srv by $servicedir
Message-ID: <5380f2caab9ad346667be7997955839e0825c8bc.1783357184.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7c::20) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AMDPR01MB11651:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cc34de6-72b0-4fad-12de-08dedb7ffc07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	ucMoOR1xvwMPMN311o9GzmVbO1fpWu3HkgUyZhm2OVj+hXyq/hrPV3uDIBnWd/QHq1ctltYEqsnNNp211o/epTt6sqVHY2lo5SWHOgGG2v7rLVDErajjnHJJ5MVE32WVSlBvmH+eJVP9dqT2vUaEzwnhAw2adw0y/pNvJEVzPLi7+F4GtGM4i/spJxXKbSEH0B+FHStTQbtmKpfzJHF0Aj0HF6W1gUqZni3D4lC+OUTl74Ugx9N9iyby2j/nKN7kyD5ZAj+comw8gOyMtwjijA77e/9ln/S4R5tcMOOtNNd5UDdkWJT9rh4TTiVkFf91clJOD6ZTTqFf78D3eyuJVwHMybdhW6UItwUKUn5GUg9LRDdmuDSLukBDyh/QDUslswOKZR0xeeAVdgB+P6K7m2PNrN3PoerZSpuI5WRiP2yASMD3XJsAQdQnatuopwa/oh2xoKQD8ECKgVlOhWweBukfAmTm+CvWaxEaiIRo3Zl4FyCtqyXqmoeuQTVeblR9UMYarbcSPftZkfPelV2LzAEZszUxklQAabk/iWBfd0QQdL5gqS+ZLoBxS1X40abz+WD9XRL3Qecjf+iyB58YRUJKkO79E7hyOMhVQkXgRa5UzgahyNY90h9R61LJbBt/Pz6rMfvYB9SidzUyhJE2DUqtCBqfJSfv/sSMexAUXfA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uRnSjX2hyYenlzbwR/69oPfk4tXj6lr9+zdUYv9im286El3/VnDTVMcW/rqQ?=
 =?us-ascii?Q?iIvu966X6HeFPcg6UmJoHByvebmi2b5ae0rpDcT8PWwMYL65+CywETiujuGq?=
 =?us-ascii?Q?pi5wNHGlb5Iy6nvbhagPp7l7ueQfxF+5q5E5p9qSCiDoz80cCN/MDoDV/IeL?=
 =?us-ascii?Q?s4NJU96zQWDFlXg1WB1il8oByJrSxbtLKHoTMPjN6lA1BnL0cx0sCgd0FZVH?=
 =?us-ascii?Q?X9sFCXsde3aHrSTbETdWnxaHbO5kglkIIhrIwHjRWNHwPinM5tIN6SHVKKJZ?=
 =?us-ascii?Q?xAhQEXSpSRnZ0l9+opEJeCW2a2qourVCNIW9XfTZ+S77sFWr+BXEuXcVDQ1V?=
 =?us-ascii?Q?zFDAQAlWQbDzPdF9FwptGl39qNJizQpbD48zyXpYVH1JMnj/b2Y/bkIUcb3R?=
 =?us-ascii?Q?rsvKUwbargB3+UIoroO5DYbV+95AH8G2Lw12/2ipucSIwndCWYts7iMj+XBS?=
 =?us-ascii?Q?pRRRPaIU6fEw30eX4pw7Ff1ShA8aAN9TdLXwmdeLmMWvm4VaKa2Q1A9lSKeS?=
 =?us-ascii?Q?EliOFiFtdEj+luntHqIT6cG6YI4apxRMrEvnPZhYNA1BV3XzQQ1yAqGjUdGr?=
 =?us-ascii?Q?6JNnibDBFj846fIvMGoyDJRJobErdASaHR/mNG05nwkCmWkqSbQyzpNJcxNa?=
 =?us-ascii?Q?ORgAqfUNA9KGidEe3O2XQaePfTG5LFLrwY7T0RIRdFfHtslOhdsQozpqRTbX?=
 =?us-ascii?Q?pZvwkjUWGr7+khfL3xNdYFWnrprvxSyzdWi5pkpHDoKyJkwB+Vm67WdCHoAB?=
 =?us-ascii?Q?zTyqx2HgKAqOgyuxJy1G9BAqvIKt/hyO2OSvGve5qcX3sHL7gaIwZv+nKMvH?=
 =?us-ascii?Q?1B1FGrDaPCDIXR/fgrc3JLiRVgmiApEF6VGAPD/Ta3GLXCSqIbZnrEAIoB3p?=
 =?us-ascii?Q?bwi1Th9XdjXXhg/ss3pg+bKJaluOg8Kk1294jnxvadRZwJ080yQFINh133PQ?=
 =?us-ascii?Q?xIrUOcNG+ODtv5lKPef10R9OqTuF+gf/0VlZlwU9Da8/dKhYZaD+p3jw32tg?=
 =?us-ascii?Q?2Q65qmpuI0blCYmSKkcooZn++KlZC+oDRnI0DwrDm4k9fiY6VA81hJMfdEgp?=
 =?us-ascii?Q?lr8ZGkTiwV65eGaaBttzdPOqtcXbl3a0bm3f+nok/hQvZLKPMUdJf6FibNk2?=
 =?us-ascii?Q?1VP9Kur8oV6+oFtAJpyMtPrORMZkkAWKuJlwu+JBY+6dtpu5grLIuL1jgXT7?=
 =?us-ascii?Q?HOn8bG014JCDQMY7Jnaj0QBjjrXxjcsEZo/FCHpdBUwjih6HN32jPfVgnluE?=
 =?us-ascii?Q?rP+I/4c6IWLrE54PMVDOQrzCG5+xcf6B7eBlPd+OgwdsgyuWJbwWPGFbV+Qu?=
 =?us-ascii?Q?unHywX8cGOZ39o7CfWEn1ROkSX7Oad7HTVXWHJQNPh8GRDDC6JmhX4wHJd9v?=
 =?us-ascii?Q?V+8QkRJpHm/kyPA0TIBS/kanqbbJQ02EQb32lpre+ZdDw6bPZcgF7xFe/8CV?=
 =?us-ascii?Q?KJWLs8+j2hHTnd+eG3FNzAygfg9XNWMo3048V51HWPrBS5rRCz6Mpa1+c/eq?=
 =?us-ascii?Q?KZIkLSvBa9P4cojhMrxzFYpzm+fU3RirbPLex/pHo5wT+g8ZHCpY0JBGtyUp?=
 =?us-ascii?Q?mAD+IWYCcBKt9EINat1CbKULXCr+O5ozlZcy28sjO3A/5GqukDVHbtxnwhrh?=
 =?us-ascii?Q?VgPRxjt657NMJooN49rWR7dvfdz8Neq+Na4l4t1vr6bXT8/SOc0rPXPeFkl2?=
 =?us-ascii?Q?VFAFr5o2kohSZWsBixtZDtQLrQFe7r2t4fPR80u4r2uf+EVas9QHCGL8gyzX?=
 =?us-ascii?Q?Cb3PO/FaXw+0v4PPdhooRek5PotgNBY=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cc34de6-72b0-4fad-12de-08dedb7ffc07
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 16:59:47.0891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3tjJByk0Odzt90vViBLBnoWl2fPDJWi7PU2mC/w0hqpHJ0wMYPiuG++St3iRrigMXCQZE6/n1XgKAd2LzyO8Y1RDYm0hDF08TaDCIPnfAv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR01MB11651
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240281

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/files/fs-perms.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt
index d2266c1b26..9726d5a2b1 100644
--- a/meta/files/fs-perms.txt
+++ b/meta/files/fs-perms.txt
@@ -48,7 +48,7 @@ ${localstatedir}/run	link	/run
 ${localstatedir}/lock	link	/run/lock
=20
 /home				0755	root	root	false - - -
-/srv				0755	root	root	false - - -
+${servicedir}			0755	root	root	false - - -
 ${prefix}/src			0755	root	root	false - - -
 ${localstatedir}/local		0755	root	root	false - - -
=20
--=20
2.53.0


