Return-Path: <adrian.freihofer@siemens.com>
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
	(mail-eopbgr80048.outbound.protection.outlook.com [40.107.8.48])
	by mail.openembedded.org (Postfix) with ESMTP id 7191D61260
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 08:14:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=ZywXjZ83dwlMDez8M/twkmPAysKGJuwYEWmEgekA1Ckfa6fudQvb/KWPfXpQjxf9hppUgTD1dJ4DW+YoU5yIZwBb4buglQ4vK4QZiBp9IgEOMW4lAt/aJjiaiVskKtF/gups+QUW5lSE003KYDGUkGZ6veboXvzw1GbaPSmyCMhnpv4hF6NwllkK5XfyOGjGWOMj4DVC6cTf+xRCyZE0POBFIBRzbhSv4K4AFs8RzoQnGwN4EWSzHOt6ArF+dslK3icnWV1pPaH5SwhlpORvCCXv+qoGzlbvhDeNP+xPdmm0qU8Zfxhi9sL4VViuopKVfjcy+zqta48Tp163LWaFDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=epR0qKCpMumoY47MuCt/uMEuvT6mb/XkaevymX6H6vo=;
	b=V6elUXCCou+g4b5hyvbyT42VRqVxI5nuEqW6LhZYW/bM6BWj+LWinVHu7+mci08QdGF0QytvcHnzTgio7ZnTwV1SE+VwNzaVhbFSDP3LgwFxFuqVsVhKYJddyEslES7donAheZ26hFtxsl4IWkroHyjvniGKoIwzwnQidP59E07YDKsMKVHd1omkwrcf8/N5JmRG+EkdzLRi6zABA7IgSxR2VzjwFyx+AGQSlHcrryiEYBZxzxZgS6QtzR8D+68qnHwLWXEMVvxmFqsV72VztxgjPKVGZyonJ+c6UP6KXFtfJjD/nSguClSsse67oZvz/WX31xfGBr0++pkt8PUJMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=siemens.com;
	dmarc=pass action=none header.from=siemens.com; 
	dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=epR0qKCpMumoY47MuCt/uMEuvT6mb/XkaevymX6H6vo=;
	b=Mh4hLwgJ8SeHRbUDXXTfO+dNUhUFXz6siUm2dPLTotQqmMNmXZwrIfIanXNltdDly9H7XwL3jdgw+SCsLR99JiRcMjMb1alOY21rqIqhb1HOUckwpC6TIqNx7brPnFHYyrEr/CTMPa5x9wmdMZSj3fmg5IDmHmoBqd0IQIUw108=
Received: from PR3PR10MB3867.EURPRD10.PROD.OUTLOOK.COM (20.180.104.80) by
	PR3PR10MB3820.EURPRD10.PROD.OUTLOOK.COM (20.180.106.81) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2772.16; Wed, 4 Mar 2020 08:14:18 +0000
Received: from PR3PR10MB3867.EURPRD10.PROD.OUTLOOK.COM
	([fe80::d1d3:afd:da50:b311]) by PR3PR10MB3867.EURPRD10.PROD.OUTLOOK.COM
	([fe80::d1d3:afd:da50:b311%5]) with mapi id 15.20.2772.019;
	Wed, 4 Mar 2020 08:14:18 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH] runqemu: support multiple NICs
