Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C804FD2069D
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 14:02:16 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44428.1764856926377279876
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 06:02:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=aVtCgzP7;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=aVtCgzP7;
 spf=pass (domain: arm.com, ip: 52.101.84.54, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=HxtSM0Y28b6lZPJEk9zWOhg2pG3t5C/hmPdQAJFxMmNLxe3GUtT/Of3GcjKlqyzKzdDBkBoX9MBjb+bzRMF1/nWFBOPGJjkNaiHwi0G7tykIlH/q3hMNLjAJ7Q41F4Tc1u0qbs8v1ERKwh5Yrpzg6Jv8gtQvfOaHgL6F4tboDBMdFJsHomw6rQVbQLgLjAm5Xeno6XDd9X4mrC5vkhb8ZlcpsQK3ulaXSgXNN+kP3wdkPTQdG/qLmzwGhFnQee2UAQbMcFw4YdS131KpiOcbbFri1ap/i96GcYg3d0J3w4Fxja6TrMZ1X8yPMav1R2+MjG4WpgEqY4SnIXnQrHsWHA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXS4MdQcHkayi5npzd48D50hYQy88+RJ7HuzsYqRp0Y=;
 b=GRCupAxRKNbjoG8i0MMt4aiJqmRi61BK/QxCv62grju2JeWMjm7BVb+dLABE5ZQMrXhzMLTG2Y0ZZJ3INgrs8HxlmxUMkT4pxeUmld/Q7bSgyvfavAICE3trbb6IrwX2BoBWHFMXxBmCwGEyfyCUdtFV+LSE+njfrCpyuxXejUq9XjLpFLliDAXIdBYHTWNZPQfrUBw02jPI9nPPpemQghZqGoQ/SSyqj/+Lq5Xbhs5wpTjLS3hPw3wspYFCEpngergIAsBXu+vxaJ2lbW08jgt75zXhOUN0yeUQWlU3Ib9otYUKh8FZXe5dVfKlmpunOE0fwJuA28R7K3dj0FxT7w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=windriver.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vXS4MdQcHkayi5npzd48D50hYQy88+RJ7HuzsYqRp0Y=;
 b=aVtCgzP7oPWDbC0W0zDw9DToT1P+TUM6++6PkrYoVh0iIGDBoI7I6GmoSNg8xbYlQeBcoRsJQA+ZL+uIx8zcL+ZO3oK0pvuhBwa/5KT+x/s5HzA8FL3gluMoMEfFDlqmq7/PR/Vnnat03XIxEJHeR4NtSD5f7u0me6qB+ESc++o=
Received: from DB8PR06CA0043.eurprd06.prod.outlook.com (2603:10a6:10:120::17)
 by VI0PR08MB10920.eurprd08.prod.outlook.com (2603:10a6:800:250::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 14:02:01 +0000
Received: from DB5PEPF00014B9F.eurprd02.prod.outlook.com
 (2603:10a6:10:120:cafe::4e) by DB8PR06CA0043.outlook.office365.com
 (2603:10a6:10:120::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Thu,
 4 Dec 2025 14:02:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9F.mail.protection.outlook.com (10.167.8.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Thu, 4 Dec 2025 14:01:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ad5UI4NtAxKJq4Tz0Mn5Cp5iMxMkNQ72wpoqDpEDSy3ya7O2Aq82JKiZXqrg5CCdkrKU5dUtWITLKUpZYxJjIAfIJaFNWIBp5Fk+jgNGy+A3GvjwFSGnzXAsXrq9I3a7HPcYmktAaeef1Cll4KoPyaMuKZtvw+x5Gi3XEYHxdKPl9PHOM3UjrsTbVvvaTNKh1hGTNOUNFtB/hrkdbvYkHkLyIB6CAcfkMq9FEqb++9b22hgicTCAEk+jNLL1WAEcnqU4Jits0cakZrzSJSEawHZuU4KLXa5hynFkg+h++AGgR0kVX7UE7I5V16qRz0A+yelu+c6NWNVSMVvIYD17cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXS4MdQcHkayi5npzd48D50hYQy88+RJ7HuzsYqRp0Y=;
 b=mdC9ErgioIbZRMn3hPCXJv3EVzW7oOjJ222oCNxdVrKyOntQWw1teCymKhEvNi02TOBcTnDxzh459GJhsrEo3wf2tMJc9CW+k2iwdh6+nojId6YDu3SwkEkFX0+/50cNuvru2RVMUeoHz/X1lBp7sYJUEopYEXoM73If7FtRQtzHC1onvABQo4S36ISGn7g52SYAagXs7KjSqREcMJh7ETkXPMhlbmEMsDJP0e6bLwwkOyOThh4x6a8xlLstHZeBiyg0Jzk3TxHjwCTjzK92bkffD6V5NIeRrZ7rt5mNkO6n8cWXt0qwwYfUFW4m4PkhuUV4x8nAJysLChiMSa+nhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vXS4MdQcHkayi5npzd48D50hYQy88+RJ7HuzsYqRp0Y=;
 b=aVtCgzP7oPWDbC0W0zDw9DToT1P+TUM6++6PkrYoVh0iIGDBoI7I6GmoSNg8xbYlQeBcoRsJQA+ZL+uIx8zcL+ZO3oK0pvuhBwa/5KT+x/s5HzA8FL3gluMoMEfFDlqmq7/PR/Vnnat03XIxEJHeR4NtSD5f7u0me6qB+ESc++o=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB8364.eurprd08.prod.outlook.com (2603:10a6:20b:547::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 14:00:56 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 14:00:55 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "changqing.li@windriver.com" <changqing.li@windriver.com>
CC: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] bitbake.conf: add new variable
 FIXED_SOURCE_DATE_EPOCH
Thread-Topic: [OE-core] [PATCH] bitbake.conf: add new variable
 FIXED_SOURCE_DATE_EPOCH
Thread-Index: AQHcWhKM1DqitrkcN0yBXDIBsCncsLT7cooAgAEtowCAFPhxAA==
Date: Thu, 4 Dec 2025 14:00:55 +0000
Message-ID: <839CC7CB-4E43-430D-B691-81ED23231DA4@arm.com>
References: <20251120114041.193806-1-changqing.li@windriver.com>
 <CANNYZj8mj1ag5M_gh_sWTmBr0teW-Q2=LyDi1VDzzcfWNYokkg@mail.gmail.com>
 <3767419f-6fb4-48be-815a-601c883475fe@windriver.com>
In-Reply-To: <3767419f-6fb4-48be-815a-601c883475fe@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB8364:EE_|DB5PEPF00014B9F:EE_|VI0PR08MB10920:EE_
X-MS-Office365-Filtering-Correlation-Id: 2debfc1f-f9e0-4875-2835-08de333db1a5
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?NzZINS9NOXovVjdVNDY2YTRHUzByWTl3M1BWaE05VWhFUjdWbUsvUW9JNXly?=
 =?utf-8?B?VEg3WVRXNnJCaURBYUZoSVBDM1Q4UnNxRGdtMGZMNTY5eGJMT1U4SStONitx?=
 =?utf-8?B?OVlhY01lRTlyaFA0bzB2TndBRUNtRzQrVWxBcW1PNVlPRDFYUWNxa2NULzNh?=
 =?utf-8?B?ZkxqNC8vbmtxTkp1cXNzQWlQemVnUlBJNHhpYk9BOWU4T0t4ZHpEeTFCemVl?=
 =?utf-8?B?cXJjd3p2eDF0SElmeTEvMDAvTjhCbXluY29ZazJqTzVwWEpzcC8rUVo4enhJ?=
 =?utf-8?B?Qjk5NGJwRnJJTFZ0dGR2V2dWYzRjSDZSSXRmR3RpbEpXMFEwb3gvN3dHKzM5?=
 =?utf-8?B?U0NHaHF3VjJFc05aRjRaNktlK3dQR2ZFN0pNcXJYZUo0YjFDNmlPTVNaS3My?=
 =?utf-8?B?aGJJOWFLMzgzU1lpVm1rSlQ2SWMwWTdqYmFnQjJDRURUK1JENFJKQ0RXTlgy?=
 =?utf-8?B?a3l5OGREODdiWkRjc2VWeFMxdlgvWUJpdjJWS0VKRGM5aXhtYmNUaG5Wbk9v?=
 =?utf-8?B?UXkvdll4bEdTSEF3UU5EY3JFdGhJSmx2RWdvNFRVWmFDUzBKSTZMR0Y5ZlJ5?=
 =?utf-8?B?TlRYZ0JPR2R5Q0M5UVJpcGlhemhCWmJOUm8vZDlwalBVWHlHcVFiWmF1OFBp?=
 =?utf-8?B?T2pramt3Z3U0M3pnSHZ4UjhjOFhCeWNZcjZKK2NlT2QyQWE5SnN3UlRCOEUy?=
 =?utf-8?B?RTdwSjROVzJjdGxoNE4yZWlSaURKWjhaWk1DdGJqK1VlYUI5SXU4MWQ1NWNM?=
 =?utf-8?B?aFVnd0hLNW5KQmtyZ3VhSm5kOUh4anBFOGFheUtQdWNpNFcwU0lhZ29rNmpm?=
 =?utf-8?B?TG1BSisxOEEvNEFINkVCbWhST0MvOWsramk4M2ZlME1ObG5IVDNxeEJOQTVD?=
 =?utf-8?B?UUxRSUtpTkpxUGJoY0pvZG1nR1Y5cmpzSFZMd0piajNpYnNIM0dnNm0xdTZX?=
 =?utf-8?B?ckdZYy81VlVIV0RtMnhwZWxhT3lLQ1lVWHZYS3Y0TXU1SGx1QXMzSDE5ZFU3?=
 =?utf-8?B?YzhoanF0dVRxWUg1WFgwR3FRRlFYd0xWOEJTWVRrQzY1VENtZk13Ky9seGhY?=
 =?utf-8?B?UStWN0lMZWxpNEs5NkxHZklVZFMzUjFSU0ZUOHNvK24zOG12TXgweDBEMExN?=
 =?utf-8?B?U0JPTXltNmw3UHZOdjIxeUhCYkw3TDRBM0NnUlhiV3NVL2k5ekhGZkgxZjVq?=
 =?utf-8?B?MDkyTTZ6amg1TDV5eDFMZ05iV3ZiZm1SZ1ZSaHdiNGtEYUczVzRtUVJxL1JQ?=
 =?utf-8?B?QzB2RVc0RWVLOU5JL09TaE1uUWNES1R3allGVzI5QVRsWXNpd3BSZEI4MEdG?=
 =?utf-8?B?WTFKZmkySzFscDJyTVZNNnBMcit5aVhrelR6dlJmM0RvaGFmRmxoU3hSWTBP?=
 =?utf-8?B?MHUybGtYTEt4b3NOWEs3UmRmelh6b3hUOGk0VGZVRDBjeE9Md1kxZnRNRjJw?=
 =?utf-8?B?VFgyU2dtNkpqY1ZVWEZWbzMwRURpaXkxR1gzV1BYcTk5b0lDWHp2R3BHb0hy?=
 =?utf-8?B?MFY2OUVvZjNCMmNRWVZBSGdiWFpHdUUycjY2c2Q2NzVVRUZkNkhHcm5idmpO?=
 =?utf-8?B?Y2drM3VXajZ4OUpzNExtL2dIZlhFZHpiWFJESWUxdVBZbXRJQnkrUUladVh5?=
 =?utf-8?B?N2RGeHBRcGYrRzFESkxvODI1Tk1ySGZDN243dFU4elhRNWIwSlBCTnlIWUxz?=
 =?utf-8?B?TDRxWjJhQjJjRVVyZ3pnWWZQZkZod29HdjNHVjB3a2ZCOGhPamRwZEJkdWRB?=
 =?utf-8?B?VDUzV25hNC8waW0yb3FJU3hNWEJaUkZXSGlVMmhhZzdYT0RLQSt1SHMvTnd1?=
 =?utf-8?B?SjdZVk9rTDJpbythWFc2RGVqV3pqQ04rR0Rsdmlsb2tRT0t4SE9tRHA0Uzg5?=
 =?utf-8?B?Qllad2RrSlJhVjhPKyswdkkzUHQyTHlUVno3Y3l2bm41VS9WOTBHRjdEWC9B?=
 =?utf-8?B?VHIybThvSldFbWRmd0loaW9US2FpWVRNY3FKWE1vY0tGM015SFlRbE9SVkRi?=
 =?utf-8?B?WGhPdUFQOHpLcEhXTVlLZVU1RHNGbE9BM0llODFDUG5mZFRiaFpBM3Z1d3Z4?=
 =?utf-8?Q?Wcz49t?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <4FFA514E259E674CB2CB5608D439FB6A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8364
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8aa777ed-f1e4-4fc0-8947-08de333d8b16
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|14060799003|35042699022|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NUREalVMeFYvcXQ3OWY2c1RiMGlyajV2M0lsMEN2Y0VMUFJOOXV4R01TN25F?=
 =?utf-8?B?U1l6Vzc3SGpYbHN4SHpublRpM3kvOXVWbUF0S3JaS0dHMXdlWmhaUHNBZUM4?=
 =?utf-8?B?OC9FVHVER0JwZDlYT0FNdjQ0dXRBd0hweXRLbnJPc3RQRUwveWsxY0x4MGNh?=
 =?utf-8?B?SnQrZ2xld2ZSR2dLaVRTUWZLVUxjM3RVZlZCRkpTaFFYL25xS3N4amdpLzRJ?=
 =?utf-8?B?SFllM1FqK3hkajlaYTZ3UzFLaENndHBaOE83bEIvTldrd1ZWWW1vYjVKblpy?=
 =?utf-8?B?UUovdHllVFhnZ1pqczVsYnJHcFB4Tnk3bC9pZTZLUDB5bjZzLzhXM0J3QzVI?=
 =?utf-8?B?NVpPc3RMQUk4Y2I1ejh5eFZMYUJvNkFzckFDSXJBNC82cmR0Z3loc2JZd0JU?=
 =?utf-8?B?SWh2bHAwa1JLNU5YNHR3U1lMd1dLZFBxbnBnOWtmanp6b3Ivdi9YRHIwU043?=
 =?utf-8?B?ZVJBQmxJVjFqQy9Zd2F1T1V4TUVTNE9ZVXhJcTErbEM1S0hFZk9lMU1sbERq?=
 =?utf-8?B?SnpjMmRDdnVkTXBWWDU3Vm1GTDRob0JSODBRRVdtdzZIWkhCZGs0YmJYWCtz?=
 =?utf-8?B?dlhWRWJhempSZEtRUHRHZ1FIYkVWMTZ1VDk3c3NCUnFNeU9DSThQVEVxdjhE?=
 =?utf-8?B?dSt5anBxRkR0TEF6WW5LaWZncHB4VTIybzJuU0dHcVZhZVNFdXhwbHYvMWtp?=
 =?utf-8?B?NmUrRVBZR0JwZXBZdlVlYjNXLzVrUlk0SFh6bzkybXdQT1BVcmJVVllOUU8r?=
 =?utf-8?B?UHB0S05URkFLSHZvTGdZMGIvNlhCbGxDSTVCT1E1S3A0dzhQbm44bXNJajRz?=
 =?utf-8?B?YUwzVTJMNjQwSWs4SHcxcEM5WERvYXZoV1FFbDd4R0FPTmROcWlPL3RveXM5?=
 =?utf-8?B?WGtsZVlJcnBWOHRpM015ejZuNE1xZXI2WmRnK3hnRDZjV3lVQjVGSnVQMmYv?=
 =?utf-8?B?QVZJNUs0Sm5vWDN3TFpVZlBhdnorYzlDT1hBUVkzN1d5ZHkzNVFNblpKbCs0?=
 =?utf-8?B?Z2FiSk9VS0g2VUY0L2tOL21XVmMwRW8rSkNHeXg3SUpLa1lOckVWQUhGaHJk?=
 =?utf-8?B?ZFZCWVNBNkp4MTNCVVVUQ1RnaHJRSVRvZ3JVekcxOVFzQ2RNZ3B2WTJ2WG9m?=
 =?utf-8?B?OTdtK1FoeU1HekdYMHRCelg5cmpsZXFaTDNwQUcxcTgvYWVvVVdlcWNBM1FP?=
 =?utf-8?B?RTIwYWFvWlBOQlIwK1pxbkRzc0NoQ3JNTFUzcGIxUVlPcnNIMXBUL0tFRURU?=
 =?utf-8?B?ZFVCbW5zYWJGcHhMZEFRMndrWXl6SmZXOE5Ra0J1ZE5ySG5EZS8xMFZheGFX?=
 =?utf-8?B?emU3WHNZZU1yMlI4REdNVDdheC9kQk0zcUNBU0Y5TVN2Z3lyUVlUUWI3ZjFv?=
 =?utf-8?B?TFZrMTdFQ0RMQytSQnhuSjJuWklnRS9XMnkyd3kxZWkxV0sxTUU4UHllL09h?=
 =?utf-8?B?WHVQd2lBRlRtUkFrZndkVUd5NHh2Sk90QWMxbGJBVGo3SVNaRlVoRGRGOUZr?=
 =?utf-8?B?OFU5dHl4K0p2bVkxc3JWZ3VRSnFhdlp5QzhZaXNCVk52Vzh2VnNTUVEwMGRH?=
 =?utf-8?B?MVJlanA4cmVJblR6RUJBQTBERkRVclhGeTlndXpUU0ZjZ0NiR2FLSGl2YXcx?=
 =?utf-8?B?VVlBNWdoQnpqSHRYSjV2RnkzNlRveUtXOEFoQlo4OENDZHNOSWJMbVRNN3RD?=
 =?utf-8?B?dEJ4NE1KbUh3VE9rS3N6ZXAyQmhvdUlqREJIRnV2TU1DUzdzeDgxOTcxMFVZ?=
 =?utf-8?B?dEpRWUpWR09HSWtBNTdldXBhQjRTRFk2cTJVTWJ6SHFRVzdxMmxkbTR4L2Zn?=
 =?utf-8?B?THlPK2hxVnZHSmRVNjRNK0NYemdrUk4yb3Y2SUc2R3hYR3ljVU9ET1NKSklB?=
 =?utf-8?B?aEJRblJKK2lhYjRsR1oxclJnOVJXR2xWK09Wb0tnd0t6RzdkRzUzclVlV0hX?=
 =?utf-8?B?dUIzb1ZpKzlGUFpiTmJrUUJzM3Z6NWUwc3RYVDZNMGNFY1MrUmdBVTd3STdx?=
 =?utf-8?B?TjRxLzdLOVlqeS9oVFl4Um1Qd1RsSmJBL0hEV3lVVDdRMkg1MnducWZNbnFv?=
 =?utf-8?B?MEFBWkNnNWpsSHArQ1o2ZlJVcEdKam1vUXBPM2NLRHNZVDNLRDdHR2xUUThZ?=
 =?utf-8?Q?U+Mg=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 14:01:59.8490
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2debfc1f-f9e0-4875-2835-08de333db1a5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B9F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10920
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 14:02:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227296

T24gMjEgTm92IDIwMjUsIGF0IDA1OjQ2LCBDaGFuZ3FpbmcgTGkgdmlhIGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcgPGNoYW5ncWluZy5saT13aW5kcml2ZXIuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiBObywgdGhlcmUgaXMgbm8gLmJiYXBwZW5kLiBIZXJlIGlzIGhvdyB0byBy
ZXByb2R1Y2UgaXQ6DQo+IHdlIGhhdmUgYSBnaXQgcmVwbywgIHdoaWNoIGNvbnRhaW5zIGRvd25s
b2FkZXMgc291cmNlcywgd2hpY2ggY29udGFpbnMganF1ZXJ5J3Mgc291cmNlczogJHtCUH0uanMs
ICR7QlB9Lm1pbi5qcywgJHtCUH0ubWluLm1hcCAuDQo+IENyZWF0ZSBwcm9qZWN0IHVuZGVyIHBh
dGggQSwgYW5kIGNsb25lIHNvdXJjZV9taXJyb3IgdW5kZXIgQS9zb3VyY2VzX21pcnJvciwgYW5k
IHNldCBBL3NvdXJjZXNfbWlycm9yIGFzIHRoZSBmaXJzdCBQUkVNSVJST1JTDQo+IENyZWF0ZSBh
bm90aGVyIHByb2plY3QgdW5kZXIgcGF0aCBCLCBhbmQgY2xvbmUgc291cmNlX21pcnJvciB1bmRl
ciBCL3NvdXJjZXNfbWlycm9yLCBhbmQgc2V0IEIvc291cmNlc19taXJyb3IgYXMgdGhlIGZpcnN0
IFBSRU1JUlJPUlMNCj4gSW4gdGhpcyB3YXksICBzaW5jZSBqcXVlcnkgc291cmNlcyBhcmUgZmV0
Y2hlZCBieSBnaXQsIHRoZSBmaWxlcyBtdGltZSBpcyB0aGUgY3VycmVudCB0aW1lIHdoZW4gdGhl
IGZpbGVzIGFyZSBjaGVja2luZyBvdXQuICBTbyBmaWxlcyBtdGltZSBpbiBwcm9qZWN0IEEgaXMg
ZGlmZmVyZW50IHdpdGggcHJvamVjdCBCLg0KPiBUaGVuIGJpdGFia2UganF1ZXJ5IHVuZGVyIEEg
YW5kIEIgZ2V0IGRpZmZlcmVudCBycG0gcGFja2FnZSwgIHRoZSBkaWZmZXJlbnQgcGFydCBpcyAi
QnVpbGQgRGF0ZSIsIHdoaWNoIGlzIGdldCBmcm9tIHNvdXJjZV9kYXRlX2Vwb2NoLg0KPiBBY2Nv
cmRpbmcgdG8gbG9naWMgb2YgZ2V0X3NvdXJjZV9kYXRlX2Vwb2NoLCAgc291cmNlX2RhdGVfZXBv
Y2ggb2YgcHJvamVjdCB3aWxsIHNldCB0byB0aGUgeW91bmdlc3QgZmlsZSBvZiB0aGUgc291cmNl
cy4gDQo+IGluIHRoaXMgY2FzZSwgdW5zdGFibGUgZmlsZXMgbXRpbWUgY2F1c2UgdW5zdGFibGUg
c291cmNlX2RhdGVfZXBvY2guDQoNCkkgYWdyZWUgd2l0aCBvdGhlcnMgb24gdGhpcyB0aHJlYWQ6
IHRoZSBmZXRjaGVyIGV4cGVjdHMgdGhhdCBtdGltZXMgYXJlIHByZXNlcnZlZCwgYnV0IHB1dHRp
bmcgdGhlIG1pcnJvciBpbnRvIGEgZ2l0IHJlcG9zaXRvcnkgZm9yIGRpc3RyaWJ1dGlvbiBkb2Vz
buKAmXQgcHJlc2VydmUgbXRpbWVzLiBUaGUgcHJvYmxlbSBoZXJlIGlzIHVzaW5nIGdpdCwgbm90
IHRoZSBmZXRjaGVyLiAgVGhpcyBpcyBhIHJlbGF0aXZlbHkgbmljaGUgcHJvYmxlbSBiZWNhdXNl
IG1vc3QgdXBzdHJlYW1zIGFyZSB0YXJiYWxscyBvciBnaXQgcmVwb3MsIHNvIHRoZSBwcm9ibGVt
IGRvZXNu4oCZdCBhZmZlY3QgdGhlbS4NCg0KVGhlcmUgYXJlIHRvb2xzIHRvIGRlYWwgd2l0aCB0
aGlzIHByb2JsZW0sIGZvciBleGFtcGxlIG1ldGFzdG9yZSAoaHR0cHM6Ly9naXRodWIuY29tL3By
emVtb2MvbWV0YXN0b3JlKSB3aGljaCB0cmFja3MgdGltZXN0YW1wcy4NCg0KKGFsc28sIHdl4oCZ
cmUgb25seSBzaGlwcGluZyBqcXVlcnkgZm9yIGRpZmZvc2NvcGUsIHdlIGNhbiBpbXByb3ZlIHRo
ZSBwYWNrYWdpbmcgaGVyZSkNCg0KUm9zcw==

