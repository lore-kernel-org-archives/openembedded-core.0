Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E6BFE7718B
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 22:22:07 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.41])
 by mx.groups.io with SMTP id smtpd.web11.140245.1734646917684260218
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 14:21:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=iodsGlMe;
 spf=pass (domain: oss.nxp.com, ip: 40.107.104.41, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eJfg38bTzusCDjD96PoSz6ZbDQ8OHnvmEvSuVZKe2ar5RrkRHq9wIwhTagJmijhX9UXZHPg5nf62YiXPb1LpnKE+MQS/Fxn+LaMpKkZx6ncf9HS77AlHpxzcEe4/pKqCtjMGYzyZ5/SLngeQ0ps2ujeZgUDGJOSQLS+RooUz93nn7DrAL63eXE1dgxhFzCkCjdnWFZCV52hHd2qUopwOKJ96PeUDKurC+X1XFJgkdzkB++ulGwCcRcO6vXhS/Dz1PgVPOS3Lq9YYccaCjeIucy1MaDDiMA7yeRhyEfYLTAmyu7Lz/U/zQnl2kfbX8Gj4rWDhuULhF2qA98quDoPFlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/wNdezoNmq2OIUMr7XEZfipMQUw4ZdNjGDErIF4pL8=;
 b=C0MyNbDgN10D9nGaeSOulZFtqedGk4LKC1YLucBHRoDO9iQsozXBrGGLKHT/foCPYN+irQ9+kqi9qPEQv1ccIszA2UFiA9P/SPoSudnDYd72Z7kX0wZemONzTalLf16vxObbmjB9T5NuCW2ByYoIctpzH537VB8gh+vnmDbWCspOn9xHZ8ckK8ZtbEwY+fbSytWZAiqJ5yE7f7Bzj9Huh0OZLz5gMAjlM14GSoAzt9knKJJsqiD2uDG5PJfUkd4yoBFTOJWJLTUwyEomz2RedFjzDCghmz4zHv+n4GzJUGH2i5Kze63o7NAA9QwSlgWFjdeEPutwW0+kbSZsWCHdcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/wNdezoNmq2OIUMr7XEZfipMQUw4ZdNjGDErIF4pL8=;
 b=iodsGlMeHUNNh4EYPyyAkfq/JkaG1qrcME/umvH91WPABKUXXFOIRQkh2N114BWJgBg5P4nhApHLpVNUWrF791iX8Ptn97ef9Df3zzN4KxEdoLoNSDoy2Zr0IVU+mp741+KFG3zKN8gMA7+oub5bX7wCzUjuRM/AtN3K+UiG+ho3oWLZi7RnW/68u2T1RiV6gcaMgX5zPvAESujM8FQ/ZNGUjRJVVCADPq4koYguHqeGpqWTrnJl1FK5pxOQtmsnustPTpXvJK/UCZ9QIqWWJsiY7pIBKdSHTPXvCAdUckmmdxTDcf/XO5g4arSIIcM74yuA4lZwWaLeu2iOQTM0WQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by GVXPR04MB9759.eurprd04.prod.outlook.com (2603:10a6:150:111::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 22:21:55 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 22:21:55 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH 2/4] wayland-protocols: Remove inoperative packaging override
Date: Thu, 19 Dec 2024 16:21:18 -0600
Message-ID: <20241219222120.1188742-2-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219222120.1188742-1-tom.hochstein@oss.nxp.com>
References: <20241219222120.1188742-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0066.namprd17.prod.outlook.com
 (2603:10b6:a03:167::43) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|GVXPR04MB9759:EE_
X-MS-Office365-Filtering-Correlation-Id: eef2f7cc-350b-43c5-182e-08dd207b8b5a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7jc0K7SkfyDjTU6q+JNwN0XRxfEGtdFAC+cOV62wXsvLAitCU5Qij5/cmMui?=
 =?us-ascii?Q?WwDxmeCdHxPoFN1hZ223jceuSz8yCQyS2lQBhw666JBDAWH+MFH3Hx3T8fSN?=
 =?us-ascii?Q?Um1rAA5BD3rMOky/diDQh6hSOZbXo30IZarSqSzdCrWWQyW9Y405n768ZI+3?=
 =?us-ascii?Q?7jRaE8H0SBDf+ixh34U18Ax6+3Td3JdphbvWNjDAzH/vBomjrt/FSoHduT7Y?=
 =?us-ascii?Q?0uVX/JBb2MgEylhJQSWerg0wEsg01IU+RohpLRZ/meQW4tpM/Dt4jbt4gnif?=
 =?us-ascii?Q?g3MvEDz1JYtLV/z79kDXDxvqkrTTpcma3BZ8mQPWqvnJIcbpJEENytRTpefo?=
 =?us-ascii?Q?ZWrS7ib7YqUymJ8dLRZ7tSLhdOTWR3t5gp7yS+jwD9+TRpy91cbIxKHzk+Fd?=
 =?us-ascii?Q?AZ2WKuTaQYQu8MFZ/iW5RC9tXZwGHb4ZP0Hr7AzbXyKYeF320ajABdCHCak1?=
 =?us-ascii?Q?7zD1tbaVX3Gv1aFvXtu3/2MyBl/EgZ7xmy1jmJiAfry8pF+f4qLlTVSw/ZOT?=
 =?us-ascii?Q?Gej6rkI00o7iZ5FYzubVUvWMcQNk6YPeNI8vduNbdgSrtWi4jIq6AppjpZ3P?=
 =?us-ascii?Q?Pttah3MSlrqm6Dz9RjpBdw1fShsXGH2Hzjk0S9uqJsQivvkWNcgx90k76GDu?=
 =?us-ascii?Q?hbp9mfh8xCVrusEtMOmq6j/LosfIQcVU5Fn5VmH8SlevPiZMGM+ITN7Xr+Sv?=
 =?us-ascii?Q?5QyCip+Cg+txwx76itOQM08ki7bf9VqxLJ/4Uw2kQryb10NvxCFisVOQ83SH?=
 =?us-ascii?Q?DgzX+dyJD109+e9fJwXEFhpJYOuKV6sCfzcj7U4I7wSXgEvRRRvypkLtVewt?=
 =?us-ascii?Q?OoLB//GVBOdeSvfCCuGbfPftMUJVrVfnH9YKUaqRKdYEYxNM6BePSD+qiPgq?=
 =?us-ascii?Q?w3mHR6rlZHL7N5RLmbWY+3fnEkyJzbwluBch4+BB8On2xpB6xY8bB2djluWV?=
 =?us-ascii?Q?vcWgKZOJ+cXuOW6zRJPGVXhJX+thtbJ5QvNZJbc+0Fj1ofV/APUohSd5+qfY?=
 =?us-ascii?Q?fbJ4VvZNS1kyPNhY39/reDgXm24rSu3ybtYaIYrkm75Pdh/UVSNPJVYovCxg?=
 =?us-ascii?Q?9/DRz9/a81AlX/38g2hasla12e2MilYUNrpIfz2C/D/wa6kM0dUNj8ST235y?=
 =?us-ascii?Q?Hf5WbHdhrL7b9bQGFp50qsWnCB3WXSNfwjiTYPxWaurwDS031BuefKHdoBwT?=
 =?us-ascii?Q?QiDNn8TTvetvsr/G2FNaV2gXDeGWfCLyxaMB4Lo4Kz8C2fpOcHcMjXORtV/z?=
 =?us-ascii?Q?kDXZ8Xi5fT271BwqAeTPO1u6BjR8ZEHb6Rl8qmewYyhkx8s3ihc6LdCPHvT5?=
 =?us-ascii?Q?Yogca7hLxDHjyqzWtZXJE4+HaSNSpVHQoVPcMTT7EUFc3QJQJ+RlVkbOoBOZ?=
 =?us-ascii?Q?lKyHCBrw1rSggyWRZiVUwNZgDCd1LxrPG9yKkU4S1Sl3m+X49RQtV34S6LK4?=
 =?us-ascii?Q?LLcvFTL9Xd2nsUTLOKxilvcqDaD1t7aJ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NgrbhJSi/IpxBUp9KM1+kiGl7C1cD1fe/8RQcT/QdAGKzGvIeYOEUlFO1K+R?=
 =?us-ascii?Q?A1B9vLyo+xyoal0343/PMOGZABGhnau1uX/oUvB4T9Zj8Vd92oRly1oYD2XY?=
 =?us-ascii?Q?VLD37SCgtxS8oEd44KUPkTnAoD2unAfDqeFrKPTp6kvZAJJrVAhJJCF/IBay?=
 =?us-ascii?Q?FoiiLt8CZg3MANUAvKfrCVlKXXmNBzhKKrSkQStBVvgCur2QxE8Wc0DRGCtC?=
 =?us-ascii?Q?UayprstRKS28RGa0bP0XnyXa9ZZyDttjn+d0Ei+4TBvVJah36C/dh8J9TTGW?=
 =?us-ascii?Q?ARFUrmb78ipglxZdBWRMv8MqdNxSshyGDwdrlIWF7E7rzW8k5qNXEOLAueSx?=
 =?us-ascii?Q?tYPWVlgWeFu66Yq1bp5BpvTNwR8wWPYHlvdHdM54E+uhztbeXrirz5TzswT/?=
 =?us-ascii?Q?+rvgGPr59ZJ6levaDxD8zveG60tpPLCZoQNBZx1D3Nj8Z+3jm3uCZKRp523L?=
 =?us-ascii?Q?qGMLOT3oluM12HLWLoJRZyXuYyp/48dRG9rmjOf29SEfoYQDg5bpBxuucgTa?=
 =?us-ascii?Q?ccJuee9sfGwaT/1PYCibSPL4fsO3QgYF5xV6VG3YGRfDK9dphb7kOUEhaB0i?=
 =?us-ascii?Q?YzoXIjT27w2j/V7syG89Vn0hLtiQVLIDsJ036PVm3NiGVaJYV0B3oRuul49n?=
 =?us-ascii?Q?2n3gJ5Zvr19jOlESzhbdp1jn0nmz4UrLM3n6afxAc5qnWj2ubQtGJmgdeFWu?=
 =?us-ascii?Q?o4Ygh0gBapTTxe+2Ah0k/qnEN2Uee6QMpRl5rBS5G076y4VXWgl2JNF/7RMK?=
 =?us-ascii?Q?Z0HX6g4bN6dPrUqOlinU9qB69ditTZpaTveqw87blv59vlsfDl3kN8J2J7kx?=
 =?us-ascii?Q?BhE3sA6bYTf3athmhW0nvc1Pp1ChZhspuKJqS87pxEtq6Bu15mF45cDjPhg7?=
 =?us-ascii?Q?C0WQrPgi2vI8T4RABYuCHWx+PkMJpAdlY0LxFTZoZ/eHQluCwFLGUly6ezqc?=
 =?us-ascii?Q?ZGAENgp5YCMdEY0MEwyEzKGMogvc4PWwqhOpkEQTRj5lM8MESrqPD+uO0moQ?=
 =?us-ascii?Q?Glh5TNaEvTV72VoSEEF4T5XPmH+1wsdPHVnwRpp5QHbHYIE68N4FGWtlm0gx?=
 =?us-ascii?Q?oIzxAEpf+suv496RiUrPDJLTT0b9zpe+OgVfdv5YqHt9Lp9ZMXsqjyuzH0fV?=
 =?us-ascii?Q?oHOmvSb2A8SVTQPPA1c+rRbX+AujWrgP3wOFkoRIgHrE3OTVQX528egbnNMM?=
 =?us-ascii?Q?KmIoyJSpnWsFCZ0ZWs2LIDw3rrkpGvFZUhjNMFOgm7nzyCbye6oMy6hpnqCf?=
 =?us-ascii?Q?0ysLJsPa+7x9BTKdTcmBUknIsF4/QMwc7J4wZdZXVSaB9zCv81oLJ3108fhP?=
 =?us-ascii?Q?tltqadZ/6Fj1Cns4zeMDlS+vKjgqaQMsaUqt84lFY87Uidm68nNr+8Gb/JRj?=
 =?us-ascii?Q?7xvg03UCXqq7J+pbXGHFfY+2+NYgpvEjjKDGYnSDqti98tEF879TMTX9QvE3?=
 =?us-ascii?Q?9S6LEJkv6/T33okDjunqXYA+1Gkppdx9Aia9V6DF4fjxcDTndNoTZQC5uoYj?=
 =?us-ascii?Q?0JgetMdG9DYG5+ZB7VWRUB9RVlWvq9zdpaOmCObZpsDBwQuqkn30PycsunIc?=
 =?us-ascii?Q?3YWesZ2R37TDL6nH0kCQu3pI0uEaLyKj0cXMl7SQMoZ2xcGXLqZW51kNrrUl?=
 =?us-ascii?Q?NQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eef2f7cc-350b-43c5-182e-08dd207b8b5a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 22:21:55.0666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HXeZ/SBlAoAU7tQw3lGodDZ6oz5UIz7qF3pQ2/ObxbqbHnHDaSIpCmOXb3WHDaSf0BlpYxfvcjKUHtsuDtRMTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9759
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 22:22:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208960

The upgrade to 1.38 re-enables the dev package [1]. With the dev
package enabled, the file wayland-protocol.pc is filtered by default
into the dev package, and the override adding it to the main package
does nothing and is not needed.

[1] https://github.com/openembedded/openembedded-core/commit/5de187aee675a7=
8fe59620a3fb64a5da5ae662aa

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/recipes-graphics/wayland/wayland-protocols_1.38.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb b/meta=
/recipes-graphics/wayland/wayland-protocols_1.38.bb
index 3e628ab113..be6b732b1a 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb
@@ -21,7 +21,5 @@ inherit meson pkgconfig allarch
=20
 EXTRA_OEMESON +=3D "-Dtests=3Dfalse"
=20
-FILES:${PN} +=3D "${datadir}/pkgconfig/wayland-protocols.pc"
-
 BBCLASSEXTEND =3D "native nativesdk"
=20
--=20
2.34.1


