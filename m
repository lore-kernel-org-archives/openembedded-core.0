Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6493C369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 10:50:13 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.89])
 by mx.groups.io with SMTP id smtpd.web10.12140.1745491812247960262
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 03:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dKXEOqVF;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=dKXEOqVF;
 spf=pass (domain: arm.com, ip: 40.107.21.89, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=fsy+3W0EEL9VR3wt+qaxqDPIhLPJHBUOc5wstkFYzC6Tuc4t6pL43HWUYgbHp5nXStzh9JMixaPXwvOxkWwAf7qNeQVuCJcBubE84EtKB47z3AHoYsf0keh3umWGaFzzE/MGx08FV4Ff5tB2nLp5bKyYVc/e1TELC8zPwN/pwhiDVpMUOhO9mnUFf4oBcaxyYKIamQljawy/dF+bMjVw1KJ173i2xSQavgYQuOUMWxLu09Dhvwj0a55jv5GQ85sQA533TuhR3lZoPa+yt2PYv/HG8DIB9mFv64wZ9s5ub7nxr76QVW1xLU6fe2ZG1yxpR5viXmFJYxo3gLGn+FDdAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2V3hh3c1HBOp+OP+LsImmDiHM9b+8slwLPpr3+7FG3g=;
 b=Dck4/dHvhRgoVMPJ/otJpJo/Gc0SUw84DBzJCANIc8R0CA+vE+C2uJvUDd9AyxxhHudvzWlHka/fWh9UxI4k4QRdT+Tz7I2cOQFFpdN9GLK7XYykuhpZ4xqV1XRGtyyYz95Vip7z35ZzFeM9URSIIpomimS2rdSVI1CwL3/yZrwUBUD8s1QFb0sT5mrbxCir57V/k0aWVEVR4Csox2VFx3VVRgELpwuO6+67DnpuxzIbu2U3jF8UknFocBBrlZGdU8Lplptl7JnZn9R6dsRk75u+/11qzz3RNne2PXR08Tx7RFfMYm0uTqFLlki80kqL5FJV1AnxtRmiVl3zU7xyZA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2V3hh3c1HBOp+OP+LsImmDiHM9b+8slwLPpr3+7FG3g=;
 b=dKXEOqVFxOFcwyxfBmYkgGSHl2qQaMgK8iOXTX6inLe6FMSpi9s1Y3jCDdFNm3bRRycvx0pnBoIqw5sRK+h0a5bz8gn9N8FeX+NknUfRFpI1p27ePBFPYTTwd1Nsok0MGNCDQcVRAEhX49Q381sCsMnzFCb46adUZuL/SGAvupo=
Received: from DUZPR01CA0190.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::8) by VI0PR08MB10759.eurprd08.prod.outlook.com
 (2603:10a6:800:20e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Thu, 24 Apr
 2025 10:50:07 +0000
Received: from DB5PEPF00014B9F.eurprd02.prod.outlook.com
 (2603:10a6:10:4b6:cafe::6a) by DUZPR01CA0190.outlook.office365.com
 (2603:10a6:10:4b6::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Thu,
 24 Apr 2025 10:50:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9F.mail.protection.outlook.com (10.167.8.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12
 via Frontend Transport; Thu, 24 Apr 2025 10:50:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f0x1KekgsIkj3oDlT+RocMOb+yw4KZHdWzJy8msfRXFOP/BK9GR+7+n5201A8jIAftIyboEHsmcyJVu48MByxZVvD5zzMuhci3RJPxrfDxDuNY4ZY7KozbSrxBkTjNjh85qkBXs5pLNfzQ6rfKiBr3B8uWgqljIe2UlME1g1T3CAfCfWUA4I99csr4ZYANfdzdLR7r+ZWkTcwptGz+PZ9Dp0cINbdaKmT2Ft+v2WQW0GLgnWGkWfteCbcmHixq0xjMt3GUj5o0Zni56AzvpEiXQnXkZsiqFEnJPN4p3tsSPlEoDHlSdLsf5bPVo92OyWnEFYwKSMDqz3P9FVD9X7Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2V3hh3c1HBOp+OP+LsImmDiHM9b+8slwLPpr3+7FG3g=;
 b=JPQ/Nuk2HLig+wdtg4xmQgDusXzFsBQRG+uV3ZIZOm+5R4XzmaJtxsY5tBD+jsmv/RBshYntDxpjrABy7KYNYJsET7hRbqfi83YGTv6zs4kQiArZVcPyF/sp5OpDy4hUM342SqBOHkSpB5wUTlV9bXR3uLPbSNt+zGtoAxOeO6hBWs9UHsNg8V7dFQXi5wVUyc7Hgg6smkAhlYQ2M0kZYX3XuFXdVUCvF0KFrM7HivZPMD/GIJHITLbLdgHYPalGNYv7HhbrKKhs9Yp2XF92jx9XDKtveBuMMgohrz7eLCF373yqHrWbVMKE9YrIT6Oy+PkNGMdyOrlJ7ZfzRc6QJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2V3hh3c1HBOp+OP+LsImmDiHM9b+8slwLPpr3+7FG3g=;
 b=dKXEOqVFxOFcwyxfBmYkgGSHl2qQaMgK8iOXTX6inLe6FMSpi9s1Y3jCDdFNm3bRRycvx0pnBoIqw5sRK+h0a5bz8gn9N8FeX+NknUfRFpI1p27ePBFPYTTwd1Nsok0MGNCDQcVRAEhX49Q381sCsMnzFCb46adUZuL/SGAvupo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM9PR08MB5988.eurprd08.prod.outlook.com (2603:10a6:20b:283::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 10:49:34 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%3]) with mapi id 15.20.8678.025; Thu, 24 Apr 2025
 10:49:34 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "changqing.li@windriver.com" <changqing.li@windriver.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] texinfo: support multilib installation of
 pod2texi
Thread-Topic: [OE-core] [PATCH] texinfo: support multilib installation of
 pod2texi
Thread-Index: AQHbsDqdFUUqiR5Hu0qe8M/bL/zGRLOyrJ+A
Date: Thu, 24 Apr 2025 10:49:34 +0000
Message-ID: <5E488596-661E-4E2A-A11F-A8EA9765C40A@arm.com>
References: <20250418081910.382530-1-changqing.li@windriver.com>
In-Reply-To: <20250418081910.382530-1-changqing.li@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.500.181.1.5)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AM9PR08MB5988:EE_|DB5PEPF00014B9F:EE_|VI0PR08MB10759:EE_
X-MS-Office365-Filtering-Correlation-Id: 73437e4c-6ec0-4a1b-87da-08dd831dc6a2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?eng4a2x6NDJEb0tCUktDaHpwREVoMSt6RzR0cG9vMmdYb2h3cEpsZ2xpaWVm?=
 =?utf-8?B?c2VmYTVPcVE1MUNmLzZtRmJQb3hEams2bzRQK2xHQnZWTTF5NCt0eXd4N3FC?=
 =?utf-8?B?Q0V2ZXVCenN6VnpzMk9VOENCVkFUYktUdlVjRWowc2tHRDdmYW4rVVBuellO?=
 =?utf-8?B?TkRxME9Bbk5LbUxIM0R1bkU1bk4xQ3NjMnFvck1RbGpiMm1ld1Zjb2JkYTB4?=
 =?utf-8?B?RFV3L2tRTEc4NDdUdExxS1lpSm9SeTBVamRuL0pWUjZDSDAwelpwSDlDR3Jt?=
 =?utf-8?B?MW9CUzIrcFpQL3pFekYyWll2RkhvRDdnalo3ZjRJTWtxUVUrKy9FTkRkZUMx?=
 =?utf-8?B?Z0V2U05sZ0FuUlpDcjVJMndyWHhQWXBlSC9TMkV6SEJQZ054Z1R3SmNzWmNR?=
 =?utf-8?B?clZJQjhyUmJScFNzemxUQWJxcHBJOXovREh1N2RKaEFNd0lxemhUUXBXUm80?=
 =?utf-8?B?REh5MmZoNTVsQkRqM3NQNm1SekVORG5SR0pIWUt4eFRxa0w2VHh3L1hUQ0ho?=
 =?utf-8?B?T3JPTXQvdE1pQnNETTFUaXlHWkhCc0JCYTJHZkxsWUxEWnFXZURRRzBxYUZv?=
 =?utf-8?B?Mkk1RnBCWnRWdUpuZVdHZG5GaThtc2Y2bEZ1WmNyWmgyeDBEWWtNMVNQbmRs?=
 =?utf-8?B?UkU3eEhVUzdEQlVJRnJ1QmlVVDVna2xTb0o4ZklDUjd2MnBoUHgwWDZnQ0Ru?=
 =?utf-8?B?cWcxd0VEK2VZaVBVYnVCamxtSDd5Sk9ZQ1VmR2JFbDg0QmJQandUWUVuYlVw?=
 =?utf-8?B?dFcxR3lXR2JONERlOHNkSWZNeVRiRWJCYkpFQXR5WGltSkJIc0hkOGluckZ2?=
 =?utf-8?B?Yk1zWFhoOHJBZDYyRDJtRHhwZ3VjNHk3Q295OWYvZ0dCRGRiTjhTNUlUS3Vm?=
 =?utf-8?B?UnN5RitGc1dFLzFXKytVa3VybVRxZTRaMXZ4d1dDdVZjaXlORVFoS1FhOEQ4?=
 =?utf-8?B?UXpVd1Z5RmcwMUd5bkhidTRZK3huNXhZNXIwY29oUXk5M21veVVLMkZPelVG?=
 =?utf-8?B?NHdFVU16M1p6UVRncUpQKzExRXJ4ZGVhbmJMQ09vSVNkeFZUNVJSYkRlcEdm?=
 =?utf-8?B?L09IWFZ1QVREUmhPNWtWQWlzckFXQ1Y2cnNra3pXN0JuYUdaM2pWSmd3VTdt?=
 =?utf-8?B?cnJTdS9XVit3MjU5bHUzRGtKQXBjVk9DYnN2SlJYb0VLSDNEdlNhS0ZQWGk0?=
 =?utf-8?B?TGQyK2xLWWxoQjBMYnJlSWFjWktVN2JieVZ6MmJIQ0JNWGJ0cGlCVER2UUhY?=
 =?utf-8?B?YWtxRVpHR1JXZ2hXd0xVY0dITWRyVDNDSk5PQUUvY2hyYk1BaEt3dHFFVUNL?=
 =?utf-8?B?YXRON3cvSVNrZWFsNExUL0Q0ajVuMTYyTk5nSnZ6UHNoNS94UFg0Z2tsNW15?=
 =?utf-8?B?R0NCcGo0cGpaVnlFNi8vUmdzOHArTlU0WlZTQ24yNlpXNDE5Rzg5cTJOK0Vy?=
 =?utf-8?B?TnZuTnBWbzVLKzQ2K2kyMTdHWEtPV1FpbEwyYmxPZ085MVJJRGt0WXZUTFRs?=
 =?utf-8?B?TStuUXZXNHV6Q3N3QXRlYXhmTjlrMG5xMHBqeGtndWE5SzFGeC9SaTZZeCto?=
 =?utf-8?B?UENSaXl6c2tkUmpDbU1mMXNnakEwaS9ScU45dktja05FMXBEcWdGMWhGVmgy?=
 =?utf-8?B?b1dNWWlxcGY0LzRVMVUrWjRDWU9KZlErUGpzVGtMc0daRXkxM0JDZ0lHeUJY?=
 =?utf-8?B?dUtIdHhsaXBZWTQ1UW45OENoMG9HdG5iQ2kyMXVsMXZPMGpTc0ROZTFFR0w3?=
 =?utf-8?B?WHdsRVlqUFZtTk5hSHQ1MlNIaFJZVGhIQVVsc2NsdjR4ZFlIVWszL0VMbEtt?=
 =?utf-8?B?aFhLeGVYQzVlQVExcFJrOVErTGVqTVIvZEtIemNGNk8yN1ZvNkhHQlpXZUtw?=
 =?utf-8?B?bzFQTzRpNi9Jb1Q2OUp4SkFXeVA3ZUhLT1lJRXorOUxpYndVUnRlMjh6b0RI?=
 =?utf-8?B?VVNrNFhpNkNMZmpzOEZmbzdCc0ZudmVlcDRtMHRSZlp1QmhQWlN5QjZ4K2Zt?=
 =?utf-8?B?a2FFcDF1UnR3PT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <10EC10EC3E4E3B49A3EF74E6A748DBF4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5988
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	03dd03bf-1217-430d-8e82-08dd831db349
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|35042699022|14060799003|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?U0ZJWHBGMDFPSFZCT3dTRmhvUzdOcVgxTVRVdStmNG5STkhqMnNMY1hPeStP?=
 =?utf-8?B?Yy92SEQyYW9GZG5DR1hnaFZBa1dkampUdjVsWDMvb1AyQ2ZtdnhyZmxsVzA2?=
 =?utf-8?B?QnltSkRGOW1NZi92YktjK2VUZno5UVVLbUlCakdvQnQvbUcyN3VZSUNoa1Nw?=
 =?utf-8?B?WGZHL3k2SUxHa3JMQ3B1Wkc1MlRDYVpVOUNnMnhqeTlCQnEyK21WZEZyMHBL?=
 =?utf-8?B?bnMrVFlrK0FUTDE3MEl1cEVEcjVPbG9pMzZ1T0VsUDdPKzVtWFhPcjBvaFdo?=
 =?utf-8?B?S0Y3YnNTaGFSVnI4UXB4emNBcVNKTW0yMkJNZmF6ZGRLY25tOFNPU0JmajIz?=
 =?utf-8?B?a0dJRG1RR0VRTHNQT0JYNEtrRXJwZ3A4QWRhUzlGdkVPUlBSamh0Tkk3TlB3?=
 =?utf-8?B?RU44Y2tHc0x0WTEvZVlDM0RSTzhoRDRQbWZGSktkc1R1U1QyTVBDVER4Vkdh?=
 =?utf-8?B?aUJnci9ZdTBIeFBMcFVHRUlKcU1ScUgxcS84VXR6TlBrTUxzblFVUE53NU1K?=
 =?utf-8?B?R1JFRXRTMXhzZ1VjdmlFOVJzQThSdjRVWWcyMFRrcHY0bkJKczY4dXBGbFRa?=
 =?utf-8?B?Yy9wVE00Q2pnVmVWaUJBd1RnMEFMQ2NkWXBWbEV0K3g4WXJGZXdoVmxUQmpF?=
 =?utf-8?B?MU1ldDcyazVYNTNpM3BSTnpGeSswcTJDeUpGd0ZpdTBpVnQxcWJtTGJxaVRE?=
 =?utf-8?B?ZGUwVkR3NllrQXE1eGhxbkxLdmJZSXk0Vy9QTmJaUnRXR2w5WHYzU3BtSEEr?=
 =?utf-8?B?dU9zSG1USWtDdVJyUjVWMVVyUC9UL254RG5Za3NnNStrMy9ZSzhFMXNpQnM3?=
 =?utf-8?B?TjBhWnVjaTBEZllYMERUTTg2ZWMwMXJ2R09yUXFvYmZlYUZUV2kyenhvMDR0?=
 =?utf-8?B?ZjVyUHlNYmw5UGZZMG9SbWtVOUpMYTRBVUhQY0tKNmNpSTBnOUhCWnlpL05B?=
 =?utf-8?B?VU5jVGU4bHlmVEl0TnBVUlVPNXZwVE5KbTlNTis2cGNrRU1ieitlYXZYVlpv?=
 =?utf-8?B?NlhOcFJrNXdLNUczaHBpZWNWTS9NR1ZkY3NUVm94U0E2WWF6VW5aZFpsZHRh?=
 =?utf-8?B?bUVpYXAzak1Ga0RXS2MzdkRicGF5ZGVRZUVTK0RuM2Q3Szh2NHMxMTcwZ1pv?=
 =?utf-8?B?MkpMVm9EekRhbUxma0V1Vit6N1hEZDd0Y0YyVnNnZmdGa1RKM3BPazFFdkFr?=
 =?utf-8?B?bG5odlczMGRBMEVFekF2cHRibFZRWHRvMU1reG9QMEtTUWpSa0FXL25CK3g5?=
 =?utf-8?B?aFlPUEV1RHcvREtIRm5zWm91U0RwazZnbFEvb0lQRFRqQWlnVmdlRUJyWG9R?=
 =?utf-8?B?UTVrN3ZLNndSdVZiaVJYWlhHRFYzc0xOc0VoVENhVjJRRWpYQ0kvczRPeTF5?=
 =?utf-8?B?Z0FucDVHWEhkeUdlaWVNZUw1YzFETFZIRllEWlJSeGdTczlJSnZSRGoyUkpj?=
 =?utf-8?B?eDRRNHlRbkRlOTVWa1VZM1diZ0ZodFB3WE9ETzZSN1R6SStNTy9NZmRGWmEv?=
 =?utf-8?B?NVQwZ3Zvb20wbll5bkFKY1E0eGpldXh4TkZFcUpnVUZqbng5dlJyd0J6Y1Zs?=
 =?utf-8?B?REpnbjBEd1cvSUtQamFSN0x4aGl1K0R4Si9OeHhTRkFHeFFpU0pLYTN6dHVD?=
 =?utf-8?B?M1preUtFbmg1YkxsWnBYQUlzT1RjaFVWUjJDVXdoUS9KM080MitsNTlxN2Ez?=
 =?utf-8?B?UkNveHhvYmoxMHc2Qm1uOTNXakJ0Z2hxdHhVS2FQOExaUUZvNzRrY1FQVFNP?=
 =?utf-8?B?Mk5NdjltVEp4a3I4MHgrR1dzMVdjT3RDQTAvRnRIWThxTDFWK25mOTk4UFBy?=
 =?utf-8?B?alV4ait2ZVQzdk9QT2NITG93V0JFZ1lYRzY0Z1V0bHVGQ0pWelQ5ZVFvTGFM?=
 =?utf-8?B?SDVMa3lkVi9zMUVuTUlHZzVickpFV1owWjRGUGpmSmFrdkhMVmI1anNpNDJp?=
 =?utf-8?B?UTlkRlJhaDlNOEtNTHQ2MGhRdTdZZmxHZzM4Zkl6V3htd3RQY1FkdkJPbnZS?=
 =?utf-8?B?ZFdRYkVkbGp2cGFlRVBzZk9DVG5xZlJPS2cwaGJrTXdia0NSWUowT0c4dnlR?=
 =?utf-8?Q?V5QkOC?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(35042699022)(14060799003)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 10:50:06.5857
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73437e4c-6ec0-4a1b-87da-08dd831dc6a2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10759
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 10:50:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215359

