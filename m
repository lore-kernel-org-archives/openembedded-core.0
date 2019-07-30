Return-Path: <jlock@vmware.com>
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
	(mail-eopbgr730072.outbound.protection.outlook.com [40.107.73.72])
	by mail.openembedded.org (Postfix) with ESMTP id 5CB4D747E7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 09:58:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=W8aGpyhhdetsm86SmUv49hfpvl/3Uu8UqTVRM/DEDp/UiLdc9iN031CSvnTjzv0FCYK/tdNS3fUGKTV+hmqmgM2dGAW3e+itDbSwgH1HR3Tfx9FHqOFUI2MZPm/aKxGGYlwH0qhyd+FzVI7laq+cOfewZ07ImtM06WiDNEGh1n0Ug1dE91U55fEvG4UlQdHzegQyEel+eqSSBI6AczTJhdTm07e/21dZuL1qEu3h2ZlDA1PqoyHDSEzTHGQgCYPin/HKt37XmVigg+pB9WSynEQv7k0XMFQxBGSWn5cC/Ho4+/rO4TntcvFGA8D68HfLFzcZl1gPYrk0PqP6eOT3ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=mR/+jhkByRok8GW7tFVC+Ck0T0uobUpMVRFwECsiXQI=;
	b=WDVDDO4MNBkKnU/qAkEGToqq2iBHvA3UbzZjX3hAGxbE2R037ojO5TfpAoAVVwbCwOHGAq9UCgDIZQ44mjOdK2dDyKy9QwOolhO3RIcB/G6646VimvqNnFnBb9TxQPudDAmHhWtNepcpAPmOwqwnBbfb+yqYKBm9VZzO+GK6zvZtTRBKvXs1WBTjY/qtGrTgrZr8NYzrtsrjbieL84A9CSpqmemLLT83NZQoYXblgwvtGQUdxPORg0xb4IU+WFgLhN6mC7SWt/h6KvUU2rF0TWxSOK/2YsLaVv7N2QOlA1ed6uZ2RteWjWX4Fr7xrTLICcLZZkjlDnoWoBsK/qIxNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=vmware.com;dmarc=pass action=none
	header.from=vmware.com;dkim=pass header.d=vmware.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=mR/+jhkByRok8GW7tFVC+Ck0T0uobUpMVRFwECsiXQI=;
	b=fYvPs0Swx1oR0vU0OL91RSbuzaadHIZgLjHYnfnnN1SQC4n1Qpd5gK1oyi6jX3gwr+cUdNnf04cS9+0xtEUjkXsyINM7PXLDgQLaYRzj+qEiScWq2RvZH8pcwdggjoqtr5Php93wH1aANFOwMpfYgAOT5bSap3YCWa7d1vuMGEo=
Received: from CO2PR05MB2645.namprd05.prod.outlook.com (10.166.91.154) by
	CO2PR05MB2776.namprd05.prod.outlook.com (10.166.200.134) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2136.9; Tue, 30 Jul 2019 09:58:53 +0000
Received: from CO2PR05MB2645.namprd05.prod.outlook.com
	([fe80::4d14:654a:9769:3f59]) by
	CO2PR05MB2645.namprd05.prod.outlook.com
	([fe80::4d14:654a:9769:3f59%5]) with mapi id 15.20.2136.010;
	Tue, 30 Jul 2019 09:58:53 +0000
From: Joshua Lock <jlock@vmware.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [RFC PATCH 3/3] classes/sstate: regenerate sstate when
	signing enabled
Thread-Index: AQHVQ6UE5rhOJ/uaUky4hHEl4x+jFKbeQF6AgASzIAA=
Date: Tue, 30 Jul 2019 09:58:52 +0000
Message-ID: <B323D536-C024-45BB-9AF3-6C9A9CDD1B71@vmware.com>
References: <cover.1564139487.git.jlock@vmware.com>
	<5c2484a9c2c5dd78f7c4488839a4e2d2929e2c7d.1564139487.git.jlock@vmware.com>
	<35cbc68581c288a2d4066f8205d130061f4acf8a.camel@linuxfoundation.org>
