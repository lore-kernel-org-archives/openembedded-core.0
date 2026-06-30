Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E96C43458
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:57:52 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17843.1782813468395894953
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=WkXeWnvB;
 spf=pass (domain: ericsson.com, ip: 52.101.69.28, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WsEjqnLz0pSq1+1xGOQW/DEaHtBd41et9ykX35v4NgwonmO/uZvsuvXDh48QTDQK7bCnbG3rJGh1ZfawMhRJw1bxdCkU1QKJRb5LQSCbLc5pO9JDH0kQWr+Jr2F7S2Vfhdn1Hf6JiUBcyQf096BPUIH4y7OPbI3WKMXfwHmygLOAb2Azky0i1FgOrPYj8lvXZERUyPH/vixqd5xLsBN/9KER9EhkFTEpmNlwi7NcYURvmxpnl9ty6Ydv3AyjKUu3ofPBzPaLUrQyfWV4jR57gHT1I9++9E4u2RFXKXZ+X4LUslq0orbE87KbsBDrFl9foXGZ9JuWPiRi0HBaQBe7pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vnztgzegiirqng3PqBbl1W292HZ7cYtZIYC9HwyA+84=;
 b=Z8W8/CEK0G3/BUScQ+8uzIoOc11MN7kCQ8SdlOW9tNv4pLpQ6KUazS9phEW4fmkdW5N1R4aHZENU6uK/lRZciwOKnpYtHZ/JUXxXUABLJ4W7/8DZIyX1OG8cyy0mE4jGVJS5mfKUjxnTcFQi1uwLvcLG/1wssJRCNBnDg7SDx11CGC0DRJpP/lA3du2+U92Gl+IUTSSIiNT4R7SoqY91qD1MsoHUXhB1NxqbZJRXqyrigXs+Eh9F4BBG+QDMLlBjj5BzW/s9IoPIXzVNsEdy9XdyHKOYavstZ2gnAjQmJBIbejsjVIAqdCljXvqh4eXi7hePHL51DjbxbCt1Rxa4Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vnztgzegiirqng3PqBbl1W292HZ7cYtZIYC9HwyA+84=;
 b=WkXeWnvBcTcj1KH4Cykw3gYN8nH3PaQkbbB4xpEiaEibyOmLMtxfV5Kt/cSM3GeyMdzZ9V5N5dqGQBX4D+QDdVP2zY92bSbW5WROIEK3Watak4pZs8i5OsZ3xb3m7l/itMG13LZvi5Gzvk63SNX7WF3CYc/apuHD4BrkeKtfVQ4Gglfbvj5gOkyLRD9YCT9wpQCL0qkGxfBD1ZlcmJWegmTRFs5KxvibEndNuivTqqb50oECSsG7yFiKZvhYQCCUClGC07T/kt3XPNvlK865myaiSXRA7BQA4T2bzFAL0JsPtXZMyMFo/JdesYEt3c+/I3b69PRZsrwUnIIQbtbgdg==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by AMBPR07MB10765.eurprd07.prod.outlook.com (2603:10a6:20b:6a7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 09:57:44 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%7]) with mapi id 15.21.0159.018; Tue, 30 Jun 2026
 09:57:44 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "Ross.Burton@arm.com" <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/3] classes/meson: use ninja explicitly when
 compiling
Thread-Topic: [OE-core] [PATCH 1/3] classes/meson: use ninja explicitly when
 compiling
Thread-Index: AQHdB9HVAsrWb8/jtkWXSF19iC+Um7ZWwRYAgAAB/YCAAA+zgIAAAReAgAAKRoA=
Date: Tue, 30 Jun 2026 09:57:44 +0000
Message-ID: <cc081db55bb81ed8010e02fa99469ea95cc969c5.camel@ericsson.com>
References: <20260629141559.1305873-1-ross.burton@arm.com>
	 <DJM8EZJFQZCJ.2860UZRX5PB0Q@bootlin.com>
	 <ed70423e6ae6dfa9da7e739fd3c59a8f041a8773.camel@ericsson.com>
	 <DA367819-E672-4344-B7C7-5A7D2089A0A1@arm.com>
	 <697ef358000f2bceb6c4325f137492f1f677d566.camel@ericsson.com>
