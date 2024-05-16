Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A30C25B78
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 11:41:38 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.138])
 by mx.groups.io with SMTP id smtpd.web10.11368.1715859696545993279
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 04:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=K5o8dMuP;
 spf=pass (domain: topic.nl, ip: 40.107.8.138, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLtfBCSUyoGBk8Y5jYRJ6YAo3jezxXiLQx/6grVryZxtmluw5WBqBA5StSDH8n/LaHjYTwQvnED8MpVE5LCMcVVxA6/HDna+tZIlwKdynY/ZSd5McDocSE3w/N4D+5AQ/ggi+KtjKTm4qMU06QTuBjpd6WouxrDVYOm6u2IBQWnpa/S8HVsgQ9pJ6UkuZhxsAt0QsUDV8/9oWwnOnRGmUqvCw+g2U/FAHfqoYpXOgs+LRMJ9/IjF0+B7tsy3UQLxtaURe3Nm2b0qVNbJezSRozlAVRfbsponGueKlSg1iJgKvwxD3dhIlEqO/V1X6dpFwB6eMVQ2zRjLTq/36RSAQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rC4bVYhyGRoVcw1KjKf8NX+Kg6XWXcqlQL3DWFOY8g=;
 b=FH5fUyWKx4HOjR7VMq3m6tUGuiRV/hQRyWB4ZOxstqmPZH1z8yzz+oKPSLu08Sj0BCO0zMoCTc5A67KF3Y9aqcdKNU6fDryVrlJ4NVRlOMkZVMreymXE6VDzzxPpm4Ms4w+JdJYAuN5wf3Iab74Y5Qd6uVw6nLbthLzN/hrrY4vbIqBH7mYV8e4WiuRPxU3tHmy0d/AAZwdQv7fF+kJg2L8TETaxYvZ+WNjBCh5dBywnyUIN5EFwBxVy7XcbSYgZRj/XQQGAqGcTrbPuGyQ+IFgSrEYNn29FpmRgyzxJX2hjLVlteR/wAcjWIorKP31E8psQqvRIHJcBIspSKjyeMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.69.19.60) smtp.rcpttodomain=arm.com smtp.mailfrom=topic.nl; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=topic.nl; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rC4bVYhyGRoVcw1KjKf8NX+Kg6XWXcqlQL3DWFOY8g=;
 b=K5o8dMuPOy+iPoXBjwIcU0g9VutWHGKbicgK/dGrOz1H1V+VLZzRNfsE6Esyav8sX7Hn0WKL21AMgC2/5cejZWfQDzumdtqM1bhhzbeqPs5hZElvDHoahdlzEgs18QXfaadJ0xJVMdi3jmqJo8B6BL0Q4kwqVagVFvkp1WmbytCfMG9ai04ZTrgQYTk7SeM6+QhVtoBtoxD6pX43H8updIsyq4IrZd6l0cdOj22OzJ1NCkarg7dfg2Mp8wVAKzulPt6JKOoHkxbKKUq5UjqFTE+mjUyOUfyZHVUIrO3qS/HPx7Da5HY2rauFjDe/ruPXyqBfJSicC94PhUUcxL/k9A==
Received: from AM6P194CA0004.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::17)
 by GVXPR04MB10489.eurprd04.prod.outlook.com (2603:10a6:150:1da::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Thu, 16 May
 2024 11:41:29 +0000
Received: from AMS0EPF0000019F.eurprd05.prod.outlook.com
 (2603:10a6:209:90:cafe::3c) by AM6P194CA0004.outlook.office365.com
 (2603:10a6:209:90::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28 via Frontend
 Transport; Thu, 16 May 2024 11:41:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.69.19.60)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 40.69.19.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.69.19.60; helo=westeu100-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu100-emailsignatures-cloud.codetwo.com (40.69.19.60) by
 AMS0EPF0000019F.mail.protection.outlook.com (10.167.16.251) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.21 via Frontend Transport; Thu, 16 May 2024 11:41:28 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (104.47.13.50) by westeu100-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Thu, 16 May 2024 11:41:26 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by PR3PR04MB7324.eurprd04.prod.outlook.com (2603:10a6:102:91::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Thu, 16 May
 2024 11:41:22 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%4]) with mapi id 15.20.7587.028; Thu, 16 May 2024
 11:41:22 +0000
