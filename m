Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E9D3D69104
	for <webhook@archiver.kernel.org>; Thu, 28 Nov 2024 12:19:27 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.53])
 by mx.groups.io with SMTP id smtpd.web11.93575.1732796359373889007
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Nov 2024 04:19:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=FdFSycrC;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=FdFSycrC;
 spf=pass (domain: arm.com, ip: 40.107.103.53, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=iSK3tAx6Xuog9PMzG4IQ+v79t8Aew2XuWnaxOLr4Vsxw4IuwhEPke2ScrknUzxwImQ0oKKbE5EOFKERnm5XXNm31HH7eJOaYopqA+fHSKqCiim6kkCi+AGnJvoiqc4obBpaeP8UvYBvAgcqv48nxmHV5M0rVCxwf6Z1cRGdhmNrNOTY0+d0gj0uvfgMK+RzBG6gOM1fDBTuIjvNg/Zs0crulOobBDnUvIuFMfQCMTxUxyWdl6F0i1BAxMoIILehGfVqot9ZF9hVrhd7Ikdi9uKeH77t978E4YiEX0I26tfxBzhfCunpQq1out/bJezemDkPuyqlfCBatb9X2oklb/w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XyogqIr633hxPmHp1snO2Lg5pARP5YpoOcm7JUa4CjE=;
 b=akmh6w3/8h8t3kDhzCFV872geEjLKYd02hgRcPtIe9vuo64j82oi7vwOCsoc5e2yOQDvHefwYLm2k8kKmiMYXzs7ZwANeFV4Agl2Vc/hoZCeNpt2Y/BRY2cMPukYiKPGTCmzGjNHUnZdISWX/utiUxZuU4ZjWIk8JbcQKTxK0Vni1gcqMmEZ1j/VUEykvPQU/cvV/m+XJGbY1L7Y3mihV2AyXlWMQRVu22sug5w/JlePGODDqEItzjS2pL2k94P5yZx4jcw9s8bzR3i0DNsD6AVhzMV2Dz9vOnBBLhLYg9K0LLRD7jegUDaWAA8nRbmwyINNPksHnFeIPMRRsBturQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XyogqIr633hxPmHp1snO2Lg5pARP5YpoOcm7JUa4CjE=;
 b=FdFSycrCh6q4uiw+zXFIWHl/pIkek+copsHky+awMGxWj539HbdHVhhBzor705AplS9SODPfQTBcM93OnHCITna6YHWmCNySSWYTFSCnz2JCU7dUyneXlDRliUjt4VQ0HVgMQKlILCz4JkBdac1eTdc7Lamonh6oqciL0Ql4lUw=
Received: from AM0PR10CA0079.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::32)
 by GV2PR08MB8172.eurprd08.prod.outlook.com (2603:10a6:150:7c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Thu, 28 Nov
 2024 12:19:13 +0000
Received: from AMS0EPF0000019B.eurprd05.prod.outlook.com
 (2603:10a6:208:15:cafe::92) by AM0PR10CA0079.outlook.office365.com
 (2603:10a6:208:15::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.13 via Frontend Transport; Thu,
 28 Nov 2024 12:19:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019B.mail.protection.outlook.com (10.167.16.247) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.12
 via Frontend Transport; Thu, 28 Nov 2024 12:19:12 +0000
Received: ("Tessian outbound 3b1f0cd68b0e:v514"); Thu, 28 Nov 2024 12:19:12 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2d3cfa5285c99faa
X-TessianGatewayMetadata: rqtxylxP417YafCIz5n5zvKeTm8p8s8xdcbUdEL40rW2ZUZxLvlLqLCwPm8PI8eA1dPm2DGSEDXBEvzoaddBkJrik1kQxifHTZ92HDL9Bru6na9KR6ExXaTLOsgAR14fUzSK/Eqptrn3GhpC2rxvwStCvlIUUgYw7nKeDoX27x8=
X-CR-MTA-TID: 64aa7808
Received: from Ld571719ee35a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id A97C5315-0071-48B2-B623-3141FDA54B16.1;
	Thu, 28 Nov 2024 12:19:06 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id Ld571719ee35a.1
    (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
    Thu, 28 Nov 2024 12:19:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xayE6ZNwY93mkjBwcdCmnXp+PxAHRkSAGu24TRVJstqbVAwoxuUMi5RRGP6/cVhcN7lNJ+r+ygDbxM1QdmIBD4arKzMXtz7rjlWzIVhlCbJ1SHUipr5V4PZmYGyD9mRPd+CkL5cYFrKHG8QKDWeSQmeiLitSKLZhV7cyHkCrMJhQ4kjufY4LXckrDhRqQQ2t7z0xUdwfP+7HlZJabpjQHjpyf37bMzyfB/yy0kcc3kvrD6AYcYQDudWabKAqkiQ68ITmA+YzMDvaGXxXAhFoFROqZehaLNXl8Iw6IP4chDZ5Gi+gjQExaPe7+McuLHVBoPtxUBH2AH3RUQnCqboQ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XyogqIr633hxPmHp1snO2Lg5pARP5YpoOcm7JUa4CjE=;
 b=fXAoaT/wEL48Sp6VT8a65dNAy5pB/NQKf/Umma2pD5dmjhuSPLIAtpSuqAwW4FNVpyV62xpwoxhxKcwAKUhkjmjEzRZPJKJtkqFKn8T7/Y5GbYz3NtV+uCMm0Mx66eqUS27pS/Kcdp1NcszXiZmye491e87olgYwy7gXPAwa8jnPpbE5gi4v7hvEBfDfO+gTTEbbOvfx+mg4WoTMkgB3VkHWOuvdJnczrB+8ZFNiMWvxNTm7mpNmob4W31eO0xx73C7ixcdUJS9Hfe/RrIAlUXEDgeHzCDrlXu8AXIEza9q/gEo/V4Zh9LqUI5gLpwwy58RadnaQ0Oiq8O1q9JmaWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XyogqIr633hxPmHp1snO2Lg5pARP5YpoOcm7JUa4CjE=;
 b=FdFSycrCh6q4uiw+zXFIWHl/pIkek+copsHky+awMGxWj539HbdHVhhBzor705AplS9SODPfQTBcM93OnHCITna6YHWmCNySSWYTFSCnz2JCU7dUyneXlDRliUjt4VQ0HVgMQKlILCz4JkBdac1eTdc7Lamonh6oqciL0Ql4lUw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB10249.eurprd08.prod.outlook.com (2603:10a6:20b:62f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Thu, 28 Nov
 2024 12:19:04 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%5]) with mapi id 15.20.8207.010; Thu, 28 Nov 2024
 12:19:04 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "peter.marko@siemens.com" <peter.marko@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] libssh2: mark CVE-2023-48795 as fixed
Thread-Topic: [OE-core][PATCH] libssh2: mark CVE-2023-48795 as fixed
Thread-Index: AQHbPqTVBxDmfe7BJUaLIwKVbv74D7LMohcA
Date: Thu, 28 Nov 2024 12:19:04 +0000
Message-ID: <70811253-62EF-46D6-8E26-596AAF19B39A@arm.com>
References: <20241124191126.24876-1-peter.marko@siemens.com>
In-Reply-To: <20241124191126.24876-1-peter.marko@siemens.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB10249:EE_|AMS0EPF0000019B:EE_|GV2PR08MB8172:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dd6e7d0-b7a9-4350-f0b8-08dd0fa6de44
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?U0loSmdLdXVJQUVZVmw4S0oxbUI2QWhUR1YvdG9aUjZycW1vSDkzajIyNXB3?=
 =?utf-8?B?Q1c3R0dQc2w4eFNNeE1hR3hJM21tZDJQemtJaWxYK3BXbWZHc0R4QVVQUEdp?=
 =?utf-8?B?YmtNaTg3dE44blUvazZQOFArd3lSazdjUWVXYXlaOE1IRzRDc1l4djNLZ0tz?=
 =?utf-8?B?NUhLeWJqdDQrb1owVXFRWll3NzVNVVF3RWRFMGlDT1lSem4zcXFZRmt5UkVq?=
 =?utf-8?B?bjVPeURRWTdiSHZCMzdYWlJqY0NPL3h2bG9KZXJGdEJGSjEzamFYd1QwUkNw?=
 =?utf-8?B?VHlPczVwOHVQTHZ4eFUwSGRZTVZLV2RKM2xQT1d4ODZzT085OXRWTFRVNFZ5?=
 =?utf-8?B?Q2Nsdm5PakRZeHFXZTI2M2ltRWxTOEljQXNWL0E0bmk4Z2haeGdibUJNcWNO?=
 =?utf-8?B?OExPUGxqZWo2dG43VEkySUZzMmVBc2E4MkkwQkZhcjVlQlFPb202SFJoSUhs?=
 =?utf-8?B?dThXMm9rdmxOclJUT0Q4eXhuayt3T09LWGpZZG0xZXBCV1RxRVJYNkl5Y1N2?=
 =?utf-8?B?VC9MdEt5ZFRibTFHVnZIVkdRdUJvM09qQ2dENTdDMFhWYmpnZk5NMWR1M2JU?=
 =?utf-8?B?TE1HbHBSUFZxYUt0YUpjSllndzJrN0VsVTNwZ1B6Um5DQmlvOEJCM0d2RnlZ?=
 =?utf-8?B?OS9vYVR1QUdkRW9SRkV2NXhDYktHSHdCMjlPdVV1Slh3N2dOVlJ1L012R1ZR?=
 =?utf-8?B?SlVaYk5sWkI3NHZWMXEyV2ZQOFJuQ2kyYXFxZkJOOU0yMTB0ZTMrRThhNkNG?=
 =?utf-8?B?QUpyMjNrK1pVaklJNTBwbHVidHZOdVZhODc3RG10amFheXJNQ0s3ZC9XWDVD?=
 =?utf-8?B?N0lHK28xUVRESGlnbHFqY3dIQXdtQ1lvaDlDaXBzOHJpbG5yYmVrZlRBQ1or?=
 =?utf-8?B?NS9XR0Z3eEhNNFBuRnhZUXd0by9kV0Q1M1gveTlnUHhvdFgrL1VnSm9Ia21i?=
 =?utf-8?B?bHFCV1h1dlpZbTRnTSthM3h0Y1YxdWovQzhwVTJTZXhBSHFsSVUyMGtiUHZv?=
 =?utf-8?B?NHNEclBxTlVramZFSXRueUM1SWN1MFhKNERyODZPeFpjSllua0s5R0R0Yi83?=
 =?utf-8?B?aElxcXZneG00Uk5oV1FIR3JZOGw4Y2Rldkx3U2VLczd5VFFGS1RvWHZ3KzN2?=
 =?utf-8?B?dHA1Y2tsTktiS0JIZTNyV3dSdC9yaUVHMHJUTDdUK3ZCYmxVUEJnclhZRDFZ?=
 =?utf-8?B?NWoyK040N1pxazBWNWFLVS8wNWtlZUllUElmWTRqMm1NMWoxYm1rODAyeFow?=
 =?utf-8?B?TEF0cUljbVRpUHI4ejdZL004TldwRU90TkczS0NjanpCRkZlTnVIQUNDM2NN?=
 =?utf-8?B?YU16bGNTWTR6d1JnaXZ5RGFncGp3aUsrTlBUWmlQeXBkcStWTUVucEhiMEVU?=
 =?utf-8?B?OWVicFRqMWFzVFJsaDVRS0ZtRFh6RjVqRUY3Zmp1ZEJBeWY5ZTZsSDBCTEdq?=
 =?utf-8?B?L0V0SXFJT1lxeEdmTHBjdzVuZVdFMXhHSEhQR2NKb1FDTDJVWGRLcU5vQnkv?=
 =?utf-8?B?WmVoM3dRYU9icXpkRTNQQ0VQYXRON3Jpdjd1WmdRSTFGbFpRRXhwcTNnVkh1?=
 =?utf-8?B?Q05DenpxYWNSMENVTnMrcTZscUVNcmlKN2FockdLemdWODI1enhTTmI0TU5S?=
 =?utf-8?B?d3RRVnhMUDhCK3M0cmZrVnJDMlIzbHc4Mk1tOUxmNFBSTjJuL3ZWdW1OU2sw?=
 =?utf-8?B?N3NjT3VsRDBhRzYvU1h3QWZRcmZuWVZDUm12Z1dQZzVReld1UzNsemVMNXdv?=
 =?utf-8?B?Q2RqdzYwOWg0MHNBc1p4U3o5UVRmd2l6YXY4MllvUC9Bc0Y5Q1NoaDk3RzM4?=
 =?utf-8?B?eDFRU2RicHd0Vm4zZkd6NHFzblFmTnZ6bk1ER1hsQ1pIVGhSQzQydlhQVTFz?=
 =?utf-8?B?d2E2ckFZeEpMMnhWL3ZHaGgrVkV6WkZBVHZ0VW9Vb2UrTlE9PQ==?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <661670FA4781D443A5CC247556EC310B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10249
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: 
 ip=[2603:10a6:102:2a3::12];domain=PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	684d252e-4d8f-4c4a-a565-08dd0fa6d966
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|14060799003|1800799024|36860700013|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y3UvaFJWOHQxcWpIakc1MHlBTGRVUzRRTC9mVG10SVQ2MDh0TnF5SzBzZHZo?=
 =?utf-8?B?WFdvejFoQUZKU1lrYWNYQ3dXczN6MCtNbnFLU2l1Z1FOOFU1VWhGdHdmbldH?=
 =?utf-8?B?aERWVE9MZlZXUkx0ekFNN1ZKR0xta3QxY2tMdTVuNVVXcEZHTCtFd3dITnpS?=
 =?utf-8?B?UmJ4eERaWHVVeXdRZHlqOVg4TFFtYTZ6Y2lDZVdyRjRzdjZHTmpWaHkyTE9p?=
 =?utf-8?B?MHFWbXBibEtuSXpKdDhaaVFydzhadVZMMzgvek1KWGxZOUIyVXRsVXpwbEdn?=
 =?utf-8?B?TDB6RWNPQXhkTWVDbTduNkgvbEJxeUpMc2VpYWxBTXE1OElYUUFKMFh6T2Nm?=
 =?utf-8?B?VjJZVXRNb0JqSXZZcFBjRXVyaHUwdVdYMUVwTDBSaTduYlB5OTUvVmxkSW0z?=
 =?utf-8?B?Q1EzL09tczVQTXVwVHg4RjFucWoxNGpQQkh0MDVvOXRhTEluQVI2Yjlud2dj?=
 =?utf-8?B?Q1dYRUlRcm1PVFdEaFVaRmQyZEMyY3pSeUM2M3dHdXJ0QkFHT0p4Rm9xV016?=
 =?utf-8?B?SjZwVXQ0VkFmTGhtdTVCRWJZdDFvNDZGVXd5UkZjQ29uTktISVl1UFB1bU9P?=
 =?utf-8?B?cnZUUDFueWJacnQ5bGgxc213RFpCZE41TVN4VmMvaU8vNlhqb1JpRTNUVG9Z?=
 =?utf-8?B?UjNDY1FhVnZ3dEp2QVY4MlByRUswSjNCUzNQdnk0UE9uMnNOdDFvS2dUWUFo?=
 =?utf-8?B?a09SeGdIWkt3S2VMMTNwMlB3V3g0aFRrbDB3QmxXQ3pVSHhMM1oxa0ZKdWlo?=
 =?utf-8?B?aW1GOVJvdlg1WkJRSFpOQmVQaXJmOFA1cGd5ZGdvVnhEMCtoVUJtVktSUXZE?=
 =?utf-8?B?eXRMNlRlcUYxQ3pqYjc3SStMNndmTHN5VDdHSXh0cmhxajVIN2dtTG9Jam51?=
 =?utf-8?B?RytubVFrT01WVVd2Si8zZ1V6UnJVSXp0cGdCajlzUnBLK2I5QnB5anE0Mlor?=
 =?utf-8?B?SG5NN2xlQlcvWWhzeko2TjZMbnRJTWtaellNU3FRZDM0aER0RGh6MDNHYnZx?=
 =?utf-8?B?MWxDNWU0dlNSUmMySXNKRFJHaVpDc1l5QVgzdytJYWJlY2FyMWRtVDdCV2tW?=
 =?utf-8?B?b2ZpcmxZTmlVUjZrVjR4MUZJQS9Zb1dDL2hVM1l1T2JRZGR6RE9ybGdmN1Q2?=
 =?utf-8?B?a05ZVmJ6TjZpcEQzVnducGxHNE4wS2tmOWoreHBZekUybHJjc0xaY1M3QXU0?=
 =?utf-8?B?cDFBaGZIYzZHVGxjb2Jkb1dxTERGSDB0WEhSS3FDU2tFeFBiZTlIYU43dkR6?=
 =?utf-8?B?RlpCbGNlMmNWay9YMG1mVTVOMDBYSkFUN0Z5ZC9FUTNZM2ZJWENBK0VNSmpx?=
 =?utf-8?B?Y1ZDK0lYWWZhTTBuVjREVzk3THpNWTc3c29wYWJubWlvUkpCS0NNaXhoRTNj?=
 =?utf-8?B?Q0RhdUhRVlBlL0tBdkV5dWprSk9Gckh4dDdyT3lBWTJsbEQ0dHpXVm0vNXdW?=
 =?utf-8?B?QTF0Q0VRYktVZVkyVHNrN2Q3ZkNGTmVZWFFEdmxhSytCMGNTbHhtT0w0TUs1?=
 =?utf-8?B?TWlYMzhZYlc1SC9iY09TVW5VQlhZUUMvd2V1OG85SWs4RUJBZDRHNlhwSnNP?=
 =?utf-8?B?eDNWOXFLcnd3eDBoREY0MGJNRWs1NWV0ZlprTEcvWlRETVhDYkgxL21GZGlS?=
 =?utf-8?B?a1dOOTZwU3llTlpEWTloUDVaTWVZY1JLWHRvdFk4Z0syM2k4YXpQZnh6OE9i?=
 =?utf-8?B?eHpsMTlGUW54S3hXYzdtalo0eTU1b2hLdFk1Zk02QlF0UWhJMGdTZzgyeDBz?=
 =?utf-8?B?R081a0g0S0lQc3BGdWh2TjJMK3BQSnVMQXczL1paaWg1ZnFlY2pNUXlFRXF4?=
 =?utf-8?B?SkdKNndrb09yZGNvOW1nM0VzTHNDcExFSHg3ZFVPZGVSZjlKL1lvUHNwMTNr?=
 =?utf-8?B?U0VaRzNVWG1kVVhoYk1yeTFrZiswL25JSzQ1NmJiQVBMU3FjTEhieGZzMzBq?=
 =?utf-8?Q?x+SSXtopP4Quh3OtQ4v8/Bkw7zgYA9m+?=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(14060799003)(1800799024)(36860700013)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 12:19:12.3901
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dd6e7d0-b7a9-4350-f0b8-08dd0fa6de44
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019B.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8172
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 12:19:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207988

T24gMjQgTm92IDIwMjQsIGF0IDE5OjExLCBQZXRlciBNYXJrbyB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8cGV0ZXIubWFya289c2llbWVucy5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+IE5WRCBEQiBoYXMgdHlwbyBpbiB2ZXJzaW9uICgxLjExLjEwIGluc3RlYWQgb2Yg
MS4xMS4xKQ0KPiBWZXJzaW9uIDEuMTEuMSBpcyB0aGUgY3VycmVudGx5IHRoZSBsYXRlc3Qgb25l
LCB0aGVyZSBpcyBubyAuMTANCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFBldGVyIE1hcmtvIDxwZXRl
ci5tYXJrb0BzaWVtZW5zLmNvbT4NCj4gLS0tDQo+IElmIHNvbWVvbmUgd2FudHMsIGNvcnJlY3Rp
b24gY2FuIGJlIHJlcXVlc3RlZCBmcm9tIE5WRCBpbnN0ZWFkIG9mIHRoaXMgcGF0Y2guDQo+IEJ1
dCBpbiBjdXJyZW50IE5WRCBDVkUgZW5yaWNobWVudCBzaXR1YXRpb24gdGhhdCBtYXkgYmUgcHJv
YmxlbWF0aWMuDQoNCkZvciBzaW1wbGUgZml4ZXMgbGlrZSB0aGlzIHRoZXnigJl2ZSBiZWVuIHF1
aXRlIHByb2FjdGl2ZS4gIEnigJl2ZSBqdXN0IHNlbnQgYSBDUEUgdXBkYXRlLCBJIHN1Z2dlc3Qg
bWVyZ2luZyB0aGlzIG5vdyBhbmQgcmV2ZXJ0aW5nIHdoZW4gdGhlIGRhdGFiYXNlIGlzIGZpeGVk
Lg0KDQpUaGFua3MsDQpSb3Nz

