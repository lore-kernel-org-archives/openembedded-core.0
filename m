Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72C85C19F2E
	for <webhook@archiver.kernel.org>; Thu, 27 Feb 2025 15:09:20 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.81])
 by mx.groups.io with SMTP id smtpd.web10.12816.1740668951178344036
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 07:09:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Jl8R64VP;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=Jl8R64VP;
 spf=pass (domain: arm.com, ip: 40.107.20.81, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ZA8s71fZKvyuSwTbMSgmtWOdgvtJIDRt/4V3Qy6FxacIJ7L6cyRh+ed7sROa72l/gslFTACBjtqyVzapab3Pc3Bqp69y5ch90NP4hzB5vH7xlyD8eoWC0Ye+wdQKBlYDLjcXszXVI7/IQoZUYYdR873MGxKdVaHq/ZsEyaST0S79wgBXBFHmFCFcuuZ4WXhXbCdxUVyYGUul6quWrQdhNP7yj62vUtsZVJMBi49xkinz7SNjc9Ws9WaKb1Yq+puf+gz+85GXsEOwrpyklXvpvXQ4ECKvWbNEWE4KFZFDy8Xa90b0WofkbgLTLmYmtyysaq4Z60RTCL4+a7gRL4xLZw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v59s6TqoKcs0gzHuo3i7BdE5lRvo3JKGV2HDD8pjbfQ=;
 b=a1Ixkk73Xp+sTDX/+u1CHVPFm/alQtFW8ZF4SYPWWow5CoJuCUc6HbNA5iAyJvGvwo2lqZWFZJFNKQLxQMA/xR0/wA/yY6spWAgZBiQq1RkopAWVftCswEaEl9tMA4fAtjFbLpis8aLRfzr7Cpv7Kp+9zRsxIldudn1+Fk4dOZ+GB3zSSi/9NTHZZFeuQUJ4FyWA5rQ+RDigzijFnUmFwo7X4ZzDBgOch3p9Wj9J9o8BDIV1ywW1bngBMb+Mn6kZkmVMYLjn3axuhAm+fI+/kAk+Bx/gF45tzWSwLCEb6qwDCnGpdNDa5Auhm6dAFiFA9btlcUcLCepwecdwf1b1MA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v59s6TqoKcs0gzHuo3i7BdE5lRvo3JKGV2HDD8pjbfQ=;
 b=Jl8R64VPwx4fnPS9hXtZMXM0/31R8wr9QTAzSs4kDvSPkhCOB4vPOowZqlSaBNh4aXC8CdMoV2WCj+sK/2sCopqC4SS7SK1pBO+/DN8G9xjsQTaT7+YXn0pRauTY9jWkKQAnxKRb+nwdwwp41zit0+dNjH2h820njRl7YB1y4Wg=
Received: from CWLP123CA0087.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:5b::27)
 by PAWPR08MB10166.eurprd08.prod.outlook.com (2603:10a6:102:368::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Thu, 27 Feb
 2025 15:09:06 +0000
Received: from AM4PEPF00025F9C.EURPRD83.prod.outlook.com
 (2603:10a6:401:5b:cafe::7f) by CWLP123CA0087.outlook.office365.com
 (2603:10a6:401:5b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.20 via Frontend Transport; Thu,
 27 Feb 2025 15:09:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00025F9C.mail.protection.outlook.com (10.167.16.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.0
 via Frontend Transport; Thu, 27 Feb 2025 15:09:04 +0000
Received: ("Tessian outbound 0a056dca8bdd:v585"); Thu, 27 Feb 2025 15:09:04 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c2f2965fef7f7fec
X-TessianGatewayMetadata: Sgbq9dbLyVuFqOy1nNdsbGcADsRgSq6cOWNk5ctKEo9czzCjY+WL/GzWuv/txm3GYOM23ObbU/8oz5cHxL5uxoYKU5p18Bnc/kvvcJuZSDnnylrnLidWZnCdwAluN1zfF7RudIH7PwLSc/ZsnmOzJUip6TNW9It++1K9G0CQgBI=
X-CR-MTA-TID: 64aa7808
Received: from Lde9ef03eff2b.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F344AAD8-1FB3-4397-927B-2A67E80870FA.1;
	Thu, 27 Feb 2025 15:08:57 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Lde9ef03eff2b.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 27 Feb 2025 15:08:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HuZNCcgBpfC6Ia3SJtUI45J8AMMSX/BkmaKpwnfdE19aJhY79kk11u8jc+p9SnSf5lF9BOgSfH0SYXXMVmcJUMOq6xWFgoKc01C8k0vPuyfXFN7oZ07UiG4VAFFFzaX7VyyDZdGmY3Cdf/vd1jTkzvSJ5bs89/GOn59ROqcoBW8CyBv3OMIViWXOn3a6u8JvYsUCVFKsf5NeNygmn6aLWKUwWhD6s36698DV4I4GyPHHt9W43xUMA4JLaKec6bpNwsyVweYbbtZy7BEti4seUgPAJDXFctxgdbN8wE+WVZ1l4id0YqSqVdVzxL5arHb7svKP2g0q2Ozgghu4Teybvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v59s6TqoKcs0gzHuo3i7BdE5lRvo3JKGV2HDD8pjbfQ=;
 b=lg53jkfYUYp0+o+x93Nu0VvC76tnSlMg+Jz2vXSOvZWQRZzrGNj5IxWMrQImUu+sy5lc07Iw6qmU2gWrUVpAqhierqMzd5sgdQc4t+U9dya7scQ06xaKBBBJFn7PQUySNR8UAA97fqKcxReX09LTS06AB6YJHdPaGvizqzVCLwp/1sSoTT+iTAx186zPk7o6So2gXYjGMclOqjayGZbj25qVJkQRZUKolTxXLMA7H0c+3gxxTzptUO+QLhtRogOET6dlNOI6T4k0IO4+BH6fKDQOr8gR2wvEcUStU/Tw+IE9OpwnaKZprcHEZGGd55JYNAxkN8et5v4+MCjiht87IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v59s6TqoKcs0gzHuo3i7BdE5lRvo3JKGV2HDD8pjbfQ=;
 b=Jl8R64VPwx4fnPS9hXtZMXM0/31R8wr9QTAzSs4kDvSPkhCOB4vPOowZqlSaBNh4aXC8CdMoV2WCj+sK/2sCopqC4SS7SK1pBO+/DN8G9xjsQTaT7+YXn0pRauTY9jWkKQAnxKRb+nwdwwp41zit0+dNjH2h820njRl7YB1y4Wg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GV2PR08MB8512.eurprd08.prod.outlook.com (2603:10a6:150:c2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Thu, 27 Feb
 2025 15:08:53 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8466.024; Thu, 27 Feb 2025
 15:08:53 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>,
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Subject: autotools changes, incoming breakage!
Thread-Topic: autotools changes, incoming breakage!
Thread-Index: AQHbiSmDalSrKlcsJUeEe0wOSyNijA==
Date: Thu, 27 Feb 2025 15:08:53 +0000
Message-ID: <C3DAF1A3-E7A2-43AA-9987-2575AA72AB2C@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GV2PR08MB8512:EE_|AM4PEPF00025F9C:EE_|PAWPR08MB10166:EE_
X-MS-Office365-Filtering-Correlation-Id: 0994c798-3336-4721-c788-08dd5740acce
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?M0NKU1lpWlZtME03T3VmNUE2Z2p3UnlXM09heHprUVdkYTZUZkRHenBwWnRt?=
 =?utf-8?B?bmxocW9PQVR3S0p3MnhDejhWY0J2dGpTOEYybWdtV1ZVZ0xoN1hvaUJpRGZa?=
 =?utf-8?B?eS9Qd1NzNDVZSUZCdWtxRnRGZkFUNUdTck9TTlNhc0dRWmtieGlkeE4zRmh6?=
 =?utf-8?B?alF2K3g5M3ZDS3BYRUprVE9LNFBlUk9BS05nZ2dKSU45RXFUeWhxTC9Jem0z?=
 =?utf-8?B?S0pzUGkzUDlkOWxsM2IyTDdyeTladmh3M25yb2JiWHlyckE5UW03dkNrSVY5?=
 =?utf-8?B?V3NQeVp0bnUwQkQ1b25oOXdoV1NQZkdGM1NpNFZnc1RrZDBaU0FCR3FJdlZi?=
 =?utf-8?B?UGIxTWh1eSsvcmV4TnlYTzBZN0tvVVhKcHN4aFM3dFVHMC9MdXVBN0EvOVdk?=
 =?utf-8?B?SGpOczZkME9OUEYxODZKWFBZWnBMR2VFSmp2eVFpdldIWko1Wlh2aFc3ZHlh?=
 =?utf-8?B?N2JsNVcxNjNNRUxTQWNjbUJwUVdFQzVkS2VKZnI5VWtYWWF2K2s1V21FM3FL?=
 =?utf-8?B?d2NuZjdwTzd1UHNpbWl1eThmMGt2TkJBTEdCbjh4eVJrd1llWW5QRzZPaVMx?=
 =?utf-8?B?T2FPRjM1ZUdXMzVoK1RjQ1B4bEtITzhMMUJVZjV3b3JOWmlkWDJXNlBmdjV6?=
 =?utf-8?B?WjVPc3pQREwwMncvaVg3bjhFckhKdlJBbFBjMCtVb1ROT05tdktYd0xiVEFI?=
 =?utf-8?B?ZTR2aVlPNWZvdTUyb3BOeTR5UG5EbXVWUFhYRTZqUlJ1Q2Yvck4xT1YxSkFa?=
 =?utf-8?B?STNxL3dFdkRnVENleGo0dFB0cVB1ZS9WcVc1RmZFWnJHcEhwTDdOaHFZeitm?=
 =?utf-8?B?QzVMSWY3eURZSXozNjFsY2U0OEVzMTlVV0dLZjExZW16dXdidnAycG41NnVF?=
 =?utf-8?B?TjgzM2tMZlVjUEROcWJpbHEzOExrQ3NYZ0Jkd2NxVCtBTlQvYmhGNnJkbWM0?=
 =?utf-8?B?aFNNR2t0Z0xXeHJpcU1iS2JJY201dkpMMFdsNFJKaWd1UTBrVGUway9IdGRS?=
 =?utf-8?B?ZmZwdnVZUHc1TCt2dUQvanpTVWU0SnY3OVpwY2pKZWZnWk4zTlYxMzVnYzhz?=
 =?utf-8?B?b2l3MGJ6bWtoOWNXUHJKR2hTWnpGY0RCMjc3SHpjVm83cXFlVnYxT2EyOEov?=
 =?utf-8?B?ZmFxTHVQNVZuZUNrTFRBSGpRZWl2Nk91Y0lHTEJ2QWJ1Z0pmaW1vbzYyWjNq?=
 =?utf-8?B?VTlKSVAyZHJpYzhiZXRRZE5QZWwzYVplVFloUVNNdEJJTEYxSWd3dkU3ZDBo?=
 =?utf-8?B?b3l2cGVOcWJmSW5Vbm9vVXc1T1RtTGRmaUpBWU1nbXdjWmgrZmlEUTY3WXNt?=
 =?utf-8?B?RkFFdWYyWHk5K2QveXowTWtCckJsRlJRWmZUMXh5bzlNWGFxKzdpRGRadWNC?=
 =?utf-8?B?d3dRWUFXbFVRR2ZYcXd1djZFZGhVeUpyMVdna205QUQwTXNKaEo5RUxSaDBw?=
 =?utf-8?B?cjFoK3AwYVlpWUNFMkhxQzI3VE9IaHRrS2ptQVYyTlplWktMNXdWdHRodC9j?=
 =?utf-8?B?Vk9lbTlGWTZxV0o0dFpNcTM3Q3JSZDdMc3dLWS9lWEx1ZlhSTjVpZjhGVTZ5?=
 =?utf-8?B?U09XSG5Bc1VPRzdDUTJkaFlUWTI2eFBldjRQdXBhdENrUVl4cTdZUUdhQytu?=
 =?utf-8?B?VXZFc0R5TENTVE81aDZKOTQycmdscjJtdW5abWFrN3ZaZGlDR3FVRDZkeXNq?=
 =?utf-8?B?clZRbU1UczN4a1hSK0dxMElxZHVZNlF4ZmZCcUdoNVpuMGI2MEUwMndWNFcy?=
 =?utf-8?B?emRwRmlPUTJkL0x6REM5NUt2bFBGTE0xOXJMRUY1QWZpR0FUZjFzMVNObVR5?=
 =?utf-8?B?T2dhaGExM0pGNElVcTNreTd3WUROdm5hZEdoNjZ3T0VkaXNoV0xGRWFQa2FM?=
 =?utf-8?B?ZzdXYWVuS1IzMlVua2EzVHU1WDVCd2FIU0lYSXBrellRMEFWYWVWWE1wR0Fy?=
 =?utf-8?Q?KGLm2J0TPfE/s9beOBzZy7R5v8gitX5k?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <74147978D23D6D4CA1E94F0ECB8A5E94@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8512
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00025F9C.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	304ed7ab-31ae-4932-b399-08dd5740a635
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|36860700013|82310400026|1800799024|376014|14060799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c1AySWZLelMwMU5KaWxySTZpNERaWlphMXo3TjV5aWNVL3NpSUI0VW02WnlO?=
 =?utf-8?B?MmlJZ1p0VTE5NndGcXlQMmI5RXhhZ0hrK3p3T1RhTnNqeVRDVVFpeis0eGow?=
 =?utf-8?B?azQyem9uZzlzZFdoM0lUYUY4Y2plS0x5Nmx4b2VIdkJPNjhWcnV1VFY0RDI2?=
 =?utf-8?B?bVZpcGZBVXRMeFI4KzZDZ2JmOElHdU0ydmp4Smx6c2dtUk5yby84SmJhWmY4?=
 =?utf-8?B?NXk4UGdJei9vTW9tajFGTHIzOVZsc3lpT0NiNFllVmlWRE1lS0dQTkh5aWth?=
 =?utf-8?B?WFc4d3M1c0lEZ3p0eVN2NHo1dnVpZDZPZndpUkdLcDdQQlZGMFFUUEVMdVZV?=
 =?utf-8?B?STV2UjUwVGdWNTlQZ1RjbUlqOTdoellqeTRsR3E1QWJUNlhuY01NakVXT3VO?=
 =?utf-8?B?SGZUc0RadnlvcWNUTzVLM3FCR3I5anFidEtZM2l3bGtwajlCVFdrVzZPWE9x?=
 =?utf-8?B?TjlRQmFXK3hoRXRRcmNESHIyTnZWTUZrb2dvMWZqNCtqWEtOZkx5bnJ6RERZ?=
 =?utf-8?B?TG5kdFNoVi9QeTNnSDMzZXYwYlRaTUZ5MXdOdDV2dy9kZm8rcytpcHhhdis3?=
 =?utf-8?B?dEdUc1NnRnNjanRqN1BscVQrb29ack03QjBhM1pWODk2QStCUE1oS2kzTmdF?=
 =?utf-8?B?dkwveEZ3ZWlNdHpKeWRISEZxb05TNy82L0VoOUEzb0N0NVZJeXQ1TXBnWUZt?=
 =?utf-8?B?djM2M2RYS1BvYXdheXlTZEFxN3h5OExxU0lYQUVjY1A2Mm03QTZoUk5reHJZ?=
 =?utf-8?B?TnFubkJhcTJTVE9La1BmbDBUZ1MxbUhSK0YrSXR0bCtudUdkWTloUURYeFpG?=
 =?utf-8?B?Y2hDY0Qzbk4zSzg5cjVYQmhmQks5Z09scGY0WVE4SHA3bS9Xb2dOWTNNR2Nx?=
 =?utf-8?B?SzVuN1ZaNThPemVWTEpvNVZvMkR5a3REYXVSQngxRlJ5UmFGenk2U2NvQ3Fz?=
 =?utf-8?B?ZVdWdUIveHlHcVROclhvdzdwazdTQjF3ejBITTJDM2NCS2YwYVdqUlYzRDJQ?=
 =?utf-8?B?emRXT2dHSGpWOWwwMzQ5L0ZkWVBraTQzNnJXZWlPQVN4azd6bmh3aUNtYiti?=
 =?utf-8?B?TnZHZ3o4Z1p2QVRzT2QyQkVOeVFmMStFVWl3endGT28rMnVHVFVIYXRMOVFk?=
 =?utf-8?B?Nko3REN5WTU5bUFKM3J3OE9valhGNzFDKzNyN0tIU3NBdmhsVjM3RjY1Vks1?=
 =?utf-8?B?R3N1ckhMTHNPN2s5WUxkbm9zcWpLUFJubnc3UytaRmNiYU40WGpla2p2WElj?=
 =?utf-8?B?QUxmMFd4K3JCQ0lBTWpaU2dIZmxFcWd1TkNQWnVGd3VtUXlrN3JyQ3FTVEV2?=
 =?utf-8?B?YzhUc1g0UmhkZ1ZnUERPRWNhY1VPZDJlVnRxeVdWeVpqaVJuVnRxUlEydjF4?=
 =?utf-8?B?Zis5dWdFZTlLUTh5cHNYS3RScWFsZFJKT2lMLzNtQjY4Q1h0RVZXUDhkQ09t?=
 =?utf-8?B?d2ZhVmlWMDU5SW5qa3B6RmJQQUlnUkJXRVdNV2dIZFN3WlJlQ1ppL3NIdXJx?=
 =?utf-8?B?TUgwV2J1VEU1RnRJNTl6WjJOeGwrUEJvN0ZmUlRnQnlKUzhOU2xheU5CNnoy?=
 =?utf-8?B?bjB2S0dlUElLczAzTlFwSkV4bEM4bmdSZlU4bkIxLzlWMFd5ZE12RHBYdFJX?=
 =?utf-8?B?L2syZlRLY1pYaFFPK0NEZGRjYVNxQkV2VEc3bnprcjhIaWxCeUtKalBTOWpx?=
 =?utf-8?B?STRsWUNVTEhBVTAyT2tCdlcrdHArZDZrSDhaSTA2bGdNUjdQRlREU2Vkb0FH?=
 =?utf-8?B?U1VkajZVZE9CZ1RqVEppSkZxN3ZqQzl1dktlQXZScHdGZFpvUng4dkdndDFZ?=
 =?utf-8?B?Ulh6b280RVpLMUc5N2FGTjBBUU82bkVuZEVvTGhobU4rUUhGOUh1Ym5iaHgz?=
 =?utf-8?B?OUhCOWV0Q3JIdXNCVmE3ZmhRaUhDbHJSbHVqckFkdi95OGJnZ0JPTFVuR1lm?=
 =?utf-8?B?QmtiWTFBWGo5T2psNmpaNWNuZENHRVVnN0hLM011REh0dmIveFUrQ3V6ZjQ1?=
 =?utf-8?Q?JDdqxSjdKBLG2f1PJOUV5kYQe9w+l8=3D?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(82310400026)(1800799024)(376014)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 15:09:04.4609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0994c798-3336-4721-c788-08dd5740acce
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F9C.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10166
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Feb 2025 15:09:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212013

SGksDQoNCk15IHNpZGUgcXVlc3QgdG8gY2xlYW4gdXAgdGhlIHR3by1kZWNhZGVzIG9mIGNydWZ0
IGluIGF1dG90b29scy5iYmNsYXNzIHJlYWNoZWQgYW5vdGhlciBtaWxlc3RvbmUgdG9kYXkgd2l0
aCB0aGUgcmVtb3ZhbCBvZiB0aGUg4oCcYWNwYXRoc+KAnSB2YXJpYWJsZSBhbmQgdGhlIGNvcnJl
c3BvbmRpbmcgbG9naWNbMV0uICBBcyB0aGlzIG1pZ2h0IHdlbGwgY2F1c2UgYnVpbGQgZmFpbHVy
ZXMgSSB0aG91Z2h0IEkgc2hvdWxkIGV4cGxhaW4gd2h5IHRoaXMgaGFwcGVuZWQgYW5kIHdoYXQg
dGhlIGZpeCBpcy4NCg0KUHJldmlvdXNseSB0aGUgYXV0b3Rvb2xzIGNsYXNzIHdvdWxkIHVzdWFs
bHkgc2VhcmNoIHRocm91Z2ggJHtTfSBhbmQgbG9vayBmb3IgZGlyZWN0b3JpZXMgdGhhdCBjb250
YWluIC5tNCBmaWxlcy4gSXQgd291bGQgdGhlbiBhZGQgZWFjaCBvZiB0aGVzZSBkaXJlY3Rvcmll
cyB0byB0aGUgYWNsb2NhbCBzZWFyY2ggcGF0aCB3aGVuIGNhbGxpbmcgYXV0b3JlY29uZi4gIEni
gJltIHN1cmUgMjAgeWVhcnMgYWdvIHdoZW4gdGhlIGhpc3Rvcnkgb2YgdGhlIGNsYXNzIGRpc2Fw
cGVhcnMgaW50byBiaXRrZWVwZXIgdGhlcmUgd2VyZSBnb29kIHJlYXNvbnMgZm9yIHRoaXMgKGZv
ciBhIHN0YXJ0LCBhdXRvcmVjb25mIGJhY2sgdGhlbiB3YXMgZmFtb3VzbHkgZnJhZ2lsZSkgYnV0
IG5vd2FkYXlzIHRoaXMgaXMgbm90IG5lZWRlZCBzbyB0aGUgY2xhc3Mgbm8gbG9uZ2VyIGRvZXMg
dGhpczogaXQgc2ltcGx5IHRlbGxzIGFjbG9jYWwgd2hlcmUgdGhlIG5hdGl2ZSBhbmQgdGFyZ2V0
IG1hY3JvIGRpcmVjdG9yaWVzIGluIHRoZSBzeXNyb290IGFyZSBhbmQgYXNzdW1lcyB0aGUgY29u
ZmlndXJlIHNjcmlwdHMgaGF2ZSBkb25lIHRoZSByaWdodCB0aGluZy4NCg0KVGhhdCBhc3N1bXB0
aW9uIGlzIHdoZXJlIHlvdSBtaWdodCBoaXQgcHJvYmxlbXMuICBUaGUgdmFzdCBtYWpvcml0eSBv
ZiByZWNpcGVzIGp1c3Qgd29yayBidXQgdGhlcmUgd2lsbCBiZSBhIGZldyB3aGljaCBkb27igJl0
IGF1dG9yZWNvbmYgb3V0IG9mIHRoZSBib3gsIHR5cGljYWxseSB3aGVyZSB0aGVyZSBpcyBhIGJl
c3Bva2UgYm9vdHN0cmFwLnNoIG9yIHNpbWlsYXIgd2hpY2ggZXhwbGljaXRseSBwYXNzZXMgLUkg
ZmxhZ3MgdG8gYXV0b3JlY29uZiwgb3IgY2FsbHMgYWNsb2NhbC9hdXRvY29uZiBkaXJlY3RseS4g
IFRoaXMgd2lsbCB0eXBpY2FsbHkgYmUgc2VlbiBhcyB1bmV4cGFuZGVkIG5vbi1idWlsdGluIG1h
Y3JvcyAodGhhdCBpcywgYW55dGhpbmcgdGhhdCBkb2VzbuKAmXQgc3RhcnQgQUNfIG9yIEFNXyku
DQoNClJlc29sdmluZyB0aGlzIGlzIHVzdWFsbHkgc2ltcGxlLiBGaXJzdCwgbG9vayBmb3IgYSBi
b290c3RyYXAuc2ggb3IgYXV0b2dlbi5zaCBvciBzaW1pbGFyOiBhIHNjcmlwdCB0aGF0IGNhbGxz
IGF1dG9jb25mIG9yIGF1dG9yZWNvbmYuIFRoaXMgd2lsbCBsaWtlbHkgY29udGFpbiBzb21lIOKA
nC1JIHNvbWUvcGF0aOKAnSBhcmd1bWVudHM6DQoNCiAgYWNsb2NhbCAtSSBtNG1hY3Jvcw0KDQpU
aGVzZSBjYW4gYmUgcGFzc2VkIHRvIGF1dG9yZWNvbmYgaW4gdGhlIHJlY2lwZToNCg0KICBFWFRS
QV9BVVRPUkVDT05GICs9IOKAnC1JIG00bWFjcm9z4oCdDQoNCklmIHRoZXJlIGlzIG5vIG9idmlv
dXMgc2NyaXB0IChpdOKAmXMgcG9zc2libGUgdGhlIG1haW50YWluZXIgZG9lc27igJl0IHNoaXAg
aXQgaW4gdGFyYmFsbHMsIGZvciBleGFtcGxlKSB0aGVuIHlvdeKAmWxsIGhhdmUgdG8gc2VhcmNo
IHRoZSBzb3VyY2UgY29kZSBmb3IgdGhlIG1hY3JvIGFuZCBzZXQgRVhUUkFfQVVUT1JFQ09ORiBh
cyBhYm92ZSB3aXRoIHRoZSByaWdodCBwYXRoLg0KDQpBbmQgaG9wZWZ1bGx5IHRoYXTigJlzIGFs
bCB0aGVyZSBpcyB0byBpdCEgSWYgeW91IGNvbWUgYWNyb3NzIGFueSBicmVha2FnZSB0aGF0IGlz
buKAmXQgdHJpdmlhbGx5IGZpeGVkIGluIGEgZmV3IG1pbnV0ZXMgdGhlbiBmZWVsIGZyZWUgdG8g
bWVzc2FnZSBtZS4gIEnigJl2ZSBhbHJlYWR5IHNlbnQgYSBzZXJpZXMgdGhhdCAtIGFzIGZhciBh
cyBJIGNhbiB0ZWxsIC0gZml4ZXMgbWV0YS1vZSwgYnV0IG90aGVyIGxheWVycyBtYXkgd2VsbCBo
YXZlIGZ1cnRoZXIgaXNzdWVzLg0KDQpUaGFua3MsDQpSb3NzDQoNClsxXSBodHRwczovL2dpdC5v
cGVuZW1iZWRkZWQub3JnL29wZW5lbWJlZGRlZC1jb3JlL2NvbW1pdC9tZXRhP2lkPWU3MThkMWJl
MmM0ZmI1NGNmMzYzYzIzZjkyOTM1OGUxYmU2OGM3MjQ=

