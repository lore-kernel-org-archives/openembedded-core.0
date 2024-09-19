Return-Path: <alban.bedel@aerq.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59451CE8D5F
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 08:05:21 +0000 (UTC)
Received: from mx-relay04-hz1.antispameurope.com (mx-relay04-hz1.antispameurope.com [94.100.132.204])
 by mx.groups.io with SMTP id smtpd.web10.14426.1726733112129471840
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 01:05:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@l2task.onmicrosoft.com header.s=selector1-l2task-onmicrosoft-com header.b=TsdITKQm;
 dkim=fail reason="dkim: body hash did not verify" header.i=@l2task.onmicrosoft.com header.s=selector1-l2task-onmicrosoft-com header.b=ec3f3YIB;
 dkim=pass header.i=@aerq.com header.s=hse1 header.b=eFjiiUpX;
 spf=pass (domain: aerq.com, ip: 94.100.132.204, mailfrom: alban.bedel@aerq.com)
Received: from mail-am6eur05lp2109.outbound.protection.outlook.com ([104.47.18.109]) by mx-relay04-hz1.antispameurope.com;
 Thu, 19 Sep 2024 10:05:08 +0200
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=fail;
 b=mtuysTJ8Grdd2I2cy0G16eU9yIeHqzQMkLpoDCdR3CL2V3Vhvu5hpU9YUJOr5fxHb0HvNBNjs2lSC5x2an34TmcIMy9s1Vvk7kgGTUj+h7gQW7/ra8lFq3k9QZBtMEbcH0OvSpFINIeWT1cdzUZNK/y7DtSZy2o+GRpyFsGxhdoiBGRkMSBWs2JSOBIeoUhXhHFDcZq9NzDwyZZN2hdUE5KtUFqRnvUzNHyhIsy/eIjYg+Q8NMrhRABjqdWtS2HgTpcdBpXfXOXIkNuliYud0Z4cn9fj1i2kdRdKPGwtrlPCiFMrTk5dwa+5X9K1/LmjCLlkGi+grO3l5TDU21UCcg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6yx6K2Xv7XCUgr/9YNAJW87gFY8ikVKqnJM2HxGNoo=;
 b=d2V+8P2N1/lgH+OoH2ogz+MU3o1CHX8H6/gFY7YJBSlELKm1MQOwjkxj1JNfAwDxY+inMwKOte+ua1UaXoM3NhEmpiAW8W5SumBmpvGHtOZlJA+odbnRqLGyCqutF7rJ3D+iOM3w6QuMPMAH7ATpGhKalho9SW2X+QLO1YaWU0sTJufxBzamam5mHpKaxYXsy35Xnf8uawfGcx69McuScFVpRQyXCtInCEnsEYo4p3Ca8hZLksV8AwLQLlDlm43uVjChUKViBuMxOdoKkE9HFuwutKb9LdIGhcX3F0/0+aKs5Hk6+W68K8UbOUWCfBLO0tJXG8FP/Z0ZGXbSWUwtsw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.169.0.179) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=aerq.com; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=aerq.com; dkim=fail (body hash did not verify)
 header.d=l2task.onmicrosoft.com; arc=fail (47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6yx6K2Xv7XCUgr/9YNAJW87gFY8ikVKqnJM2HxGNoo=;
 b=TsdITKQmhcgRmDz/oeU9QUMv+POQO+dREGYpMqnowrN1x8ZFvYk6okpc4u9ihFELfAruLirD8CgcHz2Mx23gYrwNt1lYNyWjpJ+AKjtLBFb0FM8/NYgScUasyLXPCmJ1x5iMaWJkZODmbDNsRctxqoKwUDxqd0wzDgKcAF7fu2A=
Received: from DUZPR01CA0184.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::7) by PA1PR10MB8588.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:445::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.21; Thu, 19 Sep
 2024 08:04:59 +0000
