Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D665CA0FED
	for <webhook@archiver.kernel.org>; Tue,  9 Sep 2025 10:52:43 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.4])
 by mx.groups.io with SMTP id smtpd.web10.10161.1757415153200007596
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 03:52:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=BJvXdHSU;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=BJvXdHSU;
 spf=pass (domain: arm.com, ip: 52.101.72.4, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=o+eJcYyKEYVQa/fCu0E5WmYf5CvpE6zEGkq7ii19DEMB8yP1OBc+KBnnVMryWp5uMdKEEV9OpCU8+YiLUm4PCiHVJsofYrOMFp9+VNl08pP3xQ9MxyzrTh1gyen9gpe8IlP4DMXBHzm2AdE9SOwVprsqgda2bGhAt+XATcFZ6gHgyd7UvwHyKAl4X/aglZJ1G01CZ1HuA1qPKu9QJcHxFnghZoBx3lsjiQtIGEX1C4LeX5V3XDavAorpr27d/zD8mQsYtoyEzSJPLRhPHKDEM9eESDAZcTHS8caIWKwHjGBZ86kkVXCGl0/LX0pZYSDU0UI6aF1RFnAw6zYRC68LRQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKZGd26sL3ve9Y2dq1okMwialZbFK4oW+v66yIykcco=;
 b=oHdDIqssFISJddjrx0sVRUN5c/e8zOQX9+IjNtIEWWAcYMjqk7ZWW10Zp2YaRSImRHwYzEjD/LF1Zt4t+UPMc7q32V/WeBEgMFDJHXuQLTuDO8XdBbTOyRAfDmuK4r+IFiJLwXauDtz6Yvue5mPWmJxJt/4UcJLn4X6UWtqVSe5dNBrCJzcIW+Ra1RudbDllyFWQgyyGWbFMWgwE987WnLBrJ+x36Wnw/D8UrK39kdjjVWSBldkCHwdxcRYR+kv2xFlT0SKdgeSUsF0iDmMFOa2ALA292bW3nCR3JhB1uWyDPHrpMTC6Xg4GQGc45fsOJyHbG0ppxMP0qVOnxTsMhQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKZGd26sL3ve9Y2dq1okMwialZbFK4oW+v66yIykcco=;
 b=BJvXdHSUjn05v/5lvubtaL5NwUXQkaDJAL3Mykb5sMq1BSHZ7ArvL2rRsNjiSLah2zpG2NhQGsUw/JdNri4/bWkMDotN2u+KoWQBBhr84KIkEGLUVaI302V0U4ouWz6CHNJN0LDH2qahlXa2sEQAXz+DXAMznHeCFvQMK8kplcE=
Received: from DB8PR09CA0020.eurprd09.prod.outlook.com (2603:10a6:10:a0::33)
 by AM7PR08MB5447.eurprd08.prod.outlook.com (2603:10a6:20b:10b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 10:52:27 +0000
Received: from DB1PEPF00039233.eurprd03.prod.outlook.com
 (2603:10a6:10:a0:cafe::f2) by DB8PR09CA0020.outlook.office365.com
 (2603:10a6:10:a0::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.23 via Frontend Transport; Tue,
 9 Sep 2025 10:52:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF00039233.mail.protection.outlook.com (10.167.8.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Tue, 9 Sep 2025 10:52:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c0hZJvviwzxpl0Go9D2Sza88fhWjdUR0zMfo2bFEJcqnzr+Wn7Ci+t2V7m564MS8vHFV58I7u6HB7ctlGdtIvAQfANYpnmB+9vbSSYayLVOqnVWIRW0okGk9cijr2sonUf75rtCA7OblvuEdcBlfaQn0h4kCbI3SNQi/dufsO2Hx4+rD3Rhx23ZF68pQHd+VnriBrfY4m60RNJwetLsuf3MGe83RWqhL3tzNar2z9Uj/F9R7EDH19MLyX6SuiuD4xENjjfFOADUo+ZVIwhL5GYQ2S0kiOJ1AMdqw+XKnYIQMtfDHLvQy0GinEWTY19D+cxPbBIX2shzub+G7hzHhsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKZGd26sL3ve9Y2dq1okMwialZbFK4oW+v66yIykcco=;
 b=P0GKwegbyU2UabUT7UspFoPWasYoRhhlQAeurcxApnOClTl1EnPciQiR1sGiw9o8e0DfSyjK+XQ8P2EPKAnMn3aAAwiA8QnDw/LOTd/BG4Cg6L2YPhNBoetYo/WJBBnRTfjSPUcZcfs4+ANqmyYi46jnY1CnlXsDbJcmYuizZv8LT2WGIZ38k7whi4FiBgOqG9ZySlbih2zv1O58fkbxOgPDJtr7BYBwcOAeCcve9sY95M2U0f2sqw2fox/IrViVTMMeooLeyqr6pUw+mBbV2R7odcOWZ1CHj2jqIA6QvzmpfeQZZtdMmb8vXktAWfBhhZ3zGLdp/ryAwP+lYzcw4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKZGd26sL3ve9Y2dq1okMwialZbFK4oW+v66yIykcco=;
 b=BJvXdHSUjn05v/5lvubtaL5NwUXQkaDJAL3Mykb5sMq1BSHZ7ArvL2rRsNjiSLah2zpG2NhQGsUw/JdNri4/bWkMDotN2u+KoWQBBhr84KIkEGLUVaI302V0U4ouWz6CHNJN0LDH2qahlXa2sEQAXz+DXAMznHeCFvQMK8kplcE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB11317.eurprd08.prod.outlook.com (2603:10a6:150:2c0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 10:51:53 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 10:51:53 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "deepesh.varatharajan@windriver.com" <deepesh.varatharajan@windriver.com>
CC: Alexander Kanavin <alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Kokkonda, Sundeep"
	<sundeep.kokkonda@windriver.com>, "Dora, Sunil Kumar"
	<sunilkumar.dora@windriver.com>
Subject: Re: [OE-core] Drop rust-llvm and use clang instead
Thread-Topic: [OE-core] Drop rust-llvm and use clang instead
Thread-Index: AQHcGBFVX2kCwiqSFEacxyzSm0gzHbR4CB+AgBKMjoCAACqlgA==
Date: Tue, 9 Sep 2025 10:51:53 +0000
Message-ID: <DF73EC2F-F20B-4C83-977B-17DA18869C32@arm.com>
References: <29f1bfef-97ac-44bb-b2de-63661a38e814@windriver.com>
 <CANNYZj99rO9YpEUe1_sGBFXiaOA0dgoRMRK_AwgPKkaQWCnhfA@mail.gmail.com>
 <454f5ba1-09a2-456c-8df8-0a0fe441f6cf@windriver.com>
In-Reply-To: <454f5ba1-09a2-456c-8df8-0a0fe441f6cf@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB11317:EE_|DB1PEPF00039233:EE_|AM7PR08MB5447:EE_
X-MS-Office365-Filtering-Correlation-Id: 375e36a3-e50a-4aa0-768f-08ddef8ef6df
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|4022899009|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?SnlJVTdUZEIxdDJlc2VCZVJWTldON3hOb05XZDNTSkhmelNtSmdweDdaTmMw?=
 =?utf-8?B?TXdtam1QQXNQOWgzVjJ6QWtzeGkzWUVvZEZzdnVGWk40UjRpaGFxcysxOU50?=
 =?utf-8?B?UFY3czZhbkRrZ2tXMlYxbHZBY0ZNckh2eVNBVVkzM2RtNCtUdVZUWnBsWEMz?=
 =?utf-8?B?YnY2WHlkRWxDa1NhZUpRd2xjMExpV3FFWkRoNTQxQnFFQ3MwekNJUnZWVlpr?=
 =?utf-8?B?cmk2QlBWQnl2WXU2Wk9qYkEwcGhrK21jVXFxVEFhWDhrdlg2WFdnRUEzTGpr?=
 =?utf-8?B?ZytlbC9kTjJCQmFOZk9sNmxZTndhZ0dldFJQQnJqZjhRNmxSekVJSThJZWdQ?=
 =?utf-8?B?RWZxZEl5SWpMNlpkdGN0V21rRlJMS0luZUxjT3psMjlOOTF0dVFmOGVWNDZh?=
 =?utf-8?B?aWFqSXROKzJpSEpxZCtsU1lWYWVyd2ZodzM0cVJSN2dXbmxJeHVxeDJkajh0?=
 =?utf-8?B?YXpsb3ZNSGZuU0dYM1dSRGhWcVVrZWpoN0FXOEUwdm9VbW1rWUg0MkxLcEhM?=
 =?utf-8?B?N3gxelZ3SWZOWFd1amxodEdjTUJ0YWJZL3VxKzV6dWdCMXl0bC9JTWpTNytE?=
 =?utf-8?B?WDBUajA5elRiS3h4Y2RKL2xLcnNuOEEzN3ZRUVNYVmhHQXRPWWR1dmt0VEJx?=
 =?utf-8?B?RGhQTFV4aURaUlR3ekF4aWluVUhuRUE2cXIrdnBNM25sWldiSEgwTWpZUFI0?=
 =?utf-8?B?aGxRWFRDbUo5SUNJUTNRWGszR1pxVGxibU1RMGxtK29wMHpMcDV6bjN0UmJT?=
 =?utf-8?B?Y0dCcUFLWThLaDRIWlZaMkJhNWkxWTRDTFhLeTlUNjI1c1dCbFJlMkdKVVRL?=
 =?utf-8?B?QncxbkJxMW1JUTNMSU1mbU5nTzhLU1J4YnZ2YVNidkxld045VE82TUVlam0z?=
 =?utf-8?B?NVBPSVRIayt6NGJObkZXbWJOWStxS1BPRTNJVmFudklHa01UTlBFcmF4VVhN?=
 =?utf-8?B?ZWFkSmFaVldaa1RKaStkblJQK2RMS0xuY1BzZXZOTDcvR3d3VzYxd2IraSsw?=
 =?utf-8?B?U1pCTW5nN0FUV2FUaG0vU0dRYnk1ZTNobEphOUZvckJVKzBjMStRcFVleEw0?=
 =?utf-8?B?aGRqOWpsTTV4bkcxTm1VclBCUFVmVllnQ2wxVUVaUk1XNmhMUlBjUnJZbDNY?=
 =?utf-8?B?cWxIWGVNS2xON1dOdFlVRWE2bDNSNkdVaUtONE9IWWlVUG85Z0VEOXJlRkhr?=
 =?utf-8?B?a3ZOSDhKRlRyd3pLTlpVV1BDVk9iTFVzbmliKzBtWkFFRTNSZWNSQzFFQWhi?=
 =?utf-8?B?TE5QNmQwODNBNUhMNmorSTg3UUNER09lKzRkUEFnWE1kSzVTeU5ycG1qTWJi?=
 =?utf-8?B?QmZ3VVpwSWp0QVFlWThzZDNLVmx6cTZEVVhCN3pZN3ZTUkFrN3YwV1hpcTBL?=
 =?utf-8?B?ZVdnbDFHRUtxYS9keHpGVFM0SzAvUEdaRlpJWlA2akFUY1MxRG1kQnJybjUw?=
 =?utf-8?B?bGJsYmRPT0JDZG01bFZzNTk4UEpobW5TRklhQTAySEN2MXduU3RKN0RxNjBi?=
 =?utf-8?B?UXZBVGd4dE5FMTdOM1Bka3VZTVAzdUcyemVZT3B4aWFpd3crRTd2MTI4aVFV?=
 =?utf-8?B?eDV1M0hwbkovL3Z5SkNLUk5zNTdmNHJLdVpGWEY0R0cxZ2dtSXlGWlNuc2RC?=
 =?utf-8?B?c3dhYVRtSitnK2Z6eGVWWFZGUUwrWkVQbWd6WHlKSlQ1anZTV2Y1VzZwdWhT?=
 =?utf-8?B?MDQ2bFJZWms3cys0eS9iMkIwU0ovTEpqbU5KOTI4S2VGRmJPR2YwZDd6NEw5?=
 =?utf-8?B?THFUM3VhNTJwalhFUkpBN3hrT2Z5T2RCYVYvaEYrbWdtYzNpRitDOW5XY1o3?=
 =?utf-8?B?MHliTVBKRGVxbDFtVlg3L2FPWGxRRm84bHpCcDBBMSs2M1NZVFhmUm40bm5h?=
 =?utf-8?B?d08zWVFnV21GMzdrMHEzTDlqVHhrVjdRNi9pWXZLU2cxZllTdEpQOUJ1cEVv?=
 =?utf-8?Q?T3WKDoGXlG03v8ccE1mJA7iTta+6kaoC?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(4022899009)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DD9E05BED1EB554196E34797AA445DDE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11317
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	06a0f273-a868-4c9d-ec50-08ddef8ee36c
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|14060799003|1800799024|35042699022|82310400026|376014|4022899009;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZmdtSTJ4NitXdWlWRE44Z1d4WFdmL2IwTHVZbW52cmFtckpMb281aEEyeDhL?=
 =?utf-8?B?dzJiRTlwOGx3UGJMZDMwVU9HUmRRM25QNW1BdUtJUy9OQ2hELzNadnpNOUdi?=
 =?utf-8?B?ZXppR2F2MElwcjl5TWFFdDNMTFp5U0R2U05wT1NPWnF2R2ZxVDdZdGVhUzFj?=
 =?utf-8?B?NVcxNUJ2SkZubXFUM1NIb1pTdjJhWGJuTVdxdkkxS0VIQldtYzdIb0xsMEUv?=
 =?utf-8?B?R1F5bVcvSm1EKzV6TjBlZHVNeWZtMEhEb1JKempLeCtLWTlzZWxFdnhYS2JI?=
 =?utf-8?B?c0FOWnB0WFFUOXFCNmwyRndabmpJd2tnOUFKOTZrSElBWHg4ZGFBTEpaYzBY?=
 =?utf-8?B?L2ZiWXJpalJpeFVTSXlzdGwxZkVDZ1VYWG0rMzhZcDdaSGNTaHE1aXFCdE9k?=
 =?utf-8?B?U1JMSkRDMU45NGdMK2YxU1hmOEdzZmFlMWtXZUYzVUc0Nm5USDdnUHZtYVFn?=
 =?utf-8?B?dXdIT1VDcXpTSkpoZXhIYjhEdHFMM3JKL0c1dC9pbVZYaDJSZ0RNdFBtemg1?=
 =?utf-8?B?dk43bEd6R2JiR3g5ZWsxTi9FckxYeDV4QWREWklsTDNFSTA2QTd3b21zNC95?=
 =?utf-8?B?dlNzVFBsUHhNV0lYRVFZUjZycmdpa2F2K002VXcwQWVGVElRVy9wV3BsdzRV?=
 =?utf-8?B?a05zT1FrdEpCOHFRSHN0cGJWc3U4MU9JaTFoNEVrNWl0ODhrRVhzajVzUThK?=
 =?utf-8?B?Si90TW5ITWNLT2pXUEdYQWJybzN4VFBqNldQQzBMYWVTbGNSOWhVUXVXTFpJ?=
 =?utf-8?B?dDNWdmlnOTJTMGEwQkx1V1hDdUpKUmhYeG9zd0g3Ui9qazhmUlhxUFYzZms0?=
 =?utf-8?B?MlZOOUkrdGU5ZjBHRU8rQm1QeGN6dUg5MEY1R0lISTVlUkxJdnAzNm9Tbi83?=
 =?utf-8?B?M2puU2JlNHF1WmVLYVNhVnlNQlp3TTJlQlVPNUlRb3MzejV6MkE3My9HYXV0?=
 =?utf-8?B?WDZQT1RaY1BHZUV2dkFFZU1RaEFnT0Q1ZVlhbHVFMG9Zd0lTZTZnMDVuQm5H?=
 =?utf-8?B?cnNlWUMyM1MxSTJlRG12M0x3QVVIcERHcVBSUkxqZmJmNDAxWjBiWEhhRkEy?=
 =?utf-8?B?RW41dThGMTBmeEpNNVp0bTFTOXFqekQ3ajdIalJ4cW45LzFMam1BbmMyVDJR?=
 =?utf-8?B?TXF4WlFMYjJYbG81NWY5TzJFQi9SNGh6eWxwTmtBeTE0VWcvRHNpNUFraUNa?=
 =?utf-8?B?TkRLYlRuNVlkS1hXa2JrUzliOUtQK2RnSGRpWStjdk01Q3NSdE1zakRqbmtV?=
 =?utf-8?B?WTBJRXdoMThIVXh3MGdKVTFvc05IQ3lBRklIdUlCbjZYMS9xZWVSajlpaVNa?=
 =?utf-8?B?SzZUYmpwSGVCcDM3Z1hCdVU2Tyt2U2h2RXFKakpWaHQvQUkzZk5vcHByK2lz?=
 =?utf-8?B?VVVxTEtNZ2poV3pzUXBHZ3FwT3RPK2pxVkwwRUJlL1YvNmhFNCsxcXBrSUJi?=
 =?utf-8?B?UlVmaGlsaEo3ZHlqSlZqK1VPbUdlOFZzOWZQTERETEdWYzd3MXpUa2ZXL1di?=
 =?utf-8?B?RW9mcU1EdkhEYlF4YUlpZGg4aHhNWHBPSXpYNGxyRWdWcG4xa29Jc1ZqcWp0?=
 =?utf-8?B?d2RvZm53b1hzTEluMHlyNjMrVFgwM1E4N3VnbytJcGFhTytGWmF0blpzbTNp?=
 =?utf-8?B?YmtURit3TnpzTjJ1TGlqVjcrcEJQT1NpaFlnZVZFZlBTaC9yaWxReldjNzBE?=
 =?utf-8?B?SGpYVWpNQlBDT295R3p6VVowNWNTenZDRGY1NDRZR2F2Szd3bHEwR1RYTXJz?=
 =?utf-8?B?U1hEWWFDdlk2MVZRT3c3RHR3T2pDYzVHeWNzU3gxK1laSWFzeGkrTmNCUzNj?=
 =?utf-8?B?VU9TZWtoa0ZRaGZCb0VIRVNJdmE4MHFuSExENVpqR1N3b2F6N3hrVVQzZmww?=
 =?utf-8?B?RElPSHlPUndjbEdPOEFHZ1R3TTRFV3QzYmxtVmI2VGh0N2ZuZUduZlhvSDhP?=
 =?utf-8?B?dy9BcUs5WklLQmR1NkZRcFJBYVRVQSs3cjNRV0NrbisraEN0NDZ1eHZtdFdD?=
 =?utf-8?Q?OWvJ8M00izxNjB7WHH+fOf/jdKeY+M=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(1800799024)(35042699022)(82310400026)(376014)(4022899009);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 10:52:26.1560
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 375e36a3-e50a-4aa0-768f-08ddef8ef6df
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF00039233.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5447
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 10:52:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223102

RXhjZWxsZW50LCB0aGFua3MgRGVlcGVzaCENCg0KSeKAmW0gZ3Vlc3Npbmcgd2XigJlyZSBhIGJp
dCBsYXRlIGZvciBNMyBmb3IgdGhpcywgYnV0IEnigJlkIGxvdmUgdG8gc2VlIHRoaXMgaW50ZWdy
YXRlZCBwb3N0LXJlbGVhc2UuDQoNClJvc3MNCg0KPiBPbiA5IFNlcCAyMDI1LCBhdCAwOToxOSwg
VmFyYXRoYXJhamFuLCBEZWVwZXNoIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxkZWVwZXNo
LnZhcmF0aGFyYWphbj13aW5kcml2ZXIuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3Rl
Og0KPiANCj4gDQo+IE9uIDI4LTA4LTIwMjUgMTg6MzMsIEFsZXhhbmRlciBLYW5hdmluIHdyb3Rl
Og0KPj4gQ0FVVElPTjogVGhpcyBlbWFpbCBjb21lcyBmcm9tIGEgbm9uIFdpbmQgUml2ZXIgZW1h
aWwgYWNjb3VudCENCj4+IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVu
bGVzcyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2Fm
ZS4NCj4+IA0KPj4gT24gVGh1LCAyOCBBdWcgMjAyNSBhdCAxMzo0NSwgVmFyYXRoYXJhamFuLCBE
ZWVwZXNoIHZpYQ0KPj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPj4gPGRlZXBlc2gudmFyYXRo
YXJhamFuPXdpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+PiAN
Cj4+PiBXZSBoYXZlIHJlbW92ZWQgcnVzdC1sbHZtIGFuZCB1cGRhdGVkIHRoZSBSdXN0IGJ1aWxk
IHRvIGRlcGVuZCBvbiBDbGFuZyBpbnN0ZWFkLg0KPj4+IFdpdGggdGhpcyBjaGFuZ2UsIHdlIHN1
Y2Nlc3NmdWxseSBidWlsdCBSdXN0IGZvciBib3RoIG5hdGl2ZSBhbmQgdGFyZ2V0LiBBZGRpdGlv
bmFsbHksDQo+Pj4gd2UgcmFuIGEgZnVsbCBiaXRiYWtlIHdvcmxkIGJ1aWxkIHdpdGhvdXQgZW5j
b3VudGVyaW5nIGFueSBpc3N1ZXMgYWZ0ZXIgZHJvcHBpbmcgcnVzdC1sbHZtLg0KPj4+IA0KPj4+
IFdlIG5vdyBhZGQgdGhlc2UgZmxhZ3MgIi1DIGxpbmstYXJnPS1seiAtQyBsaW5rLWFyZz0tbHpz
dGQiIGJlY2F1c2Ugb2YgdGhpcyBmb2xsb3dpbmcgZGlmZg0KPj4+IG90aGVyd2lzZSB3ZSB3aWxs
IGdldCBlcnJvcnMgZHVyaW5nIGxpbmsgdGltZS4NCj4+PiANCj4+PiBTZXR1cCBpbiBydXN0LWxs
dm0NCj4+PiAtRExMVk1fRU5BQkxFX1pMSUI9T0ZGIFwNCj4+PiAtRExMVk1fRU5BQkxFX1pTVEQ9
T0ZGIFwNCj4+PiAtRExMVk1fRU5BQkxFX0ZGST1PRkYgXA0KPj4+IA0KPj4+IFNldHVwIGluIGNs
YW5nDQo+Pj4gLURMTFZNX0VOQUJMRV9GRkk9T04gXA0KPj4+IC1ETExWTV9FTkFCTEVfWlNURD1P
TiBcDQo+Pj4gDQo+Pj4gWW91IGNhbiBmaW5kIHRoZSByZWxldmFudCBjaGFuZ2VzIG9uIHRoZSBw
b2t5LWNvbnRyaWIgYnJhbmNoIGhlcmU6DQo+Pj4gaHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9y
Zy9wb2t5LWNvbnRyaWIvY29tbWl0Lz9oPWhhcmlzaC9ydXN0LWxsdm0NCj4+PiANCj4+PiBEaWZm
ZXJlbmNlcyBzZWVuIGluIGJ1aWxkczoNCj4+PiANCj4+PiB3aXRoIHJ1c3QtbGx2bSBmb3IgYml0
YmFrZSBydXN0DQo+Pj4gcmVhbCA1NG01NC4xODRzDQo+Pj4gdXNlciAwbTEzLjQ3MHMNCj4+PiBz
eXMgMG0xLjM4MHMNCj4+PiANCj4+PiBmL3MgdXNhZ2UNCj4+PiA0MUcNCj4+PiANCj4+PiB3aXRo
b3V0IHJ1c3QtbGx2bSBmb3IgYml0YmFrZSBydXN0DQo+Pj4gcmVhbCA1N201MS4wMTVzDQo+Pj4g
dXNlciAwbTE4LjEyOXMNCj4+PiBzeXMgMG0yLjA1MXMNCj4+PiANCj4+PiBmL3MgdXNhZ2UNCj4+
PiA0NUcNCj4+PiANCj4+PiBXZSBhcmUgb3BlbiBmb3Igc3VnZ2VzdGlvbnMsIGltcHJvdmVtZW50
cywgb3IgY29uY2VybnMgcmVnYXJkaW5nIHRoaXMgY2hhbmdlLg0KPj4+IA0KPj4gVGhhbmtzIGZv
ciBjaGVja2luZyB0aGlzISBJcyBpdCBwb3NzaWJsZSB0byBoYXZlIGEgY29udmVyc2F0aW9uIGlu
IHRoZQ0KPj4gcnVzdCB1cHN0cmVhbSBhYm91dCBzdGFydGluZyB0byB1c2UgcHJvcGVyIGNsYW5n
LCBvciByZWFzb25zIHRvDQo+PiBjb250aW51ZSB1c2luZyBydXN0LWxsdm0/IE1heWJlIHRoZXJl
J3MgYSB0aWNrZXQgb3IgeW91IGNhbiBvcGVuIG9uZT8NCj4+IA0KPj4gV2hpbGUgJ3Byb3BlciBj
bGFuZycgYXBwZWFycyB0byB3b3JrIG5vdywgZGV2aWF0aW5nIGZyb20gd2hhdCBydXN0DQo+PiBk
ZXZlbG9wZXJzIGRvIGlzIHJpc2t5IGFuZCBjYW4gY2F1c2UgcHJvYmxlbXMuDQo+PiANCj4+IEFs
ZXgNCj4gSGkgQWxsLA0KPiBTdW1tYXJ5IG9mIGRpc2N1c3Npb24gd2l0aCB0aGUgcnVzdCB1cHN0
cmVhbSBhYm91dCB1c2luZyBsYXRlc3QgTExWTSBpbnN0ZWFkIG9mIFJ1c3QgbWFpbnRhaW5lZCBM
TFZNIGZvcmsuDQo+IGh0dHBzOi8vaW50ZXJuYWxzLnJ1c3QtbGFuZy5vcmcvdC9jYW4td2UtdXNl
LXByb3Blci1jbGFuZy1pbnN0ZWFkLW9mLWxsdm0tZm9yay13aGF0LXJ1c3QtdXNlcy8yMzQ4OQ0K
PiAgDQo+IFVwc3RyZWFtIExMVk0gaXMgZ2VuZXJhbGx5IGNvbXBhdGlibGU6DQo+IC0gUnVzdCBk
b2VzIHN1cHBvcnQgYnVpbGRpbmcgd2l0aCB1cHN0cmVhbSAodmFuaWxsYSkgTExWTSwgZXNwZWNp
YWxseSB0aGUgbGF0ZXN0IG1ham9yIHJlbGVhc2UgYW5kIHRoZSBvbmUgb3IgdHdvIHByZWNlZGlu
ZyBvbmVzLg0KPiBodHRwczovL3J1c3RjLWRldi1ndWlkZS5ydXN0LWxhbmcub3JnL2JhY2tlbmQv
dXBkYXRpbmctbGx2bS5odG1sI3VwZGF0aW5nLWxsdm0NCj4gIA0KPiBUaGluZ3MgdG8gbm90ZSB3
aGVuIHVzaW5nIFVwc3RyZWFtIExMVk06DQo+IC0gUnVzdCBtYXkgaW5jbHVkZSBjaGVycnktcGlj
a2VkIGJ1Z2ZpeGVzIGluIGl0cyBMTFZNIGZvcmsgYW5kIHNvIHVzaW5nIHVwc3RyZWFtIExMVk0g
bWlnaHQgbGFja2luZyBidWcgZml4ZXMgZnJvbSBydXN0J3MgZm9ya2VkIGxsdm0uIChCdXQsIA0K
PiB0aGlzIGFueXdheSB3ZSB3aWxsIGNhdGNoIGl0IHVwIHdpdGggbmV3bHkgcmVsZWFzZWQgcnVz
dCB1cGRhdGUpDQo+IC0gSWYgYSBidWcgc2hvd3MgdXAgdXNpbmcgdmFuaWxsYSBMTFZNLCBpdCdz
IG9uIHVzIHRvIHRyYWNrIGl0IGRvd24gdW5sZXNzIGl0J3MgYSBrbm93biBpc3N1ZS4gKEluIGdl
bmVyYWwsIHRoZSBsYXRlc3QgbGx2bSBpcyBhbHdheXMgdW5kZXIgdGVzdCB3aXRoIA0KPiBydXN0
IG5pZ2h0bHkgYnVpbGRzKQ0KPiAgDQo+IEltcGFjdCBvbiBZb2N0byBSdXN0IHVwZ3JhZGVzOg0K
PiAtIFJ1c3QgdXBncmFkZXMgc2hhbGwgYWx3YXlzIGNoZWNrIGZvciB1cGRhdGVzIG9uIHJ1c3Qg
Zm9ya2VkIGxsdm0gYW5kIGJhY2twb3J0IHRoZSByZWxldmFudCBwYXRjaGVzIHRvIGNsYW5nJ3Mg
bGx2bS4NCj4gIA0KPiBSZWdhcmRpbmcgdGhlIHJ1c3QgZm9ya2VkIGxsdm0gbG9jYWwgcGF0Y2hl
czoNCj4gLSBUaGVyZSBhcmUgbm8gbG9jYWwgcGF0Y2hlcyBvbiBydXN0IGZvcmtlZCBsbHZtIG90
aGVyIHRoYW4gdGhlIGJhY2twb3J0ZWQgZml4ZXMgZnJvbSBsbHZtIG1hc3Rlci4NCj4gIA0KPiBE
byBsZXQgdXMga25vdyBob3cgY2FuIHdlIHByb2NlZWQgb24gdGhpcy4NCj4gUmVnYXJkcywNCj4g
RGVlcGVzaA0KPj4gDQo+PiANCj4gDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IExpbmtz
OiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPiBWaWV3L1Jl
cGx5IE9ubGluZSAoIzIyMzA5Myk6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29w
ZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMjIzMDkzDQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6
Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzExNDkzMzI1MC82ODc1ODg4DQo+IEdyb3VwIE93
bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVu
c3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQt
Y29yZS91bnN1YiBbcm9zcy5idXJ0b25AYXJtLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0t
PS0NCj4gDQoNCg==

