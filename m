Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D39F5D6555F
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 12:36:26 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.58])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13972.1765974981308547665
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 04:36:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=TfssqYMW;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=TfssqYMW;
 spf=pass (domain: arm.com, ip: 52.101.65.58, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=IlCV/INhSQXAVirICc4AIQm1rhKacWvWH7FqMmQ48djOkXtzOlBnMg5wpuc6lxPyxKPV7Y/D4wbaNUM+EbVnA0ONSkRN/FAZGtYrk+eYHoqPURM/qZO4N41MnTW0lE+iuHuWcg7JbdnugHDmwN06lF4ga2NnOHq0JYQB3uiBf31+9rO0Fp3Q5dZUhUes48uF6EmyvWjlzr9gw9LIxlTbgh0gZADws0Ys8xd9vpMQ66CZvfdmqTFtuPZNiK91Vvte+CiUzedXGlYhLeLhDzu5fy5qCvyIiF6WyFXkdGhiHjG0I4wU0qMl2KqzqocMqkBX3MtN+KhQUv2hvIJPTYdFzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0xQCOaXCUbiqKVErJtknJPJ5OSwZZLKkRbQgAxbiGnQ=;
 b=S1hun2Ywa5iXJFaxIgBw2jZgkSZ0Vor27l7+AwStSOda9yZbcVM9itlD+goKKD7z41V6YZeoksY9TPD7+ExCZ5Zu+jqH363KZZ+WW5JIcd7R/dvzKmMbGC9RSDecDLuEuUCsRkWfCXn4ZcwUUpG5vkaUi4wfFP7laREEP3Wey85rO2qodtPruLxNhoWiWvKRBJYwus80bQNJxffpLezqkKXmMZtt2WxYonBqOwa+BeVSQVn+JmEiYSnot6PWB8GpePXioqmfOMmZz606+LXcJ0/rk3ECx8r7m9/Utg2Lw20u6H7lrbdv8KZzyxfvmN0sc9IePStV1ypzyXdQSM4Heg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=phytec.de smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xQCOaXCUbiqKVErJtknJPJ5OSwZZLKkRbQgAxbiGnQ=;
 b=TfssqYMW5D9PLb799gQ1zEmp/07V3ilhAyizN1UdF3NKMhseRdO7jErqjHu81oBAxDOCGZYSKYugpux9Dx60Fw2YLIGcWMTD5z3gLpzFMcmgEKhiU/ThgswcfqnKhlsijE+2g0bEAa9M58rddlUp4TRRgdR9KkwyDEM455FTP7g=
Received: from AS4P250CA0014.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5df::17)
 by AS8PR08MB8370.eurprd08.prod.outlook.com (2603:10a6:20b:56b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 12:36:12 +0000
Received: from AMS0EPF00000199.eurprd05.prod.outlook.com
 (2603:10a6:20b:5df:cafe::a3) by AS4P250CA0014.outlook.office365.com
 (2603:10a6:20b:5df::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Wed,
 17 Dec 2025 12:36:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000199.mail.protection.outlook.com (10.167.16.245) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Wed, 17 Dec 2025 12:36:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DQo13YdekFQIdxj6qbMnsPsSYqsOPKR98aGEqMDFCWfFjfdjSRWtI9Rg6aSL12ZHn1MkXnVLSGyrKn+KgH/5U506Q60vY91Nzh7lH/U3HPs5uImvytp/NIL434u6+q6uvdgDSbw0x8nIVRGQfvayAoWh/IZSEvgwckTvKlKN02lpnxpjrqbcG+5gB21w3zps/sGDRdr8YPj2U+KAgF2FLxIWlVEimeyFGgczMp+Bqdzxs4NIA2cBdWD3Zex7ne/dRqLS5se1dGKZAwiIG47I/v+at74F9GAd0RNjQvCOxrMmflBw50s+w5O5Sk831E9rzvPED7Jd9pwGwfGubWrjZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0xQCOaXCUbiqKVErJtknJPJ5OSwZZLKkRbQgAxbiGnQ=;
 b=SjrejSFIeQwc9C6kcC6wpr+y5NIneGXTkzHh9wB28DTBFT051Amf5cB1Ws/acG6FCvGb7O1fSC7yMxp2IkJvRG2vi39Teu5ze59dInvE4O6xcJ6Tn+r/UrGbZrqKdh+dIOhUinzrmjj6Vsq4+rkFmtJvj3oHODd4RuxfllhO5cQ9tQs0wQMTg0gmKZv7qq/Q4XsS8NofvWMSwH+8w05HEpxdYV+tXeMA1A6esipBPFbSxwGVwaP0eZDo76y3AD09Z+174Gxle7vdaRY7ZzqtmIVHwvLhS9FY2B6mC8uSl+QDtgFhdSVUvgrdy2LVjXbdfQZ1yjORz6XCKOeBUn62Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xQCOaXCUbiqKVErJtknJPJ5OSwZZLKkRbQgAxbiGnQ=;
 b=TfssqYMW5D9PLb799gQ1zEmp/07V3ilhAyizN1UdF3NKMhseRdO7jErqjHu81oBAxDOCGZYSKYugpux9Dx60Fw2YLIGcWMTD5z3gLpzFMcmgEKhiU/ThgswcfqnKhlsijE+2g0bEAa9M58rddlUp4TRRgdR9KkwyDEM455FTP7g=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAVPR08MB8799.eurprd08.prod.outlook.com (2603:10a6:102:32b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 12:35:10 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7f73:806a:3493:7d50%4]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 12:35:09 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "m.schwan@phytec.de" <m.schwan@phytec.de>
CC: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 1/5] cargo-update-recipe-crates: Make
 do_update_crates() a Python function
Thread-Topic: [OE-core] [PATCH v2 1/5] cargo-update-recipe-crates: Make
 do_update_crates() a Python function
Thread-Index: AQHca0iJVO+siagMZkWsZL/sJzROALUeGQyAgAd2mACAADzmAA==
Date: Wed, 17 Dec 2025 12:35:08 +0000
Message-ID: <847A95B5-895B-4F4E-A093-79D281E507F8@arm.com>
References: <20251212091927.3741063-1-m.schwan@phytec.de>
 <CANNYZj9L7B0tO-qORtFM+2GXLXn2s6YOYo_P9Q3bnfSSBoWQ=A@mail.gmail.com>
 <7a5b8633ba244eb5be8cc14d4133cb271989d6f4.camel@phytec.de>
In-Reply-To: <7a5b8633ba244eb5be8cc14d4133cb271989d6f4.camel@phytec.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAVPR08MB8799:EE_|AMS0EPF00000199:EE_|AS8PR08MB8370:EE_
X-MS-Office365-Filtering-Correlation-Id: 8606fa5b-44ab-4c30-9e33-08de3d68dcce
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: 
 =?utf-8?B?aytFc2dNbkRkeHlGdXBzR0hzNmowajUzaytLRVVSRnYyWlNESTZlZ3dMaU1t?=
 =?utf-8?B?d0lrVTJDNUU1b09KM3VRMHBWL01uN252d0l6dWFuNnhNOS9wM3RuQkhxU3NG?=
 =?utf-8?B?YUNLalhoUnR5a1Qya1VJdFJWUDFIVURCa1NUdmRQSXhoanBiM3pCSlpYcndz?=
 =?utf-8?B?UlpIOUl3RzhYQm1lcHZIeFYwbGNQeW9mYnBYVjh0bFlqOWRsL3JtamRTUjFr?=
 =?utf-8?B?Vi9QcXFqMFl4TUV6VXpwVUFGV3BTV2hiV0pxaTM5M0Q0amFSTDJzZVg0M1dy?=
 =?utf-8?B?cDlHRG9sSkFlV0FvcTd5UlFiSVhXVXJVT3A5aDU5U1hleENoU2pjVkFzaVNK?=
 =?utf-8?B?YlpMZWxIalZ5ZXNBUFRPY0RDdjVaMDVIQU1SbWVYT2NDVGwyZERxUjBIZDFa?=
 =?utf-8?B?NVN0WW93am5MUzZ4bXI2UWg4VHhrM04rVGFjMjJXNENhbTQrcVpta3pyL2hu?=
 =?utf-8?B?bXZUektEeERORm5zTHpHUUdiQmJxNnEwZHVWQllva1J0SHh4N1NpYm9hOWVs?=
 =?utf-8?B?S1VwUWlnanI2R0ZPNHBsdWZROVp4SmVPSHJxbmo4d0Z6N2FUdENaTjdWYkNF?=
 =?utf-8?B?SmtXcUJMT3ZRT09TRGlRS01hd2YxWTNxbU45U2tiY2VCTWVGcVdhaFhydkth?=
 =?utf-8?B?UW05SDJveVQ3Y2puanFJcVdNaWs1WGRJV0xtcm5vclE1VjhNVXRWTng0UEta?=
 =?utf-8?B?bzRlM1d3ZEQwaWJUUVppYlRlRGtMd1VMVERlY2cvc3RxY0tRdGJVWHFKQno4?=
 =?utf-8?B?Z0k4REJjcVhLOHc5Sm1LUU9vZkYrYmdpWGdvSDRQRkR2STd1dkdDTGkzKzZ3?=
 =?utf-8?B?R0JHeFA4NmVhNkZ5M0grZzViOFlndE1hY2Q4UHBDNDE3OUZrekJFcmFmd08v?=
 =?utf-8?B?dVd0bWwyRy9tNEQ0VzgvczBERXBPd3BEM0pUS2laNmZudkxWWUdMK0xSc05l?=
 =?utf-8?B?cG5WNmlMRVROZW1RMkFmNHNZdmtuV0NsTGFpMFBOYysybDVHelV4NWRMOTd5?=
 =?utf-8?B?S0VIM1MwUHAvdERrT0NzdzZ5dVB3K3dBUkhXeVB5TkVKeS9ad2QvNE1RakVM?=
 =?utf-8?B?ZGZoQTd6d3FxTkZVWU9uemlmZHIzYjRKbTBRYnF4WVBtbmNBNTVVVTk1eGp4?=
 =?utf-8?B?ZGN6SGl1Q3RNTVJyWm1zMnNYRFZpaDJWQVRVMTFnY0xlZ290dzRYcDl3Z25q?=
 =?utf-8?B?ZHU4Sm9tRzNIQ1p5ZjVPaXprQTdEWFo5WFlHQnZ4bjI4WnM0NkdjaUdRQUZl?=
 =?utf-8?B?dVdmSWZMSWlaUHpudGlUQ3lvM3B3bTI2b0QwZDRCdk1PR2podmYvZmVsbTQ4?=
 =?utf-8?B?eFIzcW1vbzVVVCtmUkFYbklDQXhtY3h5VTNSbUd3OU5kbjloWDE0bUVubTMz?=
 =?utf-8?B?THNhMTBpYmVQMlV5bmhxTmsrQXZHWTVkMDJTUGprNkpsNExobENoN3RUb05T?=
 =?utf-8?B?aW5GWHhMY3ovVGJpempocDhsRkUwR2M3R3FnVHJScTFGN3ZpU3NkcGNMQ1BM?=
 =?utf-8?B?MTEzM1Qxa1pEcXpjK0tNMmRVNkF5YS9JNnliUEJST0JnRnJwZStidG42a003?=
 =?utf-8?B?WG9reE1QczlBVjdUaU8rNEVlNzF3ZFR4ZFB3NU41STRTZDA5bnJwUDExR20y?=
 =?utf-8?B?Y2R6RWlJVjFUWWtsRkRYdVVjcTRZQXRZN0lNOW1tdGNzWHFvM21XT0xycmdy?=
 =?utf-8?B?K3ltUjI2ejdxYktrYm9kN05kS0VWMG1nQkYzV1Z6eUhsdVlMZ2hST0tXR3JD?=
 =?utf-8?B?QU1xNzhzcnJOclY5Zi9qK1U3dmU4R0JDdzNzM2dMQW8ycWkyOHFKeG1ueVJZ?=
 =?utf-8?B?cnhNOFNWSHQza045ZmlucFltZ3VLeG9oN2NxaTBNVWc5TjVEMGlYanU2SmJR?=
 =?utf-8?B?UzN3a1ZTdHh4WDBRSjV0Wm5BckJnb0xjbytQZndvRVU4MVBLdVRoWDRpZTZx?=
 =?utf-8?B?TDByeVByNmx1b1hzZVQyS3BIeTZFWm9JOEduNXNQVnlJenUrWkk5K1NPTzRk?=
 =?utf-8?B?RmR5VWdsMXU1MjZyNUVVSFlqOHdOM3pQb2RGNXpxcTRSVXFZVDZyUGdYYVJz?=
 =?utf-8?Q?WPI2nR?=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F392B8CB97FBE64F8305F058E5F8F917@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB8799
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	35689589-b899-4804-8548-08de3d68b702
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|35042699022|82310400026|14060799003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TVZ2L3d5WFgwUEdqV3JIWXVvMDVJTW1xM0pKY3h6VC9FdFBLT25lMWwvbWtP?=
 =?utf-8?B?VHBJdVNtZUxCV3lqQjRsc0doaUQwcGsvaTljbmJiQ05xSTM0cXNUU09UYVh0?=
 =?utf-8?B?Uml0K1V4YXM4L2xVeDBMa1F2R3QrYUZhamJleW5uZHk5OFMyZUxFWU9YTUdR?=
 =?utf-8?B?VmEyY2ZJbnZqSWs5OHBQa2hrYVFTSjNFN1kyUUhhVEtWejduNnZkNEpmLytZ?=
 =?utf-8?B?WUh1dXRpT1FkWmdnN3NveGYzR2k1alpHeVVoZlprdTdnVWZUQXhaa0lKL2pl?=
 =?utf-8?B?RXBnWDNTN1d1MDd6VmEwc2ROTXhPd1JSSUVjY1RrOTR3NTRZWlFib1hLRytB?=
 =?utf-8?B?UmUreGZJN3dUM3Y4dXlISFVxQ1MralcvM2pzcjBrbEFjTVUyMVNMZ0MwTHJK?=
 =?utf-8?B?RlRrQUpldElndVl2WUFMb21NalQxd1hqT29LUnA4MnlDbnpibmRka0dEbEhV?=
 =?utf-8?B?VEYrOTVRa1Jmd1BTVVA4UTBqZjI4SjhxbEhTeGRWSlNjTzVmWVRQbC9iZWtr?=
 =?utf-8?B?UmV1Rlh4VS84aktiTURXQnhjeCthOGlycElCbGhPOXc3RkZON3VaODJ1TXhZ?=
 =?utf-8?B?YXYrSVhtMkJHdHdRYlZxSWdHbVpUQ0tBZjlBdjhnYVRWWW9RbnFkUFQ3OGUv?=
 =?utf-8?B?TFE3dEx5VlFlOXRucm9VMFh5QWc2bFp4SGpwL3plNHRhb3BEZmIrNVZBVUtV?=
 =?utf-8?B?SU5zcGRIN2xkbjZQb3l0T241S0pJL21xV01hSk4rY2ordTF1K001YnhkekZh?=
 =?utf-8?B?WFFEeHlnTFlPVmNlVDNHZkdLK3JVbUhxRURUSDRoR1Q0MGZmbWVFc1ZlQklI?=
 =?utf-8?B?UmV6dHpEMUxnMGFVTGRkYUpCYnpyQXdjb0VRV2haT3VBN3NIVGlxZmc5QmVG?=
 =?utf-8?B?RzZ6LzVrcnRsSW41SDJ3bnRpS2dKVER4VFYrK0tOb1BGZ2xBeVNtak5aQkt4?=
 =?utf-8?B?Qmc4SnRIZE00YTBkSW9ib2hXY2FTelN6eDlkOEY5ODNjWFVlTWg0RXJPaVYw?=
 =?utf-8?B?bkhSRzNMSnhRbjZYVEpyaU9NVUhuUXc5V0hhTmcvaE5Ud1Y4V1Rid3poS1pO?=
 =?utf-8?B?YzNBQTlIZWZzL0lCYnFzNzRDSldlL1l5cDVYTzRkOVNNYmxxU3QxdnFwK0dX?=
 =?utf-8?B?b0J4Qm53VUh3UzNWNlU2RHU4c0NpQlpKamVWMTU3WFUxMHY4L080MFNZdHJx?=
 =?utf-8?B?a1VQZ3E0Q0ZRalFtTC9YUFNLT3hnZnpyZTFtZUtlUitvMHZERldlZXR5dEpJ?=
 =?utf-8?B?d1d5Zml3WDR3b1REUnZpYlcyNXhsVTUyUS9DYlBXUXZ2bFZPM3FuU2lsQWk4?=
 =?utf-8?B?dy85ekVqRitSQ01RemFSTXBCcjVEOTliakwwQ0xET0hGaXNmL2dPYWc4dEs0?=
 =?utf-8?B?bC8zMVNuTnRMYXNtditKT1BCT0k3aXgzWVpMNk1qS2k5dnZadFRoNWdmYWM0?=
 =?utf-8?B?NkUzQjZDQnJvL2hHR1luaTNsaHpReW9PclB3aGEwbGhjNGhWNXJrOEsrdDFV?=
 =?utf-8?B?dlU4eFpHcDJuWVE1WTVSZ2FpT2JwMnVIYnhsait3eEZUTUgybmx4cEovUXZW?=
 =?utf-8?B?N1VkN1lvSCtRWWpSVVZJVXpxQm0xdk5NbnM4d2JnM1lJMDNKRkRzQTlBWis1?=
 =?utf-8?B?TjNOeTZyS25OcWp6WHJsVHBtNGhCbmN0L0psQ1VodXM2MnhVZEt5OGxFU3Jj?=
 =?utf-8?B?OFdsdVcreHcxRVYya1VYSmVHRU5CUkxTMWNmUWp1V1hRWDFkakJYSTNzM0Fh?=
 =?utf-8?B?MkFRTVltaUdEdzB1LzJqRlQxTlVRUkdvWDA0UlNoREhqOS9wbSsxRXRYYjBH?=
 =?utf-8?B?bEgvUEdpV2ZJTmtoVlRnVmZYVjh5MzUvMjdSRTVBYkZySVhFQnBsdEYzRzh5?=
 =?utf-8?B?Sll3bldPZDcvY0VtRWVWSDNSOFVpMXlyMnVZemYrMUo3Wk5EbXBlNDRUNE9n?=
 =?utf-8?B?RTN1UmNkS3p3K0IyN2lCVFFrbU9ESmQ0OEN0UUhxMzFzRzVMTTVIZUxtZ2Za?=
 =?utf-8?B?Sjk3WjVYNDl2SGhsRDBUR05RYmtLbHJBQ3d4dnRydEdDYWxVbm5sMkxQN1ht?=
 =?utf-8?B?Vm9wSHM2aWtacUV3N0dHWUtkOVZkY3AwRWFOblJ5VGUwaGVTVTN2U1JJQ3Ar?=
 =?utf-8?Q?AE6g=3D?=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(35042699022)(82310400026)(14060799003)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 12:36:12.2768
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8606fa5b-44ab-4c30-9e33-08de3d68dcce
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF00000199.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8370
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 12:36:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228035

T24gMTcgRGVjIDIwMjUsIGF0IDA4OjU3LCBNYXJ0aW4gU2Nod2FuIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxtLnNjaHdhbj1waHl0ZWMuZGVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3Jv
dGU6DQo+IEFyZSB0aGVyZSBhbnkgcGxhbnMgdG8gbW92ZSB0byBQeXRob24gMy4xMT8gUHl0aG9u
IDMuOSBpcyBub3cgYXQgaXRzDQo+IEVPTCBmb3Igc29tZSBtb250aHMuIEkgZG9uJ3Qgd2FudCB0
byBvcGVuIGEgY2FuIG9mIHdvcm1zLCBidXQganVzdCBsaWtlDQo+IHRvIHVuZGVyc3RhbmQgdGhl
IGZ1dHVyZS9pbnRlbnRpb25zIGluIHRoaXMgcmVnYXJkLg0KDQpJ4oCZbGwgaGFwcGlseSBlbmRv
cnNlIGEgcGF0Y2ggdG8gdXBncmFkZSB0aGUgbWluaW1hbCBweXRob24gdmVyc2lvbiBmb3IgbWFz
dGVyLCBidXQgdGhlIGZvbGxvd2luZyBuZWVkcyB0byBoYXBwZW46DQoNCkZvciBldmVyeSBzdXBw
b3J0ZWQgZGlzdHJpYnV0aW9uIFsxXSB3aGVyZSBidWlsZHRvb2xzIGlzIG5vdCBhbHJlYWR5IHJl
cXVpcmVkICh3aGljaCB3aWxsIHByb3ZpZGUgYSBuZXcgcHl0aG9uKSwgd2hhdCBpcyB0aGUgUHl0
aG9uIHZlcnNpb24/DQoNClRoZXJl4oCZcyBhIHNjcmlwdCBpbiB5b2N0by1hdXRvYnVpbGRlci1o
ZWxwZXIgdG8gYXNzaXN0IGhlcmUsIGFuZCBpdOKAmXMgZWFzaWVyIGZvciBtZSB0byBkbzoNCg0K
WzFdIDEyOjIzOjE2IFtTVUNDRVNTXSBhbG1hOS12ay0yLnlvY3RvLmlvDQpQeXRob24gMy45LjIz
DQpbMl0gMTI6MjM6MTYgW1NVQ0NFU1NdIGZlZG9yYTQxLXZrLTEueW9jdG8uaW8NClB5dGhvbiAz
LjEzLjMNClszXSAxMjoyMzoxNiBbU1VDQ0VTU10gZmVkb3JhMzktdmstMS55b2N0by5pbw0KUHl0
aG9uIDMuMTIuNw0KWzRdIDEyOjIzOjE3IFtTVUNDRVNTXSByb2NreTgtdmstMS55b2N0by5pbw0K
UHl0aG9uIDMuNi44DQpbNV0gMTI6MjM6MTggW1NVQ0NFU1NdIGZlZG9yYTQyLXZrLTEueW9jdG8u
aW8NClB5dGhvbiAzLjEzLjYNCls2XSAxMjoyMzoxOCBbU1VDQ0VTU10gZmVkb3JhNDAtdmstMS55
b2N0by5pbw0KUHl0aG9uIDMuMTIuMTANCls3XSAxMjoyMzoxOCBbU1VDQ0VTU10gb3BlbnN1c2Ux
NTUtdmstMS55b2N0by5pbw0KUHl0aG9uIDMuNi4xNQ0KWzhdIDEyOjIzOjE4IFtTVUNDRVNTXSB1
YnVudHUyNTA0LXZrLTEueW9jdG8uaW8NClB5dGhvbiAzLjEzLjMNCls5XSAxMjoyMzoxOSBbU1VD
Q0VTU10gdWJ1bnR1MjQwNC12ay0xLnlvY3RvLmlvDQpQeXRob24gMy4xMi4zDQpbMTBdIDEyOjIz
OjE5IFtTVUNDRVNTXSByb2NreTktdmstMS55b2N0by5pbw0KUHl0aG9uIDMuOS4yMw0KWzExXSAx
MjoyMzoxOSBbU1VDQ0VTU10gdWJ1bnR1MjIwNC12ay0xLnlvY3RvLmlvDQpQeXRob24gMy4xMC4x
Mg0KWzEyXSAxMjoyMzoxOSBbU1VDQ0VTU10gc3RyZWFtOS12ay0xLnlvY3RvLmlvDQpQeXRob24g
My45LjI1DQpbMTNdIDEyOjIzOjIwIFtTVUNDRVNTXSBkZWJpYW4xMS12ay0xLnlvY3RvLmlvDQpQ
eXRob24gMy45LjINClsxNF0gMTI6MjM6MjAgW1NVQ0NFU1NdIGFsbWE4LXZrLTEueW9jdG8uaW8N
ClB5dGhvbiAzLjYuOA0KWzE1XSAxMjoyMzoyMCBbU1VDQ0VTU10gb3BlbnN1c2UxNTYtdmstMS55
b2N0by5pbw0KUHl0aG9uIDMuNi4xNQ0KWzE2XSAxMjoyMzoyMSBbU1VDQ0VTU10gZGViaWFuMTMt
dmstMS55b2N0by5pbw0KUHl0aG9uIDMuMTMuNQ0KWzE3XSAxMjoyMzoyMiBbU1VDQ0VTU10gZGVi
aWFuMTItdmstMS55b2N0by5pbw0KUHl0aG9uIDMuMTEuMg0KWzE4XSAxMjoyMzoyMyBbU1VDQ0VT
U10gZmVkb3JhNDMtdmstMi55b2N0by5pbw0KUHl0aG9uIDMuMTQuMA0KWzE5XSAxMjoyMzoyMyBb
U1VDQ0VTU10gdWJ1bnR1MjUxMC12ay0xLnlvY3RvLmlvDQpQeXRob24gMy4xMy43DQoNClRoZSBk
aXN0cm9zIHdoaWNoIGhhdmUgPDMuOSBuZWVkIGJ1aWxkdG9vbHMgYWxyZWFkeSwgYnV0IHRoYXQg
bGVhdmVzIEFsbWEgOSwgRGViaWFuIDExLCBSb2NreSA5IGFuZCBTdHJlYW0gOSB3aGljaCBhcmUg
YWxsIGxvbmctdGVybSBzdXBwb3J0IGFuZCB3b27igJl0IGJlIEVPTGluZyBzaG9ydGx5LiAgTWF5
YmUgc29tZXRoaW5nIHdpbGwgaGFwcGVuIHRoYXQgbWVhbnMgd2UgbmVlZCB0byB1c2UgYnVpbGR0
b29scyBvbiB0aGVzZSwgYnV0IHRvbWxsaWIgaXMgcHJvYmFibHkgbm90IGdvaW5nIHRvIGJlIHRo
ZSBpbXBldHVzIGhlcmUuDQoNClJvc3MNCg0KWzFdIGh0dHBzOi8vZG9jcy55b2N0b3Byb2plY3Qu
b3JnL3JlZi1tYW51YWwvc3lzdGVtLXJlcXVpcmVtZW50cy5odG1sI3N1cHBvcnRlZC1saW51eC1k
aXN0cmlidXRpb25z

