Return-Path: <mike.looijmans@topic.nl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 668E7C36010
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 11:08:50 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.123])
 by mx.groups.io with SMTP id smtpd.web11.23257.1744369726474173920
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 04:08:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@topic.nl header.s=selector2 header.b=OUpLZcVu;
 spf=pass (domain: topic.nl, ip: 52.101.69.123, mailfrom: mike.looijmans@topic.nl)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dtWY9fS05TIz2OMRb/Ey+90Ab+TVlVLwBEga7RXxdrI4ByZD4xz2JgWtEqYc4eue0oKGVk/5Bx49aE9zgFSD+yaV4y7InaFNTPnPzKN9LQTukvEKYw1bW6JBqI86JAPO6kBRkNy9TMptQ9aUTJ2Rg+jEZ1RXc/U67jyvwZucH/d6kX/OZXmLsNeSPyFCMDAt2hxdKEus+N5f8ClyNTQoP3VDoe0tNU5NlCB3W8q2Gdp+JS9CxwLVcW0OM/5lM7wRaBQOjnDy9Gwe6U32nAoTJbgIU0W9itSX9f/yl6yNHLp3dDV5lr3SRqoTWD0B13kUSiu/xq8M3HMWrDWTNhRb7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E2i1lkPuoU8g9xKEmNnKahePP9NNeXPFoJUiQXv6Lr0=;
 b=V3GrsSzO77BHKB0UIHaH3eaeKBOGrnDNJ9B+89pdWaW5Ukw6qwt0x+EwbWvl3KtxqvZCHARtyJ/eeG5i2d8Pzx6sMgGQSKNCtNTkesdzF1L5BnuDCCHUDyei4ZypXJ8H5wpcjAznbPrgaT6vAC/Dk1gZ4YUYZY990I6Zyk2J34z3rdC7xo62KwpCegCde1oHRuJZg4MfowMHa/TGY8knuvzc5D3DOdnIneKKchx2snYI8XQN/oErWQXjT9rMp0MCFaRo+yLshXfLUIyHcMrw6T80Rbu8y9AdZ22Tvl1rgGyqn1kAJY6HyLncX9E5CF5T2x4SJ5g5F/J91gGEZDWGng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.93.42.39) smtp.rcpttodomain=linaro.org smtp.mailfrom=topic.nl; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=topic.nl; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=topic.nl; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E2i1lkPuoU8g9xKEmNnKahePP9NNeXPFoJUiQXv6Lr0=;
 b=OUpLZcVu2FG6ek7h6KCvqaABDG/Vnbge+vef0KIEVi+0+qPvoD8+NktCpPcr1rx3IKEJ5mQDRoxfE2FIO1n/JEYIeiyYuWsIIqrXo9stcn0WO7wBXZyG7NIg9ctgah5jgMugysXsO+etYufexSrC1pOyLI16BaIEXm8g4WsLJIiFv831HkUCuJkEQeq4S66NUC9EDj3aX7eZIwcMIXDzYh3GABmwLxIcbYyXmwab9Rkh4OkMo7ewTKoNJQxg2VF8AYjH0MF8eF1gK2Iy6DeQoBbnGRQIoz+ypq3XyVFUNEUa3jKAdddYy4MyZpVLoL7OhiqwUpkS/hp3wzhb5a3/NA==
