Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 234F2E7716D
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 15:33:04 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.60])
 by mx.groups.io with SMTP id smtpd.web11.13978.1733412776946805345
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 07:32:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=HFZpsKpA;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=HFZpsKpA;
 spf=pass (domain: arm.com, ip: 52.101.65.60, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=g6Qtczng4jnX5XBH03bgZ2xaoirULMJpj/c4F1pHcvLaI28evMTuJAy3tSmJKK5T8hxcstjZOEhEFrtXqLgGAKah4i55lOoIKQssZ2hKxZPeaPSp1UUdMHJDhSG7rWeyFLqbItP3ezvofk3u3jANo4K4UlK+mNI77mj2J+bPSW2hZVH5hgED+tB9DjVtE8+NCr5gnCmzsi72dG0DaRT/BlsHBZBkb6XnNYRX4/JhbHekW0iObdMMWSi398nieoHNSU78k+qEx8f37tUT6Hh6+J2ShYM11oJbUgycI/P+tjukdDNJEL20wQKAQw6Orlb2BQu72oeMh/Qg+vcj8U9fXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qeAzorvVI2f7r2UT1a1qwAzBDqUYmARCZylKZ4JO6QU=;
 b=ojUU/i0bQZ6NSun9XWjeF+h73H3//UfKxooWEVdOgBpwnTR+/ihQkRZN6FA512fpk+7r8PeN8X3j6Vvpew2e/rhAXEn05wU/xeHCrW6Kk5Gm+DD4UjZFUHrtZ2se0q2UyDlhFR0moyiVTGfxzD56kP+QhPZQstiOePVl4yJGm1X06ABRIoEjnZMW1ENjB2GveJhfasgeraq6QtiX+hhxo+QubKQJNmW3jwk2/rgbPHJoetCmDKLIXyJUllzFux1thwj1lpuBHzy/q2oF/XZAVsFG3B2OwrGvf8WczXUOXFeMR+p1RNJEcMl5H9hbp1NTYzH1Coxk/RvMWzy4zwi/+A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qeAzorvVI2f7r2UT1a1qwAzBDqUYmARCZylKZ4JO6QU=;
 b=HFZpsKpACwu869YVm1+LRsNIS0x623dQSSKLZreuKuN7YOPvMC7J63nmEy+eGE01QiNW85c/fp8Zr2tRqoLHDX6KXfDQiRWEbd7OUtonDwSFSC5J7krEbA8OPi7+ZYkeHVcHUvWsGy2Ywcgm72h5OZ0gCJY6Uxl7/qrpKR/w8Hw=
Received: from DB7PR02CA0021.eurprd02.prod.outlook.com (2603:10a6:10:52::34)
 by DU0PR08MB9582.eurprd08.prod.outlook.com (2603:10a6:10:44a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Thu, 5 Dec
 2024 15:32:52 +0000
Received: from DB1PEPF000509F4.eurprd02.prod.outlook.com
 (2603:10a6:10:52:cafe::2a) by DB7PR02CA0021.outlook.office365.com
 (2603:10a6:10:52::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.9 via Frontend Transport; Thu, 5
 Dec 2024 15:32:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509F4.mail.protection.outlook.com (10.167.242.150) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.7
 via Frontend Transport; Thu, 5 Dec 2024 15:32:52 +0000
Received: ("Tessian outbound c1c69903f916:v522"); Thu, 05 Dec 2024 15:32:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6b2c112c6aab1ed6
X-TessianGatewayMetadata: ya1LApsaZcyL+IXL11RdGoG14YfkWEZM3dtxLJoa2sSpcgrAkJ76LboYblKAbROITjmnllKMwJBDBHrkm4oSzysKsOMWaKgtpdp8YewjZ2+ZeXtPXOKN/m36KbVUKuw1uh8/OOzwujrps8P0vVKRmGjG0WXryj2VFjJZ3i5ymOk=
X-CR-MTA-TID: 64aa7808
Received: from L4eb85d5aaacb.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 67B0BC3B-D434-4B54-836D-65D2B135B437.1;
	Thu, 05 Dec 2024 15:32:45 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L4eb85d5aaacb.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 05 Dec 2024 15:32:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Szu3TSVOlaYdxgxThZ8BdzuUyhoX9JcXn4T6csYv42HK2TXXgUJ0RGlYxtCcE32hJbAbUXi/6bsrN2ARH1lxRL4jEsAQwtDeqgheb4XKqRg6Wni0vj7eAC9S9/XYVKKP8+gHWqtMXZ5RNRABUHAtrOkFasdpkn1WAPuLJ3tHKIv1GH6TkTY0mP2Ay34fCGJ57VNdDHM6J3ilFdNloy+cN7Dr7sj0oI0WgqTB70lMJj+8lB+ixdEhPYmJZIeL5XOthge7eMAy2j5pIh5N8PJX/w7+sDyq3DqsTM7R4RtzIb+dwmeIY4nW4Nx00ogGV1L8RrtpziKgZWfhmvUGB2IbZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qeAzorvVI2f7r2UT1a1qwAzBDqUYmARCZylKZ4JO6QU=;
 b=WuPSbea42h36RCHdRYTE0J8GuUMuNdIa0rxgetyryy3Dls0qocLlFMl5zJ2I9qzhRy1xJG9oYEeTRN/rJdwFzsKLe5ELPBmsOZf1I5GgasAUhyi6buHKhnIbpUnPTO4P1oslbrsjXxvyYYYc8I3ytjvk6jcOiOg6v8sKl1Xml3zRymtXsyuG9kH3hgM+i3BjLU8NyDbyGutHvoKqz7I9XG9PpvlgUFqxYxhYETZSsueGV+XDqCv5KiISsN0jZlAeWKYib5DWsnhjX3DhcnpxBrrRinQlit3jYfghcwAsYnebDLckb6jHye8pMqvolFbGAm6Y9Krl3TkzuxAhKjll3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qeAzorvVI2f7r2UT1a1qwAzBDqUYmARCZylKZ4JO6QU=;
 b=HFZpsKpACwu869YVm1+LRsNIS0x623dQSSKLZreuKuN7YOPvMC7J63nmEy+eGE01QiNW85c/fp8Zr2tRqoLHDX6KXfDQiRWEbd7OUtonDwSFSC5J7krEbA8OPi7+ZYkeHVcHUvWsGy2Ywcgm72h5OZ0gCJY6Uxl7/qrpKR/w8Hw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU2PR08MB10230.eurprd08.prod.outlook.com (2603:10a6:10:46e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Thu, 5 Dec
 2024 15:32:42 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8207.017; Thu, 5 Dec 2024
 15:32:42 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 14/37] dtc: upgrade 1.7.0 -> 1.7.2
Thread-Topic: [OE-core] [PATCH 14/37] dtc: upgrade 1.7.0 -> 1.7.2
Thread-Index: AQHbRhkJRw00XAJaL0q3t8O7JlxOerLXyZmA
Date: Thu, 5 Dec 2024 15:32:42 +0000
Message-ID: <181C637A-AD13-41CB-A6B5-152AA612102E@arm.com>
References: <20241204064920.817016-1-alex.kanavin@gmail.com>
 <20241204064920.817016-14-alex.kanavin@gmail.com>
In-Reply-To: <20241204064920.817016-14-alex.kanavin@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU2PR08MB10230:EE_|DB1PEPF000509F4:EE_|DU0PR08MB9582:EE_
X-MS-Office365-Filtering-Correlation-Id: 40c24e71-0c26-4ab9-cb58-08dd15421530
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?QVo2RktHWnMvSFNIQ245RFlLWFpjN2hRV1lBQmYrUUN0b2o2N29WQjQ3M1Fh?=
 =?utf-8?B?T0hzbzhxdGtRT3BYVWVoR1IzRDlteEZBTHQxTXFyN1VmMitpUlczY2tnbGkx?=
 =?utf-8?B?NUtWdlpUdG1OQzQ3Q2ZKKy94RW9GeFZISTgvS0JjZUpIVEtXWDJSZGpmU0ZK?=
 =?utf-8?B?elJPK1dFK2lrdWF0T2dpWG9VOHkxS05TRlF5d3pDVFY5eGhzeGhKdDF5eE96?=
 =?utf-8?B?TER1L1pSY2ZRNTlTcEV5S3dvek5KaUVFaU9SYmhKRlJiZXVhZnNodXBadk1r?=
 =?utf-8?B?SSs2bEhWNXRhdS9SWnI1cXRPUmREUkdhdFhsL08yYy9HbUNCWU43aFZZZldU?=
 =?utf-8?B?cGtoK0tXRjdVMnNONFlnUXJjZWw3WGptSGFVMmVEdERDWGdTRWVoemtxUVhr?=
 =?utf-8?B?Uk4vRTlOS2JsbUdmancyUGkzOVhBTk5ZM0hGeTZxR2lMZzJNRC9hVXNKWDBt?=
 =?utf-8?B?a3VsYVo2T3JIQW9tVjJtTURXTm9jeS83SjJ5U1BmTmFuZ1lWblJMVTdzNlVy?=
 =?utf-8?B?SGlHUTdvODQ0K1dWR3lqamN6Ykh3MjBBa2xTZHJKYjU0UUw3dk8wMGlJY1pi?=
 =?utf-8?B?QzdOanJiQnQ0anNEVTRJTFAzVFBtaTNiQzgxdjlreHE2ZEZYN0xEeFhZMjlt?=
 =?utf-8?B?TEc1TlY4YytIckVNTDN2Tm5wdEUzb2xWeDBKdUdrN2pzVFV2Z0dnamsyc1BO?=
 =?utf-8?B?SmxSZEpVKy9Rc2VhNWNvYy8wN1Q3NWlFNzczQ2U1aVk4OTI0eSt5OUpWVFZm?=
 =?utf-8?B?c1BndVdPaWhXeENlc1Q1SmRvV21YL2VoSEZtWHdhU3FLdFZzMEtUNEhLVnFX?=
 =?utf-8?B?NGpvNTM1bGxXQXlzdGhLaUNpSVVOUG4xQzV4REVTeldudW5TeG9ESks1ZGlv?=
 =?utf-8?B?V0JiMWdYMmFSNjFhcHMweHpCakRGZkw4YWM5a3M3NmZWRzJlcFZrZXNqRGtL?=
 =?utf-8?B?c2h4SVR0a2Ftak1DaldXV2svQzg1ZFIzcXFMbktYR3NyRTJTUC9IaDQ0OHBj?=
 =?utf-8?B?UkxGYVpxcHEyTitrSEZsemdvTXFpUmRPdHFrWUlDTVBBWGY0dGFaL05KSGJv?=
 =?utf-8?B?OThlcnlMTkpXT2tCdTdxTVNNc3Z3aXFDeFFJTnlMOElwNnFuZkRJUDJadmtV?=
 =?utf-8?B?YVZLM2VNOEZWOFNJUFZTQzZkcUFKMEdyWHduVnhOTERENUZ6MjNRemdwZkkx?=
 =?utf-8?B?MzlEOVo3MnYyV1J4cGVRK0lTNUMyL0hRcmM3RlMzOGFScTZnTXpHZXpXeStW?=
 =?utf-8?B?aW96Nll6K2xmZUlZSFNGRkQzTG9FV1lqUTJnbGZicEl5UG0rVmx5Q3FwdVlQ?=
 =?utf-8?B?N2M4S2JPeTFzUUdGU3Z5WGZnbXIySjY1eCtmK2dOa3NvdVNKM3RQRDl0K3pL?=
 =?utf-8?B?RjVXVyswSnZ0VzN4ZmZTcFJWdGNpSno4cS93b0lWVEtOa1ZwK1dWWUZsVUpN?=
 =?utf-8?B?dkNVbUNZYlQwMzBGcmFSOXR2NmRYbHErNnE5OFczM3I4ZkFKMFJodXhWTWZC?=
 =?utf-8?B?VGVKMFNSMm90elI2cjNwZDFzdzA0MjRad0dxMHhxNCtScUlPQUlaTWNQZXZZ?=
 =?utf-8?B?SlBRMEduSWNjTHNBUHRCaXFsNVFBZXE4RThxenJqUFdOTEFzcUFxUkhGeENl?=
 =?utf-8?B?SFlwcTRDek9rdlVWNzc5eFRNTENPeWROOVQ3aXRCOHRybEJaZWdHSnVYc0dj?=
 =?utf-8?B?cGpHanY5RmttVC91TkhQaDF4bHlkNXhlc1BMT1dXbUNkWjk4MEE2ckJYLzlF?=
 =?utf-8?B?YmxJZXcvL3JJRXRKL2pweGJRTGpMd2JKdTk5Q0lxQlFUMmF5VDFXTWJqUC9j?=
 =?utf-8?B?TXg1cjg3MVE5ay8vMnNhV0NBTXRGZjZOcmpnZ2tKNjhMaXhmNDNLRVc4V09N?=
 =?utf-8?B?QlMvRWpGWWowY0FtaFRqdlFJSytSSXpCZTZPeXJxU3grdVE9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BECCF080EBC3A9449F42B1DD15AE9C96@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10230
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF000509F4.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	96660a70-fdec-42f5-412f-08dd15420f66
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|35042699022|36860700013|14060799003|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NkdwRW15WEtBZDV6b2ZwNm1PVnlaay9BT3lVZWl4MzB3TzFTRzdxaGVObWNT?=
 =?utf-8?B?U3BleS8xMVpkLzd2RnBnbmtOc2xlanoyS1hPZERpSkY4YWEzSlJ5Zm5GRUVs?=
 =?utf-8?B?NmVlaGRuZU45QkNTRlQyQW5kQ05rV3VPZUgzMG1aU3drRGpNZ2E2TXhIUFQ4?=
 =?utf-8?B?TUo0TWl2eWhXQTdSd1FhbWp4UEpBVlJtZTduUGthNUJjSTBOc00wenRxRHhO?=
 =?utf-8?B?TGxWYnVLNTI5c2o5em1nWERvTHVsZVY4U3RLZXJKRHNjWHFFNDNEcENkcE9N?=
 =?utf-8?B?ODhNNU4zM1JjdFpLZUJScEUrc0dLYXRObmZpR2QzdGk1NklERTYvdHNxQ3F5?=
 =?utf-8?B?dVZQZW5DeGU5dFArZmpKMDhTd0NjL0wzeEhqTDlFa1ovM1BoSlZBZHpmeGZ2?=
 =?utf-8?B?K2djVElSSWRwZEdzTGd5SzM2cEE3d3kxYUs1MTlLSEhMNWRiVFlGT1g2blgr?=
 =?utf-8?B?UDE5cDRPMDM2MXM2REVxaTFFbnRVTkZkOFBSZ2g5VjU5NVRodXpWQStJWTlv?=
 =?utf-8?B?U2hXWlVNN3RDS0xCZnVLS1BqNzc3eVd4MUxlNDZNQWd2VFBnOHNTTDBUYUhH?=
 =?utf-8?B?cytiNmhzSFduRW12S2lIQXNKYXRyeXNyY0VnejZReStzSUxpLzBCNWVlZ2dt?=
 =?utf-8?B?NUVSZE9XeVZXNjIwTThCTHA4a3RYWmJ3d0ZEaklmWXNNWWl2OXZkUWNiQnJ3?=
 =?utf-8?B?Q01BWEhIUVMwQ3htUnNCOStuZGZTcElDYlVjRS9MazhMZDNvWFhUY3Z1Ukty?=
 =?utf-8?B?WlhTYzAycG0yMlNRNTZtWFFDaHk0elFJYngzek1CdGdUT3YzemlXYkNYckFB?=
 =?utf-8?B?SU9xOEdscUtGN1orNmNFb3ZBUkJ5aEdQaHZXOCtwWkc1cVRvZ2R3QkpsV1dZ?=
 =?utf-8?B?Vjg5ZWp1Smt5YWZEaFhHSnB3N1RLanQ4R2RyYVgvRW9kMU9OWW0vZW85TUVK?=
 =?utf-8?B?YUhFV2c2cXhUZ29MbW1uYUlUb0tYSkIvYzZ1M1NmSUFQVktwc0tZR05yUHZX?=
 =?utf-8?B?S0hpOVlZeldJYU5YTm8vWWlWLzYrT1NMYldTeUNuZ0xXUFhqd09uSkdJZXox?=
 =?utf-8?B?TEdpTThQMEVOSVVXZUpSYWRTcGxiajMyTTlGUVVlZDRyMTVLWTZ2MGZRRjdO?=
 =?utf-8?B?QUJWOE9TNWMrV3B2bmo5WnFPRHZGM05jNXVJbm5hY3RtQngvWXUvUnpHQmlW?=
 =?utf-8?B?NklFYk9JTGJJTDltdTFyT2d5VkNURFFlNTJ6RklwdlNuaFpkdFFFWGc3Zzkz?=
 =?utf-8?B?MjNrOXdRQWxFUXkrSEIvR1E3RnFMUFE4dUMxUXNkOTBESWdROXdPZVlEVEdX?=
 =?utf-8?B?ajYwQWJyYTNRblpKWElRSWk1Tjd2RUJtL0N5Z1Y5bFpkR3kxeGxkMERDOEJu?=
 =?utf-8?B?NllKci90YXQ1dW5RSmV2MEJmNytsRmZ2QUFKNEp0dWFJUHIxMk5saEx1UCtP?=
 =?utf-8?B?L3RqTDB3M3FLU0FFQVBlQ1dHMm1CRnhvckVESERKejdvYkpGaXErU0xXd09V?=
 =?utf-8?B?ekFDcStYcS9mbTgxdnlGckFFbWQrakpUdUFqVmhES3ZsTmRLTDVIQTZraW9y?=
 =?utf-8?B?M3o1dXMrdkE2SEtEeUZaam01WTN6ZDZlZkN6N1FqOWl6QUhSTnlZTUhOcHpS?=
 =?utf-8?B?WWlJT0o0SERjOHFPNkExN1kwc2U0ZktSc29SODJMN1pRWUpBYm8wSlAvM1RL?=
 =?utf-8?B?Y2grV2laRDlRNWNEVlV4WG1wVzVjMUxSOVdiYzlUK25tdXpnSHl6RzFhcEs3?=
 =?utf-8?B?Q1dYeld1WW5JaXMzaytIOWc5U1ZrQkFMUFRoRHJIbncxeG5LVkN6M2V2cmcr?=
 =?utf-8?B?dGI5U3c2cjJYR1p6Q3h0cE5IQnIxdDZ6NWRWM1pXNjZNQkNMU1V6ZkVlS1NX?=
 =?utf-8?B?c0JQYjlDQXE2UHo0a0Y0VWgwS0p4V3ZqamZiSXVhc2UwYkgrSGkxNllrbjFE?=
 =?utf-8?B?UzNwcWwzQnIyd3lzSDFPQWFmTExxV2JwdFZERXhiL0JZQ1pYNk8xcG9vMDh2?=
 =?utf-8?B?c2RzSnFybHZRPT0=?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(36860700013)(14060799003)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 15:32:52.4022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c24e71-0c26-4ab9-cb58-08dd15421530
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9582
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 15:33:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208385

T24gNCBEZWMgMjAyNCwgYXQgMDY6NDgsIEFsZXhhbmRlciBLYW5hdmluIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxhbGV4LmthbmF2aW49Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiArUEFDS0FHRUNPTkZJR1t0ZXN0c10gPSAiLUR0ZXN0c3M9dHJ1ZSwtRHRl
c3RzPWZhbHNlLCINCg0KVHlwbywg4oCcdGVzdHNz4oCdDQoNClJvc3MNCg0K

