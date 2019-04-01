Return-Path: <catalin-dan.udma@nxp.com>
X-Greylist: delayed 72401 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 02 Apr 2019 22:38:51 UTC
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr10077.outbound.protection.outlook.com [40.107.1.77])
	by mail.openembedded.org (Postfix) with ESMTP id C691E7D2B0
	for <Openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 22:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=HcTQKW1SJXvL6qv8QesCM4X6qcslqeojg1tq5xTfx+0=;
	b=a6wieu9axCeYnd284F+idat0I+usszFysfr+K4H2T/a+V8OCthib1AFEp6rPgZAAvMCmfO5WnUuyI2Vs9VnWoxfIbbcTSBRGuIYESB4X8OOi00rajq3zpZHQz69jlBCf/X2MmA+/K6VZDWtSkgiAK6FqbTzBP1kI3mMPqMqrXGI=
Received: from VI1PR04MB5565.eurprd04.prod.outlook.com (20.178.123.19) by
	VI1PR04MB2095.eurprd04.prod.outlook.com (10.166.43.23) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1750.15; Mon, 1 Apr 2019 05:59:59 +0000
Received: from VI1PR04MB5565.eurprd04.prod.outlook.com
	([fe80::59ab:7691:ef45:6982]) by
	VI1PR04MB5565.eurprd04.prod.outlook.com
	([fe80::59ab:7691:ef45:6982%6]) with mapi id 15.20.1750.017;
	Mon, 1 Apr 2019 05:59:59 +0000
From: Catalin Dan Udma <catalin-dan.udma@nxp.com>
To: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH] insane.bbclass: fix QA-check to consider the
	PREFERRED_RPROVIDER for RDEPENDS
