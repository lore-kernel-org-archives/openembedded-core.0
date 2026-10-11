Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8EE9CA9EC9
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 10:46:54 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24819.1791715613754497557
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 03:46:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=rl2EJf1N;
 spf=pass (domain: siemens.com, ip: 40.107.159.46, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dmp0osE3xNwdvaIV08CKI44sQj3wQNLDYlpA9mzMqxWJ+j8Q6s0zpRRizR5dBDeW+XCjxtPiCzqS1QVp197d0ZpSKaT8QNwfIP7VncX1By4UsStPN9XaNAjoApnf8VTJbiMEjpkHh63qC6qBK6Hsq88Rcrh46QCmAoILW2n1T7L4a1J7eDXnUKdvX+PA/zB3nrBth7l1PI0u5jG4ObZlY+TwdtJoeBlu0SS3ue+6guRx+dijMvPQRpJd5NxJxaf6z4Xh2MRI4dOcksjDgljtk51Ql3g4e373zXfxanBMN86KuQP8ZinxLvNuUOiX1PNl+R5Zcbn2b+m8vVplD6bntg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXvKp/wHPcxSJdDafnTwekprN8PUdNUOP/uAajXyuwY=;
 b=iojEoRY/OxpRSsSVGPAEL7nWHZI5bRRXyUZHcEDwwd7gpno80WEOk1ZMngT8ZyIA2zytUlrWvqfoSdepmbNIXuDzePhgPvQb38fXUhf78i4KbGfKwjj6aYUQM//28XXgTmaR10607nhtnDdfcCPxcFs6yarN9GyLzjpzn5eCvX1EMiHiG6TFyP+2me2WKALbRA69jUeMHCAhwJdsiocG8j4prZzSvi44FrBvZEF59/2OkIdj0z6OGmsk6yVTZ2arbckKCi3iJG8GBx/KAs+huH+pAVeHRxNlIwx78/nEw2KoSeJQITVjSFFtWv/brKQEGlat2iW5ugG3F9Un9HzvTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXvKp/wHPcxSJdDafnTwekprN8PUdNUOP/uAajXyuwY=;
 b=rl2EJf1NUvZUYplKeV1KZUMq5V5Nz0zMQ4JTlRAYGZzegTxm+2ddyVmkpcCvLFsjUQsGh/Ctl8v496BN0EO/aTs+dSeG/In3D+Ots3YAPBGuKByjpsmq4kwcblH2hNx+atjp0s5qOs5GmAbAE9/9pvLQuiC6+v/Yt75g2H+NVy/7ScKg9iWZ9/NX92T76UkSoMyMcAHEtsQ42n936SWHoVPA/qNCIOKqd6cddl5siIU/RYXWRYPjZ8W1V9hmcJPFIyi0FhERiEDfzTxhwOe096obfc6B4+bV/o2Jt/26SXBUYgbOMmLShvKrbha+VOAyZ5Ufq8JRgTmcuH9eI4oxDQ==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by DB4PR10MB6286.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:382::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Sun, 11 Oct
 2026 10:46:48 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%4]) with mapi id 15.21.0496.019; Sun, 11 Oct 2026
 10:46:47 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Yoann Congal <yoann.congal@smile.fr>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [wrynose][PATCH 5/6] expat: patch CVE-2026-102633
Thread-Topic: [OE-core] [wrynose][PATCH 5/6] expat: patch CVE-2026-102633
Thread-Index: AQHdVcomt2lwHEM+WU+42W9//nJ1Vbb16ZUAgAJGXpA=
Date: Sun, 11 Oct 2026 10:46:47 +0000
Message-ID: 
 <AS8PR10MB5073B6D0C39CA73EAC0FAE88FD902@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20261006193638.2018393-1-peter.marko@siemens.com>
 <20261006193638.2018393-5-peter.marko@siemens.com>
 <DM0PU4S33ZKY.3RX5ANQYUOJ0V@smile.fr>
