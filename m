Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50791C48BF6
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 17:20:35 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.85])
 by mx.groups.io with SMTP id smtpd.web10.357.1709572833278040000
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Mar 2024 09:20:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=Yqitnnm7;
 spf=pass (domain: axis.com, ip: 40.107.7.85, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gwsZGBcJ0nNiaTWeCxCkWXvjD8goLnZ2J0CT9vrEjjkzbJY92el+8NvwIk+pnAWLc3BzQ33431XN8SaVgMJ3Gs0mnkiSopyrTTQwk9VQW4O49ZRAY6xPcjCJ004a1Xvs4mklbbhFu3dp2wp+KzVa+eLh9E6P49q3YkBIpOsWmK5M68Hn94ZyL4nOvTLiYuugzZTc1PME8bwy28+XySlGfUr5ttHTkDXCZ/Gy1ve/ijym8zbdqgZLRNSxsd7kM4aYHmnD+1Y4fBX2lgb4fLvJch2n0VCZNCiLYWcsq1TpLojnYPgpOmU8W4CkV/r4ZRyG5uYMfxGWXkW6ZbLBwfk1GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/YvtBoCqG5WNeWiZU2YhAUj4XQekgK2B6xIZN58QuSo=;
 b=jrLxgESP6qw/mJwQ3AtQSgI93wtR9Ys8FHwoG/MPgyp9C5egJGeHnoAY7+BaTj7LCm38PrNUmsjsufRgMuH632MFLVTnjX9XLhVrpSSd1c//EUG1wIt+H0muF59eH5oKiZqkAI1AfOMeU0Pt/ooTuBCUTCuaWO4lCdHFHTUuPflrowm93eA6Iemh57w/F/JYgJ4FCda6i2XAjWO5C3/lbfRkRRO/pPLxTpnKwICbnGSXISLMLEEiHDQKOoTTeaCQVtp8D1M9BekN2b6Veod16j3VFZmEflzdQ5zbnT5kPhhK4eKp1+9fZRGXKLSVgJ4Mans+vUVIPC+vxYaTCwYFUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/YvtBoCqG5WNeWiZU2YhAUj4XQekgK2B6xIZN58QuSo=;
 b=Yqitnnm7ujdMzyXwDmuvF+fZmSdiMvr+n3z7SA5ZS5e62VT+Yw4ORFAvDoCmEoPhh3aIus3mIpQUzXJRJHHNYyX4rIPuMZcBou+fDYzZnSmSovE3tXAYPcCnQDZ+2f/kxvq7rX6QXu4mnXCUrd6TFd/PfoJfJwVAyaKeLIkbHJk=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS8PR02MB9532.eurprd02.prod.outlook.com (2603:10a6:20b:5a8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.36; Mon, 4 Mar
 2024 17:20:29 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::fa03:deff:aae:c4d0]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::fa03:deff:aae:c4d0%7]) with mapi id 15.20.7339.035; Mon, 4 Mar 2024
 17:20:29 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/2] kernel-module-dirs.bbclass: Add class
Thread-Topic: [OE-core] [PATCH 1/2] kernel-module-dirs.bbclass: Add class
Thread-Index: AQHabk9tCvx7JQVgD02XIsJAY3UXwrEnxwUQ
Date: Mon, 4 Mar 2024 17:20:29 +0000
Message-ID: 
 <DB5PR02MB102135B3B6930CAC4FF6F0E07EF232@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20240304155732.2267310-1-pkj@axis.com>
 <36f5eae8a011fe6f9472872f3e32689b6a419043.camel@linuxfoundation.org>
In-Reply-To: 
 <36f5eae8a011fe6f9472872f3e32689b6a419043.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS8PR02MB9532:EE_
