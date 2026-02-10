Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F602EA8127
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 14:50:45 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21178.1770735037975288762
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 06:50:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=S13SlVII;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=S13SlVII;
 spf=pass (domain: arm.com, ip: 52.101.69.7, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=MXyX5V+sm7kieGHClTyPeYBeKjLiHFA6oBPPXBXq5unpAhGFUo4UHjWcEn993mwUNLaCumxUby//ALW4PXwoGnJAQyBJ21yvCGTDq1Zp6PASXs0i/uD5u3io7iNQb3MFhznJUI1cJVYvQFhPBEe6CNRgyUlqkBy89cWSPIrVFEzjelq8ttC0cYGU6banD0YqoQevv6VTTlQWjY6htuj6r/9st7Bl4nVTrt70P1SjXn1QgzOvMzEwAjZIcWIoWMqx1gAc2ZTbsNeZaWVrTIjkq2gEwA/lCq5ij5GvaDdb+SQyu8OItUEiHNNjM2F0lyIaG959rKqsSY+9SarKdqIedg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4T+jL2dyB81ye1F9LhKvw65QZvPGMxt7JxMdi3iXzl0=;
 b=C5MHbwaueh6ivvRimKKGHwHPDgE7a2PtWxd0JINhoVg0gU7jldlEKSzYA7iPUK9XjzhSwBt24lnZxwscTfXxJfqZnYU5DmGkv1FBRirMbo3LhpJ0PIQaKPT2Tr3o9hbx1IJiWRxT2JfZ+QKi9lYsgkIazYOEP+UjlgVsbbzcOVINrV6rM38KPoQWgRnxneZ1ZqjsJkHOZG4bG+/Fn/DrmFwoFaJeccO/ciZjnlGpFZnIqNnwTXgN1nEICuYm1PVJs5dzeU+YfViKnpJzy8AJFP4B5QdXiOWyGkCrzL47DFrFF+8KjS1RngzQ3lqssKrB3gy5mO04Yenk4OmjUk+APQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=fujitsu.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4T+jL2dyB81ye1F9LhKvw65QZvPGMxt7JxMdi3iXzl0=;
 b=S13SlVIIR22EO26MAqXrYhU6ahwz5OcSj1ZE+qNR8aoMS3J9tzkHVxSLLIqm8YV5U09rVtpoSIzFSJZnxOe6sPLWnBKf+mLdMGfiJqfDIe/wNixdZHEweHBMK1VZKoh67JfGbB0E07ZC67jLD2bDdj6+ccO+phr7RrdxFNGiko4=
Received: from AM8P191CA0023.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::28)
 by PAWPR08MB9471.eurprd08.prod.outlook.com (2603:10a6:102:2e5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 14:50:31 +0000
Received: from AM4PEPF00025F98.EURPRD83.prod.outlook.com
 (2603:10a6:20b:21a:cafe::91) by AM8P191CA0023.outlook.office365.com
 (2603:10a6:20b:21a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.8 via Frontend Transport; Tue,
 10 Feb 2026 14:50:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F98.mail.protection.outlook.com (10.167.16.7) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.0 via
 Frontend Transport; Tue, 10 Feb 2026 14:50:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nVtJiss8BDUklbCztDc/HV3CGFB+GFvY3F6LYuFFinexIP1qHT57A2AVeTQnpBo0PzkS01msfIwdndxxnPIffCUAeAKuDL9mDtWrMfkYqcHfytps/JJTKsFG+JYhazdRoT8drPTEGOEzjqQ69XlL0MxIeDNtm5+TIw9ng4fxj19ei5k7Zbd/aWf/adMWwG8QP9noZetvY4nyURVI/bwbYoh63PwRy2yhKxR3UkG/sRYrs+1k8lG0tC2upxW87clz24VQMgs+bLnND1zIxMiArhzeZP8xPLn+l2zxyOIja+8kW87/3dEuutFtpV3UOhappOKrkUgvXG5OtRyDXuEoFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4T+jL2dyB81ye1F9LhKvw65QZvPGMxt7JxMdi3iXzl0=;
 b=rKmNU0oHUVK1S2B5sW84pNzfhGJW+BR/CwnpgxVQxiLgtOedsH9Dm+hEA5Ivh2iTcB0oTdXd21/war8CGk99L/MpQhTJcEmXawTfcTKiwVDDzNT0WawadU1cUAI2rhMQKFWTiIadKG551vymk6zQ9gM6x2/RDSXyBjRCa46id1VK7+Q6yYKKYC08Y6aTKJcP/kl+8SVqr7XVEI0je5LcnamV/rrPnJZEumrPpmG3kGBG7tomtCEiQ0vdKTgYZWmpATUXIYsO9N1zgfspYFxwzAiwrTk1JhByXqQ+PlzO7Yr9rOuB1aBtM0JqOuXwQAzxUdMh74+VnaIvxQTTcNJGcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4T+jL2dyB81ye1F9LhKvw65QZvPGMxt7JxMdi3iXzl0=;
 b=S13SlVIIR22EO26MAqXrYhU6ahwz5OcSj1ZE+qNR8aoMS3J9tzkHVxSLLIqm8YV5U09rVtpoSIzFSJZnxOe6sPLWnBKf+mLdMGfiJqfDIe/wNixdZHEweHBMK1VZKoh67JfGbB0E07ZC67jLD2bDdj6+ccO+phr7RrdxFNGiko4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB8203.eurprd08.prod.outlook.com (2603:10a6:10:39e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 14:49:26 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%6]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 14:49:26 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3] python3-packaging: upgrade 25.0 -> 26.0
Thread-Topic: [OE-core] [PATCH v3] python3-packaging: upgrade 25.0 -> 26.0
Thread-Index: AQHclO1xP9ezi5hyRkWJtZirV5p9UrV79KSAgAAaW4A=
Date: Tue, 10 Feb 2026 14:49:26 +0000
Message-ID: <112B99E8-000C-4B76-AB22-082E9FC08E62@arm.com>
References: <20260203091329.1294-1-wangmy@fujitsu.com>
 <223B8BF3-4524-4402-B6A4-51F068B64B43@arm.com>
In-Reply-To: <223B8BF3-4524-4402-B6A4-51F068B64B43@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB8203:EE_|AM4PEPF00025F98:EE_|PAWPR08MB9471:EE_
X-MS-Office365-Filtering-Correlation-Id: 12c31455-d318-4adc-2b93-08de68b3bcf1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?b0E0UVFoYWlZdEV2Q1V6SW8vYXM5REJUYjBlTDZLVnNmQ2M5L2d0NGVGbkRR?=
 =?utf-8?B?VlpwcXdQblo5WE5GWllvWVFPaUVaMkZGUEdpSFZ5MS9Nb0k5TnkwSDlERVJv?=
 =?utf-8?B?VVBQZy9RUUkzRERldXN2QWdQYzRMMVRRVVIyMWhVTmplMUFLZDc3b0pKN1FJ?=
 =?utf-8?B?cXJMVU1WMkJER1FrRzFaQ2lROWl6eWttZ0h1Y3FzZTN2YnBYcStNYmE5OEcx?=
 =?utf-8?B?a2VWZlhpNENPelk2OW96R2xJOGR5aFd3MlY1RlgwZVBrb2RpakpHLzBrKzJZ?=
 =?utf-8?B?OVZDaExTSmlVbThqYmFEL21jWTZENFR6Wi9WTkowbUJnUktiZ1l5K0ZWMWZX?=
 =?utf-8?B?Zko0SEVzRlJFUFErUUhhOElUejJKTUh0d1lYZWpnZ1RzUlM3SEVSYkN0SnQy?=
 =?utf-8?B?KzBLd1FITzJBdnNqNVcvWEt6b05tOTEreGVDb3JwK3ZmVHVaZUFKWFNmM1R6?=
 =?utf-8?B?R0dhK0t3a2VERXBTMCtNZDVGUGhBeWh0TExUSUQxeHdScDBNVE83azFaTGFX?=
 =?utf-8?B?akMzaWliampMazQwdTRJZUV5ZUNpdlBoMTBzeThLd3lZQXlaL2l1Nm5JK3k3?=
 =?utf-8?B?RzNzL1ptclJhMEhlbk4zazE1SzFQclFyTnh2NmNRbjZPbnVGUmtnWnFGMXp5?=
 =?utf-8?B?SitPM2M4TkgvV2Z1eDZHOUdYSDFIam91dDdTYUNwS0dkc3dWVWExd0JCcy9i?=
 =?utf-8?B?V21YeGhUZFF5c2Y4TnBwcWFUMHRMQjN6eXVFQ1FTQU82djlrcUV1Sk12VlJK?=
 =?utf-8?B?NFMwM0s4ZXZkbVJoYUpXK05XZ0lDdi93ZElZUHJ0b0h5aEtHWStNa0kwY21B?=
 =?utf-8?B?YkVLbDRwZ24vTkc0ZHpBRlVEcjc2MitGREZpdE9odEo3bUhoMU94RE5TNHMw?=
 =?utf-8?B?YnI3S0QrNEQyVkJyYkdWalhCWG1HZUZZZWJPUGZaSnphejZpb3Q1RzZEcXhj?=
 =?utf-8?B?SVJaTWZWaDZzT0p5VDZuN0wwNmpublJ1VllnTzN3TVJpQmh0Wmg4eHdVckRK?=
 =?utf-8?B?MkMyVndzTTJDelBMSzNRYWFkcUJzYm1HL2V4eTJEVjlBZExVa2NLckZ1RmRm?=
 =?utf-8?B?a205S1U5d1NhQ3IzRGtIVnBVWkFBcHVkUDJHQWdpNC9HMmFrZGF2ZzEzNGVG?=
 =?utf-8?B?TmNTcEJTRjhpQjJ4UE9zNFdXanIwZG92QlhMaVNnNzAwZ08xUWhjSXplNWlw?=
 =?utf-8?B?RWJ6dEUxNW8zc1NveUFrYnZDQTY4dGdrMFgwU1dpdDlFeWdkcWx6ZURocHF1?=
 =?utf-8?B?SWlzZXhrRTIzTXI1NlpkSlo0eE5iamc1eWh0eFUvcHlmaTROTDQ0emtVbXI1?=
 =?utf-8?B?dk1VYmxNdHdGSlR6SjdXNnMxQUhYaFhWeDhqNVZoWUJkWmtiUlZ6Wm5JZjlQ?=
 =?utf-8?B?ZVdtUEl4TDlPRHVpblpGZjAzKzNJaFdDaDNoaDYyeGI3RWFZT2tJaTZIQkU4?=
 =?utf-8?B?L3Jra2R4OXpEMWZCNXhMeUhnYzhzMGhUU0QzSnhuNkJ0MzN3QWdoLzBwVmNG?=
 =?utf-8?B?RXRLVE5Tc2kyRzcwZFRmUXo0VkdZYVgzb0RMUElrQjU5MHdlMUx3NHk0TmVw?=
 =?utf-8?B?UjFnTHkxMmU1Z0ZjdTdDRDJTbmlMMXRzeWQ4aitEOUVKV0VPYnZ6UEtaY0N1?=
 =?utf-8?B?TjdZL0MzYmY1ZmZuZnJNclFrNlJ4U0hKTThmalg3YVVZaW9OcXNCQmFVQTRC?=
 =?utf-8?B?dEwreEhZNmt5aDFaTFdYcWFsSm4wRkJuUklLN04wZm9ZUGsvbjFvUUt5Z3Iv?=
 =?utf-8?B?WjlhYm9iYTdrQ2Vvdm56MzRMQjkwRGtnYWVFNE1uRlN1U054WWExeG02TExl?=
 =?utf-8?B?L3RNa0VxeFdrMUxyRUYySlRkeXRvQmlxQmdWSG9oMDg0cnlwUFZVMzgzS3VD?=
 =?utf-8?B?R1lIWjhxMGMraDlIRzZoQ3JIRUlnUE9SUytzWTkvM3ExNFB1U2sxRWk1d1po?=
 =?utf-8?B?WU1TcmR1S1NXbTU1VmFuRXR0Rmo0dHl1bWNRZXYwdGsybVNaemxBUXY3R1hT?=
 =?utf-8?B?QUVLMEtadzEvLzlod2hSRmZISHZ3alhxeE93MmdpRWFOWmRLRkFYNDhOYTdV?=
 =?utf-8?B?bll2WVRwekR5ZVFFQU1WYmhPMnFQczYzdGFqTkUxZ1lNSVFrbkN0bFdjRlZC?=
 =?utf-8?B?Wm1JNUEzYjR0cnIrVFRhQ0lFK0dxOUtYQjNuTFNRYmo0bm5qbXZvM1N4bnpr?=
 =?utf-8?Q?90Ju2HRblJx3NIiIjR1pDwE=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0169C7C4B3514C408D625D7EEE1E3CD4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8203
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00025F98.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	dd6b143e-465e-4cc2-b78f-08de68b39646
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|14060799003|82310400026|1800799024|376014|35042699022;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Q09zaE00ZEJKckVHaWkxNThPQTVEOG1GSGFvRk5VN3BXaWgvL2V2ZTYxUUxT?=
 =?utf-8?B?U1l3dWtxcWgrdHZETkFHL240MEhYTlNteDd4djFIM3RBMkd6aVlnWkJSUHZE?=
 =?utf-8?B?UWk5YlF5clowNTJiOFoySmNJNmcwc2crRHNnMUJTbG5ha1YwM1JXc0paVllY?=
 =?utf-8?B?U1BsYysxV05EVitYU1YreWFNcjNqTDVBV2cxMTNjOWFmaWdyUVZhMXRYSUFr?=
 =?utf-8?B?RFZXYWFsaGtPaFNvbEkzOHRhQTRpVlZXZDB3UVpKU2pXTSs1aXF5K21rQTBG?=
 =?utf-8?B?TDVYUmJXdGZpTGJLdkFXaDZqaEs0SGNTZndUaHBweWQvYWRiSmFSd2MvSGJk?=
 =?utf-8?B?NlI0aGVvRHFBN2hoWnFZdTN1WGdKRHVpaURXQ0JDVlpScG9BR0NKSUVMRGNO?=
 =?utf-8?B?ZnVzRHdCUmhZb0lRTDVuaFZSTjFzYko2cXV3ZEVTOXl6WGF2SkhaZVJ4YXp1?=
 =?utf-8?B?Q0kzWmozYnFYaFBYbWxGZzlKMkZVMUZxeWYzbW5LN2hqOEdrQTJncE1vcU1X?=
 =?utf-8?B?RDE4OUFxb1p0OXdOejAxZ092M0FkSU44REFQeGxFNmYxN3ZLaG5GdFdFV0Q0?=
 =?utf-8?B?cTloYnppUEJieWF4aG0xQUg1ODBGQ21PeVdQaUhYc0E5RzNFaWdBcUg1Q2Vm?=
 =?utf-8?B?bmVsQVdDOU4zSDBCbzNkOFVWei9kb0JzUDF4TEVjOFVISVl2TnZUWkV2Mytj?=
 =?utf-8?B?S2V0MWpLMHh4VmxPZ0oyeFVQYnVTQVZJVzdWWGNjWHVEdURVRHZzaUdxMEpw?=
 =?utf-8?B?ZlphcFJJQlZQbzl3dk9zYTFyVi9jbVV1QURmd1dYSkhBZ3k4Q0t4MGJ5T0J4?=
 =?utf-8?B?emtNcjJyaFhSR0tSdjZNTW5IREJnUHlRQlRwc1czakhXc2c1VWl5TzF2WWpj?=
 =?utf-8?B?a2h6VWxnQ1RWVUVBWUhReEZzQ09TVVNUVVluSXFKcEVvN0I4T2FsSk56cDJN?=
 =?utf-8?B?MEZpOTd0V0NNZDUyK1JFNUJKWnducUExVDlGNDhTYXpWWGhYS3N2cnlMQ253?=
 =?utf-8?B?a3lNVkE3bWVKSDE3RjNBQVNqK0oxK1crbDRjUENkVDcxYWxaUWRhQlFlU2da?=
 =?utf-8?B?TDRMZmFqMWh3NWgySkdmVUl5a3dFR1FPMW0wcGE5blVBZUxsZE1Ra0ovVjBC?=
 =?utf-8?B?VWJvMHVVRXFiblBMUDdkTFpnUTVVSmxCRTVUeHF2cWFRS0lqeHJMY1VKcFFB?=
 =?utf-8?B?WjltelY2WEJlS3g2TnB2U3luYWxBTHNVcFQ0TE5USVUwL2E2MEtQL3h0emN2?=
 =?utf-8?B?cHJ4dFliRFRpQWw1YU4wYXRQTHFVR0NJRHhJWnhvUVE4cDJEOEhzZDJTOXVS?=
 =?utf-8?B?a3JiSTJwUGZpR2Faa2RKQmFWTElSUitra0tFYjVqT0FQdllDbmdjYlpoOVlz?=
 =?utf-8?B?ZHFyQzVOMUxiR1lwSDErTnZ3T1pHd1JNeUh6TE9yU0xQQktFVFIvRWN5OHN6?=
 =?utf-8?B?clNWS0tGL2RNbktwVW0xbGg5Q1dFM1pyOS9JSnpWdTVyQmVvbzJoQTh0cFZ1?=
 =?utf-8?B?RFJ0VWpyUnNreTVZQ2VLZFcvNlkvSUh1dHVKbDUxZWZZWDBhUnd3L3hHL2V3?=
 =?utf-8?B?aFQxVlF2Rkw5dmVZR2Y1RlgrdGd2K1kzcVkrWUFNb3g1bDZqNUtoZUc2bG9S?=
 =?utf-8?B?a1Y3ZTkvQW5adTd6M3BkTTFvcUhaVXV6YUdkSzJPRlFpWHkrZ1ZEdUt6VG01?=
 =?utf-8?B?MjBETHBISDAzbytYM3lsZWFQY1Zsb0drM0ZUZFZ1VkhhZnNTY3NHRHREVGZz?=
 =?utf-8?B?Rlp2L2VReXRZZ2s5YTZ2NVY4RXhoTWE4M3VHNEZJQnhEODVQT0dwU2RpTkhh?=
 =?utf-8?B?cHd2cjdRK0FCVmE3RHcwS1g2MHRVTmVpL3djNXJpdml1eUl3M2RJYUgvK2do?=
 =?utf-8?B?MzVTeEZJNUVqSTZQaXBRajkremx5bVp1U0xuajhtbUZkOElzbkkrR3NTZGpK?=
 =?utf-8?B?QWlqRnlSeXVkZUx3d2tKVmtzcDN5akNHUml2TkhjeHkxRG50WjlxSUgvaUlT?=
 =?utf-8?B?eU9JWmZkSTcweHNZRzlwTG1UK1Z6TSthcDdrSlFlWDNCaVMyTFROaG10c1oz?=
 =?utf-8?B?cXZISXVFc1dxRGgvaE43SzRBL1lpOGc5RUdEWTZjdUU1bVpQaHVYcGtweCtZ?=
 =?utf-8?B?VTFZSTI4aE8zU1JiN2dtcHMvUzYyNk5lY3A4RGs0ZzZiWFc5cUJvWm5Zc24x?=
 =?utf-8?B?TzdIeFQwMWJlbzlFUUZkTmVpb0x2WDJCdDVNcHFvQVFrZmNaSk9BUlZLZW1G?=
 =?utf-8?B?ckd4SWNNcUVTV3IwcUt1dGtlSFNnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(82310400026)(1800799024)(376014)(35042699022);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9uH7TeVYdgLXMa4LH9lr7A+5aAYg/QjstkzGqKjCra+OFYdXzG/u+bTt/RxSAwRd0QktsfARlcfZSW+VoHlL5rGVNxQyI3JBF8IGu4zVeivNfvCTZgPAIhwqqg5moavhix/C/o2vE4qy6dBwZsNmFqK3gAH2JgkuFSv5xiVpcYAIvjIk7mHpPhoUa2+GZHnMM92FoKR2g5Zw2FB4MM9Vs2rrg5aDPsCf3Bqy/xhZICeNSkcVnMpXIQ1qIH4CjqeCHP+4eMpU7DSeL20KsdFYCADoqdF886gM2LWIGAlTwp3DMXe112xxmyUkKIlUSxiN7OV16YI1a1uSza627IQ5ILpxovFGEvGZyOOW5paJQ20rPfBM+RI5CGfras5NulNgaARAv3+Ddqx/f8ojaqiPrEfQhKGoUgI6GefGKpuDOGFLJZ/W6Ux8mwi5fFB/Go54
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 14:50:31.1178
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12c31455-d318-4adc-2b93-08de68b3bcf1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F98.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9471
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 14:50:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230907

T24gMTAgRmViIDIwMjYsIGF0IDEzOjE1LCBSb3NzIEJ1cnRvbiB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8cm9zcy5idXJ0b249YXJtLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90
ZToNCj4gDQo+IE9uIDMgRmViIDIwMjYsIGF0IDA5OjEzLCB3YW5nbXkgdmlhIGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgPHdhbmdteT1mdWppdHN1LmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3
cm90ZToNCj4+IC1weXRlc3QgLS1hdXRvbWFrZSBJR05PUkVEVEVTVFMNCj4+ICtweXRlc3QgLS1h
dXRvbWFrZSBJR05PUkVEVEVTVFMgLS1pZ25vcmUgdGVzdHMvdGVzdF9weWxvY2sucHkNCj4gDQo+
IEluc3RlYWQgb2YgYWRkaW5nIG1vcmUgaWdub3JlcyB0byB0aGlzIGZpbGUsIGNhbiB5b3UgYWRk
IHRoaXMgdG8gU0tJUExJU1QgaW4gdGhlIHJlY2lwZS4gQWRkIGEgY29tbWVudCBleHBsYWluaW5n
IHdoeSB3ZeKAmXJlIHNraXBwaW5nIHRoaXMgdGVzdCBzbyB3ZSBjYW4gZW5hYmxlIGl0IGFnYWlu
IGlmIHRvbWxfdyBhcHBlYXJzIGluIGNvcmUsIGFuZCBiZSBzdXJlIHRvIGNoYW5nZSB0aGUgbXVz
bC1zcGVjaWZpYyBvdmVycmlkZSB0byBhbiBhcHBlbmQuDQoNCkluIHRoZSBpbnRlcmVzdCBvZiBl
eHBlZGlhdGluZyB0aGlzIHVwZ3JhZGUgYXMgd2l0aG91dCBpdCB3ZSBoYXZlIGZhaWxpbmcgdGVz
dHMsIEkganVzdCBkaWQgdGhpcy4NCg0KUm9zcw==

