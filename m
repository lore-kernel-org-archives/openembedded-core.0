Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD5C0C369CB
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 12:34:56 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.122])
 by mx.groups.io with SMTP id smtpd.web10.7324.1745411687866887242
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 05:34:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=BMoxI6Nv;
 spf=pass (domain: topic.nl, ip: 40.107.103.122, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zlhg0nf2DBzAzPUDHeu1612jR4bBfpKT6apsh7mLN3z8u4VlOLQAaZ1PUBJU2iI4jd2Za23eoQgzGw7sarnv9M4Z6MXkO3J9r7FmjC5rVQs8YrmWMzsaBwWNt8Sfwk9HL/1Vq5IPahs/xBrlwM4YEaHGPgLdxZKr2If1ONSj6pz991Fgg0k0OqOgVxPsPdIEgpM8Qihwcx3jbnHxuXqaWEkiGI9Q8Bf8VfYdlBJ1ftQBuGZKUAJBfkdUr7t1oEfbZe1coGyXmnE/tdxpoie2L1vRerAY7KPKiL2hUSgMM080zKkld9vzTG9SaqHusGGINLNR8lONKDni+isBFhCzxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DnxvHm4LijXIGA8Bade39+vf/IORg/58IS3G8X+8SmY=;
 b=rzdz+pvxnRmjnrUtieOzdOX5hfo6+LfI1m4Mmda7UMw0WzWoRNFikrkVXW0MSIfvYk5vqQPh5xxxUlecFznDVrQfhWzHuoOXWhF1qSiCSbpW0skMkS4f3dbWwifyxSLyB+z7KhD518izltwBIBB8abejjfCcU8P467BURwAPTw1ywufLCJESkFb7LyP56UAkBnyfkl7P6cm4uNis7p7wsARXKSOjewxfWNSdF2Z10s7aLEBZSKMsPKGCtVmz3dKTxTIWPuKtrAXeed1fMOUgwnWt8H7pusY3rXcnR7WLudxQwxl9+OVH0e8y8CoUsMYfxyf/nn++p/Y7zV0JlwyA8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=topic.nl;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=topic.nl;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DnxvHm4LijXIGA8Bade39+vf/IORg/58IS3G8X+8SmY=;
 b=BMoxI6NvnfIZ83ZD+Od8EYQgsgZurtFIO2TpnYv+aaM7paS2aI1pXHaMq3jjcOaDHm8Z3jMjclXcwla9z4VyPBEdQgo9/8el24aPkMWIONDl0nCJYS97sibASUhq/GZTqjcv3sTIfRKwge5IGmH6JoqxOeXqNqaXW4JnUnDRpEHcCye9qjv8lpPHYqKK9q1u4aNQbBtbS/v+dMvtQwJEG8vp/Z+SgJHBskF/6V5kcq6lP27bOp0Q0Wq8nFoqjQ1hbYMA5cmyt+dKGb3ey33AxAhBwg7deaYkQJZIvF/sqxWIsASHPkLSy+sRL1WJ0d35e2RCfTtkqqRssMnsP0P63w==
Received: from AM0PR01CA0134.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::39) by PAWPR04MB9768.eurprd04.prod.outlook.com
 (2603:10a6:102:381::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Wed, 23 Apr
 2025 12:34:43 +0000
Received: from AMS0EPF000001AD.eurprd05.prod.outlook.com
 (2603:10a6:208:168:cafe::e8) by AM0PR01CA0134.outlook.office365.com
 (2603:10a6:208:168::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Wed,
 23 Apr 2025 12:34:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 AMS0EPF000001AD.mail.protection.outlook.com (10.167.16.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Wed, 23 Apr 2025 12:34:43 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com (40.93.81.75) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Wed, 23 Apr 2025 12:34:42 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by GVXPR04MB10970.eurprd04.prod.outlook.com (2603:10a6:150:21b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 12:34:37 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%5]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 12:34:36 +0000
Message-ID: <5a9b30f0-c189-4841-9821-6dc26de4de84@topic.nl>
Date: Wed, 23 Apr 2025 14:34:36 +0200
User-Agent: Mozilla Thunderbird
To: openembedded-core@lists.openembedded.org
Content-Language: en-US, nl
From: Mike Looijmans <mike.looijmans@topic.nl>
Subject: kernel-module dependency mystery
Organization: Topic
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P189CA0030.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5db::17) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	AS8PR04MB8644:EE_|GVXPR04MB10970:EE_|AMS0EPF000001AD:EE_|PAWPR04MB9768:EE_
X-MS-Office365-Filtering-Correlation-Id: 582eaaf8-74db-4873-d05b-08dd8263394e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?bExaRmloN2N2d20yL0tWa0t0eE9rNERkVDdpZHZ2N3JMbFo3SHZ6dlRSWHc0?=
 =?utf-8?B?M2paTE40MDJTb2pIemxKc3d2MVFwN1BnR0FZTFlOaEd4K2xMU0FRdHhOOEJl?=
 =?utf-8?B?ZTAreDVQRE02c09vK0RhV3J1Wng5Vy9GR2NKYThvYVVyNys2M3FZQTZQZy90?=
 =?utf-8?B?c3lUVURKMEhvOTUvM0V0M2w4MVd4ajg1MzRYaFhDRWRoOGFIWC82RXVGT0VE?=
 =?utf-8?B?dmtISldtOWZXejI4dThFdlByODRtNSt4TTNHUS9FaXlUdE5vdGdoRWpmWm5P?=
 =?utf-8?B?ZGRvUnJqOHlyNWhHcGJha1RRWlh6MVZlUkZWdWdFV3dVSFdhY0FkdEV6cjBo?=
 =?utf-8?B?MEhuMC9SZ3dtMThTbFFOVlpnTW00eGpIN01qYWpvdHlTaCt6S29lcytxUUs0?=
 =?utf-8?B?QU4zZzdnRHVnTUpFRkxmWU9hM3EyOERpZ1hIUVBrZEkzV0o4U3dWTzVOTEhB?=
 =?utf-8?B?Vmo5Qm5lcWQxRzNJVUplSWtDTWlhQVZtcEVJazNMKzB3bFNrOXI0SmNPckN1?=
 =?utf-8?B?N1BxVGZnejNDenFhUkVUR3k4cWhHMVBnZ1BBaDNHVC9yR2VwK0R6eXFuVjJM?=
 =?utf-8?B?dXlaOWY5ZGxoUFNlMTBpVGZPV3ZsNUJxamJHaHFRTVVmU1BMUFRpdTZDU3pa?=
 =?utf-8?B?K2J3VXc3NWp3c1RJZnNzdGlDSlN5MVZzREZjdVEwYTkyWUlnaTRwZlBkaVZ2?=
 =?utf-8?B?RTN6RDRvWXR3Q1hlYW9tejRXOHJHSGhnVWRMTG9UKzJTVUUxbUJDd1hveGdU?=
 =?utf-8?B?VmZJSWxsYW5IcGVIamFSbVVyaXhPRTB1SHVLTzFDaHo4SVRKdE0zQUJUZTl2?=
 =?utf-8?B?T01NM0ZxSTh6UmJNV3hWSWNMOTc2UDFsUnFFOTZYVkhHeldSWHlxZDlLVHF3?=
 =?utf-8?B?WTdxOFlURjNkWEc0TGNQdGpCajRnejd1eTV6L1RJVGd5MDFkYi9Lbi9Zb1Rz?=
 =?utf-8?B?QWZQd044dVNOWXFaSW5sYm1EMXBQY1d5UmRpY1NuRmVJSFdDeExBbWlGbjBU?=
 =?utf-8?B?bHgxSjlHNFJ6cDdOYUwxd01FZzBYTmxKQkZ5Yjlsd1ZRZWpNSmpJeVIwbWJo?=
 =?utf-8?B?c1Yxc2JTQ1MzUVpOOW1mTEJxOUFxVGVNeldkVThvRVdKcXNYQUdlb3h4UDVH?=
 =?utf-8?B?TUlyd0k1VWRyUGtaZDNjMDN3MUpJamZpSm9CWUJRUXlSd1locVZsWGMzWTVa?=
 =?utf-8?B?UUtEMDh4bkd0VWl3T2tYRUJpdFd1cWdiaWIvOHQ2cWUvRlBoRkZSN2s1RGVx?=
 =?utf-8?B?OXA2TUd1Ym10SFpzVVpIOW5ITUlTYUplbzd0MTNQeUY3SU9acmc5amxyZS9B?=
 =?utf-8?B?N21ZWG5CcjQxKys5amxVQTVrVWVOM2RsVHBmSTB0eTIwZzRUSGpTL1JpVzZr?=
 =?utf-8?B?WHJZUnlmZngwUitPdDAyeU41N0ZoenlOTTZId1Y1TTY3cXNBM21iMEJiSTl3?=
 =?utf-8?B?OUtHZU5uTEpFY1dZZlRNdW11TXJjQWVnalY3bHdaWE9GanoySEdGOHNSVWQx?=
 =?utf-8?B?NUdSMmxpU0M3MTl5TjRkQVhTVDBWei9LNTF3ZWx3V1NwWHlkV3Z3OXVzSHNP?=
 =?utf-8?B?MXZwMWRIRWduK3NPVFIrWWUyL2Z5Nm5iU0FqMG11UnJTSm5NL0pOYWdmVm1r?=
 =?utf-8?B?OUtoR00rekNnajFBODJmb0d4M3Z4WlNFbmtFUTd2bXF1Q3U1d0xUaUdheXdK?=
 =?utf-8?B?cVJobE9VT3dPWXVhSTVVd0hYY2hrWFhCaXZsSk5nTlMrR2YzUDY1eS9RdFVH?=
 =?utf-8?B?WTVpd3FpYlJ4NGh3ek9zcTlscnRCNzBNRkJLTGlsNzlkck1wVnFqdG5xN0V6?=
 =?utf-8?B?MkpOM2YyTjdhcHExUjdsMjJ2KzRFbGx1dlRVNFdnZGVFVXRKdUFpdkM5blVU?=
 =?utf-8?B?c0I3UUZwVnovb3NSdCtaMzNYaUJLeXQvNk9rZENIU3pVRWtDZGFwOGQrb0Fj?=
 =?utf-8?Q?ScNwmlQb16M=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10970
X-CodeTwo-MessageID: c8119cc9-2e66-426a-8d92-d0316a2d667c.20250423123442@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001AD.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	06cc80e3-cc31-4ca4-00c4-08dd8263357e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|376014|35042699022|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Zk16ZFZibkFkNlZZUFFZQndRU1BTMFN4UzNGaVQ4WjhrN3ZiNXVGUUwzOS9C?=
 =?utf-8?B?THdxQjVqaGd3d3phMVU2S3RZSWJidldsd1VUeHRJT2JBaktXSHpRV0dETEsv?=
 =?utf-8?B?SXBubGc0OWV2RmwyZmliV1M3R1FtakU3ZGxTZktoczE3RzNaby9jamZIYTFa?=
 =?utf-8?B?cXlWSGMyM2FpS2RXWXUzam5USXkxWS9kTEZDcWJZcFZPNTdJVzFPVjZXUWx5?=
 =?utf-8?B?cE1oQW9FTXo3czhQeGZoZ3JEczQ4RW82NSs0bFU3b2tMNXY0dFcvc2xmTXZX?=
 =?utf-8?B?UmJpV21sSnprN2xzWVRpNWVLa253UHpFUkhYdUpqYmhQTHpab1RWTDU1aXc2?=
 =?utf-8?B?NXY1T0ViN292SzBCNTh0Vkh1YUVNd0VzcUlIRHM2QXMxL2lxdU81bExFbEJB?=
 =?utf-8?B?bWJqMk5SUW1OcUlSdVlkTE5PRFFNRHk2dmhLaGsyOFhLS3ZxNGpEUHNJa2lQ?=
 =?utf-8?B?MHBRc0pCMHdvTU5PeExVQ0s1NklHS2hhWDZHUzBQUE1NMVNabkdXZHdUaDZM?=
 =?utf-8?B?NjFONkkvczRta3dyTlV4MW9scGJOS3lHSzVVd09XL2EyN1huMWlXMjdvcGRm?=
 =?utf-8?B?dzRzRlJrbTdWK0xOOVJIdkphNzZoSmR2V2VhME1EaW80M1I3NVlKNG1tM1pL?=
 =?utf-8?B?Y0lDaHE5N1ppaWJsMGFONU94VlZMb1pBVU5CdGx4TkRJdkI0TlQxN043d0Uy?=
 =?utf-8?B?WlhxRHpOR1lNMHZmZjdqQkh0T1AwQm1mWXp2VkVSWW9DVjVTeUhWWkZvbHFC?=
 =?utf-8?B?bFByLzJzSW1DdDdXanNDQ2wwQVJIa2ZIdkUvZHh2UWVMTW1Bd0tidytqaG4v?=
 =?utf-8?B?VStZQ0xITU1KV1hkNFJvS1czV0RYNTBrYTJ3amc5QTEwTGtXN25ncGVNQnBG?=
 =?utf-8?B?QXRXU1AwalJXMGxMTHhWQzI0emV0ZUl6aWZNaTRSNmorRHpkWXR2aEdnMDhH?=
 =?utf-8?B?L1pzVTlKNDUxYjcyamhzWHdCQ2V6eEw3eXZMUlZlMThYdVhqS28xZzlqOGQ4?=
 =?utf-8?B?RVFvVkhHZXVnTk9ibndBaEl3R1IwTjVTbzl4ZWtQajU3eGY1SFRVMXpUcC9W?=
 =?utf-8?B?UTdtdUJRMWFrZ01HeXJ2WTNLbTNYWGJYa05mNmg0M2NOUlp3ekJ6MndMOWEy?=
 =?utf-8?B?R0dGem5uVStubjRra1FzRVZmdFBEbER5K2xYOHptRkpuNVFFM1h0SlZTWWRr?=
 =?utf-8?B?cnhkOWZVekE0cEVycWdqL3RlbmZ0ZkoydjR3cFZSWSttTityc01LVlpMK29Z?=
 =?utf-8?B?YTBCWW8wa3lUdE44K2JDajcxaUxlQ1hEanlweTA3T2lWeU44RXU5QVJDWjdG?=
 =?utf-8?B?UmNiUEdKVVF2eDZrbHJYbmlxRitMNktydXp2ZmNSa2JEYXNNUmRER2VBQmN3?=
 =?utf-8?B?NkxocTlTV1Vidi9sMjRjdmtPamZVaTBmS0M5QnpmaFNEc0g0YlA0L1lsZTJD?=
 =?utf-8?B?WTkrdUFIM09qNnQ3YjA2eklhUWxHSWdBWGNXYytjU2UyS3VGWWFJeVFLdWw1?=
 =?utf-8?B?WFk1MWc1RXRFMDhGWndRN1VsWlFMMlF5QWdjbDFrc3RneGNTMVZuSG9neXA5?=
 =?utf-8?B?ai9XVDRBNjFDcU1IbnJIVFN1MEZwNUxORVpxeDFjMklkNmFnTHRPR2dCemdW?=
 =?utf-8?B?OGJJczZHZ2NqSTV3QmxrcFA2dHdueWhkU2RUN25pQVkvRlFNVFc0dkNhWld1?=
 =?utf-8?B?cEtna3RoeWk1QU9pQ2JTbUJVcDMxTHZFbWdZelRkNWdmRTA1MldXbzJRKzlU?=
 =?utf-8?B?dE4xUW9qOTRhVXBWWW9SaWtwOW5OTlFRR2t0WWw2NTlrWEhONkpZZUhWQjZH?=
 =?utf-8?B?WVFEMzIralRvdjhubHZJek13ZjVSb2pva3N0dTd3aUJ1NjZHblJWQXRNbDFh?=
 =?utf-8?B?cGN5SkplTk1TbVpRRE4xLzhSRWNseXdJM0pQUE5EU3NmYnNKSmxXQThObExH?=
 =?utf-8?B?WTdkUXl4SVlOczNkRjQ1a1d2a1AycXVXRUF0WEFQc3h5RzdwOHlSVXo4RGRD?=
 =?utf-8?B?clVEekxoZEJBPT0=?=
X-Forefront-Antispam-Report: 
	CIP:13.93.42.39;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(14060799003)(376014)(35042699022)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 12:34:43.1161
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 582eaaf8-74db-4873-d05b-08dd8263394e
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.93.42.39];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AD.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9768
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 12:34:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215287

I built the same image for 5 different machines. Only one of them fails=20
with the logging below. Note that all machines install the=20
"kernel-module-dyplo" package, and on 4 machines that succeeds just fine.


 =C2=A0* Solver encountered 2 problem(s):
 =C2=A0* Problem 1/2:
 =C2=A0*=C2=A0=C2=A0 - conflicting requests
 =C2=A0*=C2=A0=C2=A0 - package=20
kernel-module-dyplo-1.1+154+bb94f350+bb94f3599b-r0.tdpzu9 requires=20
kernel-module-dyplo-pcie-6.6.40-xilinx-g6a2cb0f14db5, but none of the=20
providers can be installed
 =C2=A0*=C2=A0=C2=A0 - nothing provides kernel-6.6.40-xilinx-g6a2cb0f14db5 =
needed by=20
kernel-module-dyplo-6.6.40-xilinx-g6a2cb0f14db5-1.1+154+bb94f350+bb94f3599b=
-r0.tdpzu9
 =C2=A0*=C2=A0=C2=A0 - nothing provides kernel-6.6.40-xilinx-g6a2cb0f14db5 =
needed by=20
kernel-module-dyplo-pcie-6.6.40-xilinx-g6a2cb0f14db5-1.1+154+bb94f350+bb94f=
3599b-r0.tdpzu9
 =C2=A0*
 =C2=A0* Solution 1:
 =C2=A0*=C2=A0=C2=A0 - do not ask to install a package providing kernel-mod=
ule-dyplo

 =C2=A0* Problem 2/2:
 =C2=A0*=C2=A0=C2=A0 - conflicting requests
 =C2=A0*=C2=A0=C2=A0 - package=20
kernel-module-dyplo-1.1+154+bb94f350+bb94f3599b-r0.tdpzu9 requires=20
kernel-module-dyplo-pcie-6.6.40-xilinx-g6a2cb0f14db5, but none of the=20
providers can be installed
 =C2=A0*=C2=A0=C2=A0 - nothing provides kernel-6.6.40-xilinx-g6a2cb0f14db5 =
needed by=20
kernel-module-dyplo-6.6.40-xilinx-g6a2cb0f14db5-1.1+154+bb94f350+bb94f3599b=
-r0.tdpzu9
 =C2=A0*=C2=A0=C2=A0 - nothing provides kernel-6.6.40-xilinx-g6a2cb0f14db5 =
needed by=20
kernel-module-dyplo-pcie-6.6.40-xilinx-g6a2cb0f14db5-1.1+154+bb94f350+bb94f=
3599b-r0.tdpzu9
 =C2=A0*
 =C2=A0* Solution 1:
 =C2=A0*=C2=A0=C2=A0 - do not ask to install a package providing kernel-mod=
ule-dyplo

I'm on "scarthgap" branch.

The "kernel-module-dyplo" recipe can be found here:

https://github.com/topic-embedded-products/meta-dyplo/blob/master/recipes-d=
yplo/dyplo-core/kernel-module-dyplo.bb

The isue at first glance appears to be that=20
"kernel-6.6.40-xilinx-g6a2cb0f14db5" mixes the git version hash from the=20
module itself and the git hash of the kernel. There's no such package,=20
it should have been "kernel-6.6.40-xilinx-gd7b52381656b"


--=20
Mike Looijmans
System Expert

TOPIC Embedded Products B.V.
Materiaalweg 4, 5681 RJ Best
The Netherlands

T: +31 (0) 499 33 69 69
E: mike.looijmans@topic.nl
W: www.topic.nl