Message-ID: <09b7b8c0-169d-40b1-82e6-e6fc84568292@topic.nl>
Date: Thu, 16 May 2024 13:41:21 +0200
User-Agent: Mozilla Thunderbird
From: "mike.looijmans@topic.nl" <mike.looijmans@topic.nl>
Subject: Re: [OE-core] What does "do_menuconfig is disabled" really mean?
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <e56f7e6d-d5e1-419b-a52b-c1e25f984343@topic.nl>
 <5CA79700-0B9F-4593-83B4-731FC508A6E2@arm.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.6ee1b325-beaf-4256-bb16-19d03e341919@emailsignatures365.codetwo.com>
Content-Language: nl
Organization: TOPIC
In-Reply-To: <5CA79700-0B9F-4593-83B4-731FC508A6E2@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P190CA0057.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::6) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	AS8PR04MB8644:EE_|PR3PR04MB7324:EE_|AMS0EPF0000019F:EE_|GVXPR04MB10489:EE_
X-MS-Office365-Filtering-Correlation-Id: bec8e682-2ef9-46b1-c21b-08dc759d1fb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?ZEZFQXVNNndzYVNPeDdJanVvdlk1TUlFUXVsdG1TZVdwU3NtQUg1OVdPczAy?=
 =?utf-8?B?SHZIVExma0YvbjQxd0JEMlQ2VmxoR0xvRUs0UzNZcXNyTHl2bEt2VXFsblpk?=
 =?utf-8?B?aWt0Z2tPanBkNmJ2SzJNSVlLQ0RrZmpCU0wzSU5zS21NVjVYMkhVemFocXl4?=
 =?utf-8?B?eHlRRXpsaGJ1NVlFb0FhWjZrSHI5TERrNlZ2YTRmcVMvb00xTTJkdnNYYkpO?=
 =?utf-8?B?M2lxZ1F5KzVPZHBITWhQNXRFQVpaYUhzbVNma21tSDREclFKL1FWNW83VkZ6?=
 =?utf-8?B?TVJPT3NlQTBLZTJSSStkY2lIODgwSXkyY0l3bzZ4YmFvaUNSdERDYUtFeEtL?=
 =?utf-8?B?Slg1bjd5UnlWUktLN0l1UEZEeEU4QitkUnNSd0l1MTNCOEY4OTViTXJKLzJ0?=
 =?utf-8?B?ZXNOYVJheHc5aldVOEVsWmZ1cDJTSUdSYTJKVjZEVGo5RUVEcFVVYVJONDhF?=
 =?utf-8?B?eTE1NW5BbnNTRHMrLzA5bTIrWFYxcDI1S3lGYmcvOVZEMUEyNWVxOERJZ21h?=
 =?utf-8?B?b1BsVmxKVVptTTNOdXRIazlBWlI5MzBSd0hJUmVIdkJYeXg3WDdTOUk3RG1w?=
 =?utf-8?B?UFI0dWZBNDFuR3Z3K29JVENUSjNaSXR1VXc5VDRsOHZRRFpDU0QrRUlZVXZa?=
 =?utf-8?B?VlBqMjJBUjlLMU1CNG8wTnJrTVNWU1BCaVBvcTVaRnd6eWp2WHdQbVVjZ09J?=
 =?utf-8?B?Vk1XS2hlK0xDN2ZVZGVxSmpkTjlFTDZNUU5relcyN1FOTGdYck4xcWtXMG92?=
 =?utf-8?B?YnpLQlByRDZxK2lFdFk1NWRSMXhnNTJOc2d6MzJWQTdhV21zL0N6bGpVakJx?=
 =?utf-8?B?b1VyOFE3ZHptb29iekIxVVhRN0NkM1NJY0xNb00ycTZXUFZZd3lITEoxbXlF?=
 =?utf-8?B?ZmFaVWdsbjhFNVBSMitwaGJZdGxmNkJVTkpTcFJEUmRkL1Q1b1BlM3NwQklo?=
 =?utf-8?B?WFNiVWY2RURYcVp3S2JWZFk3ZkNCVXM4UHNUdE14SklVVE13am5qeE1EaWZY?=
 =?utf-8?B?WFZGK2tRUzFHRHF6MFlBNjlFTWpydmNZL1ZFWWJ4cGl4YktIU01nc3BTcU9W?=
 =?utf-8?B?cmxtYmVMMDV0RWh3cThzSGlRRjE0Q29tU1pGZ3N0VEN1dndUSmMvODFUZ3ZK?=
 =?utf-8?B?cHdBWGVVUU9vOVh6K3RWTldhdldHWllIUE9ad21JNm1uWEZHWndrR2FFRkJM?=
 =?utf-8?B?cEVpaW5FTUwwSGF4alU2L0R2TzJZeWcwTUI4LzlzWHNJVTJXbWV0UEE3K3ZR?=
 =?utf-8?B?allJY01kSWRLY3NadkYrcmpkZVYwbFNqSFRKVFBic3ZjZGY2TGE4b3BURUNw?=
 =?utf-8?B?N01PQWJlSzVRUjJ3VU1zMTlYL091MGdBVkc1LzF3SEdMbitDZERuTjZaMjdy?=
 =?utf-8?B?NExWbit2eTFCWXhDdWRZRkhqQjhhUDNSbE9kbWVTZzdaN0diYTJOK3B0ZCtF?=
 =?utf-8?B?RVZMSXhHdFZFaktqczQrY29zU0Q4MTA4RDJyV1lGZHRRTmZxbjBnUFZiNHVJ?=
 =?utf-8?B?ak5qVkRlVVhEUWFjNzVBRGhHSE5OcWlLQUNLMVBvK2ZyVGdISG9YblNKYnN0?=
 =?utf-8?B?VlBySUY5SnpvUmpsQ2ozMUl0dlZYdDVGTnEydk4zNXRpN211dDEvU2MxbDhh?=
 =?utf-8?B?VDBVeFdFTjl4WnhsWEZlZjhoem0reFRrcHBQbVYvNytZbVNLTHhYMU1SU1FQ?=
 =?utf-8?B?bVRrMkxVVG96ZmFBcGFOMzA3UzgxNTZYMkc0dzdtNXpVWWhnK2lsdE9BPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7324