Received: from DB5PEPF00014B8D.eurprd02.prod.outlook.com
 (2603:10a6:10:4b3:cafe::cd) by DUZPR01CA0184.outlook.office365.com
 (2603:10a6:10:4b3::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.25 via Frontend
 Transport; Thu, 19 Sep 2024 08:04:58 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.169.0.179)
 smtp.mailfrom=aerq.com; dkim=fail (body hash did not verify)
 header.d=l2task.onmicrosoft.com;dmarc=fail action=quarantine
 header.from=aerq.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 aerq.com discourages use of 52.169.0.179 as permitted sender)
Received: from eu2.smtp.exclaimer.net (52.169.0.179) by
 DB5PEPF00014B8D.mail.protection.outlook.com (10.167.8.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Thu, 19 Sep 2024 08:04:55 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (104.47.18.105)
	 by eu2.smtp.exclaimer.net (52.169.0.179) with Exclaimer Signature Manager
	 ESMTP Proxy eu2.smtp.exclaimer.net (tlsversion=TLS12,
	 tlscipher=TLS_DIFFIEHELLMAN_WITH_AES256_NONE); Thu, 19 Sep 2024 08:04:57
	 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 21285109
X-ExclaimerImprintLatency: 15043115
X-ExclaimerImprintAction: 32a01a70812646ea95c09c802bc004cf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dXlqRwxjBVvYdAXmzJwfUvgQ7CXONAeR+xrlwXN+hw3PpouOlt0szyuAGQKnrDpfppUsyRR6D83s+WmsY/E8KpvSHCkI3Eg8ogZNKpNa5aXUyJtDjnHDFd0vflQiieLhyQpwnClNGl50wMBny+rt3tXruRMQY6CWV8WSoXAQ5DbMxLuXsjkP3ewhgxvxs7Ws8iCsbaMEDu6/IWFABjapkEH6tA7Tg6zdCiwqRqmpQpMc4LFQBxr7s+pPsQzw0/9VjEy7TWL9EZKH1W0h4q78tvmxBOkJxkn5V+KY+EnE7sy/VMwdNu6B70VgIvthFTT3UtZ6gU1eA/1Zm7PNB1zalQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/iYjkYBff4ya0hU0l7xoZFdKACukbOd68t74HCNO/Zo=;
 b=EyW/S4b0fnymyvuFYAgzBIvqV+VqwzYgXxPxXbEUngVk2VAs3INSyIB3gbEz93rIj4u7OXS5cjngD6BWfJCM2euV5dnM+7oBAF19WImUcqrTiGsiaG6i3CoRi1H++4c1msZkTrbXOZJoqPzY2zucf2loUfIlvILo9kyJ04VPKCmVnzEupmBxykGs+CINOEfUtm4DIvrUQagkYWEFSW0SAV0CaXCDpuPZEjLvkw8fQhtrj2tsTa4DnTd2oZN3ic7EmkLgg70Lg6BE+YCWzG/2lLdAS/13Pk7OQ/t2v9DXPtni2pxVomy8WYJAdewL3bBTyZHk0bwnhw2xXNHm9BrVlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aerq.com; dmarc=pass action=none header.from=aerq.com;
 dkim=pass header.d=aerq.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/iYjkYBff4ya0hU0l7xoZFdKACukbOd68t74HCNO/Zo=;
 b=ec3f3YIB3hSMXn9K7nNEJAnQyg+xh3tmkb5Xy1w+JHHOpcHm7WZFdarBj60aZWT6m/+akdRUeU9CYpUDDoc1aQ03JXsVyzsQ9MgXwAIjQGPKWR50n1fMb6McsMUy3upR3KUiY3+rqJRgpWsih7k2YlfWSRn2lKSO0qjq0zU8GFc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aerq.com;
Received: from AS8PR10MB5000.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:405::24)
 by DB9PR10MB6716.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3d0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.21; Thu, 19 Sep
 2024 08:04:52 +0000
