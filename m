Return-Path: <alban.bedel@aerq.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00876EE0211
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 06:27:32 +0000 (UTC)
Received: from mx-relay103-hz1.antispameurope.com (mx-relay103-hz1.antispameurope.com [94.100.132.96])
 by mx.groups.io with SMTP id smtpd.web10.15861.1726036041068503385
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Sep 2024 23:27:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@l2task.onmicrosoft.com header.s=selector1-l2task-onmicrosoft-com header.b=fD2U02ki;
 dkim=fail reason="dkim: body hash did not verify" header.i=@l2task.onmicrosoft.com header.s=selector1-l2task-onmicrosoft-com header.b=rd7n4Hja;
 dkim=pass header.i=@aerq.com header.s=hse1 header.b=WUp65l9d;
 spf=pass (domain: aerq.com, ip: 94.100.132.96, mailfrom: alban.bedel@aerq.com)
Received: from mail-am7eur03lp2232.outbound.protection.outlook.com ([104.47.51.232]) by mx-relay103-hz1.antispameurope.com;
 Wed, 11 Sep 2024 08:27:18 +0200
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=fail;
 b=sNJXsHu7pUpsvY6c/FRKxPKou9623q1GhhHNDLlATWEAB9T058TP9Y+cS8UnRD24fCO3wcAEYoS8sPzbfPxd8LYR6cDPZFbA84xgR2K92Nc1iFNvXdMmQQ71aPlkdm/PDOqvLWwFOeA7VAtQDmbX9Yb3aPm+4W0M6M3uOdpjsOM+7pibDIzK/3eRq28/06tjqSFW3wasnOPq1wDfl9zycq/W0pUSKXP2lfYGekU/Re3GqkYFUMJfHXRtwO0pt4fbQ6F8QjPT0gjhNqnvh1Oh7YNZKx/zh/qc4QTSIlfX9R5it1Iad1vlay/5NxvXi/Srze94kqX1ST95KeEf0tpA6A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=szYh+8WwGI25EphhirNa5HkMs27TIfIolNTpq8kwNuM=;
 b=dWHcfBZOGGOQJZ+hMUq8nBwX4VVlmRYcAxsStVoO/dOgNv19YZqeFoSL7syhVE5iAuKefu1vK7T018c1lmikmcbk5ii/qW4iuy/2gX7xN322qf0c3apiQC/tajmJKYSD5fasjxkXCv6Rr2V+vG1BFbrqP1QUJeNdyWolAulzMyHl8j7IWal5KDArQOiWGzCwbuvbAR8nLw80o1Fn5EAyUQTmTTm7GOkS08sTTVf1GmE27oOcfBolP9UpkfA9PeyVEzBGMSTlpkNzyCUFlEh++r5csYuaQA1cidG2HBX320WR64Zk5tkI78ngx/NCyumaLwHa+MMVkDhMmdRTNt1GQA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 104.40.229.156) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=aerq.com; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=aerq.com; dkim=fail (body hash did not verify)
 header.d=l2task.onmicrosoft.com; arc=fail (47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szYh+8WwGI25EphhirNa5HkMs27TIfIolNTpq8kwNuM=;
 b=fD2U02kiarCYMjgosjHJcBJjkgMLDt8VmUKpzgi9CGZtGK5GpiU8L1RjOpjW4MpDV8JiaUnw3SeRG5CMpzKtcohej0IO4fteYGy5CFv7iMh+keG/29D2WXdBwpFnXVOxVWoF+hkkiFvMuYhe+FgIAIAXM6DlGDdcN6cTiJ1qyHI=
Received: from DU2PR04CA0159.eurprd04.prod.outlook.com (2603:10a6:10:2b0::14)
 by DB8PR10MB3958.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:161::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 06:27:08 +0000
Received: from DB3PEPF0000885C.eurprd02.prod.outlook.com
 (2603:10a6:10:2b0:cafe::b9) by DU2PR04CA0159.outlook.office365.com
 (2603:10a6:10:2b0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25 via Frontend
 Transport; Wed, 11 Sep 2024 06:27:08 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 104.40.229.156) smtp.mailfrom=aerq.com; dkim=fail (body hash did not verify)
 header.d=l2task.onmicrosoft.com;dmarc=fail action=quarantine
 header.from=aerq.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 aerq.com discourages use of 104.40.229.156 as permitted sender)
