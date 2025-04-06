Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1656C369A1
	for <webhook@archiver.kernel.org>; Sun,  6 Apr 2025 16:49:42 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.40])
 by mx.groups.io with SMTP id smtpd.web11.28094.1743958180083281429
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Apr 2025 09:49:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=X3hIrUk7;
 spf=pass (domain: oss.nxp.com, ip: 40.107.103.40, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LSAlDyujekGqjJDbiMw9vmhTuaEYIZYkLHlH6C0Vdk/oUHqhBHV07m87cSVeMsV9VPF0FoUYNqwMZ1XCRv+N0BVAzO8w/tJuvh+XdAEIfaFBTN/QZnJ2qRJ363Hk/V3B6aYcyPcQPFJ3NT71z3SVqlvKlquCef6rnDcdsoalTEqmGJVM7OJR9CLvTZf03mmWcPI7KETuo0c4nledAqzD5Nqme15p2OCIjlCtRlqaMQ0LKeyOq7rXt8TFqTwN9Ij79fbCz8k3MasdvrIggn4qrmHyxtZU7GY/I8l6BlUK2RzyUXWIXXQoAmx0eN9dzAKf0/Lca3iPXLvJCMzR1tIDoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sfiapi8A1uopjiQGjIyiV+tFfiPhGA3JfwazFGi1nWY=;
 b=a6vkDfbZnj3HsYWyTduBjRC2yHwfH7zKJ0xrSGroDTHncJ1pEDCCUMffG9TF9wvYp7/ii7daTF/7VwQAi79sSBaFTn4f4AVJQ4TwSh5INRxqOOfDROfM/g2kWeuQyFCXvkECicRRStlpKo0vhZYF0LhKTpEJL8COG5FstohaxdZo5VZ8fzeqgXKDOyjEiWYXK+R/tY+iEmj5UraQBz01q49HE7/7meJyDLs8VRl0K6haS/q5/TI79u30PbD++xogxoxB2o8adtahKZfpukFXkcZrtMjEzYEO7NDRT0sp+pSffnwhOAIul7zEg4ZzEomT2nLld+0Fye8LTwm4TZJEwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sfiapi8A1uopjiQGjIyiV+tFfiPhGA3JfwazFGi1nWY=;
 b=X3hIrUk7nN9jeD86BbQ3QV9AtUZurHPfXXDfihYu5A/3ql1qQH2YFHHfhKokV11Z+q0eAdLPUUyapvFuWbT0IcxZSh8nL+geKdLZZdXRyH7SMIxLaBtKhOg9tfUkyGnaTK08awjIp8w3vOW+SAW1SUOOc1sn47/XywGO5+2V2MSPGtJmRKpHdvw1BI8imgNNB7rwYYw2EesttPEcF+AhR9oL4jZzfCSevjIqgW663rX6GcCBV0N2KQWx/BqwDjuC+H0wl4XZdd1Fdke0yrU8RQ4jujryucvge4xaHUFJgYCv0/WMpy+WS7eVpHgvc+jSW+5v2xmu0j4CNLa4SRaabQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by PA4PR04MB8030.eurprd04.prod.outlook.com (2603:10a6:102:cc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Sun, 6 Apr
 2025 16:49:33 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8606.029; Sun, 6 Apr 2025
 16:49:33 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v4 1/5] toolchain-scripts: Add Meson settings for Yocto build SDK
Date: Sun,  6 Apr 2025 11:49:05 -0500
Message-ID: <20250406164909.270945-1-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0021.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::34) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|PA4PR04MB8030:EE_
X-MS-Office365-Filtering-Correlation-Id: 04de87d4-1e3c-4861-cd6c-08dd752b01e2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0ctEOVmazPC8OnKA25j6j+epvpRjI9Il0J8bXIR6KuN4LM0RtG7aR9WiIl5l?=
 =?us-ascii?Q?ajXKxKBH+mNGk2jr1y79q8ujpaHJeT4gDQohWmg5QOMD8A3RFKESirEYVv6A?=
 =?us-ascii?Q?DfvWVnbLKSNDkR6UuMiuX7+G5J+aOSsRdLT3X3NeBrBBAHW92LNtg9oFCRrh?=
 =?us-ascii?Q?96gcc5OhcQvUKBy+U6iR3XExWXnObPWTzWFvkFk5FiElkqhxYUgcfsU5vI6a?=
 =?us-ascii?Q?MomO2zUJkYHh4l163zqQhJ+iZ0S+cBtkDaUdMSWEXOUAiZO0ab8e1YyjOkl+?=
 =?us-ascii?Q?Ne0TdEYn/Ejrufg63GFAIikix7wFQ6W7IsWRtKZaPfUPc3/KrprDzsw7SX6x?=
 =?us-ascii?Q?uF+ng1As0D1E6GL+QRg3l5ukqWN6kT9crGOTmQXMK7T7N0wwUw0Ha36dVSV0?=
 =?us-ascii?Q?lYrLpfUwptXwriGHliifzrML6Q7AddclqmApULZPviKUfhaSHCgQ+FTdbzUQ?=
 =?us-ascii?Q?a3TxdARh+1YcjMgSxt4iCwk/ldw5AhHB55FDuobrXsZcEmQSdTeAFzQVKJn7?=
 =?us-ascii?Q?S+eFCpp1Owg+w3raXFUo1FP6gcPkIX7IGSgelCv2+rvRvdDmcTrhaiLmQKRr?=
 =?us-ascii?Q?X0L6QJbGaIVihrmRs3OvD3cInMXZD2h9+I84Y+40am1yWSqJpJ6j8Xlsia1s?=
 =?us-ascii?Q?N6cksE44ZQf2QvygNPWcxCYAK2ctSN9VbHM7KWWZkNE4EcZh0VqqWAVnsWaV?=
 =?us-ascii?Q?FVqfhUkuMdU6kkAlVsJqjRJdsp+mefk/EHjdHTC9ExKJ4/w8qzdPWMEmKMnV?=
 =?us-ascii?Q?qmUaiMNhJ6yWnxs4rfq2IPRZSJXhH99TBgGqK9yevF5Tht7P70F7ryDAwsOL?=
 =?us-ascii?Q?Zt6jQp5v6QxIYgABRBj6gZo3blP+rfiEep+vcLNkG0HZXHZQPd949aKPrZnU?=
 =?us-ascii?Q?zEZH3xMZPj0idj+xNYx9kys0WqGaJ0NZMZBresMM4dU4vgnPr8l5pCzKMoWE?=
 =?us-ascii?Q?96H/ajnsAdqXiVjOOASWL82xph2M9QHrl3cEcMXDDDAX0Ge91tbHdY4kO4Ws?=
 =?us-ascii?Q?8gengddmHhvFKeODEctSiz45FdKr68A8GKJfLhwMAHUPlS26JIB9/PbzczSA?=
 =?us-ascii?Q?ibMJEhyB16mjBsoKQIfv7NADfSRHOphOZwFzGnbgGmJlPChBwwqYtHWes9L5?=
 =?us-ascii?Q?CUHjVClxFpzIfdQY1Uj3sI5zOp5YhvIVGV/OjYFPZ6LY60TYZ+AtwURHOH8J?=
 =?us-ascii?Q?SjYKCpJGWMvaPzoUKmp0HPDWput0OEFMBlP+pc217PqvzrlCtLIiAJ8vPepi?=
 =?us-ascii?Q?FeNyrU9lIRAKtX9OO4/KNRFwd+lWkdlij9dRvbnR5Qx12tUNQHcdbYpXTb3U?=
 =?us-ascii?Q?E8YsRm/YLNvjhaIgYrVD1zfhWeBHeXt8cPIG2j10QTmXaT+nB2un6P0FAjAf?=
 =?us-ascii?Q?vvpxAS/tckEaTJwXrjqoZgL5EMEOHzuSb8TnnyluhyS12W1mWcW29UN+rZET?=
 =?us-ascii?Q?qImu5epwH75yPo980KcfwFQtM9Txp4fR?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HXiX6Rdt12uYE/BOCT8g3LKQ/FVk4Fnh5xFQW2nSWQi2NeDTUi9P+RSFG1No?=
 =?us-ascii?Q?eZO3wVd4MIADZ6XOVsuXHkXAdRZIwfGgAmeMgsvgvnnfNdyXUUCzmJFBlgXV?=
 =?us-ascii?Q?ObtIRqNzialTrmbF0SxYlcTt0q+Uz2KNAxxac+iti/O0Lejn3KWw3fojnFBU?=
 =?us-ascii?Q?xI4Wb8k26HEXNTmCNPrKfpn+/CWAGNlf2yOIR5lTWeWCAnv+sp8PWuvaRMK8?=
 =?us-ascii?Q?w6ygyzD876UZDQb3gAiAu0knOrEM6BASJX0IDyWdUojIg+MwyMgzzrM7H1tT?=
 =?us-ascii?Q?xDbNJ25Ze31DfK5v9HAd46270KWK8sF2+SgC94wgM2BmfuQFvSeko2wHSZDM?=
 =?us-ascii?Q?UpEVNoM/gHorrxRCKwBXX3DZEnRniZTI2s3P7ilZTq/YwOoEBLKzPWX74eNA?=
 =?us-ascii?Q?/7Ba+8lJwBJ8A+R96ylNXpZAVdabkf77KzLk4Pu7Yn7ppTNOUq5D9ykQpRWJ?=
 =?us-ascii?Q?sj1W6vgalrOK/TzmJoIN2HgBlcA6Jq/WbLnTgZD8BZZqRDsIK8gVuL+SlQjJ?=
 =?us-ascii?Q?TQ8rS8fEUoxoLRwafvN1FbOss+EQbMetQtH3/8lO1+KH1iyGz+N80hFaAb4r?=
 =?us-ascii?Q?JzNdFF7oTmdw7xvqxDmZ/RvrNLjWQQG+uiXr/G20FGsIY7B8cjoqKLM1aB6l?=
 =?us-ascii?Q?rJJgg/C0/rClCVtJ7H94RngEoDuyO8Xa/nOj8SDWmhzRDgsBX1KDxSqN3U3p?=
 =?us-ascii?Q?nWVo5M++z7W4qgsJn3f48+svOUJcuFoDHm1ocrusJmLT032wLBWoYGY984mL?=
 =?us-ascii?Q?fzpF+mmd5JkPCp1Rs6YQ8JMkJ/ULIudj4dY2u+nckFW8gdP2QDBoGyFyQmrm?=
 =?us-ascii?Q?5W1JXuPYl3nNU8Gpcm0EyW2jOgcFmT3wzmsCZ4FzsmrwULOQNq3CAEpYhIwl?=
 =?us-ascii?Q?YNej4XAVWpOolcfrX0mcF8RESUT9PwSJsXJ005qkA6mPjt62Ig1NCzLrUL6b?=
 =?us-ascii?Q?xCNku05xLpmy/iw4i3DaPF0wK6MB+Z8HT2VxUS97etQFNkzf3hAvqqfdGUop?=
 =?us-ascii?Q?Ml+FMRU20E6NTIdGY6/fC6uFEOLetu4uWwo5g0670PoDpIFcW17cj5uJTjeh?=
 =?us-ascii?Q?UtR5CGK4E7mlhbeSk39qnyQp7/q8XEkfEMzWMcQS89bCzh1mz2Asw+rN94ej?=
 =?us-ascii?Q?6OWWQ5sgenDsSREPXp/RnAc/G7LijOO4OsA5y9r+Mxj54fU9iThXkyYkdmsB?=
 =?us-ascii?Q?ZEiGld9wcdKfPESnzQ0tobPNZpK9yPTTk579ZTyqqUs8Vro2p/O0Ua4cjypP?=
 =?us-ascii?Q?A1LXVmnwk2FZZPTA5EoBkEE1UGtDopZ9aaOfhADP2cXmLk+YJpuO3mvp5UUF?=
 =?us-ascii?Q?Yo0yIehiiFnUF1WLptERUOvo0zDmyMYe+lDv6JaJX/0qUy97wtmYT4p1MBGT?=
 =?us-ascii?Q?KwSk1B7vasJSLC8duF/y9S7ijFycc02t1V4XjY6VTU66tpISebg/5CzYWetW?=
 =?us-ascii?Q?0TeGmQ+eZYBFMw/mVG2NGJhpxL3R2TtEZstEu3y57RnI8//aQrfZ5HM9XKHc?=
 =?us-ascii?Q?+KXc+6n9QX6G9Lmx5ztUK3qN1eJTcrSh3YKhc5uAo4b0itGoXmD2COnoGwEj?=
 =?us-ascii?Q?hn3aKJPM4GWWhCR7HU17DqyHCRvaoplI8bmoDtuu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04de87d4-1e3c-4861-cd6c-08dd752b01e2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2025 16:49:33.6348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qmDhe38C6334QZ4nHMVRSLjDFyMbT5wXipBz93pkjRBGmQev7BOayAQ1F6kRH0XlB5f7nCYnrJpmWSd8eDNQyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Apr 2025 16:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214385

The Meson settings for the standalone SDK also need to be available for
the Yocto build SDK, a.k.a. meta-ide-support.

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/classes-recipe/toolchain-scripts.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-r=
ecipe/toolchain-scripts.bbclass
index b59a295abc..9e4320f876 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -99,6 +99,8 @@ toolchain_create_tree_env_script () {
 	echo 'export OECORE_BASELIB=3D"${baselib}"' >> $script
 	echo 'export OECORE_TARGET_ARCH=3D"${TARGET_ARCH}"' >>$script
 	echo 'export OECORE_TARGET_OS=3D"${TARGET_OS}"' >>$script
+	echo 'export OECORE_TARGET_BITS=3D"${@siteinfo_with_prefix(d, 'bit-')}"' =
>>$script
+	echo 'export OECORE_TARGET_ENDIAN=3D"${@siteinfo_with_prefix(d, 'endian-'=
)}"' >>$script
=20
 	toolchain_shared_env_script
=20
--=20
2.34.1


