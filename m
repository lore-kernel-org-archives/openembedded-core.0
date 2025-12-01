Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A0BED116F1
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 17:40:51 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.61])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27579.1764610848137854431
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Dec 2025 09:40:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=GRLRUDGS;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=GRLRUDGS;
 spf=pass (domain: arm.com, ip: 52.101.83.61, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ZkE+GVIbDf/DZg7iMSsKNTgth7Jx5lvy24gOcfcz4YA52KlRDYlfh4nsQmLWQvayreMzuQ8xP+AUzbG27OlRT/ZNRPjqeRg5BrFtQjkY4xOK8Niwf+m2K2oOkYQ02RLQCh5hDLSOIR7LYumcZnp3aR/O28aQqr8/ofupF5E6rQUH2r3rC2kwn4ODx7+FmfCkThxPVeSm16jIwzzowCFcpBH7Q2PtOokZE/BOx7POHt/0rjdCEg4kjkngGmsv6G62llnVlvf+tqlUJW5tFX1idxRDdXTEuqF8t/JMtcdUXqNCEx3hbo7hozy5BeP9t34AYDbXsCq8UFL/2JU13vLOqg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=19/vlizmXg2ZRZPLuI5jqvWJy1KAoslXvzhYtK2/qbM=;
 b=yw6KjvbZlAsARhvyd6JlqhvbEm3+//VVWhvdSsyPRor6VbzzDjqKvKpfYvfBcsviYJ03jWXw6F64x9fe0pAiV+iOymbp7iMDx81r+sEnIPMDIlF4nDl1yNxADqZa+Hm0DySWiYzUqaOieoWjE8P71E8PrJRF/FyYHX0cVazHUOnp3OT8s14qrxkmBb6P+uhrZH/6lDS8MVCY7fXInz85hDTlqs8n1perHk8+B2U6LabAvNU9j1Q9fSKSoR8EWJL3tGeJN5NJLTycSzzuQTIiFHF/4si8or/u2uwUar22ImD4RAQZhHXOd4f7quCmNYJQPN7qlrxlHMZKaMWP+93JjQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=est.tech smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19/vlizmXg2ZRZPLuI5jqvWJy1KAoslXvzhYtK2/qbM=;
 b=GRLRUDGST/RLazi/96DbyI75qsqWHs4PirwP0KU5bCOruyXHaYYguEYbYEPFD1sW2ge9EwtFVywrsop6Oud98kTYI8j6z3yhHbGlI+lr52SEpqB1WM0C9RAE2byy4gwvi0t2JhjBHULSEBqtsTVPpqFjNxcrH284mgWWUhBaa20=
Received: from DU2PR04CA0353.eurprd04.prod.outlook.com (2603:10a6:10:2b4::13)
 by DU4PR08MB11077.eurprd08.prod.outlook.com (2603:10a6:10:576::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 17:40:42 +0000
Received: from DU6PEPF0000A7DE.eurprd02.prod.outlook.com
 (2603:10a6:10:2b4:cafe::bc) by DU2PR04CA0353.outlook.office365.com
 (2603:10a6:10:2b4::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 17:40:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7DE.mail.protection.outlook.com (10.167.8.38) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8 via
 Frontend Transport; Mon, 1 Dec 2025 17:40:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lZUMEtkel3JdP/T48AvboacJEkMbl3LfAnRk09rzyXkRoEdJ3N/Pbe3+MXirE0WyboH+T1ik1tzTuuR3xmFaTGCR1lKZvG65U2GWG29tLsUCwVVppj0AJ+9980+WOAc6MgMK3uhkgPfmEEyfyeDDgjk4QiqP7w3Tm8ud+1ueip1UWlXPWUihg0fudmnGSpoaxHlOyvfAo5kIsGRnMrQtf6vmbnuLtUGK8A1BNJD0HyOb1N9kaqUw2PJujt3tcjNI1Sx9PiU/dM22in9tZqD3w/agDb+vlojaLMZbnyUHTCM8bYrc6FRGab2yDaydc1kjQJR7FlHxcdTlcp/DaoKYuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=19/vlizmXg2ZRZPLuI5jqvWJy1KAoslXvzhYtK2/qbM=;
 b=wm/OZ7rJL7oiPMg6U7XGq5YUNMomlaYD/j/RWQzmstyPxipYEyfyoN2JHoFx6nxYS7aYUkRTYrmOdNZu8WLIgew++6xfCgzz5hik9dKDmitMQkxuUTRPvYdYjA0Skz4fPx31lKYOVUc/1TXZ1lHSyzeA9ihMSyxFXGPm09vAX12v+u0KtUzpjRLJJpsbzoa2VzljYxx/Ag3ig91hNeN+RnsZ2JnKmfrTE9gS5jmiWdlpOYU+KuHc9Ze8kW/Mm6jYvQj6nMjloZfND6S1Ypf7SA9DmPOwdO1sZ3dUQRxI8d+SyuwUI8Ct/Bm5bidN1Bixw0UawoDxzmwGcuDibfyi/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=19/vlizmXg2ZRZPLuI5jqvWJy1KAoslXvzhYtK2/qbM=;
 b=GRLRUDGST/RLazi/96DbyI75qsqWHs4PirwP0KU5bCOruyXHaYYguEYbYEPFD1sW2ge9EwtFVywrsop6Oud98kTYI8j6z3yhHbGlI+lr52SEpqB1WM0C9RAE2byy4gwvi0t2JhjBHULSEBqtsTVPpqFjNxcrH284mgWWUhBaa20=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB11524.eurprd08.prod.outlook.com (2603:10a6:102:50b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 17:39:40 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 17:39:39 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "pratik.farkase@est.tech" <pratik.farkase@est.tech>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
	<pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v3] libyaml: add ptest support
Thread-Topic: [OE-core][PATCH v3] libyaml: add ptest support
Thread-Index: AQHcWuij1JkWGSnpOkG8vaK+MiYE2LUNHRKA
Date: Mon, 1 Dec 2025 17:39:39 +0000
Message-ID: <54E0E367-D771-43F9-98AC-DEF6F1FE66CB@arm.com>
References: <20251121115420.15308-1-pratik.farkase@est.tech>
 <20251121131306.19079-1-pratik.farkase@est.tech>
In-Reply-To: <20251121131306.19079-1-pratik.farkase@est.tech>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB11524:EE_|DU6PEPF0000A7DE:EE_|DU4PR08MB11077:EE_
X-MS-Office365-Filtering-Correlation-Id: f5aadd62-8f83-4a2d-80b7-08de3100bfc9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?bHhiVEo2bUVzand0RTNuaHpidTRkbHU3dm4zRlVUMW1oVDdkSndTMGFZSjhB?=
 =?utf-8?B?L00xNy9ZNzUvbjRWb1JoY21kZFRXNkJtWTBJMUY1VzV3WXVWRDBid25sTzkr?=
 =?utf-8?B?amVHWjI1eXZHWk9ZN1BaTi9uUnZxcy8zSzM4aGU3bnlQVHlmdDdJTGRobFFu?=
 =?utf-8?B?YXlVazJtRVkyTHJXV0I3ZE5pUUdlVFowOGJObDdveXRCbVdwYXh6UVF5Njh3?=
 =?utf-8?B?dmRRWXV5Y25IV3pzVnhQdDRiaUZIVGtBYlBCYThrT0NHNDcwTkVCWXVaVVRO?=
 =?utf-8?B?NWpkUG9qdjYvTm1YWVVzYzNBdU9SaFBmdjVYbVJQbjVLMU9HWXpRN0o2Q3or?=
 =?utf-8?B?bVo2c0lqU3VSelExd00rYUtSTlNhMitEZXpXZTJSSFhiS2VTT3AvUnJnRThJ?=
 =?utf-8?B?WWVmZG1sY3NwWGJ6QlN0Q0lna2pncHp6ZnFBZXBITzJ5c1JycWZvd2g2SDZs?=
 =?utf-8?B?ZWg3VWIySkZ1SWZaTDlOWWlaZXcwUmd1VG9QN1Z0VkNybjZQRTRXTVQyRUdH?=
 =?utf-8?B?WlJaWTVsZUx1MDg3emxYZWI5a3RoWlpnMnVFVkIyMlp0ZkhNUWJTbjZTbjk4?=
 =?utf-8?B?OU5yeGxNQ0F2dUx5SEJHcjYwU2crMVRqcHBtZDV5bndicVFmSHJMcmxRSk8z?=
 =?utf-8?B?S2J5TXJJb3BleVNlK1BTUUVVL1lDa1BZWmI3Q2pPQTIrNHIzWXNWMFJUcDdq?=
 =?utf-8?B?cDNzeCttWDhwR213dGlXL0l5Q2UraFhzcFMzY1A3ZlFsNVl4aGZiUmE1SXBp?=
 =?utf-8?B?dWMyd3VTb1NUSGhIMjY3UC9LS0o0bUJqUWRYZm1HaXB3N2I1VWR6MURuVEZj?=
 =?utf-8?B?U3lDaXVqL25qTDdqMXdVQW5jL1NsWjNTaGFOTkZ3aHRwcnFTZ1NpaXlBTm5M?=
 =?utf-8?B?QUhDdGNoWkQ0U0tsYlFjOHdxSE4rUGo3SFUvbVhVTEVoY2grN3JJRlptU2JE?=
 =?utf-8?B?dDJlbmpsLzdxYU9odGUyZmZMSXVWU1JCTitIcG1OZ2k2eFRuY0hsZmJUTWtD?=
 =?utf-8?B?Smh6Z1U1ZGRtMGUrb1FvL2ZBNTdTVzhBVGkwYWVtVGs2RTdXNFh0Vzh2Ny9E?=
 =?utf-8?B?NEE2NGZCdlpVUXE0UTRuenR3b3FLK2RmbGdpSXFjU2lZdld4SkxDbkpYYWRx?=
 =?utf-8?B?QldrNWpXczcxQmdiaGpSWlZWT1JDajZpQmlsU2lONGhPT3Y0ZUd1THJRcVQ0?=
 =?utf-8?B?OVZVNTJmRWlQTXBKaDJ0a2FGWXlEOHNqUGpKSGVzQzlBSVZIVjJkZnhxL0pl?=
 =?utf-8?B?djczMlhzbHZOdXVZS1FQWTg2UWEyT3BsdDUwMi9rOWNVcVRobS9QN2dNZmhj?=
 =?utf-8?B?S1BBdVZ0dkpkYnZHbGgrSS9rTUdlVGcyNUlLSVVuTm8xZjRZSXl0OTc3akQ4?=
 =?utf-8?B?WkIyUVlwVm1ZdUJkSVJLWTZuREplYUc5d2lOUXIyZDlhdGlQWGNDM1RNSnI2?=
 =?utf-8?B?OTBYNEMraG4xUVFDTEQvR3RjWTZwQ0xzWEJsSmUxMm5mWjZnSGlTRmpnSFp4?=
 =?utf-8?B?U29OTTRpa0dRdkdhejFRQ0J3c1F0dXFWdlo3Yzk4aXVPR2NxSjlyTjE3bXl4?=
 =?utf-8?B?OGYyUk5hR3ljeCtQQktza1RTN0E1UE9UV2EvUGpwUm45QjliOVdTck1Tc1gw?=
 =?utf-8?B?R1JtSXVESDVvWGtZVEFBVlB5MTNFbURuWW00TWJFTmVPNjJMUHp1RWlJRkpx?=
 =?utf-8?B?eFE4T3FqNUptOStVVkIxVkFBL0RqOFhpMkN2NDFOVHY0MStqN2JxK0dEdlpX?=
 =?utf-8?B?Wm82cFhGbzdCN0RESHVVUXdHWjFWZ21tcmRCSDA3VjVlZ21CVkF2am1ZM2xi?=
 =?utf-8?B?Y1RXazR6T3piK3BVYXZMT1JVQjYvaW01ZGhKbExYTVRVVVpLNjFyN1R2N2xr?=
 =?utf-8?B?L1ptRVVTOTZTTldEdndBMGhnbm9jZFFlaGlDQ1UwSXVHSjE4NTVrUkUza2Nj?=
 =?utf-8?B?RlFzeHZQZ25aVUY2Vmt1MjJTUE5lRGp0bDMzd0xXMlgwNWFEQmtka1hXUUZu?=
 =?utf-8?B?azkwRGdtU3dDb1QvbjM2MUlVY01mZjVvc1hDTzg0V1JXUlkxRlhTeDZEMDhY?=
 =?utf-8?Q?qoEq15?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <10E2C12CF7BA0C498985F5B4F7A53C9E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11524
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	009dc2fd-c255-4145-2f3b-08de31009ab8
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|82310400026|14060799003|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RUlSWFdqZ1F1RHcwUHFsVktvVjh3NFNQMnVJdjVlSkF6NkVqSVRJS1ZhNzRn?=
 =?utf-8?B?dVhheUNXZnYvY1ErcTRTYkVEQTB4WVhLYURqWG5SMVZBQzJROWU5K2hwK1ZF?=
 =?utf-8?B?ZjBTT1dsVmZYZVZ6T1pmZ1BrOVhOTDFWNnNOQ3BOUGRib2x0RG1xZzUrN2sz?=
 =?utf-8?B?cjFhYVgxd09kTU1YWlBGY3dUc3IzSEhTb2ZxVjN6Nk5ZTkZ3WU1rSnQ3S2hY?=
 =?utf-8?B?dFM3bUhaSWJnb25rb2orMWpKK0Rua0w2cExLdm8vclhxTFFWRVNxU1QzUS8r?=
 =?utf-8?B?SkxJRytkWG9qVDFoZDduZzZBNWh5Vm9JTDhQYVhpMzhzbEtKZ3pyaFgvdDd0?=
 =?utf-8?B?aldKVWVaa2R0bmRsQlgxNDVEMUhNWno0UGRUV2RXTGwyT0J3RGxHVHZMWjhr?=
 =?utf-8?B?V3NKOWhVc3I3UGF2aU1SV2E0bTdkWlFRajlNemZoS0hlUHdNYnNZRG9MWkRR?=
 =?utf-8?B?bURzbnJpZWhtb2tET3Z2bXRsRUVaOStmSkptaXNabmZNclB0d2s2dW84Qkgr?=
 =?utf-8?B?elVSS09QVDRTMGwxOGU0dnltTXhULzNGZjAyZkdpcEFNRmgydnpQRXcwMXEy?=
 =?utf-8?B?RE1SUzcvTSt2OXBiMUhlVzhYMkVoU1NVNlVrRjZhU042UXpZZHJZMitZM1ZS?=
 =?utf-8?B?YStVWXFKNU9IallkT2F5N3p2YUVSSHliKzcyUGZzUlFIY3gvMlo4ekhPSGRu?=
 =?utf-8?B?OGJVZHZvZEtTOWhGV0IyRlpJMGhBMmZhVW9qdVhZUnlZNzhCNFd0VkMxK2JQ?=
 =?utf-8?B?M2toWjVGd2ljY2FGNUJwdVkwOEhoaDhQWWJLdFVZclF3WTJYWVVCbmhxYWtn?=
 =?utf-8?B?c2Q2UUMyaWRJQVVMZWJ0eWduOTZBb2pOdEtYL3c4a2RJUlBkSUhuWVJyM2lW?=
 =?utf-8?B?WEJNVk1mY0hEcmZpclFxalNTbXh6MjdEZUNZUWFuM0toMDBneGVHNndNRXNx?=
 =?utf-8?B?RTZCcm9YOUFzS3B1WUwyejE4aHE1YnphU3FUUUt5b0tXZzFuRG9JVmlKUFp3?=
 =?utf-8?B?YW84Ty9wMVBlUWhETS90WlhLTE1JRG9HRFFRVWtsZGFBbjd2engxTkowMVVR?=
 =?utf-8?B?dkd2SGo4Z2NBRldjV2hHS09UMVhOeWxZM0Zzc1VZM21jc1UwMElKNzhraFBp?=
 =?utf-8?B?VmVQSjZHaE9qRnpicHVLVERBNzArWmlxQS80eVBvUFgyYmJKL3JLcXBmMEUx?=
 =?utf-8?B?L2pHODdHQ3NCYm5MZzh2S2dNcFRzRmxqeGk0Mm5mdW9ZRXBXSzdsMGQ5ZExt?=
 =?utf-8?B?cHVyOEhYaVZsOTZrQURHZG9oL3VhR3FuZU9XZXVZd1VsSUNFVC9RNFQvRTJV?=
 =?utf-8?B?Nm8yQTNqQkNQS1lzcXp1aWllVWU0amZSMlZJOFFGMUZtL1M0aXBIdHc1QWJK?=
 =?utf-8?B?azgyNm5BL3JSYldia3JpNzd0YXhyaVlOTjY0WGV4Qzdkb1pCV1N0K0s2b0tq?=
 =?utf-8?B?YW91WS9VSHZkS1FwY1E0NmFJSGhQZk5LTHFGUk1TUnhoOGJoclZIUEJXeXp4?=
 =?utf-8?B?aTJ0UTNJeEkvNW8xajNtODhlNnE3NnI4eUtlTW5HZ0FiVE9JNDVDWFljWWh3?=
 =?utf-8?B?M1h3OWF1NUVuWlpuY082eEVGWlBkOG9kbkxNbkZza28vUU5sK25OZURISFRR?=
 =?utf-8?B?VE04bC91dGVSUXM1QU82ckJJR05lMnk2VWp4Uzh0SHR3UFV6RmVSR2xrei94?=
 =?utf-8?B?aWlXdm5nZFdUYkd2MXJlL0VIY256bW8vTmMzSWlsQzNsTjlqYXBZZWtreDhp?=
 =?utf-8?B?M3Era09QZk9VSFBmZ1F2RUppR2NBcmtmb0F6T0xtYU5mblNVSUNvV1JmS2dR?=
 =?utf-8?B?K1p0UXVZcXkvN1gvRHdQaktXeWxsMjhENHh3Y1JnbjVFV0xiemlnTUltMEtN?=
 =?utf-8?B?QUFnRGFWbHlWc2ZjZ3VTOXltdzFHeGlYcFJHeTc2K0d4NmZwdTRjeWhsMWFI?=
 =?utf-8?B?Z1k3azhwa1IxdU5FS2hud2VPQXNEZmhmUnhuWmNBOXRYSXpkQWhEWlkwZjA3?=
 =?utf-8?B?UHkwUXJmZXJIbkdCUlRzbndpR3Qwbyt5cWwwYzg1cTlLVW52KzN0TE5GSmRt?=
 =?utf-8?B?eEMvVGVIYU9ESGRqMHFHK0dyVXg4bVpJZjJkQ3AyeitNTDBwYnVPL1BKb0lz?=
 =?utf-8?Q?nGCU=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(14060799003)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 17:40:41.9550
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5aadd62-8f83-4a2d-80b7-08de3100bfc9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Dec 2025 17:40:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227135

T24gMjEgTm92IDIwMjUsIGF0IDEzOjEzLCBQcmF0aWsgRmFya2FzZSB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyA8cHJhdGlrLmZhcmthc2U9ZXN0LnRlY2hAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zz4gd3JvdGU6DQo+ICsgICAgICAgIGlmIFsgLWYgJHtCfS90ZXN0cy8ubGlicy8ke3Rlc3R9IF07
IHRoZW4NCg0KRG9u4oCZdCBtYWtlIHRoaXMgY29uZGl0aW9uYWwsIGFzIG90aGVyd2lzZSB0aGUg
dGVzdCBsaXN0IHdvbuKAmXQgYmUgdXBkYXRlZC4NCiANCj4gKyAgICAgICAgICAgIGluc3RhbGwg
LW0gMDc1NSAke0J9L3Rlc3RzLy5saWJzLyR7dGVzdH0gJHtEfSR7UFRFU1RfUEFUSH0vdGVzdHMv
DQoNClVzZSAke0J9L2xpYnRvb2wg4oCUbW9kZT1pbnN0YWxsIGluc3RhbGwgJHtCfS90ZXN0cy8k
dGVzdCAke0R9JHtQVEVTVF9QQVRIfS90ZXN0cy8gcGxlYXNlLiAgQXNzdW1pbmcgdGhhdCBsaWJ0
b29sIHdyaXRlcyBpbnRvIC5saWJzLyBpcyBhIGJhZCBhc3N1bXB0aW9uLg0KDQpSb3Nz