Received: from DB7PR02CA0019.eurprd02.prod.outlook.com (2603:10a6:10:52::32)
 by DBBPR04MB8041.eurprd04.prod.outlook.com (2603:10a6:10:1e2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 11:08:42 +0000
Received: from DU6PEPF00009523.eurprd02.prod.outlook.com
 (2603:10a6:10:52:cafe::e4) by DB7PR02CA0019.outlook.office365.com
 (2603:10a6:10:52::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Fri,
 11 Apr 2025 11:08:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.93.42.39)
 smtp.mailfrom=topic.nl; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.93.42.39 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.93.42.39; helo=westeu12-emailsignatures-cloud.codetwo.com; pr=C
Received: from westeu12-emailsignatures-cloud.codetwo.com (13.93.42.39) by
 DU6PEPF00009523.mail.protection.outlook.com (10.167.8.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Fri, 11 Apr 2025 11:08:42 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (104.47.11.42) by westeu12-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Fri, 11 Apr 2025 11:08:41 +0000
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=topic.nl;
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com (2603:10a6:20b:42b::12)
 by AM9PR04MB8602.eurprd04.prod.outlook.com (2603:10a6:20b:439::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 11:08:39 +0000
Received: from AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a]) by AS8PR04MB8644.eurprd04.prod.outlook.com
 ([fe80::e86d:f110:534e:480a%5]) with mapi id 15.20.8632.024; Fri, 11 Apr 2025
 11:08:39 +0000
Message-ID: <960572ae-f816-4d55-b935-8e11e2dad89f@topic.nl>
Date: Fri, 11 Apr 2025 13:08:38 +0200
User-Agent: Mozilla Thunderbird
From: <mike.looijmans@topic.nl>
Subject: Re: [OE-core] [PATCH v3 01/11] systemd: enable efi support by default
To: Mikko Rapeli <mikko.rapeli@linaro.org>
CC: openembedded-core@lists.openembedded.org
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-2-mikko.rapeli@linaro.org>
 <8ae24df9-f1ae-44a9-a4f3-7d8aa273a335@topic.nl> <Z_jy0-3v8qVSyll8@nuoska>
Content-Language: nl, en-US
Organization: TOPIC
In-Reply-To: <Z_jy0-3v8qVSyll8@nuoska>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS4P190CA0028.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::17) To AS8PR04MB8644.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::12)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 
	AS8PR04MB8644:EE_|AM9PR04MB8602:EE_|DU6PEPF00009523:EE_|DBBPR04MB8041:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dd0d10c-f333-4e70-6619-08dd78e93855
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?V1pTR3RncEwzVXBrejJkUTFkSW1VQzRVcHc1RExidzFqWnRkMzM0SHdDL0l3?=
 =?utf-8?B?YlNMRVVOYnRzU242cW9TMi9qMkg2ODY0all5bjdvNzdJRitMSmtibDdiK0dq?=
 =?utf-8?B?bnhvaXJQYVh2NFduU2d0S0FjMEJUSWMzcUFRbk5ERkUxb29QR2RxdERtdDla?=
 =?utf-8?B?ZWVJMERlRXJSekZQakZtMlhFck1YYTE0QzVFaHhqK2xwdWovK1I4RkJGR05R?=
 =?utf-8?B?Rm9kdU9WSUtncUx5S3hwL2Mxb1NqN2N0ZVNWUEdLa0RxMGFaZGdOeE9LMkxG?=
 =?utf-8?B?ODRrUlZ6SytEWVE4endEZVIwUi9WVGloVldIc1BlV1R6TTJiakt0NnZhQU9t?=
 =?utf-8?B?OWVQMFVDQm9zM1NCMHRXeVZvYkVEcTZ4bDRzMnFwbkFKWnNEeTdzVGVsOGZJ?=
 =?utf-8?B?SmJmcUNVSnNiOEdVR08zWXZNM3BpTVJpV0RuMjIxU1QvdXVqdkEyQURYMi9k?=
 =?utf-8?B?WkpnVW1tdjhPQTlJSjZnQVRqbUU0azlaQkVSQlY1eUs5UloxMlpXN3c2NVpO?=
 =?utf-8?B?SlNod1o2TjBWOE9DVGdNWFZ5eWpxb3lBY0Ezbzg2M1N2bkRoWkpWNlVTaDFh?=
 =?utf-8?B?MmxNSDJ2eFRPNUJYdjY3RWZuUUR2T1gyVE1GZEt5NUxQYWtjMjByWWVpODhp?=
 =?utf-8?B?Q3B6am1CMmpzKzlzSlNWOVVJKzVFQTltK2RpbXhOeDRLUTNNV2ltaEJZM25w?=
 =?utf-8?B?TXd4cDUzZld3eTdzWkNNYnJQMXoxcnlweFppNFgzQVlEWlVmMmJvU2RWeHF2?=
 =?utf-8?B?RVhIVVkzN0VsTklwQnI5ZGlQYTFLWXFBSTNhcW5xV280OWdJRGZZeWZ4aTJC?=
 =?utf-8?B?VEF6VTdoVUxMYTR5MFYwcW1pK3lBVm80RHYySGdseFl4WGpidjBuR3ZTa09G?=
 =?utf-8?B?SHJoSTl5Ykt0NUlPVGNYTlhWNnlGa1NnbWt4OENCL2tpcDhHUm1vNlQxeitm?=
 =?utf-8?B?MTBwZ0luNUk3ME9zVS9JbS9KdGs5Mmpqd0tPdWo2TFhvc3pybXpnTTBFZEgy?=
 =?utf-8?B?cTlBazFiOFpsdjB4TkRCaE8rRW1Od3NMTnJINVd0Y0JBclVFSzBvNGVyNmhV?=
 =?utf-8?B?WkV5UmhTZnNVWkZiM01rVnRNRVFtV3ZWZE12b0cyNWsvcU13SWNKVWU3eEZh?=
 =?utf-8?B?V1VZZ0VDUGZhdTN6NDkxWUtUNkxmNmUwWXg4MkFhMjhzU2ZUWDM2ZnByNFpp?=
 =?utf-8?B?ekh4SkZ2MHpId1VicndoNVVTUzBxT21jVkxWQTdCVkR0SW50cVo0TzI5MU5x?=
 =?utf-8?B?ek9zOVkva0VTTkh1WTI4bFlwQ0JoZEJ1TGQzMERCVGdBUmZ4NzkyQlIrOGds?=
 =?utf-8?B?ZWZvbFpDS3lReURrME5jMkdEbHNMYXg2WXpWVDdFSFNmeWZUeC9HellJZ1RX?=
 =?utf-8?B?WTRuUk5NeVpuUmVwbmJBYmFmeHlqUTlGeTk5U2hXY3hWSWd0K05PLytPS240?=
 =?utf-8?B?Q1Baek1naTNXZ1NOK1RudmRVdWt3aWtXeUFrbEN1RFhMWUNwOG1CZ2l6a3VD?=
 =?utf-8?B?QmdVZ002WW0wY2s5K3JQTlFGTlZROHpPWHliWkxxYm1tbU52MHQ0WGNuVzY0?=
 =?utf-8?B?TVhTd1dRNjllZlZkb1orUFFwY1dXN2RxMDBuR3NjN3d5R2JONUlnYmpvbVg3?=
 =?utf-8?B?Mkc1VDBwbXVHVm1TekpUUGJ4ZC9hQXZFbUNxZEVUajFGSXk5OE9Hb3dsWHdN?=
 =?utf-8?B?YTd6WUxaZk1hTkpTTk9NMDlUdnI5SHc0RnY5V0Z4TTRpMEM4eXEyUTZ1V3Fh?=
 =?utf-8?B?Z0ZYZHRkUWJwTjN0SEtFSFJ3a0c1SU9wMjFiQWpNYUZuN21KK3NIK1AvM1VQ?=
 =?utf-8?B?ems5RlVpMWhCQ3M3MlhVMHYySGozd01Ja2w4azRBd2hpYm92VzREa0ZYcHBR?=
 =?utf-8?B?SXl4Q25UVE8xTkl1WUl1QWwrYWhrSDBRZzFJYXQ0Mk1DbkQ4U2pzNjUrcFpi?=
 =?utf-8?Q?1crxrDx09Xg=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8644.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8602