Received: from eu1.smtp.exclaimer.net (104.40.229.156) by
 DB3PEPF0000885C.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Wed, 11 Sep 2024 06:27:07 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (104.47.51.233)
	 by eu1.smtp.exclaimer.net (104.40.229.156) with Exclaimer Signature Manager
	 ESMTP Proxy eu1.smtp.exclaimer.net (tlsversion=TLS12,
	 tlscipher=TLS_DIFFIEHELLMAN_WITH_AES256_NONE); Wed, 11 Sep 2024 06:27:07
	 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 8468467
X-ExclaimerImprintLatency: 1778939
X-ExclaimerImprintAction: c8e504509b3a4d0f857670053c03af7d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQq1E751cBa3Id+bUtejoJnhodoCfjHheqWGE8oPw/e6+bmtVoPwAOnRr8tkKJtSfnL21xun4j0XGFKuPgkWGBlbYnWtuzpy39hSUs0ecIHuspKe93XHImqKOE/q5pu9y3DkgYQC2xAisEPXjtDATqbQjgypAiiuRdk8Q5dWQxQ4TlwnswN6swAfBwpZcFUZ5WKo9I7stKbH1hpGVJvec07Z6gEoLMU8gs5yFali9FnXDOAG2nlPHPy64fnhYkTDR4+h/MEhckoLIKGw+uHiU9hqmViEFoRg+YOR+W1FELwsBb28k7v8IurSHSvfPGQA9e1pYnTD82oU1SyQZET3yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PwJgHNu//+unnt/kCvY+wSDbnnPvFXrTRUxNH4gMsBk=;
 b=t70s2rD0My19hrc0Uk1qycjEvEMcx3tUPW5LdirGFtQ1PsBHocU0W9TDEkyCa1dMXcBsOZl8W6qsBdXgZPFD698DF8hsy/evXjBg+R5Cg/671V7ETYfpvU255sC0e61YONFxG1wc6n+N5WdNHiU/SsrHe6XvAVAjjgSHzHVJOcuFFEOX3xz0pKG1UD8p+rGB66BzzPIClqKnupFrD+fXUyle2GU6yegLEhXBT6zKMR8l+HmKBfFGG/DnOsacy84zP5G7sgAwttuWrK19Gb5xrK2MKIhI70xEwU9EbsxpSLybpZ0T2RIydaJh9jh2cKJg/ZVocLFlGYFZDFmKHxQbkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aerq.com; dmarc=pass action=none header.from=aerq.com;
 dkim=pass header.d=aerq.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PwJgHNu//+unnt/kCvY+wSDbnnPvFXrTRUxNH4gMsBk=;
 b=rd7n4HjaifRWIUORZs9GqYIishcV+iAbQSsBjzZKbVs16Gi5Ugr2Z2AaDRM9QtsLM3qR6UT7cLGrR/IZ8qyGqX4PeguZfiSBOmzuoPJXDVNzIVfo/yljMJFInk9zkR0pOUe7tk1cxZStCkM/x0FkaVCTZsw0LuN3empdVzCBWsU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aerq.com;
Received: from AS8PR10MB5000.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:405::24)
 by AM7PR10MB3844.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:179::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Wed, 11 Sep
 2024 06:27:00 +0000
Received: from AS8PR10MB5000.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dfc0:30ac:94b8:c791]) by AS8PR10MB5000.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::dfc0:30ac:94b8:c791%5]) with mapi id 15.20.7939.022; Wed, 11 Sep 2024
 06:27:00 +0000
From: Alban Bedel <alban.bedel@aerq.com>
To: openembedded-core@lists.openembedded.org
CC: Alban Bedel <alban.bedel@aerq.com>
Subject: [PATCH] bind: Fix build with the `httpstats` package config enabled
Date: Wed, 11 Sep 2024 08:26:47 +0200
Message-ID: <20240911062647.3653902-1-alban.bedel@aerq.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR4P281CA0384.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::18) To AS8PR10MB5000.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:405::24)
X-MS-TrafficTypeDiagnostic: 
	AS8PR10MB5000:EE_|AM7PR10MB3844:EE_|DB3PEPF0000885C:EE_|DB8PR10MB3958:EE_
