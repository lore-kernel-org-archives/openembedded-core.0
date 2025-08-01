Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E10C87FCB
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 12:59:38 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.59])
 by mx.groups.io with SMTP id smtpd.web11.86810.1754053176343280402
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 05:59:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Nk6ArhI/;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Nk6ArhI/;
 spf=pass (domain: arm.com, ip: 52.101.70.59, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=cIH/7P6/D73LBcVNrDuHgFN2i7edrakgU2unkAR5BjN8JcYaAG/TAd4hJSC8QQDmLgyE+eMRubrpgOh9600xMFdgVFngJ0zS0UQMUyVuHGdooUTCtd5u3cG7YpFCkxB55gj6BSIansE0coAoyRhRseNhlb5aX9BR+KN9PgSmmMdxo8N9UhMGs2811Z8kglu9SW9O6XxdI3zfGfh4T6lzwoYUt+Oe2TkLBvsf7u44ngFXhX932tg833jLwT78SjL2HmnSdrWKmJfTNLVCJDIy8u0xIbwZ4HDjm/RQJ3JvpzZYsw/qgUhB/OT+6vYUqbfV9pCkQqoscauO4jaAMMe58Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iix1n+3/79UQrCYvyexJEJFL1LWELX3fQbWuITYUMP0=;
 b=G624weTfewcqIb4EzMdzwGNbKP64RlCMr7cWVSHVqisHhfKizhBXoRyb0CHiolo8szpbJ82bK5TDhmaq7BW8B2qHkiCNRAbOqvgyPU00Kka6S9zpmdbOpKLUeXle5Pna9trq2s3Uwiq4UC+MyjQvZuiZ6ljZxwZu0ozZIL3OFaUrXDyBUCmUO7NDAETrLYZZW738lYDIDHaeJ9JsmzmWtig8yr/nRTnmV6SOQUuGN2sY9rbLwfeP5ZXEYAyEmdSzPtNXAVd4/P98oKvwHsczlpO/gNj1xYQzF5PAS9kdM7cCdng2fBiS5XOVPXE6z6y7u6ey2OLJJ7pQd1oojJcHPg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iix1n+3/79UQrCYvyexJEJFL1LWELX3fQbWuITYUMP0=;
 b=Nk6ArhI/oLoZj2CXija+u6DGOr38MDSBcTizwGe0dJLZ8kYt1T3UssfjpCocvjnCPK4yc+BbsjN4CBi1xGuj7CmoS6PEQberLpLlbFBpxEcaGjuytvyoJdP7/sT0Nb3Dg5CRhcCbN4zH6lj/FJHrMGePdI2uvefwXG6G6Lp1e+4=
Received: from CWXP123CA0009.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:73::21)
 by AS8PR08MB6005.eurprd08.prod.outlook.com (2603:10a6:20b:298::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Fri, 1 Aug
 2025 12:59:31 +0000
Received: from AMS0EPF00000198.eurprd05.prod.outlook.com
 (2603:10a6:401:73:cafe::5c) by CWXP123CA0009.outlook.office365.com
 (2603:10a6:401:73::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.16 via Frontend Transport; Fri,
 1 Aug 2025 12:59:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000198.mail.protection.outlook.com (10.167.16.244) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.8
 via Frontend Transport; Fri, 1 Aug 2025 12:59:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D4eLXTwqEhMPg9G5Wr2q1yGGfWx7PXDckc8gFKHhbANlXWyNyx7oIDOB+06WfNKbml1VA8qtNLag53quWKc/9tnEw5GAzBu8BIrlh+IFiaksHjdIBxwgtcAcMorTaq44l+jblhc8TdaPK6RxfnLfQj+Ad7abySf1QUqNNrkDlL1K66s5HMiW4MZjmBHIz3+nOgquUcCaI8l8xjDIvMHaCGEliCUqaeYHZwWzl8R+orDmce9/0Bk0InXfdDQwVnkZZyCKNO39J09BNBNtG2sCcJauLI3laTCLUB7WNGa9ps8vXrvy3MC6JqaPG6IlPCRlRwAKGtUvha9KJbcJSW92jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iix1n+3/79UQrCYvyexJEJFL1LWELX3fQbWuITYUMP0=;
 b=azc0TSZOgYLIu1GmwjHoyqVDTXmDCOXIyUMN/Z5yoYIURAZ1WnoULk8Val29j7/PG0V9/wp1aWE33M5kSLEHMyW3c1tdcQuyIITPAhvu15KKomjLBpslP80DRdakq6c7ehq2Rw0k4X4c6obzO8wx9Qa2QwVqlKxg0IWoK1m2seBvtPQJ2mPBEMaPou4dB5DGjpazww8jkZzTIaIWHWlpunPtaQIdDeEhuXpRGhgrYODnrT1jcqrnWd5wIr1uXQiA1hLY3fgL7fhjAp/DHTZhJS1E+OO9/YyO0Kivp07qtBvKwW0OgFz9ko4+sy+qiqAdKRZkJps0Roi1EBFfb1AM0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iix1n+3/79UQrCYvyexJEJFL1LWELX3fQbWuITYUMP0=;
 b=Nk6ArhI/oLoZj2CXija+u6DGOr38MDSBcTizwGe0dJLZ8kYt1T3UssfjpCocvjnCPK4yc+BbsjN4CBi1xGuj7CmoS6PEQberLpLlbFBpxEcaGjuytvyoJdP7/sT0Nb3Dg5CRhcCbN4zH6lj/FJHrMGePdI2uvefwXG6G6Lp1e+4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB8437.eurprd08.prod.outlook.com (2603:10a6:150:c3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.13; Fri, 1 Aug
 2025 12:58:54 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8989.015; Fri, 1 Aug 2025
 12:58:54 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libclc: Set LDFLAGS to BUILD_LDFLAGS in
 do_build_prepare_builtins
Thread-Topic: [PATCH] libclc: Set LDFLAGS to BUILD_LDFLAGS in
 do_build_prepare_builtins
Thread-Index: AQHcARm8uPZEVgzV9E2xpt2MQ2bZ+rRNxdIA
Date: Fri, 1 Aug 2025 12:58:54 +0000
Message-ID: <1CB5D038-8F5F-4FE8-88F6-602717B1657B@arm.com>
References: <20250730061807.1642753-1-raj.khem@gmail.com>
In-Reply-To: <20250730061807.1642753-1-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.600.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB8437:EE_|AMS0EPF00000198:EE_|AS8PR08MB6005:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dc16525-5270-47dc-5705-08ddd0fb4153
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?ZHZxeEhhc1pPMHJFQVU0VGxhMTVwNVNOV3lBTGpBTXdYcW5hRjZCSGR1YitJ?=
 =?utf-8?B?d1hCUTB4MzV6aWIvOFlrTS92bFJSTGlLTXlSN0xKRTBRYlgvMXVYcU8yN0N5?=
 =?utf-8?B?Y3NuTE5JRWs1ZFV5bDJzb0NnbkRxUEYxZU5qR1BuTktLNTl2czlTYVBFTmdq?=
 =?utf-8?B?NDM1ZllDODFZK1ZsVFVqYlgzRTdoS29JaWNIRC9SeXlhV0hGaHdNK1RUWWdv?=
 =?utf-8?B?d2JIR1B1TjlQNmpmbjBvdUNFUU1MUFV6SnJqUFZiYTBLVzBnVGpQWWpjODZn?=
 =?utf-8?B?bFI3aWtsbjJqd1l3MU5GdVgwdnhqb0RwWkdIQkdGSWk3UlRsOXhqQ2sxcmFC?=
 =?utf-8?B?YzBDWDd3Z2tJUGZtbWJ1SllPZ0lkMytJYytQdEZ3a1R2SkozNzlCTXdxaUVT?=
 =?utf-8?B?N3AyZE5aY21JS2ZTZ2VlVEgrTGZkVlAwbDRSM0k1bDRIYUFiVkp0WnArUzIz?=
 =?utf-8?B?YTkyd3BVaHFXTFFyMzVqVkV5bnRqWTZQa1BtcExGVXR4WitlZVRpQkkvZzhK?=
 =?utf-8?B?R2krOFRRRjJEZkpxdlpOeFVyTU5wUnkxd0I3UTZqUWR3bDAzRVJNNE16Nlp0?=
 =?utf-8?B?N0lrQWtDZmxnOXRwZFV0SkU1VUExb294T3FVMXcvdWR5SVFyTHhsd2tQaFpt?=
 =?utf-8?B?KzFFK2J6NVNrS0M1STQyRER4NEdRT1ZweW9IQW5Jc3RRVnZMeTY4dDJBQkkv?=
 =?utf-8?B?d09wMFNBNXpyb0pna0VWRXJLQWJVZ0NtQU10YVdRdTlBRHMyYnM3VWlFNE1Z?=
 =?utf-8?B?MGh0TFluTFd3QkNLaURFOFA4VmRFQ1NJV1pCVkJFZGk1RVBUUWttaWFGY0dQ?=
 =?utf-8?B?TnZ6UXpvV0VvZ09aU2dGOFRuZ29IK0w3U0RQL2xiU1Rxa2FWdlpGcmJOd2tF?=
 =?utf-8?B?SW9hTGRIbkN1ckNPNmhxbGJzNXZNbUR4b0cxdVBqcUpkZ0dlbXAwM2VmQmhN?=
 =?utf-8?B?bU1LZHZrTU53VTZtS0h4V3h5aFFRaHQyQmljQnJLZGJTQy9JQ1VPRTY4NWcy?=
 =?utf-8?B?T3EyTHUyV3RWTVBLRmt3TlVhYzFYeVhYWlhNdFFBR3VCUDY4dDVrZW5MVHI5?=
 =?utf-8?B?ZDNKR3lhSEZSM3pqeG84aVlDbStMVGExUUtOYlA0MkoxL1ptVHZyRURQQjZm?=
 =?utf-8?B?bW93ZlZvMmJ0ZXIyelZ0SkR6dnBHSEJRVWFBbUlMZVQzT0c1SjU5WUN2cGMy?=
 =?utf-8?B?M09nV2V2d1drQmRFdU9TbExLbjVrTXBQREpwRDljNWlTd3RXQktGdE1kTnZr?=
 =?utf-8?B?OEFRTFgvVCtxVzhUajVEMldiS0pKeTRIVzhFeTFtZXdvU1JkZWh5UnB4dnlK?=
 =?utf-8?B?bXdkL2xEMWZEamNPd2YxM2pDbGlYZDRiWXl4MFc4aFFHWk83WllwOThFUDFx?=
 =?utf-8?B?amt5bnluZlJDRmd0b1F2WlMyYnFLRzd0YlFEalRodjVpMlVXY25sSXY0Z1M3?=
 =?utf-8?B?elFHa3dLQmxVN2lWWkEyVHBHRDRPa0JJN3g2Sk9BWXV1YkxDbW5KUG5LbHNY?=
 =?utf-8?B?MnBTMWVHUFFJRjdTMTl6dGVUazM3WGdzMlB2Wmt5Ny96RERpRW1jS2IzeVEz?=
 =?utf-8?B?QUVuZXh5UEJoS0RNZUdjbUhuVzYyTTdSL1hZWW5lT2dyWFYvYTliVEpEK3dr?=
 =?utf-8?B?VkhRWmpWRUpmNU1HRTRkbkpEbVZ4cU5zbWhyZ1A3LzVPcGh5Z0tmSStLMDZn?=
 =?utf-8?B?VDNJcXQvaXFtN2FzWHk5eXZEYlcrMnFtZFdvaGJNMFJubGZZV3lFVFE2NjFu?=
 =?utf-8?B?eXRKVW1KV3VEWlMrdGpxUWZ6emt4OEdvUmltUW1RUWIxcXJ2SjVzOVV1Rkcv?=
 =?utf-8?B?UmR3WC9pZXBxa2h3Ung0aWpuSkxpMWhOUUlQZHgwRkY5SnBwTUhhQmhCanM1?=
 =?utf-8?B?citGY3NiYWZFTWpFMmVlL053REw0M1ZJb2NsTVdMZXZ4aXVKR1FJK05ad3ZQ?=
 =?utf-8?B?WE4rVVJDRUFqbjAwOUpmWkVac0kzS1M2UkNYdXlxOElHNFBZTDh0eThyVnpT?=
 =?utf-8?B?SDg1T1NPb21BPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6FE040907FE3B846A2B18EAA11393A6F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8437
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000198.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f90ae752-d4f2-402c-41c7-08ddd0fb2be3
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|35042699022|14060799003|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c0QyNUtNQ0s1c3duY04waG5OMEkyU2tlb2ltNTVUOGhxeHJ0LzNpejJSakxr?=
 =?utf-8?B?SDEwbzhQa0JjeDdqc1BhRCtlTWMveWZiKzZMZ3lGc28wWDBiS0VEM0NVNVVn?=
 =?utf-8?B?ZnZ5dlBCOGZ5MjBHZlRPZlhMUTJlVlVWSHZjNk9wSmNubGVreWVzUlZFTVps?=
 =?utf-8?B?RXlGYkZBSmpwdStweDN2WTA0QnprZldydGpxTk9zd3phUFVQWTlDdE03K1Av?=
 =?utf-8?B?Zm8zS2VtY3JVajRHN1JPc3pjdTc4bFBmeGdOSTRZRXMyRnVsTXJKbldhN2xh?=
 =?utf-8?B?aHpka2ZOd1RDUkRjY05yR1hDek14bnZzM0lRbG0zUk44Y3B4eERTa250N3dC?=
 =?utf-8?B?QTRuMmRIZ2ZUMExneE9KRXFIV000WjM2U1FYYnVYa1VSQ3BhNjl3bFMrZlV1?=
 =?utf-8?B?eWRXRWhOTXNQUWdvTkhXZVdET0RXdUVvSGFxVmZBbVE3b2VjOVJlaEI4dnFY?=
 =?utf-8?B?eC84REtBNURXVHI0TDB1MlByd3g0MVNwa2NpdndQU01EZEgvamtiSXcvbzZV?=
 =?utf-8?B?TnZTZXdOMG9xdDJIaVBxWFBFclFmZ3BjVHpmTTRSOWM5cVhSS1BsQmZINDJq?=
 =?utf-8?B?ekFJRmZVcmdZVFJjQXFENnJMK1ByQ2pSMWVOY3FZV0V5bUNXVUs2aEpjdXZN?=
 =?utf-8?B?UGNaNXB1LzlSU0JRU1VBRVBHVEoyYU1BZXdhczByZ2t3TVp1R2V5WUt2SHRU?=
 =?utf-8?B?ZzBERFBIcVpKM1BPOUwvZWJ4Nm4zVkQ5Y0xBRWFrLzVWMXYrUmNBOU1rT0JY?=
 =?utf-8?B?bjhLOEE0R2VibDJyckltcUFHb1NtUlFZcnNLMnNtS201cmxoQnFnRENUZEtN?=
 =?utf-8?B?QzNJaGJ6d2xkdW9OS1lFWWxvWm1hNnV6c0xTbmlYYmxQRjZEZy9XRVU2d1cx?=
 =?utf-8?B?clhjOUk3Y3NDMTBjazY0RkpyVGEwSG5DWHhpdG4rT2JwS1VuWGVGcHRRa28w?=
 =?utf-8?B?NWpZbUxjR01tdmh4cUJwUFZGUEJMUUVOUThiZVR0T3VuKzliUndYQVZXM1RV?=
 =?utf-8?B?QmxZTkkyU3Voc3ZWT2pURXJvTU5rL3BzejRHQzBNeVB5NlNWUzkxemhkUVk0?=
 =?utf-8?B?WWlsRE5IZHhhNTVuamd0L1podVB6UGhVaUJ2RnViYnVBVWdQQktyelQ2dEt1?=
 =?utf-8?B?eHlaekdQZ3hPdmdiamJlWnRhSTJ3S3NDZkhPTTVNeEhTa1JEdVBaU3ZzVTRG?=
 =?utf-8?B?dkZLbWVjSi9uRkRWYlVMcElVblF1emRSdnBpbkQydVNaaTdoTm5jUFZQV1hM?=
 =?utf-8?B?NFYrWGJYVkZzOXdFUTU2NlVHMENubGZybnZZOGhGdTRPT1dsYXJqdEx0QmhB?=
 =?utf-8?B?OVFlK2F0aXB5MVJuVEpvRmcyQlBvN1pwcXdwdi94WXZRREQxMWYvanlrbVVB?=
 =?utf-8?B?K0JSeVJ1YXhCZjFEcWJ6UEkxUk05NUNKMndEdWFUa0VwMGhGQjFFTkNFa2Fy?=
 =?utf-8?B?c1RPczFhbVdud3B0YVRKOVVDSXZDSFNHb09JK2RyZU15NlFvV2YrV1pjZGc0?=
 =?utf-8?B?cUd1dEY3SEV4alV5eStGb1lUaTRjMmhsUXBLYmVvVVdmQnJaRDFjZVBrT1dO?=
 =?utf-8?B?bUNDTFVXU1UyMEFyc2pwSWk2YnpEaXYrUE1ZTXdWUm5lTXJsRnJjQ092RnpQ?=
 =?utf-8?B?dGNSeGV2NmsyMEFXT0xtNHBlQzV0clh2MGRMK0FxamVEMXYvS3ZMQm9uUldZ?=
 =?utf-8?B?RVJVTDMxVHVITFR0UnJ5MnEySVRjSU5TclV6NThPVzdZeENjV3ppWkxQRlhM?=
 =?utf-8?B?R0szV3Y1VCs5b2NNQ05FeitKKzdvNDZNaWVPS28zZm4vZi9oWFVJUStiWU16?=
 =?utf-8?B?RUwvNktrbG9Yb2NUOCtTOFJCL1o0bzJJM2t0QjZoMnB3SWFtMEtlT1hDa0l2?=
 =?utf-8?B?RWRmNVgwNFhoTWZFalpGSFc2ZWVnb0FyNDk2VWwwQmg4RUR3elFINWVRMGxq?=
 =?utf-8?B?SktXLzdFc09wVTZYeldpc1l4YnJvQU05MG1GbkNVVFJJcnB0QldIMloybkhk?=
 =?utf-8?B?UFMzYWs5cnBCQkdxc3k0MlFiQUhKWHRUemVaZ2RPY1FxY1padkFMWXE3dVdL?=
 =?utf-8?Q?9YP0Cb?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(35042699022)(14060799003)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 12:59:30.7457
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dc16525-5270-47dc-5705-08ddd0fb4153
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000198.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6005
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 12:59:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221244

T24gMzAgSnVsIDIwMjUsIGF0IDA3OjE4LCBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPiB3
cm90ZToNCj4gDQo+IFRoaXMgZnVuY3Rpb24gaXMgY29tcGlsaW5nIGEgbmF0aXZlIGJpbmFyeSwg
aG93ZXZlciBpdHMgb3BlcmF0aW5nDQo+IGxhcmdlbHkgaW5zaWRlIGEgdGFyZ2V0IG9yIG5hdGl2
ZXNkayBzaGVsbCBlbnZpcm9ubWVudC4gSXQgZG9lcw0KPiB0cmlja3MgYnkgcGFzc2luZyB0b29s
Y2hhaW4tbmF0aXZlLmNtYWtlIHRvIHByb3ZpZGUgbmF0aXZlDQo+IG92ZXJyaWRlcyBmb3IgY21h
a2UsIHdoaWNoIHdvcmtzIGZvciBtb3N0IG9mIHZhcmlhYmxlcyBvZiBpbnRlcmVzdA0KPiBiZXNp
ZGVzIExERkxBR1MuIEluIHRoZSB0b29sY2hhaW4uY21ha2UgZmlsZXMgb24gT0Ugd2UgZG8gbm90
DQo+IG92ZXJyaWRlIExERkxBR1MgYnV0IGFwcGVuZCB0byBpdCB2aWEgQ01BS0VfQ1hYX0xJTktf
RkxBR1MgIG9yDQo+IENNQUtFX0NfTElOS19GTEFHUywgd2hpY2ggY2F1c2VzIHByb2JsZW1zIGJl
Y2F1c2UgTERGTEFHUyBmb3INCj4gbmF0aXZlc2RrIHdpbGwgY29udGFpbiAtLWR5bmFtaWMtbGlu
a2VyIG9wdGlvbiBwb2ludGluZyBpbnRvDQo+IG5hdGl2ZXNkayBzdHJpbmcgYW5kIHdoZW4gZG9p
bmcgdGFyZ2V0IGJ1aWxkIGl0IHdpbGwgdXNlIHRoZQ0KPiBMREZMQUdTIGZyb20gdGFyZ2V0IGVu
dmlyb25tZW50IHdoaWNoIG1pZ2h0IHdvcmsgaWYgaXQgZG9lcw0KPiBub3QgY29udGFpbiBjb25m
bGljdGluZyBmbGFncy4NCg0KSXMgdGhlIHByb2JsZW0gdGhhdCB0aGUgZW52aXJvbm1lbnQgY29u
dGFpbnMgdmFyaWFibGVzIGxpa2UgTERGTEFHUyB3aGljaCBhcmUgZm9yIHRoZSB0YXJnZXQsIGFu
ZCBjbWFrZSBpcyByZXNwZWN0aW5nIHRoZW0gd2hlbiB3ZeKAmXJlIGRvaW5nIGEgbmF0aXZlIGJ1
aWxkPw0KDQpQb3NzaWJseSwgb3VyIHRvb2xjaGFpbiBmaWxlcyBzaG91bGQgYmUgc2V0dGluZyBD
TUFLRV9TSEFSRURfTElOS0VSX0ZMQUdTX0lOSVQgdG8gdGhlIHZhcmlhYmxlcyBkb27igJl0IGdl
dCB1c2VkIGF0IGFsbC4gIEJ1dCB1bnRpbCB3ZSBjaGFuZ2UgdGhlIGNtYWtlIGNsYXNzLCBJIHdv
bmRlciBpZiB3ZSBzaG91bGQganVzdCBudWtlIHRoZSBlbnZpcm9ubWVudCB3aGVuIHJ1bm5pbmcg
Q01ha2UgYXMgdGhlcmXigJlzIG1vcmUgdmFyaWFibGVzIHRoYW4gTERGTEFHUyB0byBjYXVzZSB0
cm91YmxlPyBJIGNhbuKAmXQgcmVwbGljYXRlIHlvdXIgZmFpbHVyZSwgYnV0IHRoaXMgc2VlbXMg
dG8gd29yayBpbiBsaWJjbGM6DQoNCmRvX2J1aWxkX3ByZXBhcmVfYnVpbHRpbnMoKSB7DQogIGVu
diAtaSBQQVRIPSRQQVRIIGNtYWtlIOKApg0KDQpJ4oCZdmUganVzdCBzZW50IGEgcGF0Y2gsIGNh
biB5b3UgdGVzdCBpdD8NCg0KUm9zcw==

