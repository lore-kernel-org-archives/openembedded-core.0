Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3FBFC3DA49
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 12:24:18 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.79])
 by mx.groups.io with SMTP id smtpd.web11.60198.1721996651322158292
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jul 2024 05:24:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ZWUzU5+P;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=ZWUzU5+P;
 spf=pass (domain: arm.com, ip: 40.107.104.79, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Tcraoh5XXMYQVoVKY3UdoUNxWnwlZYMSuLFJajPZKDE6Wbo3xBSItjq20/3Lvt6wh2MRwci+A1PEQKCEvHgD4UKPWuwYmNI57WfRY4S0fxTIWbbLBXMTdfGP/sgJ5BpJDSFe1DDkqVWHwCrPDzeWmDe4SxS/egSzlMfpSjevxueTaEiEnDNRc0Be5OTrYr/xKrSoo4NhyF1iCq5oXfkvsK3Ld4psxMTas0WBtGtl0gT8Yda4wX2+9m4mPsg0YMQcJimyvW45xYAt4oKI5DTQynDt4FRFTX+xy8Dy7lLhkKHxZ6go5OgBB47V+lhjDihtXQe/5s1buZtRTszl1BzvTg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1dIWCpF2FFyvdEBONEhfKMUrtqBnmAf1sR36w+wIcf4=;
 b=ehjDtETVCnInjqQyYc7VsZamVK8EufTUVYSjjEnNhpXfQrWOCbAe2Uzg/qhzr6F68h57qU/eUzq28WthiL3xuF7RHERTGyDK3HqDwRMo9wmhdoE2XutVDOUf4b8DZitJ8RLR209uaDKa/2142y2fE8sjMM+7RM7L8i4DbEQBHc9ST79CrABJfjMarncyV2E1L+8rcmWvIKPoHC4F37AfHDSRSHqBSyzdBR0l3grBOBcHIXBpHz6dueRWML8h4J0REohHatrxNG6u0iQcjA9umXPOlUomu/786vzEOt77RF/jN0F5RbzpA3q+lfMyFrcWKHnvnJoXFn2/xmcNX3QXrA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1dIWCpF2FFyvdEBONEhfKMUrtqBnmAf1sR36w+wIcf4=;
 b=ZWUzU5+PtYLA+C29b619TndOcH5efgh05dVU//dFWpSdrGB3CQK03zi9ZvmXSRYjwBSiiWMzoTKvFBp4BpT/fIXW1BEhDnzFiyYbpRiwmZ+rzGUMjZNK6mqNlTVB87e+cbzVyuRvOGf+FRn5PXXdcL6oaSIvrLJuakgbikli448=
Received: from DU2P251CA0020.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:230::29)
 by GV2PR08MB8679.eurprd08.prod.outlook.com (2603:10a6:150:b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Fri, 26 Jul
 2024 12:24:07 +0000
Received: from DB1PEPF000509EA.eurprd03.prod.outlook.com
 (2603:10a6:10:230:cafe::e9) by DU2P251CA0020.outlook.office365.com
 (2603:10a6:10:230::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28 via Frontend
 Transport; Fri, 26 Jul 2024 12:24:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509EA.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7784.11
 via Frontend Transport; Fri, 26 Jul 2024 12:24:07 +0000
Received: ("Tessian outbound 5cfbd73e165d:v365"); Fri, 26 Jul 2024 12:24:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: f9f35c9bb052b26c
X-CR-MTA-TID: 64aa7808
Received: from L84ef50d719df.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id CC3697DC-287E-4C6F-9282-0823355AEB0D.1;
	Fri, 26 Jul 2024 12:23:59 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L84ef50d719df.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 26 Jul 2024 12:23:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ohNTbCOKTX4Jmueekz1rYnGMiAgHNAYx6sAGSw+hmfd9Hvp/ODLR8x4SOolSs+JNIPqiAdfki3RnyBPcWlk6PG6SeWvaBCs3DKJJ00VGui9qJQLXItFRBOMWlUv2ltR+rAFKM2SDt4s3Wu8UrFOziqziIcKYGI4X/oIUZhqPJSPEtFauxv6sIsvJ2gNEhOV5goDAYNxuH7sqhCasaCv7tlfGICfArTX7Wkm4ME/c3fKRsiFpGBMn+kMIlD/3lqa/7LbUq/StBp2mtvYgp/I40TlyfG90Khu7SAkqUEO1+Z8c4TcoCyF+IZZnl7GvZbspEBquV7+QTZP/l5gmSuobhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1dIWCpF2FFyvdEBONEhfKMUrtqBnmAf1sR36w+wIcf4=;
 b=svrNDFsXcl92UZzcY4GaqoTvNLvUREyBLF7G33sWn2ZVB5EmSbuCUC5nA+O+PU9Mu5VZFgTRMxWcQinxM2lMicaHx6nvAj1qEDvwLRh0ATJHmzb1+nEMGUWr1dGD28f/JSgIbjTkr4ALVKGjDOMDM/1PWBjQtxJWpUG2ZxmW5kfCJwRq368Yt4U+oAWAWtrut17QURtCZbW2DkPmzBpTmKMPkTk0GmwMXLNXPE9lQekqdR2x7AZwCd+NFoq5IrQQGUh0OYP97y/5+haqdR5cONHUdTtNUP8y94UDKhS6rKbx+3YcuBvowZU/x98Xsb3TpleqkWr9nI4lYSFelgDivw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1dIWCpF2FFyvdEBONEhfKMUrtqBnmAf1sR36w+wIcf4=;
 b=ZWUzU5+PtYLA+C29b619TndOcH5efgh05dVU//dFWpSdrGB3CQK03zi9ZvmXSRYjwBSiiWMzoTKvFBp4BpT/fIXW1BEhDnzFiyYbpRiwmZ+rzGUMjZNK6mqNlTVB87e+cbzVyuRvOGf+FRn5PXXdcL6oaSIvrLJuakgbikli448=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB10835.eurprd08.prod.outlook.com (2603:10a6:150:15b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Fri, 26 Jul
 2024 12:23:55 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.7784.017; Fri, 26 Jul 2024
 12:23:54 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Marta Rybczynska <rybczynska@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Marta Rybczynska
	<marta.rybczynska@syslinbit.com>
Subject: Re: [OE-core][PATCH v3 5/5] cve-extra-exclusions.inc: add deprecation
 notice
Thread-Topic: [OE-core][PATCH v3 5/5] cve-extra-exclusions.inc: add
 deprecation notice
Thread-Index: AQHa3d3mr38Nak/grEC1krXBZlk/eLII8ZQA
Date: Fri, 26 Jul 2024 12:23:54 +0000
Message-ID: <44B6F27C-F828-46B0-8DCB-FCE37FB8DC9D@arm.com>
References: <20240724152530.25856-1-marta.rybczynska@syslinbit.com>
 <20240724152530.25856-5-marta.rybczynska@syslinbit.com>
In-Reply-To: <20240724152530.25856-5-marta.rybczynska@syslinbit.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB10835:EE_|DB1PEPF000509EA:EE_|GV2PR08MB8679:EE_
X-MS-Office365-Filtering-Correlation-Id: d1b8b0b5-06eb-4475-f9c9-08dcad6dd84b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?cUFCQWRDcG4weEIvejVnOTBXcnk0WG9tWm81Sm1OVExpRzB5Qk5TNTdwTGtJ?=
 =?utf-8?B?VFl1Uy9vdlI0aDhDUndxelhVZVZKV3Npck10OU9JYkp3WFE5ODNPVGZOVkM1?=
 =?utf-8?B?RmZkQW9reVZqQTJMcXZaU1dLVlVUaE52cDUrN0I1Nkd3SC81OU5OeCtZL0xN?=
 =?utf-8?B?a0tVMzZvdkdyMW5EdUk1a1BEWG0vSmgyMENDNHV3UlZrVVNQMmdZT2cySmRJ?=
 =?utf-8?B?YS9kR0UrS1hlV3pKd2lXMjJXTVRIN0FMc0lZRU93OTB5d0hneUlxVlFFRStV?=
 =?utf-8?B?WW1heEVWM1RRM09tZFV2YWNaeFpVYzFRN3BpRTBHdG1EOXBSOEdLMGp5ZERQ?=
 =?utf-8?B?WnhqZ1Brd3FjTmZoZTlMTjJaMVFKWDIwQW5EMmdQbERvZHVKaFNTeTJONW5n?=
 =?utf-8?B?eUM1bUlmYk5PY1orYmZOZE5zMmFEVGF6bzdrNnphejJMbzBWbjJBZ2p6USsz?=
 =?utf-8?B?UEJJMURsbDJDcTcvbDAxSnZ5Kzk4VDQ3dW13TXg0cWtlaDQ0d1VtQkwzRnJF?=
 =?utf-8?B?WDlHMVcwNGZZcEttL1FER0ZVWG9xN2R6aFZsRitLRjJyamh6WnFRWlJDWFpa?=
 =?utf-8?B?c1BFMnZBSU1mRGEwMUZpbEJWTzdFYnFaOVl4eGJ2QWdVVVQrN2tHaXdtaXJQ?=
 =?utf-8?B?M2c2N0x3ZXJudEJBOFo4RVRsbXVMa25KTlhJV3p6K243Mzl5TlJGRVRFemZS?=
 =?utf-8?B?RXBnMmJac1lmcHJvMFp0blJqRXY2dXhuVE1hakZBTVU1N3I0NjlHR1ErZjlu?=
 =?utf-8?B?eXRMZXM2VW5oNGNNUkNMVEtndEJCTURYZEpjMjFlSWkwVjU4NlRsOTVpZlZj?=
 =?utf-8?B?YkszOW9aa1MwQ0FvWDNmQm1XdVNTZUNlMThIaGsyM1EvZlRaZHY2LzBUZXl3?=
 =?utf-8?B?WGR3cndpc0psT1NnYUlGemllZUZIRElKUjloTnVDWVRnaExVcFltZXlsanIr?=
 =?utf-8?B?OXVTemZsUmsvcC9FYk56dzRKOXF2V1dKNTNqQW1zKy83MmxpbiszWUVwVVdn?=
 =?utf-8?B?SVBnVG1Ud09VRGNCM3Rlc1pTVnA3Y0ZpMlpmdElnUW01SDVQdDhQOUVxOGlV?=
 =?utf-8?B?NVRxUzRDSzl6V0lrSUdzZkVlR0paVVE1cVd4QVdMSCt6RlVzaTRUZzRod0FE?=
 =?utf-8?B?c2V6SXlacERVRDhEUmlEU0Nlem9sRGJZc3E3V05VZ1dmZTF5cFpoVnp2SXA3?=
 =?utf-8?B?NFEzZGVRUFcxVkx0ay94U3duT0ZVYVlmUEFvQWtQd2VtVG81WHhPemNqSDFq?=
 =?utf-8?B?VDN1aUpVQlQ0UFJsUnNiblRUdWljbXRrc05LSm1VMUpYaW5MVENYSHhQMGpz?=
 =?utf-8?B?TUFLczhRd3RXSlpGUXR6VWl0RWtPdzVObEYwRWdtK1BRR21pSmFpMnREQXQ5?=
 =?utf-8?B?MnhraW9WSFd6bitqMW9RTE9oVElmajBIZjlvbWxodXFrNnBiN0lZR2QzVjBt?=
 =?utf-8?B?djdqbkNmQVorbGJJV2FEZzRMK3kwck1vVS9GU0NzSEttdGlwTUpwOHhoT2FT?=
 =?utf-8?B?V2dSTUx3LzRHckxIMW4xQ3FKQnZZT3pWZEhMaE50SjZOUENBRGhVb1h1dSta?=
 =?utf-8?B?YWZsWXVYRlpMRStGNXNDVnBTWXhCTEhndGxwTnY3emRYeXlNbGJ4U3M3SldT?=
 =?utf-8?B?ZGIyaHBTaFM2VlNQZmdzNkorcVhEczB4MU1SNkdMbkpCakpyUmVnWXY0MWpF?=
 =?utf-8?B?anhBMUg1UXUweGxUcklBNGthSTdwdDIxbTRma0ltZ1R5ZmRlNjNtOVlxOEhN?=
 =?utf-8?B?cU5kY2NVUDZGWG1XT0FsRHlWa1BzVi9yTHR4M2Z4KzFKRms5QmZuWHc3S2hZ?=
 =?utf-8?B?WjlXUStDcTc5QW0zRGlvZC9ZbHRmOXIwRkFzOVNNLzExVW1VdE9sVUZVUHR3?=
 =?utf-8?B?RGpyWXFXUTZLM0Y0c2oydGd2QXBKUEQ5dU11NEZlUlg3eUE9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <21F619D237643144B182417DE3F25886@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10835
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509EA.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	30e7128e-44d6-44d5-4981-08dcad6dd104
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|35042699022|34020700016|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NU9KR0JKUVM2eURrOUI5NmNWQnZRRHluWWtxZG5qNzk2cjUyVUh0RW1xMk5a?=
 =?utf-8?B?NkVBUk1UMVdURGxwZzc2bTJrWEFjUWJ6Mjk4N0ZDTXZIMWx3Z2RFdEhRMWdZ?=
 =?utf-8?B?aHdvTWVxL2xSUWl0dFVOZURBSE9iRGw3NHFZN1pVUHV0Qm5nenM3S2YxamVm?=
 =?utf-8?B?dVVvVHpZRU5LMnlaQVNTMXV3czU2c0JPVkw2NmkzekVvczFTenV1b3U4S3NJ?=
 =?utf-8?B?b29lbmxKc3VQbjlqRVVpMy9EaWI1RklNNFJyNDhJazZmbHgwNzQ0MXZjck13?=
 =?utf-8?B?eFhhZTduS2dxMWlBaFNaQlpNL0NYSGxjM0NldHQ5cVl1UkVoR0NTQzl3UWVD?=
 =?utf-8?B?b0UwbW9wZFFmSkZPeFNIcC9EZGFaQmw0dnhTNXVVbjhXaHYwZ3BzcmFnY3E0?=
 =?utf-8?B?VHVvaHUxWi9OSGdyRWJHUWR0eEZwaC82YUh5N0dRdzNvRXNSS3p6bVFhU1c4?=
 =?utf-8?B?ZnVER2JuUDkrOGhMSDZFY3VEYmxIdzF2d245SEhYTXpMYzRIb3JTOFlwSTN4?=
 =?utf-8?B?OUJ0U1JFQ1N1U2NZeGI2b1NFTjhURHV4TUxhQkEvR1hnZUlrM0J5S3ZFcXpz?=
 =?utf-8?B?ODMxYys1MHNzVy9pOHhtU0wvY0VJa0IxdDVubDdoY0ViOEZkYkNVc3Y0VFFS?=
 =?utf-8?B?RlpUNllDNU15dzlTenAyL3JhZ2s5cHg4ZWpzOWVJVEJQbGdLTzhXenJ5VXhL?=
 =?utf-8?B?Yzc5VXR0b3YrNVhsb2xSZTBJN1EwZ0Z6SXFHM1FnTzZYUVVhT2t4M1NzS1Zv?=
 =?utf-8?B?ZHgvVTNQN1dQbUEvN01oRkxha2pwblJnVlJKK2RSVjJ3VTgwYm4rcjEvaG12?=
 =?utf-8?B?dEJVY3lKKzYyZlJ6WFJzcGpEWi9NK0dZd29CbFhYeHBrTEpjUXczckt1bjAz?=
 =?utf-8?B?bmJMdTd5QWZrWGc5dUYySVpzOWNvY0dIdW45Z1ZoVEdzTlJMRWNnb3VWajZI?=
 =?utf-8?B?VHI5bHV3anhodlQrR2tONHRmS2VRN3BXbEx5Z3hzcW9ORlJGdWpyaVZNMlp2?=
 =?utf-8?B?SlR0aFBCQVBtdUVvU0UxK0ZaYzBxMUc3YWlyN25xYTIzZk1yTGdibzFodXNr?=
 =?utf-8?B?VU56NVRPTytFZnRzeTU4eXZLV2FtdTJwY2k4WXhtMzdLSGk1RU14eWhQMXFU?=
 =?utf-8?B?LzFvR2ZncXptZ3hNRFVjSHJZUmZ0aEVYSU1CeHcrZENLYmtvR2FzZE90NXM5?=
 =?utf-8?B?YUNJcHlWU2VDcTNoM01wZWp5UFBuNHIyNkt1cjBaMlo3OGVIU1k2OERrRDRW?=
 =?utf-8?B?UHF1Sks3VHNCb080bE81dDFYcW1EM1UxdWtQZkQzTzhGb1lBM2pUOFhDai8y?=
 =?utf-8?B?ZVBvS1BBVXJ2cnZEK2VSeUkxampweUlwUkZ1UG9EWW50eFNvbUtvamNpMkF3?=
 =?utf-8?B?VlNKais1TnI2a1FjRHd2bDN2VHpUN3ViWGtqRSs0WkN0dzVtNFU5c3FNd1k0?=
 =?utf-8?B?Yk1IY3ZTMUtPY01PN1R4NmRJM1k1RldCK1NJeFl1VzUyRFVHaEpFa3lFaHY1?=
 =?utf-8?B?U3Y5b0U3bTJZeWJWR0hldzJVRy9PdVoybHVRWm1kcXFxNGNtNlNrWERZV1pK?=
 =?utf-8?B?b3RJOGV0Y0l4UnFHdEEyQ3RjK1NiRVdJTDVXc05zN0tXc0dJVWVOU00rcHRa?=
 =?utf-8?B?WS9COUpzM2VDN01tVnU5TkluY0gzOUtyUnJjeFI3cS8yRlhFenRmOEdpV0px?=
 =?utf-8?B?Q01CNlJoOEJleTBBcnR3NTVGTmh3Rlo1UHNhck5HQVBSSk5NbFFYYkZPNHVH?=
 =?utf-8?B?OHpXS3dTaEJHeE0wOFZ0ZE42V1I4T2N1czI4SGNyQzlEQjIyRWdYVmYvQmVY?=
 =?utf-8?B?b1ZRR2VGL1h0U2d2ekFRenpGUWNCM2c4bytBUFUzL3QxZE5QWGJWblJTY05O?=
 =?utf-8?B?NlljYUt2SHBHRE1MRUVNUGpPd0NiNmxVcG5VSHN1YmhSM3hjSGxsNzk5MWtV?=
 =?utf-8?Q?XPdb+u1SdgswCmE5uKMbhE0xiOh/y9Wc?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(35042699022)(34020700016)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 12:24:07.1509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1b8b0b5-06eb-4475-f9c9-08dcad6dd84b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509EA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8679
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 12:24:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202534

T24gMjQgSnVsIDIwMjQsIGF0IDE2OjI1LCBNYXJ0YSBSeWJjenluc2thIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxyeWJjenluc2thPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4gDQo+IFRoaXMgZmlsZSBjb250YWlucyBDVkVfU1RBVFVTIHdpdGhvdXQgbWFj
aGluZS1yZWFkYWJsZSBpbmZvcm1hdGlvbiBvbiB3aGljaA0KPiByZWNpcGUgaXQgYXBwbGllcyB0
by4gQWxsIGVudHJpZXMgc2hvdWxkIGJlIHZlcmlmaWVkIGFuZCwgaWYgYXBwcm9wcmlhdGUsDQo+
IG1vdmVkIHRvIHRoZWlyIGNvcnJlc3BvbmRpbmcgcmVjaXBlcy4NCg0KVGhlIHBvaW50IG9mIHRo
aXMgZmlsZSB3YXMgdG8gYmUgYW4gb3B0LWluIGZvciBtb3JlIGV4Y2x1c2lvbnMgd2hlcmUgd2Ug
ZGlkbuKAmXQgZmVlbCAxMDAlIGNvbmZpZGVudCBhc3NlcnRpbmcgdGhlIGlzc3VlcyBjb3VsZCBi
ZSBpZ25vcmVkLg0KDQpIb3cgbXVjaCBvZiBhIHByb2JsZW0gaXMgaXQgaWYgdGhpcyBmaWxlIGNv
bnRhaW5zIGEgYSBsaW1pdGVkIG51bWJlciBvZiBDVkVzPyAgV2UgY2FuIHJldmlldyB3aGF0IGlz
IGluIHRoZXJlIGFuZCBtb3ZlL3JlbW92ZSBhcyBuZWVkZWQgdG8gY3V0IGl0IGRvd24uDQoNClJv
c3M=