X-CodeTwo-MessageID: 9aca1ccb-4338-4813-8afc-1457f17eacfc.20240516114126@westeu100-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	33f7357d-fb59-49e6-0bd6-08dc759d1c6f
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|36860700004|35042699013|1800799015|376005|82310400017;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OURidzg1V2FZNUU5ZlhuaW1lR3RNNkFmWGV3eGg4N0NFanhwOTRxUE4ycS84?=
 =?utf-8?B?cklmaHJsUkp6NW9tbklDdEJVUGxvTm1SVFhnWUFwUjd5aXYwVDZyTmdhRzZa?=
 =?utf-8?B?bXJqdngzR1RaelcyVFROZVFZSHltRGxzV002VWlEenl2RWJUT0Rxbkx5ZjAy?=
 =?utf-8?B?YXh5YUxmMG5LMSszU1RXdGUzdFRGY0ljbTR0WVVKNFVXM1pYWU5BTThWS0JW?=
 =?utf-8?B?K0xSOFRDdHpUcWpuaHdwR3RVUHREQlpjK3I2L0pkTW1GRkozMFlWTzV5NFZL?=
 =?utf-8?B?ekMzcUZlLzFHZkU4WW9NL3k1TzduU0JCeGFyR2xzMHBueDdneFRreTBsM3ov?=
 =?utf-8?B?aWs4ZlBVWk9zT1dZQ0RRemtrQi9UUS9RTUlvT2N6R1RUWWlsOTBHeTU5a29q?=
 =?utf-8?B?Q0RDQUJZZXhnWGZRL2w1bnQyclBZUW1uaDlYZ0F6b2xBbHpjY1lsSGhzRVZl?=
 =?utf-8?B?UHVMdWRhVVU1S0loRjd2dUNLM0NmY3pMMTNRaEJFcmJOdEEyWmlxdjVKdklP?=
 =?utf-8?B?YTZEb2NLdXBRSy8yTXE2NFlRZ0xVNGRNQ2pSYTBRVWp3amh0T2k2RGJ3cVBo?=
 =?utf-8?B?T2dqaUs4bVk0bmRrWDByd1Zna3UzWXcxa2p1a0hic2x4OHBHb1ltNHBCdXpQ?=
 =?utf-8?B?VmlzaEhTM1dTa2J5T0x6Zm1lbmF5eWRqNVpTanRSRkU3eHBTYm8ybVV1dlE5?=
 =?utf-8?B?OVlKU0lzcUsvNlY1c0FKVHNSc1RROVpYZlJuNnBLa0hPL21wM05YajYvTytR?=
 =?utf-8?B?RDdxMXZmRTVNSHo0NUhITjJDUkNnWU5wMDZ5aEFpZld6WkRSZlpNUCtXZE9k?=
 =?utf-8?B?aThIcFYyYlh4Skd3alVQOWtwR2lBWGgxY2l5cS9wc3pMTndTdGYySUlhTkR3?=
 =?utf-8?B?M3RhR0hZZ0VJWXk2TnJHdjUvQm9xVDNxNXA5VzBrWVZ5ZTBJQVM5U0F1R2Fj?=
 =?utf-8?B?MGhnUE5EK0l6d0JnTisyV2RUQ2FxSHBOK3FIazRGNWVzVXBCUWdBT2orNHRI?=
 =?utf-8?B?TlFYSTRrcFN6d2tRY1BxRVJGdFJONnk2Q0JIL0YvRlVjZlowRkIyLzIxY2Ra?=
 =?utf-8?B?ekE1TW5FNFVsVmV5WFRoVEdLVkZ6N09FTzdnMWtpVW9TZDlwVFVoTFlKMXdQ?=
 =?utf-8?B?MG9PSGxQZVIxSDJJODNObGswamh1ZnZYZWVGMVM1ZUVFR3hsM1Q2UTAvcnpk?=
 =?utf-8?B?alh1TU5BMjNyd3Q2TU9FQ2Z3cWtNazY1WmU3YjFBcHJDdHVuekd4N1c3M1g2?=
 =?utf-8?B?bCtrU1BTbjVCc2RHRDk4c0RCOG1TV1B3WlVrUkc4UStDRkZvdkpta1BnVHFh?=
 =?utf-8?B?MHFqOUw4VCs5cUQ4R3EyMDJsTHJ5Zmo2d3AzNHhkeDZqektQS0tjV2VyTnVI?=
 =?utf-8?B?R3hySExEQVBXR20zRm5iazJTaG9QQlJWSGhVUHFFTGFLOWErOHhybTdhdjFs?=
 =?utf-8?B?VllkcmFDWHk0WjNOWHJOMU1iNE5JRmdnZk5WZnVNWE8yTUVvM05PRGVSNnBx?=
 =?utf-8?B?WnFUdkM5UnduVWtBb2VPZFFXUXZ0MUZ4NkR2Y2VtNEQ1Vm9NRGgzUXlKSFFa?=
 =?utf-8?B?UEdjWUZlMFRGMTNRL0pTazI2NW51RFZ1QnNZRDRvL2lUZjFoMlJsU2YwSEJZ?=
 =?utf-8?B?UUVqSlJDSHlaUE1IdTVaczQ2RUl2SWJBbS91MnZGQW9icWQ3RDNyMG4xTGRC?=
 =?utf-8?B?dHR2OU1rTC82YUVNdU43aTJiT0gxbE4yZVJ3WllNRnB5Q3FuZXZ0WE84Nlkw?=
 =?utf-8?Q?m59zxDuITmGPq8XJIIXdsRqh/yfwN9YvFrjOvV/?=
