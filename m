Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EFEBCCD192
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 15:13:11 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.28])
 by mx.groups.io with SMTP id smtpd.web10.19164.1760454785089467995
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 08:13:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=HqkFrzCQ;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=HqkFrzCQ;
 spf=pass (domain: arm.com, ip: 40.107.162.28, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bzkySuJrVjpBtT0u9Qfj6E12PTbNqsSXp/7LuWc91pJaUv0CCY7w22uAYxxnvvoEy0qguGPlCRZe1BXilack13oCnAvpUGMP6KjV/ZUJgCAbhmM4OZAmzcm+9AFdcru1iJvNYNqlRC98lFUMrSLh6GOdeTVnkesbciDcijRtunOwYG8Okmje4PvIbGlQ49wfhVSLk04vol6mkUofkBSTwILr1R88uyfEH9+ouIOFLOBQAF9t1N+fgNt9gUcYBvN7MuYOlnecOyly/KaUDyZTsh/UnrKyrAyLbJY2CfPwntoqR1wUo4GurGMJyQFp/0J8MrTdeQXa2sxBNFv+15cQrQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+W9sbMqaUZnZs7MQeVTC7K5tDVp3gGJEh9rTSD/m5Zg=;
 b=mQqtB06OSHQGroJA/1tEjNZb6aXQq/Qn16sC122OpXBeZ9BVsBBUh4gdj6iTa9dYvV3cRzvoLIfSHWm1WNgG7sr8GsuG4dmzb9MfcryZdcF5DgIY46j80D/7Ot1MbS7c5bUyXAJEHv53u2+uCmvOA4mST7YSaS/QE+1/+kK2e72YjsjDVbTwpr/E65zxsRR76aCRwed5kSfKFLg9IyizaRq1khErrzGGv/s8YE7FeV784Gghfi16pOPvd3QyfLUF3DoyMPQ8O04JZyhKlepEagn+DdE65YU/XN0blxB5UjK6+kVMtmoxzETvnUu+H2f4cx57yQXIXQxP0b+ul6aVqQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+W9sbMqaUZnZs7MQeVTC7K5tDVp3gGJEh9rTSD/m5Zg=;
 b=HqkFrzCQHGyOD4UKaBLxSysdOtCkf0925DtMexFE3KUZQN+JMUHYrkNJ1Yxgqdn2/ynrw5EqBrHwBvt6Tz6IBXaGRHLxZhBR3WzFe69MYLukTC950tKPKTT8+UULNtS5qp4awKB3NP9x6Bvx5LzkbOAxfiJX9sxiBe5rY/C1kU4=
Received: from DU2PR04CA0288.eurprd04.prod.outlook.com (2603:10a6:10:28c::23)
 by FRZPR08MB11161.eurprd08.prod.outlook.com (2603:10a6:d10:135::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 15:13:00 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:10:28c:cafe::b) by DU2PR04CA0288.outlook.office365.com
 (2603:10a6:10:28c::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.12 via Frontend Transport; Tue,
 14 Oct 2025 15:13:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D09.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.7
 via Frontend Transport; Tue, 14 Oct 2025 15:12:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f3XxmO+17/4QgItL9s4KgiFSfxoeu4/cnjGQpKDIREG9uXnyIfpcRzhpzMULMZIKfYWqI1mJYrQBX45u1gQU/DkTH/NMNSyThI9DHwM1MENPgmvOdsmM1jfGPF+NfNfyj+t5wYymGtDe64FSKJvBX/nuVnfIl3LC3Ser9Swn+JCeuv1RhhRf0Tseaf4Bj7riB6ULd3l9IGcmgaPWX/onfT2P3eozqHL1s34SDx4+a0Tv9L/qR/anautDVcoGaIwt4sf3fHWZTwWAjcn7IkCKhRO+KovA8Q63/IGzxw0SYggyW1tc5FDmijVSX46GDiJoMXF+E37wEzIPY1ibZjj9mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+W9sbMqaUZnZs7MQeVTC7K5tDVp3gGJEh9rTSD/m5Zg=;
 b=H8zNuu+tfApSA1kTO6voGhJyl1Tz68JqmQHkFUJTExukTFtP47uyiySGbET35CkB1KgxPlMVXxMncvCplEJDEUUP0evDAbuXiqfSQ1IKahmMGpMd0Xxxc47/VGK/CAIbOukbyYbh48H01PGU+0Rh2hSGJvNe7yXLSTn/uqDGnEeZS8JE8GXn5xfmwYHqVjSiah983WciY9DNF8cI3EVIGIjN5OiyuVexEuvG2CH1R4PBJ9HZf6bFtXVNzxPK4RUZorsxcgV0D74uP18lDUHf41DZIp7nGG4qF7B3h4dBCuosX6Qmx887zjNMWYwfAZnrNhOg2wXclDAgf6gxsbRPEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+W9sbMqaUZnZs7MQeVTC7K5tDVp3gGJEh9rTSD/m5Zg=;
 b=HqkFrzCQHGyOD4UKaBLxSysdOtCkf0925DtMexFE3KUZQN+JMUHYrkNJ1Yxgqdn2/ynrw5EqBrHwBvt6Tz6IBXaGRHLxZhBR3WzFe69MYLukTC950tKPKTT8+UULNtS5qp4awKB3NP9x6Bvx5LzkbOAxfiJX9sxiBe5rY/C1kU4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6375.eurprd08.prod.outlook.com (2603:10a6:20b:31b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 15:12:27 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 15:12:27 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "dmitry.baryshkov@oss.qualcomm.com" <dmitry.baryshkov@oss.qualcomm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 5/5] mesa: drop useless freedreno-fdperf
 PACKAGECONFIG
Thread-Topic: [OE-core] [PATCH 5/5] mesa: drop useless freedreno-fdperf
 PACKAGECONFIG
Thread-Index: AQHcOd2uD/53+iRufE+7lxSpy/pFE7TBxh4A
Date: Tue, 14 Oct 2025 15:12:27 +0000
Message-ID: <0E1D022C-354A-4064-9537-8835AB5B5332@arm.com>
References: <20251010120125.2868011-1-dmitry.baryshkov@oss.qualcomm.com>
 <20251010120125.2868011-5-dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20251010120125.2868011-5-dmitry.baryshkov@oss.qualcomm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB6375:EE_|DU2PEPF00028D09:EE_|FRZPR08MB11161:EE_
X-MS-Office365-Filtering-Correlation-Id: dc721788-45d9-40fb-f23f-08de0b342982
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?VGhkOWJNVTlRMThiL2UrWGY5RkhKbndCd1pyR25qaDg4bE5pWUxsTzZkdURP?=
 =?utf-8?B?R1NTenNIVklBT2NUUDRGWlMyS1Y0cGE5N1VpN1laMzlTZjAyV2RGbmppazFs?=
 =?utf-8?B?enIxd3N2cHh5V2tHdlZsTDBWOTBLdzlTU090VlNrcmV3N2pnaVZ0NCthaG5h?=
 =?utf-8?B?OS9XZGtIeEQ0YzdHOEZWZFNjZ3J5M2pjN2p0OVJMcG5nQTJmN09yU3REWnJV?=
 =?utf-8?B?V24wdDI5MXhxZDJvb25pVWs4blpGOUFyVFAvdTJXOEV2Y3FXbjYzV25jSHBz?=
 =?utf-8?B?RHdZZmVDR2cxczBnQTFiZ1ZIaVZRdmZRZ25pUFZTYStoK2lXYVB3Z0ZmTmli?=
 =?utf-8?B?OWJFb2pYQnhVVFR5UVZWQlBwK2FyWitoNmdXY2ljWDNtQzJWWEdNME9FTlkz?=
 =?utf-8?B?cGFhN1lUcE1sMTA0cklzakVwK0hPc0dBSVlNWXVCOFdranplNUo3M29Kekpp?=
 =?utf-8?B?d204UlFBRnlCQWJ6aFZjaHI1MkxtaDNBUzhxdXBhSnlSbjQzWUJkL09GYjhI?=
 =?utf-8?B?WHpzZFBXb25sVjlXalVVbGpmZXNPZG9iSzFwTWJOSE9yZXBoV0p0WlZXRjRF?=
 =?utf-8?B?a0lnRDNXSFpsZ2hTWW1QakQ2aU5IM3Z6ZkhIMEdGaHhoeUN2aEVRT0VYdUto?=
 =?utf-8?B?RDY0V0dMb25FbEFxT09EUDgvVDg5VjdoTE1HZkFkSktoRUtDV2paZXVNK2cr?=
 =?utf-8?B?U2UxNURoL1lRTy9xUFFYTjZsdTJxeFF3M1c3enQyVG9nUVU1V2IxcXAzZjlC?=
 =?utf-8?B?T1NtYUUwd1ZQSHNhWEpKSnFISzlmZUVhV0dOR1F6aGZJSlBockMvbVBkNVFE?=
 =?utf-8?B?aCtjY0hXWXRRR0tvRUJmdnR1L0daaGJSMVhzVzFBUDFsUE1SU3RkSDdacVRo?=
 =?utf-8?B?WDdaU3piaHFwdDBkTWZsY1pNOHI2YWMvcTRZVUlUTzRVUWRWSVp3TldveEZx?=
 =?utf-8?B?bnZZd0RUREVSVm5rUlREUmNuT0hSMFEvR1Z0OVJ0dGNydVF3QjU0U1VqSVlC?=
 =?utf-8?B?QUZDdjJBd2VpMzB6eGpuNnhTYWFsdDRqZTVnVkN6STRhNUN6K0dqdC9lZFE1?=
 =?utf-8?B?SVEwU1ZZTkZ0dGFVRDRLdFlIc3JYclB3T01FZnE2czhISi8wbEVNU0llWjRt?=
 =?utf-8?B?RnNhTXJpVGRFckhlb0dPa3ZyUXJOZzFsWkZFWkppY0hseVhIZVVIckUxMkc5?=
 =?utf-8?B?eWdBQ2ppK0JMRGx4R2dScUhuTFVUQkNsUjJhUDhYeHAvcGZuZ2JFNkVnVTdq?=
 =?utf-8?B?NW1NdUM0aVJwK1hlT2M0V0ZrVWo3dURZR3lXeGZXaXRRK011d1lCeGNWRXUr?=
 =?utf-8?B?ZlJ2S28ya1NFZmFobVRyYUZoM1FUVUx5R0phYUpoNjZMdkFSMFFJWGNBNnFj?=
 =?utf-8?B?cjRldldxY0RXK0s0NFJKMEVPcDFCL0xwd1VpUWRFVWowNWNUQTdxSVlOYjNW?=
 =?utf-8?B?VGxvSzJKL210cXllN280M2twNVdjMVpZWGVDMFYxbnExT2FobnFnb1kwZDRY?=
 =?utf-8?B?dlJpc21GVFhQeGUrNUJWanBONldKWEFEeEJianFDdk9icTUvMHhSQXVLRDJM?=
 =?utf-8?B?MDdONzlRRGt6Z3ZxNGsxeTdtRCtNSVRUTTFkMndCWmdCQmI1cnZ0Rk1ueTRs?=
 =?utf-8?B?R0FOdU9BTFh1U3U1NU9aV2lWY2ZIZ0ptREVVMnpFSURERXg3aC82UnlzNCti?=
 =?utf-8?B?L0lDYzg5Yk9DRkNYZHhWWGswRXRXa3lpOE05MHNjU09Fc2svaVdKOWxSTzFR?=
 =?utf-8?B?MTc3TzNYTlVHdWlScmVzYi9xdXF1a1V0d1dMTTJNbk1meHlPMXhKVVkwS01U?=
 =?utf-8?B?amVybzAxbVBTdHVFanUzK1FncVB1ZGhZM1NxTGxKTTQ2NVVYbWgvYUhnbmdV?=
 =?utf-8?B?K3JsRlFSQjFJb05VQlRrT3lXdnoxOEtyZ2dNeWkxaFBITnZEYk4xS0VqSXBz?=
 =?utf-8?B?M29CSHRLaVo1azNwZU83UVhkanQycXp3cW95ZDlaY2ZvdE92NzFyTEZtUHR6?=
 =?utf-8?B?MHZrL1JpSFlGQ3Q4bVlUOW1oSm5rY01YZkduckR0QWlhTVk0dm9Fei9SUXFx?=
 =?utf-8?Q?KdUW0z?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2F56642EA2FB35478A08E8E9EFFA6CE8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6375
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a40710f6-e622-4b5a-9a17-08de0b34163f
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|35042699022|14060799003|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U3VTU3F1VHlFd2ZDMFpWYUJzV3Ntb2VuQ3lzMFFNclBxZnhWYU4ybDZRWUMz?=
 =?utf-8?B?d0RnbkhTWCtpbXRTWFYxOU4xdVlITHZBVEhIUURBY3JRMW1OWmxwMmUxMmxG?=
 =?utf-8?B?clBITUtaUUdFZTNtRkZjWkZMTHdlMzNDR3JiWDhGMEdxcmRPL3pUaVFhU2ov?=
 =?utf-8?B?a2s3RnJ6YnRCWU5jZE95elRqQ2lwdWlBME9XYXRwQ2txdVNWQm10WHB6aDB6?=
 =?utf-8?B?YWR0ZitkeElSZnk4VC9sVXFOUjI4UzAyVkpQOTBjaUwvdGVUTFM1NDFlK3JT?=
 =?utf-8?B?Y0prbTRYaVdJT2lJVk8rTklzeWIwbGhTT3ZPc1NFM0FEQ0NLSVN2d1N1V0xa?=
 =?utf-8?B?QUkxN3hzbDZtVnNxNXloOXRYSXVvbDJFWEhtUWtOSHlpaWRqZ2REQlFlL0ti?=
 =?utf-8?B?K25rbk9udWlQZkFiSEowc2NvdUFzZ3ZqNGtmUUYrMzVQd0xodUk1THREODhK?=
 =?utf-8?B?WEZwNG9vWitZZVhlbGR0Vm9FaFR1THM1SUZ3RHVSNlYvY0sxSjF5NkdzeDZR?=
 =?utf-8?B?WDFiQTdFcnYzR2tSZUdNeXVIbFVrVDhKRXl6SFh2SXltZS92cVpaQ0x2ZSsy?=
 =?utf-8?B?cGx3YkxQVGxvYkl6OE1CSWFySGxQVmpnTVdJWXdFL3FaK2JrNnRMM1Q5Qldo?=
 =?utf-8?B?Y0J6Ui9zMkkvZFpjWkhJWlllbzRnQmFoWURPRGVSNDNzWkdPcnYzYVNhRlRY?=
 =?utf-8?B?MmFqMDRUb3hrenpvVHJaT2F4TERwT2k0UWRTQTlwZXI0RUs1WHlrQ1NxTnlI?=
 =?utf-8?B?SXk4eElyWWtTZWpoa2ppbFQwMmNKRWJ6ei9hdC8wNkdIcTR5aVBCMDRpZURl?=
 =?utf-8?B?MU1QK3RYZEhQb3VNQUpXbTY5dU8ydDRxdkZXMW9qUGp0a1Jkbk00ZHpXMytD?=
 =?utf-8?B?OVB4UnB5dy9UTDRoNDQ0UStQektFcHhpVzUvUU1oaHpDMGJmRkxMSVRMMXF5?=
 =?utf-8?B?NzUvUDVQSGh4RThRbnM1OEFkS3lsSHRhT1B1WHhWdTJWcTdhOXNuKzBqeFJz?=
 =?utf-8?B?NU85ZlBlRnJ6ejhUOE9QKzFVSWlXamNadS84bnNtVXd4R1hzdEdna09kRUJW?=
 =?utf-8?B?S1JraXlWSFVQbnhMYjkydXZxSXZ6NGRmRFp0K0NsRnQ1bGMwclZRUFFnT3V1?=
 =?utf-8?B?TGJKV3FLUXFnVC9PeVFlZFhpWjRNQTd2VllVYTRPaXROV0JEWGlhcVEydWF4?=
 =?utf-8?B?VlRLdEJHWmF2c0IwTFIyRSs4SkxBRXBEdzNqNWNpM2VzY21OMnQrVUo2VlFr?=
 =?utf-8?B?ZVFyRk5iZTI3SXZuVkRCSXl6UFdjaTB0TEw0cSs2U3FTQjNVbDFpaU15ZnUw?=
 =?utf-8?B?TlNyano0QllrUEgvdDdCaDQ5QnljcVU1R0hhSFFSNlQ3aitoZDZxT2l6cm9D?=
 =?utf-8?B?SnA0K3R3YnQ2U3hKeXA1a3JpL0JISHRQY3JKWDRjNEZuN1pHK1RJV3JrU0ZH?=
 =?utf-8?B?U2RWVCt6TmIvaGZCYkZWNW84WG8rQTZEeXo4eHJTRUlpemtvVVIzaEhmS2Rt?=
 =?utf-8?B?VStZWlZYWFJCR2phVWNCL3h2VThvYjZGc2RDMDdwUXhqT1FmaVVUQXEvK1NG?=
 =?utf-8?B?VVhybXZGRkNYK0QvYmEvYWdCQWdTZWo5ZHpMMk9UM2lQMXkvaExtV2Q2Nk1y?=
 =?utf-8?B?bjRIRDQxR3Fjb3lRSGM2VmVFMmpGL01oK1E1dVROcnBxY2E0ejN2OVpHZ2h5?=
 =?utf-8?B?RHhEMGU5VmZXd1FPQjk1SFA1K2xSNHFVUjlHNXNpU1NlTmMrV0k0Z2dpaHRW?=
 =?utf-8?B?ZHlSSG9xamRlTGZ3TkZ2MTRtaWllOWt0dno2T2NFWnBhbC9zR0NSeHJua2FB?=
 =?utf-8?B?cGs3TGhUMmxjSlBuQ1Vzc1gxazkrVzE1SVFkKzUwUlM3YVpXcGV5NEk2eDZu?=
 =?utf-8?B?cVBjaHNLTXlFQzlnMUJmTkJpU1Ayb2RMdzhzRWdHMEV1NWdueGF3b2J6bG8r?=
 =?utf-8?B?bXpnV2NIYXFsQWliaUZIbGVPQmg4QUQ0aUVxRU51QUxBZlBCdDBOUm52SlNR?=
 =?utf-8?B?R1dURmFxVU12Si93M0hYZ25RaGxzdEErV2pmdTR2VnpjMTNoREVSVnBnY0RU?=
 =?utf-8?B?R2dhWU05RVJGVVhXckorM2dVVWdFbmplRU5xRFBleEtMaXEzRDlibVk3Zitt?=
 =?utf-8?Q?JO/A=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(14060799003)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 15:12:59.5358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc721788-45d9-40fb-f23f-08de0b342982
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB11161
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 15:13:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224834

T24gMTAgT2N0IDIwMjUsIGF0IDEyOjU5LCBEbWl0cnkgQmFyeXNoa292IHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxkbWl0cnkuYmFyeXNoa292PW9zcy5xdWFsY29tbS5jb21AbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IC1QQUNLQUdFQ09ORklHW2ZyZWVkcmVuby1mZHBlcmZd
ID0gIiwsbGliY29uZmlnIg0KPiArVE9PTFNfREVQU19GUkVFRFJFTk8gPSAiIG5jdXJzZXMgbGli
eG1sMiAke0BiYi51dGlscy5jb250YWlucygnQkJGSUxFX0NPTExFQ1RJT05TJywgJ29wZW5lbWJl
ZGRlZC1sYXllcicsICdsaWJjb25maWcnLCAnJywgZCl9Ig0KPiArVE9PTFNfREVQUzphcHBlbmQg
PSAiJHtAYmIudXRpbHMuY29udGFpbnMoJ1BBQ0tBR0VDT05GSUcnLCAnZnJlZWRyZW5vJywgJyAk
e1RPT0xTX0RFUFNfRlJFRURSRU5PfScsICcnLCBkKX3igJ0NCg0KVGhlIHBhY2thZ2Vjb25maWcg
aXMgc2xpZ2h0bHkgdW5jb252ZW50aW9uYWwgYXMgaXTigJlzIGp1c3QgYSBkZXBlbmRlbmN5LCBi
dXQgaXQgaXMgZGV0ZXJtaW5pc3RpYy4gIFdlIGxvb2tlZCBhdCB0aGlzIG9uIHRoZSByZXZpZXcg
Y2FsbCB5ZXN0ZXJkYXkgYW5kIG5vYm9keSBsaWtlZCB0aGUgZmFjdCB0aGF0IHNpbXBseSBhZGRp
bmcgbWV0YS1vZSBjYXVzZXMgbWVzYSB0byByZWNvbmZpZ3VyZS4NCg0KUm9zcw==