In-Reply-To: <DM0PU4S33ZKY.3RX5ANQYUOJ0V@smile.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=26b893ec-4dae-4c3f-a1ff-9985c845f9ad;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-10-11T10:46:26Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|DB4PR10MB6286:EE_
x-ms-office365-filtering-correlation-id: e921bb16-51ce-45d0-adb1-08df2784f32f
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|6133799003|10067099003|55112099003|18002099003|22082099003|260925021311599003|260925021911599003|260925022911599003|38070700021|11063799006|4143699003|261009223027099003|56012099006;
x-microsoft-antispam-message-info: 
 dk4MZcrfzAzWEYQon27DH9oF4/TFD3DZWX5GRor0NjRDHNWb8CDSx/Mt1h+ew4baBy9pNM9Ot2oFTi6I7SM/Lg1oWOAkvrOWQpJJkUpVcq766h+KbUUU3FZCR3wV1To7FJMlpCXQLO/JrEFU510bhKL36fEtH9hUa9f92YDhZmSV+6o0Bt74kRNgzQTj4JvUe9VMFqdCneifd6/injaFO3AbKt5MsLmKkSOtqVdxFmBKpdaR1+cv/jj1h0fGoWawX2P3voaRjaOC1nnOTc61bd3rcMUqByV3XWYErm0OPEul0EZP92CEZvIdHBvXOzhvIkWIwK7tmo2Kw7zH/M82wY9MapPJ2jml0ENpLrrGxp5YJBvPVshF+AjUh13XqSUnIzDY3/qtQiABDu6RAQXu2INJkYZwAtMa2GUbiQCDdbDlFeKhLCqGwUuIc7Ii1gSDfi59mxyJbLMoJq1ZmTIjUn7MS7b+Q+pzzz+ulXfy/MlUg450+U2n+OswyRf8s3KWWXNc7yFwgtx/aDcR7/tCV0l+VVKd1UJtqFe8LpM//VXNJfGoO3sJc3VH9H1M9I+6DLyYM7brbfHpQxv/Qu5OoocII3CAZ1b4VgrucPTLb0Tg79Fp4GmMmJadmGiFxRbkhc1rZu3Zkv0TJGazXaJxn+RAK3XU/fUitBXJhZ/2nHE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(10067099003)(55112099003)(18002099003)(22082099003)(260925021311599003)(260925021911599003)(260925022911599003)(38070700021)(11063799006)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?M3J6OUIzQTZiUUo4VDV6OVpDYVJWcGdqTGpVcGRZZFBHcytYZnVwMlhreVFy?=
 =?utf-8?B?WGtBWWh1M2JSQW53UmFnbWY3RTZROWJoS0NkVG5uUUtaS2NHcGRkWTBMY0RL?=
 =?utf-8?B?V0hpQW1RK0dFNENVakZjd0J5MCtscmY5Mk9LTFpBamljWXVpNVpTckRPemZj?=
 =?utf-8?B?Z1F2SUEzRmZFWkhsd2xuVStKZXY3N3NwZFlFS1A1MVJtWDh6dUJCaGMyclNV?=
 =?utf-8?B?VFNpOGpMam41dERwSHZZdEhDY05jRElyVTFsNlJzYnpDeW4vWE9kbldkMC9Q?=
 =?utf-8?B?eURoNS9FcGFMNmExQ3lva0RmS1pkbzJER2JHU3NTYm9zRjA4dmFNUmpnbDFn?=
 =?utf-8?B?NHIyeG4rclBaQzRLN0E5K2tLei9qUklyRzVqSkhZdVBpZFU5YUZMdHlyUlpv?=
 =?utf-8?B?WmtsYUpYd1l5Y0dSWnlKUUdZR1dNMXpqdStkT2FncGxudkNZRWkrR0NGTE55?=
 =?utf-8?B?dDFKd1pwR0NDK05LOG5paTFBYXl1RWJzRk5vZEJCQlhPbk5GeGVSYk5Gd1lh?=
 =?utf-8?B?TEkxY0pmKzFiVWxWNEh4TzR6Q08zWGNUa1lPOUpZak1JZkg0NytXZDIzbFBX?=
 =?utf-8?B?djNDd050SnJiSVZaR1lUTVNla3k4TEZ4bnVwc1U3em0xYVBETXRLM3BqbmtW?=
 =?utf-8?B?NzZRY3Zvek9USWdzMDdjejJSYnpEaFlURXpGYnFTWlRVUkIrUWNUM1lRMDJk?=
 =?utf-8?B?a3dtSG5VODY2aXBqcFJTY1poZExsdGpWUXV0M05CdmtNWUlhMGFFeXJMZ3Z2?=
 =?utf-8?B?RmtCR1ExV1RaMGlYaEpValZDQ3lONXREbEk5ZFpXNkFvTnp1ZnBuWlk4bGwv?=
 =?utf-8?B?d09qbjc4dWVvV205cWovZVBiRlJudld4eElxclFJU0hUSXhVZjVLZkZSdjNr?=
 =?utf-8?B?aDZpMHZBSTJSWDM2NHN3TGxyMzBhU3lrODh5b0lFMnBRVVA0RTUxSGltK3pE?=
 =?utf-8?B?MVZSTG9sZ3JhSGJCOEg3disrd0tUUFgwSG5vMHBrRTBHZVhyZUpmYVZvbFhK?=
 =?utf-8?B?RHdDSG00aE1EVmd2V2dwd0VzS0VBdWFObWozUW05Zldzb3Z5eDRwaVg0OEdZ?=
 =?utf-8?B?czNsby9IbDZiVTdQcHAzajlOb3pTaURCR3E2aHRiM0JNWDZXbmNkYWZKMk11?=
 =?utf-8?B?d092ekRHb2lDNjRxbHUvVU11ZTcwZ2FVNEs0U3ZNaGJSRmIvZzVHditVQ1Vu?=
 =?utf-8?B?ME5wcmIrVGZhTTRGQ3F6SDZPbldNalhDZHpWLzdmdXRXRE55b3Q0YzFrOTc5?=
 =?utf-8?B?NUloQmQrSlNQNEdYMXdqTytYcG01eExnRVlDUEFnTGNpbENMZWNsQi9OQzNB?=
 =?utf-8?B?TWJOUEJTRGFwdG5RSk9kWWhQWndvK01vZzVXR256eHJPNTVtQUc5aThLTnZL?=
 =?utf-8?B?R0FwWUYrQTNFNFRLKzFtNmgyczA0M0FucmRRZmJqYkRhMUVydmdEYmNON3lO?=
 =?utf-8?B?cE45ZkFubStuRVhxQ3lIL2lNR0krV0ZCeVdNTmlzS0loblplNC9sUytNdE9o?=
 =?utf-8?B?eEVPQmlTOHk1QXlZVHZkb1Vka1kyVDdaS0dtdFhQaWdCWnkwMWxLSnFuTzRk?=
 =?utf-8?B?aDVEdkdrUkNWV0NRemd1MkQ4WHNhR0VxWjFyak1DOXdBTWE1cERyYi9pL0Fl?=
 =?utf-8?B?OVpndHpNTFNSWmg0Uyt6WFZkVWNBN0VpNW1LRmdhb2Uya2FNM1FWYWN1WG9S?=
 =?utf-8?B?TksxZVc5R1lIejQwM00wb3FVSXhPRVhKSXdVbGUvREZWbWZ1K1U4eFZMa2Zn?=
 =?utf-8?B?eGswUUVFVitPVHNoaE9nSGg5WGJUaVlUeTFoSXcvN1UyUGd6dFRwdjVVLzd3?=
 =?utf-8?B?Y1dISkI5QnVRSzZ2WFF4bU1ZNWowQSs2MjlEYVROV2Jrb2MzZkM0dFQyVzhK?=
 =?utf-8?B?ZnBRQ0Rlb2RZSCtvVWNmaFY4aFdhbE5lTFlFWndiMHA1cy8rMzBRQnpVRnc4?=
 =?utf-8?B?WDZGOWtTNmREK2EyU2EvV21TM3p1OWFXcy92RmpSck5xUDAwWHFkSURLbEtt?=
 =?utf-8?B?WnJucEV2Qk5yVkM3N05QTHhqSjVXL0ZUUmFEa0JiY3JGVU9XaEZDRkkzVlZY?=
 =?utf-8?B?cVUzWitCc0NhcE5BeUNZSmpHUGo3SkhrRGxVSHRDRzc1WENOQkhiZjVTZGZT?=
 =?utf-8?B?UndLbEtYYmdieGJHMjVYZ3EzV2poWmgzOE1lUFVuQUtIZjdUbkVqYysvU2tY?=
 =?utf-8?B?ZlJ3amMxSW9YRXpLOEdxeGZIYVBRSFFvYlJIcFpkbVhLVnlxcWpSdjhRRWgx?=
 =?utf-8?B?cm5QVzh1N1ZOOUZXN3g1OEVVTkJ2dStzS1B3M0ZobzNvMjR6d1pJdm01cHhx?=
 =?utf-8?B?RVcwZTdlUjh2cWZzTEpxNW1XR3dUbjdMbE5QVHhtaDdBTU9mNVA2dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e921bb16-51ce-45d0-adb1-08df2784f32f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2026 10:46:47.9017
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gX85XU5sJpWBXCR8UCq/zrfvLhjnce1opq0EwPAQVWIZJ7/5C2mPQNQ1SL/pP5u/R8miXYdiZNfhny0H620N9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB6286
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 10:46:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247574

