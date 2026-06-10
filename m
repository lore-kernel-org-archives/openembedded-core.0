Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD7DCD8CB2
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 06:12:15 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.26])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14012.1781071934340551633
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 23:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=UpAHYum1;
 spf=pass (domain: siemens.com, ip: 52.101.83.26, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P0Fz80K47DgJvuFYVBzHT0EnyZVwlm4fALv1YRcOZRcXEWNmuYOrnZphOAqjT4sStNrCJsx7vnTttfVVJyyqNPTbGPZ16a6BIUiknfyWz7NynvJFeV3Et4JbrYaCHqfMtnWWs+MvTKguBSXU8SItR4cvEwTE5CJtRr/hSgxPmNSGMwycZ30p4IAtRUrQ+BpfwFJ8bWFuLV7tsveBdoyUn+CgYc1o8cxWVAIaDOOZO5dummk5rTrYpU3aHJbGop+zoORLd6wurt7QqU5bxFGUATPrUybqCgDtkBfL+6VPOrqOHVHXvfG2gFhXhZOiHoCRfFTPx933aTz0LSx5mjkmzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q1NdlfW+n+NvqOWiwuEbxwd5QJzbkIF50BaD3uGfNAI=;
 b=C3WWbsKYYjcU2VTQBWFqpY2JZt6maFGra2PTFLauyu6rLD3ZaqW5PWRrAjWO7wpKt/M6tPi9qh/PFsRyN+IWc4AQBCgAI2Dz21ONuHOdV0h8Tbnop69sAl13zyasAmU1rfTp9OfDN91MeRYgd3Lqh2EGnSh6JXVnZoVZFGY4Gh0tuaiKUv1MHkzM9eRENrAaV7qxwsci0QZORkJVj4823MK0HKtpH0H+p3LCPxCH3FyHxy/dguBfEMJMmzhRFNk8S7jO6oHizkuZmzZesv8LLU3nNFu9b/3xQACzjJVIzCqtQBimnnynFtxzJAtciXsq3Gk03Skl4/jwE1pz3hUNFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1NdlfW+n+NvqOWiwuEbxwd5QJzbkIF50BaD3uGfNAI=;
 b=UpAHYum17V1clFP5E+eeyVyMtEdcvbJZs73HeEnvK7f3dIigLbgon6YZsSYPpt0AEyql2wxUxPkDS0vDJHsrghDXuPL8bKKWF9YxFGL8G7cPQVcgvMr81cxbBsLObwyehsDuzVwFs5S3og6vdbkTof6gIoUO+Hn34dPlGBJm0gdmqXK4FNdUZi8marCbXYBtmNezsdBBennBDkhuDYEn98BYrU4gMaz2QuNnbCB9SsZtH532IQ6ASBBrBhwDPVkpAydx4kcpVSG9jcjTqu3dvIOaR/6XlrQ8AFI3c4Nbm+e6Vj0ZoYraiTj1S+FRJVA1DKGP1IPWxAueMa+22/n8jQ==
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:420::16)
 by GV1PR10MB7980.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:81::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 06:12:08 +0000
Received: from AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008]) by AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a905:57e5:8858:d008%5]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 06:12:08 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Joshua Watt <jpewhacker@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [RFC PATCH] create-spdx-image-3.0: create image sbom recursively
Thread-Topic: [RFC PATCH] create-spdx-image-3.0: create image sbom recursively
Thread-Index: AQHc+AXpzuAbiqRcJEG6JsTWxHc7K7Y2zXuAgAB/wCA=
Date: Wed, 10 Jun 2026 06:12:08 +0000
Message-ID: 
 <AS8PR10MB50738A4D4251F1ACB04734BBFD1A2@AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM>
References: <20260609114814.197318-1-peter.marko@siemens.com>
 <CAJdd5GYi75YE9sqHY4ZO7FjPFApC1tv9zdjQLzryf2jQj9Hxrw@mail.gmail.com>
