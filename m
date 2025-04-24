Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26BCDC369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 06:59:12 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.98])
 by mx.groups.io with SMTP id smtpd.web10.9297.1745477945442905226
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Apr 2025 23:59:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=aYjPca1y;
 spf=pass (domain: topic.nl, ip: 40.107.103.98, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fKtcg8Jh0kvNzqfZbaXW57cFAnuPAet2b7syX64eBSolUdJBP7DJ2/s5WJCPNGKtgkp4SCJF09U26zBqAYDY/lXYu53IrKwU8YHqtqs3Afq1HwWW2t/UvqanL+E7++RcWc/LVdaibWijX2VeeHaqNbikk9TGdarwrbYC2bOs1WG2ixRtkDYz3F7j+X94+cmrJd0YQBiloFv6fLEOQDOkYoHvZlCwesLBRTqZhvsvmslBCQxtuAyoTardwfLDYqu1AWXzf1kaZANeFkqsx5sOImZ7DMQesLcP19ugymaGR2lfN2g/6i6YtsoE4hAfCr1K205FLg0mJ6Yce9Nsrpoc7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZ6t5S3m+q8C6BZtWbua98lIOgY0zlRGx5S8ZCk6dCk=;
 b=ioa5aYGrFegXi7wB7p7icl6337QYrkwbnhc9FYGH0oSgvxoQdng7ax+MBygqyWAsJ9dYIUHwsjEsNjSTt02JyiHdJeEWGP4BF/AgfLM6JWCTtg8YSkSvHHZ+LEnCs+UDZhD9MSefu4ICUtDE/St22tSlSkEWHnJN1CkTSHiQJlg8lc0l0CxlLIKjplrIDkzbsI9IJMzeKgoxLWucJREsZijfTwhRfQ/SPI0oJP0MSuw79CkQGy7vguQFibhMwz7ja1H5vhfMmHIdn1a7VFTAAKE8Tf0vVbXPn5D56Cpt0QXRQEilnZQXf+0bTHViqUI4c6ciVY41DUeo+DRe34UlxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=gmail.com smtp.mailfrom=topic.nl; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=topic.nl; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZ6t5S3m+q8C6BZtWbua98lIOgY0zlRGx5S8ZCk6dCk=;
 b=aYjPca1ynZqpF78590lgICspJ1TaDUFHDBZ1IqoRYuqEPU9vdfflHesSYoPb7IV/+Co4KpuCUttaY1eYU0kV484WbXqltjBRj2nKJpUCfHY/e/HUdhz+vmjvTzTfKDG4EtMx57YuxflZAerL0XsB9lVbx2LPuA0/ez5yrSq9O/lNoyuz0ImDK3vil0nOB32I5qLAquce7taycc87BsPKffl9kiAKpf4HB3dqNrvacMvLrtp5v93RWeLmkwdYKOU9L6A03xDb69uAsQun3A3BMDJnsMuq4UCgRdF7f3pTzq/O4e5WyNBpZKXhFDUKMUtEm3R2BjEUjopzpC8BSW2sMg==
Received: from DUZPR01CA0215.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::9) by GV1PR04MB10941.eurprd04.prod.outlook.com
 (2603:10a6:150:201::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Thu, 24 Apr
 2025 06:58:57 +0000
Received: from DU6PEPF0000A7E1.eurprd02.prod.outlook.com
 (2603:10a6:10:4b4:cafe::4b) by DUZPR01CA0215.outlook.office365.com
 (2603:10a6:10:4b4::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Thu,
 24 Apr 2025 06:59:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 DU6PEPF0000A7E1.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Thu, 24 Apr 2025 06:58:57 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (104.47.17.170) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Thu, 24 Apr 2025 06:58:56 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by AS4PR04MB9715.eurprd04.prod.outlook.com (2603:10a6:20b:4f9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.34; Thu, 24 Apr
 2025 06:58:53 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%5]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 06:58:53 +0000
Message-ID: <68e3c223-560c-453f-b1b5-9bbfc0f9a17d@topic.nl>
Date: Thu, 24 Apr 2025 08:58:51 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] kernel-module dependency mystery
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
References: <5a9b30f0-c189-4841-9821-6dc26de4de84@topic.nl>
 <656f5ffc-98b6-44e9-8308-51495e1961d7@gmail.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.26c21c88-3e9a-492b-9d2d-79874402141f@emailsignatures365.codetwo.com>
Content-Language: nl, en-US
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
In-Reply-To: <656f5ffc-98b6-44e9-8308-51495e1961d7@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM9P192CA0002.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::7) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	AS8PR04MB8644:EE_|AS4PR04MB9715:EE_|DU6PEPF0000A7E1:EE_|GV1PR04MB10941:EE_
X-MS-Office365-Filtering-Correlation-Id: 648da831-d331-4000-3566-08dd82fd7bf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|4022899009|366016;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?YzRLdlFld21xcHA0cDAvMTV6NExzNzdONDlQZjkvaTZZejh1SllTM1F3bGI5?=
 =?utf-8?B?VzgzL0hwdWlqVG1WTEx2TFZzVE44aFpFRTBMSDhXSW9hdVY2Y29IOVNrb25y?=
 =?utf-8?B?amRQT0NwZEI2VzNLcHhsSmRXMmpHZGZ6N0VJN0hyWWVDRVEwdWpGWWpHdlFh?=
 =?utf-8?B?ZzM1TnpNZTJNc3J4N0p4alA4eHI0K2hBMHVVNXA1VmRFeTNSNEY4OEJmd05k?=
 =?utf-8?B?SFhSTWtvNUxRakhpamVjVjZhajN2blFUUlUzNkFpL3RRYnpwemFoa2F3VCtk?=
 =?utf-8?B?OXdDelB5NlZpUXRNNng0cVhvNGtHV1E2aDVCejEwSDFOMDIvL2RYZUxYYXNC?=
 =?utf-8?B?K3NvdjZxLytkM2NwZGNxeVg5NXEvckFPa2N1U2lYYjlqNFNNU092Y3BHbnNF?=
 =?utf-8?B?V0tteUtVdHBlUHBaNzJYRHc4c1pUMFVQeEp1ajZ2ODlHVjBHOUwvakQzZWhh?=
 =?utf-8?B?VDJYa3lZK0FEZ3JGMWY2SGY2am5URG1CZmRYWnErM0pqVFQ4ZDN2SkFvVjhG?=
 =?utf-8?B?SDlHb013ajBCc0FlM0RINnU5QkEvaEg1aUNzLytCSlUwVko2WWJ5SGEvMkQx?=
 =?utf-8?B?MDNxV2JBd0pGWHBwUk43WGpmaE1MQXk3bFVheFYxekJRRm91SWY4aWV2cy9t?=
 =?utf-8?B?SEFWMjE5N2l2c1JIK0JSODFjQkc2WWRvVmw3Y2tGVkRGUk5uUGk1VlZOVDBp?=
 =?utf-8?B?aHp2OGVwODNJbUY3ME9kUjJwK0JPUlZ3eDVIMDFSK1kwUGlqbWVaMUUyamtC?=
 =?utf-8?B?Y3NHYnlaWEhpLzlxbE4xN1hXdGpSSlI4THo4M1l1d1EwdDFzYU9ZbXhQSHhU?=
 =?utf-8?B?NDdaYWlTQTBtTk5PRzFINVdpZzlVNnhJaElCSG50SGFJd1k2L0RSYldvalhi?=
 =?utf-8?B?Um9lNG9QSEIxQ24yOFJzQU50elh0V3BOMFJzY2x6aFU4aGh1MTRIY2dNLzh0?=
 =?utf-8?B?VUJBM1FnWnBVekt1cmtMeXRMRU1mL1NFclBoRzBDWkRqSE9FekFyMWp6U0pj?=
 =?utf-8?B?RmVEaVI0WWlnb3FpaHVBSFljOGdSVENxWUN1d2VQUlFEUnJYUlFHb25jYTJP?=
 =?utf-8?B?QXBuNzBFa3IxaEwxQkdEL3hPMHYyblJqYUF6cUtxVVFPSGhQaTZJVzJNOTJ4?=
 =?utf-8?B?aXNxS2hYeDZIWjVCYit5bDZPSGc4VHdFQzFrSGRGSmY1TEwwY0ZjRTRycGc2?=
 =?utf-8?B?bmswejlocEkyeHdwYjBhUUxYM3FQQlMvUW5rT2ZhbXZlWUttZXFSazR0eDRJ?=
 =?utf-8?B?QTZrWW0ydVg3ZXBTdFJHSm8vLzlRUlQwWGo3Q0lpYXVZT0NWVWR1VWJMUEVK?=
 =?utf-8?B?TGZEKytvaGlWNy9PcmNCVmhqYW9nMjFldkRiRk1ucFlGQ1FWRmdlNlQ3Zys1?=
 =?utf-8?B?OHY3WDBJQzFldytiS3pMTU1aeWVubElWcnJpdDhuVUo4ZkdQeWpOSEpFL0l2?=
 =?utf-8?B?UmlxYXVjRysrSGFPVjc0cWJiWVZObW0rVzVkTGdlSnRMbk9CVUdRczlCaTdC?=
 =?utf-8?B?ZXlCZ1AwQWtBaUNtaXltVGoyMHZ5ZHN5TG5IbzhXVkRVZndaSlZkWTNtYzNO?=
 =?utf-8?B?LzZ6UlUzVGovamtqYUZnbVNjdnNWZUQ3dHBuajAraHJvTHZhTFFBYUtGYVVX?=
 =?utf-8?B?dkZKRnN2dXVwb1ZRYmRSSC96dGQ1V0VNNVRBUzA4MDF0U0lUWkFncnVOUHRS?=
 =?utf-8?B?TnpSd0hqQ3RhMmFSdnRxRFZUNmJVNGd0NXpJZ3c0K1VYTk40emxhcy9hWGpn?=
 =?utf-8?B?NlNpbzBiRW9WRWFXQkhCTFhVSjlncXh5ZVIzRWFXdVFPTnQ0UmZMSEpGbkNn?=
 =?utf-8?Q?Ia/tNYYPWDgnXwqo/Qqawo1163Iv7Y1ciBCCE=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(4022899009)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9715
