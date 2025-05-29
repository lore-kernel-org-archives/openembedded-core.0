Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66F88C5AD49
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 12:29:16 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.36])
 by mx.groups.io with SMTP id smtpd.web10.19918.1748521752334215134
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 05:29:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=gPOb5RSv;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=gPOb5RSv;
 spf=pass (domain: arm.com, ip: 52.101.70.36, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=e1C3Sl3vFRndd4OJfakDYdwOnACK6LAnkdxLyxMqPsgzpf4OWCcsOE3nhg9vym+D0IZHteNMDw4y6XwStdFE2Xa7dzb8AVBpUhPA2fanOtxoaocIp7Uqphaav1hq/QByi80Z/elAm7Xxe+IfuTdiPXM7/IVWM0WJE53/XMqeE/uDsfu+59LSG/yFvFUIkqVpK73IP4F0uioh9fGF+RTdBd2e/l9Di4TEFxCy2oSYiMzcS4CupSpkEmXqAPnKKh5wCjZwNRfxxBhqCViZUmc82F8B2Hn1GM3F2LNNOMEZ+eyutY/wiuObnqW8a0WRw6nx1r2e8Mu33CXFSOBWIDr5TQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORWcU1lAT15u6hJVSWOX8zwGZbWQA/ZBqj2hNon5w6Y=;
 b=EgsZJBarMA8wHBPg1AUCU3INJRGsGrQtH0piMuT5/EAqc26cD446MsptTG6JD3M1kMHNTBQnHMZK8LpO1f11S7hkFE85y3gkCuKRlU2RB/zR81DNaEbrUFZL7zwXhuMuoN4KGuRHBAHG50JWoa6T75rGHTsIE78U/6UOVNvxNhUr2seXBlMvxu8LxedgvRiO4B3yjH6UUyG1ue+kdXuIUv8oDLinPhZY159b3+wli5cgaVpjA9haJgEmfiLgW0cG7DZXNedllMR5UvzjB6pc7hlOiS76rDu04s6QYRZf8ks4rMs+2GzlYwUcyLYGewu8v3Qw5wEFmQqdMM5nBCdO9Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORWcU1lAT15u6hJVSWOX8zwGZbWQA/ZBqj2hNon5w6Y=;
 b=gPOb5RSvLCEd3B6g3Q95wIMXCJz1OHugNcN6vZm7T1kRlfyrlf3+Ag/VxmLfpke/a3y7AJXDnWVlXw/Vuk9GTqocc6MNeJBnRlexrv8ye/DuiC18IRdFgBVFYMDk6Tl75VqYrocEi/RuGlMV1eJrT0yewUyGjHdaAB1p3Lu3Ptc=
Received: from DU2PR04CA0342.eurprd04.prod.outlook.com (2603:10a6:10:2b4::21)
 by AM9PR08MB6177.eurprd08.prod.outlook.com (2603:10a6:20b:283::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Thu, 29 May
 2025 12:29:08 +0000
Received: from DB3PEPF0000885E.eurprd02.prod.outlook.com
 (2603:10a6:10:2b4:cafe::69) by DU2PR04CA0342.outlook.office365.com
 (2603:10a6:10:2b4::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.29 via Frontend Transport; Thu,
 29 May 2025 12:29:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF0000885E.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 29 May 2025 12:29:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TZqKtxTv8ycQzI73zql/lKk4Y1bdx90xJyDFw0gbbG/cNg9Q9aLk0gPkPookY1+b1tVc5f6XpHmhs82MOP4P+5HtTVg1yMTl3TtI65j8B6K8iS5f5I4+jgSifaQZNrlKa9cTQaYeQjp8Yco1Dtqqze0l5xmdQFmyX4FSUvfbVwvTfL3wQ9bKn2imYjNS26nawE2sNCU0cgXtysW5VDYfxsPCBLjGO8f4JCj/Z8Vd2pZdrCnCmSqBW8ByETWzxAECFsEp+Irf5d/s7lHT5SBDcJ17ta+tK5PH4pDdUh2BWWevwhHMHuU/IE0/+4Km7qJRWAFCPUXrjhcHr6O0B67taw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORWcU1lAT15u6hJVSWOX8zwGZbWQA/ZBqj2hNon5w6Y=;
 b=laTPAhHJZWJCNdROt30jyrrWXDMZ6JD3By1bBTMlalG5uRkRuLUcz6mPRPPzC7vweOtiplyQg5zCMzRKgKeIqX28ipDuD5SDQVexZXYCDVJh9ANkUJON8K0ItZZnofP3gGQ9QTL1b+yAE/4lSlN2mkcwxlyPtHwnoKf58hcCWrPirN9uYqitjKXy7y7O6+Ss8kROPDFyjvOsk7KrVNH/CLjsvUGXYs+ZQvhtlvvpeLqcH7BnPkmhbDYaEztuaArWS8+xtN8OrIm/Pwax/fLWge+vdD3kpX0sMxWUDKWVsnKLRFDV7Ty8SSTm2lX/3cKNImcSMWQKX9xwTGqxLDICAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORWcU1lAT15u6hJVSWOX8zwGZbWQA/ZBqj2hNon5w6Y=;
 b=gPOb5RSvLCEd3B6g3Q95wIMXCJz1OHugNcN6vZm7T1kRlfyrlf3+Ag/VxmLfpke/a3y7AJXDnWVlXw/Vuk9GTqocc6MNeJBnRlexrv8ye/DuiC18IRdFgBVFYMDk6Tl75VqYrocEi/RuGlMV1eJrT0yewUyGjHdaAB1p3Lu3Ptc=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB9224.eurprd08.prod.outlook.com (2603:10a6:20b:59c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Thu, 29 May
 2025 12:28:33 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8769.019; Thu, 29 May 2025
 12:28:33 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH V3] util-linux/util-linux-libuuid: upgrade from
 2.40.4 to 2.41
Thread-Topic: [OE-core][PATCH V3] util-linux/util-linux-libuuid: upgrade from
 2.40.4 to 2.41
Thread-Index: AQHbzuFOwHmgIdSuKEGaWzRRMB3XjLPpjJOA
Date: Thu, 29 May 2025 12:28:33 +0000
Message-ID: <87E85F85-D3EA-43FA-A162-D9E8487F8E85@arm.com>
References: <20250527082748.1608410-1-Qi.Chen@windriver.com>
In-Reply-To: <20250527082748.1608410-1-Qi.Chen@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB9224:EE_|DB3PEPF0000885E:EE_|AM9PR08MB6177:EE_
X-MS-Office365-Filtering-Correlation-Id: 5740c77e-ac73-43a9-b66e-08dd9eac67d0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?U3FYbGRxeWNkdUNCOHgwMDhPMjBjUVlMeUJuYm9oSlk1S0IwVlFDeXI4T2o2?=
 =?utf-8?B?UUJ3eHl1YjNqbHVMVDN2aUR5SnUvMmhIdXdNMlFBQmVhc29qa250d2p1MXAv?=
 =?utf-8?B?RGN5OGlzdHRVaWZYZjQ3NTgyaEw3V0ZZbTcxb2lXVGF0VUw4RDdaY0s0WjV1?=
 =?utf-8?B?ZzRUQzk5eXJYaHhHalZIZnNoVGdmUUk3UEFXQnhIaHg3WFRBSmZIaXVVaE9I?=
 =?utf-8?B?WW83cHAzcnJTemYzUGI2MW5HMVFnWG5iU0xac2ZGRzRTNzRBemRYVVFNSVRr?=
 =?utf-8?B?S0dodEo5dVExT3pYRUpIeVlIb04vb2lvSENxelJrTXpBcXVjdXdGUG5rc09O?=
 =?utf-8?B?RXlBeGVOVzBoYzZhVjNsb2FXUnp0TjFCenVWWDlCRGRoL3FFRmxSN3liU2hq?=
 =?utf-8?B?U24ybnROb3BQT1E2S3JrUm9uanZrZ0ZBYnhwcnZ2a3pNVWtGYjJsbWZxZ0w2?=
 =?utf-8?B?dU5BSkhhRmlyS3FITEZIR3JBNm9mbytocC93eXhiQW51dW5WT1k2amVxYkhV?=
 =?utf-8?B?OEFQZDY2R3R3R1RyT3ErZW80NWdKRWZIVmRhY0x6aVhjdW9FMzdoZVU0RUpz?=
 =?utf-8?B?ZGR4YXBQMjZwL3ZjOHpYUC80em5vODVldkRKZnd3M0VtdnZOM1diMDZSQkRB?=
 =?utf-8?B?R050WVRyVlJJS2NjOUZ3WGRYYmlrZ2ZQYUFRSWxGeU0rNGs4dDNGQTNWd3l6?=
 =?utf-8?B?V3RaalNVWFpRalZvNWEyOSt5UFlSOWtKRVJ2eHJpRGNLY3NSRncxbTRzZ21n?=
 =?utf-8?B?ZnB5T0xNUmpmWStyeElzRS8wK0RCZndWSmhMSHE2Y2orNUNsS2xMMUFsOVRY?=
 =?utf-8?B?dUFoaWphWXlDRWdYV214N2VNS0I5R21KN2VXL1VmeWNnUFp1WURmMDNyV04w?=
 =?utf-8?B?Zkh3OWdaZW1HZGVQbnZTcVVxTUt5cTdGazI5a1BCTmYrd2NoMnZDek1BOUtS?=
 =?utf-8?B?ZjN3Z0JNbEF3aCtSS2k0VytFNFE2bGRTY29MbzE2YU1hOHllTnFnMW94S1lY?=
 =?utf-8?B?dnBqQkRKellmYy9XVkZIZEkrNy9uUTlpTkZOSmlpNCs4N0dnV2d2OUszRDZm?=
 =?utf-8?B?WFVlSitBcU9SbWZkd2NIR3V6a3c3bWpHaUllMVMvZDVueE1NeE84VDZvbmZ2?=
 =?utf-8?B?YldXeFU3amQwMWFKUkJZZTNyeUt5SDlRNUxqYjIzdVJxWm53TDhXSy9iMlky?=
 =?utf-8?B?STNqby9uLy9JM2padElVZ1dTTXpzSEtwYTV2a1ZJb2ZxSWFQT1N6bWYwZGpF?=
 =?utf-8?B?MWI4T2NNQzMrdENIZnltZFQrTE4rUHRZenJ6Y2xiMmtQcVRmWUNGLy9DMisy?=
 =?utf-8?B?MFFWeVN2Y3VhSjlZWVFDaXo5cFE4clNXdndZNUJxUmVUeUpPVnVXMHdNS3pT?=
 =?utf-8?B?dllhekgxWmdPZ1lEaHhidlF4TWFSMkNONk1tWi96dlZZaHR3WlZjMnJzZFJG?=
 =?utf-8?B?ZE1EMmxvdnUrYXJPQWp6Z3pyRWo3UHNYdXNOODRrcmM2ZFdrcFgwTU0wQWRv?=
 =?utf-8?B?dGI3ZElTTmllTUhKWDVNSUlnajFqV2hmL01UQXJqd3RpTlUxMTVmbU8wWnZZ?=
 =?utf-8?B?U0pWVEtTRkVuZ2dtZUZtMjRMT3p3VzhTM2ZmcW1DTmhtZG9HLzN5U0xNTGtv?=
 =?utf-8?B?cXhxM2s4MTEyYi80L1N1R3dBczFUbklsQTNyOGtueWttcXprTjBOOEFId0cr?=
 =?utf-8?B?cFk4bGx4OFpnb2FpZVhNM2QyZ3J4WUlRSEYwc0tGL2U5RlIwSll0dmJIN3VC?=
 =?utf-8?B?NzhuR2M2TDl5VlJoTDIvY1k1akxYYlpWZ25vdWRNNUY5WUEvSmJUMi9DVUJu?=
 =?utf-8?B?QTRLcTRUdEVkaWhsYkl4QUZndSs3UjFwRHljNEZiN1RJN2Zjd1hUaHVaWWlR?=
 =?utf-8?B?QjRrMkRkUCt0d3k5N3ZIT0VTUWtUZGRONXpaM0w1bzA1RzRmRXFtMVQyakRU?=
 =?utf-8?B?YkNUbWk4TllwMkRNVXhrVE1OeWorMXVHb3BNei8xaU11cHRhYzNINFgwRFpB?=
 =?utf-8?Q?cftG32Dkb1xFhoaDtQw39YmiNu/4do=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <319927239042894689F85FE24912A9A8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9224
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB3PEPF0000885E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	88d2b150-09b2-4019-f092-08dd9eac53fe
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|82310400026|1800799024|376014|36860700013|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?L2VXZlFCU3BrRi9RekhORzExVjZObUJJT2lWZmRIZngwYUZvTDcwbG1NK2pL?=
 =?utf-8?B?L3MxZk93ZDRjQld5R1dIdlV2ODNRcjRldWJGQzlpTThLbloycG1OcVlvQkxD?=
 =?utf-8?B?M0xvalRmVHpPc3NyMklEVHRjMGI0ZEFxY0NmQzVUMnFJOUFuOTZvTVVURmRw?=
 =?utf-8?B?K2xkbEQyVktOeGxOTTRwNFZqQTRaVm9xMEVYRWV1VlllK0I1YTZhRW9mLzY5?=
 =?utf-8?B?UmNvVUluYU5jL3lLc1ZtYVpleU1CbTRhWmRMZHJSSndQZlVJejJLbjJuYXpi?=
 =?utf-8?B?Zk5rbUQ3eXJyWHIwNVZiYlRyN2dtRm5hbDMxeGJUM3hFdkR1Z2VySHZrY0RI?=
 =?utf-8?B?YVUyb3AyTzR6aFBLWUluS0Z2RUNGLzZwRTM1ZnBoaVM4N2M2M0ptdEU0amtP?=
 =?utf-8?B?YUxia3htTmMyNjl6YXZydFgyM0xTOEhoSW83MHVCU0FOdFVLUlZXYjY5MnRT?=
 =?utf-8?B?akovcTZMMTR1YUd5MW83bjJqV09NWk83RTBnTmoxZ010S3Q0QTZPQm1UNDNK?=
 =?utf-8?B?OVFGellPbU92eFYrenE3MnhXZ1M4REVORE5aS0xXOG51by84SVM0aGdKaUVP?=
 =?utf-8?B?WU9LNGpiaUthZU5vZ05ibVBGNHFPSkZJR0NVUEZwbmp4R2kvOW9CS1pGWnVU?=
 =?utf-8?B?bTFOMS8yUllVZ0tPVUtBZit3aGk2QnlTdWN4M3hieWpaY05lL1BOMTVkMGRr?=
 =?utf-8?B?ai9uVlA1R0hLM2xXTlI0UjJ5bVdSMm05NXVFRXJ2ZDFyN2VxRk15Z1M4WHNn?=
 =?utf-8?B?aWIxRGM1R0VTVG1hRU1VaHIzVmR0b1FRZklFNERhWUdhdVFSZUcxMTVSaU05?=
 =?utf-8?B?WCtoVzUzTTNvYW9tTnNwQlQ5ZTdzVHVCT1Y5V3NFSHhKallEbFpvUVBja1JF?=
 =?utf-8?B?dkJ0OWQ1cmJYMDVPZmRLM1FXd0VuQ3M4bkZtb1hwbUxsREtZajJwZmFmWVRY?=
 =?utf-8?B?dGptcjREbkJNcHhlL2lzcFRwNnJEdUpTbVVBTHVMeXlTdkVtSzlQTWR1RHh2?=
 =?utf-8?B?YzRNWDk4T1BMUFBnUzBnTW1GWXFFbG5xQUNObHcvK2ZzYVpFVmFzdlBsY0c4?=
 =?utf-8?B?QlJNWTEzZ0lPV1JzTjZuenJDTkpiZXU1Qmp6cGhXa0cwcUdsRzJINEVaK0RE?=
 =?utf-8?B?RklaRTczLzlOWmtieWVTWGtzYzVHZml1SXRjSENRWHRyQkdqZFNOYTNUR3la?=
 =?utf-8?B?NXRNcURsK2ZzemFqM2dvZnN4Mzk3MGwwK1FKT0ZQdmQyOU5HTTV6UGJic3A0?=
 =?utf-8?B?MUIzTWVjNndoWFVPNUZSRjlOSmg2bEQrajNZZ3hMZEpwcE4zSHkzZ3V0b29s?=
 =?utf-8?B?ZmxTNGJDZFZtdDBkVElvRWhxcXkrbGU1OVZVSUtPNFRpQUtuQTRTT2ZpTHds?=
 =?utf-8?B?L1J4dUh4d29FLzlYSXBOZXpNZlExbDJWVVpFWVR0VlpyaXR1UEYyUmRXUzFx?=
 =?utf-8?B?cWc1dktrdE9jVG5kRkpsWHpnN1diekdWbW5xZXJDbkxod3AxZlZ6ak1vN21I?=
 =?utf-8?B?Ylp1UHZDNVRqOVZ0RnU4dTF3TlRNQ2wzNzFuc2Zwa3hSWThXZ0tCS0MyUFBs?=
 =?utf-8?B?OEZ0T3NYLzFWdjBEd1F4dmE1cHNIVlNwa2FZMUQzYnRsbmZDMjl3NHNWRHZF?=
 =?utf-8?B?YzhkbkNIdDVHK3ZDYUczclJYZkdGZm5aNEdkTEVuNTBLVWZ0Q1hpUVdmamJQ?=
 =?utf-8?B?TWNPbjV1NFp5cS9EZHpwM2EydGFmRTZYamRRVnduSnIyVjBIRjdYSzB0M1dQ?=
 =?utf-8?B?b25yWGRKYVNwSWp0UGQ1SXV4ZFB1Zmc2UE5qeGFVVU9FbzMwcm56T1QyS3Fv?=
 =?utf-8?B?aXlCT04wOW14bVZyVFdnUDQzODhuVlFPaXlPd1NxUk9pcWZnSXVBbGF2V3J3?=
 =?utf-8?B?YTZXd1JxTUIvSkJpcFhTaVp6Sy9lOTB5VXJhSzA1Ulc0aWUvMkM3SkljN3Zk?=
 =?utf-8?B?UEdFamtCS2N6b3IvYld2c2g1WU5oeE1TSkhWOE5sNm4veXJSWUU2RlZpTUNZ?=
 =?utf-8?B?TjlxNFgyMmtIZlRIeFJobS9JQllWR1dKZUxSWU1aelBUZmtBODk1cm0rV3Zm?=
 =?utf-8?B?ZzY1QWhHSU5OQ2dCMm9WdHZ2UWFOcnhNckc1Zz09?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(1800799024)(376014)(36860700013)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 12:29:06.9310
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5740c77e-ac73-43a9-b66e-08dd9eac67d0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB3PEPF0000885E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6177
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 12:29:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217411

DQoNCj4gT24gMjcgTWF5IDIwMjUsIGF0IDA5OjI3LCBDaGVuIFFpIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxRaS5DaGVuPXdpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+IA0KPiBGcm9tOiBDaGVuIFFpIDxRaS5DaGVuQHdpbmRyaXZlci5jb20+DQo+IA0K
PiBMaWNlbnNlLVVwZGF0ZTogYWRkIEVVUEwtMS4yLg0KPiBTZWUgaHR0cHM6Ly9naXRodWIuY29t
L3V0aWwtbGludXgvdXRpbC1saW51eC9jb21taXQvNzRmMzI2NWI5YTA3OWY5ZjYwYWQ2ZTYwNmQ3
N2RlYWUwMDI5YTQzYQ0KPiANCj4gMDAwMS10ZXN0cy10cy1raWxsLWRlY29kZS1hdm9pZC11c2lu
Zy1zaGVsbC1idWlsdC1pbi1raWxsLnBhdGNoIGlzDQo+IGEgYmFja3BvcnRlZCBwYXRjaCB0byBm
aXgga2lsbC9kZWNvZGUgdGVzdCBjYXNlLg0KPiANCj4gMDAwMS1sc2ZkLW1rZmRzLWZvcmVpZ24t
c29ja2V0cy1za2lwLXdoZW4tbGFja2luZy1zb2NrX2RpLnBhdGNoIGlzDQo+IHVzZWQgdG8gZml4
IHRlc3RjYXNlIGZhaWx1cmUgb2YgbHNmZC9ta2Zkcy1mb3JlaWduLXNvY2tldHMuDQo+IA0KPiBU
aGUgc3UgdGVzdHMgKHN1L2Vudmlyb24gZm9yIG5vdykgYXJlIHJlbW92ZWQgd2hlbiAncGFtJyBp
cyBub3QgaW4NCj4gUEFDS0FHRUNPTkZJRy4gVGhpcyBpcyBiZWNhdXNlIHN1IGlzIG5vdCBlbmFi
bGVkIGluIHN1Y2ggY2FzZS4NCj4gDQo+IGxzZmQvb3B0aW9uLWluZXQgaXMgcmVtb3ZlZCBvdXQg
b2YgdGhlIGV4Y2x1ZGVkIGxpc3QgYmVjYXVzZSB1cHN0cmVhbQ0KPiBoYXMgZml4ZWQgdGhlIGlz
c3VlOg0KPiBodHRwczovL2dpdGh1Yi5jb20vdXRpbC1saW51eC91dGlsLWxpbnV4L2NvbW1pdC9l
YWEzODcwODgwYWFhOGQzZDZiMWFhOGVhNmJiMTlhNzE3NzA4YjhlDQoNCldoZW4gdGhlIHRlc3Rz
IGFyZSBydW4gd2l0aCBjb3JlLWltYWdlLXB0ZXN0LXV0aWwtbGludXggKHdoaWNoIGlzIGhvdyB0
aGUgQUIgd2lsbCBydW4gdGhlbSkgdGhleSBmYWlsIGJlY2F1c2UgdGhlIHRlc3RzIHdhbnQgdG8g
d3JpdGUgc2V2ZXJhbCBodW5kcmVkIG1lZ3Mgb2YgbG9ncy4gIEnigJlsbCBzZW5kIGEgZm9sbG93
LXVwIHBhdGNoLg0KDQpSb3Nz