In-Reply-To: 
 <CAJdd5GYi75YE9sqHY4ZO7FjPFApC1tv9zdjQLzryf2jQj9Hxrw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=e2a2afc6-2b59-43a0-94e9-0dca0dac85b9;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-06-10T06:01:54Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB5073:EE_|GV1PR10MB7980:EE_
x-ms-office365-filtering-correlation-id: 254be772-05d7-4523-2f95-08dec6b733c0
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|38070700021|18002099003|22082099003|55112099003|11063799006|56012099006|4143699003;
x-microsoft-antispam-message-info: 
 +ftNGe7YlcS4FYTNywX41smo4tqFXLUSVP+OL8OZ5Ul2PnGDBdq3s88CxhIEu37I0/SgntSUZsyhCSWRA2D1Ht5lVvToCXgL204nJKHZ6HsVqCCiuL9cBGoC1+CDfS7h4gV31MreMVaEif5NQHLWMqrjY7Gv/Rcfakbne1A1dCiAlWV5NCmhJbk6cClxeb7CW2JZ8A+GvzGk7psN9H3ZBCeUsEQF2GByyuyVrOeWych97YCoivOwugvXfZ7xD9kbjyVkfYq2UdLiM6bFBIx7w4DJ0umfXcU41C/py4I8gVyYyaFWRVqq7nsRVrOc2tFmgmjMY5yMkqyiCGb7KHhgbxpLj7yEyG+hm1MRnAALhEHNPUI+H6GBTUxUEwk6rGh+XDspBe6C+0WJ9yWBptfb39Om7ZFNyMf6GKwUz9Gy/7kRJrXcp/AK9KSHbKsp1MFzpf6OM8iiIQbu2VaAOprSnXxnfrY7NA9XGOssv6kK9Nr7Yxox3lJWdO/4j6aPg5idSHhWVNPLrTynbFM2vkBCXLM6JRpNPhhKj1JJQVKOCJpGP4FIbmdodSjEGqO2g10zAZnYf8hCtX3Q3HzusH6Z3hyCypZWAMjMUwFtB2IjRHjo9fc33oZiqp/iZQ05e8zdjjn20KbOxtGx0Mgj7UCDRFhMQCyNs3VJ1ISZeZbqXIS7B1en5d10Woiv8mhb578+19fyMMpPsIyu/S1k0MXeO330A1eAhTLCkxtB12jV8moNJowN2b70wed3VyWUapVz
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(38070700021)(18002099003)(22082099003)(55112099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ckZSbysxNzBPMllXazFrRWp2YS9SeHI3N0pnNzJka0Q3WjdIOGVZdDZOU3lH?=
 =?utf-8?B?bVFEeDVMcldmZ1Y1R3ZmZ0xVVVhzbm12TWNQbVd5K05WM1NZNHhKRkZkSEVO?=
 =?utf-8?B?S2F2Ri9kMGY3RzdYN3FTSTZkMG9Da2I3M1VoNE1LWHQ5eTYyS3VYT3l5OFNU?=
 =?utf-8?B?ci9PRzlpOENsYk1McDdiQmVhRmhxSXp0bFNKYlFMZk44SmxHd3ZHckdhQzJi?=
 =?utf-8?B?Vkx5TkxHSmtwWXRSTE9ONVBocnpMY0U2a0Q3dUpYZVdaMUFFYjVMM1lDcURv?=
 =?utf-8?B?VzRtaEFTTVJ0VzhOeDIwMGhSTVhwc1VwV3g4eDJ4WTE3UG81ZXUwV3R4U1N5?=
 =?utf-8?B?bXlOem90UnpObUdvaXNMcDd2b2JxQks2YWZpMUNySk0zeHFTK2tLd3Q3S2pR?=
 =?utf-8?B?TGtvVzhzcHB4REpQeUNLR29Ec3VMUmRtM3dOMXdRRWsxK1lOUzFTY1Q4MXNq?=
 =?utf-8?B?WlU5RW9ZRHkrSG84V09jTnd5K2FVTFMzTGV6eHdGRWVBR2dWNEFaZHMxZUZo?=
 =?utf-8?B?ZGFobnc3R3pYM1EzWTBtbG5HOUZpTHl2TVRMOHU5Yk5kVWllaEZoajcwQ09K?=
 =?utf-8?B?TXQ3VW9vVnBlbHdDL3MvVzdyVVYrbVI4eXhOMVRaa2wraVdJdnhMaTZ4RTE3?=
 =?utf-8?B?WU0xSUx1VG1WSlVlS0p2NjVUZ0NFZ2VrcVNOcWh6OTNuTks4RDcrcHpaV1VR?=
 =?utf-8?B?MVBXblFGZ3BGYjhxUlc5bmNodVFTaGxuWS9XSkR5ZkRpVDRNSnh1NzdQUzU2?=
 =?utf-8?B?TUs1TmczQlpxM0o2dGZzS0N2RTJnbitaYk9PZ1RGdkU1VUtjNGZ3SWVudVFC?=
 =?utf-8?B?UytzQkUzWnJNbjd2dDdJbWptNm5nQU8xRXRxTjhaeVk5MEdUeHVMdHpkN0xQ?=
 =?utf-8?B?MTVQejROZ1JUa3VNYVdiZkZZdWxJZUxCMHMwaWl6RnVnS3NkUDhGVWVvOWRj?=
 =?utf-8?B?U2I2U2wzdGxsYjZuMnRKdTRMU2dEZjZPY0dBWE1EaGEyV3JNYWs1VTVPSHpa?=
 =?utf-8?B?NWEvdGp0YjY2S3VOeEM0WXZyZ202OTE0ZFlPdEExajJ6alVxR0ZQb0I1M0RK?=
 =?utf-8?B?dWtFZzNtOFJxQjJSc0JORWVUNzhDYWkwRHJ0aktPKzBDNnJLdERKYzVQMkdX?=
 =?utf-8?B?T1VVQ0ZJTlpFNzJFMU9GWU9Bemt0Zml5UFF6cDRPTVZRTWgvUzRDR3ZtWTAw?=
 =?utf-8?B?RnN6bWF6VThNcFRwaksvQUVuZlZUVkJUNHdwK2hxcFA2RnV1UnYrTXFzTTBG?=
 =?utf-8?B?UzNycWpJMzVMMjFQUmo1U1ppRjkvYkxSbFFDSHJGaG5OYlZDN3g0S3hhcFRt?=
 =?utf-8?B?Q29WRXdrOTFMQ0hiZkRHT3FZamIydDVzcGZCYm5EQVdnZHJJNUE5UEFsdUJL?=
 =?utf-8?B?bXVYS0hORTFFRUwrY0YrNG15aHY4ZWhDMWVzWDFXbzgyTW9NazVBSDFKRU45?=
 =?utf-8?B?MzQ1R0VjazNBdXVzNzZyOHhWaUVNYS8wMzhMRG15TFRLbXRHZXNHQ1dRc3Zq?=
 =?utf-8?B?SXVkTUxTWlNXWlpQSXFkZ2pWem9RYjc1U0JYYjhUZDV0c1ZHdUxTWXdDdmxQ?=
 =?utf-8?B?WnlHNlZEaU15bXdZVU5VZ1R4WTBQa3huL1h2ak9SRERRV0lITFl2K0FsbUd5?=
 =?utf-8?B?SUVkV0tWY3BkRENHTDRzKzBUekt1SW5vYTFBU21aNW82M05NN3lDSVZEa2Jq?=
 =?utf-8?B?OE50U25vM0YzeGN1MFBQcS92VnhnUUlZWmVnMHJlbDFZUU44MG9id1hhZVVZ?=
 =?utf-8?B?UUoxRXRNTm9YSHU5NVVYT1pMWUlxbHMwZjRsOE1heHBMZGZDRk9SQkMvU3Iw?=
 =?utf-8?B?RDI4NDRjc1o2MjhYTzdZZVFYaWpYUG95c3ptU1dBYUpKSUdmdG9tbTNPVFN1?=
 =?utf-8?B?WXMreEs3bU02RGNQZ0lDSkMvV1h3aWk1NFBhWFZqV2hyZmhzRHNHKzlVS2Ju?=
 =?utf-8?B?YmcrYWJ5TFBZenBxOXNGTVJ2aXJUYjAvTGNoK090ZEVHWXk1KzEyd09rREV3?=
 =?utf-8?B?ckd6T3o5dWxsd3E1cVRlRUwzT21KS0xFdWFtc2lCa08wdm9vNVFoM0lxWHFs?=
 =?utf-8?B?bjZ5a1BDRzF3RC9zaXdRdytmaGNiNCtVM09WK2tEbVNZdi90bmxiUUFUSUxx?=
 =?utf-8?B?SnVESkpvSWg5RnF0K1J5M1dKWGNSUmVmWTJSbDlWT0FxSS9lRmNhbmNuYjFt?=
 =?utf-8?B?TkpvWW11c1hJT2hwNDNBTUlEUjNqV2U5WEptbytEWXArVStYYjU0ZVhvdWxz?=
 =?utf-8?B?WXVpaXZnNWRBWDhwckIrMGpSWnhLY2VmaHVKTUR3NDgrREkzdXNzR1lkRkdt?=
 =?utf-8?B?TmJIYjJuOGJpd3RCUFJRYkpFWnBCYk5COURCbkpLNlUzWERZMHpxQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB5073.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 254be772-05d7-4523-2f95-08dec6b733c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2026 06:12:08.2577
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qaDbSUgbaTyRPc6xvqLyuCWOuZCJ9WInmWQZ6macQm2/NDI0MuML0ChPoQLC32qg5zZ2lgCo+hYyyPujKYz+uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB7980
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 06:12:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238313

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSm9zaHVhIFdhdHQgPGpw
ZXdoYWNrZXJAZ21haWwuY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIEp1bmUgMTAsIDIwMjYgMTI6
MjUgQU0NCj4gVG86IE1hcmtvLCBQZXRlciAoRlQgRCBFVSBTSyBCRlMxKSA8UGV0ZXIuTWFya29A
c2llbWVucy5jb20+DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnDQo+IFN1YmplY3Q6IFJlOiBbUkZDIFBBVENIXSBjcmVhdGUtc3BkeC1pbWFnZS0zLjA6IGNy
ZWF0ZSBpbWFnZSBzYm9tIHJlY3Vyc2l2ZWx5DQo+IA0KPiBJIGJlbGlldmUgdGhpcyBpcyB1bm5l
Y2Vzc2FyeSBub3cgd2l0aCB0aGUgcGF0Y2ggc2V0IEkganVzdCBwdWJsaXNoZWQNCj4gdGhhdCBh
bGxvd3MgU1BEWCBkb2N1bWVudHMgdG8gYmUgYWdncmVnYXRlZCBhY3Jvc3MgImRlcGxveSIgdGFz
a3MNCj4gKGUuZy4gZG9fZGVwbG95LCBkb19pbWFnZV9jb21wbGV0ZSkuDQoNClVuZm9ydHVuYXRl
bHksIHRoYXQncyBhIGJpZyBmZWF0dXJlIGFuZCBhcyBzdWNoIG1vc3QgcHJvYmFibHkgZG9lc24n
dCBsYW5kIGluIHNjYXJ0aGdhcC93cnlub3NlLg0KSSBndWVzcyBJJ2xsIGhhdmUgdG8gYWRkIGEg
ZGVwZW5kZW5jeSBpbiBvdXIgcHJvZHVjdCBsYXllciB1bnRpbCB3ZSBjYW4gdXBncmFkZSB0byBz
b21ldGhpbmcgbmV3ZXIuDQoNCj4gDQo+IE9uIFR1ZSwgSnVuIDksIDIwMjYgYXQgNTo0OOKAr0FN
IFBldGVyIE1hcmtvIDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBG
cm9tOiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2llbWVucy5jb20+DQo+ID4NCj4gPiBJbmNs
dWRpbmcgaW1hZ2UgaW4gYW5vdGhlciBpbWFnZSBpcyBiZWluZyBkb25lIGJ5IGRlcGVuZGluZyBv
bg0KPiA+IGRvX2ltYWdlX2NvbXBsZXRlLiBUaGlzIGhvd2V2ZXIgZG9lcyBub3QgaW5jbHVkZSBT
UERYIFNCT00uDQo+ID4gV2Ugc2hvdWxkIG5vdCBuZWVkIHNlY29uZCBiaXRiYWtlIGV4ZWN1dGlv
biB0byBjcmVhdGUgaXQuDQo+ID4NCj4gPiBSZWN1cnNpdmVseSBhZGQgZG9fY3JlYXRlX2ltYWdl
X3Nib21fc3BkeCB0byBkb19idWlsZCB0byByZXNvbHZlIGl0Lg0KPiA+DQo+ID4gVXNlLWNhc2Ug
YXJlIGUuZy4gZml0aW1hZ2Ugb3IgbXVsdGljb25maWcgY29udGFpbmVycy4NCj4gPg0KPiA+IFNp
Z25lZC1vZmYtYnk6IFBldGVyIE1hcmtvIDxwZXRlci5tYXJrb0BzaWVtZW5zLmNvbT4NCj4gPiAt
LS0NCj4gPiAgbWV0YS9jbGFzc2VzLXJlY2lwZS9jcmVhdGUtc3BkeC1pbWFnZS0zLjAuYmJjbGFz
cyB8IDEgKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS9tZXRhL2NsYXNzZXMtcmVjaXBlL2NyZWF0ZS1zcGR4LWltYWdlLTMuMC5iYmNs
YXNzIGIvbWV0YS9jbGFzc2VzLQ0KPiByZWNpcGUvY3JlYXRlLXNwZHgtaW1hZ2UtMy4wLmJiY2xh
c3MNCj4gPiBpbmRleCAxNWE5MWU5MGUyLi40ZDZhNjQyNGZlIDEwMDY0NA0KPiA+IC0tLSBhL21l
dGEvY2xhc3Nlcy1yZWNpcGUvY3JlYXRlLXNwZHgtaW1hZ2UtMy4wLmJiY2xhc3MNCj4gPiArKysg
Yi9tZXRhL2NsYXNzZXMtcmVjaXBlL2NyZWF0ZS1zcGR4LWltYWdlLTMuMC5iYmNsYXNzDQo+ID4g
QEAgLTc4LDYgKzc4LDcgQEAgZG9fY3JlYXRlX2ltYWdlX3Nib21fc3BkeFtzdGFtcC1leHRyYS1p
bmZvXSA9DQo+ICIke01BQ0hJTkVfQVJDSH0iDQo+ID4gIGRvX2NyZWF0ZV9pbWFnZV9zYm9tX3Nw
ZHhbY2xlYW5kaXJzXSA9ICIke1NQRFhJTUFHRURFUExPWURJUn0iDQo+ID4gIGRvX2NyZWF0ZV9p
bWFnZV9zYm9tX3NwZHhbcmVjcmRlcHRhc2tdICs9ICJkb19jcmVhdGVfcmVjaXBlX3NwZHgNCj4g
ZG9fY3JlYXRlX3NwZHggZG9fY3JlYXRlX3BhY2thZ2Vfc3BkeCINCj4gPiAgZG9fY3JlYXRlX2lt
YWdlX3Nib21fc3BkeFtmaWxlLWNoZWNrc3Vtc10gKz0gIiR7U1BEWDNfREVQX0ZJTEVTfSINCj4g
PiArZG9fYnVpbGRbcmVjcmRlcHRhc2tdICs9ICJkb19jcmVhdGVfaW1hZ2Vfc2JvbV9zcGR4Ig0K
PiA+DQo+ID4gIHB5dGhvbiBkb19jcmVhdGVfaW1hZ2Vfc2JvbV9zcGR4X3NldHNjZW5lKCkgew0K
PiA+ICAgICAgc3N0YXRlX3NldHNjZW5lKGQpDQo=