In-Reply-To: <697ef358000f2bceb6c4325f137492f1f677d566.camel@ericsson.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|AMBPR07MB10765:EE_
x-ms-office365-filtering-correlation-id: 928427bc-ff6e-42db-a24a-08ded68e0841
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|23010399003|22082099003|18002099003|38070700021|11063799006|4143699003|56012099006;
x-microsoft-antispam-message-info: 
 npRPK2BlZTX2mNXdiCN/ycxAXdfnIE61OOcANvmReBTtqOqAbUkYqbof2T7QPjGAVijAsqlbdq2sQRQokPGOGAkD0GLAaw9gDaAc+t7xeicQoCJ60qoizzmcksg/edRgZ6CDN36VMTwxH0VEsD9fjTKdsXGD9ZUu2gb1Oasx8vqPsfEssnEvxkJG+Li4hfaNGoPqAofByfHZzYsqrYv36JyQ5g9Mnu7iSdOprRoQydR3pDrkeERR0Pn2MYRvSmR1iKlBJPoY2lL0iteSBNHUpjc0d4VKoAecKP2CMsAlwiKeSqCOeU7pPslXKSMFzc48GwDJ/IQFy+49ayucEPVTMJNcS0X5gIPSG2xb4DIqvdeMuNdUfS+t/zNUnnaIpg/lXbapXcKFIt2sXu/QdDeo4N5wKv+YQPy+fJjqaWwAqMFrBkPu3dQgs6ZKy/QSwcnonoS15eTgLDJQsDjmiXBuItSgFsS/HmEJiEJJiREnz3y5JnnVFA0ResKUFaBSDfzzuUhUhLNKJBm911GNUE60+7bE3Y41wUHHxHoHaTLHrmLVdweQZ5QaKueciPK3cTPIliLFbmc8JiSoGzNpPdqbGpwTh0Wxs9a/OpsIJrJ/KhvOwfO5sfF3rTwez+kj6YrDSqk+6WK+vP/nGjsA83fO6CDY7WYWstCofopJg+eMP+1yIuTkduvAA5Xb8qe4scBQaNysjGAhSh+2d9JPsSCI9XCvQ4wPdKWW0brTPsXRMbk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(23010399003)(22082099003)(18002099003)(38070700021)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eHNZNXlPWlhEODN5a0NrQU5TYVBRTUlaNG0rVlZYaVJWR0dic3hkQWl4Q1Nz?=
 =?utf-8?B?S2NKOGcxV2V1dGx3d0ZvdnVXTldDV0FvbGJ1aWd6bGM3WkM5cTlxTGpnd2hz?=
 =?utf-8?B?YU9Ocnc2MElSb2dzSWlJNUt0YWd6M0ZYMWp2L2k0YlpsTnlGdHg3Ynp4QWw0?=
 =?utf-8?B?K0ljNkNiMVNFdWdxMFAxb0hjczNpZlZVS3QxNlo3L3FSYWkxRkZ4cFJ4aUZ1?=
 =?utf-8?B?SDdtMHFHNHVvZmtHYi96aHZKTWxKcDYxYmt4Q0NYUk1pWmM5T1lVb3dJNGxo?=
 =?utf-8?B?MG40Zjk1dnhib1d1RjlnNXJ6R2s0aDZIRm56OW5sbWVWSyt1MHNneExvWXAx?=
 =?utf-8?B?cThaVXFYZTVFVnJoaDg3RG51dmh6cnZibllEdDNWVmxJMGh0N081SENwdUZy?=
 =?utf-8?B?OXRYZTNDM2NvbE1sS2xHTUIzcXpUeVdxQTd4aklwUkJ2YzBzRGM1MFZXeFJ0?=
 =?utf-8?B?bXI2YVJYUEIxOHRzUHFKZTMxdXlVbkhqRFB5VVM2ZXJxZGMzOXFlTHFxNkxM?=
 =?utf-8?B?blVSMUNYS0hUMTMvZm9jVEFSV3JCRXVJRGJsNit6UUpIbTI0aHJiSUVlS05m?=
 =?utf-8?B?dU4rdFJybVBkU2wydDJVVU5pNEtiL0taQTNBUFJHQTNyRUw1czNUUHJqZ2JS?=
 =?utf-8?B?WUczQkE0MVdHRTlOOXJ2TXJweWd5Y0VDT3Y3eTVRSSs2SDBrOTNGUWdJYjRK?=
 =?utf-8?B?SnIydlNNL0t4WFl2WENYb3luUU1YekloL3NoUCtqRWhwYnE2VG5tZUR4YWY4?=
 =?utf-8?B?d0JaTGhGV0RSQ25IalVnanROOCtOR3FBZmNUdjZNd0w4bkdhOEtPUHFEZ2di?=
 =?utf-8?B?WU1tRkIwbVRFc2lqNnovQkc1ZXlzU3FTUnhwalBLUzkzOVVjVVduZEhrRTBk?=
 =?utf-8?B?Skw4RWJOMG9LNjh3WHBPVzE2MEk5M0k5SUlwMTdoSjRia3NIQUtpVTJ6QWht?=
 =?utf-8?B?MmlFaE0zREtvTTNEa0dySkg3d1hXQ0txU3hkQ1FFd2swWE5SUmpGaUV0a2F5?=
 =?utf-8?B?NkYydUFla01UTm45TGdQWFBhVjFhdXc3RGxibVFGUzdMM2NGdFgyQ3RKTm9q?=
 =?utf-8?B?L0xZVTV4R1g1TTJwU2NReDdKR0VVeUxIRmJIZ0NyMlM1aGo4Z1Y1L0JSSVZ0?=
 =?utf-8?B?bHEzWUNCWkdkdE12WWdyUEw0OHh4Y3puclRmcUEzc0FTVi9Wb01oczVHQ0N3?=
 =?utf-8?B?OU1VeWJDeGk5NXJKdHlkOGNCelZGL2dqWDBiQ004VHpGMnJYcTF3YU5hZVNG?=
 =?utf-8?B?bUd3cHpzUy8vMFZiNkxERExPcWNMbWFTbm9yQVIwUDBsbHprZnZac0t1NXVK?=
 =?utf-8?B?djJJSThOMi9zVk5WR0FBTDBnRzQvWnA0NnVtYlYzZkpZOStFbHl0V0g0dHow?=
 =?utf-8?B?N0tXdkR2YzN1cEtOaVRacmRMTStMZUszVmNMQzJFUlpQbmM0NDR2SWtEenlR?=
 =?utf-8?B?RXhnam5ERzZ6SXA1YUpPcDNBeFJZOEFESWdXdDdPY1g0TVM4QmdOcXI5YmM2?=
 =?utf-8?B?dG5wcU0wbTJLZEVvaVlhT0EvbXhqNE1uL3VXa2w0MzFNVEdkWnI4aE11T2o2?=
 =?utf-8?B?cmNvM3ZtS1F2cXBMQ2k0bjhRWjV1bkdRVExQMHhjSGRhQlhhL3VWbVgrNy84?=
 =?utf-8?B?ZW1VU3JUYVFKYjhFRCs2NFZGUFhOWEJySVk0MDRERFhtaGJXNVk1ZXg4UlMx?=
 =?utf-8?B?cTRlV3BreFh6VlM0dXhGUHZqd01pdGxYUE1vcGVOcTQrUTNSaTJXaHRDT01S?=
 =?utf-8?B?QkJRKzk0b0FLUHBESE5PNllDVTNDeDZkQWdsbHNaVVJzSktnVmdBUUxrbXVR?=
 =?utf-8?B?R0VIVStMTnVXeE1OZDRnc1IzcnpWV1FqVEphUm90bkRqT1FsYTkxOXJtWisx?=
 =?utf-8?B?dHRXSkxycEVPK0ZjQ3VzS0orTVVnWXBVZVNRZ29hZGEwYjNUejljbXAyaDVp?=
 =?utf-8?B?VzIwNjYvTFF6cWxya3hkN3BBUFpCZHFkTERROXBXN2YzWTZzV2lrUjBMY3ps?=
 =?utf-8?B?TmNXSWpoOUpvazhIRFNFSGtWM1FJNWN0bjlmakZodm40Mm5GSWVuVWMyY21v?=
 =?utf-8?B?M3lUb3BRZW5DelZ1N1B5ZVAzRE9kNFFUVk15S3lwaUZodEoraTNoRk1Jb0U3?=
 =?utf-8?B?Ulo0MG9rVlNIS3RCNTFaT0RocDBUbmpwcmRpWmk0d1h6cDVWWDN6R2QyQWtO?=
 =?utf-8?B?V0s1WnFuanhTclhpTmoxTlJJeXlQUEFXMzhLZ2pLbjNCV2pWd2kzdHh6dk52?=
 =?utf-8?B?U0JhSHpZdCtNYmM3TjRkWE9zeXNOUldDWUZHYWJ5cC8rd0RrY1JpS1VmYzJu?=
 =?utf-8?B?L3gwdnNEQ1FnTDRYbmpsRDhhMHFRaVlqNHBIelFLKzkxUnpLa2hlRzgwQ001?=
 =?utf-8?Q?FRDhE6AgSjtOp7PYYhCiLbJPKqA10s0SSuch7jzTWdu/x?=
