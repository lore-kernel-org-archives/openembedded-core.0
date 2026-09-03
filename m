Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65AD5C61DD3
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 16:06:48 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11399.1788451602299934605
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 09:06:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=kdUqjP/T;
 spf=pass (domain: siemens.com, ip: 40.107.162.43, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RTjS7frWrlo92FvGp8N7NT+hhvWLylYIkAJtIHFWIjYvy8Iqt1OGuHGAyDe5BoIeEK+WyeFJmk3XMr5anyWL/QZCPGm9aQ7KtLivBPvv2hc8AFVtUnev4g19RXHQQVpI3lYfjvt+pzz1RarK8qzRVO1dRM10d8YYQ+hmEhOFHv8L+RPCZEHwUYnyFS+fBidZQMJTg4ROHO2DCJhNpC+uWnb5jp0cMweyNvlPluDu1JVPbTch/nhBO+JjmsVExJlhesRPOf2eEPpMbrBlTinE3BPfZzkebEU4AVNqRzZN3eHdnDl2OKdzWyYGzkcdLabOC1cE0+79MkWSuLrnM1BcZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVH44YGeqfRsQ1C0GjLrrOrf5Kaa5kTFMz7qKYeTgHI=;
 b=x1HDq7Dj/7iwecuGfMxIAb9D35DzrQyJVPQQUGEGbKNNCyMnY+Ffr3e4MiHQhL2531UEW3+MPn09BkIKr6VMLUAUmEkV0yhCu/BUrQ0mf8UCtppKzemXnEObzDAy0Vf7A16INguqlNw1ty5V6zlDM7Nj64lrUI6Q8A3hhAWE+gAse5kiV+cxVEqRFVOrxxA4B80Ee3+sArMChF0hxMdpcvWwFB8/yTOnPvLVM+6L5hsN17DIcqp/GLICy/XDnedmyypinkEtdcZcKOfL2G4hurgze0hrW5FHO7HqHVKK8hC9ZO2EkL1dnzmluUoXieob4h86q9ETXlPh870jlD4JQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVH44YGeqfRsQ1C0GjLrrOrf5Kaa5kTFMz7qKYeTgHI=;
 b=kdUqjP/TTuMAYrmrbWdF3UZiHpdUeLjioxsvpU6OTCBcbnHLcU2qnXSVwjmafZUO2suMq1EegTG140riB+BDOFUhJ/gCsj6W5eooahn4wTNk5CfFtOVD0nAlla0gygH1OvaCIyZy8oucMuCcDPTyRqVJDt118H1Qg533MZjpmThVBHRfHOJKnQML9N8SKGG8vu7o3ErUSJKbL70lCRSLPERJntajbMX3TgctaOtJ+JvxaUP1TkVNSCkd3PCFlWueCxRRQB1kQXu5rY4s9o5jZJPTyRp7FFdHnbfdKGOzkuYn4te31ih5Zb79Seo9PWNftic23snZObs1yriBW5T1tQ==
Received: from AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:14e::19)
 by GV2PR10MB6647.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:b3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 16:06:37 +0000
Received: from AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7576:68aa:ea32:323f]) by AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7576:68aa:ea32:323f%5]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 16:06:36 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 02/25] devtool: ide-sdk: dedupe
 solib_search_path entries
Thread-Topic: [OE-core] [PATCH v2 02/25] devtool: ide-sdk: dedupe
 solib_search_path entries
Thread-Index: AQHdOMlpK/GTpBUPxUyhZnTPT1DZ/La8ulaAgABQeoA=
Date: Thu, 3 Sep 2026 16:06:35 +0000
Message-ID: <1ffaac43051093ec29916ce154a96b6e1fd943bc.camel@siemens.com>
References: <20260830214912.1346063-1-adrian.freihofer@siemens.com>
		 <20260830214912.1346063-3-adrian.freihofer@siemens.com>
	 <92d96154859f9da579f751003a941a97921a32fb.camel@linuxfoundation.org>
In-Reply-To: 
 <92d96154859f9da579f751003a941a97921a32fb.camel@linuxfoundation.org>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR10MB3745:EE_|GV2PR10MB6647:EE_