Received: from AS8PR10MB5000.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dfc0:30ac:94b8:c791]) by AS8PR10MB5000.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dfc0:30ac:94b8:c791%5]) with mapi id 15.20.7962.022; Thu, 19 Sep 2024
 08:04:51 +0000
From: Alban Bedel <alban.bedel@aerq.com>
To: openembedded-core@lists.openembedded.org
CC: Alban Bedel <alban.bedel@aerq.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH] bind: Fix build with the `httpstats` package config enabled
Date: Thu, 19 Sep 2024 10:04:17 +0200
Message-ID: <20240919080417.1184819-1-alban.bedel@aerq.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR4P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::12) To AS8PR10MB5000.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:405::24)
X-MS-TrafficTypeDiagnostic: 
	AS8PR10MB5000:EE_|DB9PR10MB6716:EE_|DB5PEPF00014B8D:EE_|PA1PR10MB8588:EE_
X-MS-Office365-Filtering-Correlation-Id: aca2c4be-ecc0-417d-ee4a-08dcd881c087
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|52116014|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?mADh7ynq38FwyE2QUZjtgUIuQoR1QXyXFxZ6amfZ8FdsU9Fm4qaYK+YveYPp?=
 =?us-ascii?Q?1uZ1uU3bkbagawFBICROglxecYCf7RjqYy+XY162mbT4QcpG+oQ+Rd/gZosj?=
 =?us-ascii?Q?4hRBtYh3PnUVmZQyrV5E00RM1UYTq0lqy6a1y9UKv0mvHlZIBAXEt21u7EB1?=
 =?us-ascii?Q?apDaOcknQqaF7bafMsaS3yZNA7Wd40Xxg2rk8KZGrrKQdcV5jZeUM2zHcuEc?=
 =?us-ascii?Q?y7ym9EjOoWg+Dvhd8p7bmSsC7NUhOMYrgtMoZybHqJDzNtaQGdxTMT8KgIRn?=
 =?us-ascii?Q?sAk2erjX6AyK8vCvuNlr//ATODiK6+OCo8RXyobVXJ3e+TxX0T+yT/BX6llY?=
 =?us-ascii?Q?qC9tmTiJxysWcuhH6YXEi3unA8Iwowjn+9zOa6HIIFCLGbWAKnN8zGHa7P+0?=
 =?us-ascii?Q?jnh9C4F2iEtithp8vpPKPvWeoQ2Qvh0wJ5SwhbIF7II6kQbT49+dwCTWSzTH?=
 =?us-ascii?Q?iMqXGbf+DOD2sP1HJ/QSZ9J/wGxHrRnOyr/MJE/7rArOA9aVaVnjdqKcNRpF?=
 =?us-ascii?Q?evHTeQi+MwqvzcwjptcrkpthRTF5hdbZ69E220eUn5Ve6b27iuM9EtHibGgO?=
 =?us-ascii?Q?QBHddBNIIA0PfxagDh10H/opWS2n4UjdvcOYWsvLX0mcpgo7VRRdk8tiNSy/?=
 =?us-ascii?Q?Zk0GBoaEAOghgn56bEiJFyQcBIQ0f8VuU4uoHoP1JUnzcs5bj7+Jy6z5cQ9G?=
 =?us-ascii?Q?TsIvXGZjPX92KWflPqL10SvcBFELNcFo+hBfVEFQ+zWQLWNobaWPFwrBQekx?=
 =?us-ascii?Q?TliXy4NalF7yrSIE9+cgiEkPm1R7zmKldFfzw7pAS24Jm6Gi8qY/cwNs8ccQ?=
 =?us-ascii?Q?k1APY5vteE4zg6z6YPqg7lho4es7Cw/FhHYvVm2uITs6LT7vXFupHWYgEWxM?=
 =?us-ascii?Q?YIKHL1Z43c5uaU1DRA3QuXPCPF5PFhYKs7mIJ1cNwXdKGKIwxS54SeZPzqUA?=
 =?us-ascii?Q?tAmXRnyeCCY5Jb5dZR1REEVBplKWzxE2suh4UGCYTSbzlbi0mnYZAP8bKCrs?=
 =?us-ascii?Q?2iRYTOU+Tt5DuVQkNhzM5XKWK611Z+JYQDXhhjnT3L+rMiyB7l/77P+InkcT?=
 =?us-ascii?Q?srIXHlMkmqvMM60YUys42E//auaPH7F0ovzNQn0v5iukukWnqy0Ir7LKyh0H?=
 =?us-ascii?Q?nVVdwJjx8C4QQm69/ryxiNyeZQyXYqjgJiVRNzNoNkxscHpH4dEun60dRRz+?=
 =?us-ascii?Q?jEP0WT8wluUT+jekeNPmPrpV9kCDso60wIihpG02TgJMzR/GN51PBds9Pue9?=
 =?us-ascii?Q?rFo20+96HqR2Oh2CtxDTOZ60eaf9Jyt8DNjNbgWvsyvQBu2ltG7LCmLqWooq?=
 =?us-ascii?Q?Jhs6VhE8r/LrVArZkYM10jvX3zltWUe823GJOkYNt+gxOQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5000.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6716
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	33a6e52a-9687-45ac-0d37-08dcd881bd22
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FZHRi9KywJdFyVHezu9U78k1q09mhl4owZXYu16qemPM6YBFmtlaSBo20WtF?=
 =?us-ascii?Q?0Z3Jjw+r/gNT661DINNhFLLPLNYJIld/AMiaCUXKNUU4gucKQzO1rj0IjGAN?=
 =?us-ascii?Q?siPzPS6Q82ZT8sQFuw/BnsF2DCRjI+3foIQfshbtxzk+kTXT+L/SovyaXWn4?=
 =?us-ascii?Q?GT+NJ8Q7Cs0008IUQw4HoLMd75ySs8floqCqPuOPabIy8K4IPgSOdAGY2zpq?=
 =?us-ascii?Q?vb2f/GoC9FL2cymeWRypOh3Z/AvVO3QtbwxeQxoznDbze7TsV407ry/mVrYc?=
 =?us-ascii?Q?zmN7AD5LPFV+TdfSmptcFL0l5iWZacWUvkCzH7/o/E/CX1AsM2XSgfBhRAn7?=
 =?us-ascii?Q?rSnLLg9z2fqf1Qpu+misCvVOVIM4CTGOr/xj3Nh2SfDY94v4Ixri+7u4xSNf?=
 =?us-ascii?Q?fD6u+4ZP9req//ujse9M+OWEBSMHGV0StmOVemlQkZ07DXeuvM7K8jvQ2498?=
 =?us-ascii?Q?erc3nwb3+HFhDFB9KauEMj5RuzEIlK8aEQ6jcV/tQHi1/GTwhYPUpeoOoilG?=
 =?us-ascii?Q?cz2uya2dSEpO35/ueAf+ybSmHtOwvPQYuGqczEdw2QjGJ+MYeheEgMK+CZp5?=
 =?us-ascii?Q?1OHvH56KAQDPuF8MLXVs3qkp3CFfuJjteif80desluh5Dv00QD6pAcXstP3f?=
 =?us-ascii?Q?yD9LfKZjAP5bzWMZaJP7i6UJK1DHhmEdtAh2Ja2NmYTKDqsIvJrhb3U2nic/?=
 =?us-ascii?Q?w1XRNC/zSWouifDOrKviqbqyoCNCaylgna/sEp9wHngAVhdvSu/VWedobfx7?=
 =?us-ascii?Q?X/liRvxXWhR7vfLZ9pdP9KzEr8fDBYdjq7VrkJiMESiWkkAahS6KlHmfHJpH?=
 =?us-ascii?Q?BpOrTG/Dvyy+2PxLIcQVS5zugxWfYfqDAR0Q8w+vj9oiRhYSY56SsqoJgmEb?=
 =?us-ascii?Q?r4cgUSLZ1v8n0M71ljV8MU8cH2hh6RGpYdl86MVJTNPRxQW4ezXm6RfoisfT?=
 =?us-ascii?Q?dM6PWIsmV1a/TfwqNxJZvLLXbkdRIrctrmh9jg+wN2ktnN5ZlvcZmUGkr84M?=
 =?us-ascii?Q?FwXO1bVWIov3PNOoW6AHhOQoIisE0evBdjOurFlTtt8BN8oyBSxo0X4Ok4MH?=
 =?us-ascii?Q?wwwqasRiVK0ica9357/uaDspDjpS3ZWq+8NS3lAXZIABVMQ4JPVv9pqCyOx9?=
 =?us-ascii?Q?udDxWS/VRQqQpEOwRxLK70vE8JsgU+p8+7bAW7QOyTBpZNjzVGO4DtfEO56x?=
 =?us-ascii?Q?bhe7n5zdI2e0BUNl9BnDZOgkjmZDimPbv5bZs9qGe9v+hggQwC/6TEVYfDTV?=
 =?us-ascii?Q?uU1de668NdqlaoTmcZrxjKilUyo0j7xMK8y7n43x98iXvWiV1XYYv3c1QXCc?=
 =?us-ascii?Q?yJ9D6ShwgNm7JcAWaGI27BghRn4OLFAdY4E+8PUcGzQ4hOJfWKvORhT0rdC3?=
 =?us-ascii?Q?xVq0PWwso+aRhHn03W4a5UiS6Ts1n8QksowmGGNNXwneDPrA4J+sC1anf21W?=
 =?us-ascii?Q?t1akvnJ83m07VdijshVkiSEphhP0WM35?=