X-Forefront-Antispam-Report: 
	CIP:40.69.19.60;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu100-emailsignatures-cloud.codetwo.com;PTR:westeu100-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230031)(36860700004)(35042699013)(1800799015)(376005)(82310400017);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 11:41:28.1332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bec8e682-2ef9-46b1-c21b-08dc759d1fb3
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[40.69.19.60];Helo=[westeu100-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10489
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 11:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199483


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
On 16-05-2024 13:34, Ross Burton wrote:
> On 16 May 2024, at 12:03, Mike Looijmans via lists.openembedded.org <mike=
.looijmans=3Dtopic.nl@lists.openembedded.org> wrote:
>>
>> Using scartgap branch, trying to create a kernel recipe for a custom LS1=
028 machine.
>>
>> The recipe in meta-freescale for the ls1028ardb is hopelessly outdated a=
nd produces a 5.10 kernel.
>>
>> So for my custom board based on the ls1028 I want to create a recipe tha=
t builds a mainline kernel (I don't need GPU or fancy things that require f=
irmware or special drivers, so mainline should be fine).
>>
>> I started out trying to get linux-yocto to build for my board, so copied=
 the "skeleton" recipe, adjusted a bit (add COMPATIBLE_MACHINE and a defcon=
fig).
>>
>> But when I then run "bitbake -c menuconfig virtual/kernel" I always get =
this message:
>>
>> ERROR: linux-yocto-*-6.6+git-r0 do_menuconfig: do_menuconfig is disabled=
, please check KCONFIG_CONFIG_ENABLE_MENUCONFIG variable.
>>
>> I tried starting with a copy of recipes like linux-fscl, same error. Alw=
ays.
>>
>> (note: I've run "menuconfig" a million times by now, for dozens of board=
s, so it's not the system).
>>
>> I tried adding
>> KCONFIG_CONFIG_ENABLE_MENUCONFIG=3D"true"
>> to my recipe, but that also had no effect.
>>
>> The log file also contains no information whatsoever.
>>
>> What's the real issue?
>=20
> cml1.bbclass has this:
>=20
> KCONFIG_CONFIG_ENABLE_MENUCONFIG ??=3D =E2=80=9Ctrue"
> =E2=80=A6
>      if not bb.utils.to_boolean(d.getVar("KCONFIG_CONFIG_ENABLE_MENUCONFI=
G")):
>          bb.fatal("do_menuconfig is disabled, please check KCONFIG_CONFIG=
_ENABLE_MENUCONFIG variable.=E2=80=9D)
>=20
> So if you=E2=80=99re seeing that message then _something_ is assigning th=
at variable to false. Use bitbake-getvar to identify what that is.
>=20

Interesting, that points to "uboot-config.bbclass:147" which sets it to fal=
se.=20
I'm not building u-boot here, I'm building the kernel?


$ bitbake-getvar -r linux-fslc KCONFIG_CONFIG_ENABLE_MENUCONFIG
#
# $KCONFIG_CONFIG_ENABLE_MENUCONFIG [3 operations]
#   set /.../oe-core/meta/classes-recipe/cml1.bbclass:35
#     [_defaultval] "true"
#   set uboot-config.bbclass:147=20
[__anon_148__..._oe_core_meta_classes_recipe_uboot_config_bbclass]
#     "false"
#   set uboot-config.bbclass:147=20
[__anon_148__..._oe_core_meta_classes_recipe_uboot_config_bbclass]
#     "false"
# pre-expansion value:
#   "false"
KCONFIG_CONFIG_ENABLE_MENUCONFIG=3D"false"




