Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C21AC4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 12:38:12 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.42])
 by mx.groups.io with SMTP id smtpd.web11.17262.1713875887476094720
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Apr 2024 05:38:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=lNrOwLEf;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=lNrOwLEf;
 spf=pass (domain: arm.com, ip: 40.107.249.42, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=GJircJdm3Vkz865c+WnwMq0cMzDLbbLgg+yx2QNKmyJk+1KCn32WObDi7zw8c+LYSbmO0jml11iY/JyxqpNgD3oIjUpT0iRSG9yO/zh1DebdZ2H3ulllbbsGE3Q1062tJ+AHgrYKx8qPBhLtldNY0DwibaO8sgBlB2Zu26nmTmx/twjg/FVymT1Rveu9kWszzFd3Tme4EYBpAuINRDztaz80m97AKKLPiGNWKye7R6lBrpa/Wv7b090gbF6uJbzAua3xl8dA6wLOs8ablLgmtP5O2cvafg85alhXABZypDu5uyTrdeIikvhBJxdWHt67MidjtyEsJVHTiyYIuWsjiQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JoB771qV1JUgIZtdOeKFK4Av4m3204AFLFAIOJ+y82I=;
 b=DnvO3Zq6IxGBY2uy3JFfo0qEpxwHTkIW31KSvfeGqa4SaTRN6WBsbdZoz8O9MzFABJPBzSqNM1Zt/UNuTP3iBVz9eXH5MCEvJHdCiCxOc65de66tmc5i19sbUaIKKA4VgTzQ1xvNXF9sYC6r24EIwi+Xv53hBHSzV+ZSqkkLTrZrkv35CGFqxfukA0qWtZhvirNv2IY7bMF/kcj8VzwTO4JHcbpHUTZjhe5UJsru39BReAzrYUOUcG0WnTl35/jbjHKUvh9a0rxVq6nLZ54R/R17pT4lPOsoB8TbKjzT4M1NH1IQdgdklJS3kOSINSeilLp5i2UEnGXqqEqPBPRMlQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JoB771qV1JUgIZtdOeKFK4Av4m3204AFLFAIOJ+y82I=;
 b=lNrOwLEfTPU7kciideoxUlgEO9RdCOWpp6OH6vq0EnM7590pOtjTs6hE0e5hYaPI4Ot9K70f3hMXwiVxit0yZAkwSfTsYatd3pd7545Epg5i4KXEG/2R7gTADozJPr39HMTSABsJJgXRCMJjwxdteyXt203jrFb4uGeVyw69XW8=
Received: from DB8PR09CA0013.eurprd09.prod.outlook.com (2603:10a6:10:a0::26)
 by GVXPR08MB11058.eurprd08.prod.outlook.com (2603:10a6:150:1f6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.19; Tue, 23 Apr
 2024 12:38:04 +0000
Received: from DB1PEPF000509E3.eurprd03.prod.outlook.com
 (2603:10a6:10:a0:cafe::77) by DB8PR09CA0013.outlook.office365.com
 (2603:10a6:10:a0::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.34 via Frontend
 Transport; Tue, 23 Apr 2024 12:38:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509E3.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7519.19
 via Frontend Transport; Tue, 23 Apr 2024 12:38:03 +0000
Received: ("Tessian outbound 8c03561b2da6:v313"); Tue, 23 Apr 2024 12:38:03 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4b2a1cbd178ca97a
X-CR-MTA-TID: 64aa7808
Received: from 8541f6657065.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 232F1BDD-BF65-4906-BC4A-FB49746BB141.1;
	Tue, 23 Apr 2024 12:37:55 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8541f6657065.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 23 Apr 2024 12:37:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pb5co/gfRj7QJXodVB5IlyWd9HLieQz+fym+wARjdwhCo0WTrX5DiYjV9YtHoyXFVl6YoRQai4xGvQgUw+3Tl7DU1naOP7y3QZF5RvfGvgvjA4EJMU3o+TlaO/mlBR67SZEjoAoRcnSHusxbW7irKSKMdZbsww6U0JUiRjp2DO+pK1deUc/IPuy3mMJxmDDSr1PvUIY83m9+v3icGFYIIk1pTyA3XHh5rnU7HrzEQfrTUdWuinGAZtYHkuMQXZWfNvmyOJrud41fIwl/qJ6pjCojlKvfyGNZuQofep1h9eYewFWgm7z2M6y9wZNEUrIZp/s2FUSRHFa4aLZ2O+feKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JoB771qV1JUgIZtdOeKFK4Av4m3204AFLFAIOJ+y82I=;
 b=VCIPCysKFO8nM3XuqLu7n+9r1cvKeYFvk1hUId25mhTj5VySi8MWY6RPkfr2y6Wul7R8+w2GJMu1eTFlDhCNVf58LxoC/pnE+J0lXLXTAz2ZUMJmPwiJRli4taWKckNgZ/PieAOn3c+WJJsldyHOkhbRErGuliXHtbp223aIyF/g2h3o2OvseaN2wCaUoxJid1zRyZrVkc2PBAkdOqmFUd9yCZoIyL15AXlOX0m+3hVrxd0cdStndYDfsC3E7wmO5Kl1kpshEjTtc+p1EC8CZKWbr6TEIM78OT8s+6KNvKvSfj0qIb7WadDys618GGhdEpZV2EMxgI8BfZsEEIMZZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JoB771qV1JUgIZtdOeKFK4Av4m3204AFLFAIOJ+y82I=;
 b=lNrOwLEfTPU7kciideoxUlgEO9RdCOWpp6OH6vq0EnM7590pOtjTs6hE0e5hYaPI4Ot9K70f3hMXwiVxit0yZAkwSfTsYatd3pd7545Epg5i4KXEG/2R7gTADozJPr39HMTSABsJJgXRCMJjwxdteyXt203jrFb4uGeVyw69XW8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB8625.eurprd08.prod.outlook.com (2603:10a6:10:3d3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 12:37:53 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%4]) with mapi id 15.20.7472.044; Tue, 23 Apr 2024
 12:37:53 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-Core] [PATCH 27/34] python3-setuptools: upgrade 69.1.1 ->
 69.2.0
Thread-Topic: [OE-Core] [PATCH 27/34] python3-setuptools: upgrade 69.1.1 ->
 69.2.0
Thread-Index: AQHafxYqSS+GLSmlcEO90tS98eacuLF19+UA
Date: Tue, 23 Apr 2024 12:37:53 +0000
Message-ID: <B22245BC-4659-4C7A-AF05-26E3C7518023@arm.com>
References: <1711413292-3025-1-git-send-email-wangmy@fujitsu.com>
 <1711413292-3025-27-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1711413292-3025-27-git-send-email-wangmy@fujitsu.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB8625:EE_|DB1PEPF000509E3:EE_|GVXPR08MB11058:EE_
X-MS-Office365-Filtering-Correlation-Id: dafd9ec0-d771-479c-76f2-08dc639237e5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?bUlIbzlIRHU4TmhMb0Y3WDFFVlg1cUJta0d1dmhHMDY0VVk5c2d4QXFUWlll?=
 =?utf-8?B?ZUx4cXFUeEJlek9Pakt6MUc2ZklEU0N0U0p3eUpuRmI5OTUrVnFBcXFrREU4?=
 =?utf-8?B?N2pmQ2ZZUlhvMGVZbUVCdTI0Q0hYV2VuajZiQnd2c1cyZkh5YktIQmQ1aitD?=
 =?utf-8?B?aG5yNjFlR3lXR1J6bFhVWFdUcm1VT1JxQnUrN0NkMTgwUHIvdE9rMnJsQUQ1?=
 =?utf-8?B?aVJQNVNJVkdtczl5cjYxb1dnZnAybW5RS3dMeEZUT0pHY2lvMmUwdXM2bEFw?=
 =?utf-8?B?NjU1NDhxMDNLbEw3ODhuWEdwYWphL0Mzam5mVlF4S0xzUk0yRFNKQnJlK1Bk?=
 =?utf-8?B?SGhlTTY4bi9rVXc3RTRMVG0xRmVTUnNWNVV4Ymtqd3JJNnhUT251emhvQ0xK?=
 =?utf-8?B?dm4vT0VUOGdMcW8vYzgya0ZzdG1tZnpQdHNoWmJjY29BbDllTGJuRWFRUTFx?=
 =?utf-8?B?aEhHcjdwMHFhR1k3TEk3S1lhVjV2MkZvc0tiZm93SDIwWkJwZ25odzRsT3ZV?=
 =?utf-8?B?QVNmM3VKTzV1SXpmZzg3dWxOQTI0djduN1pBcXhpUFlLT2JuYjFKcU1kSW1R?=
 =?utf-8?B?cG1KRUpMWmlhVWdadjluaTZlRGpEMTBoM0JqUExWMXBWdjJwU2R4b1BReUJq?=
 =?utf-8?B?bitvSDNNS0hVZk8vcEtnaFRaRDl2VDJDTktnaWV1czFCYStySlhnM0cwL3Jq?=
 =?utf-8?B?SUExS0tKZ0Z3WkxuTS9Jck5nZzI1NU5yNUwrR2JORkRKOHJjKzFYejN2TSt5?=
 =?utf-8?B?L3VkSFdFTjJDL3hhbk93L3laUWdaRTJaWjlnK1FPQUt5VVhpNHB6WW5jTFRh?=
 =?utf-8?B?MWczaVdPbGtRTTdYNTdkd3JkYkZMMDBua210MXdEeldMNnBGRXZDVDhMSmtC?=
 =?utf-8?B?TWVkUTJGV2VzTVRjUDY2ZjdLaDZQRWQ0Sko0Z0hnUHVWNmZqelM0VXBiUmMv?=
 =?utf-8?B?Y29rcXpKRjdheW5ON0dhWE5Cb0l6bVBpbkUxUVVuTVNRclg2eFZUTzMvZjFv?=
 =?utf-8?B?OEZQb0R0MjVMUzZ4NWcwUnVQekxyREZrbFNJVmdUZW5JOTJZbFpncWh5TXJv?=
 =?utf-8?B?UHZ6Qk5yaGdweU1JK2YybmxjWkZKRVJSaTAyUGx2eFg2SE1DaWM5YTAzK0RY?=
 =?utf-8?B?c1VBZG1Hdk8zYy9mSzI4cUcxdzl0ajF0WmJ3QlNZOGVCazh6WHlWaVk2bm56?=
 =?utf-8?B?WXRIYjlnNTVHb1ZMYTBBS0ttMGRyTCtVWGJtbEdFMEhXSU16aDZBNmwvM29F?=
 =?utf-8?B?OGplSlgyWmJuT29JNkFWUmFBekRoK2FMWnBPNGdQb0hCZ2RMc3N3WnBmOUho?=
 =?utf-8?B?Y1VnbWxLTk9UcFQ5ZTNxS3d3M2NOSmhMQ1FiSWZKazgwQzhNM05iYkptNDQw?=
 =?utf-8?B?cjFUNHdtRHFRdW9yMU8rVStrUjJHQjNpRVBDcGU1SzVHdjhqbzdZVHNxNGIw?=
 =?utf-8?B?TUY4N2VJNzlHU1pYczI0TXR2TnBqUVBsVGJMNi9rMlZPb0dEVDM0SG9KNGEy?=
 =?utf-8?B?YytLMlM5YnhOZXZZUUxBRmU1TlNlY1BhMlorb0RRSUF3dHFyYStwNXk2MUVV?=
 =?utf-8?B?MmExcWNLcUNSc1FpbHFOQVRvUkxDSTkrYk9DSzFzeS9lRTZDSDBDTHhtcFBQ?=
 =?utf-8?B?YVpSdG5yV2VEQURQcUkvSEhWd0wwZDlRY00rKzFNb01ubHora0Y5aDZEc25U?=
 =?utf-8?B?Q3M1QXgzZitsVHI3dGlTRTdHMytCcEx4UXhvdVpieWk0Y2oyYnFWOVpZWG5m?=
 =?utf-8?B?VVY3RUo5MStiQzg1VUpSZm95TENzV2ZsZzJGbnhyV0UrY05RUXZETFRudmRM?=
 =?utf-8?B?aXp4ZW1kZXFIaUxCbnJmUT09?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F2BC435EF1C3BD49A6179DAD9C028E2B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8625
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509E3.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	015b9f12-b215-4773-25c7-08dc63923210
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|1800799015|82310400014|36860700004|376005;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aElWY2xxSXlJMlpCV1ZKRFVBQkdPTUt3TVJzbXFvYTVxOUFRTTVCUmp4SG1O?=
 =?utf-8?B?cjVzbGFGOFVTaVV4bW4vVnFhZ0NxemhyOFcyRzBBdVQrQjZmdFZidmJpTTRy?=
 =?utf-8?B?T3J5MEYxL25Nejd1SDJKVTRJWEN3MlRVQU5Yb2s4bW0xSE53akdsOHkwUUlX?=
 =?utf-8?B?WHlOdnQrbWdvNjRtKzhNNEpWdVR4LzFKKzAwV0N1SFVmUUpZNUFTR0w4ZHl0?=
 =?utf-8?B?YTU1V2RIelBaZjRNNllOVDk1L3FiV3FmMmE1Y2tvOXFhZ1UxRWFFRUJjbTI4?=
 =?utf-8?B?OExFQXJyeloyVWh2VktQQTd2STlYR1g4WGd6RmRPNm5lYmNseDVwbXpzc3lO?=
 =?utf-8?B?YjM4dmNRTVdCOGhKbFpsN010Q1ZiWWtaMzRRd01IdGJ5TVE4RFpDN28xaklo?=
 =?utf-8?B?SUszZldnUmlDc01qZHM1Tk9RbFBBSzE1RzNFdks5bk5QNlB5M1ZlN3V4Z2E3?=
 =?utf-8?B?cUsyUzlxUEYvak9FSXdnQXBXYzBhb2R0UFRuMyt2V2VXODZ5NlVwUnh2SmVj?=
 =?utf-8?B?SC9pVkNBdjI4azIvRWE1YVBQa1ZCREh1VFlINmhoQ2hkU1VvQWk2M2lpV0xm?=
 =?utf-8?B?M1EwVzl5a2RvNGJlZkZxVzJnNS90NlYvSE15WkdiYWhpQ2FucjYzdUJRYzVZ?=
 =?utf-8?B?RWJtZjdwdHFDWXFpMk9kcm91NUZWeDg1MnVNYU15Zi9nbWQ0MmgxMTkxREFt?=
 =?utf-8?B?bHR4K1hsR1RiV01kZ1lydkp6UWVCbkkyL2VYdUkrOG0yV3Btb0VUd0FtMlZZ?=
 =?utf-8?B?MWRWTFZVWEZ1VDFnUUF4ZGRQRDFvZ2wrTE5oVzNhR3dxOE5LSTFmWHA1aTcz?=
 =?utf-8?B?VnNzak9NZm9vb0ZwRkc3TURPdklQRnNza1c5R2dRam5nTlkzNkJ4eUlENHRx?=
 =?utf-8?B?WDVCendic1RzSkJwTWk1TFJDbHF5LzdvQzhGUnp5ZzAvTjNOMmgyNEQ4LzNQ?=
 =?utf-8?B?TTBmemNlYlJxbXB1UGk5T0M3WkROM1N2QVZiL243Z04reU5FNlJyVkVPcm5m?=
 =?utf-8?B?YW0vaTFSRWlLN2Z6YVUwTXRRUTdmOHI2d015cG9iQlZ4MDdPRjJHMk9qa1Zz?=
 =?utf-8?B?c09iaXRrcXk4cmNORnhBOTlOaXRvazBZaWtnZ1NiZFMralVDMWoyV3ZLbmFp?=
 =?utf-8?B?aFdTTVdSejZYVWtCL1lXWG1WSnpsZktDYmJoNERzUW1sNzF4aHNUbEloUDU4?=
 =?utf-8?B?MGtFZC9wZ05GRTR0ODBqM1NSRklnVlByb3BJeE5DVzQ3Z1AySEFPQWMwSlg4?=
 =?utf-8?B?c2laWnZkUlVBY2F3MjdSSjBVdnptZUI0ZWVOYWJSTUVvZnUvK09ZN2F2UDV4?=
 =?utf-8?B?OFJGZXcvQ1dDKzhncnNzQUN4QVNGNVVIaGx0YVZpZy81ZnJLUHhkaENLaEg3?=
 =?utf-8?B?MnhNR3NpakdNVWRZZWhsekJhaUZqcU5kUzdyZEhjK1lUWHZJMkNjVUtsWkJs?=
 =?utf-8?B?QzQ4Wm5VZWZjZFgyQWQxNm92cCttTjduOHdwV1I0ZXBOZHA4UGVqTk51VVJn?=
 =?utf-8?B?Rk1DcmRhalFvbjhZbjJUOGtNMTBreEpzVFZYOGZxS2tDQWZLNHh1Z1BDTGk2?=
 =?utf-8?B?czRDYWdkaVVDQ3R2Und5Y3ZzT0xrR2NsWDRJUmloU1RCd3FqZ00zM1laMFJI?=
 =?utf-8?B?ZnNpSk5xNEw5WitkN0syNDJwSzlQZUZaV1BCSE5DVW9OK3B4UWlnSjZhYU1I?=
 =?utf-8?B?NmVUaDRxdFc0SGFaTVMrT0YzL2ZuNGtGRlBaaVhuMHNycVNnZ1M2RVBMOUlx?=
 =?utf-8?B?eGdOWTkyeXN6WFdVK1RJYUYwQXNObW93WHo5eXZSd2NYazc3T2JEd3M1eUhr?=
 =?utf-8?B?WFJVVkwzS0VDM2hHWCtRL0lVWGt5WmdrNlZhTFpOY2lMb1RDSVZWYStMbVVh?=
 =?utf-8?Q?ht8lUgJZB7190?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(1800799015)(82310400014)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 12:38:03.3771
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dafd9ec0-d771-479c-76f2-08dc639237e5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E3.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 12:38:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198622

U29tZWhvdywgdGhpcyBkaXN0cmlidXRlcyBhIGNvcHkgb2YgdGhlIGJ1aWxkIHRyZWU6DQoNCkNo
YW5nZXMgdG8gcGFja2FnZXMvYWFyY2g2NC1saW51eC9weXRob24zLXNldHVwdG9vbHMtbmF0aXZl
IChzeXNyb290KToNCiAgL3Vzci9saWIvcHl0aG9uMy4xMi9zaXRlLXBhY2thZ2VzL2J1aWxkIHdh
cyBhZGRlZA0KICAvdXNyL2xpYi9weXRob24zLjEyL3NpdGUtcGFja2FnZXMvYnVpbGQvbGliIHdh
cyBhZGRlZA0KICAvdXNyL2xpYi9weXRob24zLjEyL3NpdGUtcGFja2FnZXMvYnVpbGQvbGliL19k
aXN0dXRpbHNfaGFjayB3YXMgYWRkZWQNCiAgL3Vzci9saWIvcHl0aG9uMy4xMi9zaXRlLXBhY2th
Z2VzL2J1aWxkL2xpYi9fZGlzdHV0aWxzX2hhY2svX19pbml0X18ucHkgd2FzIGFkZGVkDQogIC91
c3IvbGliL3B5dGhvbjMuMTIvc2l0ZS1wYWNrYWdlcy9idWlsZC9saWIvX2Rpc3R1dGlsc19oYWNr
L292ZXJyaWRlLnB5IHdhcyBhZGRlZA0KICAvdXNyL2xpYi9weXRob24zLjEyL3NpdGUtcGFja2Fn
ZXMvYnVpbGQvbGliL3BrZ19yZXNvdXJjZXMgd2FzIGFkZGVkDQogIC91c3IvbGliL3B5dGhvbjMu
MTIvc2l0ZS1wYWNrYWdlcy9idWlsZC9saWIvcGtnX3Jlc291cmNlcy9leHRlcm4gd2FzIGFkZGVk
DQogIC91c3IvbGliL3B5dGhvbjMuMTIvc2l0ZS1wYWNrYWdlcy9idWlsZC9saWIvcGtnX3Jlc291
cmNlcy9leHRlcm4vX19pbml0X18ucHkgd2FzIGFkZGVkDQogIC91c3IvbGliL3B5dGhvbjMuMTIv
c2l0ZS1wYWNrYWdlcy9idWlsZC9saWIvcGtnX3Jlc291cmNlcy9fX2luaXRfXy5weSB3YXMgYWRk
ZWQNCiAgL3Vzci9saWIvcHl0aG9uMy4xMi9zaXRlLXBhY2thZ2VzL2J1aWxkL2xpYi9wa2dfcmVz
b3VyY2VzL192ZW5kb3Igd2FzIGFkZGVkDQrigKYNCg0KVGhpcyBpcyB2ZXJ5IGJyb2tlbiBhbmQg
aG9wZWZ1bGx5IGEgbmV3ZXIgcmVsZWFzZSBmaXhlZCBpdC4NCg0KUm9zcw==

