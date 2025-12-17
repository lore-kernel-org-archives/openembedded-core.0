Return-Path: <m.schwan@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B91D65C46
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 13:08:16 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.125])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14470.1765976889747098804
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 05:08:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=selector2 header.b=hLA2XE7Y;
 spf=pass (domain: phytec.de, ip: 52.101.84.125, mailfrom: m.schwan@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G3KRYjPGwTbXYCYWVWHqJqGai3Jx4lgjd0Dydw5nAkv2bFw8A3AYkWHSKssJBDZnPG2Ze1aIMoQgUsOx1Km4osYO94g9JuveAhEcppousihhPG6VVGmREOI0BFAMW03ne57xk41KSOdZqDGL7AbLP1LChFuQP1IcQ4QQbshDPmDevExBRQKvxDuGrcgaeZ31wLq5Gt9sq25uU+gz1kKnMCLvM5ACnuAC8x/UkYQBPFFNHEwHwPvpeSIfWPngmea561j/AcAIc9kTr9t0DIjcx+NV2tIIqwvSOPArlQLuC3qfASfWpb7MKipCN8X2qmi3aNEz6wZZVoTh35Ygt2eF1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLshBS4YIzvRnWm+8nPjynRnytnfP++bdLH+auwReac=;
 b=vVQTP/J5OTT7ndxFH0UnoNZau2M/4nMk8zWpOlo+n/KX55EPLEELWwo0PHy9sKlnjSxaUgDOQ7/03IkIUe4vjibuDvPFBvnaUnak9p6ZEpevHqPk4ILocmN05nvBErcv9VvpbXH132AawXTiSBFrwfK2/YdVI5XWAY16rQTTITMhCfXf2pBZKPsg1aTKYG1qjQfIrkAysAkotw8kWuuElEI42LDVpGevN7ydr9FULRcKOnWCscFaQtL601AtsEroFWehBaMgdUH9TYSyo5CX0KNQc/lWB031gADVobjJAtSl4MIh8qfx7GJmBIGkJa58la1uljRg2xsUYXg1opdA8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLshBS4YIzvRnWm+8nPjynRnytnfP++bdLH+auwReac=;
 b=hLA2XE7YTc4UoED8skGg5QbQWM8kB//i1mWgQcv0ERKLSGiWZjLo9QUWWbHhd1/QUifD/rXOPm8IvO/srUCKBTpOSFL9luDrst1zOVwocSaZtARsWx8Ul4MYNRcivHvAbc1ylQ2tYwJJGLiGdMTelHZxQNlgondm0djG1vuA1Qv6J+pkjN3hf8kmG3YP1VzfDt4MhEp21l0VKgYrRBvs0RSsNy13IR5E7KqwhbMaUAfACmQ9xHfQ05nwVwwRBFjFs+RcAOhsPTjhWvh2+hbk+lUuQ19bJwM0BOfs2g49xnRy30H4g32MUvVDdY0uaoxCPEeL0JJbPwP7a2St/HF7Mw==
Received: from VI2P195MB2489.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:22f::12)
 by AS8P195MB2269.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5ad::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 13:08:02 +0000
Received: from VI2P195MB2489.EURP195.PROD.OUTLOOK.COM
 ([fe80::83ab:361:2a81:b582]) by VI2P195MB2489.EURP195.PROD.OUTLOOK.COM
 ([fe80::83ab:361:2a81:b582%4]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 13:08:02 +0000
From: Martin Schwan <M.Schwan@phytec.de>
To: Ross Burton <Ross.Burton@arm.com>
CC: Alexander Kanavin <alex.kanavin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 1/5] cargo-update-recipe-crates: Make
 do_update_crates() a Python function
Thread-Topic: [OE-core] [PATCH v2 1/5] cargo-update-recipe-crates: Make
 do_update_crates() a Python function
Thread-Index: AQHca3faro8arn/mtEStyolGWLWsy7Ulj0SAgAA89ACAAAkxAA==
Date: Wed, 17 Dec 2025 13:08:02 +0000
Message-ID: <b6e7ba66c686e26ea89e1485ebe0c30f1b9c6041.camel@phytec.de>
References: <20251212091927.3741063-1-m.schwan@phytec.de>
	 <CANNYZj9L7B0tO-qORtFM+2GXLXn2s6YOYo_P9Q3bnfSSBoWQ=A@mail.gmail.com>
	 <7a5b8633ba244eb5be8cc14d4133cb271989d6f4.camel@phytec.de>
	 <847A95B5-895B-4F4E-A093-79D281E507F8@arm.com>