U2VudCB1bmRlciBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQt
Y29yZS9tZXNzYWdlLzI0NzU3Mg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IFlvYW5uIENvbmdhbCA8eW9hbm4uY29uZ2FsQHNtaWxlLmZyPg0KPiBTZW50OiBTYXR1cmRh
eSwgT2N0b2JlciAxMCwgMjAyNiAyOjAyIEFNDQo+IFRvOiBNYXJrbywgUGV0ZXIgKEZUIEQgRVUg
U0sgQkZTMSkgPFBldGVyLk1hcmtvQHNpZW1lbnMuY29tPjsNCj4gb3BlbmVtYmVkZGVkLWNvcmVA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFt3cnlub3Nl
XVtQQVRDSCA1LzZdIGV4cGF0OiBwYXRjaCBDVkUtMjAyNi0xMDI2MzMNCj4gDQo+IE9uIFR1ZSBP
Y3QgNiwgMjAyNiBhdCA5OjM2IFBNIENFU1QsIFBldGVyIE1hcmtvIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnDQo+IHdyb3RlOg0KPiA+IEZyb206IFBldGVyIE1hcmtvIDxwZXRlci5tYXJrb0Bz
aWVtZW5zLmNvbT4NCj4gPg0KPiA+IFBpY2sgcGF0Y2ggcGVyIFsxXS4NCj4gPg0KPiA+IFsxXSBo
dHRwczovL3NlY3VyaXR5LXRyYWNrZXIuZGViaWFuLm9yZy90cmFja2VyL0NWRS0yMDI2LTEwMjYz
Mw0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgTWFya28gPHBldGVyLm1hcmtvQHNpZW1l
bnMuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vZXhwYXQvZXhwYXQvQ1ZFLTIwMjYtMTAyNjMzLnBh
dGNoICAgICAgICAgfCA2OCArKysrKysrKysrKysrKysrKysrDQo+ID4gIG1ldGEvcmVjaXBlcy1j
b3JlL2V4cGF0L2V4cGF0XzIuOC4zLmJiICAgICAgICB8ICAxICsNCj4gPiAgMiBmaWxlcyBjaGFu
Z2VkLCA2OSBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lw
ZXMtY29yZS9leHBhdC9leHBhdC9DVkUtMjAyNi0xMDI2MzMucGF0Y2gNCj4gPg0KPiA+IGRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9leHBhdC9leHBhdC9DVkUtMjAyNi0xMDI2MzMucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtDQo+IGNvcmUvZXhwYXQvZXhwYXQvQ1ZFLTIwMjYtMTAyNjMzLnBh
dGNoDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAwMDAwMDAwLi4xNzg1
MTIwMTI2DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2V4
cGF0L2V4cGF0L0NWRS0yMDI2LTEwMjYzMy5wYXRjaA0KPiA+IEBAIC0wLDAgKzEsNjggQEANCj4g
PiArRnJvbSA2OWVkYmVjMDlmMmNkM2UwYmQ2ZTBhMDkzYjU1ZWEzOGFmOTAyZDdkIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQ0KPiA+ICtGcm9tOiBGaWxpcHBvIFRlZGVzY2hpIDxmaWxpcHBvdGVk
ZXNjaGk5OEBnbWFpbC5jb20+DQo+ID4gK0RhdGU6IFRodSwgMjQgU2VwIDIwMjYgMjE6MTQ6MjMg
KzAyMDANCj4gPiArU3ViamVjdDogW1BBVENIXSBsaWJ8dGVzdHM6IFJlcGxhY2UgYXNzZXJ0IHdp
dGggcnVudGltZSBvdmVyZmxvdyBjaGVjayBpbg0KPiA+ICsgZXhwYXRfcmVhbGxvYw0KPiA+ICsN
Cj4gPiArSW4gZXhwYXRfcmVhbGxvYywgdGhlIHNpemUgcGFzc2VkIHRvIHJlYWxsb2NfZmNuIGlz
IGNhbGN1bGF0ZWQgYXMNCj4gPiArc2l6ZW9mKHNpemVfdCkgKyBFWFBBVF9NQUxMT0NfUEFERElO
RyArIHNpemUuIFByZXZpb3VzbHksIGV4cGF0X3JlYWxsb2MNCj4gPiArcmVsaWVkIG9uIGFuIGFz
c2VydGlvbjoNCj4gPiArYXNzZXJ0KFNJWkVfTUFYIC0gc2l6ZW9mKHNpemVfdCkgLSBFWFBBVF9N
QUxMT0NfUEFERElORyA+PSBzaXplKTsNCj4gPiArdW5kZXIgdGhlIGFzc3VtcHRpb24gdGhhdCBw
cmVjZWRpbmcgYWNjb3VudGluZyBjaGVja3MgYW5kIHBhcnNlcg0KPiA+ICtpbnZhcmlhbnRzIHBy
ZWNsdWRlIHJlYWNoaW5nIGFuIG92ZXJmbG93IHN0YXRlIGluIHByYWN0aWNlLg0KPiA+ICsNCj4g
PiArSG93ZXZlciwgaW4gcmVsZWFzZSBidWlsZHMgY29tcGlsZWQgd2l0aCBOREVCVUcsIGFzc2Vy
dGlvbnMgYXJlDQo+ID4gK2NvbXBpbGVkIG91dC4gUmVwbGFjZSB0aGUgYXNzZXJ0IHdpdGggYW4g
ZXhwbGljaXQgcnVudGltZSBjaGVjazoNCj4gPiAraWYgKHNpemUgPiBTSVpFX01BWCAtIHNpemVv
ZihzaXplX3QpIC0gRVhQQVRfTUFMTE9DX1BBRERJTkcpIHsNCj4gPiArICByZXR1cm4gTlVMTDsN
Cj4gPiArfQ0KPiA+ICtpbW1lZGlhdGVseSBwcmVjZWRpbmcgdGhlIGFkZGl0aW9uLCBlbnN1cmlu
ZyBjb25zaXN0ZW50IGRlZmVuc2l2ZQ0KPiA+ICtiZWhhdmlvciBhY3Jvc3MgYWxsIGJ1aWxkIGNv
bmZpZ3VyYXRpb25zLg0KPiA+ICsNCj4gPiArQWxzbyBleHRlbmQgdGVzdF9hbGxvY190cmFja2Vy
X3NpemVfcmVjb3JkZWQgaW4gYWxsb2NfdGVzdHMuYyB0bw0KPiA+ICtleGVyY2lzZSBTSVpFX01B
WCBhbmQgU0laRV9NQVggLyAyIHdpdGggZXhwYXRfcmVhbGxvYywgdmVyaWZ5aW5nDQo+ID4gK3Ro
YXQgdGhlIGFsbG9jYXRpb24gZmFpbHMgYW5kIHRoZSByZWNvcmRlZCBzaXplIHJlbWFpbnMgdW5j
aGFuZ2VkLg0KPiA+ICsNCj4gPiArU2lnbmVkLW9mZi1ieTogRmlsaXBwbyBUZWRlc2NoaSA8Zmls
aXBwb3RlZGVzY2hpOThAZ21haWwuY29tPg0KPiA+ICsNCj4gPiArQ1ZFOiBDVkUtMjAyNi0xMDI2
MzMNCj4gPiArVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydA0KPiBbaHR0cHM6Ly9naXRodWIuY29t
L2xpYmV4cGF0L2xpYmV4cGF0L2NvbW1pdC82OWVkYmVjMDlmMmNkM2UwYmQ2ZTBhMDkzYjU1ZWEz
OGFmOQ0KPiAwMmQ3ZF0NCj4gPiArU2lnbmVkLW9mZi1ieTogUGV0ZXIgTWFya28gPHBldGVyLm1h
cmtvQHNpZW1lbnMuY29tPg0KPiA+ICstLS0NCj4gPiArIGxpYi94bWxwYXJzZS5jICAgICAgfCA3
ICsrKystLS0NCj4gPiArIHRlc3RzL2FsbG9jX3Rlc3RzLmMgfCA0ICsrKysNCj4gPiArIDIgZmls
ZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gSGVsbG8s
DQo+IA0KPiBJIGJlbGVpdmUgdGhpcyBvbmUgaXMgbmVlZGVkIG9uIGJsYWNrc2FpbCBhcyB3ZWxs
Lg0KPiBDYW4geW91IHNlbmQgaXQ/DQo+IA0KPiBUaGFua3MhDQo+IC0tDQo+IFlvYW5uIENvbmdh
bA0KPiBTbWlsZSBFQ1MNCg0K

