Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC028C369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 10:31:54 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.62])
 by mx.groups.io with SMTP id smtpd.web10.36682.1745317911710079815
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 03:31:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=GK49q1LB;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=GK49q1LB;
 spf=pass (domain: arm.com, ip: 40.107.162.62, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vrcxScOyZNb3Yq93rN4ZUMRScLq2/Pzd2j2YPKUzetiUohshOE2hYKdNYr8AZ9hSjxB4+8vv1G87TX5X+UP/6Oo0t6CO8C5HaZzfVcX9iG14xNaRH4ehX+vDuJ/HMvRSoyPle7S3vhSPVbVmRhg0O7vLBi0EbvD8pkKu2jcNhe7Ik6I8l6429gJmPWvav1a0sRo72oQ40MP9ab1Yk2Dvtm5C2AmuulJIsloYz7gXAH0YMRc9PrveT5+z6BkbOqIv0uQCgCfSLmxW87zQJ2NP4oXhZdpMjIwcpseCRBDDOEVUi5CuT6ZtiZ9BSa9iHQGGIhKNMxpQycBuZErpaVmMpg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUqbjdt5BA1Fu2+jUp/QHnVQbcQtRm99Gs2nzeFto0s=;
 b=V/GD1T5CI5txbeQQcfxl2PxZWi3nPX8fUoGIjbF6z6JWBgL0M0Gr+joqipN5zF9JcbS4f8IeKcksbMqyFyx4iUqRL7dd2PfsObe0geqtrN6YcvxkP2UBIAkT93mA0llLgUYX/+L9AmGvOQAuDiCG7Pg8X6yrGDs5bSmhAkJxng1KQDMgntqHKdoxGQz5PaTnx6RbU2PBnCX8oo209o52l74Mxsk5tdG9HNkdi2yGJZ2YPh64Ec3aAfNhCM0dm1aedPE7RfwQkczUb+XKX++V0WSZk0FEasQGDomIBJVG84s9P62cbgrLze9eYlid+6nunyKCTqjyzrjsYO0c7JpcHA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUqbjdt5BA1Fu2+jUp/QHnVQbcQtRm99Gs2nzeFto0s=;
 b=GK49q1LB3NmKTMIq5utfN0RgO4Dszz4yIZAWeveog8Nq5u3WDtM4VlW9knoBgNpt3qJ2jWGmhLWazW8qDPpYaBB7tvG6HCZDTYmM8xgyEJtanaKK0S/f2jiX8JnL42h7Vgj6oh+O0tK9jRke0y+HsEED/pfN7rZ+JE+diVXDl7U=
Received: from AM0P190CA0009.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::19)
 by DU2PR08MB10038.eurprd08.prod.outlook.com (2603:10a6:10:49c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.34; Tue, 22 Apr
 2025 10:31:45 +0000
Received: from AMS0EPF00000191.eurprd05.prod.outlook.com
 (2603:10a6:208:190:cafe::82) by AM0P190CA0009.outlook.office365.com
 (2603:10a6:208:190::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.23 via Frontend Transport; Tue,
 22 Apr 2025 10:31:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000191.mail.protection.outlook.com (10.167.16.216) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Tue, 22 Apr 2025 10:31:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yDVqn0nptuSkiRDQzumHSZaxkOl8VVsZW3mFHVwO/tGmv8DE8KNLRfllJDkIuPpSVZ2uZDymJnLi7PcDBPn1jXsuxmuzHjvpPjRWiGfAfi6QzbwXhMR0MGY9rYCS5hABX2bfQ9u8UOjI+QhU9eP3j64zzV11uk/EzXel6i6qNWSXmutgvgTBOQbW1qk8lGKtSSbsbsIlXxv2fQbpxiVeeJYTCftiv4Kp79TFs/UlilWeBPXeGxtHL9+9083GIafyNHIMkUar7TXd2aewuy5DLXMOvue7Gnav0z6OKEnqEui9W0OyPNPnd9vXCeTHJBkHBHKxsiBhb2W8Twcbx/XyZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUqbjdt5BA1Fu2+jUp/QHnVQbcQtRm99Gs2nzeFto0s=;
 b=DtC4dsaX2qISozZYO3/62RD1mIbeGqEl0n/MHa7gqSnQQ8/fBoTHzZWotma8wfdyqMx2LXSefobBvbnP83nnx2wrifu+J887Z0gqeCCrFKTWd3F9FqeA8ZIbCu9yeaWJ2uTSwpfr37STvP+sX5xUrRIljFOgvs7tJdjRjYkaYf6hzlemiS5oM/M5CF6jORNS6/XTVOihVhUUovk5OCwsOvl7gfS6a1mnQTJwkFV6R/xYnpHCkLsFvCfqN9wontzg07JRf/zLuw6BLs5Lmy3xx7p96VzxGbVrcjuuBLoHf09SfQfRB8ytjAzTKaDU2+Unpp/olhaGhGVPySgMq7MLAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUqbjdt5BA1Fu2+jUp/QHnVQbcQtRm99Gs2nzeFto0s=;
 b=GK49q1LB3NmKTMIq5utfN0RgO4Dszz4yIZAWeveog8Nq5u3WDtM4VlW9knoBgNpt3qJ2jWGmhLWazW8qDPpYaBB7tvG6HCZDTYmM8xgyEJtanaKK0S/f2jiX8JnL42h7Vgj6oh+O0tK9jRke0y+HsEED/pfN7rZ+JE+diVXDl7U=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB9759.eurprd08.prod.outlook.com (2603:10a6:102:2ee::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Tue, 22 Apr
 2025 10:31:11 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 10:31:11 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Koen Kooi <koen.kooi@oss.qualcomm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] autoconf: upgrade to final 2.72 release
Thread-Topic: [OE-core] [PATCH] autoconf: upgrade to final 2.72 release
Thread-Index: AQHbr6v9uoiKvnuafEKeLa5ew4Fon7On+PMAgAdoGICAACLmgA==
Date: Tue, 22 Apr 2025 10:31:11 +0000
Message-ID: <37F2177C-81ED-44A2-83BA-6CF2EF04FC6E@arm.com>
References: <20250417151813.2295435-1-ross.burton@arm.com>
 <AB3E4ECA-B3F8-4221-9988-7606C0FF1C3C@arm.com>
 <F1487D3E-B2F6-46A6-AFA2-011D6F05FFCE@oss.qualcomm.com>
In-Reply-To: <F1487D3E-B2F6-46A6-AFA2-011D6F05FFCE@oss.qualcomm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB9759:EE_|AMS0EPF00000191:EE_|DU2PR08MB10038:EE_
X-MS-Office365-Filtering-Correlation-Id: f940dbbe-89b4-47a6-bfd4-08dd8188e140
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|10070799003|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?REtlZ3VBaDJ4ZnJzdXRraWRGaDlOYUZ2bTF0czZHVVdKc0loaDdpc1c5UjU3?=
 =?utf-8?B?RlBoYmU4cExERVhKalJBMTQ3bmYwTUVzQ1NIM284QWhmR0VoWEVhcE10Qi9E?=
 =?utf-8?B?dDV5U0lDV1Jkb3hBK3lrTzljUkUwS0crUCtDN2JrOWIvdHdKa0ZRMlRwZ0I2?=
 =?utf-8?B?aFA3RXJPRHpycEVHK1NtNWNhOFVGNWNpbGEwWk1UUEVKb3lCWExrUkdIdnJ1?=
 =?utf-8?B?ZG9QZW1UN3QzNldla3VqREo5K3lBN3VlZEF5WjBKOUZLeUJKS29iVXgzcThl?=
 =?utf-8?B?OHNzU24zZ1BmSFpVSFFDcGowOHZ1WFNwODREMkdNZXVJVEFKQnlCbVVTL0x2?=
 =?utf-8?B?VzNMU3I3Q0RjMHAveTNDZVpkemc3RDM0Skt1M1U0QkFhYm5rODkzZ1VKMU9B?=
 =?utf-8?B?Yk5GbVZOMFJsQmNrYkZOVGtmZjU2Ykt5dEoxeXgrRWpRWDR0TERPcFN0OFZU?=
 =?utf-8?B?VUlNbmlEM1ovOXROZXhTbzJjTEhOVXJDRmd2cGp0S3B5dXZJZVZEOUV0bjg1?=
 =?utf-8?B?SUpDRjJQY1dRTVdJMG4zVU96N0x5VjgwbytRN1E3L0Z3c2JjTWdERldHSGRC?=
 =?utf-8?B?a0hoUlJjQVl1cmp3RHg1UWpwM0YyeGJEbTdsMm5rVDVFKzdKekYvU3orZlR2?=
 =?utf-8?B?SWc2MTAxcE95RTNrcU5IRmM1UE8zT3ljdzVQall4QkhObEZtbjRSS0c4T3JN?=
 =?utf-8?B?ZWcxd0NPb2ZXdHRVSDlFaTlFek5Ielo2TWhBS20xVXBTR0ljcG43amQyWlhn?=
 =?utf-8?B?cUpLdU5zdHNnQURUazBKWExLZEZNUi84aERIVGpvSWJOYlhVbUozQ3ZrSkxE?=
 =?utf-8?B?KzBrbk9WSFQ5QkxvRkZwbzZPU0hNc2orYnp1R0JsN3NBK29LS0h0SHM2MHd1?=
 =?utf-8?B?NTU1QUhMZm5MWUcrZkxqS1JTRkpNc00rbDg2aDhTTVpGcTF3eDdIdzQxOVRr?=
 =?utf-8?B?ZnBYZWUzM1NyTjNKa1NSM1ZEMlIzRDdERi9ZWjl2ZlI3TGpMUlJUa2s4SzZ4?=
 =?utf-8?B?R1NXVnJ3VVNWMkU4eVNDbkFOU0ZuVlhBbVZXOEJjMDQ1S2pTQy83YWFGUTRI?=
 =?utf-8?B?M0ZOM2R4bjErL0xYUnA5NVFNdGl2SWkrem8zb0NSQ01LSlZzdmZIcHRrRWZ2?=
 =?utf-8?B?WVFjMk9FSy8xU1dkTXZhcE5wQ0UrQXRQQStIVXdldTRONkZDSGFtK1gzL2Nk?=
 =?utf-8?B?VExtbzlGWjI3WlllYW16MzRMWllmM1p1RDJaMTJvaDJMRnFUNFVnV1JxK3lT?=
 =?utf-8?B?M0FQSklncWVHYmova0cvclZDNnVpNHQrU1FRUnZ4OStYR282cWlaSENVZ2F6?=
 =?utf-8?B?cm50VXBMRGt3SEU2NSs0Ry82cENVKzNiNERidlRrSGErczFITkVxd3hCbmIw?=
 =?utf-8?B?alZUYjFjeTlXNXlMZUE0Qkc0TzJOT2taL2RicmVxVVJPdjFIUlE4b3M4ckE1?=
 =?utf-8?B?YnVEQ1dkM1plVjE5RXp3SW9GZGozaFdGb3hZZGZxOGswZ2tLeEFKOUtXVmpW?=
 =?utf-8?B?SUI3aFRnWldrd3hNRjVYRlZ3dnZoc2F1cG10emI1MFpIQldTdEc0UDNMb0FJ?=
 =?utf-8?B?TWF1TEQ4TGRMWG53Y3pDaFVuUUZEMjhxOWZ4SzBPbThmMG9wcXZsL1l1dEZO?=
 =?utf-8?B?K3ZXc0hSQUNGLzlwd2ZHaEtXWk55TGFJOWgrSG4xdGJiR1hxNWtHOWY3R0FJ?=
 =?utf-8?B?ZWFUYlZsZ0xCTWVIYkFOZEp6MWM2d2djMXFoZ3NhNjJEYWx4RERCZWJ4Q3hU?=
 =?utf-8?B?YkNiaVFvdXVKOUNjaHBBOWJsb09nRVpRZXRsU0pnOU9YaUtOb20wSjg5SDlw?=
 =?utf-8?B?MUJ5cWlsWHE4NUhEVFBPRkRsenZsTjFSb3IrRWIxeUtPM0M2NUszZTJZOWZ2?=
 =?utf-8?B?a0hjZy8vcmU1ZkVKU0c2TGdnVkFiL1VSODRZTjFqeVlVUFZqQ29NaVJ1WDBK?=
 =?utf-8?B?VnU0b1loV1VtaCtHRFREOVJGN2xwaVpNZUVZSEFIM2xzRm9tSEtKWkJ1VW1t?=
 =?utf-8?B?RFFUOGZIQldnPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C34BB4E50E0BB42AAF4171A43B20193@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9759
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fdd1587e-99c0-4009-d423-08dd8188cd5d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|35042699022|36860700013|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cW5ma3dlcS96OG1lV2lNZ2h2OG1SNm43US9IUFA5Z20wbkYraGEyQ2ZDV01r?=
 =?utf-8?B?VUdNNWxRTHhIdnk5aHRXY3ozakwxUGlYNVc5cE9kcWNSL3ZTa3lwT1o2N2l4?=
 =?utf-8?B?elJkN2ZFZ1J3ejdhemszYTRraHVNVTY2RHQraGs3U0VJTmZXRGJONXl2VFZj?=
 =?utf-8?B?UVFRMTdjRlhYSlZhbHBwYVM5Q3RtTmlHWmhCaThoS0w0cC9yRlNhN1dnQVUz?=
 =?utf-8?B?Ync0RlJ6YW5KdUZZdFcwY213Q3VZSHRmWU4rV3Rjb1kvZDhZNHpCcmJ5Nnc0?=
 =?utf-8?B?L01hRlJhZGxlTFBjQlpialhacUF6YUJIR0JUbFJMOSttZEgrMEprR3o2ZW5R?=
 =?utf-8?B?RWh0TWp2SHRaTW1UUFA0dlpiaCsrQm5tMmp2UHhCNkZOcWFVUVU5WFA4aWF0?=
 =?utf-8?B?UjBSazdpSCtLV3J5aGptSVdpd3NSSFdzblNKK1JoUlpia0FFZXBMeVBLVGs2?=
 =?utf-8?B?YlQ0Z0J3a0lLTGtPQ2w3TElVMGV4WHlIcnp6aWhuTEg5N2JsZDAvVVYxY3dI?=
 =?utf-8?B?TUhZOUdpZVhYd2hHZzBGYTY5aFlUU3hNS29OQWpLT3RzekhZQm56b3dET3Zp?=
 =?utf-8?B?NnV5TVFYdWUwaUthSlIvZzB3RjVRZHI0alFrc0NYUGhLR25GZ2s4S3hDQkp4?=
 =?utf-8?B?Z0JTamhML0hNNm1NY01abDJ3UkFnQ2VSalNDUTcvVENhdEFEUkloLy9GekNZ?=
 =?utf-8?B?WjBsNzNBeXVpV2xQYVMyQmlTS2FUYnkxMGhDYUppakJzWHZXZ3FqdHRSQjh5?=
 =?utf-8?B?Mk1LM0g4OE9aS2ZrN1JvVFBPckhQY1ZJK2dNRkk0NEhqWTk1cGZaY1FtMmtZ?=
 =?utf-8?B?Qk1qV0w5eVY5OCt6eWZ3c29WcGFzc0prVCsvU1FseGw3VUR0d2dIK0ttZGF4?=
 =?utf-8?B?OFNSU0RMTis2cmcra0ZIcDdrb1hUcUpHSTR2UFQ4eXY2NCtqQytkNGRNSldK?=
 =?utf-8?B?TE1OQnhGcnpFR1dUTXk4cTB2RjEzVDloR2FpVXNaa21WTFRMMDV2TXV6M3gw?=
 =?utf-8?B?T3hOUnFoQjY0bUxUUmduTks5RXdJTVFXSVdvODR6cUlkL0RNZFA0cEF2cXFS?=
 =?utf-8?B?bFBCWVNoVUpLYy9aTkVqbVpOR05tdmFXbWplSUd5U05oKzBBZEY1WjFKSzdC?=
 =?utf-8?B?c1U1MkxpNU8vYXJncjBZdkFVdE9rUDZhS2JqYVdFNGtSbTF1aEd5TStRdmdB?=
 =?utf-8?B?QjBycVl1TUc1MXdZa2pUeE55dmdGVk5NZE5ncFYvS0QvNXBzWWFVQmNZRWZK?=
 =?utf-8?B?YVRLb0RucnUyRFJ2dTcrQi95dlBKZjEwdDBFeXBId01YYjBCaU5LVXpPQ29u?=
 =?utf-8?B?UFNmUHRIazBWRDh2b1pmbG5GZVdWL25wM0xpa20vNGxVVWdaWm9VZTJ1N0lQ?=
 =?utf-8?B?T2lMTnUwUklOY281VXVWalRURTQrVXJ5Y1ZPY1pDcGFBdkptOFFrVk5YM1Nl?=
 =?utf-8?B?WUt5VEVlaE9SREpkU1h2cTFzV3huV0w5Ymx2ZHA4L3l5aSszMkJxMDlRN0NK?=
 =?utf-8?B?YklTYkFXM3VZZ25SNjI5czNIZnN0a1VCekkxRW1zQW9McEJkUWdxOFd0TEpI?=
 =?utf-8?B?V0pndVZ1c1hVb29uWFJyejZqd3BLeDZBOEQrejlRRXArTnlxeDhiZUpSWFY0?=
 =?utf-8?B?Vmsxb3dBT1U5WWlPTjFXSDg3Ump0Q2JHMVlvWmMvT1l2QitmcVo4L3hjOWx1?=
 =?utf-8?B?Z3ZlT0dkaml3QU9nbzNHZWwvSGhmZEtHU1d4aGhkOUdHbU9EV1ZFZ0M4SHpv?=
 =?utf-8?B?T285OFVEZDhNbTdaeFdFMHVNUW5TTVd0Um9aaG55VVNTb3RtY0dBUzFYa2pl?=
 =?utf-8?B?ZXR0RXBMa0NqdTdVcEhjUXdJa25BRU1mOVB0YWNRMGFYSHFoeC9EQnk0Rnp6?=
 =?utf-8?B?OGlvK2I1MFZmSllvNkJTYU1qREl6WnpVbGQ0Z3pQWXRDZDRpcFdTZDdvMFRm?=
 =?utf-8?B?emVuRjl4dExrS0JERzRXZElDRFhyQ2RmMXU3dHBqOWY5bTJ1blo5SG5zWUJP?=
 =?utf-8?B?L2JMZFI1S0lWY2xZaG1wTjlWNkZVc0xFeGlmYWFIcVNqWkdqcm9ZTHFTVjZW?=
 =?utf-8?Q?Lhwd2O?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(35042699022)(36860700013)(14060799003)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 10:31:45.0037
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f940dbbe-89b4-47a6-bfd4-08dd8188e140
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 10:31:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215198

T24gMjIgQXByIDIwMjUsIGF0IDA5OjI2LCBLb2VuIEtvb2kgPGtvZW4ua29vaUBvc3MucXVhbGNv
bW0uY29tPiB3cm90ZToNCj4gDQo+IEVSUk9SOiBhdXRvY29uZi0yLjcyLXIwIGRvX3BhY2thZ2Vk
YXRhOiBRQSBJc3N1ZTogUGFja2FnZSB2ZXJzaW9uIGZvciBwYWNrYWdlIGF1dG9jb25mLXNyYyB3
ZW50IGJhY2t3YXJkcyB3aGljaCB3b3VsZCBicmVhayBwYWNrYWdlIGZlZWRzIChmcm9tIDA6Mi43
MmUtcjAgdG8gMDoyLjcyLXIwKSBbdmVyc2lvbi1nb2luZy1iYWNrd2FyZHNdDQoNCkFyZ2gsIHll
YWgsIHdlIG5lZWQgYW4gZXBvY2jigKYNCg0KUm9zcw==

