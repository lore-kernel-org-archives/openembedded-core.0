Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC6D7CCD199
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 13:17:00 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.5])
 by mx.groups.io with SMTP id smtpd.web11.15140.1760707018886002627
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Oct 2025 06:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=hCWzqvPY;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=hCWzqvPY;
 spf=pass (domain: arm.com, ip: 52.101.65.5, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Fuv0AOz18RuJFdf6Zd52kMvlfn3ASpx/SFFQ+tvxl7ip7zUaob0vdeGGpz2TgzmS95mTyEoUGnxGPOQtvJ0DEO7PWckbHDAa8JWk80GE1oa5hSjhZtnOXTBPHeJEkFFOeLuuygOmlwZxmBfjl1UgDNdL/J/Up2XbkTWKiCWgZPAKoI2KncUbUbneVgnLT4/VJ7z9cxyJgS4Rsoe6oK4GrLrKvC56zBqrB3TpRAkUtTHYRC8exJ/BNTceQam/ygWUL/3MthMlw97VFp872tyk8wdNZy50NfT0bjYtsgfDlV0sYocZJXB43HztG5da6twqHSp8UGvXLrnSuJ9jVz7scA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwVukSl0SbX0t6iZ2vE0Ln6NSlzu1zM4qIw5b4+ox4s=;
 b=S9/c7ujYmM8jLsirDQN5EVwq/Mc1W7DNJwxtBqbp+h2Lvt1J1jYU/ZAZgPYrwApcgDTvqM5fik/QBaSUrrSlPc+8OIpiXIFhuC+n+mxWG8bmUepDWP3TNuwNTabNlts94C9C09q19TwXtusRX2FhNI/dx5zbw6Bm/wR9gfL1+c1dktEh8BTt3s9x9+gHA32Avgue2adZLu9rhs0b0cIeZF5p4mPkIuDvZjV0dKD0w54zGpW90OazyJ8Dh4s9vSQXVREhDy/OlqP+JBMyNW2ZKlFw/z8XyFEV50Gg3/DYG3ppyoboCyCaO4d10zuGqYU49t2YvWSY7SfDdvkOOptiLA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=eng.windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwVukSl0SbX0t6iZ2vE0Ln6NSlzu1zM4qIw5b4+ox4s=;
 b=hCWzqvPYhP0wyxdoOZhzRggbdykLLFy3bBfp2Y/EWtx/FXom1HLrZMZ4x2rim7MMHeYf6OODO3lG1sq8r5PapnwnULwrXe8UiU16EyvW+v9gL/wAOb8CtwjweYQjmpSbu+w99fPogp+xU1KsTkWkvv3lXXYwj27Xw0EWon8lEvs=
Received: from AM6P191CA0016.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::29)
 by GVXPR08MB10890.eurprd08.prod.outlook.com (2603:10a6:150:1f6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 13:16:54 +0000
Received: from AM3PEPF00009B9E.eurprd04.prod.outlook.com
 (2603:10a6:209:8b:cafe::b3) by AM6P191CA0016.outlook.office365.com
 (2603:10a6:209:8b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.13 via Frontend Transport; Fri,
 17 Oct 2025 13:16:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF00009B9E.mail.protection.outlook.com (10.167.16.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Fri, 17 Oct 2025 13:16:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S55SLo1BIvPlOUbMpEk9a+TlsB9tMrz+QXStBFGun6CCjXJxV5FcZIhtfSNiObd+RMn7AOUWW4qd203yHAuvDxylTcMIHAOGpnodE3xahXPmF+7NRjxCK2QQBIkA4Z+6CgVSUCE11gFfeYqwMTwhfewMevqscBQYo1bMNesGNTaq6fC5hF/Ph+sEn82Xo117gzldr783YzBro0nM3ojTAv5F/h8+Q7q2xOL08CBbXr2qYZR+9n2boKyWro8I4hTjnAQ8FSf7CUrB2RIlFxhg4Q/+oNEUJWhXJvTFFSjRuGbkrjJdM0SxSu6wesU0lUOytUYNxZdTGtRQrc234ctpdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwVukSl0SbX0t6iZ2vE0Ln6NSlzu1zM4qIw5b4+ox4s=;
 b=Z8VxxR8I4j9NDEh9DYuLDzLpCNKqAtYzp3jQ1wK2NiZiv6lyBh+2+MQp92u6XqdDomcrXdtp2AzUldvbL0jjS80eY3ppS67LKXe+6qRKRWWtscc/sf3LOqcjxfHfIZcz6SCUxu9VQV/pu4UBId88UsUOCXWE70zNR+UR52FpLZhOYbFqjvk/cHs6gU7CSw72kD5kJ2Ggwnj8GASp/dIwBjYH3oWkbnjDwmsGp2+3w+eBXnn5VpFoP7nEaDPMqgQJOGTcZ0fu8J+zWmyr061VQ52MAv9el7ICRkCB7L+W6UOwqWAQqiASNhvt/L5UZwljCzxMoPaQUVqbktryDCrZSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwVukSl0SbX0t6iZ2vE0Ln6NSlzu1zM4qIw5b4+ox4s=;
 b=hCWzqvPYhP0wyxdoOZhzRggbdykLLFy3bBfp2Y/EWtx/FXom1HLrZMZ4x2rim7MMHeYf6OODO3lG1sq8r5PapnwnULwrXe8UiU16EyvW+v9gL/wAOb8CtwjweYQjmpSbu+w99fPogp+xU1KsTkWkvv3lXXYwj27Xw0EWon8lEvs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB9305.eurprd08.prod.outlook.com (2603:10a6:102:306::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Fri, 17 Oct
 2025 13:16:11 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9228.012; Fri, 17 Oct 2025
 13:16:11 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "hongxu.jia@eng.windriver.com" <hongxu.jia@eng.windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] meta/conf/licenses.conf: map SMAIL_GPL to
 SMAIL-GPL
Thread-Topic: [OE-core] [PATCH] meta/conf/licenses.conf: map SMAIL_GPL to
 SMAIL-GPL
Thread-Index: AQHcPY6TQhdcr5CowUOZJv0SD2Q2qbTGVUCA
Date: Fri, 17 Oct 2025 13:16:11 +0000
Message-ID: <ED4F30AE-FD33-4061-B219-A51E5C324436@arm.com>
References: <20251015044538.165792-1-hongxu.jia@windriver.com>
In-Reply-To: <20251015044538.165792-1-hongxu.jia@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB9305:EE_|AM3PEPF00009B9E:EE_|GVXPR08MB10890:EE_
X-MS-Office365-Filtering-Correlation-Id: a80f620b-c027-42f6-8d61-08de0d7f70a0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?QithMGRSMHN5T2MwaEp3S1hXdFRZYVFoTnRlcXd5czVONm85RVlhbUo5SEdY?=
 =?utf-8?B?cmxNcEV1S1VKcUJBRmtkSk84SGlock9INmZUZGRsYzZxS3pvbWkyMGxHYjZq?=
 =?utf-8?B?NTlNS3JMS3o1UzlXSWJtWjZYVm8wZmwzRHI0eTVYNW1qQkt6U3FUemxWSzhC?=
 =?utf-8?B?ejhmZ240aHZnTjJJYjlNMndQVmRRdnQ4cEFVK0hKYzZXUlFzSDAwTG0zYVRZ?=
 =?utf-8?B?em9WaUFXR0NScjJMZGM2clRsMklORVNKR3hEdUxvZ0h2M0h1YnNUa1A3RjBx?=
 =?utf-8?B?Yy9Sd2tNRWk3czlramtXNWhkQVhLSy9DRW12YktBS1dQd3VEYThocGkxY0ll?=
 =?utf-8?B?U3I0K0tpL2FUY05jU05EZGZVc1MyemlEZDdIYmVNdHp4bW82WE42WlMwSXJH?=
 =?utf-8?B?SEU0aUtwUzV5Sk5Rcyt5R2xSNlJYb3AwMklhL0pHaDQ0QVQveUVFbm05K21J?=
 =?utf-8?B?a1VjVTY4eTdYNWQ1UnAwOVBUSkxGU2VQRTNwM29wVlpWQmFOMW84V0ZmamNX?=
 =?utf-8?B?Y1hhVDhJeDhPSHVHWGs1c0pFK1NFbzUxNk04NisxWEJQcUdlL3laMDR5OFZT?=
 =?utf-8?B?YVNqRzFzdXdkQ0N3ZmFMbzVZM2cvRkhFMEl3MzRXMSttM2RmVXRqbG8zb1Yy?=
 =?utf-8?B?ckVGK3h6RTVSK3g5ODloYWdqRDV2Tk1TY3lQRUhWS2ZsRlkwVWhnbGRKQUIz?=
 =?utf-8?B?U013ZGVJczJyZVlkMVZkNGFnSkpodnBUOFovb0VsRkt6R0FmNmI4eTNzR09s?=
 =?utf-8?B?MG5QWnpVTHY4aW5EUXI0a2JNcnNYZUVJQytEbHRnSDlaeFVic01MTzFIQ3l0?=
 =?utf-8?B?RHM3dWFZRUlTaFVJNjR3ektyUXdOdFlCbS9Kc2FTMjRDN200NTh6RFZtNGVo?=
 =?utf-8?B?bkQ0UEdwT1p6dTN6VVlTdXduYTBrTWc2dFJpWjhkcnJxcHE0eHVYM1Bwdjdn?=
 =?utf-8?B?ZW11eTY2RHdldUVXb3YxUFlHanN3R0V2VnBGbXlFNHRPR0Qxdy9CbjdySHdH?=
 =?utf-8?B?MjZXSW0vWW9RcWRlenViRmRkcys2L3MxSkFoaGNZZEVTOFlRYTIwdXoycCt1?=
 =?utf-8?B?NU5jTDhxeXhseWFaR0xGak9OSVVLV0toakd4Q0xkcm5aU2JZald5UkI5ZXh4?=
 =?utf-8?B?VTZzMGo5SlpYRjU5MlNVWnBsSEt2Ykk4L0FxQk5aTVNld2s3Q211MVlua2FW?=
 =?utf-8?B?OU1mTDNxRW5lN1JpZG1UWCtoemRlUFdKTXNOYnF2TXNtSnVFaElpYkN6MjdG?=
 =?utf-8?B?bHZHellKeDUrY0wzT3k1azdxcUJwT3BhcWV3SENBOGNVdDVleUFDVnJJWTY4?=
 =?utf-8?B?THlnZlYyZnFFaWdyR3RDRkNYSUU5RDJxRVNhQVhDdjBkZjRKdVFNaTVsWUov?=
 =?utf-8?B?MVFid0VYRlprWUF4bktjYzdoS2NUM2JYQjNMdVRQSTZGUjlnOFBnVW9zWWtQ?=
 =?utf-8?B?N2pYb3BpNUc5Qk9pYU5Xbm5KMHhkM0RwcUE4V1YxRkFMMG5jTHd1dnpoMVpC?=
 =?utf-8?B?UEJIUy9wRGxWUDNiSzZKaC9JSExUN0NJM0x2UGNTTmJQY1JuMk5xR1BZRnBN?=
 =?utf-8?B?VzBORXVGbEtaWTA0YWhYV0NTejRIdk51RVpSNjkzczBBRlJoTFlKMVFwWStW?=
 =?utf-8?B?YUxucjdtZjV5alB1TmhjcjNwWHY1VW5PSDNzUThuT1EzMEN1SWxsait6SmNT?=
 =?utf-8?B?ZkI5YlY4dHV6VzlQSkc5THZNMlRFZWF0ZERDb3FOYy90R1FzanZVamJjZzhm?=
 =?utf-8?B?SC9JOEF5OUhDYVduNEk1cFB0cEl6dmpUWFg1ay9HaEg4ZTV0Q25OQWlwWmFQ?=
 =?utf-8?B?TTJuWWtvNUFIcEZqZ2ZzcmJSYnVVenZSK2c1bkQ1R3hyblVrdGhjeWg4UDZ4?=
 =?utf-8?B?R2tZZHlMQzc1bGN0UzRsaEt4WnZQMGh0V0hSVUZzbjY4SE51c2RPWmNWRFhw?=
 =?utf-8?B?VyszSm8zM0tVRXFPbm9hY2JyWEpITXFRNkFRTis2T2MxRncwT1dVNUN6TDlW?=
 =?utf-8?B?Yk4rL1hWSWZRPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6504C41DDF54184983461237DC7434DA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9305
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF00009B9E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	63637848-d35e-4a68-c399-08de0d7f57b3
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|35042699022|376014|82310400026|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZkpCRlBrYnBIZGVJSmZ4ZlpsU2V4S3ZxQzZmeVVyR1FXQ3QxZlNEb2VYWDVo?=
 =?utf-8?B?SnhaaVZ3dkI4OWUrSDR5T3Vmek4va29kOGxiQm5UdmdqMXAySEQ1T1dqeHFO?=
 =?utf-8?B?dUQ1MVZTNGVLR1lLUlRuUmpDTnkreGV2cTlxQzg1L2xhVmV1SUFVaW5KYWEz?=
 =?utf-8?B?ckdjdFRHSU55cWZpalhsWG1BSzJFMDlpdURnRU5jaDFjTkJWZ3FiVUh4N0pI?=
 =?utf-8?B?ZngydUtsb1VzdGhudHN6NUJDTTlJUGk1YWdEWnhiY0NQUk5kS1g0R0poNW05?=
 =?utf-8?B?SWNieHNDWUtWOFNyM3ZtNENlSzJPeTZSVFhBRjlJYzBWVGg2NVdhZlJDZkpw?=
 =?utf-8?B?dlJWNHVodlU4UXdkWk9ELytvQ3U3Q0RFOWZ2SnozMUxqVFg3LzhFYkRuUVha?=
 =?utf-8?B?N2RPQXdxR1ZWVEx5QXUyaE1wRDR5b3dTOFZLRHZMUUR5dWZOaDFZcTQydUYx?=
 =?utf-8?B?QUFtVmw5TjRscHBPM1F0dmR0WW16NHdLektJQzRtRCtCWGNjbWxWaDJJU3o1?=
 =?utf-8?B?Tm54bUx3U2xIRmdZMEhkWk1MOExFcmlPTjZzaE9QcTVsSjBqM3g0TmZrRHVD?=
 =?utf-8?B?TFRQYlh3enFrODdJUmVuTUs5Uk5DQ1pwalNJMUs4aEhDczlOK3JnKzRYRDdu?=
 =?utf-8?B?cUdmMlNseXQ3YnZnYkViemJkM0tEbzR5RWgzWEFxNnNMOVNwdHlhbEt4VlVM?=
 =?utf-8?B?Snd4T2pwcW5OamRQSFVYazh6UzRNVm53bVZpRkJJdU1QWEJkZzhiQWtpckl2?=
 =?utf-8?B?R0xoeWJuY0VWT1JmNitmRnlNSlVhZ2ZQbWRWSDh1d2prdXNEWXMvUnNVS21u?=
 =?utf-8?B?bXRtZ2F2QlZTYlpnZUNWUHNEMmRXVTJndk43eGk2NStpd2N1UCs1TFVaUlpo?=
 =?utf-8?B?S09pM1BlNWJ1NE1JQWc1cVNiK1JlaFhNZ2kxQjByUExDSjVLZ0s3bzBCc2tw?=
 =?utf-8?B?RzJlV0ZCWVlLVmthRWhTLzlyNWZIY2V2OS9ROFlLdFRNa0FHMTg0d2ZvR0hw?=
 =?utf-8?B?U3luNVFpVlIzWkx5WHdnUzMzc0swSzBBNkRrVFZDOXBubmg5VmJGMXk3VlJp?=
 =?utf-8?B?cHJ1L0NCVXZWdFpIeW9zTWU0NnhMOXRFaUhBeTRQeUNZOVBURktXUklxU0E0?=
 =?utf-8?B?N01IMXhwZ3pVQ1Z1WlZSb1EyZitSMTI0MEFDT29jV0xlRDlpNWp2MFg0a1Bh?=
 =?utf-8?B?YlJTVGt1akVXdEFXZmlpcFpYbEdVOG1yREYrSzdYMkdSc0NCeG96Qmpha0RM?=
 =?utf-8?B?dmtkWWR1d2x5RGE4ZXBSVk1ZLy9OVlVKY01XZ01JbjdQSEQwdEE3WkRqQlRI?=
 =?utf-8?B?amdTZ3JCbDVtY0hyYVlIaGFWQ0x1a2NVcWprMmNrUHhSVDRFeUFyYW0xV0Jv?=
 =?utf-8?B?NHp2b1l5QURwT1BOZ3R6MEFCbE45OFBydXpkS29YODZqZXFxNWVoT2xWd2VP?=
 =?utf-8?B?QitsekcrYkJ3N05YWFkxQTMxVHpxMVB6QkZvSjVuOTFmbkZaVnZEMlFiRFVX?=
 =?utf-8?B?R0dFVzlUbzk0ZGhVY2R6SmxDamFFNU5hT2hZVnpneU11bXZXM0h1K0FBajM5?=
 =?utf-8?B?WjgvaDIzYmtOY21wbG5xeHV3NXRKYkNTMnlyUkU3eFUza1E4S0NzMkJUMTBM?=
 =?utf-8?B?d1dOR3hSbmNBTitPMmxmR3pzMmQ1SVNmSHFXK1NMQ1FoMzZrVzVNTlZlM3RS?=
 =?utf-8?B?ZkNjMnhwVUJCbUhDTkwzSjNEaGFYSzFCdmZRaTNYZkF0am5qMUI1OFdBRFBD?=
 =?utf-8?B?UHh3YkxrandIRXUyWlVkZ3lXQTJ1VDNOSWVMNmY0YmtHcTl3TDdBem42aDB0?=
 =?utf-8?B?V3ZQL3F4SysvV2ZYY054MmY1RFVGT0poM3lPU0orUVVEcC8vWDNabGhZdmJX?=
 =?utf-8?B?a0dOWEVjN3ZGQ0xCM0pUSHZEZVZscEQwSlpWcVdBSWgwZHlNZmtjeEJGQ3Zu?=
 =?utf-8?B?UVVpRmF4UnltaC9yNUNRL2ZkUVk3dU9MOXBZVXJoZlB1VmhCMkxuZTNaKzkz?=
 =?utf-8?B?djFZbThIbUdMbnFHK0lCRVJkTkc0dWtOSHBPZEplOThDbVNHR1NLOW9xN0xh?=
 =?utf-8?Q?j6lLsu?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(376014)(82310400026)(1800799024)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 13:16:53.4346
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a80f620b-c027-42f6-8d61-08de0d7f70a0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10890
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 13:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225020

T24gMTUgT2N0IDIwMjUsIGF0IDA1OjQ1LCBob25neHUgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcgPGhvbmd4dS5qaWE9ZW5nLndpbmRyaXZlci5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+IA0KPiBUaGUgc2hvcnQgaWRlbnRpZmllciBvZiBTTUFJTCBHZW5lcmFsIFB1Ymxp
YyBMaWNlbnNlIGluIFNQRFggaXMgU01BSUwtR1BMIFsxXQ0KPiANCj4gWzFdIGh0dHBzOi8vc3Bk
eC5vcmcvbGljZW5zZXMvU01BSUwtR1BMLmh0bWwNCg0KVGhlIGNvcnJlY3QgdGhpbmcgaGVyZSB3
b3VsZCBiZSB0byB1cGRhdGUgdGhlIGxpY2Vuc2UgbGlzdCBhbmQgdGV4dHMgd2l0aCB0aGUgbGF0
ZXN0IFNQRFggbmFtZSwgYW5kIHRoZW4gdXNlIHRoYXQgaW4gdGhlIHJlY2lwZS4gIEnigJl2ZSBk
b25lIHRoaXMgbG9jYWxseSwgd2lsbCBwb3N0Lg0KDQpSb3Nz

