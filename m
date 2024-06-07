Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 525ACC27C5F
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 13:34:10 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.63])
 by mx.groups.io with SMTP id smtpd.web11.42117.1717767238231152186
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jun 2024 06:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Z3iQVq15;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Z3iQVq15;
 spf=pass (domain: arm.com, ip: 40.107.105.63, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=I4/cAIhSQlijlsqbTlh3ucLXwYk4CfneLisD13rsfJQCrPeGRaEPja85wlQAcd5zX10y0I3uSkCfx0wR0eX6gvyXy3/S+7S57lI3h31UGNdzIV4kQM8RNYBCiESUNC2RovV/270WKuSETJbDQr23dYbM2dfFeQp3wJADQ3KSkkLt6r10uSQfSi3/SP7Q6oT/XA9WRtJ/HWyNUB0ol5SFNUmHHfvn8+P3tIU58W9ikNy1OZ91g7YHTJZPXqueQH5wZ6mY5V38swUT+TdmsXuJUR0qP0p3FS2OJ+XepoDH8tvSQp1KdhySoVjxslTfssmGVihq7XrFHmJ1kE3yEXdX2g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0CsAhCnEIAEDUCgKCHf4yx7rtWUZ8C2YxEwOKBPEH6E=;
 b=iVGLyY9YIuxor+sWbBcQrXwgEJs/a2aMrPLYAXPEqF+3kBTswdFEiEnW5FLmTX8vfKI2rvgwmk5VlVYXrr+MndGhUqbPVjw+nJQCBoMrxG6cqYszik0+CXCqiI2fcw7yaa3FYp8E030vek31ULgJMaIuLyS0OKNBQ+P567I/R1LJYzIZqQPgBdki2EQKgTOSzBV02Jv17Cq07I2h1VwSZ9cPS0MqlGkkwncJf2xyLa/o/rRjJvE2YHXYAmT5OUOEImDCtEuKU0DMLd3ArrrRx/ig25jLGdqpil6zesvotmsLfVZGHPG4jMHotYXefRHgwnSIIY7DrOOtrB0bc+IEOw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0CsAhCnEIAEDUCgKCHf4yx7rtWUZ8C2YxEwOKBPEH6E=;
 b=Z3iQVq15su+JpZ3+0mjrXvbRUnibxkjFJQ+BloDRrV3t7wa/aUezfrNiroJMNxu8mfxKwb1jzm41LGZPGtwCvKX/ziha5bAtn4oY0gRc20fTNJOPxtH2iUpVpLUBqLVtip4JcSsNAbLuJXPN/tizhggs+/tPvkGK6RR+hqaPGxI=
Received: from DUZPR01CA0117.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::23) by GV1PR08MB8642.eurprd08.prod.outlook.com
 (2603:10a6:150:83::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Fri, 7 Jun
 2024 13:33:53 +0000
Received: from DB5PEPF00014B9F.eurprd02.prod.outlook.com
 (2603:10a6:10:4bc:cafe::da) by DUZPR01CA0117.outlook.office365.com
 (2603:10a6:10:4bc::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.21 via Frontend
 Transport; Fri, 7 Jun 2024 13:33:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B9F.mail.protection.outlook.com (10.167.8.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7633.15
 via Frontend Transport; Fri, 7 Jun 2024 13:33:52 +0000
Received: ("Tessian outbound c84bb8d91bae:v330"); Fri, 07 Jun 2024 13:33:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2ca3a3160f7b8016
X-CR-MTA-TID: 64aa7808
Received: from 8956e7d70fe6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 45AF9586-FD73-493A-A9B8-5921BDD649F9.1;
	Fri, 07 Jun 2024 13:33:45 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8956e7d70fe6.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 07 Jun 2024 13:33:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VhYjiTuCtJlLqNoRMrAizfwn8GKO7MxUdbw4VgEsPAbWvtGX8RT+ipYAjVPXuMOOfqiRDUPezpfNFuVdpJxHZP3ecgYmB2TKZJYy69vTb1+j8uPk59A3rCDzEwEKPa2Mb+RElgZQN4REU9/Ls/ZlrP3X7pFNq5mzGey3/79pVMJNgM9C+tuBs+3oWPNlm6S59YRFYRZjPqS2FSFGbrryfzXhqvNE3lCKvvmgW0grx5nb8+BoCA/44/Hz1EwMsNKkJL9oOaX4mI3tQJdth264tC47zVj5ykjxChoznZMkMHmB/sZFqqZu5zGPYN6hbPGffo7TLC29BfxOPG2gkk1qQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0CsAhCnEIAEDUCgKCHf4yx7rtWUZ8C2YxEwOKBPEH6E=;
 b=nfP1BYoJcuLB7hI0HuSNnQbzzIgK2/IDx+MpfOagWaIN5+r666BMGvDToxoNxbHpioDvEMPRpaS+9ytG304Y3Gt8Ew/44uR5NZ7kUn/5+q0Nga3o/hOrUUi6MEBA0IsP0ErPcqt5ePHAUUvHB4cvZvRiDokRmrgHg4NbJesY//YRdOCkniNxbk3UWtwGWNDvZGEt05mZLf7UeCg/ip4pO7HhzwnBzNbxCGkIAeYpK40m05kZFIVtGsCMfS1seD5AtBSlzO5cu8jIZzf/OllcphtCB3tuibJprYdbKfCARq4117MR1z3FRRzj4RH5IVj9W0sPYdcLhvr/6kBwBWIFKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0CsAhCnEIAEDUCgKCHf4yx7rtWUZ8C2YxEwOKBPEH6E=;
 b=Z3iQVq15su+JpZ3+0mjrXvbRUnibxkjFJQ+BloDRrV3t7wa/aUezfrNiroJMNxu8mfxKwb1jzm41LGZPGtwCvKX/ziha5bAtn4oY0gRc20fTNJOPxtH2iUpVpLUBqLVtip4JcSsNAbLuJXPN/tizhggs+/tPvkGK6RR+hqaPGxI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by VI0PR08MB10682.eurprd08.prod.outlook.com (2603:10a6:800:205::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Fri, 7 Jun
 2024 13:33:43 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7633.021; Fri, 7 Jun 2024
 13:33:43 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: ChenQi <Qi.Chen@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH 1/2] coreutils: split out coreutils-getlimits
Thread-Topic: [OE-core][PATCH 1/2] coreutils: split out coreutils-getlimits
Thread-Index: AQHauAv2qjuTSjwIe0yTdY4KAjFfgLG8TnwA
Date: Fri, 7 Jun 2024 13:33:43 +0000
Message-ID: <F1C4FA48-6A4A-4471-8AE2-1C1E3AC20A97@arm.com>
References: <20240606122013.145187-1-Qi.Chen@windriver.com>
In-Reply-To: <20240606122013.145187-1-Qi.Chen@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|VI0PR08MB10682:EE_|DB5PEPF00014B9F:EE_|GV1PR08MB8642:EE_
X-MS-Office365-Filtering-Correlation-Id: 43c3b257-039b-40f2-7949-08dc86f678a0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?a0Jaa1QveUprWU1ySUM2M3BJNlVGNnR1bWpBVWVEMzcwWWpiL2N4WGRRQU1J?=
 =?utf-8?B?Q1Y0U0xGR0lMMUpBS0NrSStMODIrNWE1UXJSZ3pUbWRGaHdLcElCeXRLV0dT?=
 =?utf-8?B?M1hjTjNqejV0RnR5Znk5blZlOUFsVzd2ZlhISGlXS0NXbDFBOEJTaXBYbHdO?=
 =?utf-8?B?aFNVMmhiTzNVcUIwWVJCaUdaWi9zZ0kyWkhZS3dyYjA2ZHY5N0pha2c0eldt?=
 =?utf-8?B?Q2lteHVpeGMwQkdKNlJhL2wyL3VGWjZmTnZURW9hdDVwWkE3N3RLUDJCVnRj?=
 =?utf-8?B?T0xCZFRQejlIamNQMzVsaXpNRnFFK21HZUs1dW5wS0xQSEFHdHVERFU4cE9G?=
 =?utf-8?B?ajlNYkx0UEJzcDUvRjF1Qngrai9VRHlybWU0U3lXTjZvRkNmTzlwQ3JmOTVp?=
 =?utf-8?B?cHZuYksvQUZsdTBvd0ltU0xqVGx2N3RMczFYZWt6QU9ZTGtSdVVOVm1wWito?=
 =?utf-8?B?VjU0c2w5cS9FU0JBb1RTaGk0eUppallpS29oMllMVk82WlNNVlRSR3l0aXdY?=
 =?utf-8?B?Z2tlR2U1ZWxqZE1wc0pBblI1T09iZytibWpKY1dOV2UvcW9ybkRjZnc4ZHJh?=
 =?utf-8?B?RXl6Y0lSOE9oWVNBVzdXdjhBYUhjZmhRdTIyU1NIQTdTT3puTjdsb1hsaGVu?=
 =?utf-8?B?YlRYMTBUMlZ4TzROR0Z1ZjZyQnNWZ2c4anJ0YlQ5MzVvSkpmQmxNSEFCZ3d4?=
 =?utf-8?B?dGJDcWR1K1JEZ2VQcXlEaCsyeUZQdmxTSGJTQTI0ZzJwT1FYUzh5OW9mRmw1?=
 =?utf-8?B?VHB1V3JrTDZjTCtBQ09iWUxTK2d0aGpiWXlTZ0lqRUpQTGZkNjE4eU1XWWlH?=
 =?utf-8?B?eTNlUUVpamNpN0JVdDNUYS9SZ1BBekRYRmo3eGZaOUJLYVpwL2h4RVpBZ1BP?=
 =?utf-8?B?ZDBlZ1d2OERqM1hqK2lEaHZLMm5VbW5PN3Y0a2p3WG5HZjVnTkxnR0QwakVI?=
 =?utf-8?B?d3NTTFNJdTdZQlFYUXhmS1VrU0ZUUzhJczd0cVREUEsxdlFBZEUyNmhRNHFs?=
 =?utf-8?B?Zy9hSlFYZHNuWGZuQ3FuSmo0cHozbkZyNTV6RUMwUmY3eURibzZBVHp6ZWo3?=
 =?utf-8?B?NnVPUktjaHNRR0hUYlJERXZKaEprTnJReFdsTlA2RTE1MzhVWGpxQS9QZTBR?=
 =?utf-8?B?MXJ0KzJ4OStzUjE0SVZ1RFdnMng2eFludzYxejBaNkRzRktGTEprZHUrZCtP?=
 =?utf-8?B?S2o1M1ExNkFUb0p1VkdIMU1XVzh0ckQ4aGNacXVYcnVCYjhsNkVlbmVSRHlZ?=
 =?utf-8?B?a1RYcFRnRWlFZXA1T0RjWDdIMmVHUk9tQ1Y1N3FXeG8wUlRzeTB1aDkvVDNj?=
 =?utf-8?B?cjVHK05lQVZ2OXRiSFJTd2RLa3luWEh4T0JIKzByZitkYXVjNHhlR3lLdVZh?=
 =?utf-8?B?a0Z0N3hPejZhV1FHWUxsWmQzcG1PMVZ6ZXVQNy95RVR4OU85TWhyVHNzQlJw?=
 =?utf-8?B?Nmc2aHdWc1ZqQnFMQ1JWNjhyVDNaUHl6Q3NXWUdQVlZKZGRKY3R0VmNPMmpw?=
 =?utf-8?B?cnV2VWxCeENQWkkrRHZhUEhmbFh0NXVUSWd5ZnkzZkxvM0tDbHdtbUMwT2hU?=
 =?utf-8?B?ek1RQVdLOE9aYXRycEl4aXRXRmhNNFhHcE9jdTN6YjJxdVR0S0Q1aEw4dDVm?=
 =?utf-8?B?MGJ5R2w3T2hXZ1N1RXR1WmNlOWI5TDRHNlRmT2hDS0JqZmUzUjd1ZStCSFBO?=
 =?utf-8?B?OWpFbHg1UHlDUnB1WWg4djBNMThHbXk5OFE3MG03OXpYU2prZ2M3K1dWV1l0?=
 =?utf-8?B?cDV3MXFnVjlPVldtYVhSV29DVjE4UnlDZ3FnUmNxUjZYOXNRRFBjVWRxUDVG?=
 =?utf-8?Q?huEQGuuv0QtLouZT2IVrDgli/Wc2pzys7S7Mo=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4FB0F386083B7E4BAB64D0EBF13241C3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10682
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a640481d-a563-4790-cab2-08dc86f67321
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|36860700004|376005|82310400017|35042699013|1800799015;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V3VJbmlBcytIeDNUbUI1VVpmYVhGWlhQaFp0bzVPbko4eGEzNU1JMk10MFJG?=
 =?utf-8?B?Y3oyc0lldW1NbHpQK2Y1K1JnVDdnQTNIVkV6QStyaENsbkpQdWF4UVNlelRx?=
 =?utf-8?B?dUhkL1ljVXJkYUZzcHNnanV5OWhsMVE0RHh1SlphcmF5M2cxcE1IRytGM3d6?=
 =?utf-8?B?V05nM1p5WEdDYWJ5T3k2eVhSRkF4aDBxOVU5aFBKeGFwR0xqQmpKUERJUzFt?=
 =?utf-8?B?Tm1YUGhUSE44aTQvWjlHdHliQW91Sm1UcTF0RnRDR3ZxY3FrTVBURTQ4WFVY?=
 =?utf-8?B?U240dytHa2tsQmo2bTZ5OU03MExqOUVZRml4TDhtczBSa2RQclI1U1Y3ZTJB?=
 =?utf-8?B?SkRyMnFIbGF6MXdROGRDL2VyVjJjeVpGTTgwcUhsZWFZc2FtUHhTVTdZOS9y?=
 =?utf-8?B?SGo2WkoxSEdscS90cUdxd2NXT1F0VU5LUUFVL29hTGJnTi9HNEMyVG8zOEJC?=
 =?utf-8?B?Q25xai9VWXN5TU1XSXFabEw5N1BKby9mT0s1S0tFazV2amNLVmFUZVMzbS9j?=
 =?utf-8?B?dGNvZEdtNkdRQmoxZGZDNmZjem93MVAwS0VmWDV0U0tDdzZEeGhPdXVwalAz?=
 =?utf-8?B?RmtsNXRPSWk4My9vcFBFS2gvQWJIczZDemYrb1p3cHYxM0FDWHd5bnM1WlZa?=
 =?utf-8?B?ZlF2OXZmTUp3YWxEeGVaOGVhTU4vWDRVNGhqNEVRMHY4Z09WUnUrTy9BY01J?=
 =?utf-8?B?SUtNa0RQeTJJZnE2Rm43S0Iwb0hBNEM0aTJBUjJteHpaOXdZVnNYaEhBMk5C?=
 =?utf-8?B?U0o3N2ZXaWZSVVVGbWpYU1hnaUN4Y0pjamFnRkRZKzZ5ckFYLzFUQldHNFZp?=
 =?utf-8?B?aDhFUGVqNHRDajZQQTgyZGNZVWZ1STVYNEtmQ0JxSzJ4YllJUzc1S2ovTG00?=
 =?utf-8?B?c2Q1byt1Wng3ejJrV0lac0xUcm9Ea043RGZ0cXVxOFdWSFJsZlhsRlRVWkdx?=
 =?utf-8?B?bmRyQnFoWkRnaERyNThmVWp6WEFmbW9wdlhuVGQrVUcvSEtMUjJMVUxTbmdu?=
 =?utf-8?B?UTVCNDdYa0JLWGR5QW5oSjA1Y0hLL2UrWXpnNnZsRk1uRnVPUFYrR2IxNERm?=
 =?utf-8?B?OEg1UmhtRG4vV0thaG4reitBZXR2NFArQ1kraStTdEF4YzBLUFZVajNyQXAz?=
 =?utf-8?B?QndRYm0yd3hyVFV0VHdxVVFVTnJtY25hdHoyVThBcEZPcVJzUWhTWWN5YjJ4?=
 =?utf-8?B?SjlXTjNGMEpBNW5Rb3U5MFNxVkplb2RVYkM0YXRlYVNHVzhNYks2NURFbk9n?=
 =?utf-8?B?UTdlNjFYOGhkTGloUHlDSHVPSnNmdHRYMVhHK2Nwd1pCb0JOTXZydm5xbTdu?=
 =?utf-8?B?djV5TEdvb1RadG1sUG4xZVY4anFKcVg2NU92dDdqOExHbElTdXVCQ2h2STZI?=
 =?utf-8?B?a2lCbjVYSThhSVlEMnFUS0tyV2lTQnVFN2QxWFBjRzR3V0hVWWdRRmE2WUJ6?=
 =?utf-8?B?VVFUeUJzc00yU0VEaHB0ZmRzTCt4bXVtV240eW9ZR2J5ZC9XMFVCd0JWOE1L?=
 =?utf-8?B?SEEyL0pXMHZOSmFxZ3c4dC84akRGQlJjZ2FDTWJQa2grN21aaWt5T09Rc1pt?=
 =?utf-8?B?ZVFHeWx2U1VGSXFRdHhJZlY3dUVGcTVGRWJaNXJ2NmJRUnVDSFFkRFNrVHU3?=
 =?utf-8?B?R25lRkFNcDBjUG5Ib2FwYUhDeXAxWnJtUFRyR2FGZFgvMUloc1d0RnZidGJj?=
 =?utf-8?B?K1FxK3Y4ckhlL3BrS1E5RGFVaFlGUFpIYWlLRHd0cE8xLzJ5bW5OQmpSMFFM?=
 =?utf-8?B?R2d5cmdEMXBMcGNpUzNFV1pCcllBRjQrMDFBWXBuWUdPSXVOTXIzaWgxRUwx?=
 =?utf-8?B?MXdrdHIvTDg0bWJkdVpRS0hsSHVPbnZJUnRNdFdydjQwYnZJWmUydjFheGty?=
 =?utf-8?B?cHZtZFQ1Um9aUzlwSklIbzFKNS9kK1oxeUcrRk5VbnQ5Znc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400017)(35042699013)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 13:33:52.3627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43c3b257-039b-40f2-7949-08dc86f678a0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8642
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jun 2024 13:34:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200442

T24gNiBKdW4gMjAyNCwgYXQgMTM6MjAsIENoZW4gUWkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcgPFFpLkNoZW49d2luZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToN
Cj4gDQo+IEZyb206IENoZW4gUWkgPFFpLkNoZW5Ad2luZHJpdmVyLmNvbT4NCj4gDQo+IFByZXZp
b3VzbHksIHRoZSBub2luc3RfUFJPR1JBTSBnZXRsaW1pdHMgaXMgcHV0IGluIGNvcmV1dGlscy1w
dGVzdA0KPiBwYWNrYWdlIGluIG9yZGVyIHRvIGV4ZWN1dGUgdGhlIHB0ZXN0LiBIb3dldmVyLCB0
aGlzIGNvbW1hbmQgbWlnaHQNCj4gYWxzbyBiZSBuZWVkZWQgYnkgb3RoZXIgcHRlc3QgcGFja2Fn
ZXMuIEFzIGFuIGV4YW1wbGUsIGZpbmR1dGlscw0KPiA0LjEwLjAgcHRlc3QgcGFjYWtnZSB3b3Vs
ZCBuZWVkIHRoaXMgY29tbWFuZC4gU28gd2Ugc3BsaXQgaXQgb3V0DQo+IGludG8gYSBuZXcgcGFj
a2FnZS4NCg0KV2h5IHdvdWxkIHdlIG5vdCBqdXN0IHB1dCB0aGlzIGluIHRoZSBtYWluIGNvcmV1
dGlscyBwYWNrYWdlPyAgV2hhdOKAmXMgc28gc3BlY2lhbCBhYm91dCBnZXRsaW1pdHMgdGhhdCBp
dCBuZWVkcyBhIHN0YW5kYWxvbmUgcGFja2FnZT8NCg0KUm9zcw==