X-Forefront-Antispam-Report: 
	CIP:52.169.0.179;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu2.smtp.exclaimer.net;PTR:eu2.smtp.exclaimer.net;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: aerq.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 08:04:55.6501
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aca2c4be-ecc0-417d-ee4a-08dcd881c087
X-MS-Exchange-CrossTenant-Id: bf24ff3e-ad0a-4c79-a44a-df7092489e22
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bf24ff3e-ad0a-4c79-a44a-df7092489e22;Ip=[52.169.0.179];Helo=[eu2.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB8588
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----800A6277570D7725A51F4DE1CC24D8A3"
X-cloud-security-sender: alban.bedel@aerq.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-crypt-policy: TRYSMIME
X-cloud-security-Mailarchiv: E-Mail archived for: alban.bedel@aerq.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay04-hz1.antispameurope.com with 4X8Sjq0xRBzRhnt
X-cloud-security-connect: mail-am6eur05lp2109.outbound.protection.outlook.com[104.47.18.109], TLS=1, IP=104.47.18.109
X-cloud-security-Digest: bdec6607000c68732ca6e1cd761219f0
X-cloud-security-crypt: smime sign status=06 sign_complete
X-cloud-security: scantime:1.440
DKIM-Signature: a=rsa-sha256;
 bh=sSqCsZprA8njEWD7+SwwwLz/0miLSPo4Ihwip24sNrw=; c=relaxed/relaxed;
 d=aerq.com; h=content-type:mime-version:subject:from:to:message-id:date;
 s=hse1; t=1726733108; v=1;
 b=eFjiiUpXYRskjQCZUqg56euVzXNOOdsjkAoCELKrCde69PHrQ62fATdktlvuq7WkO2wzHD8i
 TwwfIhW9IqZ/4A5wmAF/2SY3/nwwDCGRKK1BFdLa27HljS8sEU0WVxQQuFTmed/opYaaXKcO9J3
 VrzzXBMgmjdry2MXO9yDS8pkzYYX5mjq1pqfVMJiavEtIeX+aZaAGa1Knpk04aqUz8GVFs6uhNz
 mAFj22PsCEAtdDLKTPO7F+qmExI5OmVb35Bqn9lF1bVsxbJwYRvh8V9IvkMqGKWKVgnt43bqfFJ
 G1T6otYkXh2LKy5gDY/rDXpdEonJ9yCoa0hBXDAqfPQhw==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 08:05:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204658

This is an S/MIME signed message

------800A6277570D7725A51F4DE1CC24D8A3
To: openembedded-core@lists.openembedded.org
CC: Alban Bedel <alban.bedel@aerq.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH] bind: Fix build with the `httpstats` package config enabled
Date: Thu, 19 Sep 2024 10:04:17 +0200
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
MIME-Version: 1.0

