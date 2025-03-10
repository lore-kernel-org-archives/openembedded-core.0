Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23079C28B2E
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 12:40:57 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.60])
 by mx.groups.io with SMTP id smtpd.web11.36198.1741610448233762335
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 05:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=US9SGqRY;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=US9SGqRY;
 spf=pass (domain: arm.com, ip: 40.107.247.60, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=EJW08n4f8Z5CgdnDKZYjMHzQTuvcVBhgg9+RZNwhhyLsJ1gWrvX/xzCEtRgWRVoEle2RmmjW7T9g5iZOysUH05bW5Cdc08cItxL5xYuWX9f3L92Lh7ooTHNn3OIIIdK0r2oZCFdKh6/Df4Vffack50Iwp1tGzDqNurP4idSRrF4S7A9qdIHcLnQcdlIgKehdKvs0jcA0zIvHwbhUosp7/COa8dFAYLymbds+BQkr6pT8YO4GuiJ6k4L1DD4CNPeQydOofKnHB1zV1uo4fENwyHdOr78+HG1lnZAMyK+Y0i+E4bhMLC8OW4QP+fVAqjMaSWzUVUuP7JGrm8yN5VC14w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u4Y9/D2JTyN6dloiMdoLGPTB2DtLtuUfZTYS92TCnGo=;
 b=QpDHFWsaocZ4ENOFaSxbIc74b+MNDqssT1SuQY4fgJUW87oUfLzlPq+UnlONeO6ea91RD3qSLG4msOPxBW0mWfwrr99oUW8uz5RiMnB77bjo6tkiTArFRMTBJazv2fnCQ1qKcB5avQjTFrgnFcFmEbkY3Dl2LiPFzaSO9fT6/ShGQzHqH2Gjc3qiSfqSAwjSQoD+6s4y6VNDtBqz7dV3a+G4InmAuzWDwpE4OZDmh1ltXA3x2BNzR9RUJ2gGU09wZPZm09InZ31j0CvIxqvU5V5macRF01uuJS9OAszGzaPbQeoF33lZFd6cazmbyHD9U3E1Qik6MVMkZ/cgrIlw/g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4Y9/D2JTyN6dloiMdoLGPTB2DtLtuUfZTYS92TCnGo=;
 b=US9SGqRYlF5JteELLe4FtO0MBZQQBvZ8FSybW9DiYQ/KZ8S6I6oRau8RKlxp7vuWwCpv3trQYO90ZF61/ynQpylJHmfymGAAjxZIO0KS6IbQh7jE/tRT7JrygW0hPOjDP1QaIH2BwJLr5z8XptNt+2dkL0x2ryXGjAvED7hAqJA=
Received: from AS4P195CA0051.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::17)
 by AS1PR08MB7426.eurprd08.prod.outlook.com (2603:10a6:20b:4c5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 10 Mar
 2025 12:40:44 +0000
Received: from AMS0EPF000001B7.eurprd05.prod.outlook.com
 (2603:10a6:20b:65a:cafe::24) by AS4P195CA0051.outlook.office365.com
 (2603:10a6:20b:65a::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Mon,
 10 Mar 2025 12:40:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001B7.mail.protection.outlook.com (10.167.16.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Mon, 10 Mar 2025 12:40:44 +0000
Received: ("Tessian outbound 93a06e49d4fd:v585"); Mon, 10 Mar 2025 12:40:43 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 44abe031f4901486
X-TessianGatewayMetadata: oW5XXNOykklTpxnzQfQypXeN1vHgGCBlS770A7Hskoy9kS18LB6Cc9wfhzGC7BxFbppG1WEIewDTQXFwCDjTpzeiZr9yQZ8H0FD06xdoHNj6LzSwhzgPBCfNDKQRYCj70RdPFehIfMn1TGPD2/kBW+PhZ/EvPFfZiH8FuJAMeFo=
X-CR-MTA-TID: 64aa7808
Received: from La7c31470a711.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 47E619A9-5D90-4930-8A57-6761D8DC10E7.1;
	Mon, 10 Mar 2025 12:40:36 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id La7c31470a711.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Mon, 10 Mar 2025 12:40:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g0PRLu2SqRA/JqDWDL9kookYonmJIOCtQjzabb15FhXz4w8Uy2e2OCkrVmKrwlkrY9V6OKD7efiIm2B0wLLJPt3JggK7x+NPlZRB064w9hyP5ukFkodDoR2PSM34CUQ3QxBVQJUteb9DVI3833cBTPg8Prs+UYAWUbguVWnlPuZBY2DieLunix/2cQTQMIO9RlGOdGLfWGejYzPvG+Kq+ldmE8WMLaoy0/5Ue4Fj6gbt7xwWJKJqTCZ6NUHrpexJPCdlocr4s52iqMe3MY6OWPgdMSdCL1sYxQa/hF8z92BC/pMLtrzML4JpH00xMMNKd3GY6HWQ/kfx1tYSWcn1Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u4Y9/D2JTyN6dloiMdoLGPTB2DtLtuUfZTYS92TCnGo=;
 b=p36mEWCmGiHQIJiC/lfrKnmvlylIthU8inwRfbdff+MSWjA3CSY9hu1KzginDeS9RHkxNLSE92ahMihTG1v6Ck4WCtxYUXWuxdWFiBr9SiDyCz1W437/hKZtOY6Xj9MJ8vnTLoEU6I1/w+G32DGZ33v58zGVJdp1loODhCx8f95EMYuFPVv2ZhdWGgOKD4ZTo+VeaAHK3iHya2jgMuFnn5aA2706qcHFYYGZbm/7O+ZbIcD8zDcx7asL0euj84T8FNq3L6jHKMNGyyMa2aF8KystX9NOcaUEsyNm7dgVZ5uS+OKnjdcxVIcG6LwkoQgMwstqxyeYRbhkNhzegsR8kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4Y9/D2JTyN6dloiMdoLGPTB2DtLtuUfZTYS92TCnGo=;
 b=US9SGqRYlF5JteELLe4FtO0MBZQQBvZ8FSybW9DiYQ/KZ8S6I6oRau8RKlxp7vuWwCpv3trQYO90ZF61/ynQpylJHmfymGAAjxZIO0KS6IbQh7jE/tRT7JrygW0hPOjDP1QaIH2BwJLr5z8XptNt+2dkL0x2ryXGjAvED7hAqJA=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PA4PR08MB7596.eurprd08.prod.outlook.com (2603:10a6:102:272::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 12:40:32 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 12:40:32 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "steve@sakoman.com" <steve@sakoman.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 09 Mar
 2025 01:00:01 AM HST
Thread-Topic: [yocto-security] OE-core CVE metrics for master on Sun 09 Mar
 2025 01:00:01 AM HST
Thread-Index: AQHbkOVgeRr54CFPkkKfsOByxCW3nLNsUWGA
Date: Mon, 10 Mar 2025 12:40:32 +0000
Message-ID: <0AB16BCB-8FD3-4548-84F7-B2B9C4DEB8CE@arm.com>
References: <20250309112109.633831003CB@builder.sakoman.com>
In-Reply-To: <20250309112109.633831003CB@builder.sakoman.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PA4PR08MB7596:EE_|AMS0EPF000001B7:EE_|AS1PR08MB7426:EE_
X-MS-Office365-Filtering-Correlation-Id: ed91ffac-00e5-4abc-1e61-08dd5fd0c651
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?WjZYQmZ2NmhEUXdTaFRYV3JLU29vNVRiclRGNk9kSmpFZVd2S0JFRGpwTzZm?=
 =?utf-8?B?emcxMjJJL3J0UnVlSnJSLzAvc2JLNFByWktJUHdSaGsycGtONC8rOFVzaXZa?=
 =?utf-8?B?TkU1ZFZNZnM3MjFMdmtSMHZTVUpjcGdZbDhxU0NsNTFiN2VEVWttN0hUVzJY?=
 =?utf-8?B?U1BmTGlaenBpNXNVdm9rb3dndkZsN0o4enhmM1V6NXNPMU9aaWRqZXZwYTUw?=
 =?utf-8?B?aWZWajVlQTZ3TG5RY2FteFJJSXhDR0ZrdEFTRHVLN0tzRDROVWpIS0k5MEtN?=
 =?utf-8?B?NWJwQTBqTlRybVg5RzZIaEZjOVZhRWNFUkdUV3lVWERUWGYyOHVXRWN5NG90?=
 =?utf-8?B?V1h0ZVcwY1k2UUk2ZDF5Z21kRWxINVJ6ZGlsWHpyenRFa3VzNi9OL1J2MjdM?=
 =?utf-8?B?RGluU0E2aktER0c4V29xZ1ZBSEd3ZG03N0Q0dXFWMGdEbWJ4ZDQvMmo3K05j?=
 =?utf-8?B?cWdvYjRDYnYxUU0wbVRVbEM4ZHhwQUh5M1puZlNvQ3lyQ0VYdWt0blA5cXpE?=
 =?utf-8?B?aVFZY0hCTFNEenpWYVY4dmtTT1J4ai9jUEdzVU5kcCtuR280KzBPdDVNdFRD?=
 =?utf-8?B?amp4b3lUZnd6UU1NZ0szU1VvTXM0TmhoMWk0Q0dmaHcwTnVTelNKU0U2MEJX?=
 =?utf-8?B?V2tVRWh2WGZldktJMVJ2WU1Fc0ZKVFJrNVpBUXRNZmxkVWN4TFAzTURLYW5y?=
 =?utf-8?B?MFN0SUR6UkQ0d0ErNXRHUUk3dXJJYzhCajlIemFnR2xGVE1XQ1FtWVJKR2J4?=
 =?utf-8?B?SlJVVmZxU2ZmSGVlaktEUFFGMXBTMC9VSVBxcVFMU0Fndm5XZVliV3RCbXRa?=
 =?utf-8?B?MkdrVXMwbjdUTTkyMW1CYTg4WjdkTGVIN1c3b3hjNXZVYWJhTTFib3k4UDNo?=
 =?utf-8?B?YVBRM1drbm9GZVh6aGE4d3FGQU1yVFhWV1Q2K3lYTG1ic2xkb0xkaWp5dnlE?=
 =?utf-8?B?VmIwUUEySElTS1pyQmVWTW9zN1J5ZVorSE1JOUVJYlFrQzg4WlhySGxsemxD?=
 =?utf-8?B?cFNJcHl5ZVpFbFdTNkdiTERiNUhmQ3FBcnUzdDlpSXhtdkJYL3M0VVRyUkRo?=
 =?utf-8?B?MTcxUUZrb09ydlQ0NEZDVnZQMmF5U0E4QVU5VGg2R1lycFNYbDJNTTRvSTBv?=
 =?utf-8?B?b3FBeDlZNVVMZytNcWdhNThicno1SGlaMXQ2TzBIT1FvVEF0RWdBd1VyaXRX?=
 =?utf-8?B?RDROV1Y3dVFOZ3krdU40cHBzdmUvS0lSOWdvUTdCczhtVE5Gai83ZXZtMDNC?=
 =?utf-8?B?aVh4RzFvM2hMOHJ1M3NRcG5zcUQ5WDBETGkxald5TEU0ckx6M2FTL1FvcXZx?=
 =?utf-8?B?M3U0aVIyWjNITDlWQXpZQXB0QkZoQjRBSlJleW1pTnlnd0lsOG1MQkNVU2Nr?=
 =?utf-8?B?cElGYkp1L2Y1clNpbm5tcFFrbU0rMFV3NWNTb2JRV2hicUd2UVd0STVtWHZJ?=
 =?utf-8?B?aExtc1dOaXp6VWZsNjZmd1ZtcDRSUXVOUkVTWmM5eHdGUnhtYXBaTWh0WUZF?=
 =?utf-8?B?bHU2KzFma0xIQjJseGtRZVhGdTFEQmxzc1JvTStrc28xclVISkhLYkpjTzZj?=
 =?utf-8?B?RUxPTFJRU0xkMVVVT24vRS80MjI0WmNZdzJML0kxTDlCdkpUK2dKY2JJbFJJ?=
 =?utf-8?B?Z0pTMnBYcnFrcEExc21mczkyV2hhd2F6VzN5NFBpUjI0bVhBNHNGNk1PVDRH?=
 =?utf-8?B?N2prR1pDd01RblQ5bklTbm1ESEV0YjJwcHl1ZTdQRk1FQlN2ZzdVdDJDdU0z?=
 =?utf-8?B?L1Eyek5NQmxQamJxclBRVGVyZkNnbzZkUXRmcHJ5bjBGdVNNM0hvcUhzOFpS?=
 =?utf-8?B?cW41OEZVaG1mZDlveExOa08xYysxWm9Yb05SNFJIdUdXenFHT0RCNGVQSjBh?=
 =?utf-8?B?TGhST0xlV09lc2p4N2plNTVnSFIvRmhUUkhSVDd5anBKb0dZMklDbGl2LzdO?=
 =?utf-8?Q?9+GlEjuC7Q+Y3PrgxuZ3r9cLw4Q0pzBF?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6B905A4FC33DE1419B711E136C883505@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7596
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF000001B7.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	01967e2a-1226-447d-d670-08dd5fd0bf1f
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|14060799003|36860700013|1800799024|35042699022|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RVpPSDMyL3VkWDZSdkJROFk0YVBJTFRZZjNIRzhqVTluT00rY2lFSzFFOVJo?=
 =?utf-8?B?R052WmpOUU1ZT0VuWTRCKzB2WVFDbEtKR1ZrODNiVWN6WEFyckRnaHR1Ynpo?=
 =?utf-8?B?SHJQRUNYRytQUTZmQXlOdVdoWHlBWGRDNXpnV0lnOEg1TXdLYXFVTForMUJX?=
 =?utf-8?B?eExiUUM5MHBXUEYrbHg1b200MTExMGtGTGZoL1ZwS05pWEdZcllOVEs0OXpH?=
 =?utf-8?B?S041WVFyampHZnF2VWF2dGdOUkE2NEdrZHVNcFF5VnJsT2E0OEdtSUVzS1NQ?=
 =?utf-8?B?RGJhcG1OeXNEb1BFSmFVZFg4N3VGRzVvRVYzakFodkduSUdoS3lRWWI4bDRT?=
 =?utf-8?B?MjJBREJWMGgyRmZ0dk0xZlU0RTBFRjdVNmN0L29yZ2lXWHRZem91THRWTWlU?=
 =?utf-8?B?Ynh6bXJEVlJ1UEhVWFRWL3hmQTc1eHpSd1Y1VUk4b3pLVU93RDk0YWJWYlhH?=
 =?utf-8?B?NmtKdDg1QWljU1RkWC9tVnErT0pYYjJxa21SSnNvdjlVRm42TkorNGRNZ05J?=
 =?utf-8?B?RTYrS2Y1ZjlZWk9yQXZnbUVqWUI3QUVwVHZKaW9xRlB4UTg3Y3FPOGVBTm5o?=
 =?utf-8?B?K1M4a2ZVcDZHWVZlZTF5anl6NVJ6RlVZcE4zQ0l6ZFZNMkJKSmV2RmdVOUxr?=
 =?utf-8?B?L3NpbnlYZzA3bmRqTE1GMHNnT285NjZyWW85eEpoSkRmNkpMTnFBZGhDalo0?=
 =?utf-8?B?S3FWMExZSDIvZTdBUm1FUG51Qy9GWXRjZ0NMUHlINWhsUzJTTTJESisxeTlx?=
 =?utf-8?B?clhDWmpoeGtac0RqR3NXM1U1MW1uVUtlNzZ3a3dtSXFtUzRJYzJPU0l1SDRp?=
 =?utf-8?B?dUI0b1hmS1Z5UGI3aTJiVVA0dFFmN0xmZFYzOU1Fc3F5Z1VZcGlMUTFhcVBN?=
 =?utf-8?B?U2NoRzQ2eWpsZVFmeERtelJlYXluRjViU0k3MlEvTThhTVd3azFLNTFtbE52?=
 =?utf-8?B?Vm4wVEQ2dkRXTHplQndxZjFzSGNFTzZKOTBUQlF0QkU2OHZPMW5IOWc3NzR6?=
 =?utf-8?B?emU0R2FtNUJ0SlVlWFhtMUsybC94NWZkWEo5aTRvTmpNc05sZ2M1YkFkS1ly?=
 =?utf-8?B?MzB5ZHZURE5INlRpV3ljQmNnSXV1L3ZTYjNJaHlnZEx0UEtkK29uRGlrMkRB?=
 =?utf-8?B?Z1RTNlV6SFpyVGkwUHlYZlNtWjB3OXhydklyTERDTGk0RDh0SGNYd1NOS1FF?=
 =?utf-8?B?emFVY0I5Mm4rMGQxbFRjOG9hZE5tWUo3SU9PczI2YVpCQ1pQelQ1NlZ0VS9S?=
 =?utf-8?B?M1F6UmtXaUE1cWNoNTE5OExKcjBXbStUQnkzN1gvbWZQNkZIQnUwenN6R21V?=
 =?utf-8?B?cXFLV1Y5SWd6a0JIUU5WdnMvZVFkMDdlbVlvWXl5Q0dIS3cxdHlRek0xMXRM?=
 =?utf-8?B?U1pPVWVMT0hMQ0F6SHJjbnUxMEZOZGhSYlMrS1lyeFNKR2QrcFoveGZPa1hE?=
 =?utf-8?B?d29GMjVYWUtxR3ZEUHYzVWprdnVVVjZ1RkVocXNOQmVKdkNwaE1WK29YK2xU?=
 =?utf-8?B?OEQ5S0NOVlQvTWFFT0UwTmM3azZsVUc0Z28rbXVoejNQRVlzY2IwL3lsN0Nz?=
 =?utf-8?B?OGo4UVJSR0hFVFdRL2JEdXRvKzlleHEzbG04KzNYeTBNcDVkcHdHZW8vVUxG?=
 =?utf-8?B?Q3l6R1d1NW4vZ1ArNm95dTNiWnpSLzRHdVdyck5lZXBFNDFGMUFEalFyNm9K?=
 =?utf-8?B?UDIxRkJ6dVlZbXRLVG1qMlRTcEx4Mk1BVU94UUhnWDBSbDhlclVNdGFkR1BG?=
 =?utf-8?B?cGZrS2ZBMzVqaGpqVnFvVzdUM3VzWnA0YkxrMFlMTUU1blJNN28rVGxFTUdH?=
 =?utf-8?B?bGdNQkRpTmFETlpqZHVWODF1K0tmODdjb1YwOFZLSktlVENIZUlGSGc0SkNG?=
 =?utf-8?B?M1hOU0NXcGtYWTNwR3ZRREloSzkrUWJRdlNLaG9URFVhcUtCMXNpeG5oNU9P?=
 =?utf-8?B?ZEl6TW83Y2JpVklwT095Y2xCWUlvS25reFJLQjRLUitBMTJMRExlZ3FLVHlp?=
 =?utf-8?Q?AyRV+V9N3Mhl/ktxKJiveWopwVEqNU=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(14060799003)(36860700013)(1800799024)(35042699022)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 12:40:44.1050
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed91ffac-00e5-4abc-1e61-08dd5fd0c651
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001B7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7426
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 12:40:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212511

T24gOSBNYXIgMjAyNSwgYXQgMTE6MjEsIFN0ZXZlIFNha29tYW4gdmlhIGxpc3RzLnlvY3RvcHJv
amVjdC5vcmcgPHN0ZXZlPXNha29tYW4uY29tQGxpc3RzLnlvY3RvcHJvamVjdC5vcmc+IHdyb3Rl
Og0KPiBDVkUtMjAyNS0yNjU5NCAoQ1ZTUzM6IDcuOCBISUdIKTogeHNlcnZlci14b3JnOnh3YXls
YW5kIGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUt
MjAyNS0yNjU5NCAqDQo+IENWRS0yMDI1LTI2NTk1IChDVlNTMzogNy44IEhJR0gpOiB4c2VydmVy
LXhvcmc6eHdheWxhbmQgaHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/
dnVsbklkPUNWRS0yMDI1LTI2NTk1ICoNCj4gQ1ZFLTIwMjUtMjY1OTYgKENWU1MzOiA3LjggSElH
SCk6IHhzZXJ2ZXIteG9yZzp4d2F5bGFuZCBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92
dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIwMjUtMjY1OTYgKg0KPiBDVkUtMjAyNS0yNjU5NyAoQ1ZT
UzM6IDcuOCBISUdIKTogeHNlcnZlci14b3JnOnh3YXlsYW5kIGh0dHBzOi8vd2ViLm52ZC5uaXN0
Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1bG5JZD1DVkUtMjAyNS0yNjU5NyAqDQo+IENWRS0yMDI1
LTI2NTk4IChDVlNTMzogNy44IEhJR0gpOiB4c2VydmVyLXhvcmc6eHdheWxhbmQgaHR0cHM6Ly93
ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVsbi9kZXRhaWw/dnVsbklkPUNWRS0yMDI1LTI2NTk4ICoN
Cj4gQ1ZFLTIwMjUtMjY1OTkgKENWU1MzOiA3LjggSElHSCk6IHhzZXJ2ZXIteG9yZzp4d2F5bGFu
ZCBodHRwczovL3dlYi5udmQubmlzdC5nb3Yvdmlldy92dWxuL2RldGFpbD92dWxuSWQ9Q1ZFLTIw
MjUtMjY1OTkgKg0KPiBDVkUtMjAyNS0yNjYwMCAoQ1ZTUzM6IDcuOCBISUdIKTogeHNlcnZlci14
b3JnOnh3YXlsYW5kIGh0dHBzOi8vd2ViLm52ZC5uaXN0Lmdvdi92aWV3L3Z1bG4vZGV0YWlsP3Z1
bG5JZD1DVkUtMjAyNS0yNjYwMCAqDQo+IENWRS0yMDI1LTI2NjAxIChDVlNTMzogNy44IEhJR0gp
OiB4c2VydmVyLXhvcmc6eHdheWxhbmQgaHR0cHM6Ly93ZWIubnZkLm5pc3QuZ292L3ZpZXcvdnVs
bi9kZXRhaWw/dnVsbklkPUNWRS0yMDI1LTI2NjAxICoNCg0KV2XigJlyZSBtaXNzaW5nIGFuIHhz
ZXJ2ZXIgdXBncmFkZSwgYnV0IGZvciB4d2F5bGFuZCB0aGVzZSBhcmUgZmFsc2UgcG9zaXRpdmVz
IGZyb20gdmFndWUgQ1BFcywgSeKAmXZlIHNlbnQgQ1BFIGZpeGVzIHRvIE5JU1QuDQoNClJvc3M=

