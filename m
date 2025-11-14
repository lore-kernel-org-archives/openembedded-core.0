Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B9DCE7AF6
	for <webhook@archiver.kernel.org>; Fri, 14 Nov 2025 11:50:19 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16224.1763121015673050523
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Nov 2025 03:50:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=bh52qCC9;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=bh52qCC9;
 spf=pass (domain: arm.com, ip: 52.101.66.40, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QVCwFwFNcOGd3vGoBvpLR4+jKREHkaL184tOFdl4wtTmAstlsMOpjFTg807QUhYbdSI0k/HummfRfuRAZJVMTJEKIS4jdjr/v5I0OezDae9GeyWkwaJXkMXBemnUes5oaysB8JBJA3R7vQKzGs3JdeHVcWMO5tEybqHjQfAKQX9AtxZtO7/OK/Dkm8ch65f3f4QdZIeDn1qReN9t5JC/OikXQJ673qnpQz3pG4kbzRIo7ERSZ6vV40IEYaCm9FSLcB4o4Bh68nHD8SUQasEn0o+px+8CDa1dgA8Wyne/IuO/JXT0+tgvtHDn9PNo9p3Rz43MrM9VLWuEQ4k6zXac6A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tANH8EfBnbTAtJc38bwR3pbCuyKiN8ZMpLnTX/YZj1E=;
 b=OI4luDIl6OcPV2GRCgGAO8+QsQMJ8J9bwLniuvIU/si7pOUrxyh3YC8Wwk7ZrG4Dc1CyLo841S3waf70uuJexizLxbL7/RKY90+oUekPc1/p11NUczxgksP7Qat/lVAUNhp0R1t6GZW0Z1AAQm9HYnz1UmPHYG3DkX7MF5T5xPqlFzxwiOGaKF6dmqbJmKaD/n5ZeHsfjJp7WjkgI+SW2XYkaSySqAiA/+dYdmXEsq7rqtKSanDRoAFZytxKv5C5Q3ZX3rjmyxZidJ+JGP8xWdoKkxqFkS4mtEinEkkzqR/e9ZCLw56eWP05mU0sj0Gf1ImrWqdDRodgjhRzepVfVQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tANH8EfBnbTAtJc38bwR3pbCuyKiN8ZMpLnTX/YZj1E=;
 b=bh52qCC98+h5jLiXWcOlduPgJasdzgUwJnUqPub08lLT+T1GRPJwXcKOCCJvyiIPOt8FRFmne708TOWmcMBU9NXh3cWvQjAhV5qeTO3M88w1LH2f82e/SIrlGEgkx4XPENYaPrl94r5Ly6E1kkZviDdeSUD8z0/isEongwg2IX4=
Received: from AM6PR0502CA0039.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::16) by DU0PR08MB8787.eurprd08.prod.outlook.com
 (2603:10a6:10:476::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 14 Nov
 2025 11:50:12 +0000
Received: from AM1PEPF000252DE.eurprd07.prod.outlook.com
 (2603:10a6:20b:56:cafe::8f) by AM6PR0502CA0039.outlook.office365.com
 (2603:10a6:20b:56::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 11:50:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252DE.mail.protection.outlook.com (10.167.16.56) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.13
 via Frontend Transport; Fri, 14 Nov 2025 11:50:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vdSZOcEBHQbMv//dLn/xhjwuv76LpVkh3eTzfelJ5T9uSQTfCIyxC95yMZVovKnhQnzYuPn62rrbBD0XGg8Y/FuoxTLrwzrQEMG0GCu4vFsso4SRAsZ7pxl1kmeyMPOaThWNwG6j7VqgzLK9mOhCZjoREL1OHswVE1T6tFFIefvpgHXJ95C2jZXkOegdESxGo/1UkUXI/0y7JntJEsGaWjRiFaHqsX+qh/rIrNr8EMezredRZz8469yw+pCcYeNwJJ6VRQHWMPDgCjfc7xD9909x5R77IILlLkJynGJnEDIw64PZGeaIpebWViZIuCO7QaqSIcywbSdwEA4YBfoDcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tANH8EfBnbTAtJc38bwR3pbCuyKiN8ZMpLnTX/YZj1E=;
 b=x+8trvqWrrZGKGr8D8Uy+jwgVsfEjaZ+2pDSC9m4Hoyhn72pAcBz7zebCyTe8eBbB81Eo0U+KZrRF5L8M9EBsT+GYfzX41KvnsExDLjgddW6wsHs5lgza199Rqy+uLcEMBwk72NezuQr66OePDIvqsYo1q1pTUOjrrC4Nn7oa5xEuyTRWrorMJVo7RoUY+x88aKJwFYhHwNqNG8EFn5mx8WReomU8jkVDeFIhtskfO0TlrxrUuCTGr06BD4hdA8rf/M3Gf9lbyeuuxrbOGru4B28vSj6T6eBTrqc3kvvT8Sv3o8QKj+CMrNYTWHLgeKYOh/4O1yaBVYVYmRZPqAL7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tANH8EfBnbTAtJc38bwR3pbCuyKiN8ZMpLnTX/YZj1E=;
 b=bh52qCC98+h5jLiXWcOlduPgJasdzgUwJnUqPub08lLT+T1GRPJwXcKOCCJvyiIPOt8FRFmne708TOWmcMBU9NXh3cWvQjAhV5qeTO3M88w1LH2f82e/SIrlGEgkx4XPENYaPrl94r5Ly6E1kkZviDdeSUD8z0/isEongwg2IX4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB4PR08MB9288.eurprd08.prod.outlook.com (2603:10a6:10:3f4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 11:49:37 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 11:49:37 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "rmxpzlb@gmail.com" <rmxpzlb@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] armv8a: Set -mbranch-protection more
 specifically
Thread-Topic: [OE-core] [PATCH] armv8a: Set -mbranch-protection more
 specifically
Thread-Index: AQHcVHHd2Z2eKlgWzE6EMGDiaL9qFbTwdUSAgAEMyQCAAA+hAIAAfuOA
Date: Fri, 14 Nov 2025 11:49:37 +0000
Message-ID: <97E0758A-6A97-4838-9E46-10E462356829@arm.com>
References: <20251113074747.6735-1-rmxpzlb@gmail.com>
 <83C84BC6-EE26-4C26-94B8-AFD9CBA980BC@arm.com>
 <445583.1763090362590399237@lists.openembedded.org>
 <CAMKF1sp_hzRmpHiqB4Yk+TBjn9heht+yvtaLgfaBVpf8cJ+oKw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sp_hzRmpHiqB4Yk+TBjn9heht+yvtaLgfaBVpf8cJ+oKw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB4PR08MB9288:EE_|AM1PEPF000252DE:EE_|DU0PR08MB8787:EE_
X-MS-Office365-Filtering-Correlation-Id: fbdaf333-843d-431f-1489-08de2373f7d5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?ZEt3VVZxTjRQYXJmWUFuY0NCbnZOa1RrZFUzUEg0cUwrZFNZWm94cnI4dVhY?=
 =?utf-8?B?OTJkeW44djAyMDhEZy9oWWZUTnE4UjArOUpxZHBVWm1aSEJFVFZBb3Vsb3Qw?=
 =?utf-8?B?alJmeWY5VFArVHVlRFhodGo3ZnJTMjZ1VlZ1UmowTWhFanM5UEIvTE9GRG5D?=
 =?utf-8?B?VUhRVWxHTndrVVFkWlRxeHlhRGJLK2VXcThSOVZ5ckZjakFoQzNxMU81emw4?=
 =?utf-8?B?WE1MWkd3eFkxejFUQ3lZQXRiMFlNOVFBQ2Z2eUd3VUk5cVZnT0h6WTFhQW5C?=
 =?utf-8?B?a3lJSFE4eWMxbnNiRGRwc1F5TnpVUVpPQzcyYlN6TzZHR1pNdnozYkg0OHU2?=
 =?utf-8?B?bHJVanJiREl6R2hWTXY1RGt5c0Y4dG1KajFMWmxxQjJHaDVGSitXRDh6RzlS?=
 =?utf-8?B?ZTZ2ZC94QUJPelEyZVY2YVpvK1p3NlhOZVgvd0NSb1NVQ2IwT3JaNWNuMndR?=
 =?utf-8?B?R2hNc3owbGZ2d284WXVkRG5kZzczbXpCZFFMN1Zudmp2SkdWM0c2S29LcTJh?=
 =?utf-8?B?aDlMSlE1Tzgvc2NsR0U3QktlNDJXVzVOUzIyeHlCYTF0aFdyZXJmN05EMEwr?=
 =?utf-8?B?czdmU0p5NDBIdjRoQUVyaXJsK0I1ZG1LeUFFTlhYaGYvT1N4ZVI5cHZxb282?=
 =?utf-8?B?UFR5YzlyQWtmZHM0cnM4VGZjNWZSOWRnbmJ6dmVWRkR0ZmV4NlpYdFN2VG9p?=
 =?utf-8?B?VDJkOU10M3l3TVNaY2V4ZWlJaWN5TmdVUWxQWlVxYzJlZ2cxNHpKZHYxeWNz?=
 =?utf-8?B?RlQzNzl6bHRvQ0hLS3I4ZEJFZ2Q3ZE1JSG1ZZTdEaFhrNnJ2K29XSGdROEZP?=
 =?utf-8?B?NkkrYTJGL3hpTHIxVGFodnQrWEU0d3dKR1ovcUNZejV4L2xCUzZqZVFGUkpR?=
 =?utf-8?B?N0QzMUpaejlDNlNUNmJGRjUyeTRvTXlCZmZZdmQrVE11NmN1UUI3VjZYZmpW?=
 =?utf-8?B?SVV5MjZoR3J1TmlvMGl2YlRCRDZJSnlXb21wZTc5NFNnY1hqZEVXOTZYY1VJ?=
 =?utf-8?B?ZUJoc3dxTGhFWXFCbHI1dnF6dFozdGtqMEc5c21UNEdFRm4wYXk5RW9qUHg2?=
 =?utf-8?B?ei9hUldxT2ppNTJaWC9wS0EzT1c1Z3RlbzY5bG0zWlhXZVFNbzM4Mk5sMGdl?=
 =?utf-8?B?MW5MRGdjaGhQTVFwODNKZHVXNnBmWFY2NHc2cHBYVllCL1dUSE5CNzFBVEha?=
 =?utf-8?B?eUx0RGFoK3NtSjhWNEFjSFNZZ1gwTGdacEU2NUhTaGJsbGVCOS9MckxLUWU0?=
 =?utf-8?B?NEVqZDIwbDhxSzFOTFFFTTBGSWd6cVVWdzlhRnU4WjlNTzA5UmhrcXR4Szgr?=
 =?utf-8?B?UG5pYnlyOEJCVTNnd1pkb2FSaUdSb2hadTBuTUVyS1RoNG1BdlFITGFqOWFK?=
 =?utf-8?B?N1BXN0ZPellPS0ZBMzhtcisvUGs2U2JRd1BhdGEzQ0h2SDU0Ny9iRzN6eEIz?=
 =?utf-8?B?MGl3NTZnUmpGMG9CdlhaM0VRclU2eGdORzQ4SmU1VUN4eTlXWFh3T0FrckVM?=
 =?utf-8?B?bXRLbUdGNTRzb3pZT1Y2aG9xUW85b253VzF6bDZ3WWNJcEk4clpHc3VqZjBt?=
 =?utf-8?B?R3htTSt0M3lHVDJ1STcwd3pSelBEVEsrSjlKdUxjckZNN2xxRGpBSjRYazFP?=
 =?utf-8?B?TTZpSXhBZUo2Y2JaOFNUa1RIUTUwUU8wVHpBNUR3dk9IMFhyYUVGRFdSdXEr?=
 =?utf-8?B?NzV4YjhmZitiSmh2SEVHTjcyMUl2cWtwMFdsMDNmdVYvMi9JNE8vVk5mRU9M?=
 =?utf-8?B?VWdRVFVNSWFOMDQ5QTZhOERrLzQyWGplcmFHZXdtazcxbmVnYnUySlAzRkow?=
 =?utf-8?B?S1dkNTd4NjB2bHk5emlGWHIwckE5YlJuMnhKcXcvd0RHdnZLYVlCN1lTTURM?=
 =?utf-8?B?eWdvZGVFRUtQUFowN05RVW55SW9hOGtOQ295dzV6MlQxL2thVUZjZGFQM1Ax?=
 =?utf-8?B?Z0hwWXhUT2ZYRTlweiszaElISDZwTk5EODQzUm9jcDh4bjJJNXV5M2FlUnB5?=
 =?utf-8?B?NFJKbk53MXkvYW9Nb0R2NnN4bVRRZThTZWF0Z1M1bG9FZGpaY1ZmQVlBa2gy?=
 =?utf-8?Q?vJ11r+?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CE66E7F7AA0AEF4AA5FD0E7019813CF8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9288
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM1PEPF000252DE.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	786d75de-9912-420a-9f80-08de2373e332
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|35042699022|376014|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?b2lrWGxaRVBIVCtoMGIxQktFSTY0dmhsaGl2NWpXWjA5dytjR1JrY2hrWnpq?=
 =?utf-8?B?OUpxVFVHWXRlLzNqQjRvRTVldTBXaC8wenk2a1hob0lmMXh3L3VQMkdjYW9s?=
 =?utf-8?B?bTNOdjAxMnZoZStDeVNYQmhmVGZ3MTYrd2RRZnFlK2htZTJOUzdqcmhjTzNq?=
 =?utf-8?B?YWpPbkYrU3YzR3IyMlZMOGc3RHFJeFk5NVRmY0NYVWZPeFE2UHltWjdFUTd6?=
 =?utf-8?B?MkZ6QjRBZ24yREhUWFVoaHM2bUFyRW9vUnl6bWJJUWdTYWU1RStZRmNXTXUz?=
 =?utf-8?B?UWxBMmcyN0JIQ3BFcEp3aTE2Rm5rdUoyK0d6QmhjdUpWSmNmeXdVSFJCRjJz?=
 =?utf-8?B?Z2JuZWNjdEI0Sm9MYjU3WFZONS9GSG5vQWVlbjE4LzVxN3lqMUZETFpNek1Y?=
 =?utf-8?B?clptekF6V3lORnRyam03L1FVc29ucXA2anVGSDUzeVdKWURGN0IwNVRXT1g4?=
 =?utf-8?B?WTFITkgvdXVJNDZVT2srdndGZE4zSzRDWDhINUkyT3dkc1l3WjdrU2JBTlVD?=
 =?utf-8?B?YjR0QzZManZyYVk1ckxnT1Z5c3U3S1lra0w5dW1wYXZBQWY4cllSSmNZcWxI?=
 =?utf-8?B?bHZ0bGpZL3JLbFZlNXdmcjdhUStlTiswSXJHcE1ua3JLTnB1T3JFMFhuNjVw?=
 =?utf-8?B?blN0L0w5NmM2bmJRTis3SGc0dE5nRS9abkdWampaeitGNUQyb0VCQ3NwYjZD?=
 =?utf-8?B?cFA2c3dQeGJSRVVFNm8yMWI2T1pmb2p6M3oyR1hRdzVWSWt3bXF1MzM2WFUx?=
 =?utf-8?B?TVBMaXRnT2tyZk8vZVUvckEwQzRnYWt0S3J2UWNWR21HMlFDb3p4R0poREh3?=
 =?utf-8?B?QnJKVUNqcGYxUWt3cXhWSXVNL3VjNkhQekRSNW01QzcwUXRCOFp4cEEyZnpT?=
 =?utf-8?B?aVZacWpqQjVSK0hDeTVLaVNlOUdrTFJ0QSt0dGFCdHNVNWJrNS9KN0VwYVUr?=
 =?utf-8?B?bTFwL1phaGQxZjZPYUJCMlBEdk1aMGwzWVFTRnVPd2k3bTFXUXZPL1llQWJE?=
 =?utf-8?B?aGI0MnZIN3dIeVBWL1Z4QndRSmhzb0hKcks4N0tYZS9WbjBQNlZnWmd4Tk9B?=
 =?utf-8?B?QzF5NDlHelZwL3RiSXdLT09KVFdBVURHSmZMY0tnNW9XWVNmT1ZmVEhGSDZD?=
 =?utf-8?B?QUtOUkxMaDZTc0xuU1VGbVpzTDJTMHpmSXJpR2dYMXpEbzdiVXNEN2FlbEli?=
 =?utf-8?B?aE5aYVNQUHF6dEpXalYxR2didjJCdzNlNU5mSWVTa0I1dlQvWTJBbDZCRW5D?=
 =?utf-8?B?TzhwNnJ5UkFQOVcyMm1pd1BZZzVRb3FtNm0rdnFCL3czcmNKNVd0Y2hQbVpl?=
 =?utf-8?B?bnhTNXdWMXp2OWlOblg1VDh6bEJiMzBrVVZRbjByL1h1a3lhR0wvbXovWWV4?=
 =?utf-8?B?QitXUzVlYWpVSlFHSTFlV3FpMU5GWE5ISTFWWHVJaDMvemJUK0lwRjF0VUk2?=
 =?utf-8?B?UFNydENLVm92Z0R6ajRndGJ4bm1FWTJOSmpBVENWdWVZSHZHcFIxZG82SHBO?=
 =?utf-8?B?am9MU2dHQXREcEdrU3BhU3NiZXBGL0llZUpSdTNWU1hxL01mb0hpNHRrVlVk?=
 =?utf-8?B?NEh6bjhoZW5ubzkyQzNvVFAyUTA1WnBqZHJLS1pxTHBJU054UG0xK1BXT1Vv?=
 =?utf-8?B?QUl5aXRDVmJUZkNFMWFXV20xcG1ORnV6dHEzb21RTTR1NFNVTzc5L0xmdkdQ?=
 =?utf-8?B?YzhKVWNLSitaa01KMXYvTXg2N1IyL0JBeTQxL3dVVXUxTHB0Ym16QkRMY3VR?=
 =?utf-8?B?cDBHZmRCeHhubDY0MXQxZk5Zbld4UDhyS2NMdWJOOHVwcmk4U2VwTUpNL3Jy?=
 =?utf-8?B?MWttZ0RPdVRuMUh6dlZZcDZpSEJ5MitUMEdZRktnSjYyWGczaXd0bm00M2J0?=
 =?utf-8?B?UDhFWGszOXRKdEhmL2pGVFZzUFdaUm85ZXVjcHFldjczbnlBMld1WTlWZWJK?=
 =?utf-8?B?TmJnbjRYWEYzcThYLzlkdGNyTXRKdVZFclVLakp6bldocXhDNlJoZmw4MnhF?=
 =?utf-8?B?WE9vNVU4K0p6WU1GVFVtcUVyWkNTR2VUMjNJc3VKUmNUWk0vS0ZzYzBuRGVL?=
 =?utf-8?B?WFBzdi9qdEtJQmxORzRZYmRTbGxjcUtwYWtyckVlS1Z0Y05mY3dtME5wNjhL?=
 =?utf-8?Q?hkOg=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(35042699022)(376014)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 11:50:11.8259
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbdaf333-843d-431f-1489-08de2373f7d5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DE.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8787
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Nov 2025 11:50:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226288

T24gMTQgTm92IDIwMjUsIGF0IDA0OjE1LCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiBPbiBUaHUsIE5vdiAxMywgMjAyNSBhdCA3OjE54oCvUE0gRnJhbmsgWmhhbmcgdmlhIGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcgPHJteHB6bGI9Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiBBcyBJIGtub3cga2FyY2hpdmUga2ZpbGVtZXRhZGF0YSBhbmQga3BpcGV3
aXJlIHdpbGwgZmFpbC4gVGhleSBhcmUgaW4gbWV0YS1rZjYgYW5kIG1ldGEta2RlLg0KPiAgIERv
IEkgbmVlZCB1cGRhdGUgcGF0Y2gsIGp1c3Qgc2V0IHY4IGJyYW5jaC1wcm90ZWN0aW9uIHRvIEJU
SSAmIFBBQz8NCj4gDQo+IFBsZWFzZSB1c2UgdGhlIHN5c3RlbWQgcGF0Y2gtbGlrZSBhcHByb2Fj
aCBmb3IgdGhlc2UgcmVjaXBlcy4gDQoNCkFncmVlZC4NCg0KUm9zcw0KDQo=