------C65ED3E1A5DE826CA595746785F6AF6F
To: openembedded-core@lists.openembedded.org
CC: Alban Bedel <alban.bedel@aerq.com>
Subject: [PATCH] bind: Fix build with the `httpstats` package config enable=
d
Date: Wed, 11 Sep 2024 08:26:47 +0200
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
MIME-Version: 1.0

When the `httpstats` package config is enabled configure fails with
the error:

> configure: error: Specifying libxml2 installation path is not
> supported, adjust PKG_CONFIG_PATH instead

Drop the explicit path from `--with-libxml2` to solve this issue.

Signed-off-by: Alban Bedel <alban.bedel@aerq.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9b076fa51f5e6fd685066fb817c47239960778e6)
---
 meta/recipes-connectivity/bind/bind_9.18.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bind/bind_9.18.28.bb b/meta/recipes-=
connectivity/bind/bind_9.18.28.bb
index ca2aef233b45..4b0948298edd 100644
--- a/meta/recipes-connectivity/bind/bind_9.18.28.bb
+++ b/meta/recipes-connectivity/bind/bind_9.18.28.bb
@@ -34,7 +34,7 @@ inherit autotools update-rc.d systemd useradd pkgconfig m=
ultilib_header update-a
=20
 # PACKAGECONFIGs readline and libedit should NOT be set at same time
 PACKAGECONFIG ?=3D "readline"
