Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5008DC54798
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 16:48:31 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.87])
 by mx.groups.io with SMTP id smtpd.web10.28408.1709830105460452854
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 08:48:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=ohgN05OI;
 spf=pass (domain: axis.com, ip: 40.107.247.87, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TyX0YnlWF9oOIHZl2SJQ/1T30BD3CTKCWiyoqfcGbuGlrpnNVYUcMdgF811y15Hhxom4NK7kQkILYTQk070qKkYVP5ZiLMooBYew9b2/zf85re2RSFoTmjp53TBoh66KiFlL+xo+O6fEMbHhP5IGIq76tbiTxketIeAvVz7E5ZXh7upo7UXJK+fjsin2kAcj2BiqHt5eRAEDsFXU0GM7DYqmvPpo1OGNc7sDc65iWe4Lhw8JxRIAv7niqnT2UGE/oLAwzYjnbuC16xl3h+QwtLVuxltslAxNO3gFtWOIjO22FBEpXgtZ/UQJeBxcnoxEPQeCL3Nh7aqlMjNQME0iCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GuGGWSNTJL/BysxfXYIVZsOxY73+qYBVfJKswmU2C5E=;
 b=Ebs5nw7T2Ok5r5a2rm+44CD4Q3bZ8r34DgeWwDc7D13BVdoeLt5mmPfTMRqlOB+pKmFrHfRI7pKurAtjP+xPeTWfaEazt/7VOH9bARdaM4RgiK/CRUUO4gUaXz58kEG0Lg0gxq7ZxwpVXU1c/6jr0VG4Qp8OBzP2099i8aq9CmoRM09txmNDVySnpbKZ6xwuOwYgM5aUTi6RtPN0NceI+xKh5Ox3jEnOfw4t2xUrJDN2PilozMJaCzv8hgLsVQJdU+WQM18gMELEf/+wOiag5DMg/cb9vv5dXHgTN4Pvv8s5DZ8RRYPTjuj8/In1TvopJCe+ODtUQEQ6LmFxQnidUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GuGGWSNTJL/BysxfXYIVZsOxY73+qYBVfJKswmU2C5E=;
 b=ohgN05OIUexVxgFhTlpZGWSiZmUHuloteDPU214Ew196ZytCG8EMkUYHv3h3HtYuaGZPtndkkxdDeGnmbL6bz2RzgxYsTQuDQF7IqBooHd4gOqIkJuzzQ3UQTTwhst86xEmIXqXYeeNKUX9bbyrYhb5qUPs99FNEWwkysDOgE4g=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS4PR02MB8431.eurprd02.prod.outlook.com (2603:10a6:20b:576::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26; Thu, 7 Mar
 2024 16:48:21 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::fa03:deff:aae:c4d0]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::fa03:deff:aae:c4d0%7]) with mapi id 15.20.7362.024; Thu, 7 Mar 2024
 16:48:21 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Khem Raj <raj.khem@gmail.com>, Martin Jansa <martin.jansa@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] glib-2.0: backport a switch from distutils to
 packaging in codegen
Thread-Topic: [OE-core] [PATCH] glib-2.0: backport a switch from distutils to
 packaging in codegen
Thread-Index: 
 AQHaZ85Pepywq1uLvUWa8zcMnHRpyLEdQ/OAgADPyZWAAgUAAIALVsHwgAEU3gCAAAqOsA==
Date: Thu, 7 Mar 2024 16:48:21 +0000
Message-ID: 
 <DB5PR02MB102138631B34786C6D75118B1EF202@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240225093726.1113403-1-martin.jansa@gmail.com>
 <CAMKF1sr1SVSnAZ2_ZCTHfMyM8i01msDQ+81M5h+Bb9zmKGPLCw@mail.gmail.com>
 <17B78F10F29044A4.14830@lists.openembedded.org>
 <CA+chaQfh47nRBVAjhxpo1xeXWkmw-vHf8Jk-MWX6Npn4GfyGXw@mail.gmail.com>
 <CAMKF1sroBXyZwPqLyehFLD36orrh7fC3Z5A_b98863-5hbRFxQ@mail.gmail.com>
 <DB5PR02MB10213AB74AFAAB16C842B2E78EF202@DB5PR02MB10213.eurprd02.prod.outlook.com>
 <CANNYZj_r9yXTXCLsA+-g5sCowBfXnzK2w-HAs+=hcjp-ybnXEQ@mail.gmail.com>
