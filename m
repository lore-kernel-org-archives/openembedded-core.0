Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD6FC3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 17:26:47 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.40])
 by mx.groups.io with SMTP id smtpd.web10.2140.1743096400038722333
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 10:26:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=VwDK5KM4;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=VwDK5KM4;
 spf=pass (domain: arm.com, ip: 52.101.71.40, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=s2FlV1geXKhHOPvEg+2XdXOBp4u0o1HWvLldgm+xLH8eNYKgdL/FRWWd9XH+BvEY3O8/spK4QHW9D4nR+KuCA7zqDDbjmeOFk0L33xIQb3O2JSugjivVTxZBdoCASjG2Bjc1vY2SzOOQ+90Cj7FPXpyl3vBlX4wH52Uof7ofg2VHGQ3RuoxQQbNoU7hHgB+zxtDYdfsJtiyHZXgS3b4BbfB6guOIDxHPwigje36DQEPhfPAuB8BeMWzceVhJ+KsoNTXTAJGcFtnWeFfvRHC9If+vWEyb/KlASzVBJlGal7LWYbzIZHcU45C7w2m9izR9ecM0xlfa4hKfCbNCy+zpUg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VqREU0KaF+K6niKYUzdzQMN8p0HbfCIBbn1s3eEYb/M=;
 b=IlX+nU5Wql/Nwd6FSrPBVNP/6FqZ36t0fSnJvGGoIP032TbLrY5sD1w0ASySm46U3MSkNlBZY8v92UC5w9cMiGi0kpvsSmd4JvBZ37Z7cqes+ILg1pcY4fEwwrsIZ7t36oFnJBnCLOn+HYfUJdew3vvquCjgn+njin/gFLhnjHKt2/3qgEHZWpOaOupaHzYfk36nzphQteD8VsA0NB3qwNHPk5b61nValbwmqujLqIK7gUYyTaKPS4NLneargXLqihzdb8rtahplULSA1vyLStUgbNIR5zWisDPNAaz0kBLqy8nqBFVNW/vjQx2Ygha0s0SmNLbBRkPCkT+CLwAhIQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 4.158.2.129) smtp.rcpttodomain=siemens.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqREU0KaF+K6niKYUzdzQMN8p0HbfCIBbn1s3eEYb/M=;
 b=VwDK5KM4WPPrwiCHvsre6R8pbMGEi/fky3pCBBA6SJMBh+sxxqWeh2CXSouc7iQOLLn1ZKYJK0tC0lOreJw/DasfF4VSPPSNVu2H8g4GTtLQc3FETOYn6iUyPMCtKvmnhnsByLmUIgDt9xT1UMqMuRbpekbAuw8WHUtr8EvyylA=