x-ms-office365-filtering-correlation-id: 325576ad-022a-4010-da8d-08df09d5547d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|56012099006|4143699003|11063799006|10067099003|55112099003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: 
 Qxd6hgF8rQGKih6knFWouQBz7YMLGxVEjBsunANJgR6miilwRFdmb35voaAoJTj+cACV3iY6SuuNSiCQV3iSv4NIZUvRUB5TnRAgRt5/dQFaD24IP+Q46JD4xBASkAjAxHPwNFLccZw0VNsAKxMRvTfeDQZnCdT+kgC8cbcznWSYa1Q+u6GYYDy6H46tj8q+NNYFPEYFtc6jEStlHASIf7s94cP2+IXRF6wCV+F7e8HiBUJXr/QHsoOawp8QtKXtAwgMBkvNahZM27FS9ajwcJvLI0Tr2No78AsORLWH67XDroQURlj8ZPue9/qCL/fzZ0Yssbkz9AUp6D4AvEwEhHzKBE3GSpxRDg2B14KJwXeWeSycd+eFvIA1tujmWaQTn+DOTf4W/kWuL7b/r1bzbFvGphZ4/maQetLXJSEmIhC3TA5uJQhkpg+tg90QidFqyQK0aTwn6IvK/wIG1NIk6sewGKtwKMidbR2icVQbTZm0tDFEMleaXIkKMDGTlZd4oCEAGmMqDqJaTT45yB7ryCoEW67QEHIpAv8OKqXjkyYySHrkznHLRmC1UbzRI1s3Pi2NbqQN0gSg2/65K6BFOGD+uXH8DwrnJP7xZ3j89ZONWjoQrNvHCuBFyMGFJwX29D39WbetRJCoGJjZTxIDYDFtzYT6VeyXI9yuiPKNIZfkT0znKhe2zIqaVOKiFr4YgWKhHorboNMr09eFIf+Da7rrgLUCk3YgUecAA2ccGP0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(56012099006)(4143699003)(11063799006)(10067099003)(55112099003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SXpzK3BzeUFCNE1qUFRsUEsvd3d5L1FmTStIeHduZE1EUDNOeDZqYWRiYzJk?=
 =?utf-8?B?OVMyNkNvRWxLQVNpdmtyNG5KdHlsb3o2UGtrZVlYS1QwbGlqeTdsU2llM0li?=
 =?utf-8?B?OFh5RkowenRJM2RPZ2hYUEI2T0d0SkJWc1gvU1MrMUhDUXRYWnZFNEl5dElp?=
 =?utf-8?B?bEZ0WnRQVFVYS3VTM2NTZSszeXFWeTVLdEd3cVpHTDc5elpIbXpjTkQ1bHF4?=
 =?utf-8?B?YTNsUUlBbHBqK1MxS0x6N254TDBKN0lNamFnOTNqbWwzd3FFR0xsQ0VlTVBq?=
 =?utf-8?B?a3dUL3Z6SnhvWXFLaDVqU1V0RHFuY1lreFQvbmlmdlF5Q1JxTFZBa2xtREgr?=
 =?utf-8?B?RUVycjlRYTdmUnFETXRSMjVLcmZvTzBvN0RXVzlZQ0dYclg1b3JWclhObC83?=
 =?utf-8?B?aGhHb0lsdGYvSEwxWUJaMy9jWHd0V1VnczdzbzNGNzVJZkwwdUtBUU9HWktV?=
 =?utf-8?B?cjRocjA4eUFqcm1wZ1ZUSkE0a1I5bDNpMUVNNnFraEFyWXVVY2pLM3JXdVY2?=
 =?utf-8?B?bERVUVJHWllBYk93VzNPcDh2dzZVdU9pUTdZWktWeVhWTVRjdDFncE1wOE80?=
 =?utf-8?B?UTZ6c1RvM04xWnRmUnFCQkNUcFhzWXlLUElIcmZDeG5RNXZmeHJNRVBSS0J1?=
 =?utf-8?B?MmM4Y0gxVHBIN2ovTThQdWgwK004TXoxOWVIdFRCRmpOR0NxcHJFdWs3Tnkv?=
 =?utf-8?B?aWYrMVgvTXdkRG9uVndLQUdmWjdoUzhCNmluWVR4b2tvWE93eHBBSlhrVHNi?=
 =?utf-8?B?Z2RFQ24wTWJUV0hnenFhUWZJZ3VGN1RxbzM3YmJkOGh2TXdDWDFacVBpSzI3?=
 =?utf-8?B?dWt5cElsNU5jNlNuY0hRTTRORlQ4ZE1yZi9NWjMraFZQOHJoUWcwVXVSb1JB?=
 =?utf-8?B?RVcyMVZYVXpLcE54WFZBWVNoc3VsSzBoNmNpbzVmb2x0U1BEakZiZExtWmw3?=
 =?utf-8?B?SVkzWExIcWE5M3hMQ3Rac1pGaHc0OHlRa2ZYOG1vOTBQc20xYkZrcXlndTBM?=
 =?utf-8?B?RXBPMS9LVVNPZVROOVhmOE1VYjUrRXVBbUtvVjc2dFdkMm9NdDlROWQwZ29o?=
 =?utf-8?B?N2FoWHFFaStJM1hqc3hvSjROMnBYM2JXdkVFUFR4QStMOTBtTVNONzZGY1Z5?=
 =?utf-8?B?TmUzcEErYXVvV3VMVjZ4d1o4anlWRjZmU0MrUmtDOGlrTnlVRXBFaCtYNmFk?=
 =?utf-8?B?UTYrcGFMTE5XejkwRkNsOFFXL1NRcXNvcEZiQW1TdU9zRk0xckFXWHdHQ3dD?=
 =?utf-8?B?S3Q1OTVSNElrZXdPUldrOGpQZzBjblJDMWEzVXZFYzVUTlVkcnh2NmpZMGsz?=
 =?utf-8?B?aFFuOUZ5a2lNMWVqZGVrRlpZenFyOFRUU2wvLzNadHo5TVI3cFRYd0Z1UnVk?=
 =?utf-8?B?Vm9zdXVwcHp2aFRnQ1JhQUxlbVZmT0FSRWM5MTNWdzY5SnZVYklldTRCRFhF?=
 =?utf-8?B?U3U0NHFiYzE1Qy8xczMxVmRaUkxGZXVweVgwQTV4cVZZNUc2NnNtUmYwS0Fv?=
 =?utf-8?B?d0duWHJJSTJaSndTeFZPNFpaV1ZjSzV2TS90NDc2Y3hjU294cGxPanJtUFVO?=
 =?utf-8?B?MnlWdFUySDA3WDZEOEJPL3V4YnNnYVBSekt5dnlCYVVwMURLSER2RzRaV2I1?=
 =?utf-8?B?UUdaRVZZYTc1ajdxcTRSdGY4Mzk0WWVIUTJ5cmZrNytGUWYxQXZ4V0ZOREhs?=
 =?utf-8?B?RkYrOEJzWHFTTk13VHNJSzhnTGVGdUZmUGlGQ1VwaElnNU9nMHQyYVVCcUho?=
 =?utf-8?B?bVlsRVc0ZCt0a1ZNbzdSeGNtQWpacE5xVEErcVI0YWFZSnRzckVWY3lWYk14?=
 =?utf-8?B?SmNNdjVXQmlCOURiR3A1bElvckNRN2xLN3dYeGc4OTh0eDJ4ZHJzd2o0OUFX?=
 =?utf-8?B?OHduUldNUnNETnYxOTBPMnBEeDVVYTR5eGRCc0gwdTZFOXNzMEI3WDlIbFhT?=
 =?utf-8?B?UjZIYjBrOXhkTFZiTkF4QlBYTWFiV2ZRclE3Zy9TYUxoOExRbVpNZmRsWDlJ?=
 =?utf-8?B?MkNDRklOSlhobU41cTYxOHpVY3BQYzdkSjQ1MDBkeWVxS1V6dXdGczRLQytN?=
 =?utf-8?B?aHdrdnJ1NUpuc2xUS1NmUU1Tc0RkOENFSzdibEdMdU5vY1RjT3o4VGtwa2Ey?=
 =?utf-8?B?eHBVNzUxYWluTWc5WWpxZjNNRnloaWRxWnJlbTE4T015bU1nWWJSdmh1K3Z3?=
 =?utf-8?B?ZFpkNDlWaExiV2ZhZHg3Q1NicEZ0TW9aVG51V0QvTURIc0QzRWxtcCtNZ1Mz?=
 =?utf-8?B?Njd0TFZXdzBjTUVHSTlvVFhOaDZlYy9KeUJFdTAyY2xSVEtiWm44dWZMRVNZ?=
 =?utf-8?B?YS95WW94YkRJNlZEVDJZckxjdC9tQWwrb2p4di9sbzN6N21uYmdkZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A68D0F7BCE842141B16041950C4C9B43@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR10MB3745.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 325576ad-022a-4010-da8d-08df09d5547d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2026 16:06:35.9931
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LSwzEkfCsTUcsaChuMHxS0Vj95g9ZajGX4XJ6flddAS5hBQDhArdqHSl5qKSYAYPVHUYrgNWtUDQBugIxuBryHQxS48KIYmWVsF6CQwuotE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6647
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 16:06:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245034

T24gVGh1LCAyMDI2LTA5LTAzIGF0IDEyOjE4ICswMTAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToK
PiBPbiBTdW4sIDIwMjYtMDgtMzAgYXQgMjM6NDggKzAyMDAsIEFkcmlhbiBGcmVpaG9mZXIgdmlh
Cj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToKPiA+IEZyb206IEFkcmlhbiBGcmVpaG9m
ZXIgPGFkcmlhbi5mcmVpaG9mZXJAc2llbWVucy5jb20+Cj4gPiAKPiA+IFdpdGggdXNybWVyZ2Ug
aW4gRElTVFJPX0ZFQVRVUkVTICh0aGUgZGVmYXVsdCksIHJvb3RfcHJlZml4IGJlY29tZXMKPiA+
IGV4ZWNfcHJlZml4LCBzbyBiYXNlX2xpYmRpciBhbmQgbGliZGlyIHJlc29sdmUgdG8gdGhlIHNh
bWUgcGF0aC4KPiA+IFRoaXMKPiA+IG1hZGUgbW9zdCBlbnRyaWVzIG9mIHNvbGliX3NlYXJjaF9w
YXRoKCkgbGl0ZXJhbCBkdXBsaWNhdGVzLiBEZWR1cGUKPiA+IHdoaWxlIHByZXNlcnZpbmcgb3Jk
ZXIuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEFkcmlhbiBGcmVpaG9mZXIgPGFkcmlhbi5mcmVp
aG9mZXJAc2llbWVucy5jb20+Cj4gPiAtLS0KPiA+IMKgc2NyaXB0cy9saWIvZGV2dG9vbC9pZGVf
c2RrLnB5IHwgMyArKy0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvc2NyaXB0cy9saWIvZGV2dG9vbC9pZGVf
c2RrLnB5Cj4gPiBiL3NjcmlwdHMvbGliL2RldnRvb2wvaWRlX3Nkay5weQo+ID4gaW5kZXggNGZk
ZWVlYzI0ZC4uNmYwODk0MGM5YyAxMDA3NTUKPiA+IC0tLSBhL3NjcmlwdHMvbGliL2RldnRvb2wv
aWRlX3Nkay5weQo+ID4gKysrIGIvc2NyaXB0cy9saWIvZGV2dG9vbC9pZGVfc2RrLnB5Cj4gPiBA
QCAtNjQzLDcgKzY0Myw4IEBAIGNsYXNzIFJlY2lwZU1vZGlmaWVkOgo+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIG9zLnBhdGguam9pbihpbWFnZS5yb290ZnMsIGJhc2VfbGliZGlyKSwKPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvcy5wYXRoLmpvaW4oaW1hZ2Uucm9vdGZzLCBsaWJk
aXIpCj4gPiDCoMKgwqDCoMKgwqDCoMKgIF0KPiA+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4gc29f
cGF0aHMKPiA+ICvCoMKgwqDCoMKgwqDCoCAjIGJhc2VfbGliZGlyID09IGxpYmRpciB3aGVuIHVz
cm1lcmdlIGlzIGluCj4gPiBESVNUUk9fRkVBVFVSRVMgKHRoZSBkZWZhdWx0KSwgZGVkdXBlCj4g
PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGxpc3QoZGljdC5mcm9ta2V5cyhzb19wYXRocykpCj4g
Cj4gVGhpcyBpcyBhIGxpdHRsZSBoYXJkIHRvIHJlYWQsIHdvdWxkIHNldChzb19wYXRocykgd29y
ayBoZXJlPwoKVGhlIG9yZGVyIG9mIHRoZXNlIHBhdGhzIGlzIGVzc2VudGlhbC4gVGhlcmVmb3Jl
IHNldCB3b3VsZCBub3Qgd29yay4KCkknbSB3b3JraW5nIG9uIGEgdjMgd2hpY2ggd2lsbCBpbXBy
b3ZlIHRoZSBjb21tZW50cyBmb3IgdGhpcwpjb21wbGljYXRlZCBmdW5jdGlvbiBhcyBtdWNoIGFz
IHBvc3NpYmxlLgoKVGhhbmtzIHlvdQpSZWdhcmRzLApBZHJpYW4KCj4gCj4gQ2hlZXJzLAo+IAo+
IFJpY2hhcmQK

