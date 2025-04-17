Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE5BC369D2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 18:10:39 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.34])
 by mx.groups.io with SMTP id smtpd.web10.15636.1744913431181441892
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 11:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=f5/qh0Sj;
 spf=pass (domain: oss.nxp.com, ip: 52.101.69.34, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KiP1mvvkF45Pu7ZcZp7CL7Ykf7a9FQTRCPtWsDsZ0/s6c7T0i+mZyZf+q0TgZs9fLV8IgqoX0Qwyli1XJdqhSHdonHk3I+ssJLmhguFRMpvpKW9Ytbe3d+XYREZK4Y94svdYkO5ZakvTdF68qPrcMismL/HLr+C/3k1MAlEsWzI0Wb6mOc3QHtLSECuNOrBDeCPpXH3MIwvzxKnGbOHWP/+kIrevyRp/6La0vWZ5juXogfGgeD8ixpXV6F7jtC2hMVtGe/w5WP/vIgkUw9+m1JJQfnXpg3ECV6eTTaJh56mfIGEbr7BsvJQfoPZ4wdnw5vS02xtEXdrWsO4pHG+q6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BN2bkbn0SV6FjesfBQ3SCHkxhA34PhUiX9xw2V3bCSA=;
 b=qTOd2M7DXmWkR7FDOLD/v3XkvVXZ2NkoRJcE9w4hsbh/CZ8G4S9UCW24U4rGUsf/r8TP19dXtUUNZSftztlXc0KEYz7lKeidGitfq5re+BxpEBhHsE9nUyKHNFCT2Y6JbLAfGf70hYy1RBQZM88WWF09Lfz9bfSJYK1Crq6e6tBK4GTwTZN3HrMsZlrdDgvBJqKMJh9VMedUZSDeVJ8DVOc54z4HagmCeKRla7eT2gBErWTbBmNkxGyvf+hFzRTmOqmuOJZNu5Z4+tr6exTRiDnCqbgt+1itZ+xw3vpb5GuFrk38FVTM1Qz8eMHkL7juxLbDERr6K9MI32rq2H4Csg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BN2bkbn0SV6FjesfBQ3SCHkxhA34PhUiX9xw2V3bCSA=;
 b=f5/qh0Sjshe0aWA9YNxL4Q8El5Gyd+/KIsUFG+joaFHryxjZZ2ArBABvE9H6rpjfbgKEPm6vr/Kifkz1RZyeuD21YJtF8eGo6gTpGKfWD6M/XKWpDkutxW1py0IOVojMltKTnRCsNRhagE328PoMlFXgZShZ9ai0RxnzbWwCrt4Wz2nA4tvlSf69atx0aaAEVGN4SEUv28fjK+Ua2v4/bkXGDt/vL9fGwjdIHmskuqgvH0an183UJaBB49JSHRfHfvfmBBnhqqUl9qXG0xEnpfifIYkRf8f3khwaweNhTQxd9RxkD4BU65/jjeLIMAUg980pm3m+It5tPx6NqPNt+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DB9PR04MB9497.eurprd04.prod.outlook.com (2603:10a6:10:373::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 18:10:29 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 18:10:29 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v7 3/7] toolchain-scripts: Export meson settings for SDK builds
Date: Thu, 17 Apr 2025 13:08:30 -0500
Message-ID: <20250417180834.1722588-3-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417180834.1722588-1-tom.hochstein@oss.nxp.com>
References: <20250417180834.1722588-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0147.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::21) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DB9PR04MB9497:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d53f771-0dc2-4eff-0927-08dd7ddb22fb
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?sOrNbvqviOrcBAwU+1qacqK2hG9qLoKUiLXwFqCmshMkX9/8WPdDHHJAfAew?=
 =?us-ascii?Q?GYllDi06hua4+hAIkHYf0TE/tAVsgHKkIKKqQuGZXzEDf3+w4Dubjftlqx/C?=
 =?us-ascii?Q?f1Mlukplk7wS4HVVOiccrsvx/9q8ZM7hkdRD57P0BWUN248uWAO6zMLxwPYZ?=
 =?us-ascii?Q?5ieQ0MNFOlR+vq+ioyDXQoPm+TAwspb5HPK8OVO5Zcf+XKEwNvvnD/5O1MUq?=
 =?us-ascii?Q?d8+f8igi8ig5qYLAmevb5k5getXTYwXJa6U1llMYZUS0P8NB7tS+VEBcI2dq?=
 =?us-ascii?Q?5CzncGBftYNPPxhwBaQtgTpv0GmkNiKZBdBuEekyhhZ18dy70Vgp95X8yITo?=
 =?us-ascii?Q?YUPFUmeqVDV3dojlTHoqxnsw+I22jLtd9ZoYbeoHzgJ0fMZArd7dxn1HupRb?=
 =?us-ascii?Q?soFDMU12q6nvLVvig4J55logBEC8ins3g6uPvEo7ycqSc3tSIxDugScPZNp4?=
 =?us-ascii?Q?9FWHhH6aCy4bIBTY7Y9dNrkaMXqSPGsIokYZWP3mmhI0m0CXcbk5mw6kcNqz?=
 =?us-ascii?Q?ELncIKDAz+boZg/CIPoHLLFkfJRIuQM9cRGbRJT1KStyJG1Vo64UHmNw00qd?=
 =?us-ascii?Q?nrwRhjNCU2bp1HTclEojQVA8cTkoJd3Xl27TKCsa+JGRd3veuS/Za7DoEDNY?=
 =?us-ascii?Q?+UZYWqzA6GGjpAL9ubJxuYE1Un8pO6sitXqPwSU47exRJNhRtAjZQ4glAFV+?=
 =?us-ascii?Q?NgsWdsaSDRNnavWx0oPXjOhxNE/sTfR4Mmg1fHaHKe1ln5LKXRAtJ34VP7bq?=
 =?us-ascii?Q?HMrtOO9PHPs2xfOaKf6h4mLpB6R/z6R3n6FP+JxB8NlMjNJFTTXJlTcy9pPh?=
 =?us-ascii?Q?vNazIzbtbsw883ddIWFCYgo76eqt2RpH2Cl/n0S4SJ3wpyGnt/kCQu9Izkd4?=
 =?us-ascii?Q?zyitAggGMnjCTtDiIJoxMwE41927x/SpiVt/JLoiBqVfFfwv5b1USr8gIE6B?=
 =?us-ascii?Q?Aw2O0H90KhyWCFsgvOtl0Fl1/+MYkuK9xGOJDGFiKFigajR+MPTKgLbvXjpt?=
 =?us-ascii?Q?ChwgjPPK0hK5gnZnJBrMTL2qfzkamCkqHFOJ8k6mXlABYqDI5nbr+tiVxeKI?=
 =?us-ascii?Q?2q4TY9jb1+OI5b/mOBjSmAnUgJEurQSdXUv0GyWmRU+KDAsBewBtD89+KTnC?=
 =?us-ascii?Q?7TGd6G9psIjGhUhsMwqDPBr2xnUxqvyiRwGk/HAPUw6X4PgMQRTdR8Lu+O2r?=
 =?us-ascii?Q?7QFr4d4kquaC4KggjfLD4bSCF9YTTnvvKzCfLavg+qWs3olQxY10ceYR2JKV?=
 =?us-ascii?Q?mzBkANRYls4YfsSIjZx5iiADbqWgJU1BEgcOeP0tYuRHpWeGLw3aGqbuB1cL?=
 =?us-ascii?Q?L2hwBrDqISo0Mdvj9zX28IQHECqFlhySrsAHVXBtNWcTNodIg0F8ZCutMupl?=
 =?us-ascii?Q?2puVRORhzjyFYtSCs0e7xLXuWLFGR/+Ihc+lZ12RXD/iqxk2y9G0gRzz5Mx4?=
 =?us-ascii?Q?nMCKOjuBi28=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?b6Bob/GX18xXfrsac3aK39bQcfzwTbdf9SlOQ0YQSYig73av5XaKHAQ3Q4fs?=
 =?us-ascii?Q?lkyeHO6s9WciocAWTszmnT1ZfzTcelUZMXEWSmaa/QzQ+nvdtR0Ml8dLHSSz?=
 =?us-ascii?Q?9fI6aOQ11T5WHDd8tuccBbj2KNNzAYR0qbdw5nhelFJNaIdKVvy22dOKWtJE?=
 =?us-ascii?Q?fHPqzN1p7mFvICNXBicXoln2ue0X8RLJl3iEv1DIxKBTJ4ATfXem6439oFRB?=
 =?us-ascii?Q?YJbPuiRhMlRRQhplzJLSt0SQUijBygpbgAMQ3wfN2waVT9xc9iS0nNNT5AUO?=
 =?us-ascii?Q?iWgFDS46J0DJD+NI60DUGtrJhX9RQykQm95oxknmND80rMHv8VQdT8MYptH2?=
 =?us-ascii?Q?VECsMu79cm++bubAsIuJ0TnnxofC+/D6aCI7DepsBaS/m89cfbOXE1U5okek?=
 =?us-ascii?Q?I2mRZhR1uWHuQ6kl3ErNYCiz+j2rP2Crm3j7QOSyiz5WbauhMaDLuI58SH+A?=
 =?us-ascii?Q?pntKGLXUhTl49tkdoY9Oi0Ginf237uixxE1hJf38zA8mskUDOe5kCU7xX+2V?=
 =?us-ascii?Q?ufchYZdDgQ9R0WSFKpuPQTDGfWvgzg3kgGExW03frcTCf+fj138VLb6kcBUD?=
 =?us-ascii?Q?C8cHC+Zr7peQLTbofjTo/arenRYkvMxzx5Xr15keGpSrH2JpWXujz+9NSPNd?=
 =?us-ascii?Q?NjBvXonRD9oBZklN5v1FqKbFuGbbkZEcqS5joR7LK3J2s21p2qqO/xHbUdYy?=
 =?us-ascii?Q?Wwb0W11RuocVoCYyOgHwVgOTFqWaZXIxiuhPm3BX1iwjJ4g6qiEmtqW/qerq?=
 =?us-ascii?Q?M6Q9xPe0WZpJx7TbR91ct/8Oy2I/J0ao8lJLnajYn80qPc27My21hFOLsrfX?=
 =?us-ascii?Q?BCyQwFpzDwa9TOSWLRU2pcjMypUWepSR6mnlTWO8S+Ht9rrZxIOyTZHU+ZCk?=
 =?us-ascii?Q?M5J1wtw9LfOK14910zipnZbSa4IYDOw+Y/ipalM+2bYhjooJIHa67jK4ZG3o?=
 =?us-ascii?Q?Ootb788ocsEQrFqkX2fQDczkh3FfHbbpLRdiMdiFCDUHcd9eW+lkvfU8B8pP?=
 =?us-ascii?Q?Rhe+u9SzFU7YSVLmsvCqcAQOXFWXg+UtNQfx5c70Sz4xSs0yImwRa+625sPX?=
 =?us-ascii?Q?qPFe1jQE9wgHiu7jAfodJKEr32423xuBTPwVhREyEnrXPk8wysyMoSGDtVex?=
 =?us-ascii?Q?cVtDEAjN9kOe0/ie+akemJM7kRFCpB6tzbvc2lNvlsySP+XDLSCydyYyUgtn?=
 =?us-ascii?Q?gZ39NEfI0ImX8GKuvlaO80ufdgPqnkVtqM/o8wIntBwHxYRktTesRWCifUab?=
 =?us-ascii?Q?BETA36pdgsi4ns35iihJ8osw0B87EkdG+0Fvmnlt3VOzNN6bNlRDxg8YRTiw?=
 =?us-ascii?Q?lE5AW6ho6W3bMqei4aPCSyO4FyEpykI1G7Zy8tJ35tGFuHgEuLLYqEwR9LLC?=
 =?us-ascii?Q?oBj1YKS/z5Lb4fKbc6+iEZmDfuBU6HrEzyE6fpQE0vUk3rY/IG5LKFYSsKW3?=
 =?us-ascii?Q?KHBNSZubwf6tH/G1s3nCJFqP+FTm5OUpE0FLGfoNhO05lr/0iBq42E24qcP9?=
 =?us-ascii?Q?B3qogV/pIwQybFzEXgiLchYGI209JfhJiZrL+12CkW/W6iPkAWxy9oTeJfcS?=
 =?us-ascii?Q?f2wHe99qHQnnQGV/x+eN6GfXdlZi2ZVnL9BaozyEIJtT42ZXftu5+dirxSWL?=
 =?us-ascii?Q?Gw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d53f771-0dc2-4eff-0927-08dd7ddb22fb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 18:10:29.6499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rPSWUxnKHWzEeZYlpPqBdTI2mvnI/CZkkwoIBR+nAgW//wDEYqCt+UI3s49xa+3Haa9nTfDY0RkX2S8HxWe08g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9497
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 18:10:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215110

