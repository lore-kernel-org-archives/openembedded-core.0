Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40623D43361
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 14:01:35 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.54])
 by mx.groups.io with SMTP id smtpd.web11.72348.1730988088994390720
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Nov 2024 06:01:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=bNRotOMg;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=bNRotOMg;
 spf=pass (domain: arm.com, ip: 40.107.241.54, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Wm+8P3DjojfTiR11j47t3+qVrEOj83vLij3wVJAyclVWY64rvp/V1CGvffHiV7V4RJGc1nkFxF+YJ2lXu0/9LZ2BFHG3DLUdhmSU62maBZCWbtia4IFOGXg4Q4aThjGQRKeLFZUf6Mi075aDo9a8oooFTLBSyyIy+G0AI9jGIUQH+thNJQCjCniCo6RDpqNSzwmTjCqmlDVIWzISNCCmlzXSBdBkEOPNPCqmj46EBDAkIVR6BFXUtPg4ZAjWKJSqZ5PBOHv6yAN9JpGa1LuYKjO6eNBYsiJeJPs6Mk0FfXSvFhtWKL/a9XQhY3xF/icvVmQZ7dHFkDVxRiNaiNFKUw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7wzk41tasDkTO8Iah3CZeqqbkp+upHSmHFE7jruTQY=;
 b=Pl5WO3seTwzAwV9LIBHDb4dlEoE5bDVutwZsCfi7it6uQ3cFEjKBT4qlPW3IeltlHdsvSX1UaoqvDPBnR3jcD2gwUFp3QmPlyj6HOFfIvgvXetxQu2ApTnFWsFGcPlA98mKHBXxaacFfFje7SrGMlkUtyI+7iaEPQZTY93tVXtX1JtsYSJQnvGcUGX4zi8EUIISmWXxPPjeW1EM+16A3DB3qtIjT2c9Az+UFlVX0p0lq9zxCRrM0zRjIFdktEu4E6SKYODvFiIRaOj3V8D6UKqRxy2OU03qDIRxMkhZwPRWE+DUO48k4A1W8zjAg0AyT9lbvA/P4HDxGe8/xwrQgSw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7wzk41tasDkTO8Iah3CZeqqbkp+upHSmHFE7jruTQY=;
 b=bNRotOMgKgGxmHmBNKYkQiBq7O6c3zbxTu9PzwerbcULIf740VYG/iE4Ufg7fyI0tuNEvrNs9YMiy3iks8yf1y4MF8RH4Mi6ByM60DaExGgRdyY21tFTi0It0MCq1oqoY0Ck+/Dmebyq5GTvPRk1s1fIhtgJcpJmXTaercxp0aM=
Received: from AS8P189CA0012.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:31f::27)
 by AS2PR08MB9973.eurprd08.prod.outlook.com (2603:10a6:20b:641::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20; Thu, 7 Nov
 2024 14:01:24 +0000
Received: from AMS0EPF000001B5.eurprd05.prod.outlook.com
 (2603:10a6:20b:31f:cafe::f8) by AS8P189CA0012.outlook.office365.com
 (2603:10a6:20b:31f::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19 via Frontend
 Transport; Thu, 7 Nov 2024 14:01:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B5.mail.protection.outlook.com (10.167.16.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8137.17
 via Frontend Transport; Thu, 7 Nov 2024 14:01:23 +0000
Received: ("Tessian outbound 373849c2df5a:v490"); Thu, 07 Nov 2024 14:01:23 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0c48576ff8635c5e
X-TessianGatewayMetadata: trLcgvO+bLtqVvZy5GI+hiHd1R2I2rFz/YZZNsKcZRnslbSsap/U5fgR2rR5/us73Tv77MvYVu0lHK5SehbZTX7ABvkINoYPctYUkwcuoiMM6+1+6doTaPjuViQYqTv3K3nsy+1bSCv2E6d8I6HjBeF1c+KqkJbpxjZmYqmiH7w=
X-CR-MTA-TID: 64aa7808
Received: from L30419e9dd1d4.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 739426A8-0E49-4AF1-97C4-46B5321917B2.1;
	Thu, 07 Nov 2024 14:01:16 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L30419e9dd1d4.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 07 Nov 2024 14:01:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oLf52lHeSEuHLkA4j4/XOpvSNUpnSyF9PxdvOAc4MpOyp3vW3QQkiUJqDlepu1A1oAKIrQS06X2BE+vg9cbDPllNKgANZyvZtdjLFDADW9KEe/yciabYH16JLgPPuvpPFkrOH7Hknmhx7dwrVu6/DP7tR3cLpoTo7ZatL84xdrIPy/u4UbABjEIvygzDpU8iRjtVifSJlj/05Yd8cbYRfq67MvP8JsbzrxGSEfNV+Z4AeJk9COJpp3pxacvJhGOhNp23ItjYtPPgxwXde1BazmVYsLq2etidUVypbHzyZ51tx1r2c6bUsonKNd7j7Fo3afc2reCcIiOtrJf8eRndXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y7wzk41tasDkTO8Iah3CZeqqbkp+upHSmHFE7jruTQY=;
 b=S3KwcqzcZOtgxCD+4yuWbMMhH5+C6Kbtf/MSfEJwEzM+MxBLYFB8A4SdFiI3rLRFsTuc65at3W01GStEb57T1y8JsBMXTgZ/N1xL9zRoK8QYemkzwRuu8B4Kt1rnpxBV3LMoluzTjxSZOG1B/ilfREe1pnBL1bf4uwZqsbNfYzf8n4k3gjyY8Od7qH2UblY1AQ+auOu72wLqAEkOd8nwmp9Hpd2kAdDHaUpY7y7uSy3WXiTqxu5IIKNUffMGoYRwG8vpzMY1c1hRDO0UWQEY4ZPhDXo25zj3k1wNQOjhierjNnwoxKsLnFpWdNefR9EHCnVNw2j6FP0ZnYtzOWnD/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7wzk41tasDkTO8Iah3CZeqqbkp+upHSmHFE7jruTQY=;
 b=bNRotOMgKgGxmHmBNKYkQiBq7O6c3zbxTu9PzwerbcULIf740VYG/iE4Ufg7fyI0tuNEvrNs9YMiy3iks8yf1y4MF8RH4Mi6ByM60DaExGgRdyY21tFTi0It0MCq1oqoY0Ck+/Dmebyq5GTvPRk1s1fIhtgJcpJmXTaercxp0aM=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB9492.eurprd08.prod.outlook.com (2603:10a6:10:459::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 14:01:13 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8114.028; Thu, 7 Nov 2024
 14:01:13 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 4/4] local.conf.sample: use explicit
 IMAGE_FEATURES instead of debug-tweaks
Thread-Topic: [OE-core] [PATCH 4/4] local.conf.sample: use explicit
 IMAGE_FEATURES instead of debug-tweaks
Thread-Index: AQHbL7vjXxiQ6T0IF0SL+yhvM2RSArKq0PiAgAEKhQA=
Date: Thu, 7 Nov 2024 14:01:13 +0000
Message-ID: <45183D57-8CEA-4474-8505-4E05A298EE72@arm.com>
References: <20241105194857.3351281-1-ross.burton@arm.com>
 <20241105194857.3351281-4-ross.burton@arm.com>
 <DB5PR02MB10213018F3E6CE17160BFED11EF532@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: 
 <DB5PR02MB10213018F3E6CE17160BFED11EF532@DB5PR02MB10213.eurprd02.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB9492:EE_|AMS0EPF000001B5:EE_|AS2PR08MB9973:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fedc57f-1ad9-4762-e17c-08dcff34aa34
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?Vm0wTjc2dHV1WEtTTWJXa0FxSlBXV1I4UE0xRUlxWnZEK2tZMUJWVG1mM1JT?=
 =?utf-8?B?MWl0SmV5bDlxUTZSTlIvTnNWN0pvZjFudit1SlgzZUVhdVphV0dzR240RVIy?=
 =?utf-8?B?SkNIQjJsbzZtTnN4UUxkVUlrNzdERG9Wci95WGdDck1Ha216QVN6SDRZc29B?=
 =?utf-8?B?YjZ2cGJkWlRUeGQzc0NLbEhyZ2c0OTNrTmoyaGE1UGFkYTc2QW4rOUlCdmgy?=
 =?utf-8?B?V3BBcnYyTERueEp4SjlMVnZ2OE9zcUxTOXBZRlo0N1JUWDlRYmhEdWd1bHZ6?=
 =?utf-8?B?aEpNQ3lEbG1WZi9oUVJaamIybDN4bnNuM01uWllXUWhJMWVlaWdkYWZHUTRY?=
 =?utf-8?B?SnQ2OWgrUjNXK1hNNUhMM0dOdGVSTVJJdTBHdU5GVmhQUldrZGJLNVV0cUQw?=
 =?utf-8?B?OG1JZ2FjRDRyNXNQNGFaeEluelpveTl1enVkNmQwZ3BJdlBhYVZvWWl0VkV5?=
 =?utf-8?B?b0xzWDdTYnVrWk5qaStaMVFlN0VuTXA4OGovZytPQzU2TTlwTlV3T3luN1V5?=
 =?utf-8?B?eXRhOFM0bDNjU3QwOGtwaWhGcVVWOTBBRWdFbEV0Z3NpbnY1VUJRRWhRM1Fh?=
 =?utf-8?B?N1BCd0Z4MDBaWlYzZU9sNWVENHRPejFqc2paanRuc2R2S010ZGlmMDc2MWtu?=
 =?utf-8?B?TGdtaHpkRmV6M3NDcnhZMVBpUSs3bktRdzlnWWk0ZHhJLzRvN2FFUTJKS3Nx?=
 =?utf-8?B?OVJycXppWUZJZCtEb2FjZXp6aEt5dzNudmNQOFMyQ1FHb2p2RG45YjJ2UGlK?=
 =?utf-8?B?aEpOYlZ4b1RtYVp5cmRJU1pubGx3TFptM2JWZ2h5VlQ0UFNSZ2RhMDdwTmdB?=
 =?utf-8?B?R01xWVdqVnJiNXA2VzErNkJnblhVWGJXTDZ0Q016dFNQUVlEMUJhS0ViSEFQ?=
 =?utf-8?B?NnNQOExPUFVlczlIUm8rREQ3YWlvSFJ4SUYwNVNkbEJ3dTF4aEp0MGhwOXh2?=
 =?utf-8?B?YzUrVVNHbE0rVE5OTWU1bjc0TSs2Si9DSUFaSElPc0M3cWVXeTQwUURHYkty?=
 =?utf-8?B?YU9HbEdabTFoSmxCOFR1czIzK3JTdzlNc2dkb2hvWHErajUyVjhGMVpQSWJO?=
 =?utf-8?B?R1JkUHhaUzBWK0tCY3dXQ3ZhRngyZGdpUE52V1pPSmJFbml0ZDJUY1lsd0x0?=
 =?utf-8?B?MktHN281eXlCRWlUQUNMMThQT21NdmNUWi9aY2lORHRpNENBdTQvQ2VwWGRL?=
 =?utf-8?B?V1VldmdMdFVmeWMzaHFFck9BbGRaYmJDTEhCdkZJOVFyZk9Dc25EVkdtSHZT?=
 =?utf-8?B?elRnTE9WUHdqQ0JUZHN3NWkvME9RQUFiNEo3cmQvTWJEbk94dWdIVVJSYk5K?=
 =?utf-8?B?MlhCZHRCS3UrZDBnU3dlNG03U2ZtNUpXSHk1U2ZWNTZiT0l5b0pKc1dvWVRP?=
 =?utf-8?B?TUFUNm96MDJ4L0UvK3VlMUF2RTY2STBHVklCNjl5dkZjd1R2dGNhcWRhbHFx?=
 =?utf-8?B?b1I2ODhUQjdyci9hdGVjR0NERFFFeVkwNDk1anIyMTNCekxOMHg2dlJFcWdx?=
 =?utf-8?B?WDEzaFF6K1JnTVRwa0h2LzhlT1pYaE5MZzNIcjNUa2o4Tm9aSlZGVXNIQ0tp?=
 =?utf-8?B?NTBPdHFMeEh4d2dDWnJiR05kTDBvZ3Jiem5DRW9VMHZlaC9SOUFxWjY0blBT?=
 =?utf-8?B?L0NEUU5IOC9zM3N1bVp2cWpTSEx5N3dWRFpvWkpSVC9hRXN4dWpuYStKT1pU?=
 =?utf-8?B?UEppNFdnaHhmdUV3dUZwbWtCTDZDcGNlYVkrMmN1KzVFcVV4cTNpNllPZU0x?=
 =?utf-8?B?clhGZ3MwVUkwWDZBd2xhZURLY2o4eGloazE4RmE4QnUxZDFma0s3bExBTzJF?=
 =?utf-8?Q?QUi70duzw8OIHt0R/kw97xs578l5GQ61/NoDI=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F2B5717835A704A87138B05ED2021A9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9492
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001B5.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	ff997863-2171-469e-1c98-08dcff34a400
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|14060799003|82310400026|1800799024|35042699022|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U3MvaGRtRGdXVHJZVkpJaUtJWCtXL2JtdTdBbWpOOVF0Z2dOWDh0SUN6SjFR?=
 =?utf-8?B?UDNQVkw0UlNoM2xQQ2U1SmFIRzlPeXhHQ1VUZHBMdzNJQUJ5U2JnTUJmSjdy?=
 =?utf-8?B?MU5mcjdiQ2swMTcxU0V1VXpYNXo0YkVBTDMwbEV3NGQ5WitxdVc4cGZvWEdK?=
 =?utf-8?B?d1dPajNYTzJESGJxbUVEV2hwbGpvSDQwS0xsc3lyb3YxQ0ZpT2t3K0ZhbWhJ?=
 =?utf-8?B?dms0ZTFjVkJqdVlVRGQ2VlRDY0ZhcHNYb2phWjVVUm5LYW1pT1BUVkNLYkVa?=
 =?utf-8?B?KzFka0djQTJFa211dFA2blAvaG0weFlUby9XVmYzdTdxZnFBMnc5cFJrVjlu?=
 =?utf-8?B?cG5BQjBjcGZ5SEVobGF6Z3RRalp5SVpTOUtlVFR1RzVRV0JYbGpjVUt2M29C?=
 =?utf-8?B?WjhEVkYrTTIvYm1WZDdQWHd5MHpxSk5Ud0w2Vlp6UVhrdGltb09ISWZZaENw?=
 =?utf-8?B?akV2dnFlRGtmTUFZRnc2bWI5Q3dXanBwTHArc1U2SFdZOHhYS0FwUytxd3lt?=
 =?utf-8?B?QitiRVVnRDZHY3F4d2V2b0hFdGZFdGgwaXBubnNoYzI2d0hZYUk5cXUrTUdV?=
 =?utf-8?B?UnRKaXppTDFxYUVhTzhaTFFQWVhrNGh3K3U5NDRNYmZuQ3k3L2hHYVFocHc1?=
 =?utf-8?B?MnFNYWJ2ZDg4Vmp3K3lkUjlyeS9GTHlCWXp1T0w0bE5kWVA2aHh2cWtFekhx?=
 =?utf-8?B?OCtEMjRXN3VEa204MmZXU0hCbTYwRkRnSlhZMi91NVk3S2hyMHVJaW9HNkh2?=
 =?utf-8?B?VjBRUUNDZURMdTFNNXFNdTdFUDA1czNFRENmV2hXR295V3Z3YWhGVHZuK2lh?=
 =?utf-8?B?WW1rem9pWTViRmk5M09SYW5IbnJyL0pwUkpIOHA1S1Rja0hac3dZdFphZGl3?=
 =?utf-8?B?cU9jRnp6SFo0NnlIWm9XV3gwOEt1VlpGQzR0ZHk3Zm0vUHF6SERZa29TRHZY?=
 =?utf-8?B?MUVUdGt1RHNBWHdaOGY5bDcyNlhsL0RCZmVKRm5BK0YwdHJ4dEVPNFVoTWg5?=
 =?utf-8?B?alMvRWNCeWFGbDZZKzluNDRldEpSSG9IdzVDM2w0dUZwUG9RM1FkRU1JdWt4?=
 =?utf-8?B?cGZYaERZdjA0K0dFZ0xyUmFkSDhjcDdENHkwNDF0RjRSSVFJdFBnM3BmcGVN?=
 =?utf-8?B?M1VqaUtrdVFWVkZ0aWI3ZFRJRUk1MVBlMDdJZThZdUV1VFhoYTY2NlBtaHc0?=
 =?utf-8?B?akV5cHF3eDJYWGlza2lHZURrZEZRRDRnOGZEK21RZTQwSm9HakFkcVFFNG9P?=
 =?utf-8?B?VU15MTFBYVZ6ZzNYRjBySDR5SjVmUS83dlRQc2FsTGpWUnFSZC9SVEFOYWg0?=
 =?utf-8?B?MVgvMHVmWTh4czJvUGtRcElBRHdwaVVFcW5odytxWG04R0xLMEU5VTNKdnhC?=
 =?utf-8?B?NlVsWk13cGJBVkl0dXdXZERJTGtFOXFRT21PN1RGUEpaSFd2ZnNoS1p3bjla?=
 =?utf-8?B?OC9KdEtCUVJieVhOWHVHRW1kRmpwM2l1dlljUFNLMDdSNHcrbE10cFlubXE1?=
 =?utf-8?B?WFFaMHJSaTlhWUxLVUdwTmgrMmFJek9PR2M3dTFDdFRLNWtDNzBjR3Q1YzZ6?=
 =?utf-8?B?MnNCWlNUakhhZ1BIWHA5Z3FlT3d3UW45ZFh4UWI4dXMzeTN0MGJqeDJhem5o?=
 =?utf-8?B?MnYyRXJ1cDlSVG5qbEowZlRBblRRL3hDMlhnamFDUkdWUTl5djVmeDFPK2N2?=
 =?utf-8?B?SFRvS2h5ZFVpN1BhNDZiait1Sjd0dnN6SDJsOE5SWURHKzExNzV4SU44N3pj?=
 =?utf-8?B?NDR6eTBNVFpGVHZGcWRsWnJJUXVDL2ZPbC9YN3NqWnNEQUcra1ZGYmNaUzRL?=
 =?utf-8?B?Mi9TeWZkUDZ3ckxxMjhMNTVNN0VlQS81Y0p5dmwwOVZSNnVOeGt1ejdtbllB?=
 =?utf-8?B?U051N3AzT2hBL0x3VnloOG0rYmF6Z1RpMEtLZUxBZENVdlE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(82310400026)(1800799024)(35042699022)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 14:01:23.7961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fedc57f-1ad9-4762-e17c-08dcff34aa34
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9973
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 14:01:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206833

T24gNiBOb3YgMjAyNCwgYXQgMjI6MDcsIFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxl
cnN0ZWR0QGF4aXMuY29tPiB3cm90ZToNCj4gQSBmZXcgbGluZXMgYWJvdmUsIHN1aXRhYmxlIGZl
YXR1cmVzIHRvIHVzZSBpbiBFWFRSQV9JTUFHRV9GRUFUVVJFUyBhcmUgDQo+IGxpc3RlZC4gVGhp
cyBsaXN0IGluY2x1ZGVzIGRlYnVnLXR3ZWFrcywgYnV0IG5vbmUgb2YgdGhlIGZlYXR1cmVzIHRo
YXQgDQo+IHlvdSBub3cgc2V0IGFzIGRlZmF1bHQgYmVsb3figKYNCg0KVGhlIGNvbW1lbnQgaXMg
aW1wcm92ZWQgaW4gdGhlIGZvbGxvdy11cCBwYXRjaCBJIGp1c3QgcG9zdGVkLg0KDQpSb3Nz

