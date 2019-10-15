Return-Path: <shuagr@microsoft.com>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr770103.outbound.protection.outlook.com [40.107.77.103])
	by mail.openembedded.org (Postfix) with ESMTP id CC2017F455
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2019 16:27:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=J9tL3k7kkrIt4za5hto9B3eH24UPJB4PwgUTeyLVnU8rxpLmNxEbMN/QGcrZGwQ39wLufJBGnrgJIOTnWjW+fJ2QwQIYvcEJIjTRl6cUvP5+O1nNKHxdYphEjCKB8Xpj4ZlHEcIGA3qfT0kyXm7IN1pGHhg0Rj1iMxJGg9ZFEQrAvega5T9mtRndg1NsDnh0gV/fufPLgZO1rFcbQ50bBiJFs52AbDZm8TI4crdvhnl3AjWgNfAAn4D4JvMDsBb1Iq8LY2hEYOO29t5e2tPp3CEv5Bi7UvdoTEiCIUxa/ln1y/jAH/kUnr1yOoaLjSt0uP5f9P5zODTq+khP8XWeJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=5eK2nCLGH0HHOlCmkbnqCkWNl3EBlMQH1QysjTvs5yk=;
	b=dfiaHKlHQSzIUuDwucrJG/P3xAopuHGNxKL1LVpBhsxWDgvYiwaT5CC99PsnOycuWwhoX1vHLquonfO8dAXogyA+RU1zuKxoIoDbicTGUWIDGvd1ygRVdAFw+PD/hPwLQBPBeew90jg+SuMXS+e5OYGHcl5EGflW7r+3iapFXXwigcBbptESaVFo2z6NmNwGnIkkIR21sUDVM1ihY1XYbD7pwKfTGSnNoyY4CZufQZWvnTu3alefyokOl/vn0vFQ0r5NCQVfPrbJMMOfL+PY7pcSr0mzfebNxjeTQrCAnDZDSRMnA36uLpmaKogEAbWt97/Fw9rhsQKpy9bIU8eXAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=microsoft.com; dmarc=pass action=none
	header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=5eK2nCLGH0HHOlCmkbnqCkWNl3EBlMQH1QysjTvs5yk=;
	b=OD8ueorEyiYougtCFDVMCG4MFtmEYtpbQ9trjSzARzdsScHhNghrQJvUnn2L5Z7nq7uyZUGcXETzKHMkU3I4/GpUX72kRlXeypvmBbxUtAnVik5Y65sJJSBXlrp59ZuMKvHTaotLg0uCjkLn40WvCc+mGG4FuF7BsHGTe0NhEKk=
Received: from BL0PR2101MB1059.namprd21.prod.outlook.com (52.132.24.17) by
	BL0PR2101MB0962.namprd21.prod.outlook.com (52.132.20.155) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.10; Tue, 15 Oct 2019 16:27:52 +0000
Received: from BL0PR2101MB1059.namprd21.prod.outlook.com
	([fe80::5123:723e:5ff6:36cf]) by
	BL0PR2101MB1059.namprd21.prod.outlook.com
	([fe80::5123:723e:5ff6:36cf%5]) with mapi id 15.20.2367.014;
	Tue, 15 Oct 2019 16:27:50 +0000
From: Shubham Agrawal <shuagr@microsoft.com>
To: akuster808 <akuster808@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [thud][PATCH v2] sqlite3: CVE fix
Thread-Index: AQHVg3HCB6xkMiprOkG0JMMtmexqRKdb4+Ew
Date: Tue, 15 Oct 2019 16:27:50 +0000
Message-ID: <BL0PR2101MB1059AEF3EFA4F86E4EF65D11DB930@BL0PR2101MB1059.namprd21.prod.outlook.com>
References: <1571084536-74960-1-git-send-email-shuagr@microsoft.com>
	<fb340b87-6f4a-bbd8-90b3-fb916b4bc6ee@gmail.com>
In-Reply-To: <fb340b87-6f4a-bbd8-90b3-fb916b4bc6ee@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=True;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Owner=shuagr@microsoft.com;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-10-15T16:27:44.0539773Z;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Application=Microsoft
	Azure Information Protection;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=5046bab7-bbce-41b2-a294-c7525ed58bda;
	MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=shuagr@microsoft.com; 
