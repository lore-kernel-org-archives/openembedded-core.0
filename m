Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9170ACCFA04
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 14:41:48 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.51])
 by mx.groups.io with SMTP id smtpd.web10.17286.1761921704179525017
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Oct 2025 07:41:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cE2xlhXl;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=cE2xlhXl;
 spf=pass (domain: arm.com, ip: 52.101.65.51, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Alu9oa2uEtHhBhtulr8XOYI15D5T+eEwuQWrNA86Hw4CHktdrVuXGF85CzABTtR4JWtkRFM6qbXOlsEk9NMZsweZEGVT1VM+gX7gxDB9L+0bNLyBXiehAX+rJzY66BalSHwwMHdmREBQ6d4jAUIlRejIykzwXknmaLw4humYj+LNKrS/WaA+fhWIeCspAHw30nemAxloYUNU4lDwMwwIY19/fHgnvQw1R3PyBdVUDwKDm2guO29Wl+QhvZmzV0aU0Q9o9+W+6O6iYE9l5rjfS55Q2L8EtSVsKzy1bW5+pRRt5i9KXi08ex18w96PaoyIhlnvXqGLUsZOD0JlRWo8pg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xNFC/31kAfFCy2vFj3vwMyufepzuvu1eTcn4dDZiPZE=;
 b=VfOo2UZZ34lLJeD051xinev8bDh70Bs7IPofl06m0CtOCRz5MrN/lmCzBm1FV8Hn3xlsBVVBSMi6wteDgc0u2OIwjF8BsWlhZRDdt/R5XwLJ/IKj7CTxGCE/kKpFMf33bHy238prrCvMrqR73TzR+64dT2L+78AnRruDVyg83XYJRENSmZd1D5ZIPua//dfPmRoY8qePREukIn7lgTHvKc5TwAkLaTDJ/MDU0OW3rjf/dAz/SVp7QN273wcYxKNdO5HqstLCbYF/T5ah0secLWWXwcyXnjxH7u9yvrcwl4UR9jYJ/s5IzamsxqgnchVOGdBppsSFSAemK/QZ1uxsSA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNFC/31kAfFCy2vFj3vwMyufepzuvu1eTcn4dDZiPZE=;
 b=cE2xlhXlRxI68vKzkijvXJPUI3gufTStNrnCv7u4AIa6sEVPn/q4mdLqR7SYZ3sNHSXzZbfSKRIVp84hOwbpIesyZG0lVRl7RaB65dsPHrVfiq1U5ORNXwgVB+A3QR8xfLpahJhTInQxj6PzEptKOtA0FbMDemhxKZgB3AcAFTc=
Received: from AM0PR03CA0056.eurprd03.prod.outlook.com (2603:10a6:208::33) by
 VE1PR08MB5709.eurprd08.prod.outlook.com (2603:10a6:800:1a7::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.13; Fri, 31 Oct 2025 14:41:38 +0000
Received: from AMS1EPF00000048.eurprd04.prod.outlook.com
 (2603:10a6:208:0:cafe::f8) by AM0PR03CA0056.outlook.office365.com
 (2603:10a6:208::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.15 via Frontend Transport; Fri,
 31 Oct 2025 14:41:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000048.mail.protection.outlook.com (10.167.16.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Fri, 31 Oct 2025 14:41:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BFLIWzRboETZDznZvTa8zVRQyTh5WMRpbAb5wCkj34x4LcBoNZ/LMK6Ff9bmIucJ5wvdHDzJ7B+Y54ccpLtUwg16zAKQt2Cy0clhg2U4NiayxHHdR6iYhy/9LE7MYHUMA8cxwZ/Mme/PbcoPWtYvhvC1cjzSucbFJuLPDkJxlL5uD9Y27NQPGkqfgHzduzSS0mXgUxAcE74NTiYsqg5ERep40ZLBSfcaxY44fRqEX9tu4j7kkN3xGvfSqu4KY/6HdAgHcR6d9OxvPjV07C3eoxCTMuB/sPN8gV6gw9H4sEOtKR4DE+40ii10+G5b/Yh2Q9LTDR4wD0vPRAzX3QDxbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xNFC/31kAfFCy2vFj3vwMyufepzuvu1eTcn4dDZiPZE=;
 b=WzCNkmqbXDi0EI/vLyf3+d3FXjCFrVtlfkT/5VdRMD2v9Zwf3HQB1PwQqpKdFjrUu2mWONTRzSHWM9MaaGoIlNtWJxGmfL2iSBwlXs9QHxhljPRHZRBpkhKk1NHD7w1pKru0A8FPXWyhwypD2cdWTib0MY7C7ft1b1lRMNmD74C8FMmVVd/TeA5biLzVmhKbQG8E6BImR7Ala7ghXXGnBIExhBXLPsHwHjz+6Hb6KzGBJTLLCUDsnTv8vtyNYyamWom+YiWbMG/G3/kAf9aF67FPN2YmMia6lZGYW8a2bkHD9ZCsDM4cXpd3TJsiC3iMBMDF36iNO9VUHokyIvG9IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNFC/31kAfFCy2vFj3vwMyufepzuvu1eTcn4dDZiPZE=;
 b=cE2xlhXlRxI68vKzkijvXJPUI3gufTStNrnCv7u4AIa6sEVPn/q4mdLqR7SYZ3sNHSXzZbfSKRIVp84hOwbpIesyZG0lVRl7RaB65dsPHrVfiq1U5ORNXwgVB+A3QR8xfLpahJhTInQxj6PzEptKOtA0FbMDemhxKZgB3AcAFTc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB7676.eurprd08.prod.outlook.com (2603:10a6:10:37f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 14:41:05 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9253.017; Fri, 31 Oct 2025
 14:41:05 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Jiaying.Song.CN@windriver.com" <Jiaying.Song.CN@windriver.com>
CC: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] icu: use automake ptest output format
Thread-Topic: [OE-core] [PATCH v2] icu: use automake ptest output format
Thread-Index: AQHcSjHtl7/XukfqlEeEqVl4+xvOxLTcVFaA
Date: Fri, 31 Oct 2025 14:41:05 +0000
Message-ID: <9AB2FB13-6FD4-4F6B-B165-6074D515B330@arm.com>
References: <20251031064504.461920-1-jiaying.song.cn@windriver.com>
In-Reply-To: <20251031064504.461920-1-jiaying.song.cn@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB7676:EE_|AMS1EPF00000048:EE_|VE1PR08MB5709:EE_
X-MS-Office365-Filtering-Correlation-Id: d8b933b9-365d-41cc-de99-08de188b9938
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?czBEdElZVVRwbThGYXJONk5FSmpMY1h3b1IrVFdYOEY5U1QwNkFsaTZOMDRQ?=
 =?utf-8?B?b2ZLY28yaHhLUWszMXdLWFRseHY3ZjdpdkhsaTFOSlB6TVRrV0c1VjJQcDBJ?=
 =?utf-8?B?SWJWMHNmK21MY2taRjBRR2JKWXpIUGFJM1JPckUraXU4eCt3c0huR25aNVlq?=
 =?utf-8?B?WFBuc2kzeTVyMDFzR0lJV3R4V1E0QjNSYW1BVktFM3RETVVqT1Z0bHIwQTFP?=
 =?utf-8?B?MXlUUEt2VmVSTFovWmxIRHJHMWNXcGFQcFNwN0ZZYkd1WXU5bE1sakNVTmQv?=
 =?utf-8?B?QlNNUzR5TEltV096YmN2U1h2SkRTTGxPUXFrRDNsWTFmNEhoRnpCKzRpWUxV?=
 =?utf-8?B?dUZnaitZVko0R2dEU29nd3E1bTJDQzdjRmp1bUxROW9wSy9wM2wzYkYyMVNB?=
 =?utf-8?B?d0p4ZHNmNWVINEJIYXRva0dnUXhBMkpIbG1Yelh1aUFqTDRDbXd6cDMyWlA5?=
 =?utf-8?B?cWxGRU1GcWtwUElXN01vdm4yZFl0WTYxSjlpNDViZGRISjArMmFMZlNjYmlU?=
 =?utf-8?B?VXV0RHhpYnR2cTRuTVlyVFpYYkNtZlJkL3ZPd0NhYlp4M0FSYlRjSW1VbDl2?=
 =?utf-8?B?TGF1REh6ZXNKQjRVcGNwcFY5SzcwSmJ3U21jTUFlY24rZjdpWnhuOGdJNThv?=
 =?utf-8?B?clM4K0JLcHArVFlKa3Y0RVUwY213QzlsbGVpQ1BlNDlhemg4cHB6aWE4Rzgy?=
 =?utf-8?B?V3BhWDhBZnFSa0tJam1lbE1xaGYxb0h5d1hmWEUwTUFwd1psR25sR3lUMkdN?=
 =?utf-8?B?R1hvOGIyKzdqQk5EUm9TdnlyZUN3cE1Tai83bGJ0V0NiSk9xTXdlait0VCtW?=
 =?utf-8?B?bkV6TFhLaVZlTXc1c2Y1YUFuREFvK1RVSnJlUDFHaU11VmdMRGVlZ2dWTGJ1?=
 =?utf-8?B?Um9zeldPMHp0RXJnS2RmbzcrRU9XTUZ6bEFNRVpYaVczeVZ5UzJkT3Iza0Vp?=
 =?utf-8?B?Nk9nRlhuelR4bEZueXlHU1ZpbDV4NThFSThuTlUrQ3dPdlNuMjRNNGRIdVdK?=
 =?utf-8?B?V2NUWFZVQVJleCtZdzV6ekdLQy9UUjFVUHR5UUlualpMN0xpY1M0RUVBTkVB?=
 =?utf-8?B?MmVMNGkwdkZmNjFDb3Y4Y1FqeHpjVk16WTlDNkUwVTFTMWxtUSsrbDEwZE1a?=
 =?utf-8?B?aWJCc202SHkxdVBtU0hZYmVMdU43OUpnblVzT1BKYStSellpNU1aRGs5c3kr?=
 =?utf-8?B?dHNVSDR4Y0sveWdyRmdGM1FZamdKeHVTdG15VmpYSWFORXVYMkFtdUt0dkR2?=
 =?utf-8?B?Y0RvTXJiWGRnY1k1eVo5cXdCQlVzMk5TWENqN0I2TUxxUFFkOXFVMTN0MjJj?=
 =?utf-8?B?Yk9ESjhYM2RMS2swMEgzSjFiQlEzcThzeXNZTnlMdC91RXVsNWF5R29zTXBh?=
 =?utf-8?B?aFEydlRYeTRPYWlFcThuNE9sSjF4YVk1amN0TmlOYzR6OFpZeFRyMzR1Rmht?=
 =?utf-8?B?VnpZRkw1anJkeHVadmVaY3Q1V2cvTXdraGQwRUxlU0pZWThtMlA3bWNQcDRH?=
 =?utf-8?B?YjVjYUNSUXl0TEdDalQyMi9BS3d4eWxUVExoemVlUW50bGVZK1hOUGE3ZThV?=
 =?utf-8?B?clV0ZnFxa3R5cHVxNUcrYllLcDdwdURvdERwZjhrOHp5cFIvajVTMmM4OHZZ?=
 =?utf-8?B?c1BCUEZ2dWxJbzJtTWQ1ZWhpYStFYnovc2FNWlgwNUhKRzc4NzFINjBYb3I5?=
 =?utf-8?B?RUw2U3RCSy9Kc1ZKUWhiNWVabER5K3NDQ0VibkxBeGp0ZFlIUGs0QXRDVmow?=
 =?utf-8?B?V3ArTE1ZYzQ1ZzVGSjdCYkdvOWdYdnBOenpJRWxGQ3ladE1mUEQ4OFZMbEpw?=
 =?utf-8?B?emovSmdPN0Fjd2EzaGpzNmcvUnhRaVdOTTRzakFtNTZhcDVxVUlRUk1MdmpQ?=
 =?utf-8?B?YkRJcjdoSlRPc2M2TGMxdjVLYllYMnV2aktjRUhpWXNjN0l5RThHV0pPTW1C?=
 =?utf-8?B?OWUvUmlzeUY0TVZvWCszTmpTRHZFZFdGNVV1bnBMT1hERm04blZyTzZlODVM?=
 =?utf-8?B?MTlFWm1xNVZZMWsvQUdqdmVLMW55Q2VDRjFvbHhoL0VELzB3OWRPNEhqNXcy?=
 =?utf-8?Q?a5QoUX?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DC52684CFC4C5246BC8EC52DB974FF46@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7676
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	e0ee52b7-c303-4af0-7e71-08de188b85e0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|14060799003|1800799024|82310400026|35042699022|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bUVGMnRYUGNNQ2dKSHFDL2YrRjBRRFpYUUFpTC9LSlVJNlA3TEI3Z1c4VzlE?=
 =?utf-8?B?UW5LaEhUWnlMY1R3bUZ2OFdMN0hTd2F3N0Y3T25ZbHAxYlh4eVByUFlSL3N3?=
 =?utf-8?B?TWE0VHY3S2I2NnkwanF0T3IzSDYxTGRaR25FQ1ltR0UyVGZTYlhkNDVwRFRI?=
 =?utf-8?B?bFlZS3ZPOHVranV3WmFiNUZrSnB5bnZyNzJJN3JnRnoxWENzRVNveDlwTzg2?=
 =?utf-8?B?WUcyTjZ6dlduWmVYbkh3VFFwT0U0eGNGbDBEek0xS0UxcXRPc3IyTHpiNnRq?=
 =?utf-8?B?SE1kMGVvS1BXY0xjMnMwWGpVT0NQbE83azFiSFVSMU5xdVVCU2Z1bGROR3d4?=
 =?utf-8?B?VGd0eWlYTytvaEZZeFNHb2xQUW5HQ1AyWDNneWtMQnZrNWI3c1U3dUc3a0l6?=
 =?utf-8?B?SndsaTJaNzUzUmZUNDlocGtVb1k2RzZ6ZVFsRlo3aFBDR2VRWTlyNzBSa1Z2?=
 =?utf-8?B?Y25vQ25wb3g2ZWorNGpwam9TMEtydnBJTzh4QnBCSHdiTk55TVFERXVNYWtl?=
 =?utf-8?B?T3BsRzNrUTJIY0s3MnlkUGJOYTRHKzJWeTAzVE5HbTI1cHRYcGZwR2V6dCtK?=
 =?utf-8?B?bkpXckhDSmJWUkg1YWt2aDdpWEppcVd1aGN4WDVCdjA1aHJ6T2czby9mcSti?=
 =?utf-8?B?QkNodUs2ZDVMaExhOHEwMXFxaG9Ma29aWTg4UW5EZit6ZmFxcG04aU5DdlEx?=
 =?utf-8?B?WnBwanZyYy9TU1JaYkcyM3ZBcXVOSVdxM3pFL3d2OXBqQ0p3ZXZIZWNDVDhj?=
 =?utf-8?B?RUMyNGI5Q2EzRHA1UEtqdjNGWjV4SnR0L1NnTytPeEwyR0tyL2RpV2xqS2ZT?=
 =?utf-8?B?OUtFSG43bjdDTjA3VWd2U040bG5wR0tnSjU4YXVXc0E4YXJDb205SDg0SzRk?=
 =?utf-8?B?S09tRlJNbC9MZjJjeldLTlY4UlhHeThQbDdvMVkwZnlkU0RnTHF0b2tQQkNN?=
 =?utf-8?B?M2dVVVBoRDNhdXg3YnJiVVQwSzFZNEJVQUhtVzdhaUFwdWRxWjFqNkdGaFI3?=
 =?utf-8?B?alVmQzFNa1dSWFkxRzV4ZEQzaUljamVQK2xjTDBEbHZjWUhMSU5xbzNyZGx0?=
 =?utf-8?B?WEVNd0p6Mzd5ODQrRFJ5YnhSekpqTFJYMTBLaFN0bm1tejFlMkc5bHlJVFBy?=
 =?utf-8?B?SmVWN3MzUU10YmdJL3dvNjE5TDgraXlncFFEaUNkTmgzUVBzR3dWanRjRDZw?=
 =?utf-8?B?b2syVVlPYU1mUE16ZkxzaTY5bisrMi9RaGV1QWJzbURlbnBMQ25WdUZFdVo2?=
 =?utf-8?B?VW0vb0h4M0ZrSmJOeFExVStJMW5ZdFpBYU9pNXAyR25Vekl4SmExeE9SbDJK?=
 =?utf-8?B?MTkvdlJ4RDR0V3Q1Q0NCNDBXbGNIY1pnRkw0Ui9iYWp5VmdSY1JUaUJJZ1BF?=
 =?utf-8?B?Z210dUVPYzNCaUxvQnhpSkl5ZjVqQ1dtWmlIakxjNmVyd21OQUZ2UU1ZQ1ls?=
 =?utf-8?B?LzFCMUNwdzJMNDJ0QXY5a3ZUOWlra2YrSkV4RVJQdjFRVU81dW9LR3ArZWZ5?=
 =?utf-8?B?dzhMSkpWNEV3ai9qOGVKeEhjUzF5eHJIZFhNSU9tT0NOWFM1d1JVOFNkUm9W?=
 =?utf-8?B?UzZrMDBLMmxrTXR0K2FKWGRBblRsbnJYUWdXenRJWVUzMlliaEZ0VGsxMHdV?=
 =?utf-8?B?bGRrdEdoMlJ0RFRKNEMrdG1zVmpHM0NibTZSbHhaa2I3anFxeXFjbEtVYkE4?=
 =?utf-8?B?QW5sVU9pRXZyZWFpbFFraEJMOHF0RGdwZUkwSDRaRDk3SmVaQ3pVT08yYk5I?=
 =?utf-8?B?UmMyeFdjczEvOGR0cGlmdTRPeklVOTRIeWlib1JBZjVuSDhlMXBBRFVHbFpZ?=
 =?utf-8?B?NHZkQ1Y2YmZaU2RkZ1BqcWtZc1dmcDVRVmVyMHFtalN5MEJvVEZkd0xhbnlH?=
 =?utf-8?B?NDMyM05mZHRBeWdpdWRscm4zTCtVYi9GclZaY1p4Z1RrWjVDcUVhR25ha295?=
 =?utf-8?B?UFl2cE9UV1FxbUF3YjZ2dkNxK3Y3L0s5bTVtSUZKenMvWExoRU1uNXQ3VDBw?=
 =?utf-8?B?dWt4dktUckhOaG5icWdQRE1VcFRwUU9FSkNOSmpqaDA2dS9qUXpUL0xhbkx5?=
 =?utf-8?B?OENjS0JyK1NZSFViQnhQU1J2T2pFSExOZVBCYnBsRU1pN0paQTZFMkcwblM0?=
 =?utf-8?Q?XxXI=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(1800799024)(82310400026)(35042699022)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 14:41:38.2294
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b933b9-365d-41cc-de99-08de188b9938
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5709
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 14:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225541

T24gMzEgT2N0IDIwMjUsIGF0IDA2OjQ1LCBTb25nLCBKaWF5aW5nIChDTikgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgPEppYXlpbmcuU29uZy5DTj13aW5kcml2ZXIuY29tQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmc+IHdyb3RlOg0KPiANCj4gK1Vwc3RyZWFtLVN0YXR1czogUGVuZGluZw0KDQpU
aGlzIGlzbuKAmXQgbm90IHBlbmRpbmcsIGFzIEkgZG91YnQgdGhlcmXigJlzIGFueSBpbnRlbnRp
b24gdG8gZ2V0IHVwc3RyZWFtIHRvIGNoYW5nZSB0aGUgb3V0cHV0IG9mIHRoZWlyIHRlc3QgaGFy
bmVzcyB0byBzdWl0IHVzLg0KDQpQbGVhc2Ugc2V0IGl0IHRvICJJbmFwcHJvcHJpYXRlIFtPRS1z
cGVjaWZpY13igJ0uDQoNClJvc3M=

