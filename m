Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7A39C87FCA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:38:35 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.51])
 by mx.groups.io with SMTP id smtpd.web11.89345.1754059105826392228
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:38:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=DLcNKieD;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=DLcNKieD;
 spf=pass (domain: arm.com, ip: 52.101.84.51, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=wZ/Tt7Hsk4czvkkAbw+jOlw6wX3McEo+hjY98c6h9SiWPGMr9Hj2HhIAskGH3w5vbthV7xOsDdsgIe5kFu+JVqEkGl3YY+OWXpT1LDZ9+gOwU1GozqDABxK26D3mbPlbrobHAh2Hw+inPufx5aFWqeoqicCiYZK9qdlKTIx5sQinlstd7zj/Z5fJz2E5sLmH9UVWdsGvJHSdSu/AWghsoytmzjwCH1MpXnwweE7i//cjkiny6l4QKJnXkL4gMyWxLUjLsR7thrLds07v4iT3CW3MHkDQldU61ebTSUCt7fH9RhbVBjyL/jI4cEOSg3KfntSp9lJO1nnVAhcbpqEWKg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RH/QLEMSGwRCVPmaPFNQMngQ7cnUgkOUiOrSvxKIlWM=;
 b=W8KM8a0IErH2BYbSl5ctrYjRURcLRRESwQ1Fz2D0XZR2yl2aiaf3nH5niSaLZGLLE8twHl7Sywse3iHwBGDIypUXvFB0FaKqMOlEGvEDwhc6y5kmytwQ9daiaUr4pmrZuizIuCL8y+AmY1JgZBc9t1cjfFEvWNU7Uu+mIiIuqTkeEfNUWkXZsMn/jEmz9T45tHXri2THZYD24K2o2CO5eRnTP/E5yjQgULlBkPcnzlypzK31Tr5Go/o78/6VKuxFbH99p2QSOIJ+1vipEsNjVO+TJHlk+V/2ZN4XNbzgRx8SuYTqJhC0sSuQriN2tfJXhtBqt2ncqLNZ2t3akjD/6A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RH/QLEMSGwRCVPmaPFNQMngQ7cnUgkOUiOrSvxKIlWM=;
 b=DLcNKieDeG89j6Q0l7gp3/utSMVm147EfMHFmSAVXuGnDNIWK0D5O9jM8vk4eWOHXmuaOOgFgN4cYwUQQgjnART0BRlaB2vepL6umArLNkO0mmWN06TnLURAwhn8D5s+Y0waZ1YcUOLDITQJK6BnyTCb2OI/m6MW65uGRwAsjRs=
Received: from DU2PR04CA0199.eurprd04.prod.outlook.com (2603:10a6:10:28d::24)
 by AM9PR08MB6003.eurprd08.prod.outlook.com (2603:10a6:20b:2d4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Fri, 1 Aug
 2025 14:38:21 +0000
Received: from DU6PEPF00009524.eurprd02.prod.outlook.com
 (2603:10a6:10:28d:cafe::dd) by DU2PR04CA0199.outlook.office365.com
 (2603:10a6:10:28d::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.16 via Frontend Transport; Fri,
 1 Aug 2025 14:38:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF00009524.mail.protection.outlook.com (10.167.8.5) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.8 via
 Frontend Transport; Fri, 1 Aug 2025 14:38:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5SkalfCNlTiIrDo7O9sqYU0IvM87Cz4eZ8icwz/6Zo9uoaYvIpteaOVm/BhMAxt9jujqlIfoLNXAnaFJrX1ijVERJQoeQ+PLsgYKnEWGj3j4QSfzSeokZ8hw1WUD3ytmX/eeiYypIyfBeNuU3fTD9x0HRain00wIM5gnuD+Y3L4kwFd6fPDgPjNmifDNT6ceabmvC9rEGkIpJNChOUtekG+joSanduptLdQgcvN/Y65qFOrIThC0b9ZmetXXnxi8RFiPpY5cPLZe53Ppju4sXKaunZpLk7dF/qXPOUVza6F4IrBLeNznH9HQpHFKeRI4X348ZSGNVBC58g6SDXKtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RH/QLEMSGwRCVPmaPFNQMngQ7cnUgkOUiOrSvxKIlWM=;
 b=yntxeNyNdk4fdMCbfKZdZ44IiuCF564opqMbSyx1hm326/0pQsoSv8Iyul31Qa3g8IICfsmebyqjOyn40/CASQZag2fEK6vFeiyycA9UvU/kwEXb4Vl5IBiYdHPT8eRrNFs3K/xsOMLIX7Syjzpj8ek2aO+r9EFjzjBBXcjnHfqeQF3uH+SLV82Gme9CUXukxdNG39jOn9s5ueRRAuvPWI3n1tnCAhFjIqANwMG/WOKFk/qzhTfvE2Z8IOQYwYFoEzyM3L3RnwIY/6VBv7a7dH1ti8cqZWuMiC7Wq4/micioMzxJSTX1JvgmTQqrVKHXThE5/pybQ1y6mquEMWUmYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RH/QLEMSGwRCVPmaPFNQMngQ7cnUgkOUiOrSvxKIlWM=;
 b=DLcNKieDeG89j6Q0l7gp3/utSMVm147EfMHFmSAVXuGnDNIWK0D5O9jM8vk4eWOHXmuaOOgFgN4cYwUQQgjnART0BRlaB2vepL6umArLNkO0mmWN06TnLURAwhn8D5s+Y0waZ1YcUOLDITQJK6BnyTCb2OI/m6MW65uGRwAsjRs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9061.eurprd08.prod.outlook.com (2603:10a6:102:325::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Fri, 1 Aug
 2025 14:37:48 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8989.015; Fri, 1 Aug 2025
 14:37:48 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] libclc: Fix absolute symlinks in sysroot
Thread-Topic: [OE-core] [PATCH 1/2] libclc: Fix absolute symlinks in sysroot
Thread-Index: AQHcAQvJJQja9yZOAUK1JRqvwQm4n7RN4Y+A
Date: Fri, 1 Aug 2025 14:37:47 +0000
Message-ID: <0B0BA0A1-CC33-43C9-ADE5-41CA6878621C@arm.com>
References: <20250730043809.1486481-1-raj.khem@gmail.com>
In-Reply-To: <20250730043809.1486481-1-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB9061:EE_|DU6PEPF00009524:EE_|AM9PR08MB6003:EE_
X-MS-Office365-Filtering-Correlation-Id: a3761b21-df09-4c0c-7744-08ddd1090f8d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?QUF4azEwRFNDbko4ZVV6bVBWUVRzVlR5REFxNGE4eG9DZFlYVjZVQzhXVnls?=
 =?utf-8?B?aCttcEh5aFJqamVUYUFFbk1BZUNETGVRaURIU2ZwT2xQT3FZeU1xNmY1NUVn?=
 =?utf-8?B?QUNiVkVmUUVpcW1MUExTZW1wZHNJZ0pYQjgxbEYyOHNoR2g0bkpiNlpvZm5s?=
 =?utf-8?B?ajVkbVYyZ3EvZDdGZWcrSUY3SmhPaVN5cDd3NlU1cmxzUzlNeGNaTzNlSlVs?=
 =?utf-8?B?MXlqSnYybFhXQlFQaEhQNERVNHJEaVFWZS95ZWh6SlZZRG9ReDJzaXlPN0Nz?=
 =?utf-8?B?ZHV0UUFEMGc3VFMwMWx2RG42Tk9OTmN5OFhiWEQ5QW4yZ0tyZUs3ek5QTGlO?=
 =?utf-8?B?ekxSK2M0SzRkQXVuaisrK2pvaEdSc2ZIL3YyY2tveEp3N1Y5YnFicFVCOGFq?=
 =?utf-8?B?cVNFdUVDNkkrZFVZV2dxQUxFRmMzbE5TN1ZxV2pHTzR3NDdwaWlCQzN1VGlE?=
 =?utf-8?B?S3NYcloyRlhMYlF4ZFJmRnVDdlRqWmxxQUYwcGoyZWlyZG9hWEpXd2JwTjcv?=
 =?utf-8?B?M0tsaFV5alNlbkU1c3U4NHJqYWh4Qjk1Nmxmbms5NHpGUjNCWU5jU2xzUXh1?=
 =?utf-8?B?WWJ1V2xvbHlkWVRyMyt3dWNoZ1FpcURNaTVjcTl2QVg1Mnl2amhDQ0ZjTm5M?=
 =?utf-8?B?NzMrRkFsLzVoNzl1L21ydlc2NGVaaDlNSHJnUGdSMmhubWJFSHNaWUtxNVlv?=
 =?utf-8?B?MTF0c2pzUXA3ZHlPWFBvWFVjZHlHUG9XMi9oaXMyeXZvUS95Y21qVTQramV5?=
 =?utf-8?B?cnpEMDQwYXdZYytscERlNHREeW51NW14Y1ZlMFFKZHNVUk0yd0dKNm5qSFpR?=
 =?utf-8?B?dVZxOEtKYTZLZjJPNFhnME12bmxnWHVDaDRoYWpvUTUrbWViUkZGeCt1aUFQ?=
 =?utf-8?B?bHcvL2NPQ1JFSktSYUFzRTF0b3ZJSXZUU2xSUThkbytYdENpWTI0cUMrdHJ0?=
 =?utf-8?B?TXBiQ2c5MVFGWmRMLzc5Rlg1WDg2a3pOWElKbVlYbW9ldnV6Rzk1elltWUt0?=
 =?utf-8?B?VDQvdmtRNmY2cGk4N3pxQlk2eGVoYzBXVUlBdjdPK0RHdnRxajVZTk5xZFNi?=
 =?utf-8?B?Nk1hRDZReUIzL3ZQak9Bc1RlakhNeGFjNG9FM0ZXd2lrQ1N1T0NFcEIxR3JC?=
 =?utf-8?B?aHE0ck5udE0wbkZxeWpuRXRvOG5EYzVnS3dqTm9Ta1dNK2FYZXJ4ZFZKNG1P?=
 =?utf-8?B?SGROZDM1emhsTm94NlFSREtIeWdOYnJwUXQ5cEV1UmwxM1VZY3BTV091TnBv?=
 =?utf-8?B?enJ1eGk5WkVXdEFLVzBhRmV5R3paVEFqTW5tWGoyUXJEQlNkZlVrcVM3TENN?=
 =?utf-8?B?Qm5LckYwbW5xVnRHd3l6bE9wbFhqTzlWTjBBRW9OVzgvNVFUVGpxWStRRlU3?=
 =?utf-8?B?WjE5ekw3Sk9NUm9yUWJlUHVzOHhhZDIvUkVmeHo1MTdaL0ZTbHVid3FIRXlv?=
 =?utf-8?B?Mk5VVllRRWJZVXFWM25KZEZkT20raGxCQXVuZmN5VlBPMUFuZEZISzJBOEY3?=
 =?utf-8?B?Qkpsa2RoQWFnZFBtdytkTXRMdzJGZjlHQXhSdXdYeThMSUJFNHBQbWpxZElJ?=
 =?utf-8?B?dnA1bEc5V3N3V3NndmZDaDdtRUVBaFJWQis1dGhXMW02SGN5Nnc4bDJOU0hT?=
 =?utf-8?B?dkFEOThwNHZIQXhnTlNKNmZUNkpvM1JsTE83b1RUYk8rVTdIeEhQTFZRZHZl?=
 =?utf-8?B?R04xQWl4N0JMYnc1bldpNndEajBwMlZDVnJLRnphMUZkRXpUMlpGY0dSM2RR?=
 =?utf-8?B?bjBDUVFuNzF6b0E3SUZaWG16UC9ZSmh0eFh3MTNYckxlckhkRmxyMkpHN3RS?=
 =?utf-8?B?YjA2alFKR1hQcXo0KzVBUHZjeGhqQ0l2cjRkZWJUa2dJY3lzbkl3RGIyQ0xT?=
 =?utf-8?B?Mi8zS3hzUkQ4WlNTM3hkYmJxR3Uwb1BBUnhiNnM1bXVyUEVoTXlpSGZxZHg0?=
 =?utf-8?B?SUcyK3hLb0dKMTk1UEdPODVWU2VSNnVLQWRaTytoUm95UFY3cVZZS2tuLzcv?=
 =?utf-8?B?OUVDTVU0MlBBPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <297343B8638F1449A5975C639FFBF9C4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9061
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	4fc2c559-3359-4a8f-ecb8-08ddd108fc53
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|1800799024|376014|82310400026|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dFdBWEdaOXh2R3lxQUYzelozb21BOVdGSzY4WGF2S25KdzFubUJkaTRjQ0Fw?=
 =?utf-8?B?ckRsdU1NanNva25mMTVWcXBiR1ZsMzVJYlpLMHRabWN6Y25EL3piell1bG9W?=
 =?utf-8?B?TXpGTU4zUlVaWEtoZnpPVzlkV2JlYXdlU205dVZhVXdUZGZSRWVKbmNVYXVy?=
 =?utf-8?B?Q3BzL0xhOUw5Y3ZLTGtKbk9zZnFSLytJUVVPL2xsTDRJRGhYT2NpZDZ2VnBH?=
 =?utf-8?B?eThYWXd2ZjVVOWErRWZrSGNkUFZ1aTVHZ2phQTE0QTV0c3VFVTQva0R4d1Ro?=
 =?utf-8?B?cEZKYWpMVnFLaEtXS3pSWm54dzZWYjNEa0tiVHArV3BvRXVsM3NYTHEyYzhT?=
 =?utf-8?B?RWpMdHNzYlJLZ2tQTG1WZ0o4eEJaMmFZSm42WVczYVUyNlc3bGRJbUQxSWxL?=
 =?utf-8?B?RkJoVnVWa2d2dDgySG9ndlBOaVB4clZUdGltcXh3dVl0N0RZTWJQNFB6RHFt?=
 =?utf-8?B?aDhhcldFcUlMcnFjOStZQjZScDd6TnJtUHhlWVNOUnZPQUNMY3RudGErSVB1?=
 =?utf-8?B?UDVPVUNuQjVCMjliQ0c2NDJnY0I4akVrSTdmc00rR29KVWdVN29wVFZVTlhN?=
 =?utf-8?B?K1I2OHd4RnFneDhhL3VmTVBJWC95aEVscU1vbUVxSUlYM0pRYWtzYUpjZ2hB?=
 =?utf-8?B?QW4vaXlMWXVEUFhaTzVHUThSZGlaYW5SK3JOVzRoU21iaklYQlFDWjAvOEww?=
 =?utf-8?B?UVZpNHJ1aVA2VUhzaVhRajZLeURYVENkZXZrSEpuM0owbmNNRHd2ejQrNWNK?=
 =?utf-8?B?M3R1emxzeE4yUllyY1BFS0NtRDVhTjlYc2RNSFVyMzVvR1ZUdnRTVVJLZnQ1?=
 =?utf-8?B?REtmeWdESWdNa0tDZzEzUndZSythUGVyUGpnc2ExdWJFY2JMcXlNOVRkYytB?=
 =?utf-8?B?dnRZMS9xQXNYeWVmcVZNMXVwQzBKcThCY0pGR2wzMURQMGRKb0p0VVQxbmdI?=
 =?utf-8?B?RDNUS1VBa1JoMm5xWk5xREFsMHlZbWxxWTh2UCtJQmRpTWVuMUd5SGxXczVo?=
 =?utf-8?B?aEt3T2lKLzdlWWJsZzF5T3dEeitmZGQ5L3ltSmlzclBIdXFsUHE2SkNsZkZM?=
 =?utf-8?B?Wmwvb2hOZktBdnBSVFFnQk4vSkpLdXFKcjNBK0hOMGppeTRsSldqTEhsWXBm?=
 =?utf-8?B?aFh1bWhXWU9NbXhZSytEVmJRVjdGKzlxTHZvTVpxcllxbnNxL2ZuVytiWlRG?=
 =?utf-8?B?VlEwTkpEL3FuZndCR3hPczV2d0JmWHdKbjVuUkRkR2lSME9QZnM4MmRlekZy?=
 =?utf-8?B?VzZoYzByOGRTWnV0Qis0WXNYWXZ5N2hKKzlnTE1GeCs5SHhUNDd1ejBnNUxP?=
 =?utf-8?B?cWZwREY2TjBjNzNQaTYrdkRTa3BSb3VSWXdZWThTeklsMGxuMitwOHpNMXBC?=
 =?utf-8?B?bmxGdEFYcWw5RC9wdHZSRlIxVXM5dXJVa0dwZmM2dEx1c2hra0d1VS82R1lG?=
 =?utf-8?B?NUZpVUtjZk1TVXFxd1JXc1pzZmw3V3czTUhJblpTNnlTYTRhQUR1QWZKZ1g4?=
 =?utf-8?B?VzRzRFhHYi9tZEFNOXR1bU5WNTBjS0lBd0VlUzlCU04yRTZpbWl2ZlRLNG83?=
 =?utf-8?B?K2l5YWZRMlMrRUZpdGJZanlLMTlRdTJXVzdLZXNrVnRKME5JNzZKU3Bmb0NF?=
 =?utf-8?B?b3JzMGM1QXdIZXdOMWpwUUpzUldJUDhia3hhbEdzUkNJSHUreXk3R04zVk5w?=
 =?utf-8?B?c2xxQng0R0JneG5jVTBnR0pLMS9YckRPSXpSVndjemZPd2dqeTVCUHAwWENQ?=
 =?utf-8?B?Tlh2UTJ3KzFqOUNDc3lFTVhjS0ZzUk1ISUZsS1lvNDJFNy9YTUx1OHlpeWg3?=
 =?utf-8?B?VE14MytvSnhNWnZsYmp6ZHRkYll6QjFVcHpJS042K2FSR0tqNnp0ZXV6N3Aw?=
 =?utf-8?B?ZEZ0NnRjbmJPcVhBblNoMXFJeUwrMVRLZWl3VTdURXBLdWpkSzl0NUpsWXE4?=
 =?utf-8?B?QVdzT3lxOUlocEZ2WDlTczB0d082SG5OWlNIRDRXeDM5SjlKa2tkQlBGNldm?=
 =?utf-8?B?NlBvb2kxU3FKOG1jVktOc1g5ZjZlRDNGcWQyQm1SMTBITWNRZjFHeUpPOFZW?=
 =?utf-8?Q?40f7ur?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(376014)(82310400026)(36860700013)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 14:38:20.1763
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3761b21-df09-4c0c-7744-08ddd1090f8d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6003
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:38:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221359

T24gMzAgSnVsIDIwMjUsIGF0IDA1OjM4LCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiANCj4gVGhpcyBoZWxwcyBpbiBjcmVhdGluZyByZWxhdGl2ZSBzeW1saW5rcw0KPiANCj4gRml4
ZXMgc3N0YXRlIGVycm9ycyBlLmcuDQo+IEVSUk9SOiBzc3RhdGUgZm91bmQgYW4gYWJzb2x1dGUg
cGF0aCBzeW1saW5rIC9ob21lL2toZW0veW9lL2J1aWxkL3RtcC93b3JrL2FhcmNoNjQtbGludXgv
bGliY2xjLW5hdGl2ZS8yMS4xLjAvc3lzcm9vdC1kZXN0ZGlyL2hvbWUva2hlbS95b2UvYnVpbGQv
dG1wL3dvcmsvYWFyY2g2NC1saW51eC9saWJjbGMtbmF0aXZlLzIxLjEuMC9yZWNpcGUtc3lzcm9v
dC1uYXRpdmUvdXNyL3NoYXJlL2NsYy9nZng5MGMtYW1kZ2NuLW1lc2EtbWVzYTNkLmJjIHBvaW50
aW5nIGF0IC9ob21lL2toZW0veW9lL2J1aWxkL3RtcC93b3JrL2FhcmNoNjQtbGludXgvbGliY2xj
LW5hdGl2ZS8yMS4xLjAvYnVpbGQvdGFoaXRpLWFtZGdjbi1tZXNhLW1lc2EzZC5iYy4gUGxlYXNl
IHJlcGxhY2UgdGhpcyB3aXRoIGEgcmVsYXRpdmUgbGluay4NCg0KVGhpcyBzZWVtcyB1bmV4cGVj
dGVkLg0KDQokIHB3ZA0KL3dvcmsvcm9zcy9idWlsZC90bXAvd29yay9hYXJjaDY0LWxpbnV4L2xp
YmNsYy1uYXRpdmUvMjAuMS44L3N5c3Jvb3QtZGVzdGRpci93b3JrL3Jvc3MvYnVpbGQvdG1wL3dv
cmsvYWFyY2g2NC1saW51eC9saWJjbGMtbmF0aXZlLzIwLjEuOC9yZWNpcGUtc3lzcm9vdC1uYXRp
dmUvdXNyL3NoYXJlL2NsYw0KDQokIGxzIC1sIGdmeDkwYy1hbWRnY24tbWVzYS1tZXNhM2QuYmMN
Cmxyd3hyd3hyd3ggMSByb3NidXIwMSByb3NidXIwMSAyOCBBdWcgIDEgMTM6MzQgZ2Z4OTBjLWFt
ZGdjbi1tZXNhLW1lc2EzZC5iYyAtPiB0YWhpdGktYW1kZ2NuLW1lc2EtbWVzYTNkLmJjDQoNCkFu
eSBpZGVhIHdoeSB5b3XigJlyZSBoaXR0aW5nIHRoaXMsIGJ1dCBub3QgdGhlIGF1dG9idWlsZGVy
IG9yIG15c2VsZj8NCg0KUm9zcw==