Received: from AS4P251CA0030.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d3::18)
 by DU0PR08MB9535.eurprd08.prod.outlook.com (2603:10a6:10:44d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 17:26:35 +0000
Received: from AM4PEPF00027A62.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d3:cafe::e4) by AS4P251CA0030.outlook.office365.com
 (2603:10a6:20b:5d3::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.46 via Frontend Transport; Thu,
 27 Mar 2025 17:26:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Fail (protection.outlook.com: domain of arm.com does not
 designate 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com;
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A62.mail.protection.outlook.com (10.167.16.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Thu, 27 Mar 2025 17:26:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hBG04CPu9V6yiPDA78ly/2u+AT1T/myzgcBaIIjbrYI16VZfHkYAwfrFmfUV4SM/vcxu1smNug/pFu95/09RwRrWv2eRyhKj+WWvQQoGKTTGh2Lzy0o6NZWWxah7LmqFsm0Gy+So1IHqRkliOAAcVII9NfCwQjpgElsfzjTouFxNgkZjKRtCxBdwaaDiwYhGAEWhr0+sLq/9vr2cSS6+SgGpkxISdCMp/MQldAO+983uaGCcktiNSe7Kt187sJtii2stYvvWKcEpn/6k2NCVU/B69+YKPYAz4uGoF1r0H53Hz+jmS0wqDWTJG82ojjPGa27GzB8xO1oObP5fi9KdHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VqREU0KaF+K6niKYUzdzQMN8p0HbfCIBbn1s3eEYb/M=;
 b=IIqcum/hXZLHfp4Oflry6wTJJM04x8dUi3GWt/0cRF+YIKDbF1Ued4ke7k8JutB4RqYLqD0o7O0E1/lF3UJnnjpco9EHOM1cWyQT9M8UE1vzOvlodcbVBDZdzhcBu3B7p/6Op75JNyDBoWdwr1KNMYDtj0pnBliQnY7C1gZSGXdCaVC+lfPeT8pE7fexT0XEj3IS3+J1AmLGqvB9cuC7PezW/jDhwhEo9K9ksEvWS2gEEz3QI6Y7cLSAjNKi7z5pf8QBF16Jghr7gmtmGpNc7/OCbJ3a1bAh9dqzhpqQ4vxR6futeVVFWVDh0H9y681KbVaFFFRiaStGGAqKo2OS6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqREU0KaF+K6niKYUzdzQMN8p0HbfCIBbn1s3eEYb/M=;
 b=VwDK5KM4WPPrwiCHvsre6R8pbMGEi/fky3pCBBA6SJMBh+sxxqWeh2CXSouc7iQOLLn1ZKYJK0tC0lOreJw/DasfF4VSPPSNVu2H8g4GTtLQc3FETOYn6iUyPMCtKvmnhnsByLmUIgDt9xT1UMqMuRbpekbAuw8WHUtr8EvyylA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB5698.eurprd08.prod.outlook.com (2603:10a6:20b:1c6::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 17:26:02 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 17:26:02 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Schmidt, Adriaan" <adriaan.schmidt@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/1] libunwind: update 1.6.2 -> 1.8.1
Thread-Topic: [OE-core] [PATCH 1/1] libunwind: update 1.6.2 -> 1.8.1
Thread-Index: AQHbnyOfNZLEbyCx8EGAKjVX+HMKtbOHCi6AgAAtiQCAAASUgA==
Date: Thu, 27 Mar 2025 17:26:01 +0000
Message-ID: <FCB285E1-1F26-45E0-B365-4463FC94DCE6@arm.com>
References: <20250327141258.2690906-1-adriaan.schmidt@siemens.com>
 <607113C9-1438-4B7C-8B23-FA8911BEC331@arm.com>
 <AS4PR10MB53181EC3B1B610B1DA880120EDA12@AS4PR10MB5318.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS4PR10MB53181EC3B1B610B1DA880120EDA12@AS4PR10MB5318.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM8PR08MB5698:EE_|AM4PEPF00027A62:EE_|DU0PR08MB9535:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c5ac9ad-4e2f-4451-ffef-08dd6d548634
x-checkrecipientrouted: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?WDVhdU84VTIrWGEwWXhvOEdsbnk3eSs5UkxBd3ZqRDJZQWZ3UTMxRDcvaEpu?=
 =?utf-8?B?elhwT3VKbHgzZDduNjZSQzZiRVJFRmVDMEErQnFrcW01SkNzbC9PRTBFWEtx?=
 =?utf-8?B?UjFVUmp0L2hvN3plazlOakt5blhFekhhZlExd1l1aEp1Und2RW83dVA2RDJX?=
 =?utf-8?B?RXZKWXpjVy9RRVEvcnVsWFdqZ1p4YUlSeEV4ancyM3JLcXJYbDdVTGl1WGdO?=
 =?utf-8?B?azhiSkNIeG1oY1FxdEZNalNBUk13U3NDZjI2bFR2cVlVZGVCV25mV1MzNG5o?=
 =?utf-8?B?MnM2Q0dOZUxyUXFTVFFtdlJteGFpQ08vOVRBMzgzaFdyTWZNNWZabWIvb24z?=
 =?utf-8?B?UUEyWXQ4bHRqeDJLZzdPTzd2Um5oZXEvOExpZEo1bUJxRFMyWDhmQkoyNmNH?=
 =?utf-8?B?eUZqc3AxaHE4Z2FpZ1dYTTg0c2hNVUN4bkRiUUpsTmFFL0RpM0Z1WXRWamkw?=
 =?utf-8?B?WU42TzdxYVdZU2VybUljWDV0VjloWWI0MmU0VW9JQzNYSWg4bGdqK3BKelk1?=
 =?utf-8?B?cy8yQ1o2R1RUVW4rL09PbitaQUsxSjQyTUNrR2tCbHljVThJNkVxSGppYWcr?=
 =?utf-8?B?UW9oaXBHZzNycmJHZG1vc3NqTktYZFp5TVFpeXBVMFNFTGxWV1JPQUl3MTk2?=
 =?utf-8?B?ZkMwWlpwYklDcUhMVXpxZ1hZM1huNTJkb2NKc1gzY2JRWXpjVHFleG9qYTlq?=
 =?utf-8?B?Y0VOY05NR3ZvVGU2L1Nja1VNN3BOMExZNVVjbWJXRDNITmRlUHlOZmZKTVlr?=
 =?utf-8?B?U1JvcmNXVmhZVU9LcXpyYUVwNXMwTUNyZHZLajhpVWR0VkRtbVplaE8wcnJK?=
 =?utf-8?B?eFFDVWtReE02ZUVWeDhrdktyeGpNY2t5cHorUlN2WmcxL0M5OFhUVGRhMXBs?=
 =?utf-8?B?d1BVZkFwQWJuNVFRZmdwVEQ0dHlFd3phUERGNHlDVzFxY2RETW9kRFViVWZ0?=
 =?utf-8?B?MlJwUGtUbEg1RkpOUG1yT3ZCY3l2Y1I2QjRvaS94Z1VZSmtzVXRlcVFWaFZN?=
 =?utf-8?B?cGJXd09hWit5Tnp0dnd2aDZ5MmJ0dFlhZlJOaGdaMW0rRFVucVRoTW1Zcnc0?=
 =?utf-8?B?RmQvUktZVVdhL2NMY28vUzVHaVBwVm9Cd0IxU3BlSHovT1pUMHhQT3RuTjVI?=
 =?utf-8?B?VTlua2NXby9XdFpFbFFzeUNoa2VtMUZ0d2Jra09WcXVWM3BsK2lqcUttMVZ3?=
 =?utf-8?B?R0YxNnZvZG0zN2I1OEZvakpBR01NMzZaRG5kMWZXeWQrYkJSL2VhRkZtTUFK?=
 =?utf-8?B?YmdCWWhHWnA2SDU1QzV6eldWOEZ6cm4vYVJ2NTdyR0s0RUdTb2JyeVBESDN4?=
 =?utf-8?B?UDNnU09NN0NDSGlMb1ZYa2FiNG85ejZOWmMya09NaHI5bWxwUkJhRWw0dXZN?=
 =?utf-8?B?SWZxTEhpSDJUc3AwV1NlblpNNmlWWG5la3daUXhaWVpPODNQNE9yM2lyVnR2?=
 =?utf-8?B?b00vdDljcFVwMTJDRkZ6VzNoVDR1VFFOa2lmTnVuRkgrZmRUU0ZVcVJDamNl?=
 =?utf-8?B?dTQ2bFdMTmNNZzVkcFl4SFBYNk9XS3I3bGNNTlZ5MUI1ZHhCN2VtYTgyaWNv?=
 =?utf-8?B?RUpCSjg1VzE2Z3JKTDkyT3Y5MDBjN0gybGNTUDh2MkNwalhkZnlSaVpXSVlx?=
 =?utf-8?B?NjNjYkNxTjVTSXRxOG84cjlzSUZncWMvWU1CTlRod0pVQ2lvd2Y2NjkzeWcx?=
 =?utf-8?B?eE5rTTFoWFpUSWZROHRaL0t6OTBXTExCSlJSUkVhY3JESnZYVWVLR01mV0Fo?=
 =?utf-8?B?SThQU1pMa0VRVHFMR3lwTlFDczRCbW8zK28zcXFjWUN5MXF2b2txbnZUNWdz?=
 =?utf-8?B?QVVpQ3Z5QUsyYkNaYjJVWmVReDRMRS9MZmNhc2xmVXJBOEYxZ08wakEvazh6?=
 =?utf-8?Q?67CE4GBKCPFqQ?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <7373558ED1712645B75FC50DAD5403A3@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5698
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A62.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	6c642af6-21e6-436f-d88c-08dd6d54725f
NoDisclaimer: true
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|376014|14060799003|82310400026|36860700013|1800799024|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RVlZdGxqaUZySzZqeUlJREdHVUtXeWxlWWd0cGw2VUVDeDc1OHJnNTlvNFor?=
 =?utf-8?B?UWlhY3hKdXowK1BTS0g4Q28zUE84QklCNVpjRWNSaUsrL1lqdmJiaWFaV29h?=
 =?utf-8?B?NjdnbC9iT3FQOHJUUHovYXdSZUI1dk9RYWpKL1dVSTczSGY0NnRlK3g1R2R0?=
 =?utf-8?B?bU1JblJueG1SMy91TEREZTlKVksrYU5LL1I5clQrQnV2OUtjenZWZ0NDL1dp?=
 =?utf-8?B?UVB3RytSTzRqZUZQOE15ZzUxQUpma0NOMkJPbWgxY3JvWGJodmxWOXpmbWpG?=
 =?utf-8?B?cUhCVDF5M1Y5bkZUZk1EQTVEQzA3eHY0RCs1QmdXdDF3L0p3Ukk2WEg4OGNU?=
 =?utf-8?B?QzdYVGVhS3VtU0RyMGczMTFmNStOQ0ViODJJR3dPZ3Qxb2NBeStwRGw1VzRo?=
 =?utf-8?B?OU9qUlJHaDgwRUVMTlpCZ29jRm9NYUM2YmNzV3ZjTVFkUkRqS213Rno2RVhE?=
 =?utf-8?B?M3puTHpkVm1pSVlTK1JzdVFwdlQ5NGlpalI2Y2NUTUY4SGxjT2lKUXNVTjdV?=
 =?utf-8?B?ckhHUXppNEpsVmpyZ3ZvcHFxbWFTMkF4bEh0R2VXd2UwVzA5eXdtWVNLZHcv?=
 =?utf-8?B?cktsM0d0NE0zbGhvUE5naDVqTzVGYXpJUU4vYUtyTjNMRkwrYkI2OVM2ZkRv?=
 =?utf-8?B?ZlZxRWdubDVST00yMWxpNUhsYVZ6VXh1WFIyaVc3UUlnRTBjcEFBcFAyNjZs?=
 =?utf-8?B?cUdZc0ZPblBxbDVaVUFkd2hsY0hOdnpXa1BxR1hXSjh2WWRkZ2psaXBuZWNE?=
 =?utf-8?B?SzUrMWpQcndUb0VsWmF3N0kzenJUU0kxd2pXRkx3ZlFUUU1VR0QwSE10a3hL?=
 =?utf-8?B?bm9LbVZORFlTSlp2b0M0MW9idUl6ajg1ODJLbE4yT25idi9Gc2NkRW5GT0pr?=
 =?utf-8?B?NzJib1gvSVBkYUhqNkZ4bTh5WUhBSFlBSmZFU2JhTmNJZW5QNjdxVmdKb1dt?=
 =?utf-8?B?cGRTZE1wM3IvVTlncEFPR21qQUFXVFVPT05hektGM2p0QUJOOU5MczZYdlh0?=
 =?utf-8?B?RUpjVktJbzBkb2N3U2pUYUorWlF2Vlc0YnJDcmJOREtMY3UyZEhOOEtYczI5?=
 =?utf-8?B?VnhGVGM4VkhnUHhMWTlVeHRIQmg2RnBnZHhtd2lpVzNoamM0R0M4TTdFL3ZW?=
 =?utf-8?B?REZNNkxScnFTZFEyaURlb2JSbk9aZTN5Wk0rUkxDdnN2SVJIRDZxV1drbnZQ?=
 =?utf-8?B?YVAzc3ZDVkt1bmc5RkJYbXZ4WUdXQjFndmR3eUg0bjBQZ0RJd1FNcmM1aTZs?=
 =?utf-8?B?RzlDWWt5NUhBeFAzcGovZjM1amorWTJDRFJGTTVsQnZNK29DWjVwN1IveFJs?=
 =?utf-8?B?My9GNnM4dUpydGFnNEUzUnBBMjByMHRLeVY3b294aG51WXp1ZWJoODBXUVhl?=
 =?utf-8?B?MXJ3WkJHN1Y4bTZNVHBVS0dOMzZJRHhlbS9uM3Q5VjA2alV2NzZIMkR3cFlt?=
 =?utf-8?B?aDRIZEdQN1pKZG1Oa3V5cHVjSE9MYWZ4bS9TWkRySE16ZGpPdkJTdjJvMXlF?=
 =?utf-8?B?MjZjNXhGWWwrNVUyVUlBYWE4Ri9lcjhoSmg5b0ZvRkhGYnF4NWx0SUVJeEhp?=
 =?utf-8?B?OTJXZkJSUGNWRUZGRkRoc1dqS0Z0OVRyMWFpRXQxZlpQNkM4L2FvOHdXZU45?=
 =?utf-8?B?K2NHd1dpWmd5dG9TMlBBeXNmeGhOckxQWno1a3dIK01ia1VocGZhcmdOSHFD?=
 =?utf-8?B?ZU82eEMweFVGTitUaFlQditYdEZvcEdodmNxVVpsaUU1cXJnODUxdDRTUyth?=
 =?utf-8?B?eTNWdmRnMlRhR1BlS2ZQSERlYWlMWHFNM29NYUVLSUlPQ0twNGJPdzh1SjMz?=
 =?utf-8?B?YWdtTG9xNVdMc0c3QVpoM0NSOVlKcTRQbVF0cnNSbEtyWTFJYWhpZW1FS1NM?=
 =?utf-8?B?Q0NFZzRjalQyRUhCWXNMQVR4aGsrTFU4VUtUWUptc2l3cm5YY0p4dEFGaUdw?=
 =?utf-8?Q?AVMr3Cb2VY4=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(14060799003)(82310400026)(36860700013)(1800799024)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 17:26:35.2466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c5ac9ad-4e2f-4451-ffef-08dd6d548634
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A62.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9535
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 17:26:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213771

T24gMjcgTWFyIDIwMjUsIGF0IDE3OjA5LCBTY2htaWR0LCBBZHJpYWFuIDxhZHJpYWFuLnNjaG1p
ZHRAc2llbWVucy5jb20+IHdyb3RlOg0KPiANCj4gUm9zcyBCdXJ0b24gPFJvc3MuQnVydG9uQGFy
bS5jb20+LCBEb25uZXJzdGFnLCAyNy4gTcOkcnogMjAyNSAxNToyNzoNCj4+IEkgc3RhcnRlZCBk
b2luZyB0aGlzIHVwZ3JhZGUgc29tZSB0aW1lIGFnbyBhbmQgaXTigJlzIG5vbi10cml2aWFs4oCm
DQo+IA0KPiBZb3UgYXJlIHJpZ2h0LiBJIHNvbWVob3cgaGFkIHNvbWV0aGluZyB3b3JraW5nIG9u
IGFybTY0LCBhbmQgd2FzIHN1cnByaXNlZCB0aGF0IHRoZSBwYXRjaGVzIGRpZG4ndCBzZWVtIHRv
IG5lZWQgcmVmcmVzaGluZy4NCj4gT2YgY291cnNlIHRoZXkgbmVlZCByZWZyZXNoaW5nLCBhbmQg
SSByZWFsbHkgZG9uJ3Qga25vdyB3aGF0IEkgYnVpbHQgdGhlcmXigKYNCg0KaHR0cHM6Ly9naXQu
eW9jdG9wcm9qZWN0Lm9yZy9wb2t5LWNvbnRyaWIvbG9nLz9oPXJvc3MvbGlidW53aW5kIGlzIGFz
IGZhciBhcyBJIGdvdC4gTWF5YmUgc29tZSBtb3JlIGZpeGVzIGhhdmUgbGFuZGVkIHVwc3RyZWFt
IHNpbmNlIHRoZW4uDQoNClJvc3M=

