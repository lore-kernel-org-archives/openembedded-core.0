Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F7A0CA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 14:50:43 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.60320.1790607040750768479
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 07:50:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=CPQDN4qv;
 spf=pass (domain: siemens.com, ip: 52.101.84.30, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBa53vLrGkmdvaY0gRjnaSx0WiwZA3eQUiWSyLKZd85ZiOy4WVZEE4Tk2H9qOOHBCoh2o2OYjd+4+xE7Y3CSSl6hkdoh92ehcHbn3rTJ0UAMWyJ3gCyYnFl7Hm3RSgj5RYvjG2jukPrsGiI8feiV3/jnXwVzzBl0XwFgQbIxUMkejnjwQROr5/0+DV5qmh0zCIza6n0Ykr8IGt0JZUjM/DEHOoDpXk7IjQHNbKaa8Cezjb1mVig9lsWvut2v3MT6Md4KUnn7vo3WZx77GkHcpdzzFhfQ7B7JVEtAGzQKdacx3tUnhxAkibzWmCANuHcBL2G2oanbw2zh/8ew8j8Y/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zul+d55aT6FNZRaSSaGg7ic2z4Eps0fuk/dGXEDhPcM=;
 b=ccY2FyyoYCWhukMukuw7RL3E+MQ5HewlRd9B5yOSQPaNzDAhyh/2bwzg0fx9QPm6FUZgvyaxzIpczHFgSc5mQkS1Yu01HoxnQwaJyc91txn+Z65p+yrHu1/m3mfIDHy7hMZDBgb6CHjSEWfgEE+JrIuDj4EbMhdeRrzVFxKajdAWiVRF18eC7Q8tvi3VXvbz/lzbPbbwm9j1k6QKeVyJngTiOrdgxfpAyYNjBVHdA7Y4MxKNxWNXmSud9S4pzlVuOEiv/kQ7AvzUl8O56T5r0u1BUguQ4RZDcx4DmI25KPuL0ROA/iWZWRFq4tg/9EVgt6nDm3ZK1ycfIpTy5nFkIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zul+d55aT6FNZRaSSaGg7ic2z4Eps0fuk/dGXEDhPcM=;
 b=CPQDN4qvtde8EcmQEJkZilMDMqtItLLGXVMO0YSTKU1p2YrT3H6TL0mFvW2WRN5V66E55qNAnjLiufPA2+gExZS2E8jjB+LQFZNx0gKNEfozSFpJpF8vkkUvE/hrT2+DgQCLeZzFAcp9h2361+5YHH9K64C2xJQYSSe6h2nDOMWcFBLvYzaIPvzP1slSAIJv1QYsNdZPZk2R2QPoY0Mjh7imtVdWKnVcOGTV7SiCrdVpjz3uA0TMvmR58/WA7Lw9zy7NyVcxC2fmfvP0fbs2lCsrndVPg/xT2qMJGy1D9ns25CJV8pqvnE7uDrp/ZOSvHtntSaFEyC2CqVeoUQJ1fA==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by MI7PR10MB209735.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:290:103::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 14:50:36 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%4]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 14:50:36 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, "Freihofer, Adrian"
	<adrian.freihofer@siemens.com>
Subject: RE: [OE-core] Topic: native libstdc++ and uninative
Thread-Topic: [OE-core] Topic: native libstdc++ and uninative
Thread-Index: Ad1LakgeZcGn4IMERMacG3ZXIP6ElwAJQnsAAAFCBIAA8QWYcA==
Date: Mon, 28 Sep 2026 14:50:36 +0000
Message-ID: 
 <AS8PR10MB507322CAC66F02E27C95ECA3FD8D2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: 
 <AS8PR10MB5073C8A330EA6849DA8DE457FD822@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
	 <CAMKF1spD1wpQm5STRFFjCRSrhXHix54BC_e=EXgw-5LCQUzzVw@mail.gmail.com>
 <98ded4246a7043b511aec098142bdf0b30e08300.camel@linuxfoundation.org>
In-Reply-To: 
 <98ded4246a7043b511aec098142bdf0b30e08300.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=fb639850-e6ad-4312-a50d-71099e0bd0a4;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-09-28T14:48:35Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|MI7PR10MB209735:EE_
