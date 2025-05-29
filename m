Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DFCBC5AD49
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 09:29:15 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.43])
 by mx.groups.io with SMTP id smtpd.web10.16878.1748510953769781316
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 02:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=bDMKbABM;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=bDMKbABM;
 spf=pass (domain: arm.com, ip: 52.101.66.43, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JD7e2h8CvpZgl388saEFvM5qAHC2Ic3tk1mnNsLo6Wty1l7YGCzNlvf78Ce2IFxo3y5jxSdhH0CwsNaKqbhMJgWLugDh+PH9MU++EDgw8o+gBZtn7BDwXgoWLa78J5zuZaorwdiosy/uOqNmpSRZIhVvCQRiEtIy/tWZZt4gQ1g6OV3uIgMtqbUqtSsZOKFTIjAq8YMS6CDdROu+N65rKsnwDgHxj2xiHQps98DRtumI4qlcnT3rLM2nGgXAE4aZ93dxpMFRuix/WclbDueBctMGeH76wRJhQcQYSFLf8cRDZp6YA4/gVipAjdP3ChwsWjeJlU2wZSilR/inzQrxzw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lfmBDY3EqZGiPwhQpDQmF9OS+EKdQ3Cf34QZ8I6O/SE=;
 b=IUZNVXfYl8fzRiRg7qrcbyJySP+A4WRIla18XgQ91hTUImLGz9r1pxhu5oWlgim+mUVzmji8E2Z+yVD6zQlgiybnsfdpPs4OGs5I/8PDkffgSHVNdwSMle/0cgQVjh+nU96Lzk4pZbe+osY7D7ZhmjwbUsLaXEzbPD91Fb1F8rUbJElGWYbfJqxoJXLhMZjQi+1fQL+thrPsItYPenyNtuHU9rSr8BJlJAtJOWZjca/fnmiCSUQ0ffTBqJCyMyX3GeycMqVicDNOMPzgYmfXDdhMvshmUxcItd9HfG7cMo9bF0A0iMwc2VJkOPAma0CUIzkp+KoBrPinAtcM7FgVvg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfmBDY3EqZGiPwhQpDQmF9OS+EKdQ3Cf34QZ8I6O/SE=;
 b=bDMKbABMJkU+ULBDYltVTZlf9fIiDV/Szo5sMUNx3mYYCFBk4kZz3HiBKU2L6bjtdrdax7+w+9tvQv1WqU2H78NJdjSXqTKa4vrhAzsjbg7aLa/XbsorqovsYSdUvVoMlii+1HAqcbnkOphTeUV2Y9LUE5Ev/TXtpaVneNqiQ44=
Received: from AM0PR03CA0107.eurprd03.prod.outlook.com (2603:10a6:208:69::48)
 by AS4PR08MB8022.eurprd08.prod.outlook.com (2603:10a6:20b:585::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Thu, 29 May
 2025 09:29:09 +0000
Received: from AMS1EPF00000041.eurprd04.prod.outlook.com
 (2603:10a6:208:69:cafe::ad) by AM0PR03CA0107.outlook.office365.com
 (2603:10a6:208:69::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.23 via Frontend Transport; Thu,
 29 May 2025 09:29:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000041.mail.protection.outlook.com (10.167.16.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 29 May 2025 09:29:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Py5gTUmthIfydRvHvdLiunBl7JtbWz4VARu/IAaLBfLLYPxghJiRQkIzjpfvTItyETdYngq6gl4tzIdRC7Q2NvvoVdQvU4i8jIQkMIvZYUAZqLfQYBrCxkV1cXJ0F+J0PehPUCzP3+IcM73+XNxdQcx/ZLA0ecqTWzbk0de7XxrCXBKUG+omzjIMJ0OjgKdpVrk7vezpo4k6sAt/z42L0jJbLqm3RcsVj+RqmjqSQv0ZQLKd9WD18pux9n0S57Zelkw44sc5jFSArREO5Z38TgJri8SFzeGW0IB8kgZ107WcexNbXBA+9AcZ0XtihaTfP3Brds4wvpx7qMm9j7b9hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lfmBDY3EqZGiPwhQpDQmF9OS+EKdQ3Cf34QZ8I6O/SE=;
 b=q5aH5JdiR7TzwQVEL08Afplz/0BkjEl5sk9XjYYln6ugXOJ262OIB1BgzEf37zUZs49/qF/E9zGpUE9u8SteMy0XNOmfxEUrUyhaDjDyuxBAyLeR3qsxein0NJjTBE0h88ZkU7bj4yMaScHeyELQ1tnP0yxoi4IVx6m8bHGgmyv1zyzOET4XIotkXJlQJsh9ckzcGYGkcFTxEDfnmVODBGfTITLGJZDIl5+Nsvr4A4SudeIkFMjpcRVthm/gHkQmuQadja25zuFJxXe03vYMJqSrn5HNmIR2o/rrxD3kL72MoaHIleL9YY9a3K0DEqZ3530gZl0BqWMuuiqiyB5vpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfmBDY3EqZGiPwhQpDQmF9OS+EKdQ3Cf34QZ8I6O/SE=;
 b=bDMKbABMJkU+ULBDYltVTZlf9fIiDV/Szo5sMUNx3mYYCFBk4kZz3HiBKU2L6bjtdrdax7+w+9tvQv1WqU2H78NJdjSXqTKa4vrhAzsjbg7aLa/XbsorqovsYSdUvVoMlii+1HAqcbnkOphTeUV2Y9LUE5Ev/TXtpaVneNqiQ44=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU4PR08MB10911.eurprd08.prod.outlook.com (2603:10a6:10:571::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 29 May
 2025 09:28:36 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8769.019; Thu, 29 May 2025
 09:28:36 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 14/28] bluez: Disable invalid-pp-token
 warning with clang
Thread-Topic: [OE-core] [PATCH v2 14/28] bluez: Disable invalid-pp-token
 warning with clang
Thread-Index: AQHbyhjBRrHrPsjF7UiUuuu+FTR+0bPpY90A
Date: Thu, 29 May 2025 09:28:36 +0000
Message-ID: <C6B84781-E495-4A0B-866F-28FB90D7BD3A@arm.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
 <20250520-clang-toolchain-v2-14-db97c2eb3756@gmail.com>
In-Reply-To: <20250520-clang-toolchain-v2-14-db97c2eb3756@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU4PR08MB10911:EE_|AMS1EPF00000041:EE_|AS4PR08MB8022:EE_
X-MS-Office365-Filtering-Correlation-Id: 758152c7-00c8-4624-2768-08dd9e9343c2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?MWtHUVIxM2Zaa2VuSnJ3L0lxZEZyRFJWcW1rNHRMWDVsQnlROWNGMWdaeVl4?=
 =?utf-8?B?YXBIdDR0amt4MlRuT1pZTk1wNStjb0l0SWdRNytSL0tYUUQwRlRVK1l6RmdS?=
 =?utf-8?B?bERzbDdyUFNjMzA2bTFkenRLVEk5RnlOUnZ5VXVVSEpqc21NNWdVaFJsUU43?=
 =?utf-8?B?SWVyOG5nK2dDYk80bWk0cjdsZmgzdmhsRytWc0lYb2F2NW9CeUJlbmZ1K0ZY?=
 =?utf-8?B?WnFQNC96TVhwd3haSnY2S3JSK0VkMUVNcmpJVWQ5V2FBZ2Y4dUhNWllvK1NI?=
 =?utf-8?B?U3dQREtORi9DejcxaXdjN0R4MzJzalJQVVdYb0p3azZZWlNUMXp2N1VpT2lu?=
 =?utf-8?B?UnJEU0dPQStjQVo5dENXMllWa0xpL0xIdzlmZ010OG9LQ3VaVm9UNlpIM0ho?=
 =?utf-8?B?U2huYWVNYXVKUHpxT1NmbDBvL2lxUGpac2MrenFLbEQ0aTJIN200dElzNkZm?=
 =?utf-8?B?all2YTQyQ3ozazBRYytUbnNzWkRKMFQxV1I1MW9hSngrR1pPMGdUbkI5cTkx?=
 =?utf-8?B?NVRJT0xWeXpFOTRNRzJRaXJDamJyeDluVWxnbkJsVEVxbzVZT3BrVmpyZytt?=
 =?utf-8?B?Vlg1QzJQa0U1U3lMY2ZXUU1SV05oM0ZMWXpPTGZ6TnRseVkvYmxobWZ3L3RW?=
 =?utf-8?B?clIyREpjZFhFUExQbGl6K1RXTkVrK1ByV1pQdks2UFFveWUyVFhiYktTNVk3?=
 =?utf-8?B?MmhoakJJSXpuZVFndUdzU1dEWUVINno0VDd2NHBCT3BzTXlObXBSb0RQV3Ez?=
 =?utf-8?B?aWd2MjErZmxQVmJ4aStsc3FjNHFlVWxmeGNKRmxrbmpkNXFOV0paWDRlbDJT?=
 =?utf-8?B?RkpUU3JTTmdnQjdFa0FvaUVxbzlNaHE5MlBmRXBXVURaM3hzY3ZpQnd2aVJm?=
 =?utf-8?B?QVFLUmphVFZOTlZmVFp1WEtLMHF3MmplK2J6Slpld25GbERFeVVWNE5SVi9n?=
 =?utf-8?B?ZXVYZE93TzNmSUNSK0phb0t3WWw5dnFtc1N3WFBsSWZLY1ltYlcwRVdMZGU1?=
 =?utf-8?B?VE1qdHJsYVFpYVpiSW55d2JqcGRpd0ZlUWJwb3JCVVQ4NVZNSVpvKy9rK0s4?=
 =?utf-8?B?Tk1uK2ZuU0RaWUlFSHFSQXlOWWtQd0VYUTZUZXFaS3ZsNlhSenM0Sk1ubU51?=
 =?utf-8?B?eEJzeHBjd0lUdm9Qb2pkVVN0RFRxOTZZWlphVWZ4V2xXVFllaHpaZTNyL2cw?=
 =?utf-8?B?aFRKZFpQR0pNOWtZTUx3V0xWKzdObjRhajBHRzgzU0RmQW5GWERORVZEQTJt?=
 =?utf-8?B?RzQwNVlWbUx0dGJ5dUtHZmZzY01VNldHb3l1a3NydkVEeHFpQ2xISmE4RHhC?=
 =?utf-8?B?VG5FZXFjbkkraytONUhyek8wLzRsQjhCRDBDT1FMdHd3Umw5WjJwVFBiaUZR?=
 =?utf-8?B?RFc3OHNsNlROL09LaE5MamFMNHVqeHQ4YjNPY2o3dVFJTHA0R283Mlc3aDJ0?=
 =?utf-8?B?djlWcUV0Nk1OUTZud2JtS2FyOUR1bDVBbFpRam41VU9KYVovajgwMDRUdTdP?=
 =?utf-8?B?NVgyYmtjNnordmxpVzBFZzhWNk0yWFE0eEF6RWFlWE8veGtQeGJGcThxaEdu?=
 =?utf-8?B?UlR4bVlkRE5pNmpTVENpb1h4QW1nS2tCbHhQNTdMcVFKeitmUHNhb2xwcGcr?=
 =?utf-8?B?NDcwei94eGpQdlJjaW4zbW1EOWlHbGx3TGNISTR4WkdqVEdIZ21XY3ExcVhS?=
 =?utf-8?B?UW55bXRydXVDUEpkTHNJcG9WdnpxTmk5a0h3Y0xGRnNLcy9XTlg0cSsrYlNQ?=
 =?utf-8?B?VjdYUXNqekJPUFNxYUxsSWVQdlR5SVJTVlN2YXByRVB4K01wK1d1M1FhdVRv?=
 =?utf-8?B?d2hDSnFlOGpIV0Q1TDVxWVI0RExoRE5lUmlldFhjVVBEd0VkY0U0T1k5eXg0?=
 =?utf-8?B?YkpINXM5R2dhVVBRMGpFQVBiWUNXTXBjNktQTDZyWWpPS21MRno2SkxxcXdB?=
 =?utf-8?B?UGwvVjlrcERuNm1nK1Z5L0RnT2VTajRiWWVkWkxoUHNSdnpQMy9PaHFSTW5J?=
 =?utf-8?B?Vi9DWW41Ym1nPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6F366CEE971F6479F7E4DA63373F485@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB10911
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	49d63c68-7461-451c-fd87-08dd9e93302f
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|36860700013|82310400026|1800799024|14060799003|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?T042MUw4Y0ZPTmFyK0Jmcm9NNnBpby9vaCtpaDRyRG1IZ2hkOFNLWmZUMGhI?=
 =?utf-8?B?cmlBWDA4Qkh2QUF0Tlp4VjN1dEk1bG1NdENRSUVMNEFZenp3NTBwb21LNnFQ?=
 =?utf-8?B?c1cvU0JEcWhuVGFqU291azR5TktEUlVwR244T3pOOHdtb2FhN09BZjZpMkM1?=
 =?utf-8?B?YUFoUUdGeFJUSnUvZnk5YVhicTVXa2ZnNzNTbjVSQ0wxN2RSR1NQLzFVWHVX?=
 =?utf-8?B?TTNURXFMZ2szZVZHbXh4QkliOWRNamswYUVhZlFheWZNNTJTZmhvdDRjdFh3?=
 =?utf-8?B?QVpIWkoxTDRDSHdtbmNlOHA4UHBuczZ5QlozSFhTTmk2bHliYmxQaFlQMFY2?=
 =?utf-8?B?QytZcDk5TzlUWU5RYWU5NFAvL2VnZjVJMDdkQWhETVBBV1RPODFDNmJBRmVL?=
 =?utf-8?B?L2orbGVydTNFdk51QkxrVExMc0l3RHBtOEtqYUpPR3JENUo2WmVBbHBkdk1H?=
 =?utf-8?B?aEJobG01eG1nWnY5ajFpMGlzczJod3JIMklXenVjOHRZekJ4NkM1MzdWb3g0?=
 =?utf-8?B?L3hGSTM2SzdwS3B6Ukx5OWdDaW9wTTJPcUFaKytvbmc4ZmxRWkhUcVY2K25R?=
 =?utf-8?B?ZnhmU3ZFRnVtYUQwSHRMQ3ZPcWtiYlM1UXhVRmNTNDR2QS80L2Z2RjZNdHBw?=
 =?utf-8?B?NWdGTUR3bm95Zld6VHh2ejNVSXkwakhLWTE3bjhVdTMybnkrdFE0MjZDa05N?=
 =?utf-8?B?UTgwV3JXR3NvVzVqTWhKRVlHTEZ4ZkhralJwelFWeklvaGxTWFpoYlJOM1R5?=
 =?utf-8?B?bmdvckFBQ2lSME1NNmdSUjA4U3V3TmgwTnNvVVVBTWlNWThZSzR0RXRzZEoy?=
 =?utf-8?B?RGNrdXRhNEFrd25iUU4zaUJ3eFR4WVVxenVBdEc5dGFxc3Qyc3BmMEE4OUdV?=
 =?utf-8?B?R0RCRVZBbEZoOXk5bDgxNmVibmthenVwK3RUWlZYN0tjanF4blN6M1Z5UHNU?=
 =?utf-8?B?T29IUWxEVG1hVWRlci9lWDA0Z0dqaWE5aTM5aDU0bnNjbmNUaWdONklXay9r?=
 =?utf-8?B?K2VRRkRJaDdOaGdvSVBXejVLQ1BnN1YvbDBxZTIwNnRLVDF2QXk2TTY5YWdr?=
 =?utf-8?B?Z3FBT3dHdTV3ZkRXT3VIRjkxNkdTYW5rYVdQOGM2TWV6WmxBdG55S3BmOHB0?=
 =?utf-8?B?Zm9kTGx1TGo4SU5sNGJvZ1ZvUFBHWjhlRStFamVOaG1GVkpidE9PcXZuZnNr?=
 =?utf-8?B?c3ZYOVppUXpndkNYRHpLSStMVkZROTI5NzJEUVNqSUFxeXk3azlsZW52ZUly?=
 =?utf-8?B?S2FHRVQ3WWxzNVlYQkZ6UnlEamFmRFdYQVE2UjlVYzZSUjJvOU1UNitxSDJM?=
 =?utf-8?B?ckhoTjQ5YVp0bjYyTDE4WFJCZHJMYkFpRzJodkI3S3FIRVNCV011N083ZmZk?=
 =?utf-8?B?NzB5TWM5M0YxVXc5enlFKzAzL2lKalRVS1hwY016ZG9mNWxuRzBpZWUzT2tz?=
 =?utf-8?B?NW1kWjNNakQ5aGhJem5mQzdZZUdWNGNCU08xajF4cXJMK1RmT0wraEVzQ21z?=
 =?utf-8?B?R0RUVENkdGlnRGgyYS9INmZueFhkaTRGOWsveGFzajIyNTR0MUY0Nlh0U1VH?=
 =?utf-8?B?Vzh5ckJNNnVwM3dRL3EvQXJRdmpvUHdwb25nakF3YWkxcE9YQ0pZRnMyaTE4?=
 =?utf-8?B?VlE2ODZwS2hSNGc1aW1ZZm1IZ3NWdXFSdVFKbnlNMGx3Vi9tdzFNbjJxSVJP?=
 =?utf-8?B?M0ltWmpYaDdkUHJTcmpSd2tqcUh3UmRHNTgvRkswSmg1aDJhUjFveWJPK1lq?=
 =?utf-8?B?dFhhekgzU0RZVVRhUSsydFQxZmhnY2UwNTdNTDVJUGVidHFBaXdTVXdIeUx6?=
 =?utf-8?B?ZGJUc0I0Zjloc3BEeDd4ODk2QmRyZTB2VkV0clhMaklQcGoySW8wS2pHdWJK?=
 =?utf-8?B?WGVZL2xEbnNSaGd1bGprUUZadFN2S1hGanFqc3BuVkxtV1hiMUlnUE9RNFIy?=
 =?utf-8?B?QkFzMUZzZ1RSN0dkcVllWWJLSDR6dEtUcEFsUkVXRzRPWGp1UVZuU0VFYW9o?=
 =?utf-8?B?M2gyUXdiMHc4QlBRYjJ5VExERldOMVRjYnFvTEk2d3BSUEVtVEZiSXFYZGMy?=
 =?utf-8?Q?WeWzqg?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(82310400026)(1800799024)(14060799003)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 09:29:09.0323
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 758152c7-00c8-4624-2768-08dd9e9343c2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000041.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 09:29:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217406

DQoNCj4gT24gMjEgTWF5IDIwMjUsIGF0IDA3OjE5LCBLaGVtIFJhaiB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8cmFqLmtoZW09Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdy
b3RlOg0KPiANCj4gV2UgYWRkIEZJUk1XQVJFX0RJUiB2aWEgQ0ZMQUdTIHVzaW5nIGVzY2FwZXMg
Zm9yIHN0cmluZyBhbmQgY2xhbmcNCj4gb3B0aW9uIHBhcnNlciBmbGFncyBpdA0KPiANCj4gPGNv
bW1hbmQgbGluZT46NDoyMzogd2FybmluZzogbWlzc2luZyB0ZXJtaW5hdGluZyAnIicgY2hhcmFj
dGVyIFstV2ludmFsaWQtcHAtdG9rZW5dDQo+ICAgIDQgfCAjZGVmaW5lIEZJUk1XQVJFX0RJUiBc
Ii91c3IvbGliL2Zpcm13YXJlXCINCj4gICAgICB8ICAgICAgICAgICAgICAgICAgICAgICBeDQo+
IA0KPiBlbWl0dGluZyB0aGlzIHdhcm5pbmcgZHVyaW5nIGNvbmZpZ3VyZSBtZWFucyBzb21lIHRl
c3RzIGZhaWwgd3JvbmdseS4gZS5nLg0KPiB0ZXN0IGZvciBlbmFibGUgLWZQSUMgLURQSUMsIHdo
aWNoIHJlc3VsdHMgaW4gdGV4dHJlbHMgaW4gbGliYmJsdWV0b290aC5zbw0KPiANCj4gVGhpcyB3
YXJuaW5nIGNhbiBiZSBkaXNhYmxlZCwgdGhlIHN0cmluZyBpcyBjb3JyZWN0bHkgcGFzc2VkIHRv
IHNvdXJjZXMgaW4NCj4gdGhlIGVuZCwgc28gaXRzIHNwdXJpb3VzDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPg0KPiAtLS0NCj4gbWV0YS9yZWNpcGVz
LWNvbm5lY3Rpdml0eS9ibHVlejUvYmx1ZXo1LmluYyB8IDEgKw0KPiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykNCj4gDQo+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2JsdWV6NS9ibHVlejUuaW5jIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9ibHVlejUv
Ymx1ZXo1LmluYw0KPiBpbmRleCA3YmFlOTY4MDk0ZjJhMjcyYzRkZWZmNzQxNmRiZDEyMDg1NDll
NmNlLi41ODM1NjYyZjdhNjNhMjM5MTVlYzRhZjk0NTk3ZWM0YTYxNGE0NjQwIDEwMDY0NA0KPiAt
LS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejUuaW5jDQo+ICsrKyBi
L21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS5pbmMNCj4gQEAgLTg0LDYg
Kzg0LDcgQEAgRVhUUkFfT0VDT05GID0gIlwNCj4gIg0KPiANCj4gQ0ZMQUdTICs9ICItREZJUk1X
QVJFX0RJUj1cXCIke25vbmFyY2hfYmFzZV9saWJkaXJ9L2Zpcm13YXJlXFwiIg0KPiArQ0ZMQUdT
OmFwcGVuZDp0b29sY2hhaW4tY2xhbmcgPSAiIC1Xbm8taW52YWxpZC1wcC10b2tlbuKAnQ0KDQpX
b3VsZG7igJl0IGl0IGJlIG5lYXRlciB0byBjaGFuZ2UgdGhlIGxpbmUgYWJvdmUgdG86DQoNCkNG
TEFHUyArPSAiLURGSVJNV0FSRV9ESVI9IiR7bm9uYXJjaF9iYXNlX2xpYmRpcn0vZmlybXdhcmXi
gJ0iDQoNCkJpdGJha2XigJlzIHBhcnNlciBpcyBjcmF6eSBhbmQgc3R1ZmYgbGlrZSB0aGF0IHdv
cmtzLg0KDQpSb3Nz