In-Reply-To: 
 <CANNYZj_r9yXTXCLsA+-g5sCowBfXnzK2w-HAs+=hcjp-ybnXEQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS4PR02MB8431:EE_
x-ms-office365-filtering-correlation-id: 44358f36-9206-49c3-2d41-08dc3ec66606
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 mzo6dlJNHZNJ+8r0nZN/LKlk0MQPJI1hPT505C3qIuvd8/WeiJtP8n0kG0ludZpfHNT52tER97JSBj0Dl5Q/pIMVxfYf33fR0yJcSSG36RAT2saH7GC9+240rsU77WfiByAjCCH6ngAtAo97y23WAKM+ylb486mxtH3ulVr+k1U0qGW4lf4utybXoyJdpR2edsoQLmZjWpE4inmKIcOH6MetKWXRDhMDUp9BBWB1ZIGr3k2ilWQTy4EV762bVAPWCP/jZIW015+epP5lfvDITK+jKznYJbnNgrjOMrVOTeJu7in/3775UdOkCJAomulGIoreH/QI99ew9JxqzrJkI5A3Tn5F8AF4CvNG+77Ne/6DnxUJMzsQwwNdG6pB6KRVOYDeuisHDE6i8aFbqdngqXTJuG6oXcOivr4ws/HSmZG9cz2mLOWtrIp3js1O0EpVVkKJdXkqTK1k1qgapsaUTyo6TzhIn6ACh8OLORfWeNoSU24Cctl6d6YHvftaUm6aFGmoxBvTaV4Bi0vGTpb3Hn15uu24QteZJRYn40chwEQN1PRDX9BwHAFP3rQ/7gnLJjPC1oDegSqRcZhq4SzlXUiq5ZbSk2D7e8KpCRLHOVY4X50G+5vdTOjpWMkpwa4xm7gZtXIcbNrryd9vYJC8lujz9B2IvTp7GyDasTUQcB/t27hzlKDm+VQ2Vojo9nVtZzBq3hE6VxG/fxNV+ux2Mi739Pj4wbHzPPoOo3dOmlM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Zm44NlhiSWQwUkNpbWxyOVRPODVuNDIrTVN4bnhGVlNyOWVKWWUxRHppNzN2?=
 =?utf-8?B?TVBSOGxxSzhGTm52Z2krTlVhZDJiYk9sOE9hdk45cHFhb0tnWGlLd3FHNUVR?=
 =?utf-8?B?RnhkMnlHdElwUlhGWEhDbDk1VjUvM005WG40ZWQrS3ArQms1MEZFVlYxcVFr?=
 =?utf-8?B?VSszTnZ5WUVISFNCbThvVkd5M05VenpuNkpwTVlPWEM5ZzUxMlhYNGRCNUlZ?=
 =?utf-8?B?T2hMMWNHRWRDSkRNS1VXQTZwQ21DTXJVaUNEbmdWYjM3VTg0cTJjZTV3SmxN?=
 =?utf-8?B?b3hlUDNHOG9GSHZsbWlYOVZhbkxXalU2L2ZHM3F3cWlETW1OYkp5VWNwMHBR?=
 =?utf-8?B?Y0tWelZJdlZwS1JKcGpEUDlIUmtyTVFZQW1velFSMGc2RjBnVzFreUcyMDVF?=
 =?utf-8?B?OTJycmRvSFZ2eFFhRUpMNUt3YTNvZitPWCt5Smd4eFhTNjJyeGJlR3gvS3p5?=
 =?utf-8?B?K0U1ejhPc1dWUWl6ZHVqUzlYK0psM0FuaUpGMlh5Nk11SGRaS0Uvb3o3OERh?=
 =?utf-8?B?WGJicTM4aHI1c2NWb20xdERDcWVIbjRVdE0rMXRmSnhQQkdsdnI4T0Vqd2Ry?=
 =?utf-8?B?WmNFcFA4dFlJK3VIb1NQWkVSVEJaaFJsNHlDUEJaM1pCK2E5aXFwajVDa3p3?=
 =?utf-8?B?Szl6S3k0TVNLMThBbnc2WWxlT2UrOHdSakVFS2Z0VFhIb3FHWU1pNHlXa3hG?=
 =?utf-8?B?ZnloOGFZZkVrTEVubkljYVB5bUdaY21Xd2VsV3gveDhYcXNteXhpei9MaGRi?=
 =?utf-8?B?Zi96MXdvcU90NW84TnhiN29GNDRPdmM3eDNEUUxrNjFpeGZzWXAwSDZvOEFM?=
 =?utf-8?B?TDAya1ZMUnlJdGEwYUk3R09nNkw3UWYzQ1BUT2tjMnA4OVpBQnJjQmRyZEsw?=
 =?utf-8?B?V0I1QWwvaVFXZnM2cTEyMDVOTy92MzVWMGhWTEs5VmtMT25leUpIVDVEdzhk?=
 =?utf-8?B?VEdOR0UvTFN2WGh2U2k1S1I0Q2pKV1JFamFJMTFOV3hKQ3U2WW01YjdRbzJr?=
 =?utf-8?B?ZEVPMUY1VnpZUHhNdzZZZzFzMU5EVDRtSUtWbXBRV2FJY2xEalRUQVhlMjNk?=
 =?utf-8?B?dkE3SFNMMlZVZUdLMS9HRTl2OFk4WFVXQVR2LzBqaHFadnViNGVVeUk2bzB0?=
 =?utf-8?B?ajQ2ZXh3cEYzNWowajdHNEJPczFJMU9wWm53dTN0azRqanNQZnZkeC83Ylkw?=
 =?utf-8?B?QU1hWUE3ZG40SEltdzIvUEUrbjFXRUozbVFsSHpOVTc2V1RSQlBoN2FVeTNt?=
 =?utf-8?B?VXJ1S2tTUDFrYXh0YXhja24ya3VaVmkvRnVKT2FGSEorNGxLK3ZBRVRUQVZj?=
 =?utf-8?B?S202YTAyTGFUS2lydVE1Z0h2L3Z3UXYyNmRKVnBYbkk5a3pCTi9pNHhvS3hw?=
 =?utf-8?B?Lzc0S0k4SnZtL2xPM3lnSUJGVWEzb2psbFZYSjJ5MkgxbFgxVnhlL0diOUdw?=
 =?utf-8?B?em55M3pGUmdwbWJ1aVlhdG5Ea0dRRE5ENmhMWkx4eTZ0eGF4emFGNWJwZk84?=
 =?utf-8?B?VFM2L0Zyd1BSTXY4allvZk9zZGhMYW5OSE95d2lrU0F2Q2c0dHlLaWppWkxk?=
 =?utf-8?B?UkFnR0Z4bjVDSFFLUG5kSnY2ak9vTjlpay9IS0doWSt4SDRRUTJ4UWpQYUg2?=
 =?utf-8?B?NE0zV3kwQWhaTjBiMlg4em82UWU3WTVRTER1WEkzNjlXbGRldUZ1L2c1QWw0?=
 =?utf-8?B?U0hPRlZTYm45YVAwUmFydzNTS0kwS3NqVUgra3o3eUZQWWtDeHBoNEZsSzhF?=
 =?utf-8?B?aXd5N2ZtenpYRmMwQ3libTMvU09jZ0UzbTMxQnBCTGxsWVRnTWE0a2hHcGhL?=
 =?utf-8?B?MFdxY25la3dOTFIvNkpNRXgwL1FPVzN6TGE0VTJia1BmWW44S0VjaHZiVU5M?=
 =?utf-8?B?MjBqNldMYlRqcERlY3FMQ3luMkpUek5EYlp0ZURvVGlZR213azR3aVU5WW5n?=
 =?utf-8?B?Q2M3WTFoZmZnUGZkNFE1QVpkNkVmakNwc1FNZWdhMWhBMHNUR3VQMm93bDVy?=
 =?utf-8?B?VlFRL1RjbDJmS2lIM2UxTjdZQmFhMWZjS1lHVVFQc2FkQWZhb3JDNVgvem96?=
 =?utf-8?B?LzZldjJreW40bVJ1bXozekc2WDlPemVSci9SUS82eGYvam5ZMDhiT0ZwSE5r?=
 =?utf-8?Q?yVYk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44358f36-9206-49c3-2d41-08dc3ec66606
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2024 16:48:21.5283
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cOzromkORxotJHcKB1+v8E7222RydVpTYKfNggvZDXNfg5voA96Mn3XdY2GGIORB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR02MB8431
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 16:48:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196807

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIEFsZXhhbmRlciBLYW5hdmluDQo+IFNlbnQ6IGRlbiA3
IG1hcnMgMjAyNCAxNzoxMQ0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVy
c3RlZHRAYXhpcy5jb20+DQo+IENjOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPjsgTWFy
dGluIEphbnNhIDxtYXJ0aW4uamFuc2FAZ21haWwuY29tPjsNCj4gb3BlbmVtYmVkZGVkLWNvcmVA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0g
Z2xpYi0yLjA6IGJhY2twb3J0IGEgc3dpdGNoIGZyb20gZGlzdHV0aWxzDQo+IHRvIHBhY2thZ2lu
ZyBpbiBjb2RlZ2VuDQo+IA0KPiBPbiBUaHUsIDcgTWFyIDIwMjQgYXQgMTY6NDksIFBldGVyIEtq
ZWxsZXJzdGVkdA0KPiA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPiB3cm90ZToNCj4gDQo+
ID4gV2UgaGF2ZSBhIGxvdCBvZiByZWNpcGVzIHRoYXQgdXNlIGdkYnVzLWNvZGVnZW4gYW5kIGFy
ZSBub3cgZmFjaW5nIHRoaXMNCj4gPiBwcm9ibGVtLiBUbyBzb2x2ZSBpdCwgSSBoYXZlIGFkZGVk
IGEgZ2RidXMtY29kZWdlbi5iYmNsYXNzIHRoYXQgZG9lczoNCj4gPg0KPiA+IERFUEVORFM6YXBw
ZW5kID0gIiBnbGliLTIuMC1uYXRpdmUgcHl0aG9uMy1wYWNrYWdpbmctbmF0aXZlIg0KPiA+DQo+
ID4gaW5oZXJpdCBweXRob24zbmF0aXZlDQo+ID4NCj4gPiBUaGlzIGFkZHMgdGhlIGRlcGVuZGVu
Y2llcyBuZWVkZWQgdG8gdXNlIGdkYnVzLWNvZGVnZW4sIGFuZCBpcyBzaW1pbGFyDQo+ID4gaW4g
c3Bpcml0IHRvIHBrZ2NvbmZpZy5iYmNsYXNzLCB3aGljaCBhZGRzIHRoZSBkZXBlbmRlbmNpZXMg
bmVlZGVkIHRvIHVzZQ0KPiA+IHBrZy1jb25maWcuDQo+ID4NCj4gPiBJIGNhbiBzZW5kIGEgcGF0
Y2ggdG8gYWRkIGl0IHRvIGVpdGhlciBtZXRhIG9yIG1ldGEtb2UgaWYgaXQgc291bmRzDQo+ID4g
bGlrZSB0aGlzIGlzIHNvbWV0aGluZyB0aGF0IHdvdWxkIGJlIHVzZWZ1bCB0byBvdGhlcnMuDQo+
IA0KPiBJIHdvbmRlciBpZiBpbnN0ZWFkIG9mIGEgY2xhc3MsIHRoaXMgY2FuIGJlIHNvbHZlZCBi
eSB0d2Vha2luZw0KPiBSREVQRU5EUyBvZiBnbGliIHJlY2lwZSAocGVyaGFwcyB3aXRoIGEgY2xh
c3MtbmF0aXZlIG92ZXJyaWRlKSwgc28NCj4gdGhhdCBweXRob24zLXBhY2thZ2luZyBpcyBwdWxs
ZWQgaW4gdGhyb3VnaCB0aGF0LCBhbmQgbm8gc3BlY2lhbA0KPiBkZXBlbmRlbmNpZXMgYXJlIG5l
ZWRlZCwgb3RoZXIgdGhhbiBnbGliLTIuMC1uYXRpdmUuDQo+IA0KPiBBbGV4DQoNClRoZSBwcm9i
bGVtIGlzIHRoZSBuZWVkIHRvIGluaGVyaXQgcHl0aG9uM25hdGl2ZS4gV2l0aG91dCBpdCwgdGhl
IGhvc3QgDQpwYWNrYWdlcyBhcmUgdXNlZC4uLg0KDQovL1BldGVyDQoNCg==