X-CodeTwo-MessageID: f6d73f7c-aa52-4ea7-a816-cc74f40aee75.20250411110841@westeu12-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF00009523.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	84e45079-d0c7-4559-f280-08dd78e9365f
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|14060799003|376014|35042699022|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Q2tFVzNwVGhTNGRCZjl5b1pvRzU0M2ZGaFJmbDJxM3pHdm5MZzl5VTlsWTFi?=
 =?utf-8?B?YnFPbStXWVFyREh1cEFpUTdaeVpSWGwrMFFmVGJWa3huVmJENzJpSllxN3Q0?=
 =?utf-8?B?ZFhxMzV4blRjZDVISzdxTkI5aUFFUmsyWXB0Nnl0OW41d1V2c3M0N2ZSd3Y4?=
 =?utf-8?B?R1ZsYlBHRWpyblI1WE0xeWVUUExHK1NDN0N2bU9YOHh6bVV3eVk1cXoxSmNW?=
 =?utf-8?B?OHJjclFFV3pMOXk0a3hWWEQrV1BrdXFqRmp6ejN2RkV5eWpzbE42bzlsUWJS?=
 =?utf-8?B?Sjg0b1dWeHdKSWZWZG1VLzRaTjJCOVJOdWVXTWRwekQrYkhjcXJkNkZGZklT?=
 =?utf-8?B?U3YzSW1WU05aeGhBZU9PMWdQNnUxdlQ2VXNWYWs2UzhIR0ZCbTdHcCt2Mktt?=
 =?utf-8?B?dElDOXBQRmRsQ2E4cFVMdEt6ays0TE5wNzhxNTNvM0xNZmRnWXB6b3VMcDEy?=
 =?utf-8?B?SEc1RzFHdDQ4OGZhUFlRMDMwNnpFTGxENHZMbHBmQzFEOG16Q2laMlNkbS93?=
 =?utf-8?B?WWllL0JkZ3NRbnVzSnZVQ2o1WnFvclllYnVNRHVzczBLNW02NzlvcUhFTjVx?=
 =?utf-8?B?ZDN1M25hQVF1Qnl1ai80Q0x1L2YrbmFTcEhlTFZOVGVlYlJDL3F1ay9xMzBn?=
 =?utf-8?B?cHQxbzNKTzl4ZnJvV2NnSUE4UWRnQ1dXSThBeXY4Sm9id21zblE4eFVUK0FP?=
 =?utf-8?B?Wit2ZTR5eVFXekxHaFh6VE1aTEFZUlFFMUgrUDJGdm1mTVI5YytkdDBkT1FX?=
 =?utf-8?B?emo0NlpEWGJnM21wajU2REtJL2cxcHRYTmJpR0RqbExzVkVpN1BhT01GbkFo?=
 =?utf-8?B?MjhnTHB3cG8zUFBJZUovdmt3WnpsZEdvYXBjSndSZmlHTldWMnR3VnduREY3?=
 =?utf-8?B?K1FtZzVXaml1aGRNYWRDZW5FUmNOWHA5ajJsREdtR1lRUnZxZUFXUlFQQith?=
 =?utf-8?B?clRESE8yTTg1b3BLaEh0ekgxbFdvM1lDSkNkc3JYNXZYakp5U0N4SHVtOW8w?=
 =?utf-8?B?RE5mZE1CQWNRQTlrTWxHT2Q1OUtRK3cxZzFaOHhuK0FXdFZhY2J6YWVGbmox?=
 =?utf-8?B?QnQwRnRKWHpMcDdMeWhoS1NNR0svcFhQOXRFY1UyV0RENjVaeFU2QUp6Ynla?=
 =?utf-8?B?cTZkUkFCQlZaZ0laM3BtcGVkUnVlN2I1ZWNySXcwcXovd2lWaE5OYWRaU0My?=
 =?utf-8?B?V2ZFNEhXeHU1TVU0OTRpY0ZsS0dKamEzeERnNFk0SUwydnJOalN2QUxHN05q?=
 =?utf-8?B?enM4TlB2UUMwVDlEM3hIcjRuR1N5Um1pZ0FRUkNSUEcvL0RmNUduRDJKcHNW?=
 =?utf-8?B?a1BUWGtHSVZ3OHVjSUFLMjNOSGdIMUUvZ0RZNEtSNSs4Z21DR1A0TXB3d2RT?=
 =?utf-8?B?Qzd0cnVKOFpFYjFKbU1XZGE4eHdDOUNkUTJrTmpNSG9NSEZnMTJhbU1EWmVY?=
 =?utf-8?B?MEZ1RHUvc20zdnlOWUIvMmZRRnhrQUhuMC9nbUR1RTN2b2VKNVZJUzZIeUFk?=
 =?utf-8?B?ZTFtcTcwajlMenVLakNIYytjSFoyYS9iMDlWc3hEdC9ER012M1dXN2N0eVpQ?=
 =?utf-8?B?TThzRHFwVlo4M29rcTJhelp1ZUdsV2ZiWkhJYU5FYVhvV20xR1JzYVFUa2kr?=
 =?utf-8?B?ejN0M3JjUzdzRjdQRUd0M3ZiU2tUWkdYQk0wNkV3KzhRY0pJaHBzZGM1eWdU?=
 =?utf-8?B?V01JUmpWMmpyakJQYmU5b0xVT05MZDZzakdDdWRnelVJNStiUUVobThDRzhW?=
 =?utf-8?B?Q2RyYzJOWFZzV0RURTdYTGpsVU5TY2VqaFJQdnRGVjY5anJhT1VtZHlsQ3NY?=
 =?utf-8?B?SnYyQUhyVVZmWVhCRjRiWS9rSjhjRkh0WGJPV0Qrc25LaHl0OVZtRlBpWGVQ?=
 =?utf-8?B?NUtKZ25RRDZKbmUzbzB4RVFoRzdHM0dwTUhWZEw4SGwra1lvdkR4N2hRWXhD?=
 =?utf-8?B?MUY0aHdiZGlqdXZ4R211N3VCMG5JdUpjVWMzOHlSeVBYcU1HRTRDcjBaV0M2?=
 =?utf-8?B?d0wrQmJGYWFjVFFHaGtvUklZclhDQ1Vvc1FWNXE1MDE0ellBa1JPZ2VqZUht?=
 =?utf-8?Q?GEcaE3?=
