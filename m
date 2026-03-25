Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7845D106B53B
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 13:37:36 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22785.1774445846685947759
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 06:37:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=iZxkaiBv;
 spf=pass (domain: ericsson.com, ip: 52.101.84.65, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CWOAZOXWLvvHBB2OBfF2csa998Ze3Sfr/QeoDHST004vD+L1+dh1IWPsHhgxdGbRPpiUqMbBlqypSzETZLhRGYNYHImS+M+GYVd6xiL8Cjrh6g7kJ3XTojYXtTZ/abtGqSCvrFxSFQvb4XUuIkPMjiESzp8r1D6kqIVsrorkqISfOHJk2X3MYCV/xd55+TD4rQruicn4iytwOgaX+X9vCwq+QaVIvAhWksRZ+Qrk5SW9g3F918gy4GxaSK/iVBYsdDyS3yyhOak4+YNSQMeFCIOfTARAiRo8aoqfqnQJveIeGst49DblRu0hHwwYx/tLDhKwaGNOW/OcEKvZZHbahw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twqRuYYVEUJRzYf8Sha0oqkQ+NR4WaQziwUnSWrTUpE=;
 b=g1vV5QXp/Cz2K5r4cMXvamgqxsHSKLFuqZ0qLDzBSz3E6JfzXglrYDEq+Op+MjaklgBivE/soqoMLMy4a9rvumDaFGQGCtc62z6HyoUAeSbhJ+J1laeSUdvAZ969VDBrFIdL7eClse/IEVsmnX9lR6GLekyzYbDVBED6BAJyKef3hTTSpwx99NbkxSz2szIDSNuKBNhUO4uuR/qWQKTnNOyqHuBz0QumKt80JP/sDZzAoGSvImp9E8ObwH/HEQMfqfoyvuydtvWWfYUYb3oM2Qakh9mx/rVBsNfPuaxBlB9ZQnpXbhV243kQFB1qgNWVqYhB9R6Tfk67qCxLT1cUpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twqRuYYVEUJRzYf8Sha0oqkQ+NR4WaQziwUnSWrTUpE=;
 b=iZxkaiBv5RJvkXR+hgPEQ14J7trx9UbtfqC1Y4FeL06WvQf1RXHehRRgmMVKFrkUIrpd2BOqKT8Ln/sGSIlq80XPeegdNVxx31TnHKYfyltNs4mWlghD4isrst2BhO2ZLgayooaMgZNnkBZ5MnIQ7lqppm7mVK0tKQSlWos97Ts56lJb18oPeqoEmOZwPrSs+Cmrtty15jgiFt0R+RFb0BRFSok/9Ld1atd9nHx+H5Twshcd9cMUtMPYDfh1oHiItIBMgnu3f7cKLbDq0beaqXDdFE7PfwbGTuJuF8GeUxFTYgSy/9P2FWr+oNX7VXg+qkWreC/UwJdBtT/oT3Z5xw==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by DB9PR07MB11218.eurprd07.prod.outlook.com (2603:10a6:10:60c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 13:37:22 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%6]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 13:37:22 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@est.tech"
	<pratik.farkase@est.tech>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>
Subject: RE: [OE-core] [PATCH 2/2] oeqa: replace runltp with kirk
Thread-Topic: [OE-core] [PATCH 2/2] oeqa: replace runltp with kirk
Thread-Index: AQHcvEecTK7jl1ZqZUu5QJvzt2t3LrW/MBoAgAANw7A=
Date: Wed, 25 Mar 2026 13:37:22 +0000
Message-ID: 
 <PA3PR07MB107215FC501B1524BA2B714168A49A@PA3PR07MB10721.eurprd07.prod.outlook.com>
References: <20260325084021.3915804-1-daniel.turull@ericsson.com>
 <20260325084021.3915804-2-daniel.turull@ericsson.com>
 <CANNYZj_V96gfFBCt-pqpeGz1UPtmjrJLadnG0Xv0p3jbzzmHxQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_V96gfFBCt-pqpeGz1UPtmjrJLadnG0Xv0p3jbzzmHxQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|DB9PR07MB11218:EE_
x-ms-office365-filtering-correlation-id: 6211a097-bf57-4eeb-12b8-08de8a73a4e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|7053199007|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 8ZIDpJ3BMd4B6fqyyLEHhpvNORk7CRtR20FIPbN6YVOQGCX1dHWZU9zSIRLF2Suqiz0G8NI9N7RemsY8z/yipDr1IFlIhfxRgk3e9GJP8xB3R2Bckr8Vukru37nD6oEIME2sI/afNNWWXVgpAbWph3zRMBK7Yub+rFKjQD/JWv/tKlNv3FRaDe5M0qpM93npsqJmG4wNyEZ3Mlxg6A16cZFQv02lFY98zAWqI1XLnFAAO9rzSsAE+Ccu1LLpb364nYPW7fIjY3h1WZFATqOuAf1PY3E67+gtzUpdoq59RJ10wxSCZFTZXHLzFnK1GpeiLvOF6Kykc8xS28lzpxNjoNcf77q5kXyL+gTQM4uUkh7X6sVDyaRS3SB0OcnkE0h8Y5icG7GjCpQhcU6V6/oXCi6Lrlbsp3VhU4afuQLRrnt9NQhfRnuLaCxltDoPRXwimsyijJ/KVLbsxERcSa1mVgaetrAeZzPYJM6cE2GjDWUh3gpXmn/6V1IGiknioi1CS6eqKLC63evTAq3fQSU0Jscz176Kuk1VgChnXFrXOcIpIdHD0bMxE2XD9R7/vyjiCZE++WZrHMhK5xRaZTkiDac/KwZc/4XxDWsv3DqGShuE03hctytloUu0x+xtVe5vlJzR9dsRMSiLF2cernglpC6Tx0d7Ma2ue3UZ2YQu9o6pdAV5aEooNbQEr8moQ+kTVE4t5uNXgHhIq5ie+DSOjOD+XFjhCPVm+prfZpm2E+0pvRTXq6kTocaCgRnlHIE2CnfbYEc19zqs3OSRz2eADA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aERuV2Jzd0hNY0JYZm1CM09EYjBKV25zU3FOeW9qMjM0UHNsK21ET0NLdmp0?=
 =?utf-8?B?OXdtTnFycXhmeGF6RmlBQi9YRm5KNC9DZitrVVdaSzZVL1Z2d1VyYksyaHJ3?=
 =?utf-8?B?em1HZXB6TEc0MlkybE5oai9GaTcrOTl0bVo3MFV6UGdUckp6QVp1RmZYSXdL?=
 =?utf-8?B?OU91ZEVncUFyZ3pGSGF2NWpQcnBDUStkcmJVQUpvY3JZV3NuQm1ZZlJ4Wng1?=
 =?utf-8?B?SDNJVFpRcHRGNk42Zllwa0poS0FwUlljOE42WFJpYjdUT290eWZ0RGZxTlBx?=
 =?utf-8?B?dkFFMUcxcHJ0NXJJcFlvRHVEU2FXL0lvbkszaDV0Y0NUQ2xORHVEQXBqQ1Zm?=
 =?utf-8?B?N1N6UDNLWlo0bFczSEtQQTNjQXdiNlgxMWlISHAzNktmZnJvOGdwWEZRVzR2?=
 =?utf-8?B?L0d2VThlVTVhTklDMS9GZEFLS3hCeWJ3WWJrSFBPNXo4MW9vV0lmMSs2TEdH?=
 =?utf-8?B?R2o0YzVvejgvRnNTTHRSbDR4L1BYTURVN21QSlhxNEtXalZNSGNWZTllYXQr?=
 =?utf-8?B?OVRZWTVzMVU5aVFRcEtGNVBjY0IvSThSUG5GNytZYWhpUDNhUEQxMTU5azhr?=
 =?utf-8?B?UXMwdGcvWkx6K1hYMzMrcjR1S0Z3aWlKSDNtMVU5bUt1RG1JL25TZTIzSmZk?=
 =?utf-8?B?Vm5jMTF5RlJRZHc0c1ZMUzFXYWVzL1BUWXFBUEFzKzBLMndXSFQzNUlGeC9I?=
 =?utf-8?B?L3VOZjhYODAzMmFJM2MzcXpvU05PeG1BVk1zRFR6NG1sOXBrZ0NYZmRqdTNH?=
 =?utf-8?B?YndrZGxPTTlkbnBna0lZTnVESnBmR0xJd1BwWUx6TDdza0tSTmh3V1VIQTc2?=
 =?utf-8?B?cTNkVlA3T2hya0l0TWdZUGZ4amowRXEzbnZuNjJ4Qi9ZaytSK256UWxPeTZD?=
 =?utf-8?B?emVQNzJSQlRmOUk2ZUdLYlV0KzZMS0NGN25PRU5GWExTTGFIMjM0dldJNVFX?=
 =?utf-8?B?cDF5ZmI0cFgvNzlOaWFybEtWM2J6QWYvOU83Y2ZWZ1dvZjFWWkJBSW1wSG9w?=
 =?utf-8?B?aDJybFhaT2Iza0hYSndoczgxSCtLRWVkMVpUd1E0WUdqSGFXK3JvK3NGRTJ1?=
 =?utf-8?B?ajZnRW4zV3pTTU1zY1JHa1IySHpJdTEweDlaSXY1bVI0YUNVRFNpb1RtUit6?=
 =?utf-8?B?UjdvS0Vka2taVnh1eDE1Z2w2b05DS0hiQURTaXFTdWlIUDR6TDQ1Y04yd3F6?=
 =?utf-8?B?WjB1TmZtUW12Qm9XSkhVdENJVlRSQ2Z2L0pOenAvMUxCR3dHc3FiNWV1eXB1?=
 =?utf-8?B?a0FrUXp1ZDdoVFhSNmJqdGVVeVMyclFKbEJRdU1BcGdIdm9jdmJTbzlTNGZL?=
 =?utf-8?B?QWhUbE9uTHl3Ly8yaTJXdFlyUlo1bER1bFNaOXh6UHlVS2VoZEg5Ymo5N0hQ?=
 =?utf-8?B?VS9IZTIxRXdvUDVsOFJMSlVhTWpJMkVxWWJWaXM5TC9Ucmo1cWVZTm1nemUz?=
 =?utf-8?B?SXhFYnVjOHJPWi9LbFJ1Z1o3T0FiYlFrVTV5R0N3WEVDVG92Yk14eER1Syti?=
 =?utf-8?B?VEdzNFRtY0d1L0NLMmhidlBjK2RHS1kzbld2T3NKVlIwUDFBaThvZnp0b3Y3?=
 =?utf-8?B?YmlQcUZFeHNYT3VxQktpMWIwNHJydGcvbXRyLyt6djhXcHJoREQxdlBacjhE?=
 =?utf-8?B?WGdlSWVMUlZhRFNMUkk4MGp3SUNBcFc3RGVtemdMeEhhYVAvNGo3ZkdLeWtL?=
 =?utf-8?B?QTlTaXc2bXF0Rk5oenRRRnQxa24rWHRBYXQyYTJzWXp2L1NCQktRUlY4TTFU?=
 =?utf-8?B?V1BMeXBUVXNINzVkQlJuQVlJS2JKdDg0T3NEWGxNRStSR09nbGFVOW82YkRM?=
 =?utf-8?B?RExmb0Rqa3A5dUxPRUVhOTB5RWFBa3RxN09Id1NzTTg3dkd5RndKb3VCVnpJ?=
 =?utf-8?B?NWpIZ2ZUQnpTRzM3eGd1ZGtRa0dsWlFkaFI4ZEtTUlZTeDVEYVJ5eVFuRVRC?=
 =?utf-8?B?SC9VYk82aGt4Rm5EK0R1NzBtL0F0V1ZiVlF2cUR1eHJPRW05NmlFdlBDWkdh?=
 =?utf-8?B?V3gxVDJsZ09qN1JWUUNiUWJYVzc5Qk10SGgreEk4R1lhcmw0UVRxMWtKN045?=
 =?utf-8?B?cGwwRnlxNkdIUnFaR2ZlQzg1ckxKdXN2NGVVR1l3SlQ1L0IyOXQ5S005dmgx?=
 =?utf-8?B?SFZTU3Q5UWJjMFFWQlc4ZzF2KzJkVFlmTlR4aGFjSFdVL0VoUjVDT1RJdEE5?=
 =?utf-8?B?SFROdGJ4UEhxYTVuRlYySWI0dERuVVkxQ0xISlF1cUx4bjFEVkx1LzhpWEtW?=
 =?utf-8?B?alhUUDVRSHNWbFdLQ3J2MlljTDJ0ellFby95aEt1eGErNTdNNE1lZG5vT0hr?=
 =?utf-8?B?clQvcmlRaWJOWkxKbklTOHgzMVBmeTV0eGM1ZEdPUDYzUDhPbEJWZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6211a097-bf57-4eeb-12b8-08de8a73a4e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2026 13:37:22.4420
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UdUCfw/oi7hGZ1mhSlUL4Ye4OasuX+32fBdE7myRcQhoxqDvbGbjINsp/QXmDTgOwzRnKlhcLzNUibLo7QKLnCW3Z7A/A51SE7+XkhNODQw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB11218
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 13:37:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233913

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFsZXhhbmRlciBLYW5hdmlu
IDxhbGV4LmthbmF2aW5AZ21haWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIDI1IE1hcmNoIDIw
MjYgMTM6MzkNCj4gVG86IERhbmllbCBUdXJ1bGwgPGRhbmllbC50dXJ1bGxAZXJpY3Nzb24uY29t
Pg0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzsgcHJhdGlr
LmZhcmthc2VAZXN0LnRlY2g7DQo+IHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmcN
Cj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggMi8yXSBvZXFhOiByZXBsYWNlIHJ1bmx0
cCB3aXRoIGtpcmsNCj4gDQo+IFtZb3UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20gYWxleC5r
YW5hdmluQGdtYWlsLmNvbS4gTGVhcm4gd2h5IHRoaXMgaXMNCj4gaW1wb3J0YW50IGF0IGh0dHBz
Oi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdDQo+IA0KPiBPbiBXZWQs
IDI1IE1hciAyMDI2IGF0IDEyOjA3LCBEYW5pZWwgVHVydWxsIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnDQo+IDxkYW5pZWwudHVydWxsPWVyaWNzc29uLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnPiB3cm90ZToNCj4gPiAtICAgICAgICAgICAgcGFyc2VyID0gTHRwUGFyc2VyKCkNCj4gPiAt
ICAgICAgICAgICAgcmVzdWx0cywgc2VjdGlvbnMgID0gcGFyc2VyLnBhcnNlKG9zLnBhdGguam9p
bihzZWxmLmx0cHRlc3RfbG9nX2RpciwgIiVzIiAlDQo+IHN0cmVzc19ncm91cCkpDQo+ID4gKyAg
ICAgICAgICAgICMgQ29weSBraXJrIEpTT04gcmVwb3J0IGZyb20gdGFyZ2V0DQo+ID4gKyAgICAg
ICAgICAgIGRzdCA9IG9zLnBhdGguam9pbihzZWxmLmx0cHRlc3RfbG9nX2RpciwgIiVzLmpzb24i
ICUgc3RyZXNzX2dyb3VwKQ0KPiA+ICsgICAgICAgICAgICByZW1vdGVfc3JjID0gIi9vcHQvbHRw
L3Jlc3VsdHMvJXMuanNvbiIgJSBzdHJlc3NfZ3JvdXANCj4gPiArICAgICAgICAgICAgKHN0YXR1
cywgb3V0cHV0KSA9IHNlbGYudGFyZ2V0LmNvcHlGcm9tKHJlbW90ZV9zcmMsIGRzdCwgVHJ1ZSkN
Cj4gPiArICAgICAgICAgICAgaWYgc3RhdHVzOg0KPiA+ICsgICAgICAgICAgICAgICAgbXNnID0g
J0ZpbGUgY291bGQgbm90IGJlIGNvcGllZC4gT3V0cHV0OiAlcycgJSBvdXRwdXQNCj4gPiArICAg
ICAgICAgICAgICAgIHNlbGYudGFyZ2V0LmxvZ2dlci53YXJuaW5nKG1zZykNCj4gPiArDQo+ID4g
KyAgICAgICAgICAgIHBhcnNlciA9IEx0cEtpcmtQYXJzZXIoKQ0KPiA+ICsgICAgICAgICAgICBy
ZXN1bHRzLCBzZWN0aW9ucyAgPSBwYXJzZXIucGFyc2UoZHN0KQ0KPiANCj4gV2h5IGlzIGFuIGV4
dHJhIGNvcHlpbmcgc3RlcCBhZGRlZD8NCg0KS2lyayBjcmVhdGVzIGEganNvbiBmaWxlIHdpdGgg
dGhlIHJlc3VsdHMgdGhhdCBpdCBpcyBtb3JlIG1hY2hpbmUgcmVhZGFibGUgZnJpZW5kbHkgYW5k
IG5lZWRzIHRvIGJlIGNvcGllZCBvdmVyIGZyb20gdGhlIHRhcmdldC4gVGhlIG9sZCBjb2RlIHdh
cyBoYXZpbmcgdGhlIG91dHB1dCByZXN1bHRzIGluIHRoZSBsb2cuDQoNCj4gDQo+IEFsZXgNCg==

