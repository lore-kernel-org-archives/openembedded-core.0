Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 329BCC9833E
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 07:39:21 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.61])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53249.1790581151133465699
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 00:39:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=Bl96Q39n;
 spf=pass (domain: ericsson.com, ip: 52.101.69.61, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k1kb/umvhxthZSs1iuOfuruySsGSZTnJogbQutYk1gjBNudKehyoEM+627+txHfJOni09SzsjmgWZPFZTUx+lU5Y7Uar8H3Xvl2ywOThzS5LUTSy6Apq+i3wyMtTZNqlZ5P8r7qIpfFEU3nHg1EJU5QTjQo5ERFL7zu7hbKKItzX8kj3TJ4JEUoDnGFwXngKqLYnIwElNdRzzQ9fQRjPm5GBc5rry7T+phlJa5WMPPo/frpE3MoBGtp2Ly/SMrbwqx2F9jy+rsW2uGrXxVX9lKxxwiLlWLpSGFKoCbu94dt06HGlWWAU2ysIv5lkSzO5Y+uQ4zRRS3LbP1L7CqU30Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j956wcIC5fqlxiFAWelbzW21+JIVFeujwq9YMp1LGwM=;
 b=K6m7KcUg2S/phxYEm31JYCRLhBNzz7vO8d+vUvyOmvGOaEBLmaoJMxXP01PxfDXPatC8ouax3PsC9W3nkTYTJxjYfOt+ez+Yw/07R5AC1xawO1U807WKlI2ILgsA22VLI9k+SnYhf4ljptzUy3gkc391b6/wNzmQIs69/cwgeV4mgWlqntVfy9bzr4JJ5adiUP1Hg62W+en9ks8QA1UH/3lX4AjJOSF2rliXSlq0cuwJ/RS1WypWv5f0nPSJR29MgFg/KHh4ikIqusBrGrxYrc6iZQbCvijf6s3A16xEMAQsY19OJOcnrsRFmzRpx78UoUSbrvToR9xGl/miP7+y6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j956wcIC5fqlxiFAWelbzW21+JIVFeujwq9YMp1LGwM=;
 b=Bl96Q39nQ2jbAkbX/ERTkYjfsl+91OXoKu8Ph4PUcDf88iz7+NAE8vxl4TgsM2pSJjiJhMWZL0NiVpovVqXzq3MFMFr9Iht3bF69QLZmh5kQp6gGKeHLOvHmAWvClGd03NtLVa1mpVTTVGDND1z3bX+CV1M0PQkIINkVHQA5d3xt/wqO1cNtssRxvS+S4QNlvYa/oXWK79C2zQMEStdiiRdpYz8fJOMkmOsIP9zrW6c+Jus3tQBceEYum0q/xFP+PzjMytOjoxr+s1uIgMuBgc1J51HMRfnbcJk6g5Wc9QbGP7IC0MNNGPSv1gq277vaKw8/AS2SUwp81jOQViSMcg==
Received: from AM7PR07MB6437.eurprd07.prod.outlook.com (2603:10a6:20b:140::11)
 by AMBPR07MB11323.eurprd07.prod.outlook.com (2603:10a6:20b:6ee::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 07:39:06 +0000
Received: from AM7PR07MB6437.eurprd07.prod.outlook.com
 ([fe80::fb9c:237c:ec12:2db0]) by AM7PR07MB6437.eurprd07.prod.outlook.com
 ([fe80::fb9c:237c:ec12:2db0%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 07:39:05 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>
CC: "JPEWhacker@gmail.com" <JPEWhacker@gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] create-spdx-3.0: record component
 release date in SPDX output
Thread-Topic: [OE-core] [PATCH v2 1/2] create-spdx-3.0: record component
 release date in SPDX output
Thread-Index: AQHdTMdD4alKShMqlUqkR3yUTLX8BrbiNVCAgAFqAAA=
Date: Mon, 28 Sep 2026 07:39:05 +0000
Message-ID: <8b0d92bfaa306004272df85e1e461b6ac18fbc3d.camel@ericsson.com>
References: <20260925082404.1491266-1-daniel.turull@ericsson.com>
	 <DLQ0HH8L9QHZ.1WYTWAWQERROV@bootlin.com>
In-Reply-To: <DLQ0HH8L9QHZ.1WYTWAWQERROV@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR07MB6437:EE_|AMBPR07MB11323:EE_
x-ms-office365-filtering-correlation-id: 373b4cbb-5701-4b65-3b01-08df1d339313
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|10070799003|23010399003|376014|38070700021|56012099006|4133799003|3023799007|6133799003|10067099003|11063799006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info: 
 gv0Wpcco8uOx5sMbFuKMvAQqw6A3dpjBYRb7dsDZNv91z0gfVKZ0XIX3k/houVd5eJDVyUmYWCJt/aLFBY0f7jlhIpEZ3HAJHtIu8i3nfSoiaF9ttJ21oCJbO5B9dNES/GT7WdGv+bR0gui49FTR+4zfBJfg7AehPAqL9p21ZtUNxl7C/AotxfNXvgsgSx03VkcDMGFxT22I1d6/o/+Yrp0JOBudXmcEHd9dKpOFRG8vjBc34VxF0glh5iLDEfBI2hOxsZ8KbbqB9BWdo267wwJfeMzoCmIrAQDK5e1Uslm0NME8YiPmPC0WZ2az21EqHYWyvYH5hXXVhLOyzkzmIzojR4tfL+7upiW0W2fcS9OLLSLhTdpaHo/rpLmY3dKFFTs0ldw4nyGj7nAuYvjjuVOGVkcNbngmHPRsO590ZvrYhfqo4oJeklha7WuSn7dg6dxuGUbXzzycdqmFZMSHLMOYxGZk77RnxwogVqJ00weBo7gSVFvLi3MXoVVMDGfpCxLOBmiDuio3RoEh1XoUTq7bV5PCDGA2X3BCgnhv+xZK7cFgeBpp/3KPMZlQiaoTdYCbDLrAkUOMFIBw4sGnAn3qVKDJddIslSCbfAYa+jf0NcmXRUtI9zhksuTEFJtyGOGmV00vOCmNygSAS0nYYhBHs5+VXDatSjapHa3GGvE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR07MB6437.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(23010399003)(376014)(38070700021)(56012099006)(4133799003)(3023799007)(6133799003)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?R3kzbmVTOFM4eTVKcndKT3Z1RE9mUGUvdGN5WGNIS3pHQWhzMkorRWExMVkv?=
 =?utf-8?B?MDY2dkhwOGlaZEptTGIwQTVZdkkwZlpSTDlIVzdVUHFNcFNKU3UvNjBCUmF0?=
 =?utf-8?B?aGJ0TUV2MnNVVjBLT1BZbTRNNEUvWmhsbldVY2FlNjZLWkxhLzlIK2tCRUpy?=
 =?utf-8?B?cFBHaWFQK21FVld6V1NHdVhuN1NGbjhLVVBkdEovY3h0UGxkblV1ZVo2Y3p0?=
 =?utf-8?B?eWovTDFvN0lWUnY0MkN6bkZJbUdyZ2M2VWNzNlRSVWltc3F5U0c2OFpTa2gw?=
 =?utf-8?B?U3QvYXYweVNDUjFLZ2hINjJSbVJNMi84VFVqVU1tTWtmVkFxQ0VQR2V0SjZV?=
 =?utf-8?B?S014TWFwV0lGUlZVNVNGMWhseWVKa0Y0RXJyeXNFWlhTZEZvaldIS2JGMzdY?=
 =?utf-8?B?M2w3d1QxN01LUnpteGJZZ0ZsVWdud2NtbXVMV3YwZjdaV25DeGJzOVBWdEFT?=
 =?utf-8?B?YkpIdnpKc0NvMlVFRU9mSHJwU2xjekphQU4xNnBtYjc0WHpOU1Y2TUtpZzV3?=
 =?utf-8?B?SUlzSkliUDRocUR6aFJlbjM0WTFtblVqUC9tN2g5YTY5QWxLamIzZ0JoWkox?=
 =?utf-8?B?aDVUN0tUSW96OXI4Yk9UZkNKNUZjeGtlMXlBc3RlNWNubkVQUUNneVV6dVNY?=
 =?utf-8?B?dWk5Mkx1blhSUkc0SU1iVkRhYjJ0Y0E3b243OG93dlU0NVY4bUdSOWRteC80?=
 =?utf-8?B?NTdhbU5QaHZxcDNyY0RqMXV0SWRJWDhzcm9FT3JDNDl0ME5JR3JjY05PMXJZ?=
 =?utf-8?B?cmhlY0ROVEU3Rm0vRDFKQjA2MWZxOTMxNUdNeElVTlpqMi9yeW1GTjNLNWZC?=
 =?utf-8?B?R2tvWUQxRzVGRm1wdmxJT0Z0VFJYcEtQL1B4SXpSSVMxcFJBZ1h0bGxBa3BB?=
 =?utf-8?B?K2poNXNmTm9ldGhxYTFxUkM5OGk2MmpMaTdkaUwzeGVmb0FWeW1XbmVqYUho?=
 =?utf-8?B?WVpDVmxZdlRicGhPTU9oZlZHekJPVTk1SjFOL1pNZzZOZjhaUXNkRXBsUEdD?=
 =?utf-8?B?OFplNFNpYjJoZjhoTFltQnFyRjBjTkZlN25LNzkrU3Y0STE3eW5KbHFFZTVn?=
 =?utf-8?B?VWw4ZzNmbWtxVW5OYWpwTldyT2lZTEduWUxva1ZvbXNBMlZXNUtHM3Y2NDVw?=
 =?utf-8?B?MmRiQ0lnQjlleEoyY0drK3RyUUFKUFQzVkpaWThMcGcxekhPVTBpTFlLWTNk?=
 =?utf-8?B?Y1BZRG5mS2xiQ3BsMjZ4cG9YMGZoM1htOVQvYnhaelV3ejM1dFJmQzF4R3RL?=
 =?utf-8?B?ZVVGOW9aZjg4b1FXNGpYa2ZId2tBVWJBb2NzczR6S3F0WG85bWZOM1JmZUZn?=
 =?utf-8?B?bDlBZHgvTWM0SGVmdjMyNzRPVHpBRVhuVm5GNWZ0NlQ3RnYvZGhvaTFuTEpX?=
 =?utf-8?B?SVJWdGVBYzVUakJFVnMvOVdTOWd3b3lwaEdoaUlNZ0cwc3ZRU2J4VXRqM3JF?=
 =?utf-8?B?NmlCYlQzQkMvRzFhd1Q3MSs3SCsxekVGdEpocUZoUVRyaS9tNG5TK1VHdW1K?=
 =?utf-8?B?TG5TRFBzaGdCcGxMYWtEbE05VXlKYW9MeVpDbWU5bzFCamYwSUZTZWl4MlFn?=
 =?utf-8?B?eERKRzZ4RnAxVXlNVHlwRktJd0s4RjcxYU10aHE5SThUQVpPdDBOSzhGQllT?=
 =?utf-8?B?RVNjeVZxczNoNGdDVDhKMXNhQjE2TjlmV1pyRnVGSWN4RzVRUVR0REh2SDV6?=
 =?utf-8?B?VUc3enRvVDNSbWJTM1FvZGQxNkdkSzRWU254bkV6VnBZTkxyQ1RzcFFVWFlx?=
 =?utf-8?B?M0FxVGR6TDJmeWxTVDY1a3YxK2x3bDdJWTJ2ZUZjNDJ4anowMEx4UGVQL3Iy?=
 =?utf-8?B?TVVpNWxiYkNpS0NaOWd1ditRU0ozRTYwNURQNURBay8wQk9Id0JwS1Zod3Y5?=
 =?utf-8?B?S1RpNlMvN3RWb3grRlBqcW5rTXlhRTVBeTZyMjRocEZkbzBjTlJqTGE3WUp0?=
 =?utf-8?B?TWphV1VBeEwwcVgzR2hscEJpZUZVU1U3dG1yZFNrUjJwQWY4UVRzSFpUKzBv?=
 =?utf-8?B?Znd3UFNYWFZVa29TV2ovTHo1YnZOcVBuVk5rQWVwSHE3dVFiSEY4cUJoWjZr?=
 =?utf-8?B?b01TZVlXcjg1VFBQWmRURElRU3VPZlZnZVloTlIwOUplNXYvMUVIUnlMOWtt?=
 =?utf-8?B?Vm9rR0xOYkk3bEQ3SlJ5OTlvcWF3NGI5NHBWUC9SUVpiUTg4Y3RXR0ltNXU3?=
 =?utf-8?B?L0xTVHJaRXI2OFIzY09HeUpUY3NqaS8zeEVmd2tVWWg0M1o2cVhJUVB1aHVY?=
 =?utf-8?B?cm9rcEZ4dDg2bWY2bG91MVhGSzZzK0lkZHYvZ2ljWktFQzJRYWVJSlJmcFI2?=
 =?utf-8?B?YllUcE1nRXZFZk1ESmZydzJ2MmRXSkRlZDZlK0x6TlF0am1kSmN5ZjhuNDc0?=
 =?utf-8?Q?M9B+97ak74xhVnPNPXWNJvtFxPzeUkWmlFsbsqjMxdwXv?=
x-ms-exchange-antispam-messagedata-1: mZIVNJIg8g4QPh4MoZjrHicpW1RGy0XgFzw=
Content-Type: text/plain; charset="utf-8"
Content-ID: <37CB85CE121A4540ACCE993AAF095F40@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR07MB6437.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 373b4cbb-5701-4b65-3b01-08df1d339313
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2026 07:39:05.6917
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ujvjuAJXGJb4ssK5FhKNyMbLEf5upLd3o2K4jsWPlmj40pupd+Jdydc4MEjC+W0+4Pw+i9q7kwzMdr+wmjI1yTuUqbAntNQJ/x+dt/Y8gsQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR07MB11323
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 07:39:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246738

T24gU3VuLCAyMDI2LTA5LTI3IGF0IDEyOjAzICswMjAwLCBNYXRoaWV1IER1Ym9pcy1CcmlhbmQg
d3JvdGU6DQo+IE9uIEZyaSBTZXAgMjUsIDIwMjYgYXQgMTA6MjQgQU0gQ0VTVCwgRGFuaWVsIFR1
cnVsbCB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4gPiBGcm9tOiBEYW5pZWwg
VHVydWxsIDxkYW5pZWwudHVydWxsQGVyaWNzc29uLmNvbT4NCj4gPg0KPiA+IFJlY29yZCBlYWNo
IHJlY2lwZSdzIHJlbGVhc2UgZGF0ZSBpbiB0aGUgcmVsZWFzZVRpbWUgcHJvcGVydHkgb2YgaXRz
DQo+ID4gc29mdHdhcmVfUGFja2FnZSBvYmplY3QsIHVzaW5nIHRoZSBTT1VSQ0VfREFURV9FUE9D
SCBhbHJlYWR5IGNvbXB1dGVkDQo+ID4gZm9yIHJlcHJvZHVjaWJsZSBidWlsZHMuDQo+ID4NCj4g
PiBBY2N1cmFjeSBkZXBlbmRzIG9uIGhvdyBTT1VSQ0VfREFURV9FUE9DSCB3YXMgZGVyaXZlZDog
ZXhhY3QgZm9yDQo+ID4gZ2l0LXRhZ2dlZCByZWNpcGVzLCBiZXN0LWVmZm9ydCBmb3IgdGFyYmFs
bC9odHRwKHMpIHNvdXJjZXMuIFNvbWUNCj4gPiBQeXRob24gc2Rpc3RzIChlLmcuIGNyeXB0b2dy
YXBoeSwgaHlwb3RoZXNpcywgbWF0dXJpbikgbm9ybWFsaXplIGFsbA0KPiA+IGZpbGUgbXRpbWVz
IHRvIGEgZml4ZWQgcGxhY2Vob2xkZXIsIHNvIHRoZWlyIHJlbGVhc2VUaW1lIHJlZmxlY3RzDQo+
ID4gcGFja2FnaW5nLXRvb2wgYmVoYXZpb3IsIG5vdCB0aGUgcmVhbCByZWxlYXNlIGRhdGUuDQo+
ID4NCj4gPiBUZXN0ZWQgd2l0aCBvZS1zZWxmdGVzdCAtciBzcGR4LCBhbmQgd2l0aCBgYml0YmFr
ZSB3b3JsZA0KPiA+IC0tcnVuYWxsPWRvX2NyZWF0ZV9zcGR4YDogMTAxMS8xMTUwIHJlY2lwZXMg
Z290IGEgcmVsZWFzZVRpbWUgKHJhbmdlDQo+ID4gMTk5OC0xMi0zMCB0byAyMDI2LTA5LTE3KSwg
MTM5IGNvcnJlY3RseSBoYWQgbm9uZS4NCj4gPg0KPiA+IEFJLUdlbmVyYXRlZDogVXNlcyBLaXJv
IHdpdGggQ2xhdWRlIFNvbm5ldCA1DQo+ID4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFR1cnVsbCA8
ZGFuaWVsLnR1cnVsbEBlcmljc3Nvbi5jb20+DQo+ID4gLS0tDQo+DQo+IEhpIERhbmllbCwNCj4N
Cj4gVGhhbmtzIGZvciB0aGUgbmV3IHZlcnNpb24sIGJ1dCBpdCBsb29rcyBsaWtlIHRoZSBhZGRl
ZCB0ZXN0IGlzIGZhaWxpbmc6DQo+DQo+IDIwMjYtMDktMjcgMDg6NTQ6MDcsODg5IC0gb2Utc2Vs
ZnRlc3QgLSBJTkZPIC0gc3BkeC5TUERYMzBDaGVjay50ZXN0X3JlbGVhc2VfZGF0ZV9vbWl0dGVk
X2Zvcl9mYWxsYmFja192YWx1ZSAoc3VidW5pdC5SZW1vdGVkVGVzdENhc2UpDQo+IDIwMjYtMDkt
MjcgMDg6NTQ6MDcsODkwIC0gb2Utc2VsZnRlc3QgLSBJTkZPIC0gIC4uLiBGQUlMDQo+DQo+IFN0
ZGVycjoNCj4gMjAyNi0wOS0yNyAwNzo0OTo1MCw5MDEgLSBvZS1zZWxmdGVzdCAtIElORk8gLSBB
ZGRpbmc6ICJpbmNsdWRlIHNlbGZ0ZXN0LmluYyIgaW4gL3Nydi9wb2t5YnVpbGQveW9jdG8td29y
a2VyL29lLXNlbGZ0ZXN0LWRlYmlhbi9idWlsZC9idWlsZC1zdC0yNzAwNDg3L2NvbmYvbG9jYWwu
Y29uZg0KPiAyMDI2LTA5LTI3IDA3OjQ5OjUwLDkwMiAtIG9lLXNlbGZ0ZXN0IC0gSU5GTyAtIEFk
ZGluZzogImluY2x1ZGUgYmJsYXllcnMuaW5jIiBpbiBiYmxheWVycy5jb25mDQo+IDIwMjYtMDkt
MjcgMDg6Mjg6MDYsMjA0IC0gb2Utc2VsZnRlc3QgLSBJTkZPIC0gRm91bmQgQU5OT1RBVElPTjI6
IEFOTk9UQVRJT04yPVRlc3RBbm5vdGF0aW9uMg0KPiAyMDI2LTA5LTI3IDA4OjI4OjA2LDIwNCAt
IG9lLXNlbGZ0ZXN0IC0gSU5GTyAtIEZvdW5kIEFOTk9UQVRJT04xOiBBTk5PVEFUSU9OMT1UZXN0
QW5ub3RhdGlvbjENCj4gMjAyNi0wOS0yNyAwODoyODoxNyw3NzEgLSBvZS1zZWxmdGVzdCAtIElO
Rk8gLSBFeHRlcm5hbCByZWZlcmVuY2VzIG5vdCBmb3VuZCBpbiBTUERYIG91dHB1dCAoZGVmZW5z
aXZlIGhhbmRsaW5nIHZlcmlmaWVkKQ0KPiAyMDI2LTA5LTI3IDA4OjUxOjIxLDk5MyAtIG9lLXNl
bGZ0ZXN0IC0gSU5GTyAtIFRoZSBzcGR4SWQgb2YgZ2NjLTE2LjIuMC9SRUFETUUgaW4gYnVpbGQt
Z2NjLnNwZHguanNvbiBpcyBodHRwOi8vc3BkeC5vcmcvc3BkeGRvY3MvZ2NjLWYyZWFlYjBkLWI1
NGItNTNiYS04OTlhLThjMzZjMjExMzliZi84ZDBjNWRhYmViZWM3Y2Y0NTNlZWRlYWRkMGIyODUy
MWExN2ViZjk2NWNjZGY2YzQzN2QzNjEzNjc2Y2E1NmRjL3NvdXJjZWZpbGUvMjINCj4gMjAyNi0w
OS0yNyAwODo1NDowNyw4OTAgLSBvZS1zZWxmdGVzdCAtIElORk8gLSA4OiA1MS82NCA3OTIvODA3
ICgxNS4zMnMpICgwIGZhaWxlZCkgKHNwZHguU1BEWDMwQ2hlY2sudGVzdF9yZWxlYXNlX2RhdGVf
b21pdHRlZF9mb3JfZmFsbGJhY2tfdmFsdWUpDQo+IDIwMjYtMDktMjcgMDg6NTQ6MDcsODkwIC0g
b2Utc2VsZnRlc3QgLSBJTkZPIC0gdGVzdHRvb2xzLnRlc3RyZXN1bHQucmVhbC5fU3RyaW5nRXhj
ZXB0aW9uOiBUcmFjZWJhY2sgKG1vc3QgcmVjZW50IGNhbGwgbGFzdCk6DQo+ICAgRmlsZSAiL3Ny
di9wb2t5YnVpbGQveW9jdG8td29ya2VyL29lLXNlbGZ0ZXN0LWRlYmlhbi9idWlsZC9sYXllcnMv
b3BlbmVtYmVkZGVkLWNvcmUvbWV0YS9saWIvb2VxYS9zZWxmdGVzdC9jYXNlcy9zcGR4LnB5Iiwg
bGluZSA0ODIsIGluIHRlc3RfcmVsZWFzZV9kYXRlX29taXR0ZWRfZm9yX2ZhbGxiYWNrX3ZhbHVl
DQo+ICAgICBzZWxmLmFzc2VydEV4aXN0cyhzZGVfZmlsZSkNCj4gICBGaWxlICIvc3J2L3Bva3li
dWlsZC95b2N0by13b3JrZXIvb2Utc2VsZnRlc3QtZGViaWFuL2J1aWxkL2xheWVycy9vcGVuZW1i
ZWRkZWQtY29yZS9tZXRhL2xpYi9vZXFhL3NlbGZ0ZXN0L2Nhc2UucHkiLCBsaW5lIDI0OSwgaW4g
YXNzZXJ0RXhpc3RzDQo+ICAgICByYWlzZSBzZWxmLmZhaWx1cmVFeGNlcHRpb24obXNnKQ0KPiBB
c3NlcnRpb25FcnJvcjogJy9zcnYvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9vZS1zZWxmdGVzdC1k
ZWJpYW4vYnVpbGQvYnVpbGQtc3QtMjcwMDQ4Ny90bXAvd29yay9xZW11eDg2XzY0LXBva3ktbGlu
dXgvcGFja2FnZWdyb3VwLWJhc2UvMS4wL3NvdXJjZS1kYXRlLWVwb2NoL19fc291cmNlX2RhdGVf
ZXBvY2gudHh0JyBkb2VzIG5vdCBleGlzdA0KPg0KPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3Rv
cHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy8zNS9idWlsZHMvNDkzMw0KPiBodHRwczov
L2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy80OC9idWls
ZHMvNDc0MA0KPg0KPiBDYW4geW91IGhhdmUgYSBsb29rIGF0IHRoZSBpc3N1ZT8NCg0KU3VyZSwg
SSdsbCB0YWtlIGEgbG9vayBhbmQgcHJvdmlkZSBhIHYzDQoNCkRhbmllbA0KPg0KPiBUaGFua3Ms
DQo+IE1hdGhpZXUNCj4NCg0K