x-ms-office365-filtering-correlation-id: 18a90d89-d1f0-4303-8f92-08df1d6fdb27
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|4143699003|22082099003|18002099003|55112099003|38070700021|10067099003|11063799006|56012099006;
x-microsoft-antispam-message-info: 
 yJ7m0ukezcq4SU2YbqPNijm/9uFj7Q6CCOLG/HuueUiO+gEg6z4k5EUP46pdq8hb2fcIfHN3dEGMdLEL/tLVxKSvLQeW/eyYNa+hNZQLfIYuGxwOoH31Vz3geNQEruKuw3i4PHPQ1bfNNyaRaCil47xfdf4XGPXAiM8eaJE8CztCZqoiuYBHbloE1MIb+0MPAqr5Wg/S+zOT1DjJsjl/3iD/pEFop5/cEfimD+FtlUA3KFMVc32IJj1AZRG8jHtt4mHnR8IHYAvtKuSsCCMjwj0L8Uj5UYuzuYWNtc9Mr9ag3SIJVDq+6NK9wy0mEA38yrUbVXpHALCAGwHgTk11MT9Ydurgs9nyP4NloWrgeAdKv9w4bwLooUPV9IewVyTPKhpLaTuU9fm4HQq3RMUqHHiJzs9nwK9LIL4lNXVt1fiRYTmto3xBGTW/dXTJPlDu9SQctimNcEivj/aVssY7c5v8uFC+cD6pWw2V0rMrsKceK4A1c69NxQ7rzroQ79pLv8WkWfnkjPVRnUmm2bjl4ZywPJVR0vlen5jtsvTV9Em5kwwOLSB4TDdcesuva+tAeY2DemFbpshG0ijmrmjbwfSyNnEUGgVnV94KCyT9qCYCtz14kC8tm6z3jREpNvjGRf94OgOPPvY+QjMKNPLcDSGfmt4Az/poazAsyfpCu5mH/zrqLL6OnNJu3y74Y9QGZ3l5ksQRpcDuEgc4R+SIGl3xH0Y20gsM7jzOpfHz040=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(4143699003)(22082099003)(18002099003)(55112099003)(38070700021)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UVJVcUNIdFZpUDlWVHBMN0JXTjVCZmFYK3ZCVjZkQW5KdDJiRnZuR2ZRS0hy?=
 =?utf-8?B?dkFXMjNCa2xWcWVXMjBIaXg0bUM0aEhRWmxZWFRIT0VrRjBUK2FCVm0xV2FQ?=
 =?utf-8?B?TDA3OGkzR3RFTk1yZzBHVWY5WTJlQTRNNkhDNVpTUkw2aUJPVU5mdGUzTitJ?=
 =?utf-8?B?WDhJamF4TFQzS1ZKNEZXTWZwdXROdVBuSjlTcnQ0SDg4bkxjVmhzRzlkYURI?=
 =?utf-8?B?Nk5HekwxUUREaUVLOHVWdEdPMGlDRjEzZHMxZGR5SVZ6c0N6WC9hMFNPNkZZ?=
 =?utf-8?B?a0d2emxTN2VFZUFxUVpJL1BGVERQZ2ZEbUlNaU9BajM3TzBPNDlMbG9xQ0Vl?=
 =?utf-8?B?SlR5VWFHWHJKMnZ2ZFlRNE1uTmJxSFFoTkJtbjl5QktOQ0c5Q2RHdGVMaWxS?=
 =?utf-8?B?WG1XWnE3cFpSQnU5cHlMenFncENrcktob0N6RnV5M2FyWWpyempKYnJ5UXFh?=
 =?utf-8?B?SWd5SEtGZFQxY3poSll2UGtWMk1Ndy9KbWpaMW0vZGQyVWNka01McjVmVmk3?=
 =?utf-8?B?UVNUS0R2eU1hOEJXbUNqZmRjdnhvOHBzTG5BVVlsT1ZrLzdPbG9CTDRFK1hr?=
 =?utf-8?B?bzZncEtJWm4vWS8rLzJCaEZSV1ptK0k4dUVVQ1Nobm1mSmYrUE5pUTdFYWY4?=
 =?utf-8?B?S1Q3Mmhudnk0d25rOWNNTlVkejdJRFFLYjdhdTRCTnB0MUgrVXgzOHNPa2pz?=
 =?utf-8?B?WjZiSjd1SFc0eG1WcnpZSkhPRWVTTjJwY25aenVPNzlMQUtzQzFpdUdzb3F0?=
 =?utf-8?B?Z0JmaTFEaXNGaCtxOEN5U2tmTnBqMUVJVVZmSjBmUk94Vi9VNEF2eVdKREw5?=
 =?utf-8?B?RzBxUkVjYXBtV1JCUG9xdjl3UExuZkpvcmgwVFZrY0tReEk2aWtWV282aGxG?=
 =?utf-8?B?UVVXV3diTHlkek13b3NFMDRqSUtHK2RKSzhNL2lGMnhUOERwcVVpZ0hRLzA2?=
 =?utf-8?B?c2dKSlRXQ1Q5dXZhMnlyRUczbDYxem5jenZxV09RVjJaeHBlYll0SmNUQjE1?=
 =?utf-8?B?Zm93ak9ZZThXTTdxQjdRMDBNSm0yVUpldzAvczEzWXlYM2RrTWkwZkJvQVFR?=
 =?utf-8?B?VUhWdkE2c2w1YmtRbTFlemRKN2U1VkEyYmtmVzNwdkM2OHVMbWNIOXJkSW5I?=
 =?utf-8?B?Vkw3ZUdES1Jwc1pqR3pEaUhNNlVVR1VkeFkyREMwZmNDbzRlK3pzUlVhQ1Zs?=
 =?utf-8?B?UWlCQ3V4Y3hlRDZjNldBNlFsWXlCd3BqVmZGRVVlOGJRcFhOK1ZudHE4aDhK?=
 =?utf-8?B?Q1dwQ2xSaVpGbW9XMkl4cStKejhSSGRFSlZ6RGdTREJrWXdLVmk3czNQdFF3?=
 =?utf-8?B?aGVWamRUNGxORDZLaysxRWtma2djN1p0Ti9NUTVvSmtuS2VNMnA1TDVHR1dZ?=
 =?utf-8?B?bVc4Y1Y2NG1yT1JUR0tZTC91Z0NjRkp1dUgzdGovcnpsczVxYWZ2NEdvTk9l?=
 =?utf-8?B?Ukg3Z1BDZlB4MG1ybFIvaUNzMmlRdSs2TUQwdXlHL04rQUNPQ3FxL1NwVml4?=
 =?utf-8?B?dDJ6UTNPLzEzMlhPbThOdHFDMHM3MmYyOEwyZ0lqbTBjdmViNUtqQ1BXaHo3?=
 =?utf-8?B?WnRYZGc4OEswNDM0TEVoMnVDakhwTyt2U0tyU0tJWHovczhKZjNLSnl6RER4?=
 =?utf-8?B?cXhoVmtKanFoa2MxYUlqK2kxSGdaM3A2ak1vM1I4VGcxVElHTTlRU0MzUzVa?=
 =?utf-8?B?MUt4MytYdjdqaTFSYkVHOTBBWHlQdTFRZjlTUzlaamlhNHlmZE1pNGlQUEdT?=
 =?utf-8?B?TGdmMmxMNU1nOGpZVCtjOGNPOVhOaGJ0M0E4VmhuYkxsSjdMYTViWDliR2Za?=
 =?utf-8?B?bVZRM3BkaUpvcDVra2ZKdmtub29BdVhWa21WK3B5TnVtVWJPR3A3WGhxVG1H?=
 =?utf-8?B?Ni9OMEo4Z3FwWlNyMWVrSE10KzlZTU1vNGlldXVOYkpGU2N5UE90WC81THhC?=
 =?utf-8?B?Sk5nQ3gxd2NPck5RNUp4RmZnVzh6ZzlYSkhvTGlnUjFNTDlpVkxpRW0ySExh?=
 =?utf-8?B?Y2pBSGhWMDBWZjBuRVhLRDRFcCtSa3Q5bXpCTWFXV0JYRW9YT1BiOHh0Q1VH?=
 =?utf-8?B?UnJwZGcrVjVvcHptdFNBVHhiSm5Jb3JRaFZwWU5yeFJnVGxub3dPb2l5bmh4?=
 =?utf-8?B?SjMwRDgzZ0V0R3h0d293TGwrVTQxZHdncHQ1Lzd1bGtKUURIam10QVpKN1lL?=
 =?utf-8?B?ejJyYk9NMkFSWXFVNEZVYWRtdVJjN0lPWG1ZaEQ3VXFYQktsMkg0M0htZVZJ?=
 =?utf-8?B?eEczallpK2FiZFdIOGxoU0VyZTRXdFhLYnVGcWlqNlpPclVLbzRWREVxam1l?=
 =?utf-8?B?M25sV3dKQ01HUjZiRlhFT3dKTlBuOHgzVVBOOXdiRFA1V2ZNa2RuQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 18a90d89-d1f0-4303-8f92-08df1d6fdb27
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2026 14:50:36.4458
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nd6tsskL+MZEz4VBy55p+lM6+2iXT8hrD0ykfJX4xiu/oIgeupKMaYLhV5GsdvQRzUdwHk9bOEhocrGgZVscGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI7PR10MB209735
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 14:50:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246768

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBQdXJkaWUg
PHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+IFNlbnQ6IFdlZG5lc2RheSwg
U2VwdGVtYmVyIDIzLCAyMDI2IDk6NDcgUE0NCj4gVG86IHJhai5raGVtQGdtYWlsLmNvbTsgTWFy
a28sIFBldGVyIChGVCBEIEVVIFNLIEJGUzEpDQo+IDxQZXRlci5NYXJrb0BzaWVtZW5zLmNvbT4N
Cj4gQ2M6IFBhdGNoZXMgYW5kIGRpc2N1c3Npb25zIGFib3V0IHRoZSBvZS1jb3JlIGxheWVyIDxv
cGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz47IEZyZWlob2Zlciwg
QWRyaWFuIChTSSBCIFBSTyBUSSBFQUMgQ0NQKQ0KPiA8YWRyaWFuLmZyZWlob2ZlckBzaWVtZW5z
LmNvbT4NCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBUb3BpYzogbmF0aXZlIGxpYnN0ZGMrKyBh
bmQgdW5pbmF0aXZlDQo+IA0KPiBPbiBXZWQsIDIwMjYtMDktMjMgYXQgMTI6MTEgLTA3MDAsIEto
ZW0gUmFqIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IHdyb3RlOg0KPiA+IHVuaW5hdGl2
ZSBvbmx5IG1ha2VzIGdsaWJjIChhbmQgbGliZ2NjX3MpIHVuaXZlcnNhbC4gbGlic3RkYysrIGlz
DQo+ID4gc3RpbGwgdGFrZW4gZnJvbSB0aGUgaG9zdCwgYm90aCB3aGVuIGxpbmtpbmcgYW5kIGF0
IHJ1bnRpbWUuIE5hdGl2ZSBDKysNCj4gPiBhcnRlZmFjdHMgYXJlIHRoZXJlZm9yZSBvbmx5IHBv
cnRhYmxlIHRvIGhvc3RzIHdob3NlIGxpYnN0ZGMrKyBpcyBhdCBsZWFzdA0KPiA+IGFzIG5ldyBh
cyB0aGUgb25lIG9uIHRoZSBtYWNoaW5lIHRoYXQgYnVpbHQgdGhlIHNzdGF0ZS4NCj4gDQo+IEht
bS4NCj4gDQo+ICQgbHMgdG1wL3N5c3Jvb3RzLXVuaW5hdGl2ZS94ODZfNjQtbGludXgvdXNyL2xp
Yi8NCj4gDQo+IHNob3dzIGxpYnN0ZGMrKyBzbyBpdCBzaG91bGQgYmUgYXZhaWxhYmxlIGF0IHJ1
bnRpbWU/DQoNCkknbSByZWFsbHkgbm90IHN1cmUgaG93IEkgY291bGQgbm90IGZpbmQgaXQgd2hl
biBhbmFseXppbmcgdGhpcy4NClNlbGVjdGl2ZSBibGluZG5lc3MsIHNvcnJ5IGZvciB0aGlzLg0K
DQpJJ2xsIGNvbnRpbnVlIGluIHRoZSBvdGhlciB0aHJlYWRzIGZvciB0aGlzIHRvcGljIGxhdGVy
IHRoaXMgd2VlayB3aGVuIEkgZG8gbW9yZSB0ZXN0aW5nIG9uIHRoZSBzdGF0aWMgbGlua2luZyBo
aW50cyBmcm9tIEtoZW0uDQoNCj4gDQo+IENoZWVycywNCj4gDQo+IFJpY2hhcmQNCg0K