x-ms-office365-filtering-correlation-id: b63afad1-16ac-4875-9813-08dc3c6f63a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 P6Tp2bQbHrC/pUFKiCI/XLtnVfgzzhmJBSe8XBV3BPwJet+T2a754Gsdu3jwO/wtondXtwgaRdP8BqwPJptAIVKNSK533JO21BbN6950qSKUx4z7NHL7MtVmWIbhsAk15TXDMieADfIHJwXam3IkrvUHBrlBE/Xo2xw7JUX9HCuSipKLvADLPNYams1e2kBBXJw+dw+IDu1zoRzae8YZAxN3UGwWMv3sVHlCWidpKv0OwV3NdqSsow1hLtAKTTry2gcPMdBSzBcqqD88cL8cKWEmTJ6rz8oQ9oy7L8K71CBYrbzULdQ0Vn27DYikieVp7MsHF8FnnOfSDI0Ks12VzJyfLHIDTifz5MOzvJEsHzEsAYL8UAM8TYL7MCWRMtrbrs/sWRViWvXCnSLc1oh4RvSX+0zO/hsKxk1WDNPfI2H2uMJjUSl13a4qvIw0Ih9Id0q7o9ZomDM0gdp214m7aSHVb9Xgi039l3vdV79AorIgPg2EkbGMyPTFc+12dNQ/kdZ7E4ui+9mGMazl2Bp7i6GIkPR7hsbfcMjU4n6NsXr2TDcrqaFlVA0DLOIG/WGCVAf98ft2pKfcPD4VbdiY8LgxD9vbnWLGJ4ZksVuAabFTz3vcQ5qfSBewK1igfoA3gscZIC7f+FRg2Ce1Xg57CVoDtHu2xZRKGa38VUBEVj3V13T3DRYgtDOQbSB2naHYOLcJkJGxWnCWWFd2hHUytV/iNdQqRg0qPSWVfyl4V5I=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?S3ZEcVM1SXBUcjRPVlVKcFhzeWVFeEJuTkFRMWNQM1I5SWRiN0pTOVFhUUJ6?=
 =?utf-8?B?YSs3bEdLVlE3Zzd4YTd3dGhNRWt4MVpGRExyOXRDeVhSdlVwbTJqTWs2MkU4?=
 =?utf-8?B?bDVJYVlXOWtHVWlwRTZ5ZUZ1OVV1YXZRQUdQUEdkR1RDTjRDenhnZ2M0SVNU?=
 =?utf-8?B?cDF2aVRuZ21VbnlreThjZFNKSjVCS1NWMnpwT0gvS0ZwUDY0OUFzKzdKTUFV?=
 =?utf-8?B?WkhQVUw0WkNNV2RSd3JBSTF1aGJ2UWtLWTRBTWxJdThoZWZjODJabFV1RU9p?=
 =?utf-8?B?czFxek1QbnJzbkRoc251TW5WVlB2NFhkOVlZTmdHc0xmZVJOdGRnS29nNjBi?=
 =?utf-8?B?MUxXZHhEZ2hSTENiMkNmVHFOTFBNM2xRem9aVit0UUdPVmZMVFBiSXNCeHdx?=
 =?utf-8?B?WDRUNDFnaklBbmpRdnNhMVNsRkwzSG5ITjdWdm9KZnhZcnBISjNjdlhhVUpJ?=
 =?utf-8?B?V1FHdGtwenFsTHpaUk41TlBRTjliNTZ1dnQxQXVIMDJnZnVhMkhNTGZNNDY5?=
 =?utf-8?B?VnRBVllnenI1VURwaDA5aHBaME9iQmd3N2VaUzRRZFcxcHZPRnVmTDR5dkky?=
 =?utf-8?B?VW8wS0JoVjdqU2RETWZZayttK3N4bTJyYkRDQS9YclZnVE02cmdFNXV1VmNw?=
 =?utf-8?B?c0o3K0tOSFR4eWZlV2xvbVF6R0hnMWU2a3NJYnZYU29VaUo2ZUVKYVVhczZq?=
 =?utf-8?B?amQyeFd1UFlPZ09sdGV6SGV6RUc3ZGp5cW1rMGJPSzZtd2VYTUNqQURKcVlh?=
 =?utf-8?B?QTRaaTdRQkFZZXFsVk9ZRW5hU0RrZFpnTm5maFR6NTNBYzJPbUV3OHhIanRs?=
 =?utf-8?B?S2FYNE1PKzVVWEhGUjhDdmVWUjFxV2VGRUFRcDB3ZTBpNkNMdXpSSzBFbmV3?=
 =?utf-8?B?Q2lpZUk0akZtaWk0TkZIZkl1N0k1T2psYVU3cDFWR3FLclk1Z0swdjNQUzM0?=
 =?utf-8?B?OUVYM2syTldoOUhoVjBmbEpjRHRGc1pMTTdEUWdWWjc4dDk3VEgvYW5qMDA5?=
 =?utf-8?B?enF5Vm1LaDlYeTNMMmg3NDI5NmxYdE5laUtKVnY4eFlNeExYT3Jya0ZzMjYy?=
 =?utf-8?B?U2dPRjkwVlR2ZmYyOWxmTCs1V2NFcjRSdXg1cEZpMU9vaFlicmFacXNPZ3Bh?=
 =?utf-8?B?ZWFrcEdJWVZKZC9tNVlDTW95YVJ4YXNEMHJnMlI2cmdBdWVtbWtMdDVWcGZl?=
 =?utf-8?B?WGg1bzdqa3FoTzNKeEowUkNTVE9LdGhuRXloaUhsbTdPY1V4TndxRU1qSDJq?=
 =?utf-8?B?WFM3cnZLSFNFZVJCemNhYk5JaEhxMmpvSjRlMWZtUWFhYjl3QXBjMGM1QkJM?=
 =?utf-8?B?UWVhYzMwU0tEYXhXR0pvSzBNc29EVG5IcGdRTkZ4aDdtM1NOc2pza0k1eTV4?=
 =?utf-8?B?Nzd6dkFnRHI4aU03TU5ndUc2NHdpSGc2blFDejhtNWNIRkh6QWdhSHRxMmJh?=
 =?utf-8?B?bjluT3dBaEVXUWZ6d0IxdHRhaTBnYzZwNlJKSk9lVWo1MEE2a1Qrb01GTzlE?=
 =?utf-8?B?UHhrZ3Z2dHJTMzFlaFpFTHNvWUZJNFowY0ljT2h1THMzRXBwRmNqRkY5cFhr?=
 =?utf-8?B?TkdjY3NTOFhBN21jUXhZMnJaTk1aT3FaQU5kWUxLaDQrU2Y3KytIRVVjSWhN?=
 =?utf-8?B?OXpoYkkzQ241WmhKcUNzTmJvaW84VWxzaVY3ckNhZ2hqVm95dXlTQ1p3djJ5?=
 =?utf-8?B?eFh3azdVdFNYMXd5ZnR0WlFpTnZzV0locHVtNVBwci8vd2xraC9sSmNwMXVO?=
 =?utf-8?B?QjFCbkhuTlpZdk51eW5vS1BBWXp6YzluS3YwcE8vdnhCUVo3Q05CUnNkc3dz?=
 =?utf-8?B?RUJ1VFBIb3BKRW1sdll3UXRYZTdLc3ZHbnp3d3g5dnluK0M3WjBKWVJ1aFBp?=
 =?utf-8?B?WHRMaExGb2xLUUJCRU1uZThpOHp3M3BoenEyRk5mMnZlM0RLOWlrWDc1cVNL?=
 =?utf-8?B?UU42VVNtU3N3YkRaemo4MVFDdk0xS3RPTVpPZm1YN3N5VStqMVpJb00ya0Z0?=
 =?utf-8?B?NXluK3FvdURWZGxqQkFMU0FRcXlXQmNjQ1FuZkpSdE5vZ3ZwU2d1U2RtM3lX?=
 =?utf-8?B?dS9QbnRDbkxzdTAyL0NKaWgyY2x6OWtOYXNab2hpc3IxL1lFNWNNVmFwYXlF?=
 =?utf-8?Q?CHRc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b63afad1-16ac-4875-9813-08dc3c6f63a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2024 17:20:29.0733
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: whxoxkLs2A2Ut/HAAHuxbS/35sitzm89DFnf9mYO7djr4vjQY7ip3SHNlpLEKI7m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB9532
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 17:20:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196614

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogZGVuIDQgbWFycyAyMDI0
IDE3OjE3DQo+IFRvOiBQZXRlciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlz
LmNvbT47IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVj
dDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggMS8yXSBrZXJuZWwtbW9kdWxlLWRpcnMuYmJjbGFzczog
QWRkIGNsYXNzDQo+IA0KPiBPbiBNb24sIDIwMjQtMDMtMDQgYXQgMTY6NTcgKzAxMDAsIFBldGVy
IEtqZWxsZXJzdGVkdCB3cm90ZToNCj4gPiBTcGxpdCBvdXQgdGhlIHR3byB2YXJpYWJsZXMgbW9k
dWxlc2xvYWRkaXIgYW5kIG1vZHByb2JlZGlyIGZyb20NCj4gPiBrZXJuZWwtbW9kdWxlLXNwbGl0
LmJiY2xhc3MgYXMgdGhleSBjYW4gYmUgdXNlZnVsIHRvIG90aGVyIHJlY2lwZXMgdGhhbg0KPiA+
IGtlcm5lbCBtb2R1bGUgcmVjaXBlcy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBldGVyIEtq
ZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPg0KPiA+IC0tLQ0KPiA+IMKg
bWV0YS9jbGFzc2VzLXJlY2lwZS9rZXJuZWwtbW9kdWxlLWRpcnMuYmJjbGFzcyB8IDggKysrKysr
KysNCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykNCj4gPiDCoGNyZWF0ZSBt
b2RlIDEwMDY0NCBtZXRhL2NsYXNzZXMtcmVjaXBlL2tlcm5lbC1tb2R1bGUtZGlycy5iYmNsYXNz
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9jbGFzc2VzLXJlY2lwZS9rZXJuZWwtbW9kdWxl
LWRpcnMuYmJjbGFzcyBiL21ldGEvY2xhc3Nlcy1yZWNpcGUva2VybmVsLW1vZHVsZS1kaXJzLmJi
Y2xhc3MNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAuLmVl
Y2MzNmFiNTINCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvbWV0YS9jbGFzc2VzLXJlY2lw
ZS9rZXJuZWwtbW9kdWxlLWRpcnMuYmJjbGFzcw0KPiA+IEBAIC0wLDAgKzEsOCBAQA0KPiA+ICsj
DQo+ID4gKyMgQ29weXJpZ2h0IE9wZW5FbWJlZGRlZCBDb250cmlidXRvcnMNCj4gPiArIw0KPiA+
ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQNCj4gPiArIw0KPiA+ICsNCj4gPiArbW9k
dWxlc2xvYWRkaXIgPz89ICIke0BiYi51dGlscy5jb250YWlucygnRElTVFJPX0ZFQVRVUkVTJywg
J3N5c3RlbWQnLCAnJHtub25hcmNoX2xpYmRpcn0nLCAnJHtzeXNjb25mZGlyfScsIGQpfS9tb2R1
bGVzLWxvYWQuZCINCj4gPiArbW9kcHJvYmVkaXIgPz89ICIke0BiYi51dGlscy5jb250YWlucygn
RElTVFJPX0ZFQVRVUkVTJywgJ3N5c3RlbWQnLCAnJHtub25hcmNoX2Jhc2VfbGliZGlyfScsICck
e3N5c2NvbmZkaXJ9JywgZCl9L21vZHByb2JlLmQiDQo+IA0KPiBBYnNvbHV0ZWx5IG5vdC4gV2Ug
YXJlIG5vdCBoYXZpbmcgeWV0IG1vcmUga2VybmVsIGNsYXNzZXMganVzdCBmb3IgdHdvDQo+IHZh
cmlhYmxlcy4NCg0KT2suIEkgY29uc2lkZXJlZCBhZGRpbmcgdGhlbSB0byBiaXRiYWtlLmNvbmYg
d2hlcmUgYWxsIG90aGVyIHNpbWlsYXIgKmRpciANCnZhcmlhYmxlcyBhcmUgZGVmaW5lZCwgYnV0
IEkgb3B0ZWQgZm9yIGEgYmJjbGFzcyBzaW5jZSBJIGV4cGVjdCBpdCB0byBvbmx5IA0KYmUgcmVs
YXRpdmVseSBmZXcgcmVjaXBlcyB0aGF0IG5lZWQgZWl0aGVyIG9mIHRoZW0gKHdlIGN1cnJlbnRs
eSBoYXZlIH4xMCANCm5vbi1tb2R1bGUgcmVjaXBlcyB0aGF0IGNvdWxkIHVzZSB0aGVtKS4NCg0K
PiANCj4gVGhlcmUgaXMgcHJvYmFibHkgYSBiZXR0ZXIgd2F5IG1vdmluZyBzb21lIGRlZmluaXRp
b25zIHRvIGEgbmV3IGNvbmYNCj4gZmlsZSBmb3IgdGhlIGtlcm5lbCBpbiBnZW5lcmFsLg0KDQpJ
IGFtIG5vdCBzdXJlIHdoYXQgdG8gbWFrZSBvZiB0aGlzLiBXaGF0IEkgd2FudGVkIHRvIGFjaGll
dmUgd2FzIHRvIGJlIA0KYWJsZSB0byBtYWtlIHRoZSB0d28gcGF0aCB2YXJpYWJsZXMgYXZhaWxh
YmxlIHRvIG5vbi1tb2R1bGUgcmVjaXBlcy4gSSBhbSANCm5vdCBzdXJlIGhvdyB0aGF0IG1hdGNo
ZXMgd2hhdCB5b3UgbWVhbnQgd2l0aCAiYSBuZXcgY29uZiBmaWxlIGZvciB0aGUgDQprZXJuZWwi
LiBEaWQgeW91IGFjdHVhbGx5IG1lYW4gYSAuY29uZiBmaWxlIHdoZXJlIHRoZSB2YXJpYWJsZXMg
d291bGQgYmUgDQphZGRlZCB0byB0aGUgZ2xvYmFsIHN0YXRlLCBvciBkaWQgeW91IG1lYW4gYSAu
YmJjbGFzcy8uaW5jIGZpbGUgc2ltaWxhciB0byANCnRoZSBvbmUgSSBwcm9wb3NlZCwgYnV0IHdp
dGggYSBtb3JlIGdlbmVyaWMgbmFtZSBzbyB0aGF0IGl0IGNhbiB0YWtlIG90aGVyIA0KdmFyaWFi
bGVzIHRoYW4ganVzdCB0aGUgdHdvIHBhdGggdmFyaWFibGVzIGFib3ZlPw0KDQo+IA0KPiBDaGVl
cnMsDQo+IA0KPiBSaWNoYXJkDQoNCi8vUGV0ZXINCg0K