In-Reply-To: <847A95B5-895B-4F4E-A093-79D281E507F8@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI2P195MB2489:EE_|AS8P195MB2269:EE_
x-ms-office365-filtering-correlation-id: f075f59b-3b0d-4496-4198-08de3d6d4f4a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?MFRhOFhyejRYbHNpc0dmTXduTmkxU28wcFRlbFRqVUhtTlBmRm5WRytvbzFZ?=
 =?utf-8?B?dG9PNHpFMnZ2bXUzeVRxdjBpMDJPNEhBRFpEUHNGSm9tUjB4TnFlcTcvVmRD?=
 =?utf-8?B?ejZWaHJuTVJ6VXBRamFWSFAyZ3VtL1JMaXIzaUVsZm5oTXdXMEdSOVYvSzY1?=
 =?utf-8?B?RHZSTUlaNVBodXNMMUg5d1c3ZGNYNXUvMUExWlVwREJldVlLbjhJLzJUU3Ji?=
 =?utf-8?B?ZnpwdktSLy9UZVBjWkx6V1NVUDcxeUZVcUpkcDJaWStvNGZQMXVlQmlHZ0pW?=
 =?utf-8?B?bzJGRFNNUGJEWkdxTXFNN1p0b055ZFdKb3RvQVNMR2x4d1ZOVnBKOG9sSUhj?=
 =?utf-8?B?SHJFTzhDWUJDNUVkamt3d2dGWnNsalRha1pTSGVGUGViVGhNOUsvQUpqc1hU?=
 =?utf-8?B?WlQrMkxaUjFrR1JyK1ZRVG93OGZCU215bEVLRFdVQnhHU2xJRE5JREVOa1Js?=
 =?utf-8?B?eDdYV21qVzY3Y1MvMlFTZnpQeGlmZ1g4c3BYME9jc2Qya0QyQzV2MWFYaE41?=
 =?utf-8?B?dzBicVFXMXBKY2dZUzFidm9Kb1RFUFkvNXczcEgrU200T2g2a1Jic3VGZTgy?=
 =?utf-8?B?RUtsV0lmMlByeXc2MDN3Qm1rd3lycTlUUVJmRzR3S3JZZzF1VDNPZmdzVWJa?=
 =?utf-8?B?c2NTWW5YcVIwcUZOU0FWNGYrWUpiRDBMRkExZjFJVWJyTWpFN3FiQnZ4Umts?=
 =?utf-8?B?YkQ3dWNEYWVOZkd6QmNSYUJoSjFFOG52SHgrNmFhT3g1RnQzVXNVVVhNQUNW?=
 =?utf-8?B?YTRJMFJxTlN3QjFydHVvNXZNNTA1N2NWUnZ0U2UrV04yTFBqQWhWR28xTXFS?=
 =?utf-8?B?UmYxK0pXejRkRUlPOU9hSUtEME15Y1o2Y2xJTlpsb3FoUHVEQjNQT2FQVjhk?=
 =?utf-8?B?OGVYLzU0RFA1ZXZtOTZoMkhCUDRWMGl0TFRzOTZ3T2taWHBqZUJDcUZjTkdn?=
 =?utf-8?B?RUxvb2tybUxsVWlUTFF1blpTUHIrRkROdytrZXEyblZ6cjVPTWM3VjE2UUFx?=
 =?utf-8?B?ZmpPbEFpLzZGWXJDSXorMGFoZFVHY205akw0K05Mc1FmSUcxTThOZWJQek5U?=
 =?utf-8?B?UXRSbWYrR28vQzlra2tMR3RLSFREUFowUkg1Yzk5Y0JzQTNxWEhBU0FtNVIv?=
 =?utf-8?B?K0lnbWpkSHpDVkhMUThSVjlvTnR5M00wZlFiTHl2YVJwTitpTFh1Y3hTK3Zm?=
 =?utf-8?B?WWRXZUVUZ3pSMXlzaGFSOStjVDMrNGIvQUZJZGxEclpsbXQ5M2pEQ2VEZ0tu?=
 =?utf-8?B?SktuMUVWMFpYTVNldGtaRGkxRktBTjNNRjEzc2pGY0dwSGh5T0RxRkpBSm1X?=
 =?utf-8?B?RE5xWkV0RklnektXQzJPdXZnQlU5QjR2Ny8rSDJsVUNZUGlodjhLajNQUzRm?=
 =?utf-8?B?aERNY2ZZcXlLRStybmJ3N3dSWk5mNEI4MUJFTTg3NXJxbmhVTzVDa2JRNlU1?=
 =?utf-8?B?VWFjYS9Obkx4ZzV6ZG50bGtPMVYyM2NPSmoxWGxNUkNZdGcvKzVLSVJIOXYx?=
 =?utf-8?B?YXN0UXdkSmFCVmNmVXF1dnF6YkdWdHhZVWx3eGIxd00yQUNYdkxSS3RMV2gr?=
 =?utf-8?B?dzc0Wkh1NEEzdWtab1YwL1YrSndqdHZ1SUd5UXhlZC94dXlhMDYyU0cyQkUv?=
 =?utf-8?B?Ty9jODNpdHA1eXJHNmFzeGQ5MHloREdUZmxGeXFBU1FyTWlKbldnMENTeXdo?=
 =?utf-8?B?aEdzZ0dXTHdQaXZvY01Zc2hEVzBpVDc2MFNMb21oeTRVMWsvUHk5ek5nNTVR?=
 =?utf-8?B?b2kzTVJ0YkRlK1J3dUdBazg2Y1QxTHY4Tng0ckNLOWRBdXFuNU5Ta0hOR1NJ?=
 =?utf-8?B?MWp4SW90WGtXaVhHYlNmS1RtM2VEVURjd2ZveDFiTGFheXhuVmRZTmoyVTVK?=
 =?utf-8?B?bWdCZUlVUG10Q0pGdEF6S0p4ajBTYW1PWHRPRmE2V0ZVNDc0cmpEOEtIQ09X?=
 =?utf-8?B?Ky9ScmZLbklKQWI5VDFTNjJqcXpCOUJzWTg3bFBudjErS2RIZXNEeDJuNG5p?=
 =?utf-8?B?eDB3bFlwU1lSa0FHU3EyZlZyQ1lNbzdsa3BFdmEraGk4UzRjMHd5bEVlTVdD?=
 =?utf-8?Q?5H3z7o?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2P195MB2489.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aXB4UUJMenhTcDVrdkFqdFluVFRKRThuVkdRM3g2eXl6TmJic3FJOEtqbDB3?=
 =?utf-8?B?OEV0YUhhdW9NdHYrbGVxQUNtaWUrb0RidDlwenh2UUV5VjNrTDhDekFaWCs1?=
 =?utf-8?B?bGFtQURNZUJYRjgzMFZUSnhsYmQ5di9OWHRkRTN3c0MyYWJHamMyZjdqRDIx?=
 =?utf-8?B?ZENuaDFWTUVMQjZMYlRGRXRzd0JwZmcxbG5xT2dWTnlUcEFTQTA5SEN5Z0I1?=
 =?utf-8?B?SnAvd0N1WlFQQjF1SXFiS1JIdFp6VWdEdGd5SVFsY2dPUC84U1h0bzV1L1Ru?=
 =?utf-8?B?akJRUlJ5bDlXMGk1KzhCMEpBRzBTYWluYXRxRUxGRnQyV3d4Nk1waTI4UXA5?=
 =?utf-8?B?d3ZHT3RFSm9MUEMwTWhRL1JQSlFTWW9DOERaUTRBdVZLSmFJVFE0K2ZPdWJl?=
 =?utf-8?B?V2N2eGoydi9tYm95N2VXMHA5WWR0eTNRc0pTOE5yakdiaEVoSzZZc2IxOS9E?=
 =?utf-8?B?b1hCbWtaUWN2WGtrZ3BXdTZ4TWlBRTFrNld0VUpqWlN4WHRBeXdmL2RFOXVw?=
 =?utf-8?B?bWxRV2pWVTBUMnF2cjRwbEhGRzFJZVl1cFkxbzRIK1UyTGJpRGNjZC95dDI3?=
 =?utf-8?B?ODY3KzA1bkV3NGM5OXJXaVhSWk41d0Uya1krWVhRL01lbkk5OFQ3MGRkMzZI?=
 =?utf-8?B?dFR1RmRCMGJ3VkE5dDZRV1ZYWDdMU2djam1GSXhtWUhJdnFqbEhBcStlSlcv?=
 =?utf-8?B?QWEwbEk3OENrM1dtUXEvR0hrSldKNko2VDlWbGRwYS9rQVZMRkZrZCt5VHpL?=
 =?utf-8?B?cFgxbjg3TWNpdTBjQWZMS2M3Z0RGZkRjUXl4R1JOK3hkQVRGZmRhMjNXKzht?=
 =?utf-8?B?YzlNWitQNEcyRVlCWmdnanNlRTVmRFVXcUVRTHpIdndNaGRTWVRvUUc5dDd2?=
 =?utf-8?B?VHBybllhWUh3S1VDTWxGLzB1QnJHZUt1eGR0dWVMdzN1WGZWU0pTV3RnVHpD?=
 =?utf-8?B?SnB2d2NNODRMZnBSZkpsQzNXQ0xITHE4OGx2K0l6dFI5U0dITG9GWE5IU0Y2?=
 =?utf-8?B?S3U2QTNsRnBCL25VT0FyL1JERjQvdmsrd1ZUbnNrSXVJZ1RQYU1YVjFiVmk0?=
 =?utf-8?B?U21ldEp1aHRSNER2NDQvYUV5M1dLNWdtNUZXaHozV1RhaXhHRVEyZUZyanM0?=
 =?utf-8?B?aElpbnBVT3d6ZGZxL3BPV1JocnZpL2l1SU9FbzRweDVTZURyZ2pLRGpRaGlU?=
 =?utf-8?B?dStQc0N4N2VBWXVFcDVLK092L2tqRnhWU3hOOGVjM0hYWFFJZmZnOFlJUVZh?=
 =?utf-8?B?TnpDYmdUWUVhZ1pIVE9xa0ZzVW9GM2dWZW5NTDRYVDZidXVoZUJYRXRuQjVa?=
 =?utf-8?B?clhXN1NqUjFVbXFMOTZ1WE5ibVdsUHptb1k0bExwVFdSSkEzUzYrWDN6eUh0?=
 =?utf-8?B?cDY4cDNrcEJNQjdNNFFCOWl0VlRnbXpDVEdqeklZQ051RVVFU2tHZHdHaGdo?=
 =?utf-8?B?WGxuMms4K083di9PTEVSUVpaSEJnN0ZtREc2Mm1GMllXWmIzY2JIZ3IxZnli?=
 =?utf-8?B?bmp3M1lSRnZwOWJyRjNvQ0NsL0dUU2trNVVsK0VmU0pkcnlBeml4SURiV1RX?=
 =?utf-8?B?Skt5eUJVK3VBYkljcmt5ZmtoaC9JUkJPS3lnelVJYUdYMC8wZENxL1ZiUDd6?=
 =?utf-8?B?VTlpaFRrT3lueEVEMkR0cllBbHBaUGNaV3RsR3dvM2lPQ2tsZzcvRjltZDRq?=
 =?utf-8?B?TFBvSlczOFpXRHpnVnhZT1BwTkxtek9CdHU1Yis0Z25sRm1jZUJUMmNUWS9l?=
 =?utf-8?B?VlAxam1mVTgrLzhSRlpzaUppbHhzelVUZ1R0NVNkWmdYYTBNcTV6MkNENElJ?=
 =?utf-8?B?UEJFVmlrcDV6VElZemNVSXYxZm1aSnVBWlRVUE0rR0M5NFcyc1ZOUU1FbFg1?=
 =?utf-8?B?QlZycWxGMW9EelFOZHlCZElKQ0trVjNFaEtuYWdtMEU4cHBZNHVvWW9Bb0Jy?=
 =?utf-8?B?MDY3QnlKVUZERExTV0JNc0pudXZscHp0Z0JWL2I0MEh3OEN6WDdkTHIxR1Jm?=
 =?utf-8?B?VWp5dlh6eWRWbVJNL1I2T0JWOC9ZekRHLzdxUFY1ZFNSblYxS2hyb3hCdk5H?=
 =?utf-8?B?RFpZZUV5dEJhaTdaT0xibFp2b2NQUFFMQnRXRTlZRWxWUTgxbWkyTzVrQ2ho?=
 =?utf-8?Q?hlSc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <935D425D78D78B43B556ECC298B169F4@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI2P195MB2489.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f075f59b-3b0d-4496-4198-08de3d6d4f4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2025 13:08:02.3761
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: COXaIRAbCTJP7xcmQzBQg4nMDffyraFxirO4OO5C6yGdmjoqvDv1jcXXtSh4VBjXM9kj4d3gzqletp6QbcmVAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P195MB2269
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 13:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228041

