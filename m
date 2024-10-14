Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E028FD1A45F
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 11:02:25 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.52])
 by mx.groups.io with SMTP id smtpd.web11.52267.1728903740341298439
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 04:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=m7HQ+SGf;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=m7HQ+SGf;
 spf=pass (domain: arm.com, ip: 40.107.22.52, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=cZIEc1eOESfsHJFVTmTsBWQ8y2lIuor/TXUPHqlsVQl/ez4ztW3sXHF0Dlb/hT8cz89vPNvdVchxQcJQ7pbvPRb5isaKRouhbMiI0z0eDnhe+4OpgYDff8vYcoiYVdrY1ExlRicqDmrVvR1ywVL2LTXv1RoGBlThh63xayawXya4HsftNTwCngQQPb1aAhIukA7KXRIAnrH2GhGwmcXwThKR+o3+RZzv08uKiKAeOKfTj87NJ2JvvO3PW/royArwV3JUoEqQI7Ism4YVFB5GsjNbcBbS1pj3AuYDovbu8R3xSRoxqN/0scmO1Iy6VsKAk3XkvhPm3wyxHPHfB4uaJA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3gai5d1GhXCfyCeIbjQqt67qkm/pHUnZFZ8OT9hW2Y=;
 b=gYv3r3p8qsxTJUlnMn5tW+vJZwxn/26tnLDdin/pJG25kVGgBiKRr1sMQH6Ssrl5mQBLTUrgKD2uVzf9EZnR6zWoGvgxaXevALCw04Bvdisp5033yoUognfL/tiduvW3BBP/zGyBitSp2V+98+28qB9IGwbRFv71ZGdmHQbmdiDSAFdRJtsRZqq1I+LjxwHq3O2ZXU6O27v14sDkRf6VxQRvQJH5G9OJGudN6Zu4LhNNlsK99h8LVec02Eu3cac6PBCMsi4RwV7YYauZwnqNnlTZtHIWXMutBuf0cBzL7+f5jZwHrMcDKv2dFOV8tY60KenJZgJnEuVIM2MSPxXQJg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3gai5d1GhXCfyCeIbjQqt67qkm/pHUnZFZ8OT9hW2Y=;
 b=m7HQ+SGf2IUsbL9LmqZLyNPfWGGL9WLkiANAZd7XBOzvOtWIA4eyHCH4OjoM45uKZhQmeSBFJEgT1m9cVZ4i6tREEqHg1jmlaQUKOrgFH/JtlWeiqStyPrBtsRJBvz8ZDMG/WB0qzfF3Uv7dCnSNEW3CKVoCV6VBhXb1IdAQzFw=
Received: from AS9PR05CA0053.eurprd05.prod.outlook.com (2603:10a6:20b:489::33)
 by AS8PR08MB10289.eurprd08.prod.outlook.com (2603:10a6:20b:636::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 11:02:16 +0000
Received: from AMS1EPF0000004E.eurprd04.prod.outlook.com
 (2603:10a6:20b:489:cafe::5e) by AS9PR05CA0053.outlook.office365.com
 (2603:10a6:20b:489::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.34 via Frontend
 Transport; Mon, 14 Oct 2024 11:02:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS1EPF0000004E.mail.protection.outlook.com (10.167.16.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8048.13
 via Frontend Transport; Mon, 14 Oct 2024 11:02:16 +0000
Received: ("Tessian outbound 40ef283ec771:v473"); Mon, 14 Oct 2024 11:02:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 63819240c6a0a59d
X-TessianGatewayMetadata: OHHCUADoHFd67Im1fTdB0C7Kv/RBXBE5zYoUemJq6CcoJXWxtrR+RTkmPiMk86krx+X+22gcbBS/VsmWa1/lM9eg/kZq8dq2xDXs8Nifu1d4Rq16ppmCCbNC8DVdNi5WI/dGQswqO2Kf2z8h4DzEgk5p3jp/9tzfL5tXS2RFpto=
X-CR-MTA-TID: 64aa7808
Received: from L6faafb12fcdb.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D589C6E4-B5EF-4F4F-9C22-DBCEA8EF1B83.1;
	Mon, 14 Oct 2024 11:02:09 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id L6faafb12fcdb.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 14 Oct 2024 11:02:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sgQvZF/SKY29RwJQ5TSET1aQ1I3IH7Q45xrzKfpPj48NOlVzRrfmJVRHNGlhr1V3DLFTtu/en0hHXA2i6rw+B+1FPdjsj3bkHe7yC+lB/1qH/iH33K3z7gc//jci23uo1mN1IyDE7qyreMDy/gOjiluZfht2KZotrWT8nIXP5SChIHxamzDwrbZY3ykXjVEUdCN0fmh2Gp5oUbtMpCybojtNtgFUyfT9iIe7VVuuXorRIiIX65dpsdyiEKkiG54amJcPJFrejQf49ddZ6slwjgM58cnCr4w0uRqiXyliM3YtR9OnAxU13w8JgAP5aGyJmpZ83RsQ87aLoB6HRDsOqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3gai5d1GhXCfyCeIbjQqt67qkm/pHUnZFZ8OT9hW2Y=;
 b=aTW6tWmtYyzFQbaUt/6NJ8hr7q95/GhU7IhlYEQHfetWBgryTYwVyGvTp7SNG8XqLVRrFpdr/sCMR0stRfKJ5L+g0PJHukez83dbhH04kjM7ATBmB6LVFe4nMaoY02+rFb/b6Xw1vEqRZhEb6ScecYDbyjmqLDqH3OmikNW8raZX2LJiSDFInJWxInxZO0jeM6Xrsw6N/TET2HR/uwAajswHSU/HejmoDMcNGSGaFZhX05vqcYuitcXqvABc5mgTC7VaO3AHPs/7zS6Kd+58LTkvdTsVM/WxSs+XPkR1U1c5v0Rq1qsYzxAPdJOtZo04w/mn0yf2JWrCnWfD/D1PcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3gai5d1GhXCfyCeIbjQqt67qkm/pHUnZFZ8OT9hW2Y=;
 b=m7HQ+SGf2IUsbL9LmqZLyNPfWGGL9WLkiANAZd7XBOzvOtWIA4eyHCH4OjoM45uKZhQmeSBFJEgT1m9cVZ4i6tREEqHg1jmlaQUKOrgFH/JtlWeiqStyPrBtsRJBvz8ZDMG/WB0qzfF3Uv7dCnSNEW3CKVoCV6VBhXb1IdAQzFw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB7440.eurprd08.prod.outlook.com (2603:10a6:10:357::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Mon, 14 Oct
 2024 11:02:07 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 11:02:07 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: ",openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ffmpeg: Disable asm optimizations on x86
Thread-Topic: [PATCH] ffmpeg: Disable asm optimizations on x86
Thread-Index: AQHbHaSBMOhYGl5yEEmKWkgYxUun5bKGFa4A
Date: Mon, 14 Oct 2024 11:02:06 +0000
Message-ID: <1506FDBE-46E2-49A6-A6B6-01AE3F10BDF8@arm.com>
References: <20241013191703.317096-1-raj.khem@gmail.com>
In-Reply-To: <20241013191703.317096-1-raj.khem@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3776.700.51.11.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB7440:EE_|AMS1EPF0000004E:EE_|AS8PR08MB10289:EE_
X-MS-Office365-Filtering-Correlation-Id: f3d1216b-be2e-4be7-cd01-08dcec3faa52
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?eXltbkRRRkFNeWZtakh0TDMxSUVqVkJSYkNwL29sV05nMStVTEo1V2NlMmc5?=
 =?utf-8?B?UlFzY0ZSc3JjMEw0dTV3ZmhGZ3c2dzk1NnphMDJEVklIQnlEYmp0TGthMk5E?=
 =?utf-8?B?bTdpUUpNZStHdU1kdGg4UFlvUmhvcUN3OFdhVEwxYnB0dzdzQmVPcWltMi8v?=
 =?utf-8?B?MnUzNGZtRDdJZ2p0NkFiNkNneDQ4ZHJjbnRZQVFMQlBLN29Jc0tSWEV5d0J0?=
 =?utf-8?B?WG13emFsbzFXQnQyeWVWbzI3NzU0cmxONm9jZHFiZ01qUnM3RktYUW1rcDAz?=
 =?utf-8?B?L2RnbXU1V00wenA5M2pLR0JqOXVOdHNjMXpKQm91eVd2ZWx4VVZxZTQ0YnI5?=
 =?utf-8?B?VmlLaGE1N3NZdmE1YXBtRElLRFBFeHA3d2ZDOEs3RVJ6YSt2MFlxMW9MaDZP?=
 =?utf-8?B?SVZGd0NRWURqRGZ3TkI2NmpvVHo0VytKZmtUaVNyeWhrb3pDMWZaekJnS1d3?=
 =?utf-8?B?S0JTQ3NFRXovdzFzaHhNSm44VWZXK0Ezc21samZ0Sk9ySXNwazFNUGdGeW54?=
 =?utf-8?B?Q1N2bG5QOW04OVAxTVJDNmZCc2N5TnowY3JmejFaMmVBSGxqUHp4Y0NuZDl4?=
 =?utf-8?B?bmQrcUpZYTdNaWhMc0JIQnQ2eXdXUEtVdkFTbmUxSlNMQmZpc3JYS1lISk82?=
 =?utf-8?B?NDZmSUR1ZXB2eTdoc3FKeElDaEdRSGZBclR0RUJSZE5QZFU4YWl3OUxzcjNx?=
 =?utf-8?B?RUlEZDQvNmpscmV0RVN4UEV6UEFxMnIyMEdBRDBoUVplM2tiR0xxT1ZINC9r?=
 =?utf-8?B?TG5MN2VFVTZ2cGVubjNhZW05b01KTmducHp4THc4NVEzSnMxdk1ieUNJTWhX?=
 =?utf-8?B?RjRpMEh1Njdlcjg5Z2Z3OUcwK0lhd2UyQURyRDhRUGpzQ3FST3VSemEvbGVr?=
 =?utf-8?B?NXpBR1RycUlhblFZZEN4bjNCSDI3Tm8ramFFZVB3OFR3UVZHNmQ3MHlaYnZh?=
 =?utf-8?B?QnRHM3hyUHl3dEZieGxuTkMrUTNna3NTelBsSzlZQVdLZDlSak0yOVJxd3lO?=
 =?utf-8?B?MUU3UGJtNWwrUW5VU3IyelZkcytEZjdZc0kyTG5TdnFTWEozUU5xdGJDdkZG?=
 =?utf-8?B?Q2RqYTdXa0JSZ3pxdVowazlBaHk3c2J4WVJDSlhTbHlmNDNidmM4UUlaWWFv?=
 =?utf-8?B?NGdRRkJ1Sm5ycy9hS2orN2l6YStjVm4yRk1jVzJyTVlaVjAra2IrcFU1Nmdm?=
 =?utf-8?B?OTVZR0dqTnV0T29wLzRNbnJBWEVjT0MrQ2ErM05TbER5N1pUNVBLb1FmeFYw?=
 =?utf-8?B?NnhFejEvdmthdWRmc2IxYWVpSzZXeXdsVkJuMXRQbWprQ3VXWUJIenN2MzdM?=
 =?utf-8?B?ZjV2SGtWcHFlWWs2U3R1aWJIK2E2b3VyeVhDNWpvZERSNlNtVVEvNHllODFR?=
 =?utf-8?B?SldMQ0puT2RVSlArbFRJSXlCUmZjRllWenBsTXMwbkpPVjhZeDhXb1N3SHVa?=
 =?utf-8?B?K0dLalVaVDFTOWR6RnJ4TEt3TVEyQitTemF6RGo3bVhLNjVvRit3bUdxeDl4?=
 =?utf-8?B?NjdhdkdIVXQvd2o1QWc2ZVFJWUY1Qk1MSGY1YnB3ZjI5MnZISVZPSGZSMFZM?=
 =?utf-8?B?YkhValpHWVliT3c4aytnTGFWcUNITmNUQVhsK0dwczdYMmh2UG5zc2NZTTMx?=
 =?utf-8?B?Q1ppaGU4RjIzWEpvcnlCR3IxNVAwVWZFeDlkUmtxSnpHTnBSb3Y1RWpNR1A5?=
 =?utf-8?B?OUo0SFBFM2NpMUpXcEorbC85d0N6djcyOU9BdGhkNXErSnFGUjhramtVSXVx?=
 =?utf-8?B?MkVFQW1CTlhSWHBMVCs2TlZBZWVJT3NTODBzZ051cVp2WkdHeVZpbURpV0ZP?=
 =?utf-8?B?eGNSbldZSlNzdnJhcjM0Zz09?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BD17C5314229EA44984AE1770B51E32D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7440
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS1EPF0000004E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	fc052d45-a92f-4fa7-944b-08dcec3fa4ba
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QTBnT3VtdEJZeGtYaGpMSFBhbmFtTE40RmVOSlMvTHh5cktLNldkeFd0WFNa?=
 =?utf-8?B?MWNOZDF6aHRKZnQyT0xoS09Ca0V1SDdONTdVcEU1dzVteDVSRzYzcHlWb29E?=
 =?utf-8?B?SEZUZm9RU1N4dCtBN3IxSnlUWEVvOWkwbnJYVXI1ejlpV2JRRmdBRVpoUGNv?=
 =?utf-8?B?cHhXb1FIK04wanl1L2VEQ05NS1FyeC9sUVpmQ0psKzRtTTBpWElIR2Qwd2JR?=
 =?utf-8?B?RVNrL1lkdE01NHliVklVbXZ4QnVocnNqUW1iamF3K2RtYUNDK3JqTGcvSUxQ?=
 =?utf-8?B?K1IybWd2aFNFSmVDdlU3TE9QSHdTMmJSTURtMndTNGVseENuOExvN3BZQkdI?=
 =?utf-8?B?dlhHeDVaSmZYbytGbDFyZjIvOHQrQXY5aWZwbytCbEtQVEhXeHVydXIrOTNx?=
 =?utf-8?B?MmVhcGplN0t5aytsTzRyU2hXYSs1bkRBSHJaMlNQbDYyaUg4QlNLY0hpaVNN?=
 =?utf-8?B?VHFHTEZjenRwSUJ3S1hTYklNV2c2eVZvVWl0RWJqSklsRDAwemFldWNHNUhF?=
 =?utf-8?B?V0FpVGFUWkNFQjNuWENEdEJodDJxbWJUMllHVTZpTmFjSFdIMnJQSHZ3Y1Fs?=
 =?utf-8?B?clBmWVp1MUlzdmp6cHVuR2ovNUQrdlhmTE1xYTZkWjIvYkV1UmhmeUtvNmtJ?=
 =?utf-8?B?VTdYMjdJUW5QbFdEK0dSb1hjR0YyT1hiK2Q2WHNUUHJLMWFOSHFUbFZqb2JZ?=
 =?utf-8?B?TUNjQnNCQUc2aXRBQ0t0T0VPVDhweHM5YXVzN2hiTUhrNktqOUljUHlZaHRp?=
 =?utf-8?B?UE0wYWg2SjNDZUtXZ2dpcVdiOGdzYjN4MFhCcFYvbjJYUFB5aE9QWDVQQzA2?=
 =?utf-8?B?NW5jOEZYK0pFUnYzejUwL0pWZ0s1SnEzWjhIR01seEg5Yy9NRkNEeW96cDIx?=
 =?utf-8?B?bzdrUytNTGd0T1FVd0JqVkNzTWpBUVF0Z2hCbHI4OVVzbnZTV2ZNdm1XNWhU?=
 =?utf-8?B?TVFJdEZEVThSN1k3RE5Td05HOENrS3V6QkN4K1h4dXY4WndtTzJEWWtvNTg5?=
 =?utf-8?B?RUpSL0ViZEEzSE02L2dIVGlYTnFtYzAwRjQzb0tTZExPVWlBQ2dSc1h3T20y?=
 =?utf-8?B?UG96QVlnSzhtNFI0c3BlaEJlMmVsS3hKWGNCb3c0RzZTejBVVHQvdjhiL3FT?=
 =?utf-8?B?N2tLVVVHalU3cDgxVWZPeTNjQkN3NEozQkdMY2lxaFdFeCtBeGNGV0JTc01k?=
 =?utf-8?B?SUdHVlRRRkxpNHBkUHFBQmo5QWwwTlV0WHplMWVGSExkTmJMYzVDZHY1OVFN?=
 =?utf-8?B?NnlQV1dTZG8wcE4yYTloT1A5Q1lCa1VpeDAzVWUvYTJIZFhnR1pXeUNNQ1Vm?=
 =?utf-8?B?THBaZFFjaXY3bW9BclZsZFJHck1mQXlyUVkyaTE0NDM3elo1eUxWaVJDcmtt?=
 =?utf-8?B?UXZPd0l2VURsRUR4WjRVY0RzZFNhSlZCdy9WaENpVHhxOVlSOHQ2cWtUdWsx?=
 =?utf-8?B?RjZVOTd2OGdwdVY5YnVXejJzMlFMYlhkdkZYRTA2ZXNjMTJiUTJLdEFHRDVV?=
 =?utf-8?B?Ry8xcDczV1BOQkJ2RnJwbHRzdmpUSFRPQzJjQ3dMazJNRnNWekl4L1FzbWRE?=
 =?utf-8?B?UjJoaUNEa2VsRkw3MDVuZnVGSUVlWHRNQ2h0ZEZsYXdsblAzaVg5NU1rZ2Uz?=
 =?utf-8?B?S2hGT0t6S1paY1Q5YnZnUmlKOGl0bms3VTFaRDZRN1ZvSlBBUElFd1FHVTAr?=
 =?utf-8?B?NnlTU0EyaHlFYjlaOHc5RVZqWE1zSFZLZVVJOXA5RlkvOG1EOExoSFdEM00y?=
 =?utf-8?B?eEczcnloQmY3THVTQ1ZOSjZtWWI5N014eU1XSlJIOE1TY2dLNWk4bDVwc3N2?=
 =?utf-8?B?SlN6NHozNmJZM0JlN2tqT3pRUFNPZTRmVDN5ZndiOGUzdnlrQ0Z4eU92YXp1?=
 =?utf-8?Q?r3ArYWUcy42DJ?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 11:02:16.3946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3d1216b-be2e-4be7-cd01-08dcec3faa52
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000004E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10289
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 11:02:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205749

T24gMTMgT2N0IDIwMjQsIGF0IDIwOjE3LCBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPiB3
cm90ZToNCj4gDQo+IGRpc2FibGUgYXNtIGNvZGUgaWYgUElDIGlzIHJlcXVpcmVkLCBhcyB0aGUg
cHJvdmlkZWQgYXNtDQo+IGRlY2lkZWRseSBpcyBub3QgUElDIGZvciB4ODYuDQoNCkkgdGhpbmsg
SeKAmWQgcHJlZmVyIHRvIHNlZSBhIHJldmVydCBvZiB0aGUgdGV4dHJlbCBjaGFuZ2UgSSBzZW50
LCB3aXRoIGEgY29tbWVudCBleHBsYWluaW5nIGhvdyB0byB0cmlnZ2VyIGl0LiAgSSB0cmllZCwg
YnV0IGRpZG7igJl0IGNvbnNpZGVyaW5nIHRyeWluZyBsZGQuDQoNClJvc3M=

