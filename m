Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC8EDE9D3E4
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 14:28:17 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21512.1770215294168577010
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 06:28:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=xUkbWeho;
 spf=pass (domain: ericsson.com, ip: 40.107.130.58, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LYQ4GJfBl5WUptwMnZ2iUds/BQWIyRlTRSQgMEIVFANmLuJpFQu3kuPjs7towFt8GZ9vXkWAYMlMnX2V4QMaMtSO83ryCTA1ouyZ1cF0I6539qiTHbkpjryZfUNxkTKMG+KzfmgnvvBJHwjEJ13q70NUgYMECNQIpI65huYi2xfTZ4BSRpicMNfLxRI57WASU6izsRsv495HLD6iDXeepcdcqc8T9fFsVgmV3AYL+Pv9XC119veovd0YwoJ1wiM6benMhoXdamYv9+BRTRjMB4L2WhuQqNiDJ+Mq3w7pP40W2utE2lPUuZ0Mp+2dozOqSaM15je6DS8RaQ5Hz6Hj3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L9x0XcN8JUJnFok+mfGsP+mtmdmOhX+PIz0Yj4LTJAE=;
 b=XGnm7ieGUqC6HVEVCSYSGL3YGNSlOsfnR18UBsw6kEV0p8Hme7/PkGxRhSQhDOzvVaFx9FThQU///dgYG16VNgKEcV0vaAaZwL6u+Mms3GTwLzaoQ628ssZRliS2QFBtxDXOoF8RE4N8e9LVywdhXs1B0H6y6COoZfVEKa8ASkf+gDA9OcaG/LS/EJqOfldW4a+hIibUqfTqEyzmdZxeTtrsz0i8m7VPkvlQdm4/hj06QKqpT25EMXeA503F05UniewBZfnTRiQ6Nj++ygmEgRCKWFtLhPKh19Kob+knMzQj6Wta9SRQhjY+p51UBEVGRiCmrRn/NMoIrlWqV2dhhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L9x0XcN8JUJnFok+mfGsP+mtmdmOhX+PIz0Yj4LTJAE=;
 b=xUkbWehoAPu51yYiSuOzoNaHxHTUgYGt+QvqgP/44jGwHe1jVrwJpzXZ4Pg4TCAMtvz9yaptIqB7BBIvJg0Ep8D5J3vGQsQWcp7P3QScPnd/Miz1kyD6izdPUyT6vLTaf3k1/VwDNORK9XzlrLE8HhqEEMEFo1wMRiYOMH8qa6r5wxa9xa4t/O9Xv2IPSEIBvlKaAnP3ooD45JV+9qKpkQayJ4N+iAEoXe/Thyz239tTxAjR6RuByj/wrGZMTiDqbrM1trH5DHbIo1bridfur2X8aLcT702N+x0tyJ8AlmnAjII19IzWld6zBpd6CM6XuQXOnawrsq15mmndKjbPFQ==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by DB9PR07MB11230.eurprd07.prod.outlook.com (2603:10a6:10:60e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 14:28:10 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%7]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 14:28:10 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: ValentinBoudevin <valentin.boudevin@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "jerome.oufella@savoirfairelinux.com"
	<jerome.oufella@savoirfairelinux.com>
Subject: RE: [PATCH v7 3/4] kernel-generate-cve-exclusions: Add a .bbclass
Thread-Topic: [PATCH v7 3/4] kernel-generate-cve-exclusions: Add a .bbclass
Thread-Index: AQHclIZK3y93B2gM0ECAA4g2qkPlrrVymkRw
Date: Wed, 4 Feb 2026 14:28:10 +0000
Message-ID: 
 <PA3PR07MB10721B507CAAAFD462FE191FD8A98A@PA3PR07MB10721.eurprd07.prod.outlook.com>
References: <188B4BEFFC6C387A.3271208@lists.openembedded.org>
 <20260202205231.2134908-1-valentin.boudevin@gmail.com>
 <20260202205231.2134908-4-valentin.boudevin@gmail.com>
In-Reply-To: <20260202205231.2134908-4-valentin.boudevin@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|DB9PR07MB11230:EE_
x-ms-office365-filtering-correlation-id: bc4132ff-aea0-47c3-5a60-08de63f99f29
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?SVVrcGtXZzM2VEo3Yi9mMGhzME9tZ3BwRjB6a2NtVEdZZ1l4NDlLOEcyM0VR?=
 =?utf-8?B?VktpcmVKU3U3TXZVdTVsRkhzNEFGamVzSWNOSng2aVovQi9ycGdRTnZLcDJW?=
 =?utf-8?B?M3ZoY3pBTHRFSk1SRVducC9Qbm5ZT0U5Q3JCdkYxd216Snl2bWY1eElNOTlv?=
 =?utf-8?B?SVYxbGk2S21PNnI2WFN6elVydFlpUHJWZmNxbzdpU29jVVRJeFU2ZlJhdDB6?=
 =?utf-8?B?RWcyUnh4RDBNaC9MWnVKUUhBMERWbmNWNzlvNGJVY3hSMkk2MHNEcTZuZmJZ?=
 =?utf-8?B?UmFCWmtUZzdndUF1bE81OEZFc0xwYnY0RW5Hb1NmTktDdFBJZnZ0T3hCcTV0?=
 =?utf-8?B?SGxIWkFNOUJqdVFzZGduTDlpb0tPM25zQVprNkluMWUwbU1hb2k2SXhpMUFv?=
 =?utf-8?B?MHNLMGppV091aGhhUWpLdVVsZm9iWDVGTjBEcFFYcFlJbXUxN0tyNi9nTklN?=
 =?utf-8?B?a0hBTkN3YlhCWWdUS280M2FZS3lvMWtnQkdRSkFESitkRkFOKzRYUzVYMmMx?=
 =?utf-8?B?SWdMclJ3bDdQYlBJSlVOM3d6Y3RBLy8vWEMxM0JRMTBkVWhRbloydEY0NmRQ?=
 =?utf-8?B?aFAwa2doYk1XZ2lEVUNrMFViZFJBeGN1bjJUTUphTjRHNXc0U1c0VTU1YXcr?=
 =?utf-8?B?M0Z2blhyczdrWnFRU1phVExybDBBSk94NHRLZUJjVWIwVFJaQ3BscmkvQ3pv?=
 =?utf-8?B?WHlMWFgrOXljNTZORFg3dFhFVmlnaTRsQTE2THVRNUhPQzZKa0Nja1IzaHcy?=
 =?utf-8?B?WVU3S0ZWM2tOOEtCbjV2WGJBQUVKdjdOZlhTa25XT3NvM1prVk9UVGJRWnpo?=
 =?utf-8?B?ano5UkNFYUJsYlVxa2h3WWlVeTJSVnZtWHNyQ0tpRzhHTSs4MUMyQzZpWk9P?=
 =?utf-8?B?VnFENnZSMHZIM1FIL1BaczBKVHNGWW5zeFAxOEFiYnpvWENZOCthYU9BTmFD?=
 =?utf-8?B?YXprbFFmTzVTVUNnZFJWbDZZRThqOHZUcFRTYWVSeFZiaUhNelg5SlczUHdu?=
 =?utf-8?B?ZGVXR3NjYU0xdElDM1NHY1J2RmFQMlF0ZHI3VFVnSmN0ZDR3WWF1bldrVXRv?=
 =?utf-8?B?YXNyWllHTlVpcjBVb2IvdkZOM005SHM3VFo5dWRDN1p4QjV3cU55a3haSWJs?=
 =?utf-8?B?RUdJQ0hlcmtqZTVUWVRxVHFmRHBrMnYxL0xCNVl2MFh2a0Z1WnNUZTl4NHYr?=
 =?utf-8?B?ZUVZejN6VURWNE1sZVBjV0F4cDU1VmhWRi9seFhJbnBQSW5hMitxWm9DQWRz?=
 =?utf-8?B?eXJDK0ZYU0Y2VnA4Z2xRenYvblEyRURxWmcxc0xIMjZ0WnVQU0lEeTRDNnY4?=
 =?utf-8?B?dmlGVlVoNlVjS1hoZXZ3cmxHZFd1bGVxVWVvbTAzR1VUOThmTWNjR1hZZ21o?=
 =?utf-8?B?bDEva253UU9QejJVRmowblBOdFFOc2E4WXFnTThLWXlPaEFvcCtiZUpjb2No?=
 =?utf-8?B?MElDRUpSdUZIZTFOTjFPWCs2QnFOOTRaR01PMXJ3QlFpaGVKYUExd001Tk5N?=
 =?utf-8?B?UDFMemZFdmw5NWplMElPWFpMWnFyUHZsUWJIQ1E0R0xoejJEbHFBOGRZZjZN?=
 =?utf-8?B?S1BmaWREM1pReC9URHFKbWx1a0x6SGFJS09xODdEQnA0RmplZy9NMkpqUk9F?=
 =?utf-8?B?T3daUDhnck40ZDZVeU15L3N0MnQ0OHRPZ01TMnhZNnlOS0JHSkFxUy9CVGJV?=
 =?utf-8?B?bkloV0ZXTGt3NkVnWThrVnBNQlJjQy9PaHpBTXJpRU9YcEpPd2g4ZlRnclc2?=
 =?utf-8?B?M0RXKzZIcUdaN0dmZkZRM3NUSHYzbXI1S2lOTlRiQXU1a3lFTzU1TzFuQ3lr?=
 =?utf-8?B?bHZuSEVNdFVlcm5yVkhueXRldEFyZ0ZBR3JsbjREbDFMN1ZVS3ltc1RzNGpa?=
 =?utf-8?B?U3NwclFKb0Nma0lOSzQyc2ZWZXptbzZ4RnMxb2dBb3krTmhmMHZyQlhvcnox?=
 =?utf-8?B?akVoN2xiL2o4YVVFYlBxNEJ6MXErdi9wT1BhR213MHg4QWQrdUg0N1BVcWRB?=
 =?utf-8?B?NTUvSU9RM3JSTmpkWi9naDBPR1l0SlZJS1RzenJLaDFNbk5DZnZWcGdkSlJa?=
 =?utf-8?B?aTBuNXlQVWRqcDVOdVhNVW5RRzc1RmdibGlsbVBTbjNHM1VnVW8zNXNFWlZ4?=
 =?utf-8?B?ekRpcnFPbVVMNTlWSThYdUxlMFlzVUkwOXlZaXJ2ZVlIMHRQY1R0WHhkTk92?=
 =?utf-8?Q?/JTM58wRU8p6H7/1Nz6gg8Q=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZUg4RWFkcjBIT3NHVnZ3bFJYMHhRVFBnVVQ3dGN3T1J1U0RZREVGaUFRZ2N5?=
 =?utf-8?B?dTNvMEdVVDEyRFZCOVRabHlRdU5DZnpRWHlld3FZRE9pUWFVa2h5dVF4ODhL?=
 =?utf-8?B?SkI0Rk9US2lGWnZKUWhWbGYwelVyTnNXRDZoZ0pTK0Jvd0NKb3hQTTNvb2dT?=
 =?utf-8?B?ajJVQk9VVzNGT3N3eGlPWlpJNzlwZkR0UEdhRlJvaUkya1NHdm95QkgxUUZL?=
 =?utf-8?B?L01SaDVjbUF5RnNSTWI5Q05YRWh4VzZLUFFLSkVSYjQ0R3RjWnorTkVYSmI0?=
 =?utf-8?B?Nm43VGZMbDhCQ2VkVk9wN28rS3k1T1BMY1VtYmYwSm5veVRYd2tRYkd1aW5Q?=
 =?utf-8?B?OS9COGNYek5ibnpwNWpkNzNFaVRwNSt2RWEvZnlJeFpzQUQ5OGZrQlh0alhX?=
 =?utf-8?B?MktaRjVOTE1CQ0FlK2duenI5enc2U3oySWp0ekEyYnNSRkJNcWc4WEZuU0JB?=
 =?utf-8?B?MXU2UUxhYkNUUDRsNmlESzdsUHByUWJvSG5aWVhHQ0FGUmpmSWJlbi9RZjB6?=
 =?utf-8?B?WWFNdEdZNzF4aWtUOG9FSjlURFV0T3IwOWtsSXZhaVNKMjI3V2wvNEtsQ1k3?=
 =?utf-8?B?SEpUeDVuMUxpelkwOWN3ZU5KZjh2M1ZJTUo3aXEyUDNISi81Q3ZQb3dZR0VZ?=
 =?utf-8?B?UUdPY2pJb2NiNnc5eHJCQzZ5S2JFaDlnZklKUDZEY1AvenJUN3NuMjZCMm5V?=
 =?utf-8?B?TUxRazNPbW01QnE5ekJlcUxRdkt1Qnc0MlFBVEJqWWhzVXFCcmFtMFBNNm5k?=
 =?utf-8?B?RERldytHTmRKSmNRc0JUa25ld2VBdytJaGxNN2VDaUFEelpsN21pdG5MaDds?=
 =?utf-8?B?VGNkV0pQakNyV2x6OUVtWDdVNk5USE05UTZaZjkvSXBvb1FHRWYxb0IxV3d1?=
 =?utf-8?B?Uit4N2lYclRTeTk3bnp6cUdqdDZmQXRWK1JCN2U1dnNxV3J6dlY1MXJmWVZl?=
 =?utf-8?B?SUhqWUxjUXNqU2VYS1NPem12MU4zVGJPSlVEc2xWYlpneFBuNVllbElSQjFq?=
 =?utf-8?B?NjdmK2FIQ1A2WGRkcC9NMkFmTXZKSFhNdTFoV1BGWVFodW5tRXFjUHlsWjAy?=
 =?utf-8?B?NFNtK056ditHM0VoQUwxM1laTisvMlF1ek5LTmJOSzh4Q0NyYTFGTWJsV1My?=
 =?utf-8?B?TXhJM2lpbG90WmpEUFgxVmxZQmsxdFRmc0srNGZJczVYcURpcU5hMUNPMDNS?=
 =?utf-8?B?dllKanhldG13bnI5VElnSUNYM1pLNnhiKzVNaHU0NHVMbDJoeGpjYkIyS2Iw?=
 =?utf-8?B?b0tudG9yR1J5ZmtGbEVNTXBiUHEwTXIwQjU5MmtRMWJqK2NLOTg5Q0IrVjFj?=
 =?utf-8?B?cEdZVGwrVWdJT1o1aURwUGFhU1FGUERHTXpnSVhXdGVEL2JoakJSMHdTL3Nm?=
 =?utf-8?B?Wm4xNUhwbmNGUGluNmJSSzBqbW5HUlBUbWVuSGQyekRFQnF1Q1k2N0dQWHZG?=
 =?utf-8?B?djFxVnN4MnUyZ3ViMkc5NVBRR2wwbkFUbTRuOW1OdzlwZjg5QTRocERGZjg2?=
 =?utf-8?B?WmNvM1JCTjlSTmNWZmdGWWZtdUI5d2tiVnpPTFBiZXBqTDJLY1VuS0Y4U2Fs?=
 =?utf-8?B?Z1BTZU5Ra2J4cHRGalBYTHk4NzA1eW5TblpCYm9OcUFJTUpPb0ZsZHFlaGZ2?=
 =?utf-8?B?bXNjWHFzTmNnL1JleGRGSmc4TUszTjZNaGdDTUR6TVhRZ2RibGkyYnZNWnZk?=
 =?utf-8?B?VnMvV2Z0cmRvVDNwWXVJK05xakNHWjNoTkJUWXhRUFdUbUpOTUxnMU4xMURF?=
 =?utf-8?B?VUhsbmJITnlKVnVEc1hIK0g4eWRZN001QVpudUh4RGRwWlZqYU9sSEoyR3Zv?=
 =?utf-8?B?WFpMckZJZjRDU3kxRzZPZmRqZEthSVRlZVY5SUkzM2VrQ2RBN3BDM2V5UXBZ?=
 =?utf-8?B?eXh3RG80Y2FoeG9nY0Z5YnM4bkg1cnZWQ1NPMGNMblViam9WQ25UaHVsTHFj?=
 =?utf-8?B?V2FVNkEwZkZxVTE3Y25KZkpEZTViOG52cHUxRDdvVTRaN1ppQndOUFRwM0FZ?=
 =?utf-8?B?eU4vZEVlRDV4RGwyaS81bzhsbys0by9BMXZVaUJnNUJIaVl4dnhmUnQ1Y2NQ?=
 =?utf-8?B?ZFAwaGVPc3E3b0J2R2oreVF4TUNmTFloeERzTVg2WFloVWllN2d0SDRjT1VH?=
 =?utf-8?B?bFk1OWxYa0xFbERvRk94NVVBTXdZQjJvaWV4bE5WZlhHdFFjSTNxUjZFTXpY?=
 =?utf-8?B?ZW1qTG9ZZUllK3I0WFVuL05HcmpnQ05mbklPYmphZzVIYUhhdHl1ZUdjcG5U?=
 =?utf-8?B?OGJ6eGgwaXVXcW42S0JxQTEyOWQyWHcrOTdwZ3VtbmJtNS9xb29FQ0xNcU5B?=
 =?utf-8?B?SjFMVGJCVEg1VDZ6RDRSRHBqRTh2UnA4SzFBWWhPcU5mNTFvQ2V3QT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc4132ff-aea0-47c3-5a60-08de63f99f29
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 14:28:10.1157
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5vS4eNqwAWLqVnJleOrXmPsvMOr4cuk0l5nhwfoxo8tBLNwtRW9cJNm0tNyZmFEJwlAZ4Yi1oSH/+tZPpWnYanB99r1kJmtPP0FUlwJQB3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB11230
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 14:28:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230534

TWlub3IgdHlwbw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFZhbGVu
dGluQm91ZGV2aW4gPHZhbGVudGluLmJvdWRldmluQGdtYWlsLmNvbT4NCj4gU2VudDogTW9uZGF5
LCAyIEZlYnJ1YXJ5IDIwMjYgMjE6NTINCj4gVG86IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcNCj4gQ2M6IERhbmllbCBUdXJ1bGwgPGRhbmllbC50dXJ1bGxAZXJpY3Nz
b24uY29tPjsNCj4gamVyb21lLm91ZmVsbGFAc2F2b2lyZmFpcmVsaW51eC5jb207IFZhbGVudGlu
Qm91ZGV2aW4NCj4gPHZhbGVudGluLmJvdWRldmluQGdtYWlsLmNvbT4NCj4gU3ViamVjdDogW1BB
VENIIHY3IDMvNF0ga2VybmVsLWdlbmVyYXRlLWN2ZS1leGNsdXNpb25zOiBBZGQgYSAuYmJjbGFz
cw0KPiANCj4gQWRkIGEgbmV3IGNsYXNzIG5hbWVkIGtlcm5lbC1nZW5lcmF0ZS1jdmUtZXhjbHVz
aW9ucy5iYmNsYXNzIHRvIGdlbmVyYXRlLWN2ZS0NCj4gZXhjbHVzaW9ucyB0byB1c2UgdGhpcyBz
Y3JpcHQgYXQgZXZlcnkgcnVuLg0KPiANCj4gVHdvIHN0ZXBzIGZvciB0ZXN0aW5nOg0KPiANCj4g
MSkgaW5oZXJpdCB0aGlzIGNsYXNzIGluIHRoZSBrZXJuZWwgcmVjaXBlIHdpdGggImluaGVyaXQN
Cj4gICAga2VybmVsLWdlbmVyYXRlLWN2ZS1leGNsdXNpb25zLmJiY2xhc3MiDQo+IDIpIFVzZSB0
aGUgZm9sbG93aW5nIGNvbW1hbmQgdG8gZ2VuZXJhdGUgY3ZlIGV4Y2x1c2lvbnMgLmpzb24sIGFu
ZCAuaW5jDQo+ICAgIGZpbGUgOiAiYml0YmFrZSBsaW51eC15b2N0byAtYyAiZG9fZ2VuZXJhdGVf
Y3ZlX2V4Y2x1c2lvbnMiDQo+IA0KPiBUaGlzIGNsYXNzIGNvbnRhaW5zIHNldmVyYWwgbWV0aG9k
czoNCj4gDQo+ICpkb19nZW5lcmF0ZV9jdmVfZXhjbHVzaW9uczogVXNlIHRoZSBzY3JpcHQgZ2Vu
ZXJhdGUtY3ZlLWV4Y2x1c2lvbnMucHkuDQo+IEl0IHVzZXMgdGhlIG5ldyAiLS1vdXRwdXQtanNv
bi1maWxlIiBhcmd1bWVudCB0byBnZW5lcmF0ZSBhIEpTT04gZmlsZSBhcyBhbg0KPiBvdXRwdXQg
c3RvcmVkIGluICR7R0VORVJBVEVfQ1ZFX0VYQ0xVU0lPTlNfT1VUUFVUX0pTT059LCBhbmQgYSAu
aW5jIGZpbGUNCj4gaW4gJHtHRU5FUkFURV9DVkVfRVhDTFVTSU9OU19PVVRQVVRfSU5DfQ0KPiAN
Cj4gKmRvX2N2ZV9jaGVjazpwcmVwZW5kOiBQYXJzZSB0aGUgcHJldmlvdXNseSBnZW5lcmF0ZWQg
SlNPTiBmaWxlIHRvIHNldCB0aGUNCj4gdmFyaWFibGUgQ1ZFX1NUQVRVUyBjb3JyZXRseQ0KPiAN
Cj4gVGhlIGNsYXNzIGFsc28gcHJvdmlkZXMgc29tZSB2YXJpYWJsZXM6DQo+IA0KPiAqR0VORVJB
VEVfQ1ZFX0VYQ0xVU0lPTlNfT1VUUFVUX0pTT046IHBhdGggb2YgdGhlIG91dHB1dCBKU09OIGZp
bGUNCj4gdXNlZCB0byBzZXQgQ1ZFX1NUQVRVUw0KPiAqR0VORVJBVEVfQ1ZFX0VYQ0xVU0lPTlNf
T1VUUFVUX0lOQzogY3ZlIGV4Y2x1c2lvbnMgLmluYyBmaWxlIG91dHB1dA0KPiBwYXRoLiBOb3Qg
dXNlZCBkaXJlY3RseSBieSB0aGlzIGNsYXNzIChuZWVkcyB0byBiZSBpbmhlcml0IG1hbnVhbGx5
KS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFZhbGVudGluIEJvdWRldmluIDx2YWxlbnRpbi5ib3Vk
ZXZpbkBnbWFpbC5jb20+DQo+IC0tLQ0KPiAgLi4uL2tlcm5lbC1nZW5lcmF0ZS1jdmUtZXhjbHVz
aW9ucy5iYmNsYXNzICAgIHwgNDYgKysrKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDQ2IGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL2NsYXNzZXMv
a2VybmVsLWdlbmVyYXRlLWN2ZS1leGNsdXNpb25zLmJiY2xhc3MNCj4gDQo+IGRpZmYgLS1naXQg
YS9tZXRhL2NsYXNzZXMva2VybmVsLWdlbmVyYXRlLWN2ZS1leGNsdXNpb25zLmJiY2xhc3MNCj4g
Yi9tZXRhL2NsYXNzZXMva2VybmVsLWdlbmVyYXRlLWN2ZS1leGNsdXNpb25zLmJiY2xhc3MNCj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMC4uOGVmYTMyZjZhMQ0KPiAt
LS0gL2Rldi9udWxsDQo+ICsrKyBiL21ldGEvY2xhc3Nlcy9rZXJuZWwtZ2VuZXJhdGUtY3ZlLWV4
Y2x1c2lvbnMuYmJjbGFzcw0KPiBAQCAtMCwwICsxLDQ2IEBADQo+ICsjIEdlbmVyYXRlIENWRSBl
eGNsdXNpb25zIGZvciB0aGUga2VybmVsIGJ1aWxkIChzZXQgdG8gIjEiIHRvIGVuYWJsZSkNCj4g
K0dFTkVSQVRFX0NWRV9FWENMVVNJT05TX09VVFBVVF9KU09OID0gIiR7V09SS0RJUn0vdGVtcC9j
dmUtDQo+IGV4Y2x1c2lvbl8ke0xJTlVYX1ZFUlNJT059Lmpzb24iDQo+ICtHRU5FUkFURV9DVkVf
RVhDTFVTSU9OU19PVVRQVVRfSU5DICA9ICIke1dPUktESVJ9L3RlbXAvL2N2ZS0NCj4gZXhjbHVz
aW9uXyR7TElOVVhfVkVSU0lPTn0uaW5jIg0KUmVtb3ZlIG9uZSAvIGFmdGVyIHRlbXANCg0KPiAr
DQo+ICtkb19nZW5lcmF0ZV9jdmVfZXhjbHVzaW9ucygpIHsNCj4gKyAgICAjIENoZWNrIGZvciBy
ZXF1aXJlZCBmaWxlcyBhbmQgZGlyZWN0b3JpZXMNCj4gKyAgICBnZW5lcmF0ZV9jdmVfZXhjbHVz
aW9uc19zY3JpcHQ9JHtDT1JFQkFTRX0vc2NyaXB0cy9jb250cmliL2dlbmVyYXRlLWN2ZS0NCj4g
ZXhjbHVzaW9ucy5weQ0KPiArICAgIGlmIFsgISAtZiAiJHtnZW5lcmF0ZV9jdmVfZXhjbHVzaW9u
c19zY3JpcHR9IiBdOyB0aGVuDQo+ICsgICAgICAgIGJid2FybiAiZ2VuZXJhdGUtY3ZlLWV4Y2x1
c2lvbnMucHkgbm90IGZvdW5kIGluDQo+ICR7Z2VuZXJhdGVfY3ZlX2V4Y2x1c2lvbnNfc2NyaXB0
fS4iDQo+ICsgICAgICAgIHJldHVybiAwDQo+ICsgICAgZmkNCj4gKyAgICBpZiBbICEgLWQgIiR7
U1RBR0lOR19EQVRBRElSX05BVElWRX0vY3ZlbGlzdHY1LW5hdGl2ZSIgXTsgdGhlbg0KPiArICAg
ICAgICBiYndhcm4gIkNWRSBleGNsdXNpb25zIHNvdXJjZSBkaXJlY3Rvcnkgbm90IGZvdW5kIGlu
DQo+ICR7U1RBR0lOR19EQVRBRElSX05BVElWRX0vY3ZlbGlzdHY1LW5hdGl2ZS4iDQo+ICsgICAg
ICAgIHJldHVybiAwDQo+ICsgICAgZmkNCj4gKyAgICAjIEdlbmVyYXRlIHRoZSBDVkUgZXhjbHVz
aW9ucyBKU09OICYgSU5DIGZpbGUNCj4gKyAgICBweXRob24zICIke2dlbmVyYXRlX2N2ZV9leGNs
dXNpb25zX3NjcmlwdH0iIFwNCj4gKyAgICAgICAgIiR7U1RBR0lOR19EQVRBRElSX05BVElWRX0v
Y3ZlbGlzdHY1LW5hdGl2ZSIgXA0KPiArICAgICAgICAke0xJTlVYX1ZFUlNJT059IFwNCj4gKyAg
ICAgICAgLS1vdXRwdXQtanNvbi1maWxlICIke0dFTkVSQVRFX0NWRV9FWENMVVNJT05TX09VVFBV
VF9KU09OfSIgXA0KPiArICAgICAgICAtLW91dHB1dC1pbmMtZmlsZSAiJHtHRU5FUkFURV9DVkVf
RVhDTFVTSU9OU19PVVRQVVRfSU5DfSINCj4gKyAgICBiYnBsYWluICJDVkUgZXhjbHVzaW9ucyBn
ZW5lcmF0ZWQgZm9yIGtlcm5lbCB2ZXJzaW9uICR7TElOVVhfVkVSU0lPTn0gYXQNCj4gJHtHRU5F
UkFURV9DVkVfRVhDTFVTSU9OU19PVVRQVVRfSU5DfSBhbmQNCj4gJHtHRU5FUkFURV9DVkVfRVhD
TFVTSU9OU19PVVRQVVRfSlNPTn0uIg0KPiArfQ0KPiArZG9fZ2VuZXJhdGVfY3ZlX2V4Y2x1c2lv
bnNbZGVwZW5kc10gKz0gImN2ZWxpc3R2NS0NCj4gbmF0aXZlOmRvX3BvcHVsYXRlX3N5c3Jvb3Qi
DQo+ICtkb19nZW5lcmF0ZV9jdmVfZXhjbHVzaW9uc1tub3N0YW1wXSA9ICIxIg0KPiArZG9fZ2Vu
ZXJhdGVfY3ZlX2V4Y2x1c2lvbnNbZG9jXSA9ICJHZW5lcmF0ZSBDVkUgZXhjbHVzaW9ucyBmb3Ig
dGhlIGtlcm5lbA0KPiBidWlsZC4gKGUuZy4sIGN2ZS1leGNsdXNpb25fNi4xMi5qc29uKSINCj4g
K2FkZHRhc2sgZ2VuZXJhdGVfY3ZlX2V4Y2x1c2lvbnMgYWZ0ZXIgZG9fcHJlcGFyZV9yZWNpcGVf
c3lzcm9vdCBiZWZvcmUNCj4gK2RvX2N2ZV9jaGVjaw0KPiArDQo+ICtweXRob24gZG9fY3ZlX2No
ZWNrOnByZXBlbmQoKSB7DQo+ICsgICAgaW1wb3J0IG9zDQo+ICsgICAgaW1wb3J0IGpzb24NCj4g
KyAgICB3b3JrZGlyID0gZC5nZXRWYXIoIiR7U1RBR0lOR19EQVRBRElSX05BVElWRX0vY3ZlbGlz
dHY1LW5hdGl2ZSIpDQo+ICsgICAga2VybmVsX3ZlcnNpb24gPSBkLmdldFZhcigiTElOVVhfVkVS
U0lPTiIpDQo+ICsgICAganNvbl9pbnB1dF9maWxlID0gZC5nZXRWYXIoIkdFTkVSQVRFX0NWRV9F
WENMVVNJT05TX09VVFBVVF9KU09OIikNCj4gKyAgICBpZiBvcy5wYXRoLmV4aXN0cyhqc29uX2lu
cHV0X2ZpbGUpOg0KPiArICAgICAgICB3aXRoIG9wZW4oanNvbl9pbnB1dF9maWxlLCAncicsIGVu
Y29kaW5nPSd1dGYtOCcpIGFzIGY6DQo+ICsgICAgICAgICAgICBjdmVfZGF0YSA9IGpzb24ubG9h
ZChmKQ0KPiArICAgICAgICBjdmVfc3RhdHVzX2RpY3QgPSBjdmVfZGF0YS5nZXQoImN2ZV9zdGF0
dXMiLCB7fSkNCj4gKyAgICAgICAgY291bnQgPSAwDQo+ICsgICAgICAgIGZvciBjdmVfaWQsIGlu
Zm8gaW4gY3ZlX3N0YXR1c19kaWN0Lml0ZW1zKCk6DQo+ICsgICAgICAgICAgICBpZiBpbmZvLmdl
dCgiYWN0aXZlIiwgVHJ1ZSk6DQo+ICsgICAgICAgICAgICAgICAgY29udGludWUNCj4gKyAgICAg
ICAgICAgIGQuc2V0VmFyRmxhZygiQ1ZFX1NUQVRVUyIsIGN2ZV9pZCwgaW5mby5nZXQoIm1lc3Nh
Z2UiLCAiIikpDQo+ICsgICAgICAgICAgICBjb3VudCArPSAxDQo+ICsgICAgICAgIGJiLm5vdGUo
IkxvYWRlZCAlZCBDVkVfU1RBVFVTIGVudHJpZXMgZnJvbSBKU09OIG91dHB1dCBmb3INCj4gK2tl
cm5lbCAlcyIgJSAoY291bnQsIGtlcm5lbF92ZXJzaW9uKSkgfQ0KDQpEYW5pZWwNCg==

