Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E35C0C43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 08:58:14 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.65218.1782982692289214674
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 01:58:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=M8rJlHkk;
 spf=pass (domain: ericsson.com, ip: 52.101.69.16, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vFI0Z2JbccrxUWxSLqyTLs7jqAfUfjcWgrJ4t2W8kEI+BptaBduqL0QlD/EipflWQG1scIjELPmdPD/lnmy99QMeZ8saKweWPAxINinNQhWA0+H3Y8UOWTA4ur0G2ifbVSJoXDh0zMrXYU0As+Zv7YblZHjY6uf4FgiLKkQlBsZaJGeGaNGU3awE7RiFBdVjMYcPo6sM3YLsUKgLpY3viY/wY7BJ7x79BNo3B8kLEHukevPeTA425T8sosE1mW3MYqE8u8JpvbQjFPKcBAQIGQUJi5tV2LSky1YrIu8m2r3vjeMinEJBDsby3zNcqlcMbELyPgKMqfM3azmtHtpdEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5sKj41hAzaFMALdgHSP9OyqdKJcQGIncJBmf0xzHbg=;
 b=RQeMCkucyNS0FvlAPgRzCV1N4loVJ8Qk9UhYpcVoYMOQ4h3mX0qOwCfspyLcJjewzmIwtHl9FHZnLHQYHE73ZHe1HzjDtMbKM2+OlGvytcDjmDVyGLhFeHMmNvX9uUyhzhBqMg0wLYckaWdy+IPj225QToa3lBfN28AkAN8Hmh663poEn48Vtb01FxuEhPVFcsC/fYU6t8yCnJA2ZwgE57f/e18FI/XrXc5CoXdehNDiJmyEhkVyVb5CK9FVCWor9GS212PZ7LOaqJW1lDOjM6zm3XG3Jab5EG4YZF9YBk4RohrZP8HXqUn6R7SRGf3qTxGaOR82RvPmJQbxyXvElg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L5sKj41hAzaFMALdgHSP9OyqdKJcQGIncJBmf0xzHbg=;
 b=M8rJlHkk/RElF/zSvYduL7I3pr5RYtqLvB64X1UBBQWkzbbu98DOj9wS1MJ1lJYd617199vQCWSkppyiwSFtFUMC2Az+8cBduaQSHb62j0qipqRamNDi0V3Ldnx8ic3AcBsK5vuuOG1eA/LVuzAHT089PLYefBJTfWdtAH2OI8KI9Wm1v0cafWXjXR5r7KAzmeAPs2GJwFrhdVOV3Qcq3HNGrex2eO9ZaBlsAn++5CmfLC65GohIL2RbQ/w9MmJQ4IeynJaBMsycqNBu2VXFOPNkG/8hdeXQi7UrTb9Y41mnvZtRm6rw9Qu16Sa2USr0yDfwdeXlGahH0x0fXrqBwA==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by AS8PR07MB7160.eurprd07.prod.outlook.com (2603:10a6:20b:25d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Thu, 2 Jul 2026
 08:58:07 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%7]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 08:58:07 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>
CC: "qi.chen@windriver.com" <qi.chen@windriver.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, "Ross.Burton@arm.com"
	<Ross.Burton@arm.com>
Subject: Re: [PATCH v3 0/3] systemd: update to 261 and be compatible with
 rhel8
Thread-Topic: [PATCH v3 0/3] systemd: update to 261 and be compatible with
 rhel8
Thread-Index: AQHdCIa1vskK4SNBwEGlQJdUOSKzmbZZ6sUAgAAF+AA=
Date: Thu, 2 Jul 2026 08:58:07 +0000
Message-ID: <afbb3cf90ff55c3b4e693b8a28a6903b7f34f946.camel@ericsson.com>
References: <20260630115028.4001775-1-daniel.turull@ericsson.com>
	 <DJNY5PFZT70X.2O5P68RPD0PJU@bootlin.com>
In-Reply-To: <DJNY5PFZT70X.2O5P68RPD0PJU@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|AS8PR07MB7160:EE_
x-ms-office365-filtering-correlation-id: 1cc63707-4b0d-4337-cc04-08ded8180929
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|56012099006|11063799006|4143699003|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: 
 zyKJWqn3TZujZjVCql9ugFkb5k5JkRI/kCFbXE3lcY0mTSIPe3HJuJvquTl4FA/v7x0JZXu62GajEs0UsDduOGZnHLCOi9WGeunXIwVRPvokRidHtJDeMlvwmmPrVi00er/RaxdG1KpkKpDwGV1m47F1vIskVFWBLhkLRtluatIPhAa6yT9cmn6m6SyvQtHJjZkFoqIIq/Dfgya8RsCaglOPmmbelXYAeXnkPtXKPSoOS4AG4Zs3nw8JpJmofmFZjKi1VuOUgjBrrvDn4CENWnUSB//RNxWWjBOBF2O0wODQGK6vqEEOth675otY9OR4c9Xf2WEWQBPG08xi15a4facbRO2AFUieXm6BGFIQx+FldQuOLI961eqaV3rP0VfKXhRBRALnXQpr6MbnQa7wMvh5WLz6TLHYxSfL+xuS4fCYBre1nzk4nLbVcWTpaTF+iEgF7XD9H4VdJujbeq9z3Yefq1JNAooKH3EoUY0A1X8aRwP2VtCR1F8SpBdyY/PLj4TtnL9vqyXu//lfzuGs5cY4ykGXx9BWfm0KBJa+fQvxzdsfkm/FDryAiKjcvHH7/kDXggnEpXswFvkXZ/jDUKXp5ZFJfz0EQ1EQMbQdf0U9jSbeR5CT1LWWU46tkAXEMcnlNGE5K5CxkrnCOxr8OB4HZI1s3H6aYj1rdDylaJHLOladJKVUoi2kLzzZ3eSnlXKIROTJEp+bWy+jzkIqbuX+Ihjd/2xPBZJqFb3yAww=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VStRRmRoTFF4OWFEaEVKZUhucVMyRDhCKzgrRTFIUjlZUis5SzZpRThQOWxK?=
 =?utf-8?B?Ly8wRlFMY3V6bEdNcjdiRVdxRVdwU3VJMXFYRGY0eHRENXZlK2t6bmJLUDBv?=
 =?utf-8?B?bTRUZ0JsSHlCZG5HOU4zNCthTG4yZCswamZoakQ1bmxaQ1VUNUJMVDBUZGZH?=
 =?utf-8?B?VjZ4dVB0S0NYOHBOOWRGT3RYdTJYWTUrMW1vODlmeGV1S2NscEpHT3k1SGd3?=
 =?utf-8?B?N1o3OERnTllJY2c2WVVzRHlUNEpmSE9jSU9jZFBQU2tIdjhpK2U2OXlGTVk5?=
 =?utf-8?B?REVXZkl1TERwS0NWU1Vsa29CR29HbW5vNG5zTUdJWk14Ym50OVRQbndXLzlL?=
 =?utf-8?B?cU1jYjJzUHkwODlVdWdEL3Jva3RONlM2NU50S1FvOFRNd3BvRnZ4YUlIdW5G?=
 =?utf-8?B?K3FLblpWb2dsRGJOL09oTENFNFZ5R1d0aUlSelNQU2xEYSs2SjdmOUtJcUpI?=
 =?utf-8?B?Uk9kSEowenZaQXgwellGaEUxUjZacytpYmRmQnVkV1hvbWg1K3VvT3pLNnlk?=
 =?utf-8?B?a2ZRMVZNU2dnZURBbVgxcG5TTDdhdW1BejI5SGxuYlFVQitNSHg5NnRFeU9H?=
 =?utf-8?B?MG5ZNlZRd2JjeENVY2dPci9tVVVtemNYZzlGajNQU0dqSlNhU1poUlQ3Mkhk?=
 =?utf-8?B?Z3NmOEIvOERFeTBhZW5GclRNaEhQQTlOUTc5OW1ENlNuV2dXcnVUZWJKVngw?=
 =?utf-8?B?SjNkNWtHeG5yZy85T1FqOGVyOWdTR1lSVmZCVVhpNHp0a1BMSy9KZFFIaFY1?=
 =?utf-8?B?TlBqUCtpeFlUZmRsSFdMZjNNa1VMZHhQT05XbmZybHMvVnlWeDdETVBHemVJ?=
 =?utf-8?B?dEljSU1DRGpMZnViYlNieXhnMFVsWGdtT0piTUplWm1EcFlsWWlLRjZMOUVV?=
 =?utf-8?B?dVlYUmRFUGp4b2ZTS3B3WVBWU1Ixc0F6a203aHhvaFZFLzRCQzJrMC8yVWJa?=
 =?utf-8?B?aTJoNmRTTENBUHQ0VGtTMXQ2L2dhU05HdjVYZ1cvOEZIY2Vzck5tdXJaR1Bi?=
 =?utf-8?B?SFFOSm0vWVBZU0s4d2YweDhsVEViazJmY0pJYTZHdkhGbVZxT2pDSTNsTThL?=
 =?utf-8?B?U2IwRjhJdUpPbmZBdnQycFJvdHBTeWVGWDFPMVJ2RjVNWlphc0RWSHo4c0RM?=
 =?utf-8?B?Y09IZEZ3SnZieFV4UjlPbnFMcllIQmxGS2JpZjdPeFZ1NXAwWFpRcUxDMUIr?=
 =?utf-8?B?a2dWcGljcWZvOFVPOWN6TzBQZWFuT1o3QVhCRlhzTHVBTHpkZFhLUGxaSUFs?=
 =?utf-8?B?bU1ud0xSUmpPSVg2WU9BVUxLWGlKYmpCeTZXMXdXaDlJZ1BtWjlRT0V6NG1M?=
 =?utf-8?B?ZXcwZGpwazdERmpTS2w3NVg4b0dqZy9DckFkTWMzSEk2dU9IMGVwM2hCSWVp?=
 =?utf-8?B?WlpUWlRyUFNrQ0FNZXplVFB0ZnkwdGVEUnE4TlFnQWJXRGhHSy9QUHpKcFRw?=
 =?utf-8?B?VGJjN2tBZVpDWTh3U29UVnExSVZmazhKU0d5QUgvM0s0Yy80c3dIVDc0SmtV?=
 =?utf-8?B?emNMcFNLcUhUOC9YbXJhYzZlMW1hRmVOdHJacDd6TkYzRGVXRUowMWVBelZZ?=
 =?utf-8?B?QUV2UFNaTXo2RFI2U0ErL0NXTHpoblJHMDRmcUFBbytHZDVIT1dNL2h0ME91?=
 =?utf-8?B?MDdMcm9kWnYvWDNZbjg1Ujl0dHF2alJXOTlxMTRrM3IxdjRhSDhEN1A2ZC9p?=
 =?utf-8?B?WWRIZHN0bDhPeFY2TEZwN1RCUUlJRUV5YzNwQ1BMUVUzSzJhTzJBWDVFWFc4?=
 =?utf-8?B?SUpSd0k4eUV2QWxUQTJvYkFEb2NTYkVGTTJpMDBtS1FBK1JJeHZGTStOTmg4?=
 =?utf-8?B?bWx4cmM4WEV6ekNUZ3V3MVJYdHhhZ0p1MkhKOW9PdmUzY05oTWpDaFBYc3dM?=
 =?utf-8?B?Z0U2ZEZ6QzZLVjI3Z05OU1ljcnU0dUd3UkVYclZlUHZTZlF5OFZwQjM4Smsx?=
 =?utf-8?B?WHRXMGFwMWVrcTBkRzdWQzlhSGRsVUU5aUpGWUZ1WnQ5ZE0yY0U3bm83SmtW?=
 =?utf-8?B?Lzh0K3dhaUY4R0lsYlNFdkRhWWNGbWhKcndkaWhRSThyaXlwWFZ4RUhxME0z?=
 =?utf-8?B?dkgvNGlQUWd0dFlDTUpsQlZTRFdRWUxHYml5dWc5YkxZV1BDWU9GbkF4YWtj?=
 =?utf-8?B?NFVlOVIvU3d6UHhxNEJIcnFpdkYvR0duaUcxSWlXNnVNOCtuaTIvMStGUUcv?=
 =?utf-8?B?ZFZiVHJibTRlbVYydDZkR0ZKWGFXYllhTDducWpsNEowV0IrbysvbUlBeTRE?=
 =?utf-8?B?YzVDYjBiZDBmSEl1WDFXSzJUYk96cEJjRm8wWkJncGlNeGJTZmxKNUl4dlNL?=
 =?utf-8?B?ckNSN3o1QlhycmNIUEtUZDBzR1AvSUU1bWZBUjNZNFpONGl5QW1oT2JWeUhY?=
 =?utf-8?Q?e1wzTrkmC7x3r7MM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <454B7FC4548AF84E8794D52827BAE1D0@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cc63707-4b0d-4337-cc04-08ded8180929
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2026 08:58:07.6919
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bb7rTJS5TavXI04wrskpIkLdJPtFEkXfz6mpHf7BrbEFEwd7yFlmreTdA9nRbgGymhbzpE9ZOXyh/8LpbzRDlCCdBE+YD0mpfgIFz1D7zFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7160
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 08:58:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240027

T24gVGh1LCAyMDI2LTA3LTAyIGF0IDEwOjM2ICswMjAwLCBNYXRoaWV1IER1Ym9pcy1CcmlhbmQg
d3JvdGU6Cj4gCj4gSGkgRGFuaWVsLAo+IAo+IFRoYW5rcyBmb3IgdGhlIG5ldyB2ZXJzaW9uLgo+
IAo+IEkganVzdCBub3RlIHdlIGhhdmUgc29tZSBpbnRlcm1pdHRlbnQgZmFpbHVyZS4gU28gZmFy
IEkgb25seSBzYXcgdGhhdAo+IG9uCj4gZGViaWFuMTEgd29ya2Vycywgc28gbWF5YmUgaXQgaXMg
cmVsYXRlZCB0byB0aGUgaG9zdCBkaXN0cm8uCj4gCj4gRVJST1I6IHN5c3RlbWQtaHdkYi1uYXRp
dmUtMjYxLXIwIGRvX2NvbXBpbGU6IEV4ZWN1dGlvbiBvZgo+ICcvc3J2L3Bva3lidWlsZC95b2N0
by13b3JrZXIvbWV0YS12aXJ0L2J1aWxkL2J1aWxkL3RtcC93b3JrL3g4Nl82NC0KPiBsaW51eC9z
eXN0ZW1kLWh3ZGItbmF0aXZlLzI2MS90ZW1wL3J1bi5kb19jb21waWxlLjM3NDcyNDknIGZhaWxl
ZAo+IHdpdGggZXhpdCBjb2RlIDEKPiAuLi4KPiA+IC4uL3NvdXJjZXMvc3lzdGVtZC1od2RiLTI2
MS9zcmMvbGliYy9tb3VudC5jOiBJbiBmdW5jdGlvbgo+ID4g4oCYbW91bnRfc2V0YXR0cl9zaGlt
4oCZOgo+ID4gLi4vc291cmNlcy9zeXN0ZW1kLWh3ZGItMjYxL3NyYy9saWJjL2xpYmMtc2hpbS5o
OjcxOjMyOiBlcnJvcjoKPiA+IOKAmF9fTlJfbW91bnRfc2V0YXR0cuKAmSB1bmRlY2xhcmVkIChm
aXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbik7IGRpZAo+ID4geW91IG1lYW4g4oCYbW91bnRfc2V0
YXR0cuKAmT8KPiA+IMKgwqDCoCA3MSB8wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIHN5c2NhbGwoX19OUl8jI2Z1bmMsCj4gPiBfU0hJTV9OQU1FKF9fVkFfQVJHU19fKSk7
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgXAo+ID4gwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBefn5+fgo+ID4gLi4vc291cmNlcy9zeXN0
ZW1kLWh3ZGItMjYxL3NyYy9saWJjL21vdW50LmM6MzU6MTogbm90ZTogaW4KPiA+IGV4cGFuc2lv
biBvZiBtYWNybyDigJhERUZJTkVfU1lTQ0FMTF9TSElN4oCZCj4gPiDCoMKgwqAgMzUgfCBERUZJ
TkVfU1lTQ0FMTF9TSElNKG1vdW50X3NldGF0dHIsIGludCwKPiA+IMKgwqDCoMKgwqDCoCB8IF5+
fn5+fn5+fn5+fn5+fn5+fn4KPiA+IC4uL3NvdXJjZXMvc3lzdGVtZC1od2RiLTI2MS9zcmMvbGli
Yy9saWJjLXNoaW0uaDo3MTozMjogbm90ZTogZWFjaAo+ID4gdW5kZWNsYXJlZCBpZGVudGlmaWVy
IGlzIHJlcG9ydGVkIG9ubHkgb25jZSBmb3IgZWFjaCBmdW5jdGlvbiBpdAo+ID4gYXBwZWFycyBp
bgo+ID4gwqDCoMKgIDcxIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
c3lzY2FsbChfX05SXyMjZnVuYywKPiA+IF9TSElNX05BTUUoX19WQV9BUkdTX18pKTvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBc
Cj4gPiDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF5+fn5+Cj4gPiAuLi9zb3VyY2VzL3N5c3RlbWQtaHdk
Yi0yNjEvc3JjL2xpYmMvbW91bnQuYzozNToxOiBub3RlOiBpbgo+ID4gZXhwYW5zaW9uIG9mIG1h
Y3JvIOKAmERFRklORV9TWVNDQUxMX1NISU3igJkKPiA+IMKgwqDCoCAzNSB8IERFRklORV9TWVND
QUxMX1NISU0obW91bnRfc2V0YXR0ciwgaW50LAo+ID4gwqDCoMKgwqDCoMKgIHwgXn5+fn5+fn5+
fn5+fn5+fn5+fgo+ID4gLi4vc291cmNlcy9zeXN0ZW1kLWh3ZGItMjYxL3NyYy9saWJjL2xpYmMt
c2hpbS5oOjcyOjk6IGVycm9yOgo+ID4gY29udHJvbCByZWFjaGVzIGVuZCBvZiBub24tdm9pZCBm
dW5jdGlvbiBbLVdlcnJvcj1yZXR1cm4tdHlwZV0KPiA+IMKgwqDCoCA3MiB8wqDCoMKgwqDCoMKg
wqDCoCB9Cj4gPiDCoMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqAgXgo+ID4gLi4vc291cmNl
cy9zeXN0ZW1kLWh3ZGItMjYxL3NyYy9saWJjL21vdW50LmM6MzU6MTogbm90ZTogaW4KPiA+IGV4
cGFuc2lvbiBvZiBtYWNybyDigJhERUZJTkVfU1lTQ0FMTF9TSElN4oCZCj4gPiDCoMKgwqAgMzUg
fCBERUZJTkVfU1lTQ0FMTF9TSElNKG1vdW50X3NldGF0dHIsIGludCwKPiA+IMKgwqDCoMKgwqDC
oCB8IF5+fn5+fn5+fn5+fn5+fn5+fn4KPiA+IGNjMTogc29tZSB3YXJuaW5ncyBiZWluZyB0cmVh
dGVkIGFzIGVycm9ycwo+IAo+IAo+IAoKZGlkIHYyIHdvcms/IEkgc2F3IGl0IHdhcyBpbiBtYXN0
ZXItbmV4dC4KClRoZSBvbmx5IGRpZmZlcmVuY2UgYmV0d2VlbiB2MyBhbmQgdjIgaXMgdGhlIG1l
c29uIHdyYXBwZXIgYW5kIGl0CnNob3VsZCBub3QgYWZmZWN0LgoKRGFuaWVsCgo=