X-MS-Office365-Filtering-Correlation-Id: c47c757f-ce70-4553-ae2e-08dcd22ac2a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|52116014;
X-Microsoft-Antispam-Message-Info-Original: 
 =?us-ascii?Q?ADYnskAKHLs6BWzskK1C7pv+PJUuXU6sbEp24HY6cYTDRh+vU0bdjjQKsBLI?=
 =?us-ascii?Q?wZ5NU1BuC9afSjVo+PQ1nnQjDromC1tHAEAqx1mOcy8DQoXBe+yxa8AM9Crv?=
 =?us-ascii?Q?Bd3YsWNYOS0uW3Pxtzr2zTZ4/KUfjwpF2jYB7xEMsBJ4sfHTeXfUwiy94DT4?=
 =?us-ascii?Q?w43cF/R3O3x/qfX5L6rQHnYU2O/OxLeJ8YaH3/wn+NkitpH9SAkr5fZJoOBD?=
 =?us-ascii?Q?VUszqVn/KNFXAVyEmW+6kZIuEXbrTRZRFHLKqpcUY5q95zjCaGWv2V5fsCY7?=
 =?us-ascii?Q?0uxjthxty98gueHsygGfXaZeAVqDLIF2eaBuy9/hoIv+BS3N4UlT3ApWW8Al?=
 =?us-ascii?Q?+3KKpPJLshyiRtmboZJyqor4U0J3tgOeVc4enZB93SZuVffAX60vqmwhmfvZ?=
 =?us-ascii?Q?1217vKE6Nt6EoPc+6JiAZwfiTFcpcT8Y6BwF2KwhTc9BykHf+xC5V7fB02lq?=
 =?us-ascii?Q?Krdub0GPA/pW19xcdbq7lc10XiRhPxVaTLytoNtTgUFAaNCH0IgdT1BkzIAf?=
 =?us-ascii?Q?LPmPE2zsHk4J+PaR7uZLB5a5roPloZ3U9qNnmu1UIkUwHyDlK/rEkf5DrwJw?=
 =?us-ascii?Q?jla4AbHJjHw70RTQ7c9iQle0U3aVJGfkKyZLlY1EBzJJIue3rumd4IEqNFKs?=
 =?us-ascii?Q?arW0BhUJO6zDduT9WCB+TkabAshyRPB8oACZ0E53vgDeXBn+baiS6slbrgt/?=
 =?us-ascii?Q?Pzk0LfAOvv2N/EI1Z3f96urS0RkbypvS6t4kmXvOzBYe/0qDYmU6PWLLbN5Z?=
 =?us-ascii?Q?bCTxswostfTR4ac3LWpb3qKUgKwf/cmynEEFKuYPiWso3YH4BHmWgIxrkHGX?=
 =?us-ascii?Q?Cj0sWrvxfuncCf7EGe/3Av3wa/ZuVHj3iSBIuAuAw2+VHB4dnS6XJlMJego+?=
 =?us-ascii?Q?RI+i86t3Qf8/+Nda2Tlp1jYDbcmW0rAjhJ1Gnstw9zBA+yzfSAIe24S6e0v6?=
 =?us-ascii?Q?G2k+BIDahPk6/votlAvOVGV6DcuaqI3JdqC4O8C1N98e18wU+mvB/9FTQfcK?=
 =?us-ascii?Q?S4QGo/s62Tei00QB+IrlCKDg6YQ/dPZbTcP6A1C4/KbpVO1YXijKvVqVmAxT?=
 =?us-ascii?Q?c043zafPkxxLabUW3PTcfGMdfVaHO+ydWsRViwTNuAuP++8XzoL+lR1fOw4k?=
 =?us-ascii?Q?azrxFLkNkJ2kQmcFbSimi/QrvYYuRz/VgQXuc4ye1to5o6ugUFflbObsJpM1?=
 =?us-ascii?Q?G2do486wV5Q+c48WCG6fJ4DM/DzhzzkDtUWRhNkoBv31LFvI5okeYgpQPKKF?=
 =?us-ascii?Q?xmExcm3dPZ4Zwe6/lpoPraXhM06XFcm2yx1N7OtNz9Yi1Z5rcI1bZu9jKUEt?=
 =?us-ascii?Q?MDSWUCKmcC7PaaCaBiSe5l+NCBLoH5w36Hl6nLcvLpaqyQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5000.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3844
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB3PEPF0000885C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f040b4b9-eb87-4186-f571-08dcd22abe19
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|35042699022|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kjngVSP23xODFxeqDtgRWlKCGeutaoOLCBLJJklvvKM2ODhy1nldmfBykDig?=
 =?us-ascii?Q?vwtr9VtU8B1BDXVMwSclLf6+mLCey4JfPNxRfgk7QgMH/N7ilMQ+CZYJ+AJc?=
 =?us-ascii?Q?s/NEgXbhHAE5xeFcqH0EXLkm3OKbMm64dpxyNhVpb+VPv+ckR5X5lom3DPt2?=
 =?us-ascii?Q?SqnpLfISGeFGKpVGK7G1bX32SvTac+XDw4cQQbB03ht1HJBLYvGgl/QIUMwg?=
 =?us-ascii?Q?tVfrYUjv5Nqmpvq9SmnR3Hl3dsqs8XHWrYdJ1egZ/EK72hhONo4HJkrF18I2?=
 =?us-ascii?Q?RFZ3CFMvYwf87nMagLmE14LS6ZukhBxDmSllShPLFSjKgIjLIhlr5mK9tXfb?=
 =?us-ascii?Q?j/sPnmnmXQmININ4HhAQssZLZUjbMcuviK78Izg+JW0hBg9ySXPOE37gPZwm?=
 =?us-ascii?Q?15r0+r/eMypMLM9lceV5jMWbRTLwD6HpkpUyDs2Imj1yq2bEt6XGWH9B5r8j?=
 =?us-ascii?Q?TEzqwtXnz3S/LSWeJYT6H6a9+XmD88mRkzJvqxUWdwaDrMN2CNOak5LU5Wrs?=
 =?us-ascii?Q?5ktw4UPNHxo5RYAmgz44Td4p7JGnMi4L2FJrRU7+EnlnCc6VgRpYD871hwvn?=
 =?us-ascii?Q?zOpfsNrXrEaClzunxFBC/cJoIeTrZDZjOP2h1Ugz3aoiPF22873917ZIRe8I?=
 =?us-ascii?Q?ss+3z/koHoUcV+7970sc6WY5gOmto7C8nT7s4mNYFBFebS78L4qqnRWJmlIB?=
 =?us-ascii?Q?ilWlU0jzRigFpBsPJ8nONCp/aPpZ+ajsLCVWu2xb3VCb9UEl0wKbyI09AsJu?=
 =?us-ascii?Q?W7I6GA3qFjF+YX2adXgUqepuhosK4fDyUZj1teUCZlQPY8NBz7Z1CRST6s2T?=
 =?us-ascii?Q?abHdoL/CObbEYMBOMPHvDrfXqMCpNUl96fbBBjjgTgv+YdwIY1IwZYcotMA5?=
 =?us-ascii?Q?e+v/rypOHKH13XJH9RgfIho+3ZGV752oxGfdqdJpbQGPgPAlYl/+en/VpLlF?=
 =?us-ascii?Q?q8UPei4/dlPvVIwL6q7uL7ypW6w5FD5YLmcQdLRbIBkUCV2Di3jl1IBED4Au?=
 =?us-ascii?Q?yW7opx33GKPfaBCm2jYBeKFCaUiKwAfwaPPJO+9087Huqdq1ZISLTt6ka5XD?=
 =?us-ascii?Q?WQchvyssjTwgWW9wpabD0WVsPTEScd0jTM80JRDEkcVfY3BmD18ckj0gxYoT?=
 =?us-ascii?Q?nzCVg3ycl8QXnS0wLAAG2mRkCyojcfYPV2Ho/8ABGwHaB42xVWUewlZ7i349?=
 =?us-ascii?Q?WvGxyOeUv5meb/Y7FRdsvhRE8UkTfrGLgH8dZKwvBg1h4qpNBP4zYMS47Lyl?=
 =?us-ascii?Q?DnKkZtzjgMWW6UMK2zWA09luMPsWDrAtZdFwqFSCYUZ0K+rBc89L+ia52Dg3?=
 =?us-ascii?Q?67iQrK+T6focsnnw8rHc7jg2iT578lCUMAGpzf+AxAPdc22YquOGfDlo6Zk2?=
 =?us-ascii?Q?Pv445LRHnb+rRGMNK8lqKBn80+L+3EFbxSHaE3G3qWlUa7/ZZyAmdXoYhGAc?=
 =?us-ascii?Q?lgD5HgLYiAE=3D?=