X-Forefront-Antispam-Report: 
	CIP:13.93.42.39;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu12-emailsignatures-cloud.codetwo.com;PTR:westeu12-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(376014)(35042699022)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 11:08:42.3687
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd0d10c-f333-4e70-6619-08dd78e93855
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.93.42.39];Helo=[westeu12-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009523.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 11:08:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214732

On 11-04-2025 12:45, Mikko Rapeli wrote:
> Hi,
>
> On Fri, Apr 11, 2025 at 10:40:25AM +0200, Mike Looijmans via lists.openem=
bedded.org wrote:
>> On 04-04-2025 18:29, Mikko Rapeli via lists.openembedded.org wrote:
>>> For example genericarm64 enables "efi" in MACHINE_FEATURES
>>> and in u-boot. Boot without "efi" in systemd works with
>>> EFI protocols but for example efivars is not mounted at
>>> all so various checks fail in userspace. Fix these by
>>> enabling "efi" support by default to avoid making
>>> it machine specific. Fixes efivars mount to
>>> /sys/firmware/efi/efivars etc.
>> Looks like all you need to do is include "efi" in your DISTRO_FEATURES f=
or
>> your product.
> My product is actually oe-core and poky. Machine is genericarm64
> which already has "efi" in MACHINE_FEATURES. I help Ross to maintain
> this in oe-core/poky. Test target machines include qemu, TI BeaglePlay,
> AMD KV260, AMD zcu102, rockpi4b, Synquacer etc. We plan to add
> Qualcomm RB5 too but there is currently an issue with genericarm64
> serial console there, some kernel driver dependency or module vs
> built-in. I hope this gets sorted out soon.
>
>> You're offloading your problem onto others. If your patch gets merged, i=
t
>> would mean that I would have to devise some way to conditionally remove =
efi
>> from the PACKAGECONFIG again.
> Sorry but sensible defaults are not optimal for everyone. "efi" support
> in systemd is in my opionion a good default for oe-core and poky
> when systemd is selected as init.
>
> All arm and x86_64 machines in oe-core use qemu with u-boot or edk2/ovmf
> in UEFI compatible fashion by default to test things. Yes, systemd
> in rootfs will boot without "efi" enabled there but various checks
> which rely on EFI interfaces can't be done since efivars is not
> mounted.

But qemu is not something that you'd find in an actual product...

I feel that defaults should be based on real-life targets. None of the boar=
ds=20
I worked with so far ever used EFI for booting. And that isn't because of l=
ack=20
of variance...


> Richard already rejected making systemd machine specific by
> enabling "efi" support via MACHINE_FEATURES. One alternative
> could be to enable "efi" in DISTRO_FEATURES for "poky-altcfg"
> which enables systemd as init, among other things.

That's perfectly logic. If the systemd config becomes MACHINE specific,=20
hundreds of other packages will also become machine specific. So using=20
MACHINE_FEATURES in the systemd recipe is a big no no.

>> I don't know what platforms you're targetting, but many embedded systems
>> don't use EFI boot, and some even don't have a block device they could p=
ut a
>> FAT partition on...
> I target oe-core and poky defaults. This EFI support does not harm
> platforms which don't have EFI firmware. Those configurations can
> further optimise the setup including remove EFI support from systemd,
> kernel, u-boot/edk2 etc. Many of default machine and distro features
> and default packageconfig setups are not optimised for real products.
> They are sensible defaults and good starting points. My argument is that
> EFI firmware is so common as a default that support for it should
> be enabled by default in systemd init of oe-core/poky. Upstream
> u-boot defconfigs for all targets enable EFI support by default,
> for example.

I don't know what the "efi" config will actually produce in systemd. Ideall=
y,=20
one would build systemd with efi support enabled, and then decide when=20
composing the image whether to include that or not. Something like adding=20
"systemd-efi" to packagegroup-boot or so when MACHINE_FEATURES contains "ef=
i".

M.





