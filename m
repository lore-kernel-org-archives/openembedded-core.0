Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AE48CA1005
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 11:34:28 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.61])
 by mx.groups.io with SMTP id smtpd.web11.75145.1756812857693728340
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 04:34:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=N3lqcxQq;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=N3lqcxQq;
 spf=pass (domain: arm.com, ip: 52.101.65.61, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TfVLENHgY04uyYOoFbVwNlkK3mkzpCKTgxkn8sOW8LjT9ie3l682/hMTef/T7gFFFS3BOhXm3wKIfvCDYebAOR1d27AAaAwpNYIN/qzDFk/zxl7rYXxg28Y5Hg7VRFOwCtmFG3Qek3dCXtFjsnQpfTJq7RmZn1xsOa6K0KSZ6iuKwcCTRN0oNpVrdMJX+cWTR64Ec/LbIukR0BMzNb1uRZQ0Qfhxb+FXp4Jrngg6DX3dWZZYRBkAUagz2cuOiA7+/aiss8u5GoKWuZo38I5OsetdJVg0n+6JPLcnk9K8gqwoY7qFMkf4UlQf/RMQIeziS99buKSNz5lhcQVhmj59zQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ALDpgVV2/ZABZ8eyWGZz60wP2eM6D9GdR3ubNRl3Sao=;
 b=k+926fuU2X6cXNOFT/xaPKfeSsFZnzxqam8Qakw3ASyPFBzMyMYy5msb0oWScuupN5clSZrAV0IqER+3hhVqZgzcXIvFVU/0kX1fCgX+OQabBRDRyunuvQ8qERKli94dUJiA6//CUCGQSxZmgqvzBkvRdiiVzpVhLOL3o7pdAioDHKLw4Q3O0CoGQdi5xZrfXjiYhnUJi0bvi0lUAaTikVLrpCAvIKrNhFPhQoEUGz+iAgmf+kumUOdGyNjWo0K80MOWk4VCBkbNLXXeduogk4RM+MQkfwt4dFh3k5iRGXxm9FbtbJH94hmxuIrXNdXlTkROxkcF4RF7ZuHxpzUA4A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=cherry.de smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ALDpgVV2/ZABZ8eyWGZz60wP2eM6D9GdR3ubNRl3Sao=;
 b=N3lqcxQq6FS9I5zYqroIoLIA9H/wc2oFBMpw2dBGNWeOZokFKiC00CSQL2Zug3VIhZgpNY9+NVdWT7vlmS3i2DLpo2BNiRmZajdh493KUzAUixU76WYTeJXIgAGWXMDofy6xYxiQJJK+6xsRDEBy6EOm2mGu6sRDFvytdNGLT44=
Received: from DU2PR04CA0015.eurprd04.prod.outlook.com (2603:10a6:10:3b::20)
 by DB9PR08MB6329.eurprd08.prod.outlook.com (2603:10a6:10:25a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 11:34:10 +0000
Received: from DB1PEPF0003922D.eurprd03.prod.outlook.com
 (2603:10a6:10:3b:cafe::1b) by DU2PR04CA0015.outlook.office365.com
 (2603:10a6:10:3b::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.27 via Frontend Transport; Tue,
 2 Sep 2025 11:34:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF0003922D.mail.protection.outlook.com (10.167.8.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.14
 via Frontend Transport; Tue, 2 Sep 2025 11:34:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sX5l1WF8Fw4Gwobflg3BA6ckjg0Y3Busm+u/4qWZj75ozndGd9jzorbN2szRY6AMr8U+4Ur10+s8B4aFhf2gc4BDL5SuajodFFwWjGGUMU3J8BoWhD4xXUFZ7s4g7yN1g82lHZ7SWNubaqx2EHuHiNT2+q2prT7Axhu8Q6dBhKBHXSz5nj7yhwyuG790Di94yaGpR5dRqYUQb8kP+jWSpyAJYUYHYG/f3oLw+eG/NyaMd6+RjqDP/qGGT8+z+QHnE+o0tbHEZ1Ry68iVtabvaob3qmwrpIADw42Nz1zoTcXZQTBuaa/eLsG0dRFOlT1UrBKVtz592XpPPz4yW+/iQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ALDpgVV2/ZABZ8eyWGZz60wP2eM6D9GdR3ubNRl3Sao=;
 b=L2sYm3BxSUVSKYhcnCn7dXp9gFmIAWUu/7zVBMq3/3W8naJh8f4IBvLarblNQrqoVXnv+sVpBtRJfhR5Mlhj9tsIMLOBwGw7JAC2RB+Lj7Y3sTzaCgoNwMujX2rDGaXODz1nxW1bSN7DzUpUpVlIZ1+bu8RDSJPCnGPgE+fDl0Iu90w0NAZjyNdaDBNOTEEnlgRMn6ZXJpxo+W3O0d3bAk6Z4uSmHZvSUcAMqNAVJKHV7JsXhNK5ZZgFhVpTtWXOkANCrsT3n5WJHYNgwL8mtL9dSlLXpJDIj0W4glo8VnDtWYooqHTSHx+sEQK2Q2vrJ8E/t3k4jIkbkNgiE+zarg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ALDpgVV2/ZABZ8eyWGZz60wP2eM6D9GdR3ubNRl3Sao=;
 b=N3lqcxQq6FS9I5zYqroIoLIA9H/wc2oFBMpw2dBGNWeOZokFKiC00CSQL2Zug3VIhZgpNY9+NVdWT7vlmS3i2DLpo2BNiRmZajdh493KUzAUixU76WYTeJXIgAGWXMDofy6xYxiQJJK+6xsRDEBy6EOm2mGu6sRDFvytdNGLT44=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DBBPR08MB6217.eurprd08.prod.outlook.com (2603:10a6:10:201::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Tue, 2 Sep
 2025 11:33:38 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 11:33:38 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Quentin Schulz <quentin.schulz@cherry.de>, "peter.tatrai.ext@siemens.com"
	<peter.tatrai.ext@siemens.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] connman: Revert removal of no-version-scripts
 patch
Thread-Topic: [OE-core] [PATCH] connman: Revert removal of no-version-scripts
 patch
Thread-Index: AQHcGAj22Pp1/vScJUOnpwpU6SyCJLR+MmAAgAGYWoA=
Date: Tue, 2 Sep 2025 11:33:38 +0000
Message-ID: <51E18A1E-59EC-4669-8C8C-EF95182D959D@arm.com>
References: <20250828104401.3627-1-peter.tatrai.ext@siemens.com>
 <65f861a0-e097-4a61-bf75-091a2a6a691d@cherry.de>
In-Reply-To: <65f861a0-e097-4a61-bf75-091a2a6a691d@cherry.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DBBPR08MB6217:EE_|DB1PEPF0003922D:EE_|DB9PR08MB6329:EE_
X-MS-Office365-Filtering-Correlation-Id: 0841b7c1-b97c-4ee1-1b3a-08ddea14a2c2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?NHgrZE9EYW9vci9LUGJGYkc0eHlXVWEyWnBMVnVvVXVkYUFTanVJaS9GVnl5?=
 =?utf-8?B?dmlZSmE5Y1ZSQU93RU1OSEgwWXJoUXhBcU02QnBpb3BvdEhTQ29EaDBrT0xp?=
 =?utf-8?B?eGp0VUM4Y294bGM3Zk9Eamo4VmpxZnFGL0lURzV5dXRBWEcxMG15Tmoycisy?=
 =?utf-8?B?R0lTdUdLRklzTHBrRXFQRGgvYUhlTW04bm10RTlFRjR5ZHFyNzB6WTA5Y0tt?=
 =?utf-8?B?eXRpWFJUcGg4VEpkVzZDcWVOZGY2TjEwalhMNzVrNkVXNjBWdXNxWHEyd1pF?=
 =?utf-8?B?U3hiZFJTU3pVK2xIcHhtTklqakNWYkFnRGJMK3JDU2oyZkhuQXoxZzlOTEZw?=
 =?utf-8?B?bCtZbEo4UzV1UWc1MjNTK0xZWldkUHI5WGlMK1BLeGhVR3Z6cXlMYkI3N2dU?=
 =?utf-8?B?dzlRN21QYzNTV28vYnJwYUdYZzQxOWNERWdLeW53cHNFQVhLRUxJV0NXSnI0?=
 =?utf-8?B?OFNtWnlOQnZjOE96d1R2b2ZaU2ErUkhMejYrb2t6MGNVOVBocmFPdlBwVEtJ?=
 =?utf-8?B?WnozMlY1VkxkNVR2dWtTSTJXMzUrUlNrbmhnVGszZG8rY3ExajEvbEZ0VHU4?=
 =?utf-8?B?NisxUWdPcHY2aWZ3bVVqSFoxdktzSUg1Rnp1NXpWVEZEUjdXVHArclNLUTdr?=
 =?utf-8?B?S2VBNmFKOFN2T3ZaWll6NFNBR2tYajVSSFhxT2ZrUW1QNlYvREdRa0FuV2tM?=
 =?utf-8?B?NFZ2NDNudmFPRURLcmg2MmN6OG5YbzJxaUYxOWxhMjR0MFhzaVJrdXpUdHQ5?=
 =?utf-8?B?eTYrcXczNytqS0hmSHlIQ1FyWDhRcFEvd3RZVXoyTXlDaW1MeTZPYVBzbmhN?=
 =?utf-8?B?enhSMlVwcmZVaU8rQ3hEOTVXK2pWaWhSQjFkUnoyL0NZWlVERkYyRW9HdllC?=
 =?utf-8?B?Qzc1NEhrTHkvbEdSWnprWTg0dTRQMUQ3SW41MEJnaXowZVhIS0oxYStHRW9o?=
 =?utf-8?B?UXRyVXY4VkVhelJxMlI2R25PNXl3Tnd5d0gxOS9BV3hONE14bjY1ZTlBdXha?=
 =?utf-8?B?aWRhdjQwckJ3bzdUd0ZSMTVORW5yVWo0aEwyc0IzSTJJTTRxQURud1VjSnlI?=
 =?utf-8?B?T3lHQmxlQzBLNE5IU09HeUdyTWUzZURzcUpMOTlxU3RIby9iVUZJKy83Wm92?=
 =?utf-8?B?RUhzcW9TQkk0OWlwWEN0MEk4blUxR0l3Vk0vSkpkYW82bHpDcWhpVjExZmFt?=
 =?utf-8?B?MExQYTRuS0tsYnYxRCttUUcxUWc1aS95c2lwdWt1bzRYNXBJZ3p5RENWNC9H?=
 =?utf-8?B?T0RlUThxdjVtV0VsY0pJOXFxM1YwU3JqYjMyOHljTm1ieXVvdzE0QktRNERo?=
 =?utf-8?B?T1VHQWUzRTlidjl2ZmMrZXFDeXVKbG5lYno0OWF1WHEyU243blFsQkpPU0tF?=
 =?utf-8?B?U2lIemxQOFhrd0NqdW9Ca3NLWVhFODR3bWh1a0JvZ0hPSjdpOHNINVp2L1RB?=
 =?utf-8?B?OTAzTHhsUHEyQVp6Tzg2SWc2bFVvMHpBTkdMU1pkNzJURlhocGJiM3lTRXZS?=
 =?utf-8?B?WE4ra2pJRGI4dzhpZVBXUFo1MEtrSTdBN2JOQTkyeUc4QUMrc1prVDV0NWRK?=
 =?utf-8?B?WngxNGJHTW9JQW5wck9ySHh2T3Npdm9IYXppMmpWK2xNRjNjL21iM0gvdEJK?=
 =?utf-8?B?V3QrUlpzOXF1S05lb3RWcG1xeGgzU3hlOWVzUTlCdGlqREZhK1l0bnZaK2xT?=
 =?utf-8?B?UytHbU9oeE1xNDhvdWZqQ0JvSmp1M0dOVjJNRVRMenNvOFhsbVFzbHlpU3Q1?=
 =?utf-8?B?UCtHZmRMTkQvTjRxS2RoenFseFpOQnhjS0RFdmtvUXR2YzQrVWcrNXFOU0Ns?=
 =?utf-8?B?bVc4QzRESzMzRGpwR1d4WHZBMnY3eVB1NWVURWxDU2lGcm9nd3ZoMGE0SXR6?=
 =?utf-8?B?TWpkTUFSWk1mRjk4WXpkMVVmRFUwa01zVDBac3MxK1E0dFNvc0VCRERSUXgx?=
 =?utf-8?B?dzF0bUw2YnQxbXdBZjhEbTA3VEJKZ3FqdGlsVkkrZTZzYlMyd3BzWmtrL3cx?=
 =?utf-8?B?b3BGeTRLRzdBPT0=?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B30A2AC63290334AAB251165184EAA11@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6217
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF0003922D.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	56d59364-7c80-4163-4a44-08ddea148fa0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|14060799003|36860700013|82310400026|35042699022|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Nm5RTDRKMlFiVEgvTkdDcTE2SnVmbXRlUmxISU1hMHBZN092bVgxN0ozMG8y?=
 =?utf-8?B?aHdFWUU3TVZCY2k1b2hEd0RHR2xKdG9MWmp2SXpNOU9ScVZHSHNHQmdVNnU1?=
 =?utf-8?B?TW1odVNwcW9ZSXJJSHlRTi9RVFVaUEUvaGwrVHhCa1lGc2Mrc3pvNVEvcWFi?=
 =?utf-8?B?WnRsWkxjZkZjcHM3cEhMNzV2VFdVTHB5a0I3TjkyclZ1UUhWQXVwRzhFcmQ1?=
 =?utf-8?B?aDRFNVFIRUhmQlJ2Y1I0UzVzL284MDZ5Yzl4OUlBRTY3SnlBa0F4aGVUSXdu?=
 =?utf-8?B?WEUzWmpMUG9tcW9aQzRPeDJURTF6dkRxVGZ1YXR1eklTaG01bzhiR0Zsbzhh?=
 =?utf-8?B?WjFzK0RsZW5nYzFzNlJVeGRsRis0ZVpaT2NXTXFrRWdtSkVBT1JId0d1U1ZE?=
 =?utf-8?B?S1lZTllRQjhBaUZYa3MxVEFhdzJjVXY5dFdSYUJlK1lVaG9UWFZ4Qm1jekI3?=
 =?utf-8?B?R29yMzN6SUYvVnpwUUR6NTJHTjFLNEVsNWNhZGpNaWx6YVNiN0pMM2F0VHIx?=
 =?utf-8?B?VytZdkh3MkRsQUJLSUhpMDdTVlN4d0JjUjYyMVE2OGx0N3A5cDAvVi9BbEg0?=
 =?utf-8?B?TkJkdVZnQU5Db2YxZ01uYUtHMS8yNEE0RlNzbmYvdGdMdGVSOFBmdDcyVU1t?=
 =?utf-8?B?Si9uSCtQZFRjVWNvYkwvMFMvZFJGNnIxRy94N0hCbmo3N1psL2tWdjdLK0RC?=
 =?utf-8?B?S2ZFU2t3L29oZ3lqUloweHM1cVo2MUFPT2RYNE5ucW9zZG82Uk1IN2lDQTQv?=
 =?utf-8?B?T0hvREk4YThEcHF0TEFBeFVaOU9nU0dUWEM5UzdwRUJqMHhqTSs0bkJaaUtH?=
 =?utf-8?B?TWtIenQ1OTh6RVAzOGJwcndrWHBqRVpURlBhSU9qMENGcjNPcXFrQ29reitO?=
 =?utf-8?B?c1Nvd2VBYXVFcVFjTEJ3WXE1c1hPanl5WUJtUFhKakFqc2h5QWZVc1NKay81?=
 =?utf-8?B?b1JaVkg3V2VLeUIrY3dIRm1iM2FodkxxK3hpSEJCY0RmVVZWNG1ld2JreDJE?=
 =?utf-8?B?aDZZOHJ1U0c3MmJLbnZFMlAyRTFCSS93MHZNNGN4aGI1MjhEMzh5dG9DNkxo?=
 =?utf-8?B?cTcrNFFCcWh0MGFVZGt5UWNXVnc1ZWxCcmc0TDJGbnQ0WHlGSUdaQmNkdE8w?=
 =?utf-8?B?dTJIL2FGVXE1NDlXRjBqTGFhK3RUUjFKcFpZKzBzNEJ0bEF6cGNvbVVqM29S?=
 =?utf-8?B?MWZNRGxkUnFNckNwblY5NUdNajNwbXp1L0Q4RXB5UCtoMTRTZmNCNDlXNzd4?=
 =?utf-8?B?YXY3STk5SzFMUU9lajY4QTVYMzIvcEgrVTUxdW8rN3dXcVJHZjVoN1h5amtQ?=
 =?utf-8?B?RHp5Kzd3RzlZOUhFczNYMjRvblo5M1g3ZUppTkN4Q1Rqa3hObFNjUmsxRFc1?=
 =?utf-8?B?dG5FbU5mSDEyMUV6a25Zb3Z2eldYS3dwTk9zUkxDMk5oamk4QitkdUY4QTZP?=
 =?utf-8?B?NUtTYzcyRlhJa0tXc3pEM1RTUkJ0cG8vcjN4UjdqU01oQkZOdUptMzlEM2ly?=
 =?utf-8?B?K3dhdzYvVXE3eU1qTFE5OVdCQWo5YmZXNzVIeGo5Y1pNbDJZMDg0UUNvZDNq?=
 =?utf-8?B?RjZWVGdqTjRWL2FiaDhFaGJyOURNWkhSRXQxVTc0ZTB3TnIwb0lYdGpRcTRR?=
 =?utf-8?B?TjZUZmdJY05wM3hqV0V3ckp1bDhlVjljallzTUZSNmUrMVYyYU5kMGxJZEJL?=
 =?utf-8?B?TllrT3R6bFBBT1dGanFvcFpnRGROcXpHbWdscitCS1NQcy9NRWQ2cGZIdnVZ?=
 =?utf-8?B?S3NaNnlaVkpiWGRwY1hIeGlwamsrTmIyZ3BuMDhzbmpXbDBNQ0VWV2taNnFB?=
 =?utf-8?B?THdjODJ6Z09kd0o2UUd5cUZXSW9PMkNFMzBmRUZGSTN5akJnQlh4MFhRMDUv?=
 =?utf-8?B?dUQ4Q2xBSHhnNm5ZMWp6anZXbENac1lyYUxUOTFMWFREdnoyRmhqcjdmTHZa?=
 =?utf-8?B?R0l5Z0FNdGRyeFVmZ0I1MjZ1MmpuUEN1cnBCR25waE9pVTlEeWoyaWYydksv?=
 =?utf-8?B?Qm1MNVJsaFlaM3FiMEpJa3A1ZUoxSUdqY1J0bEZtTVVvelR2ZjhHZjUxQ0x3?=
 =?utf-8?Q?E/osbD?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(14060799003)(36860700013)(82310400026)(35042699022)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 11:34:10.5986
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0841b7c1-b97c-4ee1-1b3a-08ddea14a2c2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF0003922D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6329
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 11:34:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222724

T24gMSBTZXAgMjAyNSwgYXQgMTI6MTEsIFF1ZW50aW4gU2NodWx6IDxxdWVudGluLnNjaHVsekBj
aGVycnkuZGU+IHdyb3RlOg0KPiANCj4gK0NjIFJvc3MNCj4gDQo+IEBSb3NzLCBjb25zaWRlcmlu
ZyB0aGlzIGhhcyBiZWVuIGNvbnRyaWJ1dGVkIHdpdGggeW91ciBpbnRlbCBhZGRyZXNzIGFuZCA5
IHllYXJzIGFnbyBpdCBtYXkgYmUgYSBiaXQgb2YgYSBzdHJldGNoIHRvIGFzayB0aGlzOiBkbyB5
b3UgcmVtZW1iZXIgd2h5IHRoaXMgd2FzIG1hcmtlZCBJbmFwcHJvcHJpYXRlIHNvIHdlIGNhbiBt
YWtlIHBhdGNodGVzdCBoYXBweSB3aXRoIFBldGVyJ3MgcmV2ZXJ0Pw0KDQpVcmdoLiAgSeKAmW0g
Z3Vlc3NpbmcgdGhpcyBpcyBqdXN0IGEgYnVnIGluIHBvd2VycHBjIGJpbnV0aWxzIGNvbnNpZGVy
aW5nIG5vYm9keSBlbHNlIG5vdGljZWQgdGhhdCByZW1vdmluZyB0aGUgcGF0Y2hlcyBicmVha3Mg
aXQuIFRoZSBidWcgcmVmZXJlbmNlZCBtYWtlcyBzb21lIGNhdmVhdHMgYWJvdXQgaG93IGl04oCZ
cyBvbmx5IHZpc2libGUgaW4gc29tZSBzaXR1YXRpb25zLiAgSXQgd2FzIG1hcmtlZCBpbmFwcHJv
cHJpYXRlIGJlY2F1c2UgdGhlIGV4cGVjdGF0aW9uIHdhcyB0aGF0IGJpbnV0aWxzIGFuZC9vciBj
b25ubWFuIHdvdWxkIGZpeCB0aGUgcHJvYmxlbSB0aGVtc2VsdmVzLg0KDQpBIGJldHRlciBmaXgg
bWlnaHQgYmUgdG8gZm9sbG93IHRoZSBpZGVhcyBpbiB0aGUgcmVmZXJlbmNlZCBidWcgYW5kIGlu
c3RlYWQgY2hhbmdlIHRoZSBsaW5rZXIgc2NyaXB0IHRvIGp1c3QgbG9jYWw6IFshX10qLiAgSWRl
YWxseSwgc29tZW9uZSB3aG8gaXMgaW1wYWN0ZWQgYnkgdGhpcyBwcm9ibGVtIOKAlCBJ4oCZbSBs
b29raW5nIGF0IFNpZW1lbnMgaGVyZSA7KSDigJQgd291bGQgd29yayBvdXQgYSBmaXggdGhhdCBp
cyBhY2NlcHRhYmxlIHRvIHVwc3RyZWFtIGNvbm5tYW4sIGFzIHdlIGRvbuKAmXQgd2FudCB0byBj
YXJyeSBwYXRjaGVzIGZvcmV2ZXIuDQoNClJvc3M=