-PACKAGECONFIG[httpstats] =3D "--with-libxml2=3D${STAGING_DIR_HOST}${prefix=
},--without-libxml2,libxml2"
+PACKAGECONFIG[httpstats] =3D "--with-libxml2,--without-libxml2,libxml2"
 PACKAGECONFIG[readline] =3D "--with-readline=3Dreadline,,readline"
 PACKAGECONFIG[libedit] =3D "--with-readline=3Dlibedit,,libedit"
 PACKAGECONFIG[dns-over-http] =3D "--enable-doh,--disable-doh,nghttp2"
--=20
2.34.1

------800A6277570D7725A51F4DE1CC24D8A3
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"

MIIOJwYJKoZIhvcNAQcCoIIOGDCCDhQCAQExDzANBglghkgBZQMEAgEFADALBgkq
hkiG9w0BBwGgggstMIIGEDCCA/igAwIBAgIQTZQsENQ74JQJxYEtOisGTzANBgkq
hkiG9w0BAQwFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCk5ldyBKZXJzZXkx
FDASBgNVBAcTC0plcnNleSBDaXR5MR4wHAYDVQQKExVUaGUgVVNFUlRSVVNUIE5l
dHdvcmsxLjAsBgNVBAMTJVVTRVJUcnVzdCBSU0EgQ2VydGlmaWNhdGlvbiBBdXRo
b3JpdHkwHhcNMTgxMTAyMDAwMDAwWhcNMzAxMjMxMjM1OTU5WjCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2Fs
Zm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdv
IFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQTCC
ASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAMo87ZQKQf/e+Ua56NY75tqS
vysQTqoavIK9viYcKSoq0s2cUIE/bZQu85eoZ9X140qOTKl1HyLTJbazGl6nBEib
ivHbSuejQkq6uIgymiqvTcTlxZql19szfBxxo0Nm9l79L9S+TZNTEDygNfcXlkHK
RhBhVFHdJDfqB6Mfi/Wlda43zYgo92yZOpCWjj2mz4tudN55/yE1+XvFnz5xsOFb
me/SoY9WAa39uJORHtbC0x7C7aYivToxuIkEQXaumf05Vcf4RgHs+Yd+mwSTManR
y6XcCFJE6k/LHt3ndD3sA3If/JBz6OX2ZebtQdHnKav7Azf+bAhudg7PkFOTuRMC
AwEAAaOCAWQwggFgMB8GA1UdIwQYMBaAFFN5v1qqK0rPVIDh2JvAnfKyA2bLMB0G
A1UdDgQWBBQJwPL8C9qU21/+K9+omULPyeCtADAOBgNVHQ8BAf8EBAMCAYYwEgYD
VR0TAQH/BAgwBgEB/wIBADAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQw
EQYDVR0gBAowCDAGBgRVHSAAMFAGA1UdHwRJMEcwRaBDoEGGP2h0dHA6Ly9jcmwu
dXNlcnRydXN0LmNvbS9VU0VSVHJ1c3RSU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5
LmNybDB2BggrBgEFBQcBAQRqMGgwPwYIKwYBBQUHMAKGM2h0dHA6Ly9jcnQudXNl
cnRydXN0LmNvbS9VU0VSVHJ1c3RSU0FBZGRUcnVzdENBLmNydDAlBggrBgEFBQcw
AYYZaHR0cDovL29jc3AudXNlcnRydXN0LmNvbTANBgkqhkiG9w0BAQwFAAOCAgEA
QUR1AKs5whX13o6VbTJxaIwA3RfXehwQOJDI47G9FzGR87bjgrShfsbMIYdhqpFu
SUKzPM1ZVPgNlT+9istp5UQNRsJiD4KLu+E2f102qxxvM3TEoGg65FWM89YN5yFT
vSB5PelcLGnCLwRfCX6iLPvGlh9j30lKzcT+mLO1NLGWMeK1w+vnKhav2VuQVHwp
Tf64ZNnXUF8p+5JJpGtkUG/XfdJ5jR3YCq8H0OPZkNoVkDQ5CSSF8Co2AOlVEf32
VBXglIrHQ3v9AAS0yPo4Xl1FdXqGFe5TcDQSqXh3TbjugGnG+d9yZX3lB8bwc/Tn
2FlIl7tPbDAL4jNdUNA7jGee+tAnTtlZ6bFz+CsWmCIb6j6lDFqkXVsp+3KyLTZG
Xq6F2nnBtN4t5jO3ZIj2gpIKHAYNBAWLG2Q2fG7Bt2tPC8BLC9WIM90gbMhAmtMG
quITn/2fORdsNmaV3z/sPKuIn8DvdEhmWVfh0fyYeqxGlTw0RfwhBlakdYYrkDmd
WC+XszE19GUi8K8plBNKcIvyg2omAdebrMIHiAHAOiczxX/aS5ABRVrNUDcjfvp4
hYbDOO6qHcfzy/uY0fO5ssebmHQREJJA3PpSgdVnLernF6pthJrGkNDPeUI05svq
w1o5A2HcNzLOpklhNwZ+4uWYLcAi14ACHuVvJsmzNicwggUVMIID/aADAgECAhAV
Bbr0bzRtpXqrU7KDa4UuMA0GCSqGSIb3DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEb
MBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgw
FgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENs
aWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTIxMTIw
NzAwMDAwMFoXDTI0MTIwNjIzNTk1OVowJTEjMCEGCSqGSIb3DQEJARYUYWxiYW4u
YmVkZWxAYWVycS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDD
bGac2SHb2eIa+m3KUo/AJiZDcBR5eFitNMqkBYGzLH3NwmL+2qbl5vKerZ+M3jaS
sFeMmr6P9lXTjSR4Qkcdv+ZmTUNTaJ/vLFqEgWx+sCszay9KK5TM5w4tpkCQLX1T
4Fiuans6EUUPZETMfjKBjLafMenQuGZdn/ul9a0DrkgsEe/qJUNnhsRXzY8zd4mm
mcTaiqI7elLXQelS7FUaWh/BTSjd6c+hFW8YvYxFLEsTp1di/PcBOlb9VgD4+/D4
zxHDQkfsJ7xiy/Xig3PbZmmhF/T4d9hab1YrVv1rXJqKbtjZyG7Cfsdwfz9Tsodj
HEFItk2dLR5ROV6LRWR7AgMBAAGjggHNMIIByTAfBgNVHSMEGDAWgBQJwPL8C9qU
21/+K9+omULPyeCtADAdBgNVHQ4EFgQU7sc2WNoWAgmlONb7GCP/BCyMuEwwDgYD
VR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQG
CCsGAQUFBwMCMEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYBBQUH
AgEWF2h0dHBzOi8vc2VjdGlnby5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0
dHA6Ly9jcmwuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0
aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYoGCCsGAQUFBwEBBH4wfDBVBggrBgEF
BQcwAoZJaHR0cDovL2NydC5zZWN0aWdvLmNvbS9TZWN0aWdvUlNBQ2xpZW50QXV0
aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAjBggrBgEFBQcwAYYXaHR0
cDovL29jc3Auc2VjdGlnby5jb20wHwYDVR0RBBgwFoEUYWxiYW4uYmVkZWxAYWVy
cS5jb20wDQYJKoZIhvcNAQELBQADggEBAF9U2htHftfPRwJwvN9bFBpXNA69+Em1
a4zxDLR77PMBkmc8pwgbl12rBuwJ9BzUsOgeCLfdCmQiurLsnGhrvGj1JV7L1s8e
S5vKKemLAnPZJ0czTzQeIGlLY0ZAvBWbgkjmWLpsOjeZmLOOMFLTDa/5QZzDXo/E
ZmvxqRqsfirSYWVzKWdIoIbpfBIdqMM5sj/p+L9vXDle3143c+orA+1L6tp/7Mw6
tFIzedrBWu4wv4XgGb5OuouhiBL8+fzVlsY67M04A/6lQ83eJXEn3JM7GCMIPIdj
N7fLO4fWbhwndi+1xdmlTY679FwT+mpoPXVARs7OOLxuuitpqPdw4jwxggK+MIIC
ugIBATCBqzCBljELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hl
c3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYGA1UEChMPU2VjdGlnbyBMaW1pdGVk
MT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5k
IFNlY3VyZSBFbWFpbCBDQQIQFQW69G80baV6q1Oyg2uFLjANBglghkgBZQMEAgEF
AKCB5DAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0y
NDA5MTkwODA1MDdaMC8GCSqGSIb3DQEJBDEiBCCrShQNgwyrxxGORYHuqW9I8yAk
DwC1r60EaS1m41UqwjB5BgkqhkiG9w0BCQ8xbDBqMAsGCWCGSAFlAwQBKjALBglg
hkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIA
gDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDANBgkqhkiG
9w0BAQEFAASCAQBbwEY3ysDTz89tabghcKH7mZzIE++JiXJ1+QcuFIzhnhvBIE/n
6fwgNsWeSJNjLqQ8aEqvcR7T6G56AiTbwVYPrxIe+Yr0d+DpZ+rUHYqWFVS1IStz
fyl00VNw9B3P4Kw0GkrzBXKjDtVRhDXJ2WoDc0UM7F3hhX2RINuR2RFYMgf5Jm9m
thhdOxUsPiwAeYWK81j2ITqS1twOAqVuNGVU4ASEDRoEvQSbgvPAcKoUsOoo6zYq
UcSH9jLWxkDo0nkVG7u9Rb3LvNESt1XLwyYHW+JQBoTHaBJltLSbpdpB1d1cNcar
21uw0Av2WUGrq89X13xubWhYWlxfE3CUN1p2

------800A6277570D7725A51F4DE1CC24D8A3--