X-Forefront-Antispam-Report: 
	CIP:104.40.229.156;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu1.smtp.exclaimer.net;PTR:eu1.smtp.exclaimer.net;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(35042699022)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: aerq.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 06:27:07.2140
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c47c757f-ce70-4553-ae2e-08dcd22ac2a3
X-MS-Exchange-CrossTenant-Id: bf24ff3e-ad0a-4c79-a44a-df7092489e22
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bf24ff3e-ad0a-4c79-a44a-df7092489e22;Ip=[104.40.229.156];Helo=[eu1.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3958
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="----C65ED3E1A5DE826CA595746785F6AF6F"
X-cloud-security-sender: alban.bedel@aerq.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-crypt-policy: TRYSMIME
X-cloud-security-Mailarchiv: E-Mail archived for: alban.bedel@aerq.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay103-hz1.antispameurope.com with 4X3Vwc1W68z27l4Q
X-cloud-security-connect: mail-am7eur03lp2232.outbound.protection.outlook.com[104.47.51.232], TLS=1, IP=104.47.51.232
X-cloud-security-Digest: 5a49ca67d0706575fcf86b6991880a57
X-cloud-security-crypt: smime sign status=06 sign_complete
X-cloud-security: scantime:1.566
DKIM-Signature: a=rsa-sha256;
 bh=ArLRXJaJmLKZd1NqpCJrlLVdNPjmjeBMQDnoypQUhfA=; c=relaxed/relaxed;
 d=aerq.com; h=content-type:mime-version:subject:from:to:message-id:date;
 s=hse1; t=1726036038; v=1;
 b=WUp65l9dmwASHVtbERG79BjVrps6ESIviDA0rwEhYblmwyJYRkKC3KXW0RT515qO7akMHAbh
 5I3a9zMsFeraT31B8Alj9RE1AA+sq/Er+NL+wNHZwmHyxwm60hyRZ2BhceyVoUOfi+SP5lXRtly
 oo2CD3bJGnvblQf6q4fu6fZF5Jmkmv3+T6eQXpyYugV6Hg2rVmsLKwstRsMfajnAmL/NzWwu0p8
 E5DCkV+LxoIs+ODX6owRgWDnrgD95IPGA9qYJRFmyXRfoWnq+A6QuldnH4yVRzOwSAOq2nO1aYK
 7SUByyOs9LdwWR1Sma8k2ScRRHTLf3hdAR+dTVwxv9vfg==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 06:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204372

This is an S/MIME signed message

------C65ED3E1A5DE826CA595746785F6AF6F
To: openembedded-core@lists.openembedded.org
CC: Alban Bedel <alban.bedel@aerq.com>
Subject: [PATCH] bind: Fix build with the `httpstats` package config enabled
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
---

The relevant change in bind9 (commit 0771dd3be "Make the usage of
libxml2 opaque to the caller") was introduced in 9.15.2 so scarthgap
and kirkstone are also affected. Do I need to send dedicated patches
or is there some other way to get the patch picked up for these
branches?
---
 meta/recipes-connectivity/bind/bind_9.20.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/bind/bind_9.20.1.bb b/meta/recipes-c=
onnectivity/bind/bind_9.20.1.bb
index 71d2324b841b..9c68c918e405 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.1.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.1.bb
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

------C65ED3E1A5DE826CA595746785F6AF6F
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
NDA5MTEwNjI3MTZaMC8GCSqGSIb3DQEJBDEiBCDMZLzleY5P1VZkFf2EjVwZNRmL
ht9APVi9VO0+6uLoFjB5BgkqhkiG9w0BCQ8xbDBqMAsGCWCGSAFlAwQBKjALBglg
hkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIA
gDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDANBgkqhkiG
9w0BAQEFAASCAQCDhKY2YOscTT/loGOmmwvtuWP3pwCgu8TcBRvSpN0x6joDpIwQ
eV8c9y5XE2ImvwM1va0kT8DwqeNE/CnWHH99M08JAsh3Gy51JsfbDtM7D460/n9h
QrZlACp7K76NJPV910IQdD9DcvRWnOEhGTcaBXI9tGpzyr4X0kpl1jbMCoRVETsb
z3bh5pKBf1lASoQ/zkUnbpJXa1uF2ctkBiGFtjCYsTMwv35MZpDYp/AxBBybP3Qc
f1Y1uzL47TbH1dN5Lkw4uw8Mxj/aJ/hCx4iMq3i6ybelQ1/l10QVubU5uF6YO5e0
2KMrwtcEt/DMrqpOzJOJ/nkCPqINTsDsd+gi

------C65ED3E1A5DE826CA595746785F6AF6F--