X-CodeTwo-MessageID: 78b156d9-4c33-4a3f-ae01-bb94848db6b9.20250424065856@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ec07fb7f-8a2b-4a4a-25ee-08dd82fd78f1
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|35042699022|376014|14060799003|82310400026|1800799024|4022899009|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cEt0R1B5WFUzUkMrOEowNC82eTFmNVhrZFRoWkRQdWN0dWQydU5kR2h4SjZa?=
 =?utf-8?B?SEg3NmRZL2RLeFZLR2FwbXYvRkJtNXZmWlA3cTlpdTRkU1JhdDJZRTYyV2lU?=
 =?utf-8?B?NmE5K3FqUmI3ZVlWU1hGTWZDSXJ6UzdUZXJ3OHdyUnQ5ajhNaVRpVmhySWVY?=
 =?utf-8?B?YTAvVExOQ2xwdUxsZWRaOU8yRG10ZEVaWW9VK2U2eFE4bFpCdnlPRkt3K3ZG?=
 =?utf-8?B?K3ZlVzBkM2Fmek9QbWVMWXN5MmllUjhSQ0F3RytWQXUvOWQxU2hzMVdLUysw?=
 =?utf-8?B?Z2dpbGZwM3JzWDNWbm56ZFcyYklTMk5WMjJ1UHY4RG1PaEdjbDg2b2pSTEVS?=
 =?utf-8?B?em9Sek5UWWNNQzV5Q3BsTlROeFhwdVZpeXZ1WW1iYThTT1g0MzBGc2NKUm1t?=
 =?utf-8?B?U1RJNHdodS9hZTdBYXJtVnRObUdYNnBqRW5ldWs5UUdJb1VTdlo0M1ovNE8r?=
 =?utf-8?B?bjQ0aHBKekJMb3pITTFEMkRQV0pJSEQ0VERoMUVaa3Robmd0R0RyQUlscy9y?=
 =?utf-8?B?RThJbWFNaGltckdKd1MvUHVwZElablhpSlhtdXdoNklJeHVyai8vcG9pcklp?=
 =?utf-8?B?TGI0dG1weVBtNzN0T2xYalJhMU5vQ2p5anJMNDlQdisvM1VPN3lYUkY1cm55?=
 =?utf-8?B?VEZCNkd4ZytkeDJjbzRkTFZsQitoV2JuYkNXRTdPNHpGNUtLVkF4Vzc5NGgw?=
 =?utf-8?B?Y01Sc29wZVk1eXJnSWI5VXBYYm56MjBKa3QremhpeWJyRmdVZUtQdXFSNDJN?=
 =?utf-8?B?ZXBYSXFtRHBKM25waElDQkh5Q1VIZ0dPZ1dab0sxcUdxN3c3SEkzVUkxcU5u?=
 =?utf-8?B?S3crczQ4bXVNYmpJUUNZa0NTaTZOay9kTmtXVmpMVmRmYjh6R2lzL0RDWlhy?=
 =?utf-8?B?Zlk2b3h5NjgxdDhxeG9IVlY2ejN6Qjc0ZDJNZy9zRzkya2J6ekxsVlBpTEFF?=
 =?utf-8?B?bFJLV0ZKRHRIakhzVTBqSkV4S0gwaEVqMVBUYjBzSllRM3FWQnp3Z0Z4NlpC?=
 =?utf-8?B?UkxYY0JNakczTTZEN25yaHA2d1FFY1ZUa01MbmswaHp3TThOSHdvd1N3cUVK?=
 =?utf-8?B?ZG9uZDRhaDhObnA5NnljTTNzbm92eFMxc0ZTb3QzREF0alcxQUp6M1hMNHhh?=
 =?utf-8?B?V0hFTEJxRWlqTWNFaE1Fd2ozeDgzWlF4c3Mrb3lVZWw1bHpZbHdFL1cvZm12?=
 =?utf-8?B?MGJGTHRRN2NydjMvaUhXNnVPcHdqZHczRXl0M2w5MmZPTzZRUk5FVFZMU2dx?=
 =?utf-8?B?NjFWcFJVYTJFczNRSDJWcE1kZ1FwVFgzTTJSN0N3V0VaVklZTk5WYzA1VHpa?=
 =?utf-8?B?SGQxVXV6LzROakdXYlNRM2dxOWRCakVRRkI1MUI4S0lCUGdvcUh4RGRtUUJS?=
 =?utf-8?B?TThYSkxDYUJaS2pvSGgwTWpWcGt0YU9CYlBQUjlxRkZNc1BZOURrL2NTQzFu?=
 =?utf-8?B?aXNVRHBHTnRGMEx6SEVpQzlDSUxBSVNQc24wZzYxaVhZVTlxSXM0SG9YVVR5?=
 =?utf-8?B?YUdoM0M3cldhZnlzU0VKU2xlWDNna2V3SE93R2lnVFl5cjRYL2JYUG9rQVpR?=
 =?utf-8?B?dk9LZXg5Z0lzR1pHSHZBTHNqQ0tIWUVDV3NxZ0JDNS9DZDVZWGY1MGkzaWZG?=
 =?utf-8?B?bS9WTFMrbFBHUDdTeVpTVUMzYXVha0xYRjFuU1YyeGF1dXJQSi9HWHc1ak1m?=
 =?utf-8?B?Mm02bVhYd0pVVERSUXlZNyszNWd1eEJFNXNmRkE5VTN2azRKSFRWZUtXL2ZM?=
 =?utf-8?B?YURCSDhBMmxXWWYxcUdaQ2ZaR1hCa2pBOVBJcUk4RWJ6b3VvTG13N1VEdlhN?=
 =?utf-8?B?VEVNRksyL1pGOUw1UGQrZy9IdGgzMXVaeWFnS3BnOTZXUlk2d21xblcrSE9r?=
 =?utf-8?B?cXdHTngzRkRCbkZwQk9qU1dDdnRERmI2bHFlSzBnUHpMQ1hiR0IwdE93WjVD?=
 =?utf-8?B?ejF6bEwvRzFyT1BlV0txWGtKb1RNY0hYNWZ5Zzd3ZjFQWXlsR1BpZEF2WXhN?=
 =?utf-8?B?dUtuemZkTHJRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:13.93.42.39;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(376014)(14060799003)(82310400026)(1800799024)(4022899009)(13003099007);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 06:58:57.3817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 648da831-d331-4000-3566-08dd82fd7bf9
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.93.42.39];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10941
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 06:59:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215326