In-Reply-To: <35cbc68581c288a2d4066f8205d130061f4acf8a.camel@linuxfoundation.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=jlock@vmware.com; 
x-originating-ip: [212.140.202.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c04ab3e-a575-47c3-52b3-08d714d48778
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:CO2PR05MB2776; 
x-ms-traffictypediagnostic: CO2PR05MB2776:
x-microsoft-antispam-prvs: <CO2PR05MB27769A00E05F5B59FE4FFC59CEDC0@CO2PR05MB2776.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0114FF88F6
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(366004)(376002)(39860400002)(396003)(346002)(136003)(199004)(189003)(3846002)(6916009)(99286004)(5660300002)(76176011)(25786009)(86362001)(4326008)(53546011)(6506007)(102836004)(8676002)(68736007)(64756008)(8936002)(81156014)(26005)(6512007)(66946007)(66446008)(91956017)(81166006)(186003)(71200400001)(71190400001)(66476007)(66556008)(76116006)(66066001)(6436002)(11346002)(305945005)(476003)(2616005)(486006)(7736002)(6246003)(2906002)(316002)(36756003)(229853002)(6486002)(14454004)(446003)(256004)(14444005)(33656002)(6116002)(478600001)(53936002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CO2PR05MB2776;
	H:CO2PR05MB2645.namprd05.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vmware.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VRqClpQmT9xopWOgSmXTi5/UpzyDfNeUUASCkkQzewvL/runYlaIJywym8AONkyU1nmnjjVUeZuMogzX0a4ohu0lTG52tAxS45dCjVoS1ITcGmkdQTf3tYqxZVWDxpAj7jPAiFm0szIFfWBBsx5iJjldqG6MiURkpzhkyVRCU9FkiXtUkk5gI2ZRiEJOWV+fz/WTN4LEnUw3qCyGLZ84+dKGZ4s2BGw0m6ZWHmtbxScDgrCjuU2I0fB+6kw2jsZZ/xj0a350bID+/Zv3I97QWq/AQwnE88i2TmtTN9/TMEwz23kegSoPIe5Dl0g9dW+QKA9yCuXGxUSPmpyww4q36tuM7o9Y2QVVzUJgCrNX8+F+c6iZRrFE/LJtVPhnxZmUFGe6QDsh9JpblD8gKpTa60qaMiYjTl1UU3PW4QRu4F4=
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c04ab3e-a575-47c3-52b3-08d714d48778
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2019 09:58:52.9648 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jlock@vmware.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO2PR05MB2776
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 3/3] classes/sstate: regenerate sstate when signing enabled
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
X-List-Received-Date: Tue, 30 Jul 2019 09:58:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <BBFE180534C1D9438082E7F73EE47EF5@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64

DQoNCj4gT24gMjcgSnVsIDIwMTksIGF0IDExOjEyLCBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5w
dXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6DQo+IA0KPiBPbiBGcmksIDIwMTktMDct
MjYgYXQgMTE6MjYgKzAwMDAsIEpvc2h1YSBMb2NrIHZpYSBPcGVuZW1iZWRkZWQtY29yZQ0KPiB3
cm90ZToNCj4+IFRoaXMgY2hhbmdlIGVuc3VyZXMgdGhhdCB0aGUgdGFzayBzaWduYXR1cmVzIGNo
YW5nZXMsIGFuZCB0aGVyZWZvcmUNCj4+IHNzdGF0ZSB0YXNrcyBhcmUgcmVydW4sIHdoZW4gc2ln
bmluZyBpcyBlbmFibGVkLiBUaGlzIGhhcyB0aGUNCj4+IHBvc2l0aXZlIG91dGNvbWUgdGhhdCBp
ZiBzaWduaW5nIGlzIGVuYWJsZWQgbmV3IHNpZ25lZCBzaGFyZWQgc3RhdGUNCj4+IG9iamVjdHMg
d2lsbCBiZSBwcm9kdWNlZCwgcmF0aGVyIHRoYW4ganVzdCBzaWduaW5nIHNoYXJlZCBzdGF0ZQ0K
Pj4gb2JqZWN0cyBmb3IgdGFza3Mgd2hlcmUgbm8gd29yayBoYXMgYmVlbiBwZXJmb3JtZWQgeWV0
Lg0KPj4gDQo+PiBUaGUgZG93bnNpZGUgb2YgdGhpcyBjaGFuZ2UgaXMgdGhhdCBlbmFibGluZy9k
aXNhYmxpbmcgc3N0YXRlIG9iamVjdA0KPj4gc2lnbmluZyBhbHRlcnMgdGhlIHRhc2toYXNoIGFu
ZCByZXN1bHRzIGluIHJlYnVpbGRpbmcgdGhlIHdvcmxkLg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5
OiBKb3NodWEgTG9jayA8amxvY2tAdm13YXJlLmNvbT4NCj4+IC0tLQ0KPj4gbWV0YS9jbGFzc2Vz
L3NzdGF0ZS5iYmNsYXNzIHwgMTAgKysrKysrKystLQ0KPj4gbWV0YS9saWIvb2UvZ3BnX3NpZ24u
cHkgICAgIHwgMTAgKysrKysrKysrKw0KPj4gMiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0IGEvbWV0YS9jbGFzc2VzL3Nz
dGF0ZS5iYmNsYXNzDQo+PiBiL21ldGEvY2xhc3Nlcy9zc3RhdGUuYmJjbGFzcw0KPj4gaW5kZXgg
MzM0MmM1ZWY1MC4uYjA2MGUxNTA1MyAxMDA2NDQNCj4+IC0tLSBhL21ldGEvY2xhc3Nlcy9zc3Rh
dGUuYmJjbGFzcw0KPj4gKysrIGIvbWV0YS9jbGFzc2VzL3NzdGF0ZS5iYmNsYXNzDQo+PiBAQCAt
NjU5LDggKzY1OSwxMiBAQCBkZWYgc3N0YXRlX3BhY2thZ2Uoc3MsIGQpOg0KPj4gICAgIGlmIGQu
Z2V0VmFyKCdTU1RBVEVfU0tJUF9DUkVBVElPTicpID09ICcxJzoNCj4+ICAgICAgICAgcmV0dXJu
DQo+PiANCj4+ICsgICAgc3N0YXRlX2NyZWF0ZV9wYWNrYWdlID0gWydzc3RhdGVfcmVwb3J0X3Vu
aWhhc2gnLA0KPj4gJ3NzdGF0ZV9jcmVhdGVfcGFja2FnZSddDQo+PiArICAgIGlmIGQuZ2V0VmFy
KCdTU1RBVEVfU0lHX0tFWScpOg0KPj4gKyAgICAgICAgc3N0YXRlX2NyZWF0ZV9wYWNrYWdlLmFw
cGVuZCgnc3N0YXRlX3NpZ25fcGFja2FnZScpDQo+PiArDQo+PiAgICAgZm9yIGYgaW4gKGQuZ2V0
VmFyKCdTU1RBVEVDUkVBVEVGVU5DUycpIG9yICcnKS5zcGxpdCgpICsgXA0KPj4gLSAgICAgICAg
ICAgICBbJ3NzdGF0ZV9yZXBvcnRfdW5paGFzaCcsICdzc3RhdGVfY3JlYXRlX3BhY2thZ2UnLA0K
Pj4gJ3NzdGF0ZV9zaWduX3BhY2thZ2UnXSArIFwNCj4+ICsgICAgICAgICAgICAgc3N0YXRlX2Ny
ZWF0ZV9wYWNrYWdlICsgXA0KPj4gICAgICAgICAgICAgIChkLmdldFZhcignU1NUQVRFUE9TVENS
RUFURUZVTkNTJykgb3IgJycpLnNwbGl0KCk6DQo+PiAgICAgICAgICMgQWxsIGhvb2tzIHNob3Vs
ZCBydW4gaW4gU1NUQVRFX0JVSUxERElSLg0KPj4gICAgICAgICBiYi5idWlsZC5leGVjX2Z1bmMo
ZiwgZCwgKHNzdGF0ZWJ1aWxkLCkpDQo+PiBAQCAtNzc0LDcgKzc3OCw3IEBAIHNzdGF0ZV9jcmVh
dGVfcGFja2FnZSAoKSB7DQo+PiB9DQo+PiANCj4+IHB5dGhvbiBzc3RhdGVfc2lnbl9wYWNrYWdl
ICgpIHsNCj4+IC0gICAgZnJvbSBvZS5ncGdfc2lnbiBpbXBvcnQgZ2V0X3NpZ25lcg0KPj4gKyAg
ICBmcm9tIG9lLmdwZ19zaWduIGltcG9ydCBnZXRfc2lnbmVyLCBTaWduRmFpbGVkRXJyb3INCj4+
IA0KPj4gICAgIGlmIGQuZ2V0VmFyKCdTU1RBVEVfU0lHX0tFWScpOg0KPj4gICAgICAgICBzaWdu
ZXIgPSBnZXRfc2lnbmVyKGQsICdsb2NhbCcpDQo+PiBAQCAtNzgzLDYgKzc4Nyw4IEBAIHB5dGhv
biBzc3RhdGVfc2lnbl9wYWNrYWdlICgpIHsNCj4+ICAgICAgICAgICAgIG9zLnVubGluayhzc3Rh
dGVfcGtnICsgJy5zaWcnKQ0KPj4gICAgICAgICBzaWduZXIuZGV0YWNoX3NpZ24oc3N0YXRlX3Br
ZywgZC5nZXRWYXIoJ1NTVEFURV9TSUdfS0VZJywNCj4+IEZhbHNlKSwgTm9uZSwNCj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGQuZ2V0VmFyKCdTU1RBVEVfU0lHX1BBU1NQSFJBU0UnKSwN
Cj4+IGFybW9yPUZhbHNlKQ0KPj4gKyAgICBlbHNlOg0KPj4gKyAgICAgICAgcmFpc2UgU2lnbkZh
aWxlZEVycm9yKCJDYW4ndCBzaWduIHNzdGF0ZSBwYWNrYWdlcyB3aXRob3V0DQo+PiBrZXksIFNT
VEFURV9TSUdfS0VZIGVtcHR5IikNCj4+IH0NCj4+IA0KPj4gcHl0aG9uIHNzdGF0ZV9yZXBvcnRf
dW5paGFzaCgpIHsNCj4+IGRpZmYgLS1naXQgYS9tZXRhL2xpYi9vZS9ncGdfc2lnbi5weSBiL21l
dGEvbGliL29lL2dwZ19zaWduLnB5DQo+PiBpbmRleCAyZmQ4YzNiMWFjLi5lYzVhY2UwZGQwIDEw
MDY0NA0KPj4gLS0tIGEvbWV0YS9saWIvb2UvZ3BnX3NpZ24ucHkNCj4+ICsrKyBiL21ldGEvbGli
L29lL2dwZ19zaWduLnB5DQo+PiBAQCAtMTIzLDYgKzEyMywxNiBAQCBjbGFzcyBMb2NhbFNpZ25l
cihvYmplY3QpOg0KPj4gICAgICAgICByZXR1cm4gcmV0DQo+PiANCj4+IA0KPj4gK2NsYXNzIFNp
Z25GYWlsZWRFcnJvcihiYi5idWlsZC5GdW5jRmFpbGVkKToNCj4+ICsgICAgZGVmIF9faW5pdF9f
KHNlbGYsIGRlc2NyaXB0aW9uLCBuYW1lPU5vbmUsIGxvZ2ZpbGU9Tm9uZSk6DQo+PiArICAgICAg
ICBzZWxmLmRlc2NyaXB0aW9uID0gZGVzY3JpcHRpb24NCj4+ICsgICAgICAgIHNlbGYubmFtZSA9
IG5hbWUNCj4+ICsgICAgICAgIHNlbGYubG9nZmlsZSA9IGxvZ2ZpbGUNCj4+ICsNCj4+ICsgICAg
ZGVmIF9fc3RyX18oc2VsZik6DQo+PiArICAgICAgICByZXR1cm4gJ1NpZ25pbmcgZmFpbGVkOiAl
cycgJSBzZWxmLmRlc2NyaXB0aW9uDQo+PiArDQo+PiArDQo+IA0KPiBXaGlsc3QgdGhpcyBzdWJj
bGFzcyBpcyBxdWl0ZSBweXRob25pYywgSSdtIG5vdCBzdXJlIHdlIHdhbnQgdG8gZG8NCj4gdGhp
cy4gQXQgdGhlIGJhY2sgb2YgbXkgbWluZCBpcyB0aGUgZmVlbGluZyB0aGF0IEZ1bmNGYWlsZWQg
aXMgYSBiaXQNCj4gcG9pbnRsZXNzIDovLg0KDQpUaGlzIGlzIHBvaW50bGVzcyBpbiBtb3JlIHdh
eXMgdGhhbiBvbmUsIGJlY2F1c2UgYWJvdmUgSSBjaGFuZ2VkIHRoZSBTU1RBVEVDUkVBVEVGVU5D
UyB0byBvbmx5IGluY2x1ZGUgc3N0YXRlX3NpZ25fcGFja2FnZSBpZiBTU1RBVEVfU0lHX0tFWSBp
cyBzZXQgdGhpcyBleGNlcHRpb24gc2hvdWxkbuKAmXQgZXZlciBiZSByYWlzZWQuDQoNCknigJls
bCBzZW5kIGFuIHVwZGF0ZSBzZXJpZXMgd2l0aCB0aGlzIGNsYXNzIGFuZCBpdHMgdXNhZ2UgZHJv
cHBlZC4NCg0KSm9zaHVhDQoNCj4gUHV0IGRpZmZlcmVudGx5LCB3aGF0IGRvZXMgdGhpcyBidXkg
dXMgdGhhdCBiYi5mYXRhbCgpIGRvZXNuJ3Q/DQo+IA0KPiBXZSBkbyBoYXZlIGEgZmV3IHVzZXJz
IG9mIEZ1bmNGYWlsZWQgaW4gT0VDb3JlIGJ1dCBub3QgbWFueSAoYWJvdXQNCj4gOCkuLi4NCj4g
DQo+IENoZWVycywNCj4gDQo+IFJpY2hhcmQNCj4gDQo+IA0KPiANCg0K