x-ms-exchange-antispam-messagedata-1: IPH00Is0LysDVrKFv8i4eAI0HY0h1o7sBXE=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CA5E1B6F02595946847BFE0FE5F9E811@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 928427bc-ff6e-42db-a24a-08ded68e0841
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2026 09:57:44.5071
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EqGi6Gk+4/JL7FXrduA5rimj0sPvt1nLzKdGS+MOJTCVFD0vTrchmmIjl1g7IkeC+QPswhRKIeUiHrw3zhLiqIQmXFyKBEp+GFCy7LfkDXI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR07MB10765
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 09:57:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239873

T24gVHVlLCAyMDI2LTA2LTMwIGF0IDExOjIwICswMjAwLCBEYW5pZWwgVHVydWxsIHdyb3RlOg0K
PiBPbiBUdWUsIDIwMjYtMDYtMzAgYXQgMDk6MTcgKzAwMDAsIFJvc3MgQnVydG9uIHdyb3RlOg0K
PiA+IE9uIDMwIEp1biAyMDI2LCBhdCAwOToyMCwgRGFuaWVsIFR1cnVsbA0KPiA+IDxkYW5pZWwu
dHVydWxsQGVyaWNzc29uLmNvbT4NCj4gPiB3cm90ZToNCj4gPiA+IERvIHlvdSBrbm93IHdoeSBp
cyBjb25mbGljdGluZz8gdGhlIHN5c3RlbWQgcGF0Y2ggZG9lc24ndCB0b3VjaA0KPiA+ID4gbWVz
b24uYmJjbGFzcw0KPiA+ID4gDQo+ID4gPiBJcyBpcyBhIGRpZmZlcmVudCBmb3JtYXQgZXhwZWN0
ZWQgZm9yIE1FU09OX1RBUkdFVCBjb250ZW50Pw0KPiA+IA0KPiA+IFllcywgdGhlIDpleGVjdXRh
YmxlIHN1ZmZpeCBpcyBhIG1lc29uLXNwZWNpZmljIHRhZyAoZm9yDQo+ID4gZGlzYW1iaWd1YXRp
b24pIHRoYXQgaXNu4oCZdCBuZWVkZWQgd2hlbiBpbnZva2luZyBuaW5qYSB0YXJnZXRzDQo+ID4g
ZGlyZWN0bHkuDQo+ID4gDQo+ID4gUm9zcw0KPiANCj4gT2suIEkgY2FuIHJlYmFzZSBteSBwYXRj
aCBvbiB0b3Agb2YgUm9zcyB3aXRoIG9ubHkgb2YgdGhlIGNoYW5nZS4NCj4gVGhlbiB5b3UgY2Fu
IHBpY2sgYW55IG9mIHZlcnNpb24gdGhhdCBhcHBsaWVzLg0KPiANCj4gRGFuaWVsDQoNCkkgc2Vl
IHRoYXQgbXkgcGF0Y2hlcyBhcmUgYWxyZWFkeSBpbiBtYXN0ZXItbmV4dC4gc2hvdWxkIEkgcmVz
ZW5kIHRoZW0/DQoNCkRhbmllbA0K