Met vriendelijke groet / kind regards,=0A=
=0A=
Mike Looijmans=0A=
System Expert=0A=
=0A=
=0A=
TOPIC Embedded Products B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 69=0A=
E: mike.looijmans@topic.nl=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
On 24-04-2025 04:25, Khem Raj via lists.openembedded.org wrote:
> On 4/23/25 5:34 AM, Mike Looijmans via lists.openembedded.org wrote:
>> I built the same image for 5 different machines. Only one of them fails=
=20
>> with the logging below. Note that all machines install the "kernel-=20
>> module-dyplo" package, and on 4 machines that succeeds just fine.
>>
>>
>
> how are the five machine diffrent with machine config metadata

Here are the conf files:
https://github.com/topic-embedded-products/meta-topic/tree/scarthgap/conf/m=
achine

The "tdpzu9" triggers the issue, it's the same SoC as the tepzu9 and all th=
e=20
tdkzu* machines. Only difference is in the peripherals. tepzu9, ttpzu9 and=
=20
tdpzu9 are the same SOM, just on a different carrier.

So the only difference in kernel configuration is some variance in drivers=
=20
that get built.

>
>> =C2=A0=C2=A0* Solver encountered 2 problem(s):
>> =C2=A0=C2=A0* Problem 1/2:
>> =C2=A0=C2=A0*=C2=A0=C2=A0 - conflicting requests
>> =C2=A0=C2=A0*=C2=A0=C2=A0 - package kernel-module-dyplo-1.1+154+bb94f350=
+bb94f3599b- r0.tdpzu9=20
>> requires kernel-module-dyplo-pcie-6.6.40-xilinx-g6a2cb0f14db5, but none =
of=20
>> the providers can be installed
>> =C2=A0=C2=A0*=C2=A0=C2=A0 - nothing provides kernel-6.6.40-xilinx-g6a2cb=
0f14db5 needed by=20
>> kernel-module-dyplo-6.6.40-xilinx-=20
>> g6a2cb0f14db5-1.1+154+bb94f350+bb94f3599b-r0.tdpzu9
>> =C2=A0=C2=A0*=C2=A0=C2=A0 - nothing provides kernel-6.6.40-xilinx-g6a2cb=
0f14db5 needed by=20
>> kernel-module-dyplo-pcie-6.6.40-xilinx-=20
>> g6a2cb0f14db5-1.1+154+bb94f350+bb94f3599b-r0.tdpzu9
>> =C2=A0=C2=A0*
>> =C2=A0=C2=A0* Solution 1:
>> =C2=A0=C2=A0*=C2=A0=C2=A0 - do not ask to install a package providing ke=
rnel-module-dyplo
>>
>> =C2=A0=C2=A0* Problem 2/2:
>> =C2=A0=C2=A0*=C2=A0=C2=A0 - conflicting requests
>> =C2=A0=C2=A0*=C2=A0=C2=A0 - package kernel-module-dyplo-1.1+154+bb94f350=
+bb94f3599b- r0.tdpzu9=20
>> requires kernel-module-dyplo-pcie-6.6.40-xilinx-g6a2cb0f14db5, but none =
of=20
>> the providers can be installed
>> =C2=A0=C2=A0*=C2=A0=C2=A0 - nothing provides kernel-6.6.40-xilinx-g6a2cb=
0f14db5 needed by=20
>> kernel-module-dyplo-6.6.40-xilinx-=20
>> g6a2cb0f14db5-1.1+154+bb94f350+bb94f3599b-r0.tdpzu9
>> =C2=A0=C2=A0*=C2=A0=C2=A0 - nothing provides kernel-6.6.40-xilinx-g6a2cb=
0f14db5 needed by=20
>> kernel-module-dyplo-pcie-6.6.40-xilinx-=20
>> g6a2cb0f14db5-1.1+154+bb94f350+bb94f3599b-r0.tdpzu9
>> =C2=A0=C2=A0*
>> =C2=A0=C2=A0* Solution 1:
>> =C2=A0=C2=A0*=C2=A0=C2=A0 - do not ask to install a package providing ke=
rnel-module-dyplo
>>
>> I'm on "scarthgap" branch.
>>
>> The "kernel-module-dyplo" recipe can be found here:
>>
>> https://github.com/topic-embedded-products/meta-dyplo/blob/master/=20
>> recipes-dyplo/dyplo-core/kernel-module-dyplo.bb
>>
>> The isue at first glance appears to be that "kernel-6.6.40-xilinx-=20
>> g6a2cb0f14db5" mixes the git version hash from the module itself and the=
=20
>> git hash of the kernel. There's no such package, it should have been=20
>> "kernel-6.6.40-xilinx-gd7b52381656b"
>>
>>
>>
>>
>>
>>
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215321): https://lists.openembedded.org/g/openembedde=
d-core/message/215321
> Mute This Topic: https://lists.openembedded.org/mt/112412917/3618446
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mi=
ke.looijmans@topic.nl]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