Thread-Index: AQHV8fzmOMudZh5Jz0OLbdV9vZyBAA==
Date: Wed, 4 Mar 2020 08:14:18 +0000
Message-ID: <2b48cd168e6050723f4c30b059098b319e5b6df5.camel@siemens.com>
Accept-Language: de-CH, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=adrian.freihofer@siemens.com; 
x-originating-ip: [165.225.72.111]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8f727406-34f1-4c40-87d4-08d7c014096e
x-ms-traffictypediagnostic: PR3PR10MB3820:
x-microsoft-antispam-prvs: <PR3PR10MB3820B79A453178A184F99E128EE50@PR3PR10MB3820.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-forefront-prvs: 0332AACBC3
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10001)(10009020)(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(189003)(199004)(36756003)(86362001)(5660300002)(55236004)(316002)(6916009)(76116006)(64756008)(26005)(66446008)(6512007)(8676002)(71200400001)(2906002)(81156014)(478600001)(81166006)(8936002)(2616005)(6506007)(91956017)(66556008)(6486002)(66946007)(186003)(66476007);
	DIR:OUT; SFP:1101; SCL:1; SRVR:PR3PR10MB3820;
	H:PR3PR10MB3867.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: siemens.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q4ADsp1U71EVVSiCvAJathDpXCMNwNnJPzeTXtKoEJHSs0z+MFJPs0SPE1b3OqhJHi/nI0LvpunZZ9XZU+oa391gdaUhw6HbZZqvI7MozgcE5mqbFC3k2MR9TqL0ere98Ke7UewH6WNTzT/m0w2y5AXBZxCopWuP+RNimJz5XyjMna0mZVRkYnuL/jVT5ywqnqZr8Ffc1ejsKXua45gN/MC42OVnYSM1oNLn+PvQECiinhwDshLNgII2zdr8yZKLakUfbRKDeINuUfUlr8+PXfK9KdWAOfgFxdWvN9TzfOT/oi1zA/p5alrutSJl+1Jn1PetzH2eiXoItFlvDJaulKjLUT5EFa+g125J5i9fXRLqhDUdy/AlUJ4h5OPy+X+L3d1e2Hehd57OnyIQABTsz3+L5oN2bRkngEg5RItD3IxLPsmzdlYqglFzs4ZvP6HbnTd1S+40Rx9NZpDvnNgtFbyHArb9eNSCJzzxQY++0LDkCeLF7OiH1e/cj+FhVlwf3eCx8e/xCN4x2BouOaqheY4gsjDfv62SYWt+NoBAX+Q0nWOQfvkV+13DJd1Qi8tC+GHAKSQvewFibWOXqyMwe+RxHIx4VxifQ4RPHXscm13u6O9i1z3xp81n5eNWSmhMQ3jSR6k+nUBXnQeHlG/eZw==
x-ms-exchange-antispam-messagedata: cQNGfLQ7GTX5XaDAdrP0AJl31RPZk+EH3nfFeX4b3kOFqwLiMKNaMhcKIDAA9Nqy49NrI70DkvwxJ0PEhnVQLo+AR4Mj9jlMR270ZE7z8W9PTlh4hjQT5yyo+NvxQs4IWy4gIK3NQVgLMRl481bUWQ==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f727406-34f1-4c40-87d4-08d7c014096e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2020 08:14:18.5236 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u9NT5iV0GalinJfhv+jxZgtVlUt9emusf0ynBXpj+X9UqplYxigzi9+wzsnC6RlslkLR9Of3Tsh3sKlEIRRi5FE8B/vjw/fQnsTvkEIfVrU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3820
Subject: [PATCH] runqemu: support multiple NICs
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
X-List-Received-Date: Wed, 04 Mar 2020 08:14:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <7BDBE2F93342F141966A6BF3C4702102@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64

RW11bGF0aW5nIG1vcmUgdGhhbiBvbmUgbmV0d29yayBpbnRlcmZhY2Ugd2l0aCBydW5xZW11IGlz
IHNvbWV0aW1lcyBhDQpiaXQgdHJpY2t5LCBidXQgcG9zc2libGUuIEZvciBleGFtcGxlLCB0aGlz
IGxlYWRzIHRvIGFuIGVtdWxhdGVkIGRldmljZQ0Kd2l0aCBldGgwIGFuZCBldGgxOg0KDQpRQl9O
RVRXT1JLX0RFVklDRV9wcmVwZW5kID0gIiBcDQogICAgLWRldmljZSB2aXJ0aW8tbmV0aS1kZXZp
Y2UsbWFjPTUyOjU0OjAwOjEyOjM0OjAzIFwNCiINCg0KT24gc29tZSBlbXVsYXRlZCBOSUMgdHlw
ZXMsIFFlbXUgYW5kIHRoZSBrZXJuZWwgZW51bWVyYXRlIHRoZSBldGhzIGluDQp0aGUgZ3Vlc3Qg
aW4gcmV2ZXJzZSBvcmRlciB0byBob3cgdGhlIGRldmljZSBwYXJhbWV0ZXJzIGFyZSBwYXNzZWQg
dG8NClFlbXUuIFNvIGluIHRoaXMgY2FzZSBpdCBpcyBpbXBvcnRhbnQgdGhhdCB0aGUgYWRkaXRp
b25hbCBOSUNzIGFyZQ0KcHJlcGVuZGVkIHRvIHRoZSAtZGV2aWNlIHBhcmFtZXRlciwgd2hpY2gg
Z2V0cyBhdXRvbWF0aWNhbGx5IGFkZGVkIGJ5DQpRZW11LiBPdGhlcndpc2UsIHRoZSBpbnRlcmZh
Y2UgZXRoMSB3aWxsIGJlIGNvbm5lY3RlZCB0byB0aGUgaG9zdCwgYnV0DQpldGgwIHdpbGwgYmUg
YXNzaWduZWQgdGhlIElQIGFkZHJlc3MgMTkyLjE2OC43LngsIHdoaWNoIG9idmlvdXNseSBkb2Vz
DQpub3Qgd29yay4NCg0KV2hlbiBib290aW5nIFFlbXUgd2l0aCB0d28gTklDcywgYnV0IG9ubHkg
b25lIHNldCBvZiBuZXR3b3JrDQpjb25maWd1cmF0aW9uIHBhcmFtZXRlcnMgcGFzc2VkIHRvIHRo
ZSBrZXJuZWwsIHRoZSBrZXJuZWwgc2VlbXMgdG8NCnNlYXJjaCBmb3IgYSBjb25maWd1cmF0aW9u
IGZvciBhbGwgTklDcy4gVGhpcyBkZWxheXMgdGhlIGJvb3QgcHJvY2Vzcw0KZm9yIGEgdmVyeSBs
b25nIHRpbWUuDQoNClRoaXMgY2hhbmdlIHNvbHZlcyB0aGUgdGltZW91dCBwcm9ibGVtLiBUZXN0
ZWQgd2l0aDoNCiBvZS1zZWxmdGVzdCAtLXJ1bi10ZXN0cyBydW5xZW11DQotLS0NCiBzY3JpcHRz
L3J1bnFlbXUgfCAyICstDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9zY3JpcHRzL3J1bnFlbXUgYi9zY3JpcHRzL3J1bnFlbXUN
CmluZGV4IGRkMGFhNGIyOGYuLmQzNGY4ZWVjMjUgMTAwNzU1DQotLS0gYS9zY3JpcHRzL3J1bnFl
bXUNCisrKyBiL3NjcmlwdHMvcnVucWVtdQ0KQEAgLTExNDcsNyArMTE0Nyw3IEBAIGNsYXNzIEJh
c2VDb25maWcob2JqZWN0KToNCiAgICAgICAgIGNsaWVudCA9IGdhdGV3YXkgKyAxDQogICAgICAg
ICBpZiBzZWxmLmZzdHlwZSA9PSAnbmZzJzoNCiAgICAgICAgICAgICBzZWxmLnNldHVwX25mcygp
DQotICAgICAgICBuZXRjb25mID0gIjE5Mi4xNjguNy4lczo6MTkyLjE2OC43LiVzOjI1NS4yNTUu
MjU1LjAiICUNCihjbGllbnQsIGdhdGV3YXkpDQorICAgICAgICBuZXRjb25mID0gIjE5Mi4xNjgu
Ny4lczo6MTkyLjE2OC43LiVzOjI1NS4yNTUuMjU1LjA6OmV0aDAiICUNCihjbGllbnQsIGdhdGV3
YXkpDQogICAgICAgICBsb2dnZXIuaW5mbygiTmV0d29yayBjb25maWd1cmF0aW9uOiAlcyIsIG5l
dGNvbmYpDQogICAgICAgICBzZWxmLmtlcm5lbF9jbWRsaW5lX3NjcmlwdCArPSAiIGlwPSVzIiAl
IG5ldGNvbmYNCiAgICAgICAgIG1hYyA9ICIlcyUwMngiICUgKHNlbGYubWFjX3RhcCwgY2xpZW50
KQ0K

