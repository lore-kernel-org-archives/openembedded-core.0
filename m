Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F0E4106B53E
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 13:45:36 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.24])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22572.1774446326846315653
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 06:45:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=F05j5GC5;
 spf=pass (domain: ericsson.com, ip: 40.107.130.24, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I0i9ovAgtiSFUIIO/kiuYhTPiegDZTUDwH2VBFzziDinyPZWxgZLZ5dt0Y+LKCjuvENuLQRuhMZCASDgvh07SUJcJc1lxlxoPmSxt3dOI/5hW84G2B5DtOGfhsFGmygyZ+ll4OmQQuiI4CazGqi2bg/KiAqDSIhHvUYOeUEj5VTearAwx6ZxNC12QeK6rmwOM4lm3d5NWSgJJzBkEXcFjtruQLVuOfXbd35oPHvb6iX0guq47peuw7RBrkS2KHPMa0sMhjkVIlxBnt3OmgCJAB9G+StVlZ234O7LccTGOseivKUIdM6v8/18Gdg91eRAhjO0VDou3PgmhfyYDZStFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tnffPV3Cn8IH6jGD+bfFwIoZeu80LRJY3FwXN4Me0VM=;
 b=QT+ddkhhZPXsKtn55bbYa50rKZGz+XbPhIKDcRUEqCw4PvAENSpKqNBxcG9f7N2nPGe9r1r8WWc73QvTtHNQR9+vd7wDkxBRTbi6JzcqD9CUhFf4dyb5IGK2xgJWUW6z03F9URpmL8SDLcxROmnMixtate3gIgtr/2p36X7jKwyAtdaApCFVsib3r1HBVEzGNoSknz2TzboDtStoZjF9dUD30iF2j0zOMD8IfZjHsxHp+ZYO8ncvUOLHER2rVB87oNdPdNj35mnWraWHfFg7bSnEivQWqIPLMzxItBfXI8u+qg8xvl8jzf1qDCg+Oj81t77l+5bsSUBoWWwJXZAvSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tnffPV3Cn8IH6jGD+bfFwIoZeu80LRJY3FwXN4Me0VM=;
 b=F05j5GC5FFiEhdbulIa4c0TtVMf6yo05xmfMkeaZNlmwomRMG+AJoAOMflI3zNG/HAjvEbRD1ZgHRm+41RFzXffcw3Lgtk37IfDIIpLqXSaqwaeJp8WCkfP+jDVy/huxkMoMv19yCgxiLrO3lcmgNqcBHWmn1naPCi00xUkWBvVY9mQJj5/HzlYJXMYl9ok4/U3F00abPXkkTUMwIimJjVABkMFKV58PI12WFzXz4mZUH7bpaWuF8ki8E/lT4IthskBrF76tJgHIQFF3wAEYFqvcpKE3L7Gf+DN0nWoix9qrsxE93r8P5SgOJF8dyRgtA7FQOrtlD9CmTzu9EJhIgA==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by PAXPR07MB8889.eurprd07.prod.outlook.com (2603:10a6:102:248::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 13:45:22 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%6]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 13:45:22 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>,
	"bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@est.tech"
	<pratik.farkase@est.tech>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>
Subject: RE: [OE-core] [PATCH 2/2] oeqa: replace runltp with kirk
Thread-Topic: [OE-core] [PATCH 2/2] oeqa: replace runltp with kirk
Thread-Index: AQHcvEecTK7jl1ZqZUu5QJvzt2t3LrW/NaIAgAABA4CAAAC0IA==
Date: Wed, 25 Mar 2026 13:45:22 +0000
Message-ID: 
 <PA3PR07MB10721DC20D836492042BD97F78A49A@PA3PR07MB10721.eurprd07.prod.outlook.com>
References: <20260325084021.3915804-1-daniel.turull@ericsson.com>
 <20260325084021.3915804-2-daniel.turull@ericsson.com>
 <CADkTA4PkenyxfFJR6fvFSpjKV_3MhyChDQZLZ3d5hB7HZbGyOA@mail.gmail.com>
 <CANNYZj8ys_-bBq8LSOnmyoFhqU+iFgSgukWkZOSspTy+LtSsZQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8ys_-bBq8LSOnmyoFhqU+iFgSgukWkZOSspTy+LtSsZQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|PAXPR07MB8889:EE_
x-ms-office365-filtering-correlation-id: e9b5acd2-59de-4436-7a25-08de8a74c2e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 c3OHkzS49XlAXPg5f+8mWOblK5WAONR0Yx78tRNVDv//jXDC1WLknpgmN14mU+qryRv9l1NoMuGnSJaglzdt1JxGWaD+b8LLvoL1GFlAvA59xnMYMcanv25EkLS9vVmqwdNPtLBoZ+ng8vodyjesnQ+EX9N20FiJkZwp0Tko2S9CXcQxY7nA6KzZFX3j5KG404AuqxhqqN7Wk3X+NRHQi83CEo4uxtHX4DRc5cALT0CvdLZEWltt7Xrihqcy8g853QRO8msL8akEeTDhpGt789iVWMeUMFcjYoLiQ2OC483VN0fag2pU04uW5oOD/pFdW0Ggct7e0/Dp29jFzuLzM/7oyr2UbD2QMjTbG1K5kahXZ/FImnzAkdVPJUh//dot3gklB9E4xix0zgOrcqh6OkxWySWI5mwF/xQuREDLM6X8MkJfdk+w7VoHqmmQyEcJuOZscE/1l2/Ag5kn6GGNCFkzwwnYQhbjikBjMXQQhPaZ16pibw72dvvx8N6UHa+pPzlZ2ibahu+C9f8oosuZ8uU4fQpjCgEkjl68yij0m0qOjNcK6zZ18ELRNnEBqQccp+fgbd3/p5gnPxaLvc4smxgfVUsSKQYlklnD5Rwe46t+Wver2LNAAOisj/z+eAovdITRLrQK+HgDgnjqhZ7CpBvrqFj0uFXHzH1C/h4rJRV8dj5RmY0pFH8QuiFI7Y5N4bC9uoL+eoQD1ki9dpd3jub9xAnH1bzF0vC7IWDHqT338tIXLRSRvu99gYoFztojXXnnxDJho7G+6LUlaFRSd6UVdMMlVjYcgQ0/pNTJUNc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dW5wTk94Rk9odkIzc1RrRGptRUhDK3dZc3IvRmZ6S0s3WmQzcUs2TmRGNFhy?=
 =?utf-8?B?RU80ZE1xWEZXUER4cExpenhrQ05ZT2VmRnhuNjRTU3R0ZWJvUlV4QzcrRFZp?=
 =?utf-8?B?bDZiZUxhS1ZhRUZBQ1BoL3Fod0d6dHlyc1pRSEY4WlpVSExUTlJHTU1sYVlC?=
 =?utf-8?B?ZE1JeG1aTGxsbjdYSnE5cDRvZVJidzVPQUJxOXllYTlPblcvTnd4R091VE1C?=
 =?utf-8?B?TzRSUUxEQlVrMUxNbk93YkFaU2RJOFpKcDRDT0NsSkRJVGZqa05nTzRibGtj?=
 =?utf-8?B?TkFSZ1BzWm9Ib0N2WXVaTDMxUUdhYWxsNXE5UzFVMkU5TnNiMWc0eGE4VzBw?=
 =?utf-8?B?T2xhVmx4Y1dIMEgrMFBWNDBsaGVGSTF0RVc1WHNvN0p1Z3pCQUxROWRUK0JT?=
 =?utf-8?B?UUw4ZzAvbUdJQ3dCVXlLRmpMZnhpT21kMHlJVEx0aStBbUNsbXBaTVZtMXRi?=
 =?utf-8?B?bkJNOHpsWXc2aDVUUmpDd2RQakxNNGsySjlXSGJ0dEJnYTIwWWZSYk01c3Uv?=
 =?utf-8?B?SmNsWnV1MlUrMjBIQmw0eDJyaGtRNXZaclk1dFNKazgyaDZ2TXpkemYrbXZN?=
 =?utf-8?B?R2dOako4ZG5SRjNRNHF5TWF2R0U1SUxWdmhaNFFFUTFnMVNma3VDQk5iSTZN?=
 =?utf-8?B?N09GeWw1SVR6cEFPQ1BDKzJxNDZ1dElEb2xhSEZCaXFnV1JZdlg1MWEyMjBs?=
 =?utf-8?B?M29yL1pNZEdWSittS1FnNXh1SXhTVFNqdnc1OGRsY2VDVlkvSGYwS09FMVhT?=
 =?utf-8?B?UlBNRHNIbWZHdHFCcHQ4KzUzT1RGcW5mZ1hMeFBoZWltcTBEL3ZNUy9FVWR3?=
 =?utf-8?B?WWVIS2VhZkd6RVBNaGV3dml6dWgzci9GWGlYN29xTFdBaXZkT0IvUXJpc0R2?=
 =?utf-8?B?VVhJTVZyRi9zdEtFaFlGcGxkaVFOYnN3bHBmNVJyU1IvM1RZUE00STVyWE1B?=
 =?utf-8?B?aDBoUXdaY3dQTWZQanR3TTRLM1dicnR4Q20rd3RpMlVhOUVqeHRQcDZpSm9B?=
 =?utf-8?B?aXlxOVdrTjBEQ3R4akFkM0htS0xBWGdYZTB6MFFsQzZhaDA1WkhlMGYxQ0E0?=
 =?utf-8?B?UzNMemVoVGtRV2c1VnV4UkdLRmRXaG1WdmJvMDlJajJJaG5zQjZvRXc4T0Zn?=
 =?utf-8?B?S3NBS2NTOW9XcG0reGR3UEJvTVZTK2dBUEk0UDI3K2hTa2lCeVk2aFg2cmpB?=
 =?utf-8?B?WkdjZ25SWlhGK0tQaXZJSXJlcmQwVXJZaVluc042a01OSUpINTl2ZHI3Vit2?=
 =?utf-8?B?OFdJdWxiYS80OVVDeUNkeFZtc3RBK1FaaUU3dWRTY0ZoZ050UWppR05ZTC9k?=
 =?utf-8?B?QlJkWkkxRy9xL1JHMFNKQzJ4bFVGeDBqRlBnQytXQlFWZmpVQnN2V3lEaGxJ?=
 =?utf-8?B?a2NMdGpuWTcxUVplN1VlZWtiaWlKNFJyL1FhWUdPUjRxRENtRzJBTFlWenhD?=
 =?utf-8?B?NDIxc3o0VEtOU3ZFUDdJTkpoUVlXWjVySlEyb2dhVW9WSmRqMVYybTcrWEJ2?=
 =?utf-8?B?STJIN2R3YWpUZlNaSXJmK2tPa3BPNjVUNUtobExsa0RhV2lNT3FqSG9wMnEw?=
 =?utf-8?B?L0l2NWpYTzhJNE5KbXk4QmY5SGo3YWQvUVRBVUU2YjdZRFZBeGZEaUNmblha?=
 =?utf-8?B?djdWeWpUNWszcUJydzMzdFZ5dEE2ZFJGUDVncHowNzdKcTR3WDR6ajdPVkZE?=
 =?utf-8?B?cThZU0VIYldoSmUwWjJNQjI4dDA0alVoUWZHUUhjd1hMQWl4MDNvdUVOM0Rw?=
 =?utf-8?B?bjByR1dYem1oSSs3QnpLT1dIenhlYzdGOVhjdllsY09xSDFQWGVyRkVDMGpP?=
 =?utf-8?B?T2lzQkE1SkZVOVVVa1B4YnlHMndtZ2hXQ3BWMDBmSDg0R2NNSHVFbmdJYmha?=
 =?utf-8?B?ZGZSNlpYSEFNMlI3Z2w3NWxIVVRMTkRhQ0FiQVFnS2lWODkzUk5udFJubnhx?=
 =?utf-8?B?MVBMN0VnK0poQU9CVnovU3JDWVVSelc1WmJ0aVJUY0NOblVHNE05MG1rZWw1?=
 =?utf-8?B?eGdSaTh4Vzg5V0FwQzRLa01XRDZLc0dpeU1iNU9KL09CSmNUUmY2YzZlOEpL?=
 =?utf-8?B?UjNQeHhBYTVwWFh5L0NEWnphbitBTmp0Z0RvUkZmS285SkNERGp6bUNCYkJt?=
 =?utf-8?B?ZHJ4U0F5aFVGc00yWVFCd2dyMHhjUHZDMlkwWXBjSkZtY0pWTFlodFEwSjZv?=
 =?utf-8?B?RTZvc3VqRVVjR2hzcldma0FydUluZGd1MmZ5aU5aWG1UTWlNeW5MU1l5K1d6?=
 =?utf-8?B?UkJvUDhWaWN4ZkFwcTdSNVpKcHNvZmdKWWZUVTRQUE4zcUwvUmZjbUIwb1RS?=
 =?utf-8?B?b3hlbDRhS3pwOFMxTDkwcVJibXFaQmxQUVNISzh4K3FYajVIRTlPdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9b5acd2-59de-4436-7a25-08de8a74c2e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2026 13:45:22.2943
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tbb77s7U4NGxpzIH80PgVDgX0ONTAkcTXnZBzqlpegt/brwsvV+cxXyXO8dEZvWIELLWxuAwaaYIa3K4GwmI2GnKFB9nKXvjfqsJ4Pc4SdM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR07MB8889
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 13:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233915

SGksDQpJIGFkZGVkIGZvciB0cmFuc3BhcmVuY3kgdGhlICJhc3Npc3RlZCBieSIuIEkgaGF2ZSB0
ZXN0ZWQgdGhlIHBhdGNoIHdpdGggdGhlIGx0cCBtYXRoIHRlc3Qgc2V0IHRvIGJlIGFibGUgdG8g
ZG8gdmVyaWZ5IGl0J3Mgb3V0cHV0LiBJdCBnZW5lcmF0ZXMgdHdvIGZpbGVzOiBhIHJhdyBmaWxl
IHdpdGggdGhlIGxvZyBhbmQgYSBqc29uIGZpbGUuIFRoZSBkZWZhdWx0IG91dHB1dCBmcm9tIGtp
cmsgaXMgYSBqc29uIGZpbGUgd2l0aCB0aGUgcmVzdWx0cywgaW5zdGVhZCBvZiBkdW1waW5nIHRo
ZW0gaW50byBhIHN0ZG91dC4NCg0KSSdtIGF0dGFjaGluZyB0aGUgb3V0cHV0IHdpdGggdGhlIHBh
dGNoZXM6IA0KbHMgdG1wL3dvcmsvcWVtdXg4Nl82NC1vZS1saW51eC9jb3JlLWltYWdlLW1pbmlt
YWwvMS4wL3Rlc3RpbWFnZS9sdHBfbG9nLw0KbWF0aC5qc29uICBtYXRoLXJhdy5sb2cNCg0KSSds
bCBtb2RpZnkgdGhlIGNvbW1pdCBtZXNzYWdlIHRvIHJlZmxlY3QgdGhhdC4NCg0KRGFuaWVsDQoN
Cg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29y
ZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIEFsZXhhbmRlciBLYW5hdmluIHZpYQ0KPiBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnDQo+IFNlbnQ6IFdlZG5lc2RheSwgMjUgTWFyY2ggMjAyNiAxNDow
Mg0KPiBUbzogYnJ1Y2UuYXNoZmllbGRAZ21haWwuY29tDQo+IENjOiBEYW5pZWwgVHVydWxsIDxk
YW5pZWwudHVydWxsQGVyaWNzc29uLmNvbT47IG9wZW5lbWJlZGRlZC0NCj4gY29yZUBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnOyBwcmF0aWsuZmFya2FzZUBlc3QudGVjaDsNCj4gcmljaGFyZC5wdXJk
aWVAbGludXhmb3VuZGF0aW9uLm9yZw0KDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENI
IDIvMl0gb2VxYTogcmVwbGFjZSBydW5sdHAgd2l0aCBraXJrDQo+IA0KPiBPbiBXZWQsIDI1IE1h
ciAyMDI2IGF0IDEzOjU4LCBCcnVjZSBBc2hmaWVsZCB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KPiA8YnJ1Y2UuYXNoZmllbGQ9Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdy
b3RlOg0KPiA+IEZvciBzb21ldGhpbmcgbGlrZSB0aGlzIHRvIGJlIGNvbnNpZGVyZWQgZm9yIG1l
cmdpbmcsIEknZCBoYXZlDQo+ID4gZXhwZWN0ZWQgYSBsb3QgbW9yZSBpbmZvcm1hdGlvbi4NCj4g
Pg0KPiA+IElzIHRoZSB0ZXN0IGNvdmVyYWdlIHRoZSBzYW1lIGFzIGJlZm9yZSA/DQo+ID4gV2hh
dCBhcmUgdGhlIHJlc3VsdHMgb2YgdGhlIHRlc3RzIHZlcnN1cyB0aGUgcHJldmlvdXMgaGFybmVz
cyA/DQo+ID4gSXMgaXQgdHJ1bHkgYSBkcm9wIGluIHJlcGxhY2VtZW50IGZvciB0aGUgcHJldmlv
dXMgcnVubmVyID8NCj4gPiAuLiBldGMNCj4gPg0KPiA+IFN3aXRjaGluZyB0aGUgZXhlY3V0YWJs
ZSBpcyB0aGUgZWFzeSBwYXJ0LCBlbnN1cmluZyB0aGF0IGl0IGFjdHVhbGx5DQo+ID4gd29ya3Mg
YSByZXBsYWNlbWVudCBpcyB0aGUgaGFyZCBwYXJ0Lg0KPiANCj4gPj4gQXNzaXN0ZWQtYnk6IENs
YXVkZSwgQW50aHJvcGljDQo+IA0KPiBJIGhhdmUgdG8gYWRkIHRoYXQgdGhpcyBsaW5lIF5eXiBk
b2Vzbid0IGluc3BpcmUgY29uZmlkZW5jZSBpbiB0aGUgcGF0Y2ggZWl0aGVyLiBPbg0KPiB0aGUg
Y29udHJhcnksIGl0IHJhaXNlcyBzdXNwaWNpb25zIHRoYXQgdGhlIGNvZGUgd2FzIHdyaXR0ZW4g
cXVpY2tseSBhZnRlciB0aGUgaXNzdWUNCj4gd2FzIHJhaXNlZCB5ZXN0ZXJkYXkgaW4gdGhlIHRl
Y2ggbWVldGluZywgYW5kIHdhc24ndCBhY3R1YWxseSB0ZXN0ZWQgd2VsbCBvciBhdA0KPiBhbGwu
IFRoZSBjb21taXQgbWVzc2FnZQ0KPiAqbXVzdCogcmVhc3N1cmUgdGhhdCBpdCB3YXMuDQo+IA0K
PiBBbGV4DQo=

