Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1396FFF885E
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 10:07:50 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.61])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40518.1777284461413589356
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2026 03:07:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=QMmn5Q4c;
 spf=pass (domain: siemens.com, ip: 52.101.84.61, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tCovoYI/r8xF3zQGbekBrD115eSXzhTYUZlafq6Xt1yMzjYDGi7czAQHxu9nc5ALV1gaEKaoNQSa0RvLkJctcGAwjiXHMTbpOgajRlMO4zMOijfzGPvag2WYwt/4VJu5zCXZUGR1BHdQM9pHM+ryMFKn4Pa7GmXzsrXSVN2aC4FahyOFRGh0M5k5kqrhuARyoqsXKjhInQi+N074uwY8ge2Y9K4YV85ljut6RiCHYVaKmCEv+WbjlAh7n1mCnHBK9ENABqcoqNNNUdhMab6I8bRIzmd5H3jQy7ixC5RCdJMV3gS31iyLn2GAksYxAjx3GO5x6cl/mtugugD3wVbzLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sdGWyzZKlf/he3UW86Yps66r56f/KYhyBaHgZCgQIxM=;
 b=V8bCzsVtfgQw6Ymer1loU6mczu9Jing/YGVmi/yeiRPOl747z7EjSmMh6TZl87yUVdeXa8RARaX3eCJ9gwRFObm6cTEqR66XY/RCBPQbQ9J8yBjaeTDipR+y5+jkz8fZpKF94F0aGZmBs2H4OEFygVLi7kiu5ZK3Rvz+mqW6/Ul3wJuqZzCSHZ7PcO8VEp4od1NosBMs9xDbgExYewoslFDyOyHDXFVc0YWE39KzvBgCJ1MPrk5TzmqT6DxqPdHF5lTvyNXxbrYvj9JVwbz6J5iPa2KHHU8VIG41mW9VLBsDJgT+eHbf91qPUIfDmIBB3xDwzqVpDoLhBbn5LosMag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sdGWyzZKlf/he3UW86Yps66r56f/KYhyBaHgZCgQIxM=;
 b=QMmn5Q4c/QVNGnZ5IELZpsLegLYrC9bxR+0xyLcFZeOf4xPY7UE2Lb3tGO7r6Tp4lzLt12r+JbdVY9QD9jCvijigLJd1VW7pcZc8pCeeUHtiq8tGYTGA54w00i5UOTfX2He071fzraY7/C8mUhdB9qJXEgutEbnU+QZ2tWK508x0NNFomjE8hrElquKbl/bU/HQN+oJv77gf/KGn8VfMoiNHoSyhj3ZfDZPHNAhboL5b+FzrRSysHQV+UCdF+MLFi+ddn1DdSVTsjqr+r21DVkUtcE5A7R8zDyxmH6F1eEiYisEsSDLis9Ie+8tOETGg3kjUGhE3FTOGIH5s9RPiRg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAVPR10MB6861.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:321::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 10:07:37 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%5]) with mapi id 15.20.9818.023; Mon, 27 Apr 2026
 10:07:36 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Benjamin Robin <benjamin.robin@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [PATCH 6/6] ffmpeg: set status for 5 CVEs
Thread-Topic: [PATCH 6/6] ffmpeg: set status for 5 CVEs
Thread-Index: AQHc1a2q8fVYomnSuEK+Xhel3WEHQ7XyiAUAgAAnQIA=
Date: Mon, 27 Apr 2026 10:07:36 +0000
Message-ID: 
 <AS1PR10MB5697F7E372D2AD233EF5A604FD362@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260426185025.13217-1-peter.marko@siemens.com>
 <20260426185025.13217-6-peter.marko@siemens.com>
 <--nPwHMjR5aFgiGiHDM60Q@bootlin.com>