VGhhbmtzIGZvciB0aGUgYW5zd2VyIQoKTWFydGluCgpPbiBXZWQsIDIwMjUtMTItMTcgYXQgMTI6
MzUgKzAwMDAsIFJvc3MgQnVydG9uIHdyb3RlOgo+IE9uIDE3IERlYyAyMDI1LCBhdCAwODo1Nywg
TWFydGluIFNjaHdhbiB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZwo+IDxtLnNjaHdhbj1waHl0
ZWMuZGVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6Cj4gPiBBcmUgdGhlcmUgYW55IHBs
YW5zIHRvIG1vdmUgdG8gUHl0aG9uIDMuMTE/IFB5dGhvbiAzLjkgaXMgbm93IGF0Cj4gPiBpdHMK
PiA+IEVPTCBmb3Igc29tZSBtb250aHMuIEkgZG9uJ3Qgd2FudCB0byBvcGVuIGEgY2FuIG9mIHdv
cm1zLCBidXQganVzdAo+ID4gbGlrZQo+ID4gdG8gdW5kZXJzdGFuZCB0aGUgZnV0dXJlL2ludGVu
dGlvbnMgaW4gdGhpcyByZWdhcmQuCj4gCj4gSeKAmWxsIGhhcHBpbHkgZW5kb3JzZSBhIHBhdGNo
IHRvIHVwZ3JhZGUgdGhlIG1pbmltYWwgcHl0aG9uIHZlcnNpb24KPiBmb3IgbWFzdGVyLCBidXQg
dGhlIGZvbGxvd2luZyBuZWVkcyB0byBoYXBwZW46Cj4gCj4gRm9yIGV2ZXJ5IHN1cHBvcnRlZCBk
aXN0cmlidXRpb24gWzFdIHdoZXJlIGJ1aWxkdG9vbHMgaXMgbm90IGFscmVhZHkKPiByZXF1aXJl
ZCAod2hpY2ggd2lsbCBwcm92aWRlIGEgbmV3IHB5dGhvbiksIHdoYXQgaXMgdGhlIFB5dGhvbgo+
IHZlcnNpb24/Cj4gCj4gVGhlcmXigJlzIGEgc2NyaXB0IGluIHlvY3RvLWF1dG9idWlsZGVyLWhl
bHBlciB0byBhc3Npc3QgaGVyZSwgYW5kIGl04oCZcwo+IGVhc2llciBmb3IgbWUgdG8gZG86Cj4g
Cj4gWzFdIDEyOjIzOjE2IFtTVUNDRVNTXSBhbG1hOS12ay0yLnlvY3RvLmlvCj4gUHl0aG9uIDMu
OS4yMwo+IFsyXSAxMjoyMzoxNiBbU1VDQ0VTU10gZmVkb3JhNDEtdmstMS55b2N0by5pbwo+IFB5
dGhvbiAzLjEzLjMKPiBbM10gMTI6MjM6MTYgW1NVQ0NFU1NdIGZlZG9yYTM5LXZrLTEueW9jdG8u
aW8KPiBQeXRob24gMy4xMi43Cj4gWzRdIDEyOjIzOjE3IFtTVUNDRVNTXSByb2NreTgtdmstMS55
b2N0by5pbwo+IFB5dGhvbiAzLjYuOAo+IFs1XSAxMjoyMzoxOCBbU1VDQ0VTU10gZmVkb3JhNDIt
dmstMS55b2N0by5pbwo+IFB5dGhvbiAzLjEzLjYKPiBbNl0gMTI6MjM6MTggW1NVQ0NFU1NdIGZl
ZG9yYTQwLXZrLTEueW9jdG8uaW8KPiBQeXRob24gMy4xMi4xMAo+IFs3XSAxMjoyMzoxOCBbU1VD
Q0VTU10gb3BlbnN1c2UxNTUtdmstMS55b2N0by5pbwo+IFB5dGhvbiAzLjYuMTUKPiBbOF0gMTI6
MjM6MTggW1NVQ0NFU1NdIHVidW50dTI1MDQtdmstMS55b2N0by5pbwo+IFB5dGhvbiAzLjEzLjMK
PiBbOV0gMTI6MjM6MTkgW1NVQ0NFU1NdIHVidW50dTI0MDQtdmstMS55b2N0by5pbwo+IFB5dGhv
biAzLjEyLjMKPiBbMTBdIDEyOjIzOjE5IFtTVUNDRVNTXSByb2NreTktdmstMS55b2N0by5pbwo+
IFB5dGhvbiAzLjkuMjMKPiBbMTFdIDEyOjIzOjE5IFtTVUNDRVNTXSB1YnVudHUyMjA0LXZrLTEu
eW9jdG8uaW8KPiBQeXRob24gMy4xMC4xMgo+IFsxMl0gMTI6MjM6MTkgW1NVQ0NFU1NdIHN0cmVh
bTktdmstMS55b2N0by5pbwo+IFB5dGhvbiAzLjkuMjUKPiBbMTNdIDEyOjIzOjIwIFtTVUNDRVNT
XSBkZWJpYW4xMS12ay0xLnlvY3RvLmlvCj4gUHl0aG9uIDMuOS4yCj4gWzE0XSAxMjoyMzoyMCBb
U1VDQ0VTU10gYWxtYTgtdmstMS55b2N0by5pbwo+IFB5dGhvbiAzLjYuOAo+IFsxNV0gMTI6MjM6
MjAgW1NVQ0NFU1NdIG9wZW5zdXNlMTU2LXZrLTEueW9jdG8uaW8KPiBQeXRob24gMy42LjE1Cj4g
WzE2XSAxMjoyMzoyMSBbU1VDQ0VTU10gZGViaWFuMTMtdmstMS55b2N0by5pbwo+IFB5dGhvbiAz
LjEzLjUKPiBbMTddIDEyOjIzOjIyIFtTVUNDRVNTXSBkZWJpYW4xMi12ay0xLnlvY3RvLmlvCj4g
UHl0aG9uIDMuMTEuMgo+IFsxOF0gMTI6MjM6MjMgW1NVQ0NFU1NdIGZlZG9yYTQzLXZrLTIueW9j
dG8uaW8KPiBQeXRob24gMy4xNC4wCj4gWzE5XSAxMjoyMzoyMyBbU1VDQ0VTU10gdWJ1bnR1MjUx
MC12ay0xLnlvY3RvLmlvCj4gUHl0aG9uIDMuMTMuNwo+IAo+IFRoZSBkaXN0cm9zIHdoaWNoIGhh
dmUgPDMuOSBuZWVkIGJ1aWxkdG9vbHMgYWxyZWFkeSwgYnV0IHRoYXQgbGVhdmVzCj4gQWxtYSA5
LCBEZWJpYW4gMTEsIFJvY2t5IDkgYW5kIFN0cmVhbSA5IHdoaWNoIGFyZSBhbGwgbG9uZy10ZXJt
Cj4gc3VwcG9ydCBhbmQgd29u4oCZdCBiZSBFT0xpbmcgc2hvcnRseS7CoCBNYXliZSBzb21ldGhp
bmcgd2lsbCBoYXBwZW4KPiB0aGF0IG1lYW5zIHdlIG5lZWQgdG8gdXNlIGJ1aWxkdG9vbHMgb24g
dGhlc2UsIGJ1dCB0b21sbGliIGlzCj4gcHJvYmFibHkgbm90IGdvaW5nIHRvIGJlIHRoZSBpbXBl
dHVzIGhlcmUuCj4gCj4gUm9zcwo+IAo+IFsxXQo+IGh0dHBzOi8vZG9jcy55b2N0b3Byb2plY3Qu
b3JnL3JlZi1tYW51YWwvc3lzdGVtLXJlcXVpcmVtZW50cy5odG1sI3N1cHBvcnRlZC1saW51eC1k
aXN0cmlidXRpb25zCg==

