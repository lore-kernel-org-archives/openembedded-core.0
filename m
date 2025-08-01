Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C74A7C87FCA
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:41:15 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.15])
 by mx.groups.io with SMTP id smtpd.web10.89664.1754059267196187799
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:41:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=SYwspb0p;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=SYwspb0p;
 spf=pass (domain: arm.com, ip: 40.107.130.15, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=S0ncD8zZDYAhvgFHug3V615sHNhvmiER07M+bKnVQdL3vKb4b/8HbGuYEWbmmgxhQMiAdk8dBQIMC9pMRDKsiECcnyA82YjB6Pyy1Sn0zoHHQ4EPA9U0UUb5rz4wmlKZMg2UeCY2a1ddWJdNWkFjK3bn3Js8Yif7b3WFEuubE+mgjTtcjgLThvp38NcWyKAD2EQRdVedvVvK/+ZRwQN2G8VljBmmGKhpUtUUWjpKXQCB9bGBFbRhkNfTotfqwyT9ZNuZMj8Eqhs3lB0DPE17RO/xYQ7udFyQzAvl+OqK9cluEGkkjjsrPBBqJuSOQIIpALbo0EONc6f3hUeGNimYUg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGHWqGn8LqE7AvncZ71Yq5qC4f5C5Q1uU4NBnYPkpZA=;
 b=neCfyStQIiYzu2K6ckwQep/ih6mz9Cp8M/UM5lfRYQ03za0zKIJkOWNauOgTazYmOAg0SlBKrzQ95jseWuD7T+oXGL90mJ57kGMyNnSd0ZayjnohiX5P1PoDSLfjXpGclRWC1zkPZFSimfUiBMO4QK7MeS7BANvgxxwBUpNGAW7Sxw0r1EZNnxTCUCWReukME//Gf0bOXjhS3cxJseTsqe7Rx6DRuze1+wOkp+ht3C/SA1HPFEXIqPthAZ+r2ypYHjg8AWwHpBhhk7ls9AJsW7jfu+v+pIsTaRqhkBoLLTKVzLUyJ7P3UAFJfbEMQEgTB56Fw0q9MBxQtBq9jL+5cg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGHWqGn8LqE7AvncZ71Yq5qC4f5C5Q1uU4NBnYPkpZA=;
 b=SYwspb0pD6jkQTt+omOTUgtviP6NNJrbxShvepQt22nj9PEyikPijM51LL4nAmCdtUuvtYwu+yQv3RPq9xqWOLXPJSq9rSH96MYm7f2TdXRMPMaCI37CmssWdffarCEQJ/4y4AFA9pr8wsd/Dp/YuXp98/iy0uK+7MdyF83aOfg=
Received: from DUZPR01CA0042.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::9) by DU5PR08MB10801.eurprd08.prod.outlook.com
 (2603:10a6:10:526::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Fri, 1 Aug
 2025 14:41:04 +0000
Received: from DB5PEPF00014B89.eurprd02.prod.outlook.com
 (2603:10a6:10:468:cafe::8d) by DUZPR01CA0042.outlook.office365.com
 (2603:10a6:10:468::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.16 via Frontend Transport; Fri,
 1 Aug 2025 14:41:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B89.mail.protection.outlook.com (10.167.8.197) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.8
 via Frontend Transport; Fri, 1 Aug 2025 14:41:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aBMElJu2kBEAd/dMmUndswZL06jKOHWlNKail9AAKk6lNbrFGHwoc70m8GaNGHYY4Jkjym1h/7RJtAF6mBOsoBG4f+xuGInGcNs5jz6dkZsrhSgFpDtGQnUBiNqV78VhWooZJsV9obURCGa0uXx4bNkCTuvsc0r0r1xiGR/NnY13xsGwad56bEu6j/JrK2v/lOGA8rNg7kzUNpaghCsHamiAvGDBn7VguQORmXPiBezVLLbUmaKhkxB4+FTe79fAHCBqG3spz9edqiGorL1/Kdefdwlkd6y+V4rclORgVSoXcSX19lqbKbHsnAYVWlnzWcjECYrGozFwHjj4/kgI+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGHWqGn8LqE7AvncZ71Yq5qC4f5C5Q1uU4NBnYPkpZA=;
 b=wbCTfbJYZ9TIZwGYNTPH86E4YeQN0DWoaz4W2WzAkzlSXCnCgGaLg8cL9FXqeMiOE52dNLUsrsjMuCDklC4Y34wCyoMjqy+AQuVQLM8q2IKq47PQe9nzeDIU4hEZs2JDz0ZRj7yQ4mUg88hGXk/WzOenJAVpWoJzjmfrceMFumMEs1lnn5ncSFS/wt5Wy+xRJS4gtpWMjlZgMJpIG6PYcW3+FR4W8r42EOHC7rTBPhUtJTxAF2Z1GxaFQbuBybyEdTovN3jJ6zsTKuJ8IwZx2BU3UtXyvkzaJTwoLniuIfUUltTogjLFy1UlUbbK/4gzSJkZ9Dh0VWPGJYcByIbhJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGHWqGn8LqE7AvncZ71Yq5qC4f5C5Q1uU4NBnYPkpZA=;
 b=SYwspb0pD6jkQTt+omOTUgtviP6NNJrbxShvepQt22nj9PEyikPijM51LL4nAmCdtUuvtYwu+yQv3RPq9xqWOLXPJSq9rSH96MYm7f2TdXRMPMaCI37CmssWdffarCEQJ/4y4AFA9pr8wsd/Dp/YuXp98/iy0uK+7MdyF83aOfg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB5PR08MB10215.eurprd08.prod.outlook.com (2603:10a6:10:48b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 1 Aug
 2025 14:40:31 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8989.015; Fri, 1 Aug 2025
 14:40:30 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] libclc: Fix absolute symlinks in sysroot
Thread-Topic: [OE-core] [PATCH 1/2] libclc: Fix absolute symlinks in sysroot
Thread-Index: AQHcAQvJJQja9yZOAUK1JRqvwQm4n7RN4Y+AgAAAwgA=
Date: Fri, 1 Aug 2025 14:40:30 +0000
Message-ID: <B7693480-3AFD-484C-9AA1-D1866646736D@arm.com>
References: <20250730043809.1486481-1-raj.khem@gmail.com>
 <0B0BA0A1-CC33-43C9-ADE5-41CA6878621C@arm.com>
In-Reply-To: <0B0BA0A1-CC33-43C9-ADE5-41CA6878621C@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB5PR08MB10215:EE_|DB5PEPF00014B89:EE_|DU5PR08MB10801:EE_
X-MS-Office365-Filtering-Correlation-Id: d133ad6b-8bb7-416c-7e7f-08ddd10970db
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Vzh1K1Q1WnVVd2ZnWmlRaDRRTHlCT1VTWGxWa0JMNElXVE81Sjh0M0g5L0tS?=
 =?utf-8?B?cjRlc1RSYlhEaTRYQWVwMUg4cytUa1JuMnlhd3ZTa3RGZ3UxbklUOFhwZlFi?=
 =?utf-8?B?STRUSTVtSFlKWUNsYmdsb0tTZjJvamJwNi9UOENwOHFBWHZKVlB0bFpzQ1I3?=
 =?utf-8?B?UEpyMzB4YjJ5TDZYa0hyTnA5Q2tqb0YrZVR2Q0ZoejI3RWxsYkRPSitETlJU?=
 =?utf-8?B?bnlHL3d0NUwydVRqRE9UeCtIU3Z3Q3E0Q2M0ZXRDYnlHWERlWkFsb3pzYVJB?=
 =?utf-8?B?Wm1aUEZ1Z29GQXU2b1FzbFVpOTFFNWp0UXRBZ2ZDY2xHUHFWNXJyUW1rZjRZ?=
 =?utf-8?B?MmVGRzIwc2JYaVdWRmJZS0RaZzdCVHRmZWdPQWpQRWUxV3FVTnhGdmphdDBu?=
 =?utf-8?B?Uy9TQitPZjFXSC9jVTY2RUlKL1VUZXU4UnJVMFNTU0V5UVU2cHpmQTdsTkhN?=
 =?utf-8?B?L3BDQ096bTFUWHpjVVhpQ3ZnN1ROdktWOU0xTlNRU0VnTVk3ZUV3U0tISmpu?=
 =?utf-8?B?UnlyZlBMeVdQSHJObHdFTG1iK2xsU2tLUmRSS0dKOUpNVm5rWFQ0U0l4bUlM?=
 =?utf-8?B?MTQrV1crYU5UbCs4MDJOZlZ1b205Yk83TmFYREx1alg3VEdDcVQ1bnNrK21y?=
 =?utf-8?B?QmNoeHM4V0pCZU1zSXBTQi9VUUVla2VCZEsyY2dad1IvYlhoaUVwd0Z3VURR?=
 =?utf-8?B?eU1NMHM1a1BTMVB2azFsdzJ2dlJhUStEUEhTcWJBcUwxMDk3K283bkdrdlBy?=
 =?utf-8?B?RTA2cUZBRldqakJpenN4Skx0ZVMxcFc2TGptdnBvR0lrcFMyNGlmYTBVQ1ly?=
 =?utf-8?B?SUZIVGRnUTBERFpHdTY0V1V5dmd0OWl5UjdrVGtXT3JhWEdUVmhxd0YwTW9Q?=
 =?utf-8?B?SjY4UW5sZXJPOWdyTGNtdWE5a2VjQ2VPL0xiRUpkTEt6a25ZMjBpd1d4VE5L?=
 =?utf-8?B?TnVxTzd0M1ZiWmhHajZwMmpQcmttd08rUDd1TjVTejlVcllMTjNFemROVDRF?=
 =?utf-8?B?WnAxa3NTelJkV3RKcFErQXkwRDcyVmdRY0pCSnNoM2xzeDZBd2t5V3FyR3Qy?=
 =?utf-8?B?UG5JK3J2aGJwclppeG5KR1BoK0M1WlF3TytVV2VHUEF1Rm9Ma3JjTXdXOWow?=
 =?utf-8?B?eEFYOGI3eHhJOXJBY1NHSnpPaldZNVhWVCt3NlJ5WUxvS04xNHdVSVVNcWdP?=
 =?utf-8?B?dWk0M1lzQjd0dStYNCtWWjdteXZNUzBacHhnMXViOEYxOEJNTy9vSkp3amVr?=
 =?utf-8?B?SmRTQjNZblFpYXZNZEd5RUY3b2FsdzhEa3BCUEYrVm5FMU9QTVdlLzd0a3NB?=
 =?utf-8?B?R0pSTGJkSHJZK1ZVeEpaakgrN2srczVaTnNWV2JQZEErd3JqSTBUNk5RYklx?=
 =?utf-8?B?MzNnUGF0cXl4WHYvamovbk4wVFdGZDJXWTg5Y0h3bXdJaE5RMEE2TmtFMWhM?=
 =?utf-8?B?MWkxN3lFZ1VFMHNWcGNycU54WldDR3FvaUZ0MGpJay9VQWdnRi9FbG1rUEkx?=
 =?utf-8?B?Q1dYS240YmZ5Z0RQYThlSkN1bnBHOUk2aVl3YzlEZlpCR1Njc24zRnJDbGc1?=
 =?utf-8?B?OHA3STlUazlZVWpBL2ZKZStyZHpwMXllbjFHRTdkclJXMUc4QlV5bUg3SGYr?=
 =?utf-8?B?TkF3OHVLbDlsV3F6cHcySFpvUnBPdnROb3d4YmVXMUtYNlBqRDh1L2hWWTVn?=
 =?utf-8?B?SWZsck5BMm1adXRyM3NZRVNLRDdhT212SWpqazFwQzFIS2FSOE4yTFRab1VU?=
 =?utf-8?B?a1JyN1FwY3B3Nlh6T0pLc29wUVlCbnBSVE16VTgrL2N5bFc4cFZvbU9lVXhD?=
 =?utf-8?B?MmhpTTRRL3VTTEMxN2hZK0l4czg4cGNqZE0ycXNxcVR3bWlNRUlpT2lDWnk3?=
 =?utf-8?B?UTRTQzZCUG9MK0plTmxDQWxTUkRDd1ZtTmhlTllWTnErcjkwNlEyOXVheTI4?=
 =?utf-8?B?WU8xdy9NZWZTUWpBN01qR1BFUHpRVmRkNTBDZzhDSVpkcEIrNVJ1dXRWZ0I5?=
 =?utf-8?B?S3dhMFJGdnlBPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <211A510B6219FE42916D2A3974EF3E94@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10215
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0aaab504-3591-4194-b791-08ddd1095d74
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|35042699022|376014|14060799003|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bUFxMkF5Y2JwNERsVU15MmZKWXM3NUtOMTlGeHo5dmNHTUpOclUyZWlCSFpY?=
 =?utf-8?B?TGhERU4yTHlSVzlMTjZPOE1iTmxuTlh2Rnh4UlN0OXdOOFhGR0drQjRwMGN1?=
 =?utf-8?B?REMvN21FZHhsT0pmYklOTFpYblFqWFozTmhFWXlmU2JPZTc3NEVoWXprUG41?=
 =?utf-8?B?NG53ZjBEaXZrbUVpN0xpMDNIRzdtUk02REJadlhLQ1gyamVlaUpYUGphQVo2?=
 =?utf-8?B?Z1RmdjZEMlFsSUtVM3AzNENndU8zaUlvUEZZNHpKYUd1cTNVTWJkc21Ibm1K?=
 =?utf-8?B?ZlZxK0NSMUlnWTArSXVTclg5WExTRHZnU0ZuUWEyNlZEV2FoRFAxUElqR0Jr?=
 =?utf-8?B?OEQrMENMNzFHQzZVaENMY0pnSzk1VE90RUZQTDAwNkpYQUhYelpPS1kwZnFn?=
 =?utf-8?B?b0wwQkhWc2tYRXd1dlByZi9XeVUyWllpek9LVTRLTnF1eW1ZMUIvSHEwa0lu?=
 =?utf-8?B?a0ZyQ2hoS2xMd3ZyQUp1aHRwNXVzVUtxUHlzMGd4Q20zYzV0MVB3Sko3amRj?=
 =?utf-8?B?eDhaQW1BWWIrVU9tVkhCcXdHdlV4b0hSaUw4d243ZkZFU2pFNnkycG9kQUd6?=
 =?utf-8?B?THQrTVVPNnB6TW40Z2NOekFPY2t0dEQrVUhLaEtGSkJWTU9WRHV4NWNOQ21p?=
 =?utf-8?B?U3hnTmxyWDlpd3QzWkxkM2NIMW9LUklqWVByaW5QMW9sVVR1Ykh4aFlsVzd5?=
 =?utf-8?B?U01kMjFvY1RTSFZhcGh0SHA4bVVxLzA0cVFWSndaRitOY1JCNkdUT20zWTNs?=
 =?utf-8?B?WXdObUxKZy8zQks2a0JEeGlHaWdUamtIRDN5cmZpV3pRRmd2Nm9IcjRBaEVs?=
 =?utf-8?B?aElzZlE1VmFac0pXa0l2YTNMNCtGM2xlREl6eUNvNU9PMzkvUzJ1K3lDSkpm?=
 =?utf-8?B?eFEvVG94eS9iQzYwU2xXOEZOZk4yMXZmUFpacjlmTmtsV2JRR1ZWTTlBN3FZ?=
 =?utf-8?B?MnBXVlJYQVdzejhRWlFrUE8xUk9kOHgrRWsyZmFCMTJRaGFoZWo0cTZuTTUx?=
 =?utf-8?B?N0p2UGM5ejFibUJGS1FqUFRRN2hraGZtTlp0MENRS2RUUXlNKys3ZytiNkc3?=
 =?utf-8?B?b2FmQ0Jua3NZbklBR0RmbXpxY2dRVTJuL0V0Q2xhZEtobHVXZkMxTW9iY2xx?=
 =?utf-8?B?Y3RSVmFKcGFUZWFUbDJZQjN6SUMzaVJmcFVRVDZVTTB6VjA3bS9qRllpa1ZV?=
 =?utf-8?B?dTRLSnRTQU1nRGwxUlppNTNqalhtdVEvNisvZDJkaVlXY2VYTlhMOUZsT01D?=
 =?utf-8?B?SWVRS2ZiMWZBMzA1ankySmhERzFEUEl2ME55VVFUWXZqWUV2dzhaQkpZbmEz?=
 =?utf-8?B?M0V3WDBhcVV1ZGtuWGdDdkhkT3RVWW5XOGVkaWVVbnFzam5GTG15TVJodTd6?=
 =?utf-8?B?T0hMbXA4V09QS0JFQ3dabjZVRlAxRTA5UjRVNmt5NGtBT2RVYlUvTnBnNE1C?=
 =?utf-8?B?WU5TSFBGeHJ5a2kyVEwzMFpDb1JsbURaelArMG1ST0M2WEdpZGIzS2ZiTFkz?=
 =?utf-8?B?UUt4SW4zY1l3djNMbSsrQmVuajJRV202M0dBekhDRGhNVTNpVTJNQTg3ZVN5?=
 =?utf-8?B?cjZZbDVSNXpNWm5DdzN2NHlDWFdRVEFHVWF1NzA1YzFEc1l2NEhRbUlpbXE1?=
 =?utf-8?B?RUZtKzFDczRJejFhejRVa3k3RVJ6UE9zNVVNL0VONU1MQUs4RktyOFNyYy9M?=
 =?utf-8?B?aEU0aHk3dlhnS3RxUEhWa2lVcStJRGVKQlVWNGRmemRqWWp6UVh5TmtML1di?=
 =?utf-8?B?Z3IrY28wa2xsY0krdDNEKzZMNE90OXZ6R0pzV2Y5WWRRN3ZwU1JIbWMxVDZk?=
 =?utf-8?B?emFTR2pHa2NoNm0vUUhsR1k3cnkyQllNa1pPMlVIc1RSNE9TRUFIanUwY2xJ?=
 =?utf-8?B?RWRlemxzaGVHWE5CS2FzdmVPR0Y0WlJDem5oTnVBdUY3R3BBaWc1NXh3UEZB?=
 =?utf-8?B?T3pkTXp2UEs1QWhCbnEyNyswS2s3aVFWd1B3dURqYnAreklJeUtGdUMwbTN0?=
 =?utf-8?B?NEFldFpGai9WRER4c01ONjZRVXNMd2ZORlplYmx1RTFEMEZQOTNkdnFQVkRL?=
 =?utf-8?Q?K/0tId?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(35042699022)(376014)(14060799003)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 14:41:03.4367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d133ad6b-8bb7-416c-7e7f-08ddd10970db
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10801
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:41:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221360

T24gMSBBdWcgMjAyNSwgYXQgMTU6MzcsIFJvc3MgQnVydG9uIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxyb3NzLmJ1cnRvbj1hcm0uY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3Rl
Og0KPiANCj4gT24gMzAgSnVsIDIwMjUsIGF0IDA1OjM4LCBLaGVtIFJhaiB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPj4gDQo+PiBUaGlzIGhlbHBzIGluIGNyZWF0aW5nIHJlbGF0aXZlIHN5bWxpbmtz
DQo+PiANCj4+IEZpeGVzIHNzdGF0ZSBlcnJvcnMgZS5nLg0KPj4gRVJST1I6IHNzdGF0ZSBmb3Vu
ZCBhbiBhYnNvbHV0ZSBwYXRoIHN5bWxpbmsgL2hvbWUva2hlbS95b2UvYnVpbGQvdG1wL3dvcmsv
YWFyY2g2NC1saW51eC9saWJjbGMtbmF0aXZlLzIxLjEuMC9zeXNyb290LWRlc3RkaXIvaG9tZS9r
aGVtL3lvZS9idWlsZC90bXAvd29yay9hYXJjaDY0LWxpbnV4L2xpYmNsYy1uYXRpdmUvMjEuMS4w
L3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3Ivc2hhcmUvY2xjL2dmeDkwYy1hbWRnY24tbWVzYS1t
ZXNhM2QuYmMgcG9pbnRpbmcgYXQgL2hvbWUva2hlbS95b2UvYnVpbGQvdG1wL3dvcmsvYWFyY2g2
NC1saW51eC9saWJjbGMtbmF0aXZlLzIxLjEuMC9idWlsZC90YWhpdGktYW1kZ2NuLW1lc2EtbWVz
YTNkLmJjLiBQbGVhc2UgcmVwbGFjZSB0aGlzIHdpdGggYSByZWxhdGl2ZSBsaW5rLg0KPiANCj4g
VGhpcyBzZWVtcyB1bmV4cGVjdGVkLg0KDQpPaCwgaXTigJlzIGJlY2F1c2UgeW914oCZcmUgdGVz
dGluZyBhIG5ldyBsbHZtLg0KDQpCYWNrcG9ydCBhYmU5M2Q5ZDdlODkxYTJhNjU5NmRkYjBjNjMy
NDI4MDEzN2M4OWRjLg0KDQpSb3Nz