In-Reply-To: <--nPwHMjR5aFgiGiHDM60Q@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=99dda343-772e-4648-9aa1-3bdfaeda8820;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-04-27T10:05:02Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAVPR10MB6861:EE_
x-ms-office365-filtering-correlation-id: 31a6c646-069b-4fe7-7ded-08dea444cee7
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|18002099003|22082099003|56012099003|55112099003;
x-microsoft-antispam-message-info: 
 a5wZ1NLCIbFtMqpEWBErwgL+hR31P9CignMGW9ahXYI3+iHIv18dgUwl8mBSOXFwlLsDlPM/sz2U8nnw82xbSB2TDnly5E9vNujFqT9BtpgEEIWLk8QwAlbKtZyA+lZKDE86lu9oNEdXAQAB9CHxVAdV99AiovqP2R0ke1IjYX0cPz6A0WAuuM8lBiZE6KrLXt+AV9NGSsoZfAc9xuPsoWO6a/2oyn1T5shh19IzF5i/zVqcRObI5mxkh8d7rJFY69BAWsHbhHrno6+8+Ziv4iGA4Hl2elhfDrtmOaXkKU5DnAQeWg91XolCNdXR6vJR7zteAmtLreLl6gGeGZuBgnmqK34EDgg2e3rBDP0KFZXzOmz+ZCk5M7EsXlxmxgbxC06w9nsCpaDD1qLgiPwPNFBbgw5IFOklVzlVL48x4CWeg9VuavHP3Nz1AXbM4ZkO/J+HlUsHyTJGYC+Bvslq2TuJiQnqe2PIf8GYoA05ERRpPT2X2Wiuz8AeZuzxJEnutFxI+tDhTNakAbqltqhKX6+DHJEl2H7NP8IrMaf27dd+8WsPH8j7PmdFkXOXxmmZ7u1P3LA5dpnRQP5SO/nTdzkoaeOhlxM8ZNKNeBNSn0KNnYeHkTDbazdc85NtCm0rma7QQOJvBG/h5KrSqL2QJgQ3SHbxoMYSIbd6W0B1pQZk0x4tlMTyuZsNXcZ6+tL+eKt1PXttGdbQTNN1T1DoniaZUA6CFIZoxEhJUgHMAkM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(18002099003)(22082099003)(56012099003)(55112099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SzBUL3Nkb3ZCZVdXejZjMDVwTjZvdnNadktKN0d2UWMyenNjVFgrTkFUQlBD?=
 =?utf-8?B?QS91V1g5M3E0RURvT2VMVHVZNDVKem4yOHZ4VGRra0IydHQyTTQ5dm1WaVNY?=
 =?utf-8?B?Zi8yaXBkVVFlaXREVjBuOEpXWnZUZXlPOXNrc3I4all3TGFTMkxaYVB3NEVV?=
 =?utf-8?B?TkxQOEp6UWFkci82S0Vna3lzOGQzaGd4eDdIQXVZSHZrWUZGRkorSXdTMlFK?=
 =?utf-8?B?MTREMDU2UVJVUUhCYTZxMFJ5dFRzL0JSbHBOTzAyQmF2Z2ZpUzY0M2hMS2k1?=
 =?utf-8?B?N0J1Z0R5V2E4SEw4cy9MZ2hRRk9TSUJ1ZzVSQ042WVNQSnhqU0dTQ0NsaER6?=
 =?utf-8?B?VDRVZ0RXb054aklrdDlsbkN3RkhhWVZQNldDVjQrZzNRYU5LK3o4eUhEcGFv?=
 =?utf-8?B?bjhyanlKUlhHWU9UNlgyZm1MV1hQWFBaUGhkUy9qNUd1S1k5Y2ltVE9YZmhs?=
 =?utf-8?B?Qzd4WVRLbDdKbnZ6cE5nTU5JWEpFNW1zR0owR09ZK2ovd0VLY21Lbk9xSnlu?=
 =?utf-8?B?Q0dqRHBJVFFacVBITitTeTNEMDhoZFA1UlFDcmpUYUI4SzkycGdDYkhhS1p2?=
 =?utf-8?B?UTB1My9kVGxtbjBrcEJnNWwwa3puaVA2blMrZVpvSTJJd01OUFRlZGRyeEpO?=
 =?utf-8?B?MFZmNmhBVGtmY24wbzExcHlhdlRvUTU1QW5UNS91SU9mSlV1UU45ZmswN0RK?=
 =?utf-8?B?Mm1oWEgyZFdYWFF1MjFWOHhJZ1RKc0RDZWFjeitKSzh0U0J3SHM1VGQwSE1v?=
 =?utf-8?B?K0ZYS0tmeW00OEliQ1MzYks4OUQ0L1grNzQrUHdRL2kydDMzeGpabFpTeVVv?=
 =?utf-8?B?YUhtdVhnSFVLS1hEL25KYXdTQWR6Q1A5TW9sMkNxSW02KzA1S0JKd0J0RUZ6?=
 =?utf-8?B?RjhRVWxLN3JVM1Z6OTd3M3RMWTRmcFhwWFdyTnpFTC9pRVNkWkFRSk4ybFNj?=
 =?utf-8?B?NVIrV05qeXJEWXhvTG1CRU9GMkMvNkdwSTVpMWFPN3JqNWFwQnJVcDlKTmJo?=
 =?utf-8?B?Vmk2R0pCUjZJRU54dGd4eEZOcmRPampxUGJPdG9sMWhPSVNwcDRyb2p6WmM1?=
 =?utf-8?B?d3IzWHdZdFAvRjZXRlVCdFp6aDEyMUZuWGZuczJqWnNaa3NMOHpEck1JRlhu?=
 =?utf-8?B?SWdGeTc3NVdxNm9Qb1lpMzdlUHVSci9vYW9mY3Mxb2RvSEFkUGlGdjdoZXo3?=
 =?utf-8?B?cnRuOGdKNDZ5NGlVV2F2QlJLN3BvK3RmdW84VytjWXNGb2ljNGdXVjU5QWRo?=
 =?utf-8?B?QnBDZ0F2VFkrWEszenhzN0NqcTJ0cVhLMUJLSXpLT3BxMmNra3dCZTEvaFE4?=
 =?utf-8?B?aDFMR3cxM0V2R2p3N3h3MEk5eDNicytTbjgxTXl0YngxanhveDJPdHVKZE9u?=
 =?utf-8?B?MEhadDN6SitDUlV3V2VFbzNsMzIvUUNSejJPRUVGaVpFdmZ5Z2Fta2RGUUN1?=
 =?utf-8?B?am5FNEJVZ3RCZE93azA5UndSNWp3eEFyMDFZVVM2cFB2Y09LTklxODNjMFNr?=
 =?utf-8?B?Q1orV2pxU3FuekJ6andHaERZU2xXbE90T2RIdm1zKzlxbkwvZ0hza3RNS3Z2?=
 =?utf-8?B?anlSWEFJZVIwbW9rbnRuOE1GRHJlVnBKQ2FFSFEwTk5kZGJFdllkbkRYZjBD?=
 =?utf-8?B?aHQxUTNCVzJMc3RTL0c5NkZObGhscDdJbGMwWmk5VFQvcEpkdVkweStIMjdL?=
 =?utf-8?B?L3U3M1YzRkhYS2o4R1NtVVBOS25nNVBBZmJ6UVpnVGpVWWNjcXVKdXhkbEpC?=
 =?utf-8?B?UExRNjE0N1VlbUpDdWR1M3RieUNKZmNHVWt4cUtKaEwxUzIvaHJDcmxZUjBs?=
 =?utf-8?B?NmtxZ3grZ1F3VHA1NGFmOTRIWXVnTEV6RWtseXR2b3NWSW5tSm1ZSkhUTGFC?=
 =?utf-8?B?a2o4N3JETVBnZGM4KzNaZUkrWW9QZXJKaU90RlA0MkRqSGo5cUNGUUI1VVNJ?=
 =?utf-8?B?ekJVV2pOMTh0S3FJZjZyZWl4NkkyUEZoT201OExzTFlzMko3RXR2c3hlS0Rq?=
 =?utf-8?B?Q0RIOW5GZ2ptSlZoZ2FLSWFjblJIZkQxQkI2cW8xMW1menR5TzVwMHNIbjF5?=
 =?utf-8?B?Yjg0WG1YeHJlenVDRG1YL3QranNCR2xzQUJSbU1XNTVLc2J5Wmt1dE9DS1ZJ?=
 =?utf-8?B?TTU4U09XWnJ6ZmEyc2NESmJOSjJTSU1vRXBaYmZ6UWZBc25hWklsWlhqd2NE?=
 =?utf-8?B?VzlORTNFa0FUTWY5V09QRU92Sm5vU0Q4Q3M0WGNiZ1RxTWNidWRtTy9GODc5?=
 =?utf-8?B?dEpLenhyTUFTRkN0dmxvNW1aUnBDa2hWU0tZTEJnUjdTV3N6ZUxTQ1JabEVv?=
 =?utf-8?B?Z3dMai9ZQ0NMQzdnMHlQOHZMdCtsNUFjSVIweHRTUDM2amZIbnVWdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 31a6c646-069b-4fe7-7ded-08dea444cee7
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2026 10:07:36.8819
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ta5zPltJHS0ioE6YsNmwsnK+4zE3gTFu8sw29Y9198dVW7NQjyb6qP24dGCXAD6kR/s+S8s1yur1nDF3BQwZ9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB6861
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 10:07:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236000

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmVuamFtaW4gUm9iaW4g
PGJlbmphbWluLnJvYmluQGJvb3RsaW4uY29tPg0KPiBTZW50OiBNb25kYXksIEFwcmlsIDI3LCAy
MDI2IDk6NDUgQU0NCj4gVG86IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc7IE1hcmtvLCBQZXRlciAoRlQgRCBFVSBTSw0KPiBCRlMxKSA8UGV0ZXIuTWFya29Ac2llbWVu
cy5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggNi82XSBmZm1wZWc6IHNldCBzdGF0dXMgZm9y
IDUgQ1ZFcw0KPiANCj4gSGVsbG8gUGV0ZXIsDQo+IA0KPiBPbiBTdW5kYXksIEFwcmlsIDI2LCAy
MDI2IGF0IDg6NTDigK9QTSwgUGV0ZXIgTWFya28gd3JvdGU6DQo+ID4gRnJvbTogUGV0ZXIgTWFy
a28gPHBldGVyLm1hcmtvQHNpZW1lbnMuY29tPg0KPiA+DQo+ID4gVGhlc2UgcmVhcHBlYXJlZCBh
ZnRlciB1cGRhdGUgb2Ygc2JvbS1jdmUtY2hlY2sgdG9vbGluZy4NCj4gPiBGaXhlZCB2ZXJzaW9u
IGZvdW5kIGJ5IGxpbmtzIGZyb20gRGViaWFuIHNlY3VyaXR5IHRyYWNrZXIuDQo+ID4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+ID4g
LS0tDQo+ID4gIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2ZmbXBlZy9mZm1wZWdfOC4wLjEuYmIg
fCA1ICsrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykNCj4gPg0KPiA+
IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9mZm1wZWcvZmZtcGVnXzguMC4x
LmJiIGIvbWV0YS9yZWNpcGVzLQ0KPiBtdWx0aW1lZGlhL2ZmbXBlZy9mZm1wZWdfOC4wLjEuYmIN
Cj4gPiBpbmRleCA3YmI3ZGUzZDI1Li45NzgwYWJlMTg0IDEwMDY0NA0KPiA+IC0tLSBhL21ldGEv
cmVjaXBlcy1tdWx0aW1lZGlhL2ZmbXBlZy9mZm1wZWdfOC4wLjEuYmINCj4gPiArKysgYi9tZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9mZm1wZWcvZmZtcGVnXzguMC4xLmJiDQo+ID4gQEAgLTE3Niw2
ICsxNzYsMTEgQEAgQ1ZFX1NUQVRVU19HUk9VUFMgPQ0KPiAiQ1ZFX1NUQVRVU19XUk9OR19DUEUi
DQo+ID4gIENWRV9TVEFUVVNfV1JPTkdfQ1BFID0gIkNWRS0yMDIzLTUxNzkxIENWRS0yMDIzLTUx
NzkzIENWRS0NCj4gMjAyMy01MTc5NCBDVkUtMjAyMy01MTc5NSBDVkUtMjAyMy01MTc5NiBDVkUt
MjAyMy01MTc5NyBDVkUtMjAyMy0NCj4gNTE3OTggQ1ZFLTIwMjUtMjI5MjEiDQo+ID4gIENWRV9T
VEFUVVNfV1JPTkdfQ1BFW3N0YXR1c10gPSAiZml4ZWQtdmVyc2lvbjogdGhlc2UgQ1ZFcyBhcmUg
Zml4ZWQgaW4NCj4gdXNlZCB2ZXJzaW9uIg0KPiA+DQo+ID4gK0NWRV9TVEFUVVNbQ1ZFLTIwMjIt
MjU2Nl0gPSAiZml4ZWQtdmVyc2lvbjogdGhlc2UgQ1ZFcyBhcmUgZml4ZWQgc2luY2UNCj4gdjUu
MS4xIg0KPiA+ICtDVkVfU1RBVFVTW0NWRS0yMDI1LTk5NTFdID0gImZpeGVkLXZlcnNpb246IHRo
ZXNlIENWRXMgYXJlIGZpeGVkIHNpbmNlDQo+IHY4LjAiDQo+ID4gIENWRV9TVEFUVVNbQ1ZFLTIw
MjUtMjU0NjhdID0gImZpeGVkLXZlcnNpb246IHRoZXNlIENWRXMgYXJlIGZpeGVkIHNpbmNlDQo+
IHY4LjAiDQo+ID4gIENWRV9TVEFUVVNbQ1ZFLTIwMjUtMjU0NjldID0gImZpeGVkLXZlcnNpb246
IHRoZXNlIENWRXMgYXJlIGZpeGVkIHNpbmNlDQo+IHY4LjAiDQo+ID4gIENWRV9TVEFUVVNbQ1ZF
LTIwMjUtMTIzNDNdID0gImZpeGVkLXZlcnNpb246IHRoaXMgQ1ZFIGFyZSBmaXhlZCBzaW5jZQ0K
PiB2OC4wIg0KPiA+ICtDVkVfU1RBVFVTW0NWRS0yMDI1LTU5NzI5XSA9ICJmaXhlZC12ZXJzaW9u
OiB0aGlzIENWRSBhcmUgZml4ZWQgc2luY2UNCj4gdjguMCINCj4gPiArQ1ZFX1NUQVRVU1tDVkUt
MjAyNS01OTczMF0gPSAiZml4ZWQtdmVyc2lvbjogdGhpcyBDVkUgYXJlIGZpeGVkIHNpbmNlDQo+
IHY4LjAiDQo+IA0KPiA+ICtDVkVfU1RBVFVTW0NWRS0yMDI1LTY5NjkzXSA9ICJmaXhlZC12ZXJz
aW9uOiB0aGlzIENWRSBhcmUgZml4ZWQgc2luY2UNCj4gdjguMSINCj4gDQo+IFdoeSB0aGUgQ1ZF
LTIwMjUtNjk2OTMgaXMgbWFya2VkIGhhcyBmaXhlZD8NCj4gDQo+IEl0IGlzIGFmZmVjdGluZyB0
aGUgdmVyc2lvbiA4LjAuMSB3aGljaCBpcyB0aGUgY3VycmVudCB2ZXJzaW9uIG9mIHRoZSByZWNp
cGUsDQo+IGFzIHJlcG9ydGVkIGJ5IE5WRDoNCj4gaHR0cHM6Ly9zZXJ2aWNlcy5udmQubmlzdC5n
b3YvcmVzdC9qc29uL2N2ZXMvMi4wP2N2ZUlkPUNWRS0yMDI1LTY5NjkzDQoNClRoYW5rcyBmb3Ig
bm90aWNpbmcuDQpJIGd1ZXNzIEkganVzdCB3YW50IHRvIGhhdmUgdGhlIGNsZWFudXAgZmluYWxs
eSBmaW5pc2hlZCBhbmQgZGlkbid0IHRoaW5rIGFib3V0IHRoZSBjdXJyZW50IHZlcnNpb24gdG9v
IG11Y2gsIGp1c3QgdGhhdCB0aGVyZSBpcyBhbHJlYWR5IGEgdmVyc2lvbiB3aXRoIGEgZml4IG91
dC4NCldpbGwgc2VuZCBhIHYyIHNob3J0bHkuDQoNCj4gDQo+IHsgdnVsbmVyYWJsZTogdHJ1ZSwg
Y3JpdGVyaWE6ICJjcGU6Mi4zOmE6ZmZtcGVnOmZmbXBlZzo4LjAuMToqOio6KjoqOio6KjoqIiwN
Cj4gICBtYXRjaENyaXRlcmlhSWQ6ICI3RjVDQUNBMi02RkI2LTRENkQtOTJEMC1DOUZGMEU3Q0RC
MTQiIH0NCj4gDQo+IEkgZGlkIG5vdCBpbnZlc3RpZ2F0ZSBpbiB3aGljaCB2ZXJzaW9uIHRoaXMg
Q1ZFIHdhcyBmaXhlZC4NCj4gDQo+IC0tDQo+IEJlbmphbWluIFJvYmluLCBCb290bGluDQo+IEVt
YmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcNCj4gaHR0cHM6Ly9ib290bGluLmNv
bQ0KPiANCj4gDQoNCg==

