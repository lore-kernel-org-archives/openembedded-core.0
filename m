Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6613CCF9EE
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 17:38:06 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.2])
 by mx.groups.io with SMTP id smtpd.web11.39152.1761586677450989530
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Oct 2025 10:37:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dzBRybgq;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dzBRybgq;
 spf=pass (domain: arm.com, ip: 52.101.65.2, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Qomf/gGRRFnbtjyTwHL51lCqZCp97LIbjmpV6yC3EruxDqZvHiZK+9N1PaxCeiIinOGFIn4bRLyMtlVjWRVBxH4AyrdxRGmKO00FN/Vi2nyP02cBASpgIP/S6oGxFitJSkKe3Oi26DNZnvulMN9ay/luGaiRRiGEgFrytATegABz/kZB9TX4yGqPxOUThVN91UuaphqzMQrzKOph3s4zonos+Ff3ebpWQ4BMJmNY//9cFudSAIkLWTTjCtG5SfYC2EWjZfRpmFHrKxCS4o6FgUZabHLY4JWKgiw7PDB81T44xLVkw4YAGDIQtH4sGLiCl8+yUYVnWp3Qs1Rdv9p3Kg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZrF0cvVNRFKETrh1Mn2lSb9PhkkGqIQDW02uMlZ0cc=;
 b=BbW40S7Q7IlGjw5TxLzG/QNmqKCdT5n5/uC8bVM9TLXPbpH33lwnKiqlTvEeslpe0SJMp/g7txv9KXot3TfDmPeaPZpsUKk2Ottb/WO4TItNPIcE/MxCijnh9ce/qXKiQr7EVgHdlYP5dspQyNe5FgZWNL9dCChh9vJEM/57Mqi9lFY0F7Eex3RMelcZrdZQ9fz3FW+1tBmt7cTRXJzPfEF14ttg5M7yIbelpms2jn4YnTvcuKvXy7ORkE5c98raxYCN+MEathnDVf+4uqZO2+sVEROc9j/dvnABRi1dmZVpcBF4Hd6SF3s9b5tffHJerPdR9Z4UC7Ky/w7nllwENw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZrF0cvVNRFKETrh1Mn2lSb9PhkkGqIQDW02uMlZ0cc=;
 b=dzBRybgqTwKzt/KpO6ttpUnHCplWenopka2GqM0X5PZq3ALU6JGW2Y4ckdXSgqAv/7iefEPUxDOUV6abBUBTo5PJ998NKnRNIfCLFWJGkNB5Bl+4IlpIEUYeXx50gyDUWRwE5Ka4hJAN7VHpgtUaHNVzJ9UtNamMFqOsatS8yO4=
Received: from DB9PR01CA0017.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::22) by FRZPR08MB11219.eurprd08.prod.outlook.com
 (2603:10a6:d10:13c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 17:37:54 +0000
Received: from DU2PEPF00028D07.eurprd03.prod.outlook.com
 (2603:10a6:10:1d8:cafe::31) by DB9PR01CA0017.outlook.office365.com
 (2603:10a6:10:1d8::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.17 via Frontend Transport; Mon,
 27 Oct 2025 17:37:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D07.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Mon, 27 Oct 2025 17:37:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FfYQoSYCAgmtShd8IecI3QYMurTsLxy8Qlcu/xWzSMtKd6bBrj8mLQz+LcOYpQ++2DKtRx+4T0A1b9O/haZcvqXcMEkq1gda53Wp1TZ4BGOthFLQxXIWh1avko9fxGRT0YOG4ZT6rmVdqEiKkwMMq3v7kdVjzVs1bCcz6uMB60KjOXVK8cv1p43g8rRDepQCGiEEEZ6yeGnIC2TDI7jSCk6HLU5B1NEFzbT+rMsZ+VWu0n4ye3vHMyRbFE6BeKT4rzoJx4OsZ8SbEJGxmjkk+cAkyR9eZMKBd3/t5SVjS/d6LXj9AND4Rw8iS2qHHE5pf9x9argiEB3KFKa6RoGYcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tZrF0cvVNRFKETrh1Mn2lSb9PhkkGqIQDW02uMlZ0cc=;
 b=xOUkdzLnHNe9md/Pd+cfT0q/zYmFIk2plcunloPMvivkdvVFeBWpwv/a7X4praTrNii1Db9142QD608lhIgbKmJsuAIdshfOm1j+NV7paoeo/0iOOyrIV2BhkFqlb1m+jfJiKvzTQ/P9qbRIhKSwJca83P0IyxgrcbMSv2VuF0LWjwLh5TGpgxVzSXZ+tCLj6+cKUQkvQYX88NqORSKUYJ0s44tydF/jHYzUZWK3NzLioAYN3nGsJ4dZkKWk1EtSum5TlU58PxsKazdoNByybXs7IEjRHCUM/gMRC9KHFQcwuWCTULNvn4Sye/IgPaXgW7LZRm8g/VrwOUCV2oDhEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tZrF0cvVNRFKETrh1Mn2lSb9PhkkGqIQDW02uMlZ0cc=;
 b=dzBRybgqTwKzt/KpO6ttpUnHCplWenopka2GqM0X5PZq3ALU6JGW2Y4ckdXSgqAv/7iefEPUxDOUV6abBUBTo5PJ998NKnRNIfCLFWJGkNB5Bl+4IlpIEUYeXx50gyDUWRwE5Ka4hJAN7VHpgtUaHNVzJ9UtNamMFqOsatS8yO4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB6671.eurprd08.prod.outlook.com (2603:10a6:102:13b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 17:37:20 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 17:37:20 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "skandigraun@gmail.com" <skandigraun@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] fmt: add ptest support
Thread-Topic: [OE-core] [PATCH] fmt: add ptest support
Thread-Index: AQHcQr2lw83gBgA6JkuUF0xevqAWH7TWSyiA
Date: Mon, 27 Oct 2025 17:37:19 +0000
Message-ID: <D12055F6-831B-4190-AF53-83969C94B61F@arm.com>
References: <20251021190509.300000-1-skandigraun@gmail.com>
In-Reply-To: <20251021190509.300000-1-skandigraun@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAXPR08MB6671:EE_|DU2PEPF00028D07:EE_|FRZPR08MB11219:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c0c88f8-3bdd-4817-8cd0-08de157f8e5a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?N3pxdGlCV1I1WWFGcVZtS2VkUTk1T1BiSkJkRjRpMFRwaURuUHRqaHhLVU1k?=
 =?utf-8?B?V2Z2d0FYMTZnZmRGdUc0TkZBejNXUjY0SmVYMlFFNTYyNkI4d0tPeTRPaE9m?=
 =?utf-8?B?RWxCd1RIdjNpUnhRQnlJazY0SXVwRDZ5dzd3VE9adGtPMU01cWNwR25jdWFj?=
 =?utf-8?B?RDNVSEg2Q3l0bFdmcUV2OTFGZy81L2YyQk1BaUFOVHZVblNWWC92YXg4Nlkx?=
 =?utf-8?B?R3ZyNm12WkNBNjdCcG96TDJnV0M2T0ducjBkcm4vWWFSTWRXRUh6ZHEwRDB2?=
 =?utf-8?B?S1NEQktsMkhNSmxsQnc5aVFVYU1Tams0SkNzak4yRTF0UGFtMTV6ZndNY3Na?=
 =?utf-8?B?bGJ0eTlYSC9YMEg5ZjlqM2dxVkwvcXh6dlZ2V3cySmFHYi9Wb3pPMjMzSlY3?=
 =?utf-8?B?OWxIOG1wSWtXblRtSTdnZ0JKVjFxeG9INTNaYjNhTU0vNU03eWFXbFlpNWVE?=
 =?utf-8?B?NmEyQWYxeWZ6Rk1BQjhQRlhuZllUVXdVeC81NjIwU29JdU9XWUxOZUxqZGV5?=
 =?utf-8?B?N0o2RGdNdkdicW9QTWM1N3ZsenhOZWRHZmdOS3d5eG1qb0RZZ3lhMUpKd0Y4?=
 =?utf-8?B?L0FyNkVqcnhjR2p1NkVrYTlLazZ6VU1BT0FIbmp0bjdvcmNYTFhWWTlrRlRN?=
 =?utf-8?B?OGZVY3hRd3RLdFpBTkdMV1llZ3JCZHhjeXBaMjZRb3hIVlJLS0FDeXd6cnlQ?=
 =?utf-8?B?bmx0RmlwL1dhbzBzMC80b1RWYjZLZ1U3eGozL0wrQkJ3OE1vNHEzRjE4TURS?=
 =?utf-8?B?UDg0anRDbWRnQ3R3dE9KY3FTUHBiQjhmanlESnh0K1g0MGJLTVk3YlI1aUp3?=
 =?utf-8?B?bjlQSHVyMjd4QXhjb0xuOGJaNGliUDR1VGROUmxBMktrditQUDgrM2s2ejJ5?=
 =?utf-8?B?WnZtVFZkWFVWckJhTStJWGdoaVd5RmhpZ0ovSmhCRFJFcnNDYUx6SWgrNG5E?=
 =?utf-8?B?OWhoRUdBaGVxeTEzbmlvTkFES2dSamRBSlBsWE1pU3BCNC9oVUtkZGM5R3Jx?=
 =?utf-8?B?Uzc5bzFVY0lGQmVzOElCNGJVWGNFR1RabURZRVlCT2lBNE5WazhtelNKMkZ5?=
 =?utf-8?B?QmhxOUhRaEUwZDhPNExBeDZ5dTJ5TWFCOWpEYVo1SnVWc3IwRTVlbEM4Q3JY?=
 =?utf-8?B?bm1HY0dvb2NLUHZHWTFUQVVDNG9uNVB2L3RqSFhtRm01U2t0ZkxEajBBQ01Q?=
 =?utf-8?B?bnNxeVA1enlscjl3MVdEQk1lVzczaDhpOEJWWHdmM2VQaXorVW0yNGZiUUlU?=
 =?utf-8?B?bExtcnNzZU5TSlg3SFZpaVBSSElwM3h4cEkyeXgzcVI1QklnUDRrdXFBZzBv?=
 =?utf-8?B?ZG15dEtxZmZVT09pNGVxUWxmMDFnSHRGRGZVSmJqQTM4eG45dUVQdEwrVjc4?=
 =?utf-8?B?Q1BCaW4ySzlURHA5MElUMlJMOFdvTC9ocWt3NUNlUjVONWFPNXVxN0Fwckxa?=
 =?utf-8?B?aDRnSVBTNy9VUDQ5S25CTzVBRUtaUlJ2b2owVkk5clpGUERZTnVGcGpab2lQ?=
 =?utf-8?B?V2o2cTl2bGJvdDlKSHMwMi8zc0JhN2wrNm9FRmNnT08zbjF2bS9lb1k1cWQv?=
 =?utf-8?B?Y0ZNbUU2ZkhpaElzY3B3bVcyT1E0UUtLaW41VXlDMWRsam1vZXl3dE9VT1Ro?=
 =?utf-8?B?TVN6aTBJRmdwVFVmdTNQM2k1SXdJdDdjTFlOR1IzSjk3WDJKTUFyVXhaditY?=
 =?utf-8?B?ckdSM2hZdE0yWGNOQmpMQmpwSTIwbmp1cVYwaGhIVWxBM1FXSjJvK0R5RDZ2?=
 =?utf-8?B?dW5FaGM5M3BNODlPVXBJd2pGeEhFVTlZOW84bG9wbUs0UlJZWU1GZGpHOTJJ?=
 =?utf-8?B?NXgrMGNwZ2R5WTNvQXNHcWNZeng5Rm1jZXB1QTNBTE9rRnI2RjZrU25Ja2h3?=
 =?utf-8?B?WThwR2k4YmZZWGkzcXNwby9KQjJocGljaUdPWTJlb0gzZG1Cc0dFalB4R3Fj?=
 =?utf-8?B?N2dSS3E0MlE4Ri9NR04zdWRJZWYwc2tnMWdQWWJZaWZhd09jeW5jdCthSDEr?=
 =?utf-8?B?RDJFOGxqZVRSUzcwMG5rdXByNHY5bi96ekxsL3RFUk95aU1XRTlCQ0FmRXlq?=
 =?utf-8?Q?7wQnMn?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4EFB28A0061B84499AED59ED64B8C8C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6671
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D07.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8fe1b1d3-5f1b-4ae1-9086-08de157f7aeb
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|35042699022|376014|14060799003|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SE85SDgzbWdzMys4SmR1WHl4cGJHb21KRVNnb3M0ZFNkUnpLc2xBNU5JaEty?=
 =?utf-8?B?TmdvRzlNUFZSZ24wbzA1NEErK1V5NkdVQUFUQ00rQUxZTlhNZTFPUm5ZVlFt?=
 =?utf-8?B?WmxQM20zWXVURngvWCtocjZJaFd6VlcxSndtL0xWaEhZOStxRVVXckp1cy80?=
 =?utf-8?B?cFh1Q094enY2d0c5MU5KVFhZTW1LMFNrV0xiWGZUZDlWVmFPSHJWV2pEUE16?=
 =?utf-8?B?QVdGeE5sWmdYMXJsOXZDSmp0MjhuVDBvTlc3ZTR3MUtyMTlieCtKRHlzQ0ZM?=
 =?utf-8?B?NTdDWnRNU1NBS21IQjJiSitDYTE2c3FKa1FHMWl3LzZBMFJiZ013QmQ5Tklu?=
 =?utf-8?B?Z1gvOGc1bWlydVEwVklSdmdMc2ROTitwMW52VEF6Qlp1YkpTKzVkbVdsVGZh?=
 =?utf-8?B?MHJjVDZuZFBNclJyQlJwYWF5V3NuY2J2dHF1bXFrbVJESXdwbldzU1FtNGZm?=
 =?utf-8?B?ME9ZYW1ZWk1OeHNhS012VEp2UHpnaTFhdlFBRTBXcHJ5SUhuMncrM3NNS0dj?=
 =?utf-8?B?TFZJT0Z2T0Y2QXZvTktYU2NlSThKU3IrRmlIV0YrajJUQ1pZVm1XbHBOM3Vh?=
 =?utf-8?B?bEdwNGFXbVNlOE5jTlhUaHE1a2R3dVVVNVZkSkQ4aGxkN0xvb0dWcEZNSk9o?=
 =?utf-8?B?UWtJOWMzUm1EK0ppTlBrTGgxbWdHN290SThaM1hINjZDV3M5YjNrWVlFOU5C?=
 =?utf-8?B?dnp4bUVqeGlNcGUwV0ZSYkJ4ekp2YWFwQkwvVlNnL0RObHBHRGd0eW54QWZK?=
 =?utf-8?B?WG03NGo5ME04ejAxS3hEaDUxQWJ6ZFJGOXVGY0ZiOExNSlVyenZNeHFzOFJ4?=
 =?utf-8?B?N0E3VnF5NjgvL3I3eEd1aXRpNnBQZ0drSGVCdHcwREZQeHprYi9aVWxxUG5p?=
 =?utf-8?B?L0h1NjBISnpzWm52ZEFCb0FDV2FzNmNicWZyZTM4QUlNTkJJcW9UOTZxSGln?=
 =?utf-8?B?VjYxUG9KbmVxc3lNSCtNbm8vb3VoZE5PK2tTYmRCdkNjQ1lCQW91bkwwb09E?=
 =?utf-8?B?cWJMZ3UzbmxKN1Y3ZmhYdGgzY0hkZDVxUEFzVEQ1Tkt6M1RveExibHJkd1VM?=
 =?utf-8?B?Q042Q0pwd1ZjV2IzR1d6Q1NsdXRrSHFpeEtWQWQwRzkwZmxURE9pMytOT0oz?=
 =?utf-8?B?SDY2V1FIZWJkbWVQSWxtYU5oUHhiRWRUTEMrSDVraDVNZHFBSkFHaEozQXdv?=
 =?utf-8?B?cU94OXFCK2lPNDRJc0V2Q0ZYTjNJUW1LdXU0Y3VWUW1FRnE0TndvYUl2cFhF?=
 =?utf-8?B?TzRlTHhlTkZJTDA5VVhKTG1iQ284L3A0OVZuUGt1UWc3K2Y5Ly9wMEFqNjJQ?=
 =?utf-8?B?ZHc0dkl1NE5WR2xIdnlaRGpVbGl0aWZVeS9mdXF3WVY5MU5PdG1zdlhPWWpP?=
 =?utf-8?B?aDVoTzVXUlZVL2pJMzk3NlpTczlJU0F0RHo2UTRUa0pSUExEZGhETGE4S080?=
 =?utf-8?B?d093alFzREMrUHUreXpqTFY4NnFhd0xuak1OSnE2RlJKRm5tb285VWl4dDZJ?=
 =?utf-8?B?Y1BoM1FYaDJtMHUrUDlOa09tRHV5NjBMb0x1M0JTYlBNemQ4REdudm5BZU1v?=
 =?utf-8?B?dmtvaUpTYkwrKzlzTDdFVkkwVFBYbHpKTmJHUGk3aVVrekRwSjZ5TnFUZmVR?=
 =?utf-8?B?dXo3L1B0aXY1QTJzS3ZXem81Y0tTb09sd0dycUdZbnZqY1c3cnA1ck9QdnN0?=
 =?utf-8?B?MzBkNFQxa1h2Q2F4N1lZREdSb1BpSE9TYkxrRFNJVlkwOFJFMnlaS28xTG4r?=
 =?utf-8?B?c1FJL3FaUVk3anFlREZHRUk5R0s4YW1kSlRmdmNhRnlNRmpWYlR4Mk1Db2VE?=
 =?utf-8?B?bzJmaGNlTTlUOURCWkJRQnNuNnhmWW1NSnhxUWZ6aFc5M2g2eWNqN0FuVEZk?=
 =?utf-8?B?c1o3VDNsQzZEZGc3Ym9tU1B5NTFuNW01bmpIa0hreWl4TWJKbmNVTExMS251?=
 =?utf-8?B?VDB2LzdGNzFTM1lpQVZRYzRSekFXRHM1a2ZqaENrb29uenpTNzNqWHlUUU9x?=
 =?utf-8?B?UktGNnVoM0ZMNkVNSFEyNTdCRWNUUDNNLzNKTWw0cTNzdUFleG01T0dWMnJJ?=
 =?utf-8?B?YzByeHRaekEyTFE1eXFoTjZ4bDd1bUFkbTlxN1VjV3NCQzVsQ205VXJRL3FR?=
 =?utf-8?Q?MrFU=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(35042699022)(376014)(14060799003)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 17:37:52.3615
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c0c88f8-3bdd-4817-8cd0-08de157f8e5a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D07.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB11219
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Oct 2025 17:38:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225341

T24gMjEgT2N0IDIwMjUsIGF0IDIwOjA1LCBHeW9yZ3kgU2FydmFyaSB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8c2thbmRpZ3JhdW49Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiArKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZm10L2ZtdC9ydW4tcHRlc3QN
Cj4gQEAgLTAsMCArMSw1IEBADQo+ICsjIS9iaW4vc2gNCj4gKw0KPiArZm9yIHQgaW4gYGxzIC4v
Ki10ZXN0YDsgZG8NCg0KQmVpbmcgcmVhbGx5IHBpY2t5LCBidXQgUE9TSVggc2F5cyB0byB1c2Ug
JCjigKYpIGluc3RlYWQgb2YgYOKApmAuDQoNCkFsc28sIHlvdSBkb27igJl0IG5lZWQgdG8gZG8g
YSBscyBoZXJlOiBmb3IgdCBpbiAqLXRlc3QgaXMgc3VmZmljaWVudC4NCg0KPiArZG9faW5zdGFs
bF9wdGVzdCgpew0KPiArIGZvciB0IGluIGBscyAke0J9L2Jpbi8qLXRlc3RgOyBkbw0KDQpTYW1l
IGhlcmUsIGZvciB0IGluICR7Qn0vYmluLyotdGVzdCB3b3Jrcy4NCg0KUm9zcw==