T24gMTggQXByIDIwMjUsIGF0IDA5OjE5LCBDaGFuZ3FpbmcgTGkgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPGNoYW5ncWluZy5saT13aW5kcml2ZXIuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiAtLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvdGV4aW5mby90ZXhpbmZv
XzcuMi5iYg0KPiArKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvdGV4aW5mby90ZXhpbmZvXzcu
Mi5iYg0KPiBAQCAtNDAsNyArNDAsNyBAQCB0ZXhfdGV4aW5mbyA9ICJ0ZXhtZi90ZXgvdGV4aW5m
byINCj4gDQo+IGluaGVyaXQgZ2V0dGV4dCBhdXRvdG9vbHMgbXVsdGlsaWJfc2NyaXB0DQo+IA0K
PiAtTVVMVElMSUJfU0NSSVBUUyA9ICIke1BOfToke2JpbmRpcn0vdGV4aTJhbnkiDQo+ICtNVUxU
SUxJQl9TQ1JJUFRTID0gIiR7UE59OiR7YmluZGlyfS90ZXhpMmFueSAke1BOfToke2JpbmRpcn0v
cG9kMnRleGnigJ0NCg0KV2h5IHdvdWxkIHRleGluZm8gbmVlZCB0byBiZSBtdWx0aWxpYiBhdCBh
bGw/ICBJc27igJl0IHRoaXMgbGlrZSBtdWx0aWxpYmluZyBjb3JldXRpbHM/DQoNClJvc3M=

