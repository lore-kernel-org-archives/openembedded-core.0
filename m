Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42197CAC592
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 19:25:58 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.24])
 by mx.groups.io with SMTP id smtpd.web11.1671.1757964352566763811
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 12:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=fZNk2KG2;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=fZNk2KG2;
 spf=pass (domain: arm.com, ip: 52.101.70.24, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=T6Ds8nA6PkiKN0qzs8b4ONtguIWht/8rgEO1xuawlY1IfzBi1tGljiPsiW37dDddUz3nLpd8IGSQKcnut6B5WE6DRuvT5Wu9/INAmwJIiz4DGdk3b26kfxOphkJKdf5CW/mLW4W9NgL370opbjv0DbmGIqU5qchCCICIPcLRUwKAV5nOczaEJ4L89MIRJvrnik/9TFeKhWThhXswgnBlMVb2izc+aT1oSnfpCealea09mJubCFprwAz7j7ej1+jw3Sgvz9KogmBVkN+nselj/GSbuRKrsWWNT0EzlPCDs0rQa4bWJxpHmUEGe7EYhUmDsFwLKp4SAfG1KWrlQdzZ4w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A8DiDDk9h2ORKrBPjKnXIOIWAEWh8K/7i2YWdT8nArs=;
 b=ie2FYsU7jes9RG9Yg4kcRYBwExV/RdIubFDB7PmytKmtdK3w4Zj2J8njmIeT+G8XBHl5uZP7AO2O8H6JdvEG57EvpZZu61xq4TocR6TzW3Y69t49tgw1p6GBRvByT8nRwPVwcqoO1k5pS55ASFWqhbzMJ+P6ET9fi5+e4WivsGJNRpa1kjBah+q6uuzETQXPgQzyOXvcUCye6X/luemT8ickFhP7/XEO6jsXt76NKIv+qB+7+5EWstyLOWDhU+oGWtloKFsJRWmKLMp4w3bRX9LLXcSHIkAichrOkYmLQe26UHcqv/Z3MTFmI+OXE3Uw71FxoAM++HCESeeA8bQd5Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8DiDDk9h2ORKrBPjKnXIOIWAEWh8K/7i2YWdT8nArs=;
 b=fZNk2KG2zov1dJcYpw47eXKxdGa7xWDMqHNA5HTxVPagSvfYBrTAKldQGmlWEu5DB++BFXF9DFygBsPaJ7IgF9FEjdsaJf24VxYMYcnjmIiVTM7jgX8X4VVDijG5tt2EUHQSOaEeXQDJuTtN9am7J/8dHh3A5kYF+FVlf0/UlXw=
Received: from DU2PR04CA0016.eurprd04.prod.outlook.com (2603:10a6:10:3b::21)
 by AS2PR08MB8362.eurprd08.prod.outlook.com (2603:10a6:20b:545::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 19:25:48 +0000
Received: from DB5PEPF00014B92.eurprd02.prod.outlook.com
 (2603:10a6:10:3b:cafe::97) by DU2PR04CA0016.outlook.office365.com
 (2603:10a6:10:3b::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.22 via Frontend Transport; Mon,
 15 Sep 2025 19:25:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B92.mail.protection.outlook.com (10.167.8.230) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.12
 via Frontend Transport; Mon, 15 Sep 2025 19:25:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GwnqwmWTTLU1E1eA54gkzTMjqW53sQkz7qShp8sBs0axyJHrNYsFYbvfkd4fmFh4LfBGP1gUBW4z44L7h2uC5jIkX3005avDN0YiCBOMp6TriY5izllMqCSj1qyzT4lNmMkjJeOXOUU020x9JShXcTt/fZQ+FA3aRWjADcCYYN/LTjx+A58cNA40u38oENCxZy4TLumG1zn4X+kg1XxPGA8zoEWsNmWRnXiV5qCmppdLKCRw2Bv4Qzr0h7H0QaW3kmXEj1F7ZLJsJn2hAm+Qnngs7x9UEJy63z3YnA4NzT+JjlXgOXtPkUwyguHVDNUK9zW+RK+41hJClWZcl8epvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A8DiDDk9h2ORKrBPjKnXIOIWAEWh8K/7i2YWdT8nArs=;
 b=yRjNlz+OD48tE9t5hSy3FMg2xY28LNybg0dhb95pWy9Xvy2ehNjOhgA+IoxifWoG0my+RQSTy8bYQVcAUIhh0FYlgG/PYHsAsX3fuPiqSMjkGlUiL/iOdVPwHJ4NBp5rtsrDcu3Lrgfp3sLYBX4T1T73GiucTd8Y4KzWnlw39I3cDJ7//glALvXRWTmZB055XUz4swFfPe8xRwwPmypaR4t3uQd4vL8LIbqCMhHUtRxxLVQ6aoLyoaF/bEYsShvpN69Iudo6UzU8ycJ5kaePM2s+fMO+w8+VaTe9sVlsz+2EhhlYRxMwS3EwE4BinFKT1T5Wszw5BkylS3E6PRvI/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8DiDDk9h2ORKrBPjKnXIOIWAEWh8K/7i2YWdT8nArs=;
 b=fZNk2KG2zov1dJcYpw47eXKxdGa7xWDMqHNA5HTxVPagSvfYBrTAKldQGmlWEu5DB++BFXF9DFygBsPaJ7IgF9FEjdsaJf24VxYMYcnjmIiVTM7jgX8X4VVDijG5tt2EUHQSOaEeXQDJuTtN9am7J/8dHh3A5kYF+FVlf0/UlXw=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB4PR08MB8152.eurprd08.prod.outlook.com (2603:10a6:10:380::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Mon, 15 Sep
 2025 19:25:12 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 19:25:12 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 10/16] which: update 2.21 -> 2.23
Thread-Topic: [OE-core] [PATCH 10/16] which: update 2.21 -> 2.23
Thread-Index: AQHcIvmKNNTs/rZjmUmzewUTbrj9wLSUpuoA
Date: Mon, 15 Sep 2025 19:25:12 +0000
Message-ID: <37DE8CEE-A206-4A35-A6B4-DAA9E1378839@arm.com>
References: <20250911085123.1551425-1-alex.kanavin@gmail.com>
 <20250911085123.1551425-10-alex.kanavin@gmail.com>
In-Reply-To: <20250911085123.1551425-10-alex.kanavin@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB4PR08MB8152:EE_|DB5PEPF00014B92:EE_|AS2PR08MB8362:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c486135-edea-4322-2b8a-08ddf48dab88
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?WVZBdllYS28vazJ0QjlDMHRIdkY2RVljS0J3Y1JYQUJCUHc2Ni83cFViTnV2?=
 =?utf-8?B?NWp4YVRhbEk0V20xR1BFK0kwWkROZUdheGJ5UW5nUUdTZjhUdW1NM2hZR2hQ?=
 =?utf-8?B?MkNvRnNoRTNGanQwMnNQbnFwNmJNcjNRTkovdTBmU1cxWHl6NUlMTnJXdW9G?=
 =?utf-8?B?bnlHOXhDWk1IVFl2THJYUVBabyszOFdYeUVocWhIY2duOXQxYXh6ZVFlZnIv?=
 =?utf-8?B?TmtkSUZLMTQrbEl2SFRQRkNZMFUwTzR0Ty9ibFJhWDdOYis0VzlLczJhTURp?=
 =?utf-8?B?UWs3ZkQ1RmhpQzk3YjU5NG5ZcUlvc0gweFBFQnp4NVhYSlBjaStWTTYrdGRM?=
 =?utf-8?B?dlFnYk9GWFFmallJcVE2Y3dRdmhXcWdQMnE2UERlZ3dkaU1CM2haL0RsL2FB?=
 =?utf-8?B?NHdpMTN6TCtmWmdrWG9VVS84cFplRGxSMlhsTUZtK24rQWc3K0RvRnB1UUt3?=
 =?utf-8?B?S3FYN2VucURDUStlZE0vR0NOVytZYkFJRitDU1VOenVad3k4cHFVcXZka2ty?=
 =?utf-8?B?blVCNzJvNnVaYWFqbk1QdlljWEtGSndhL0cwTWI4ajRwZGxsVjdEUGU4dktS?=
 =?utf-8?B?dGh0K0dnNXVYU1pDOVpHZ3laMEV2OUxlMDN6Qmprd3V5dUU0cllkUlBSbWVP?=
 =?utf-8?B?UTIvZzZBQ2E1eUx3ZEZjS0JVc1JrMVJPejhweWp0K3VHR2NsQlg5TzdGalph?=
 =?utf-8?B?cHdnK1JLOHo1MjdWcy9Pa0xsKy9mSkhqczlabkJ3cjZia1JWQkdMakF0Ylcz?=
 =?utf-8?B?L21hbUphM2VQRS9pVXlxeHZmamdHTHBycTYvMVczMzNidjVLZnBYUUdqN3V5?=
 =?utf-8?B?SllDRUoxNWZqYzMwTkhuQWZueFduTm5nVXl0ZllWSHhhbC9BaStVOCtYVEZB?=
 =?utf-8?B?Z05IMHFYRDBieEx5UTJTcDRqKzhlY3U5ZWZ3akl1V2IwektrbUQ2cFZJWFk0?=
 =?utf-8?B?a2lwZUlLVUg4UmxWbGFlaklTRTQrTDhlMnRkdGo0Y1FWNytxaWJWdXhtV0k5?=
 =?utf-8?B?UlNBbzhubTVrdnNVYjcxaC9mSVo2NWNwb1J0dFZvMEI0Ykp0VHlFRXQ4cGRz?=
 =?utf-8?B?UXRJczNCZTA2SXJsNjNpMlh3TTRwMVo4dmJuWDlEYjB4dkp5aG1qWndQSmI2?=
 =?utf-8?B?NDVRMVpLcmQvTzd3d2UzYW9tOFJMRjZNKy9SenZRUHFYakZ5bEFXYTFWNjhj?=
 =?utf-8?B?ZFFYK0ZLQUhLbS84d0ZJNW14Z05aTjVHdjkwYzhJVjBsSXAwUGlQZjltZ2M2?=
 =?utf-8?B?Rm9sdndFTWI3WWJnaFNlaTFBRVpzYTljb0pXUVNRb3hhZGRuTmNJMHNDUVBs?=
 =?utf-8?B?ZHRvWFdJZWw4SGFpaU1IV1RYQWVBV2FTWHZ4SUErN1hzem9UeDF2eHJ1N2xL?=
 =?utf-8?B?T0lHQjZSZFB3cE1TOUwvVEp5cC85TUFLRkVSTnBjQ0JJU0hzU0JSaGlDVUkv?=
 =?utf-8?B?Yk5WZVl1NTJ3UnN6SXpSbHNTN2l3QUoweFUzM3M5QUJlZ3dmMWh6SG9mNmtq?=
 =?utf-8?B?Q29ETXUzV1pIZjdPbmxSYmpUelpSUDE1T0ZrTlVrOTFkNnhYTi9QaGFvbEU0?=
 =?utf-8?B?cGhFdkx1T1dvdHRBM1FkU0Y4NHEzUTdHamt0MGdjZHB0dXg3RXlsQVlGZjNQ?=
 =?utf-8?B?OHFNODZJQVpTMUJBNTlMK2NXY1AzTU9OenBkSUtOWjlmUWVubEw2UUpwNit5?=
 =?utf-8?B?SkV1NWVMNlBoN3A3SngwdHBzNUgvdGU1OU1JbGRyUlVxWHdNRFl5K2JNbnVj?=
 =?utf-8?B?WUJpTCtsMUhTcHgvRHVXK1pjTXVzbzFBcm9yVjUxMXVWT0dOQ2Iyc1hiNDcr?=
 =?utf-8?B?WXBhbU5kS0wzcU9mWXZxUi9MWWhFMU5GWEI3VkVWZVM5eFNnM0pCeFAwT2pn?=
 =?utf-8?B?bTR4QThrSExqRk9QVFlKZ2Z6dUNnWlBtbGtnUUw2ME8yVStzMS90NlRnODF1?=
 =?utf-8?B?YjF4UVJHL3BVaUJWTW1vUDdnc2thVy9BRytuMW9uQkhtb1ZHeWhMTWdsTnZM?=
 =?utf-8?Q?o1MpCj6iBSuloUpoQwi0IwOh3gxyHs=3D?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B46BC8EAE2483C47A40D19C3ABB5659A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8152
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B92.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c283defa-3e26-4d8e-2828-08ddf48d979d
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|35042699022|14060799003|36860700013|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WVdqdmhzekhyTVh4dHlEaEoxQVNwY2dkY3FDZjlaUGtXbWV1WldlSStlb3BU?=
 =?utf-8?B?MFlGUFJnTWwyTDB3Yk5aVXNuQXJia3BjeVRZalRlUGxETVJIQ0F2RmRJUVFz?=
 =?utf-8?B?K0VwbEVESDZ0eUxvN3lLay9YMmRydmxhQzYwU2MzWnBpOTFZL2lYMG0vOVYv?=
 =?utf-8?B?REdPeFNGb1E3ei9oT3V5WWVQRE9kbFlCRTRZY2hVOWw3b01jdGcyT2s0NmVj?=
 =?utf-8?B?eFpFSlFSV2p1SjY2VHB2RHk5NXU2OEdralFzK0loL2k3dWRlSS9wa3g4M1RI?=
 =?utf-8?B?bmdVQXV5TUttRU5YUGZTSjZUWFJHNWZWUWlkbVNPR0FENUo2WVo2YVZocFVy?=
 =?utf-8?B?OTA3RzJNSEJSTzBBWUxTSTVrZWs1WjFIcENKZ2NScTBuY1RaYmpUWTRmb1Q0?=
 =?utf-8?B?bGhBZXZtc2tZSWZQeGxlTlgxSUJTOE9nLys1R25Bc3lrZzIyd1BMdTI2VlU2?=
 =?utf-8?B?WGxoNUNCOW4vMjRvRVVhZElLVExMQWZ1bzBKVEZrMEpNKzdCRGl3YWNIZmtI?=
 =?utf-8?B?bFA5STg1Q0dQNkFpYlZLNEZ4S3VmU09Tc1hhRkhyb3IwZTZGaE85VE0ra0I4?=
 =?utf-8?B?aHlLa0NwaTRuemRreFdHWmxtTHAwRVFtUkpXM2Zvc3ZzNEhiVDlmZ3c5VGpu?=
 =?utf-8?B?bkMrZ2JQSk9nbGZVa2VnQVBVdk5Wd2JoeVJCQTNDSFJZQWlHZWlMSVZsY3VW?=
 =?utf-8?B?MTRFcEh2RE9ZZ1Zja1JXZGU0aUhMbm1ObEdLajRsUnZLMC9kd3IwTmo0V1Np?=
 =?utf-8?B?UGZrditraXlFQkdLa1hISGRGQUI0UkRZWGZORGw4STU2cUkySnNvdjN3ckdY?=
 =?utf-8?B?Y2R6dWV6b3J1WTVmRG9Dd1cyWUhBRldCRHRHQ1pDS01ZcXROWm14R1RqS25N?=
 =?utf-8?B?ZTB0Y0daTkdMbWZUVUJZSDhHR2dCc01iSzJ5TmlyYWxBQ1NWRWFVNEhLN2s2?=
 =?utf-8?B?ZVI4TWlDMDJOYW5jaERHR0ZXSElzMnhQanhmMitwNHN1Z0paVHRwcVBuMVZq?=
 =?utf-8?B?aFYvQVZPbDhCWVB3Qk9veEMyVlNiNGNIS1VTMFg5emoyTVZtL2NYcERHZ2x1?=
 =?utf-8?B?U01Day9DRWJhczNxZjNPQmsreEdRbnhYZzB3N2diUTF5RFBlaGFxR0hBQzd1?=
 =?utf-8?B?bktZUERXTFFOZjBwNFl3V1VsRHFOcUpzZ3Z2Q1FmVmlkclV2OTJtNEd3N2Rp?=
 =?utf-8?B?MU9vSXhZSFpNTU5ZL2pwNXFFNEFTNFYzSEF4R2pkV1R6SStJWktMSjZzZENl?=
 =?utf-8?B?d0laK1JUUVJoSzhLWGFTdVJOOEZuT1M2cWFxVFhCWTVPVUhPeVZSVyt3b05n?=
 =?utf-8?B?SGxGbDNvejVtMWVPVzFQYzhZQVBhYkh2cVdNSklIczdMVzZaRFBRQ1ZvbjlO?=
 =?utf-8?B?L2dNVUJwVjNNYWlrajd6WWFLVEJjQUZEUndYOXNHdEdMbEorRDhZcGlYdWFH?=
 =?utf-8?B?R1Q0QmFyYThaemdFb0FNUkdEbnhuZUJDVzkwOFFBeDVGSjdHcFUxMjBnbEpw?=
 =?utf-8?B?cVRyNU9zY0s3aXRQUnltSm1EY200bDNCOWJDN3Q5NEZ5bWZzWVA3OW9ZU1Uy?=
 =?utf-8?B?a0xPaVcxS2xqYUNjQzNPWk5iYjBUQjhnbzBrMWw4dWdNc0ZJUkN4dkZvczJp?=
 =?utf-8?B?bXRaRmhPUTZDcXBZb1IxdFdOMWlvTDhIcWw5bkZaZDAwV05QZnFpVnpWMkg0?=
 =?utf-8?B?c2wzS0grclJ1M0lLQ3pheWw1K2dJVldCMkJHck9jVzlVTVJpenhlSFBWS3Zl?=
 =?utf-8?B?SEpXMmpkb2FkYm5tQkpaWVhtZmNuelJjWHdaeHl1NTFWZTFLclJWeVRKcGFq?=
 =?utf-8?B?RVdYVDZnN0h1czNidisreXR1QmhHckFHdkYrdnZVRkVtcGxZNzU2RmVxdzNM?=
 =?utf-8?B?NXBIMWZ6L0dTQU0xRGt4MWFzTUQ1M3JGQkY3UmRxeUx1U2FqTSt0ZHRlY0lY?=
 =?utf-8?B?M1Mzby9pZUVqbTQzUEl0LzczK2x5UTdqaG5HQjFiSk1mc092K3ZsOFd3MGlK?=
 =?utf-8?B?TXQ2TW85d2RZSEtYWG1JQUxaNmVHL1RZaHhXK1VCT1QxcU9xVCtIMzhpMHpV?=
 =?utf-8?B?S3FQbUNCNmN4UXpIYjVCQThnZWNDZmJtYWJNQT09?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(14060799003)(36860700013)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 19:25:46.1274
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c486135-edea-4322-2b8a-08ddf48dab88
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B92.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8362
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 19:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223506

T24gMTEgU2VwIDIwMjUsIGF0IDA5OjUxLCBBbGV4YW5kZXIgS2FuYXZpbiB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8YWxleC5rYW5hdmluPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiB3cm90ZToNCj4gVGhpcyAoYW5kIDIuMjIpIGlzIGEgZmlyc3QgcmVsZWFzZSBpbiBtYW55
IHllYXJzLg0KDQpZYXkhDQoNCj4gLSBkcm9wIHR3ZWFrcyBhbmQgZGVwZW5kZW5jeSBvbiBjd2F1
dG9tYWNyb3MgYXMgdGhhdCBpcyBubyBsb25nZXIgdXNlZA0KDQpZYXkhDQoNCj4gU2FkbHksIGN3
YXV0b21hY3JvcyBoYXMgYmVlbiByZXBsYWNlZCBieSBhbiBlcXVhbGx5IGN1c3RvbSwgd2VpcmQg
c2V0DQo+IG9mIG1hY3Jvcywgd3JpdHRlbiBieSAnd2hpY2gnIG1haW50YWluZXI6IGh0dHBzOi8v
Z2l0aHViLmNvbS9DYXJsb1dvb2QvY3dtNA0KDQpPa2FhYWFheQ0KDQo+IC0gb25lIGVmZmVjdCBv
ZiB0aGF0IGlzIHRoYXQgYXV0b3JlY29uZiBpc24ndCBoYXBweSB3aXRoIHdoaWNoJ3MgY29uZmln
dXJlLmFjIGFuZCB3b24ndCBydW47DQo+IG9uZSBpcyBzdXBwb3NlZCB0byB1c2UgYSBjdXN0b20g
c2NyaXB0IGluc3RlYWQ6IGh0dHBzOi8vZ2l0aHViLmNvbS9DYXJsb1dvb2QvY3dtNC9ibG9iL21h
c3Rlci9zY3JpcHRzL2Jvb3RzdHJhcC5zaA0KDQpTaWdoLg0KDQo+IC0gYWxhcywgdGhhdCBzY3Jp
cHQgaXMgbm90IHNoaXBwZWQgaW4gdGFyYmFsbHM7IHRoZSBtYWludGFpbmVyIHdhbnRzDQo+IGV2
ZXJ5b25lIHRvIHRydXN0IHRoZWlyIDIwMGsgY29uZmlndXJlIHNjcmlwdCAoaGVsbG8geHogYmFj
a2Rvb3IpDQoNCkZhY2VwYWxtLg0KDQo+IC0gYnVpbGRpbmcgZnJvbSBnaXQgKHdoZXJlIHRoZSBz
Y3JpcHQgZXhpc3RzKSBpcyBub3QgaW1wb3NzaWJsZSwNCj4gYnV0IHRoYXQgaGFzIG5vIHZlcnNp
b24gdGFncw0KDQpHcm9hbi4NCg0KPiAtIHNvIGluIHRoZSBlbmQgY29uZmlndXJlLmFjIGlzIGRl
bGV0ZWQ7IHRoaXMgaGFzIGFuIGVmZmVjdA0KPiBvZiBhdXRvdG9vbHMuYmJjbGFzcyBydW5uaW5n
IGNvbmZpZ3VyZSBpbnN0ZWFkDQoNCkljay4NCg0KPiBBbGwgdGhpcyAnc3BlY2lhbCBoYW5kbGlu
ZycgZm9yIHdoYXQsIGV4YWN0bHk/IE9uZSBzaW5nbGUtZnVuY3Rpb24NCj4gZXhlY3V0YWJsZSwg
b25lIG1hbnBhZ2UgYW5kIG9uZSBpbmZvIHBhZ2UsIHdoaWNoIHNob3VsZCBhbGwgYmUgaW4gY29y
ZXV0aWxzDQo+IHRvIGJlZ2luIHdpdGguIEdOVSdzIGF0dGFjaG1lbnQgdG8gYXV0b3Rvb2xzIGRl
ZmllcyByZWFzb24uDQoNClRoZSBhdHRhY2htZW50IHRvIG5vdCBldmVuIHN0YW5kYXJkIGF1dG90
b29scywgZXZlbi4NCg0KQmV0d2VlbiB2YXJpb3VzIGZhY3RvcnMgaW5jbHVkaW5nIGhvdyBsYXRl
IGluIHRoZSBjeWNsZSB3ZSBhcmUsIGhvdyB1Z2x5IHRoaXMgdXBncmFkZSBpcywgYW5kIGhvdyBt
aW5vciBHTlUgd2hpY2ggaXMsIGFuZCB0aGUgbnVtYmVyIG9mIHBvc3QtcmVsZWFzZSDigJxmaXgg
b3V0IG9mIGJvdW5kc+KAnSBwYXRjaGVzIGluIG1hc3RlciwgSSBwcm9wb3NlIGhvbGRpbmcgb2Zm
IHRoaXMgZm9yIG5vdy4NCg0KV2UgY2FuIGZpbGUgYnVncyBhbmQgdGFsayB3aXRoIHVwc3RyZWFt
IGFib3V0IHNvbWUgb2YgdGhlIHBhaW4gcG9pbnRzIChubyB0YWdzLCBubyByZWJ1aWxkcyBmcm9t
IHRhcmJhbGxzLCBldGMgc291bmRzIGxpa2UgaGXigJlzIHRyeWluZyB0byBhY3RpdmVseSBlbmNv
dXJhZ2UgYSBzdXBwbHkgY2hhaW4gYXR0YWNrKSBhbmQgaG9wZWZ1bGx5IGhhdmUgYSBzYW5lciBy
ZWxlYXNlIGluIHRoZSBmdXR1cmU/DQoNClJvc3M=

