Return-Path: <alban.bedel@aerq.com>
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr130094.outbound.protection.outlook.com [40.107.13.94])
	by mail.openembedded.org (Postfix) with ESMTP id C34857F343
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 09:33:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=L5TS95LllCJ1C2wlJkkxrA6Hc8ET/CXK6KPjYXbyg3qTeAVzrn9AvWX+PeXHh7Q77U/xnFf6PdhYbR3rN+6J9WoC7+0+i53SoTAz7XUlA3i8TS2++7Jc1X9VktOwwYlbIr6wnUj8GzQT98XUwibpT9+wGlrs9yet4NYMjBCFZSx2CmqkKEDzP58+hK+ocUiiU07tpqtuSsjWbXnElY/lm/MMskIc7auMy/BJyWxuwUQqZ/LmK3lzTZQIbSTWEz+/oT5R3XF6lFxWNAm6G05WoEjX/KKMrtwgAJizk2yo6Ka2CDRN5VG8l5J1kPNKSqhrbxTxptiwVBucxh+U02WXEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=KKilkw6yj1cEMlh+xzjW8Qp7gHp1Dq1sJcZXHQ/ZDDA=;
	b=Rh2tXQPLKQAr90Ejzp3mcCLmgt7+w/U7/cdxcPK78BkphXCEzay+nyJd+cs31yg8CAQGlqYWuIDMREGLrrJeJLholoOtmUsC8dpcvD8SynmFqPSE5R2Fhw6JOJu7YsddV3JMH/7F2iPi5RdQhPp7rKPeGoZC+ymmnP93qniWJoVyXkl11ul6SqZj+eqGNDFxmNg6YVbUvOIqHSCGNjKrtU4rqrstLyLvs5Krt+bO323sMFDRslvAl63hh+jaZwh0TlymC7qQD4QNmPpnpgxRQowA0i4bsld6GB6CmXZpVb0OT4UP+duq2Y0zN4mHb95C83v/lV8uxx3BB5Ex7FHPHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=aerq.com; dmarc=pass action=none header.from=aerq.com;
	dkim=pass header.d=aerq.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=l2task.onmicrosoft.com; s=selector1-l2task-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=KKilkw6yj1cEMlh+xzjW8Qp7gHp1Dq1sJcZXHQ/ZDDA=;
	b=bNssRZrzvm0doR4cC8HDBaiyNNOrQhO0818rkfcjnnFa5OpK5kLdD5pA9iPGbJ0hDD3e4NrMSBUjmx1IvHhQVx4yOxCI/u0KIklcmd/SQ1UdBtR3kH9tvUn6GrYzw1jm3+SfCh41sQmjNAwxBHlTgFL1HtZQr28WGVnnjt651hI=
Received: from AM6PR10MB2038.EURPRD10.PROD.OUTLOOK.COM (52.134.115.151) by
	AM6PR10MB2934.EURPRD10.PROD.OUTLOOK.COM (10.255.123.148) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2220.18; Tue, 3 Sep 2019 09:33:19 +0000
Received: from AM6PR10MB2038.EURPRD10.PROD.OUTLOOK.COM
	([fe80::2027:a3c5:37ac:1be8]) by
	AM6PR10MB2038.EURPRD10.PROD.OUTLOOK.COM
	([fe80::2027:a3c5:37ac:1be8%3]) with mapi id 15.20.2220.022;
	Tue, 3 Sep 2019 09:33:19 +0000
From: "Bedel, Alban" <alban.bedel@aerq.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "fabio.berton@ossystems.com.br"
	<fabio.berton@ossystems.com.br>
Thread-Topic: [OE-Core][warrior][PATCH] rng-tools: start rngd early in the
	boot process again
Thread-Index: AQHVWdFUo4IZBUiutkSwQuhY1EbByKcI76sAgBDR7gA=
Date: Tue, 3 Sep 2019 09:33:19 +0000
Message-ID: <02fede906ba48e431ff06c5d76b93c9a54bec643.camel@aerq.com>
References: <20190823163906.20144-1-fabio.berton@ossystems.com.br>
	<CAAPZna0V6aj9C5Zoeo3dQuSc-P-GGNuQ2cd5euqjQsRBi_sZ+g@mail.gmail.com>