Create a new set of exports for the Meson `host_machine` cross settings.
This allows the target cross file to be created correctly from
meson.cross.template and aligns with meson.bbclass.

Note, one might think that HOST_OS and HOST_ARCH would be appropriate as
inputs here, aligning nicely with the Meson naming. That turns out to be
incorrect since the script is generated in a native/nativesdk build with
HOST_OS and HOST_ARCH set for the "build machine", not the "host
machine", using the Meson terminology. See
https://mesonbuild.com/Cross-compilation.html.

Fixes: [YOCTO #15485]
Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/classes-recipe/toolchain-scripts.bbclass | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-r=
ecipe/toolchain-scripts.bbclass
index 9e4320f876..3053cd0f1f 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -4,7 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
=20
-inherit toolchain-scripts-base siteinfo kernel-arch
+inherit toolchain-scripts-base siteinfo kernel-arch meson-routines
=20
 # We want to be able to change the value of MULTIMACH_TARGET_SYS, because =
it
 # doesn't always match our expectations... but we default to the stock val=
ue
@@ -72,6 +72,10 @@ toolchain_create_sdk_env_script () {
 	echo 'export OECORE_TARGET_OS=3D"${TARGET_OS}"' >>$script
 	echo 'export OECORE_TARGET_BITS=3D"${@siteinfo_with_prefix(d, 'bit-')}"' =
>>$script
 	echo 'export OECORE_TARGET_ENDIAN=3D"${@siteinfo_with_prefix(d, 'endian-'=
)}"' >>$script
+	echo 'export OECORE_MESON_HOST_SYSTEM=3D"${@meson_operating_system('TARGE=
T_OS', d)}"' >>$script
+	echo 'export OECORE_MESON_HOST_CPU_FAMILY=3D"${@meson_cpu_family('TARGET_=
ARCH', d)}"' >>$script
+	echo 'export OECORE_MESON_HOST_CPU=3D"${TARGET_ARCH}"' >>$script
+	echo 'export OECORE_MESON_HOST_ENDIAN=3D"${@meson_endian('TARGET', d)}"' =
>>$script
=20
 	echo 'unset command_not_found_handle' >> $script
=20
@@ -101,6 +105,10 @@ toolchain_create_tree_env_script () {
 	echo 'export OECORE_TARGET_OS=3D"${TARGET_OS}"' >>$script
 	echo 'export OECORE_TARGET_BITS=3D"${@siteinfo_with_prefix(d, 'bit-')}"' =
>>$script
 	echo 'export OECORE_TARGET_ENDIAN=3D"${@siteinfo_with_prefix(d, 'endian-'=
)}"' >>$script
+	echo 'export OECORE_MESON_HOST_SYSTEM=3D"${@meson_operating_system('TARGE=
T_OS', d)}"' >>$script
+	echo 'export OECORE_MESON_HOST_CPU_FAMILY=3D"${@meson_cpu_family('TARGET_=
ARCH', d)}"' >>$script
+	echo 'export OECORE_MESON_HOST_CPU=3D"${TARGET_ARCH}"' >>$script
+	echo 'export OECORE_MESON_HOST_ENDIAN=3D"${@meson_endian('TARGET', d)}"' =
>>$script
=20
 	toolchain_shared_env_script
=20
--=20
2.34.1


