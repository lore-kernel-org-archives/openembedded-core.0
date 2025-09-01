Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF87CA0FFF
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 17:08:21 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.65])
 by mx.groups.io with SMTP id smtpd.web11.57350.1756746492339077850
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 10:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=joCl0ufU;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=joCl0ufU;
 spf=pass (domain: arm.com, ip: 40.107.159.65, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=omPUYXWOPnDEKlwP49dN/veZup9eoOt1RGhUOt+ILFynbF+33EZQLWeAPijkVqZAS0deqzR+KX3tvhaSX4gbzzs124r7w0XJrN/K4vVpEYZ6fAeF/1Q7W9EIMMW8fKALVrAWGRLZZR1zmCANdHWp2xYIykBK2njqXKe/VqBf4WVwTNiyBoPVcZHHVEbS2TpNe1qV54OOY3i6SfNGKeWmU8Es/pp+plUvtXiuUI7czG8AT1XDDGPYgVhtA+tIHKDySzyJ0mrtpHTD/gciRITH8GpL7qbBmtk9JRy1KxLTgEsjtXrcJRSOvW2Yp1QmGbxjrW/RpyPOE3XnWkmYMcsOiQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qQatIN1qOHuDvWXB3bFJ+dveMFFRTsM8OqmvRiE/2PU=;
 b=lskFgBwQlUG6kmw3tdzsDrNRymQ1r5+pKUViRrAW45ig7KBubPxOKV2wTCxupuoBc936Wgfy73fnJuz3BRkAZx0vyfY7Q/Xn+8wSDg9qMTBDu/85ygRlxEStK8pvuh6NcWf68tArak7fhOO5GsYH9OwhHC6bbevpRpOtTeRyYQAPTT93PArKH2m4ekR0bXZyslkRwILJeju5GBVPuqSFMlLqJZ9Y2CTYHCwTFL+4EVUC8hhYov6xKV2yx5GNHPi5pXbRRZTq7bGrLlVTfi+dYG8IlnSj7SYzjDWQcR8YgqxjweXpvTtrp0bI7wQtv2bP/NLSaTMHniptcBwXlA1DHw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=axis.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQatIN1qOHuDvWXB3bFJ+dveMFFRTsM8OqmvRiE/2PU=;
 b=joCl0ufUKgzOFxEftNE2U73fM4oKrdg2DCaTxmpiYeKni4rAm3ol8z1LUmTfHf67l5ExjIbQGw+wOvGVI9BCsuRS3ujXYFIYZI4S+uS9GYLRbqLHPEvi+712/0n2YpMlZOBnJhxvZQXr5iNQhkrKz9cBgL4fCG04+wZQdBj7CkY=
Received: from AM4PR05CA0030.eurprd05.prod.outlook.com (2603:10a6:205::43) by
 VE1PR08MB5680.eurprd08.prod.outlook.com (2603:10a6:800:1a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Mon, 1 Sep
 2025 17:08:08 +0000
Received: from AMS1EPF0000003F.eurprd04.prod.outlook.com
 (2603:10a6:205:0:cafe::c9) by AM4PR05CA0030.outlook.office365.com
 (2603:10a6:205::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Mon,
 1 Sep 2025 17:08:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF0000003F.mail.protection.outlook.com (10.167.16.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.14
 via Frontend Transport; Mon, 1 Sep 2025 17:08:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RBjT/pfuuiyta5Xazonxx4zOMccethbH+J5lCfx9iQPXbNOEDOm+724Sxt7Xgucx7XskAOMeaTchwA38eOsn3TcaBm5sEgu0e/w1kvQ9HRZVXU3nVwxsEZsQZ++oJdxDmjGSBR/7OInh1RJWBiKwGw//ncYpELXDLB2aVcv15QaT8Hv4k46y1T4CZbroEkEt6JFtUen4aSnRFJj/hKJeYvB7XgNzNl0Ji9S+xxUcTlv9EXFkE7VYQJB0K/NKSFTEJm+n64qKNUDsh/+ZpsbsABn6dpRm+M9O7Bu+T89RK2EwT2QQjYKFAN8slTFVEvn41pPojhGbZY+dYUZAanmxpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qQatIN1qOHuDvWXB3bFJ+dveMFFRTsM8OqmvRiE/2PU=;
 b=rV79nEwnqNMTTC7N8fDKXFQJpgdVOc6P/dVgIH3YHNpS1EkDMVay9bs0Yt8FoMIVKzztZwuHAeG7ofpG09gXA3A5i8PD+t43j+/q6Gu6w3uv2CptsdqAoUIkUBKcJjkx5ocoNI8FpRg79+Idhz/p93UWMIFCFrMDgK4+s6xfiU1bWgAoBP/3Cy0cq2CYBjZcj2sBVb7g5vYitXHZJ8+cDxbIdcvwHMV1QTY1BAOThmsKWJNFCpYjmTqvVCQtwXwSy378wCZjz/RmCZVpzI0R0eNumenbnFm5xzn7Z8u/PRiJofIANxwYgzjzNm77HNC4IRiZDv/vcTTLNFwBQry0gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQatIN1qOHuDvWXB3bFJ+dveMFFRTsM8OqmvRiE/2PU=;
 b=joCl0ufUKgzOFxEftNE2U73fM4oKrdg2DCaTxmpiYeKni4rAm3ol8z1LUmTfHf67l5ExjIbQGw+wOvGVI9BCsuRS3ujXYFIYZI4S+uS9GYLRbqLHPEvi+712/0n2YpMlZOBnJhxvZQXr5iNQhkrKz9cBgL4fCG04+wZQdBj7CkY=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS1PR08MB7563.eurprd08.prod.outlook.com (2603:10a6:20b:472::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Mon, 1 Sep
 2025 17:07:34 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9073.026; Mon, 1 Sep 2025
 17:07:34 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peter.kjellerstedt@axis.com" <peter.kjellerstedt@axis.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCHv6 1/2] systemd-systemctl-native: Install
 systemd-sysv-install
Thread-Topic: [OE-core] [PATCHv6 1/2] systemd-systemctl-native: Install
 systemd-sysv-install
Thread-Index: AQHcE5Gu3hub3ENj5USgeCDFH/b1ebR+nqIA
Date: Mon, 1 Sep 2025 17:07:34 +0000
Message-ID: <6E431FAE-B310-4817-981D-9A1DB4963736@arm.com>
References: <20250822182038.1295769-1-pkj@axis.com>
In-Reply-To: <20250822182038.1295769-1-pkj@axis.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS1PR08MB7563:EE_|AMS1EPF0000003F:EE_|VE1PR08MB5680:EE_
X-MS-Office365-Filtering-Correlation-Id: 16c18cf8-66e0-4891-3bf3-08dde97a1eb9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?clF2anBNQ1FDQXVlUFV6M2NaR1NYL2dQSmVZTUZ2eTdlMllJTUxOMWt3RzE5?=
 =?utf-8?B?d0NDaUtoZ011SmxrOTQrdkxhWHdZTmprVDBjZzNPemFGdHlmaG9LOVRVaW1E?=
 =?utf-8?B?U1dMS0paaWl4dUpxMjFpeXAvb0pISkFEM05jSkt3Y0RYb0hDR3QxbUptNitG?=
 =?utf-8?B?M2JzM0g1VXhJeG1Bc3hiVCtaTDNIQ0RnMnhRQXU4VWxPenVCTWNmMXZ4dzR6?=
 =?utf-8?B?dlN0bXhtMzJRRW9sYVpOUjJoZW8wTUdjNFhrM1RHakpyYXdDdUdPQVg1ZFhC?=
 =?utf-8?B?Z21zZW5pMjJCTXg2ZnE5YkQ5bXgrZkNnLzVjYlFKcVhhbE04T1dHdFZ3bnNS?=
 =?utf-8?B?TWhKcCttNnVHUXE1Q3hWSDF6VFpBUGRSNVZ2VWsyNWpUNWNUZ2wzc2F2Ty8v?=
 =?utf-8?B?bE1iWDYrTnBaS2kwdnIyaG9BUUd1dW44Q0VNL3J4UkpiTHFwdjl3dlNyR3dE?=
 =?utf-8?B?RXg1WXZ3aHJpd043NWc2OVI5MkZtYzZ4VG5SUTVDSFdySE1zNXdWTDl1NEpE?=
 =?utf-8?B?cWNyNHdlRnU1TUNabnIxK1ZWa0VVZ25nVEp4K2N0Z1JuK0h0SkZaQXdLQlJN?=
 =?utf-8?B?cnhDWFVPVzNmME5nRTJRbURUU3c5emdORW8vbFRQc1h4Mm1QSW5sSHEzY09l?=
 =?utf-8?B?elk3SlVjYWs2akxpYU9FNzE2QXVvMkxxTkJGYTFUM1hHbktPVjBTWmhHaTFq?=
 =?utf-8?B?WVByQVMyZTJqMTN3OUZMcE5yTnE3c2pRTnF1QmgrSU9mNFpHaTlKNTNPKzZx?=
 =?utf-8?B?bDNFY2lLZE9nY2JnNDFXS2ZOSmFIa0ExazZEblZ6eXJsVFBwK1Nibmw1UnF4?=
 =?utf-8?B?Q0phaVBaMCtKNXQva1R3T21ZQ21vR01XRS9XWkg2dWNKV2xyWjFrOVlaZjhz?=
 =?utf-8?B?NUx0UDVHL1NHa29FVlRsT2p1S3Zod0Z5Y0hzSWJPYW9ONGtETDdzRGR6MXJG?=
 =?utf-8?B?SFJkblVCcmtqRkhRNEdLV1F2NEMyanFoN1hKY0VMNWRTSk5xc0hUcFNUWnBL?=
 =?utf-8?B?aDhGMDB0WVFIbTJXUFk5RkZUZk5hRWh0bXdia2wrL2lDcTlOMHljZWNPOWp3?=
 =?utf-8?B?QTBURmJudUtNdEpvd2ZYYkw1WW9KckxjTWVnb0dpUU9CZCtqOWNkMVd5Zyts?=
 =?utf-8?B?SU9mWnhsREJOL3ptRUR4WFdYc2xNN0lHUGhYTm9nRGZncUR3cW5CdWlDTkJR?=
 =?utf-8?B?THBmeU9JWVpnUmxRRGJITVRaVzV6WExybVZ0WWd0a0kwRkYvTGJlc2l5elZS?=
 =?utf-8?B?ajhBb1FIN0JCWlNRL1JkbUdEeEFnWlF4TG1YR2syL2JlMk53di9PNzV3Rk1N?=
 =?utf-8?B?b3RpTVhpaGM5b2pIRGtSNGJ1eXNTVmJlZ1N2cDQ2MVFSbmt2cTBzaS9DdkRx?=
 =?utf-8?B?QXFsbGwrakszZWVYS3pXTmxqRHlYbjhadGllMWNiYXZTd0d0WkVnR3VIUkNX?=
 =?utf-8?B?ZXB6cndDY0lwT05uWkZVNkNwQUUvSXNLLysvR29GQlltYmR4S3VTbnl2S2R6?=
 =?utf-8?B?NW1sUHNhZWhEYmVmMVNSVk1GWTR1VkdKYlE0YjJjdFpOc1d1Y0J0elpkTVYw?=
 =?utf-8?B?blJQUythd1krWGo0cDI1SjkzbEdKaEswUllib1ViTlROcW5XNHVuVG9jTnBP?=
 =?utf-8?B?UjFSZHdiZmN5V2VjNjNteDVoak9HNGxtbENoRjZjeUdRRVVHQTgzSnRDOUNk?=
 =?utf-8?B?MG53OFFVV1NIQ0pOMzIxWlgzNUJhUld2U3RYZE9TeTdPZkN5YlFvNlIvSFVs?=
 =?utf-8?B?SWt6MXhkQlV6UVoza3dNbXE2TWNMa3R0WDZFREVVT0UxYjBib2dDR0lYR3pY?=
 =?utf-8?B?OHgzZHlCbzVMcEs3VWhORmlYR094SkZVblpxSHBBUlBVazdzYmRsdk13V0tq?=
 =?utf-8?B?SWJ1OVlFamR6ZVkwOE13Z2tpWEs2RUF2WUJhbGw3VHUrdmgzMWlzZmp1OFRV?=
 =?utf-8?B?cXpic3pnN1ozWlhxNWdBN1BLNXlCWXR5RkFSeXV3T0d5bVBhcEZOdnlueHpL?=
 =?utf-8?B?aHlodHhxMkNBPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <92FC9E8CD5318F48A707EAF20D684FE6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7563
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	0ab3a69a-f0af-42ba-50d9-08dde97a0b7e
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|1800799024|36860700013|376014|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UGtRbitqV2lnWHhsUzRVcXVRRzNWRlc1RHRualQwaXRicVdxbmlKbXYxeUwy?=
 =?utf-8?B?dnl6em1JWDFBVlVpRmJUcFd0OEo1WHlDamlRbFBRbjdzZyt3SEZ0czNML29j?=
 =?utf-8?B?QUoyMjZ3eWR6SHFMdE5rdjhNOVpkaGQ2dHNaN1ZtdFgxcGVxbFI3ZUgyL0Iw?=
 =?utf-8?B?aGxod0VoeEYzbUE1WXBBNVZsMy9OUU5Ia2Q0OXlSSy9EemIvL1lRNkQ3bk01?=
 =?utf-8?B?OFBNZytxSVNJeDZUUlY4WTlXaTBVTlRQM092eXBPZkdyQVVkYk5iQThnM3lN?=
 =?utf-8?B?a3lRdi9MQUFyc3l1UWpjMHdJMlRZbUl2ZysyelRjM21xWWIvNC9TajBYbTNS?=
 =?utf-8?B?VkhHbXpFY0xDejVvWGdPYUhRdEtqVDN4MW50KzY4RVEyR1djZVFVR0JFcnRQ?=
 =?utf-8?B?cXZYRktNZ3hzakNHcElkZk12d2t4bXJqYWNXQnp5WTluQVB3bFFLUGtsdWNr?=
 =?utf-8?B?cCtORUx5RlJtOUs3S3BKa1FTcG8zZG5LTFBGUzYyT1dRdkZxSmVOclYxWHZM?=
 =?utf-8?B?cE5uWE5UY3Ird3UxNmpEdmxLS1dlamdLL2Y5enBxV0ZhK3hNYStQVW1hS01i?=
 =?utf-8?B?RlFEQXY5aDR3S0tpN3l6Q2p6QWR0VlMxRU52ZGpzdEhiS3NybktiUVBNMkFP?=
 =?utf-8?B?SUVnUVZsZmdYdUlTQTd6M0c4WW5VbFNRZ3loNFVEOTlVWTVmcXo3bmQ2Y0dv?=
 =?utf-8?B?V0xjc252dEZ4QzdGZWl4YUV6aDY2ZG1kMzJEUkZKRUJWR2MvdC9pc3B3Qmlk?=
 =?utf-8?B?RDdTL0xhMkFjTm9HK084bFpnTmdTR3ZDRHRIeGpNdnh3b2NZN3ZVYlpzcFdj?=
 =?utf-8?B?WG55RmRuY2NNQkZPcWJQL3BnRVkzamFGMkxVdXJOMndxUURjTU9NYzNiVUJZ?=
 =?utf-8?B?c3VoYzN2bDJTdU05SVd3MFJHS2g2UkhZejdaMmRad1R0T1NPVURJekFsYWRB?=
 =?utf-8?B?MkpSR1Z5eUQzYmxIVWd1L2haQzB0YkVFQUdpQlY3RUxnUVlEd0hsUDErcWhW?=
 =?utf-8?B?d0U3ZElKd3c5WjhMZzNMUnllNC9FdlRENmxFVk8zdzJ5Y2hYTWp4TE4zc0Rr?=
 =?utf-8?B?aENRQTBqNDVSbU1YV2hxdTE3UmdPbElvd2dybW1hK2ZpLzNRTVJsUm0rU0pD?=
 =?utf-8?B?ODdzbVd2QWVsQnR5TnNKcFRsdHlMS3lxOG5NMXpMRUI0dHExZVN6VEE0MFZR?=
 =?utf-8?B?US9qZTJPWkVXYmNkSUp0QWJQUWE1MU1waWp6dWZETlQyYmR6R1NxYVdqZmNy?=
 =?utf-8?B?VGlSVXlBVnM1SEhTMnRiUjRrZVlWMVFKaUU4OVJrNnRWTjhXTFJSbFA2aS9y?=
 =?utf-8?B?V0tZT2Q4NHFVcWNWa3JXUTVBdHFkNG9YK3VLazFjd2pEK0ptZGdJRWFaelZC?=
 =?utf-8?B?aUdjQnhrdUtsVHNsM0R0R2c4bUgrQ1BUWmw1aXpPakljWXhNR2gvdjErV0JR?=
 =?utf-8?B?bVh2dXExNVdpZFJvUFFQSWxxWlBBTzB0TTZnUjRoaGE5TFdxN1pTOTdXOXZa?=
 =?utf-8?B?dUJzWjZ0QkJjZ2FSdVY5TnE2b2lwSFJnY0VKT2o2ekVWWmh2MGNBUWhjdW5Z?=
 =?utf-8?B?NUhyeDM3aTZXSVdtMXBKMlNsQXdYVENRdGZWYnJ0alFJY0pmdU5xT3dpN0M0?=
 =?utf-8?B?a2kwb1FwMk9jZk9GTTYvaXFscmtJV3hKR29XUkhsODdFcGt0d1BQU1pwS21r?=
 =?utf-8?B?ODY3RDgvd3d3cW0xYS9HYlU2eFFsaUJqai8vMkVwS2lOTnJkcWUrajNITmFX?=
 =?utf-8?B?QWdoZVZvR1YxWi9zVjFocnBRL2RPdkJOUHpjYkI0Qk1tSjZPSUVvbDEvVGNC?=
 =?utf-8?B?SVhpSVFQaFhHT0I1YVVkKzkzM0E2RmlvRE9ncFVHTDdyZkNnY1NJU25aazky?=
 =?utf-8?B?UEZtK25XTExDRlFKdDlmVk9EMlF5UXhubllwUVFXcUlOaFEyV3FLcDJBOHIz?=
 =?utf-8?B?OTFtbEVsRkJiVDJWUFhTVVhOelRmbFRJQWRJQW1PTU9XSCswbGJ1K05rRzlI?=
 =?utf-8?B?Tm5xNDlEeXR6RGxrU2NCcTNvWkswLzVZRVV5bjZkUTVCUTlkYXgzNmJ3dmc4?=
 =?utf-8?Q?7/6E2w?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(36860700013)(376014)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 17:08:06.6847
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16c18cf8-66e0-4891-3bf3-08dde97a1eb9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000003F.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5680
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 17:08:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222671

T24gMjIgQXVnIDIwMjUsIGF0IDE5OjIwLCBQZXRlciBLamVsbGVyc3RlZHQgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgPHBldGVyLmtqZWxsZXJzdGVkdD1heGlzLmNvbUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnPiB3cm90ZToNCj4gK2RvX2luc3RhbGw6YXBwZW5kKCkgew0KPiArICMgSW5zdGFs
bCBzeXN0ZW1kLXN5c3YtaW5zdGFsbCBpbiAvdXNyL2JpbiByYXRoZXIgdGhhbiAvdXNyL2xpYi9z
eXN0ZW1kDQo+ICsgIyAod2hlcmUgaXQgaXMgbm9ybWFsbHkgaW5zdGFsbGVkKSBzbyBzeXN0ZW1j
dGwgY2FuIGZpbmQgaXQgaW4gJFBBVEguDQo+ICsgaW5zdGFsbCAtRG0gMDc1NSAke1N9L3NyYy9z
eXN0ZW1jdGwvc3lzdGVtZC1zeXN2LWluc3RhbGwuU0tFTEVUT04gJHtEfSR7YmluZGlyfS9zeXN0
ZW1kLXN5c3YtaW5zdGFsbA0KPiArfQ0KDQpUbyBzYXZlIGZ1dHVyZSBtYWludGFpbmVycywgSSBm
ZWVsIGxpa2UgdGhpcyBzaG91bGQgaGF2ZSBhIGNvbW1lbnQgc2F5aW5nIHRoYXQgaXTigJlzIGV4
cGVjdGVkIHRoYXQgdGhpcyBwYXRjaCB3aWxsIG5lZWQgdG8gYmUgcmV2ZXJ0ZWQgd2hlbiBzeXN0
ZW1kIGlzIHVwZ3JhZGVkIHRvIHYyNTksIGFzIHRoYXQgd2lsbCByZW1vdmUgdGhpcyBmdW5jdGlv
bmFsaXR5Lg0KDQpSb3Nz