x-originating-ip: [2001:4898:80e8:1:71f0:97e9:891e:244f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d23573f-a36b-4073-3a40-08d7518c9f4f
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BL0PR2101MB0962:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BL0PR2101MB096202A5D73B61AA74FFBE26DB930@BL0PR2101MB0962.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:901;
x-forefront-prvs: 01917B1794
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(39860400002)(346002)(366004)(396003)(136003)(376002)(189003)(199004)(13464003)(71200400001)(81166006)(71190400001)(6306002)(186003)(446003)(11346002)(6506007)(8990500004)(8676002)(7736002)(6436002)(2501003)(8936002)(6246003)(86362001)(10290500003)(305945005)(74316002)(76176011)(102836004)(53546011)(99286004)(9686003)(476003)(46003)(486006)(33656002)(7696005)(25786009)(229853002)(81156014)(55016002)(14444005)(66476007)(14454004)(316002)(478600001)(5660300002)(22452003)(256004)(966005)(2906002)(76116006)(66946007)(66556008)(66446008)(64756008)(110136005)(6116002)(52536014)(10090500001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BL0PR2101MB0962;
	H:BL0PR2101MB1059.namprd21.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microsoft.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M6Aj7eao0y0BHqBzTULhMWQwXASZ1SR3QywlRM9MQYS5rxdvOuP5GvxaCfN2OwcJBX9g+Jmrz02rIt5VGBzFDdlQCFWWy4yyzidFMWRDKzfp0WpASNUpTnyBqaIPCtGnUxutZ8lUvGaJG+N2jzvpLThaB3Gc5m1cHhUJ7B2TmxO66+cAOXkjNtt+ljtj5H5C/pZpNqlbE3u4yZvZltEeiheTvzX5VKvhLsDH79ilEANoB9/Wt2ReID63VNIbuGYPAZf6d5OqjMojw9B1Hlx6sbfzyJK9mRTZZR717ZAAi0iEE6Xl0jTHymvFZnPZ4XoqKEsZMyKbTwqjv6rSfVYdO/Uev/f7VQsLQY3exXQfi8QmnRkf/0C71zHN5W08NM8f0qtAOscFrri971Y0Joj2nGyehlNcosqeHOcIcU3qnOWEdrWxrBeq8I+5B+08IfSwy6L5nn6F+DsDS4nMDsSHHg==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d23573f-a36b-4073-3a40-08d7518c9f4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2019 16:27:50.4396 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8GucE6LfKI95fccYqWDCcHqUhOcIjAa5EA7o1chicRlDhQ8lRVhpkOgOcNpR1GVQXW6y1Vx5PhNOGRAZF5awsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR2101MB0962
Subject: Re: [thud][PATCH v2] sqlite3: CVE fix
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
X-List-Received-Date: Tue, 15 Oct 2019 16:27:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhhbmtzIGZvciBwb2ludGluZyBpdCBvdXQuIEkgaGF2ZSBjb3JyZWN0ZWQgdGhlIGNvbW1pdCBh
bmQgZW1haWxlZC4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IGFrdXN0ZXI4
MDggPGFrdXN0ZXI4MDhAZ21haWwuY29tPiANClNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIgMTUsIDIw
MTkgOTowMSBBTQ0KVG86IFNodWJoYW0gQWdyYXdhbCA8c2h1YWdyQG1pY3Jvc29mdC5jb20+OyBv
cGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW09F
LWNvcmVdIFt0aHVkXVtQQVRDSCB2Ml0gc3FsaXRlMzogQ1ZFIGZpeA0KDQoNCg0KT24gMTAvMTQv
MTkgMToyMiBQTSwgc2h1YWdyOTdAZ21haWwuY29tIHdyb3RlOg0KPiBGcm9tOiBTaHViaGFtIEFn
cmF3YWwgPHNodWFnckBtaWNyb3NvZnQuY29tPg0KPg0KPiBDVkU6Q1ZFLTIwMTktMTYxNjgwDQpE
b2VzIG5vdCBtYXRjaCBwYXRjaCBuYW1lLg0KPiBTdGF0dXM6IEJhY2twb3J0DQo+DQo+IHdoaXRl
bGlzdCBhcyBjaGFuZ2VzIGFscmVhZHkgdGhlcmUgZHVlIHRvIHByZXZpb3VzIHBhdGNoZXMgaW4g
dXBzdHJlYW0NCj4gQ1ZFOkNWRS0yMDE4LTIwMzQ2DQo+IFN0YXR1czogQmFja3BvcnRlZA0KPg0K
PiBTaWduIG9mZjogU2h1YmhhbSBBZ3Jhd2FzbHNodWFnckBtaWNyb3NvZnQuY29tDQoNClRoaXMg
bmVlZCB0byBiZSBmaXhlZCBpbiBNYXN0ZXIgdGhlbiBXYXJyaW9yLg0KPiAtLS0NCj4gIC4uLi9z
cWxpdGUvZmlsZXMvQ1ZFLTIwMTktMTYxNjgucGF0Y2ggICAgICAgICAgICAgIHwgMzcgKysrKysr
KysrKysrKysrKysrKysrKw0KPiAgbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTNf
My4yMy4xLmJiICAgICAgfCAgMSArDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMo
KykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtc3VwcG9ydC9zcWxpdGUvZmls
ZXMvQ1ZFLTIwMTktMTYxNjgucGF0Y2gNCj4NCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1z
dXBwb3J0L3NxbGl0ZS9maWxlcy9DVkUtMjAxOS0xNjE2OC5wYXRjaCBiL21ldGEvcmVjaXBlcy1z
dXBwb3J0L3NxbGl0ZS9maWxlcy9DVkUtMjAxOS0xNjE2OC5wYXRjaA0KPiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwLi5kOGU5M2MwDQo+IC0tLSAvZGV2L251bGwNCj4gKysr
IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL2ZpbGVzL0NWRS0yMDE5LTE2MTY4LnBhdGNo
DQo+IEBAIC0wLDAgKzEsMzcgQEANCj4gK0Zyb20gZmM4YmI4ZDZhZTJkNGNkMDI0NTQ2ZTllN2Ji
YWIxMTU0MjdjM2Y0MSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDENCj4gK0Zyb206IFNodWJoYW0g
QWdyYXdhbCA8c2h1YWdyQG1pY3Jvc29mdC5jb20+DQo+ICtEYXRlOiBGcmksIDExIE9jdCAyMDE5
IDIwOjIwOjE4ICswMDAwDQo+ICtTdWJqZWN0OiBbUEFUQ0hdIHNxbGl0ZTMgQ1ZFOiBDVkUtMjAx
OS0xNjE2OCBTdGF0dXM6IGJhY2twb3J0ZWQgU2lnbiBvZmY6DQo+ICsgU2h1YmhhbSBBZ3Jhd2Fs
PHNodWFnckBtaWNyb3NvZnQuY29tPg0KPiArUmVwbHktVG86IHNodWFnckBtaWNyb3NvZnQuY29t
DQo+ICsNCkFkZCB0aGlzIGtpbmQgb2YgaW5mb3JtYXRpb24gaW50byB0aGUgcGF0Y2ggaXRzZWxm
Lg0KDQpDVkU6Q1ZFLTIwMTgtMjAzNDYNClN0YXR1czogQmFja3BvcnRlZA0KDQpTaWduIG9mZjog
U2h1YmhhbSBBZ3Jhd2FzbHNodWFnckBtaWNyb3NvZnQuY29tDQoNClNlZSBodHRwczovL25hbTA2
LnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZwYXRj
aHdvcmsub3BlbmVtYmVkZGVkLm9yZyUyRnBhdGNoJTJGMTY1ODAwJTJGJmFtcDtkYXRhPTAyJTdD
MDElN0NzaHVhZ3IlNDBtaWNyb3NvZnQuY29tJTdDMmI0MGQyOTUwNDIzNDgyZTc3YTIwOGQ3NTE4
OGUzZjElN0M3MmY5ODhiZjg2ZjE0MWFmOTFhYjJkN2NkMDExZGI0NyU3QzElN0MwJTdDNjM3MDY3
NTIwNjg4ODQxNDgwJmFtcDtzZGF0YT1CJTJCekxQSUV3amhkd0d3cHUydUowdlhQcUVzY1gwbldS
MThzY3U0b0hTcDglM0QmYW1wO3Jlc2VydmVkPTAgYXMgYW4gZXhhbXBsZQ0KDQoNCj4gKy0tLQ0K
PiArIHNxbGl0ZTMuYyB8IDUgKysrKy0NCj4gKyAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pDQo+ICsNCj4gK2RpZmYgLS1naXQgYS9zcWxpdGUzLmMgYi9zcWxp
dGUzLmMNCj4gK2luZGV4IDBmNzFhNDQuLmM0ODBlNTMgMTAwNjQ0DQo+ICstLS0gYS9zcWxpdGUz
LmMNCj4gKysrKyBiL3NxbGl0ZTMuYw0KPiArQEAgLTEwMTgzNiw3ICsxMDE4MzYsOSBAQCBzdGF0
aWMgdm9pZCBkZWNvZGVJbnRBcnJheSgNCj4gKyAgICAgICBpZiggc3FsaXRlM19zdHJnbG9iKCJ1
bm9yZGVyZWQqIiwgeik9PTAgKXsNCj4gKyAgICAgICAgIHBJbmRleC0+YlVub3JkZXJlZCA9IDE7
DQo+ICsgICAgICAgfWVsc2UgaWYoIHNxbGl0ZTNfc3RyZ2xvYigic3o9WzAtOV0qIiwgeik9PTAg
KXsNCj4gKy0gICAgICAgIHBJbmRleC0+c3pJZHhSb3cgPSBzcWxpdGUzTG9nRXN0KHNxbGl0ZTNB
dG9pKHorMykpOw0KPiArKyAgICAgICAgaW50IHN6ID0gc3FsaXRlM0F0b2koeiszKTsNCj4gKysg
ICAgICAgIGlmKCBzejwyICkgc3ogPSAyOw0KPiArKyAgICAgICAgcEluZGV4LT5zeklkeFJvdyA9
IHNxbGl0ZTNMb2dFc3Qoc3FsaXRlM0F0b2koc3opKTsNCj4gKyAgICAgICB9ZWxzZSBpZiggc3Fs
aXRlM19zdHJnbG9iKCJub3NraXBzY2FuKiIsIHopPT0wICl7DQo+ICsgICAgICAgICBwSW5kZXgt
Pm5vU2tpcFNjYW4gPSAxOw0KPiArICAgICAgIH0NCj4gK0BAIC0xMzcxNTEsNiArMTM3MTUzLDcg
QEAgc3RhdGljIGludCB3aGVyZUxvb3BBZGRCdHJlZUluZGV4KA0KPiArICAgICAqKiBpdCB0byBw
TmV3LT5yUnVuLCB3aGljaCBpcyBjdXJyZW50bHkgc2V0IHRvIHRoZSBjb3N0IG9mIHRoZSBpbmRl
eA0KPiArICAgICAqKiBzZWVrIG9ubHkuIFRoZW4sIGlmIHRoaXMgaXMgYSBub24tY292ZXJpbmcg
aW5kZXgsIGFkZCB0aGUgY29zdCBvZg0KPiArICAgICAqKiB2aXNpdGluZyB0aGUgcm93cyBpbiB0
aGUgbWFpbiB0YWJsZS4gICovDQo+ICsrICAgIGFzc2VydCggcFNyYy0+cFRhYi0+c3pUYWJSb3c+
MCApOw0KPiArICAgICByQ29zdElkeCA9IHBOZXctPm5PdXQgKyAxICsgKDE1KnBQcm9iZS0+c3pJ
ZHhSb3cpL3BTcmMtPnBUYWItPnN6VGFiUm93Ow0KPiArICAgICBwTmV3LT5yUnVuID0gc3FsaXRl
M0xvZ0VzdEFkZChyTG9nU2l6ZSwgckNvc3RJZHgpOw0KPiArICAgICBpZiggKHBOZXctPndzRmxh
Z3MgJiAoV0hFUkVfSURYX09OTFl8V0hFUkVfSVBLKSk9PTAgKXsNCj4gKy0tIA0KPiArMi43LjQN
Cj4gKw0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTNf
My4yMy4xLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvc3FsaXRlL3NxbGl0ZTNfMy4yMy4xLmJi
DQo+IGluZGV4IDdkZjYxY2QuLmUyZTliNTAgMTAwNjQ0DQo+IC0tLSBhL21ldGEvcmVjaXBlcy1z
dXBwb3J0L3NxbGl0ZS9zcWxpdGUzXzMuMjMuMS5iYg0KPiArKysgYi9tZXRhL3JlY2lwZXMtc3Vw
cG9ydC9zcWxpdGUvc3FsaXRlM18zLjIzLjEuYmINCj4gQEAgLTgsNiArOCw3IEBAIFNSQ19VUkkg
PSAiXA0KPiAgICBmaWxlOi8vQ1ZFLTIwMTgtMjA1MDUucGF0Y2ggXA0KPiAgICBmaWxlOi8vQ1ZF
LTIwMTgtMjA1MDYucGF0Y2ggXA0KPiAgICBmaWxlOi8vQ1ZFLTIwMTktODQ1Ny5wYXRjaCBcDQo+
ICsgIGZpbGU6Ly9DVkUtMjAxOS0xNjE2OC5wYXRjaCBcDQo+ICAgICINCj4gIFNSQ19VUklbbWQ1
c3VtXSA9ICI5OWE1MWI0MGE2Njg3Mjg3MmE5MWM5MmY2ZDAxMzRmYSINCj4gIFNSQ19VUklbc2hh
MjU2c3VtXSA9ICI5Mjg0MmIyODNlNWU3NDRlZmY1ZGEyOWVkM2M2OTM5MWRlNzM2OGZjY2M0ZDBl
ZTZiZjYyNDkwY2U1NTVlZjI1Ig0KDQoNCg==