In-Reply-To: <CAAPZna0V6aj9C5Zoeo3dQuSc-P-GGNuQ2cd5euqjQsRBi_sZ+g@mail.gmail.com>
Accept-Language: en-DE, de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=alban.bedel@aerq.com; 
x-originating-ip: [213.61.153.180]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 88e4117e-64c0-48fb-84bc-08d73051c1e2
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(7168020)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:AM6PR10MB2934; 
x-ms-traffictypediagnostic: AM6PR10MB2934:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM6PR10MB29345889B7B5778DAC24810A96B90@AM6PR10MB2934.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(366004)(396003)(376002)(39840400004)(346002)(189003)(199004)(53546011)(446003)(6506007)(508600001)(71200400001)(186003)(26005)(11346002)(2616005)(36756003)(6436002)(8936002)(14454004)(102836004)(55236004)(99286004)(25786009)(6306002)(6512007)(6246003)(53936002)(476003)(486006)(71190400001)(2906002)(86362001)(6486002)(76116006)(5660300002)(14444005)(76176011)(256004)(8676002)(66066001)(229853002)(66946007)(64756008)(91956017)(66446008)(66556008)(66476007)(305945005)(81156014)(81166006)(118296001)(316002)(966005)(110136005)(7736002)(2501003)(6116002)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR10MB2934;
	H:AM6PR10MB2038.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: aerq.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RqfAPOjUlHcxXFK5kMzyw4CaMIrNYQI9Uya3UoryE5nxltlUkupMFsV/mlSOFzHrnrH9FZZNK+2BeYm4AFIx73Jp1YL0slx6c9PN4OSaQaXdn+giMqEvWANX59+eeJKNvizA7P0Z+2YrEhrP4ktR+1rIC+h9P8c9E+IuZIZs+N/B9TAQZOY7S6qPyYHRhKaTeYaJrPhCxPLVAR5wjrn0TFHDZi6nGq9Nne/l97xzpBheC33yKKZ8oy9wyZBgm66gsySTIPMJ4XyOp+0tXj9DSYUNOxE9Ocuq5sYCgMJMNcv1gpFTrTtY//MQoTePs+Vx6/GGecjcmfQWOGTyvXJALGi8pETuaz5yPH1zMjsWaV0yUL0Zqj4/4jd+rLbGu5VxFPjDSN0Syfv0hw2+tcZNhZaHlOaXK320SnlTwidTK4k=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: aerq.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88e4117e-64c0-48fb-84bc-08d73051c1e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 09:33:19.8237 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bf24ff3e-ad0a-4c79-a44a-df7092489e22
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1tIm5s8QZepOlwoJYowEO5r+coBMr+3vAOjBxT1Z/8VLtBkESPejFCT2PCTJcakV48J53Js+debHSxgcNNlnWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2934
Subject: Re: [warrior][PATCH] rng-tools: start rngd early in the boot process again
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Sep 2019 09:33:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC69BB03B8D49147820258116CAB82A2@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDE5LTA4LTIzIGF0IDEzOjQxIC0wMzAwLCBGYWJpbyBCZXJ0b24gd3JvdGU6DQoN
Cj4gV2l0aG91dCB0aGlzIGNoYW5nZSwgaW1hZ2VzIHdpdGggc3lzdGVtZCBoYW5nIG9uIHNodXRk
b3duL3JlYm9vdC4NCg0KSSBhbHJlYWR5IHN1Ym1pdHRlZCBhIHBhdGNoWzFdIHRvIGZpeCB0aGlz
IHdoaWNoIGlzIGN1cnJlbnRseSB1bmRlcg0KcmV2aWV3LiBJdCBpcyB0aGUgdmVyeSBzYW1lIHBh
dGNoIHdpdGggYSBzbGlnaHRseSBkaWZmZXJlbnQgbG9nDQptZXNzYWdlIGFzIHRoZSBjaGFuZ2Vz
IGZyb20gY29tbWl0IGVkZjc2MDY4MjIgKHJuZy10b29sczogZml4IHJuZ2QNCmJsb2NrcyBzeXN0
ZW0gc2h1dGRvd24pIHdhcyBub3QgYXBwbGllZCBvbiB3YXJyaW9yLg0KDQpBbGJhbg0KDQpbMV06
IGh0dHBzOi8vcGF0Y2h3b3JrLm9wZW5lbWJlZGRlZC5vcmcvcGF0Y2gvMTYzNTQwLw0KDQo+IE9u
IEZyaSwgQXVnIDIzLCAyMDE5IGF0IDE6MzkgUE0gRmFiaW8gQmVydG9uDQo+IDxmYWJpby5iZXJ0
b25Ab3NzeXN0ZW1zLmNvbS5icj4gd3JvdGU6DQo+ID4gRnJvbTogIkJlZGVsLCBBbGJhbiIgPGFs
YmFuLmJlZGVsQGFlcnEuY29tPg0KPiA+IA0KPiA+IEl0IGRvIG1ha2Ugc2Vuc2UgdG8gc3RhcnQg
cm5nZCBlYXJseSBpbiB0aGUgYm9vdCBwcm9jZXNzIGJlY2F1c2UNCj4gPiBvdGhlcndpc2Ugd2Ug
d291bGQgbmVlZCB0byB0cmFjayBldmVyeSBzZXJ2aWNlIHRoYXQgbWlnaHQgbmVlZA0KPiA+IGVu
dHJvcHkNCj4gPiBhbmQgZXhwbGljaXRseSBjb25maWd1cmUgaXQgdG8gc3RhcnQgYWZ0ZXIgcm5n
ZC4NCj4gPiANCj4gPiBXaGVuIHVzZWQgd2l0aCBzeXN0ZW1kIHJuZ2QgYmxvY2tlZCB0aGUgc2h1
dGRvd24gcHJvY2VzcyBiZWNhdXNlIGl0DQo+ID4gc2ltcGx5IG1pc3NlZCB0aGUgcHJvcGVyIHVu
aXQgY29uZmlndXJhdGlvbi4gQXMgdGhlIHN5c3RlbWQNCj4gPiBkb2N1bWVudGF0aW9uIGV4cGxh
aW5zLCB3aGVuIHVzaW5nIERlZmF1bHREZXBlbmRlbmNpZXM9bm8gb25lIGFsc28NCj4gPiBoYXZl
IHRvIGV4cGxpY2l0bHkgY29uZmlndXJlIHRoZSB1bml0IHRvIHByb3Blcmx5IHN0b3AgYXQgc29t
ZQ0KPiA+IHBvaW50Lg0KPiA+IFRoaXMgaXMgbm9ybWFseSBhY2hpZXZlZCBieSBoYXZpbmcgQmVm
b3JlPXNodXRkb3duLnRhcmdldCBhbmQNCj4gPiBDb25mbGljdHM9c2h1dGRvd24udGFyZ2V0IHNl
dCBmb3IgdGhlIHVuaXQuDQo+ID4gDQo+ID4gVG8gaGF2ZSBybmdkIHN0YXJ0ZWQgZWFybHkgYWdh
aW4gd2UgcmV2ZXJ0ZSB0aGUgY2hhbmdlcyBkb25lIHRvDQo+ID4gcm5nZC5zZXJ2aWNlIGluIGNv
bW1pdCBlZGY3NjA2ODIyIChybmctdG9vbHM6IGZpeCBybmdkIGJsb2Nrcw0KPiA+IHN5c3RlbQ0K
PiA+IHNodXRkb3duKS4gVG8gaGF2ZSBpdCBwcm9wZXJseSBzdG9wcGVkIG9uIHNodXRkb3duIHdl
IGFsc28gYWRkDQo+ID4gQmVmb3JlPXNodXRkb3duLnRhcmdldCBhbmQgQ29uZmxpY3RzPXNodXRk
b3duLnRhcmdldC4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGJhbiBCZWRlbCA8YWxiYW4u
YmVkZWxAYWVycS5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogUmljaGFyZCBQdXJkaWUgPHJpY2hh
cmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+ID4gKGNoZXJyeSBwaWNrZWQgZnJvbSBj
b21taXQNCj4gPiBhNzRlN2RmMzNlMmM4YWIyMTUyZTMyMTdjMGE1ZGYzZjY1OTcxNzEzKQ0KPiA+
IC0tLQ0KPiA+ICBtZXRhL3JlY2lwZXMtc3VwcG9ydC9ybmctdG9vbHMvcm5nLXRvb2xzL3JuZ2Qu
c2VydmljZSB8IDMgKystDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
cm5nLXRvb2xzL3JuZy10b29scy9ybmdkLnNlcnZpY2UNCj4gPiBiL21ldGEvcmVjaXBlcy1zdXBw
b3J0L3JuZy10b29scy9ybmctdG9vbHMvcm5nZC5zZXJ2aWNlDQo+ID4gaW5kZXggZjAzNTVkYjE0
ZmMuLjVjODI1M2I1ZmJhIDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3Ju
Zy10b29scy9ybmctdG9vbHMvcm5nZC5zZXJ2aWNlDQo+ID4gKysrIGIvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvcm5nLXRvb2xzL3JuZy10b29scy9ybmdkLnNlcnZpY2UNCj4gPiBAQCAtMiw3ICsyLDgg
QEANCj4gPiAgRGVzY3JpcHRpb249SGFyZHdhcmUgUk5HIEVudHJvcHkgR2F0aGVyZXIgRGFlbW9u
DQo+ID4gIERlZmF1bHREZXBlbmRlbmNpZXM9bm8NCj4gPiAgQWZ0ZXI9c3lzdGVtZC11ZGV2LXNl
dHRsZS5zZXJ2aWNlDQo+ID4gLUJlZm9yZT1zeXNpbml0LnRhcmdldA0KPiA+ICtCZWZvcmU9c3lz
aW5pdC50YXJnZXQgc2h1dGRvd24udGFyZ2V0DQo+ID4gK0NvbmZsaWN0cz1zaHV0ZG93bi50YXJn
ZXQNCj4gPiANCj4gPiAgW1NlcnZpY2VdDQo+ID4gIEV4ZWNTdGFydD1AU0JJTkRJUkAvcm5nZCAt
ZiAtciAvZGV2L2h3cm5nDQo+ID4gLS0NCj4gPiAyLjIwLjENCj4gPiANCg==