Thread-Index: AQHU01hqHgZ7Hp2xJEeaJNrTv59NIqYm+RCA
Date: Mon, 1 Apr 2019 05:59:59 +0000
Message-ID: <VI1PR04MB5565D1837E769E35CB840F41DA550@VI1PR04MB5565.eurprd04.prod.outlook.com>
References: <1551792970-1216-1-git-send-email-catalin-dan.udma@nxp.com>
In-Reply-To: <1551792970-1216-1-git-send-email-catalin-dan.udma@nxp.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [212.146.100.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 37f4af4d-d1e3-41eb-47a9-08d6b6674658
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR04MB2095; 
x-ms-traffictypediagnostic: VI1PR04MB2095:
x-microsoft-antispam-prvs: <VI1PR04MB2095407EE55E844F6B897B4BDA550@VI1PR04MB2095.eurprd04.prod.outlook.com>
x-forefront-prvs: 0994F5E0C5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(376002)(346002)(366004)(136003)(396003)(39860400002)(13464003)(189003)(199004)(476003)(25786009)(11346002)(256004)(7696005)(2906002)(6916009)(8936002)(66066001)(6116002)(6506007)(53546011)(26005)(14454004)(316002)(76176011)(2351001)(5640700003)(33656002)(3846002)(6246003)(6346003)(9686003)(99286004)(53936002)(186003)(97736004)(478600001)(6436002)(55016002)(229853002)(74316002)(102836004)(105586002)(81166006)(8676002)(71190400001)(106356001)(52536014)(5660300002)(446003)(71200400001)(68736007)(81156014)(7736002)(486006)(2501003)(86362001)(305945005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB2095;
	H:VI1PR04MB5565.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=catalin-dan.udma@nxp.com; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tUq6O6GKdzOJLpf0qm9m/yFZpfZtkKpBqW6njw99aTqq/JQ4Ln8P9v0tQK/9zjj2XolA8YswZgJ4W/obyTiT//jb2X1t4PQGJWOjQr1RDrzUgg6Z7gf4xOKjM6eh7TgGaCfxVaOeDJNpw94lg94qtIOuptndEzq59F+XtLvkwe5iw9YgH7rOvd6Fd6NgZEcAjGEzG/xC4BCPYeypePKpAyeLIoHJx+fYuK890txEZhzNQhgVke742VLbnIS8cOngiBjzZXMLkMHz3WbcmJajIDQQLTyrBELwXru/jaFQxZQgGbml0DtwTuu7m/l7ECvOy49Q/5r9MxIl4OiaULO6ZIfyPFEfInJ9u6kk1U0zHN+t9pg5o752qxFI0wHesydpRlHO+iNrzt9chtEGTMc1Hu2fMPGJ367cCOTr+c9Bny4=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37f4af4d-d1e3-41eb-47a9-08d6b6674658
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2019 05:59:59.6800 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2095
Subject: Re: [PATCH] insane.bbclass: fix QA-check to consider the PREFERRED_RPROVIDER for RDEPENDS
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
X-List-Received-Date: Tue, 02 Apr 2019 22:38:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UGluZy4NCg0KVGhhbmtzLA0KQ2F0YWxpbiBVZG1hDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gRnJvbTogQ2F0YWxpbiBEYW4gVWRtYQ0KPiBTZW50OiBUdWVzZGF5LCBNYXJjaCA1
LCAyMDE5IDM6MzYgUE0NCj4gVG86IE9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNCj4gQ2M6IENhdGFsaW4gRGFuIFVkbWEgPGNhdGFsaW4tZGFuLnVkbWFAbnhwLmNvbT4N
Cj4gU3ViamVjdDogW09FLWNvcmVdW1BBVENIXSBpbnNhbmUuYmJjbGFzczogZml4IFFBLWNoZWNr
IHRvIGNvbnNpZGVyIHRoZQ0KPiBQUkVGRVJSRURfUlBST1ZJREVSIGZvciBSREVQRU5EUw0KPiAN
Cj4gUUEtY2hlY2sgbG9va3MgaW4gdGhlIFJERVBFTkRTIGxpc3Qgd2l0aG91dCB0YWtpbmcgaW50
byBjb25zaWRlcmF0aW9uIHRoYXQgYQ0KPiBzcGVjaWZpYyBwYWNrYWdlIG1heSBoYXZlIGEgUFJF
RkVSUkVEX1JQUk9WSURFUiBkZWZpbmVkLg0KPiBJZiBQUkVGRVJSRURfUlBST1ZJREVSIGlzIHNl
dCwgUUEtY2hlY2sgd2lsbCBpZ25vcmUgdGhhdCBzZXR0aW5ncyBhbmQgd2lsbA0KPiBjb25zaWRl
ciB0aGUgb3JpZ2luYWwgcGFja2FnZSwgcmVzdWx0aW5nIGluIFFBLWNoZWNrIGVycm9yczoNCj4g
CUVSUk9SOiBkb19wYWNrYXRlX3FhOiBRQSBJc3N1ZTogPC4uLj4sIGJ1dCBubyBwcm92aWRlcnMg
Zm91bmQgaW4NCj4gCVJERVBFTkRTXzxwYWNrYWdlPj8gW2ZpbGUtcmRlcHNdDQo+IFRoZSBmaXgg
aXMgdG8gcmVwbGFjZSB0aGUgb3JpZ2luYWwgcGFja2FnZSBpbiB0aGUgUUEtY2hlY2sgd2l0aCB0
aGUgbmV3DQo+IHBhY2thZ2UgZGVmaW5lZCBpbiBQUkVGRVJSRURfUlBST1ZJREVSLCBpZiBpdOKA
mXMgc2V0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQ2F0YWxpbiBVZG1hIDxjYXRhbGluLWRhbi51
ZG1hQG54cC5jb20+DQo+IC0tLQ0KPiAgbWV0YS9jbGFzc2VzL2luc2FuZS5iYmNsYXNzIHwgNiAr
KysrKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1n
aXQgYS9tZXRhL2NsYXNzZXMvaW5zYW5lLmJiY2xhc3MgYi9tZXRhL2NsYXNzZXMvaW5zYW5lLmJi
Y2xhc3MNCj4gaW5kZXggNjQxMTg4NC4uMTY1MjMzYiAxMDA2NDQNCj4gLS0tIGEvbWV0YS9jbGFz
c2VzL2luc2FuZS5iYmNsYXNzDQo+ICsrKyBiL21ldGEvY2xhc3Nlcy9pbnNhbmUuYmJjbGFzcw0K
PiBAQCAtNjg5LDYgKzY4OSw5IEBAIGRlZiBwYWNrYWdlX3FhX2NoZWNrX3JkZXBlbmRzKHBrZywg
cGtnZGVzdCwgc2tpcCwNCj4gdGFza2RlcHMsIHBhY2thZ2VzLCBkKToNCj4gICAgICAgICAgIyBO
b3cgZG8gdGhlIHNhbml0eSBjaGVjayEhIQ0KPiAgICAgICAgICBpZiAiYnVpbGQtZGVwcyIgbm90
IGluIHNraXA6DQo+ICAgICAgICAgICAgICBmb3IgcmRlcGVuZCBpbiByZGVwZW5kczoNCj4gKyAg
ICAgICAgICAgICAgICBwcmVmX3JkZXBlbmQgPSBsb2NhbGRhdGEuZ2V0VmFyKCJQUkVGRVJSRURf
UlBST1ZJREVSXyVzIiAlDQo+IHJkZXBlbmQpDQo+ICsgICAgICAgICAgICAgICAgaWYgcHJlZl9y
ZGVwZW5kOg0KPiArICAgICAgICAgICAgICAgICAgICByZGVwZW5kID0gcHJlZl9yZGVwZW5kDQo+
ICAgICAgICAgICAgICAgICAgaWYgIi1kYmciIGluIHJkZXBlbmQgYW5kICJkZWJ1Zy1kZXBzIiBu
b3QgaW4gc2tpcDoNCj4gICAgICAgICAgICAgICAgICAgICAgZXJyb3JfbXNnID0gIiVzIHJkZXBl
bmRzIG9uICVzIiAlIChwa2cscmRlcGVuZCkNCj4gICAgICAgICAgICAgICAgICAgICAgcGFja2Fn
ZV9xYV9oYW5kbGVfZXJyb3IoImRlYnVnLWRlcHMiLCBlcnJvcl9tc2csIGQpDQo+IEBAIC03Mzks
NiArNzQyLDkgQEAgZGVmIHBhY2thZ2VfcWFfY2hlY2tfcmRlcGVuZHMocGtnLCBwa2dkZXN0LCBz
a2lwLA0KPiB0YXNrZGVwcywgcGFja2FnZXMsIGQpOg0KPiAgICAgICAgICAgICAgICAgIHdoaWxl
IG5leHQ6DQo+ICAgICAgICAgICAgICAgICAgICAgIG5ldyA9IFtdDQo+ICAgICAgICAgICAgICAg
ICAgICAgIGZvciByZGVwIGluIG5leHQ6DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICBwcmVm
X3JkZXAgPSBsb2NhbGRhdGEuZ2V0VmFyKCJQUkVGRVJSRURfUlBST1ZJREVSXyVzIiAlDQo+IHJk
ZXApDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICBpZiBwcmVmX3JkZXA6DQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcmRlcCA9IHByZWZfcmRlcA0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgcmRlcF9kYXRhID0gb2UucGFja2FnZWRhdGEucmVhZF9zdWJwa2dkYXRhKHJkZXAs
IGQpDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICBzdWJfcmRlcHMgPSByZGVwX2RhdGEuZ2V0
KCJSREVQRU5EU18iICsgcmRlcCkNCj4gICAgICAgICAgICAgICAgICAgICAgICAgIGlmIG5vdCBz
dWJfcmRlcHM6DQo+IC0tDQo+IDIuNy40DQoNCg==

