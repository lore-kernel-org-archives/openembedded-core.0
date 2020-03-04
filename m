Return-Path: <adrian.freihofer@siemens.com>
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
	(mail-eopbgr00085.outbound.protection.outlook.com [40.107.0.85])
	by mail.openembedded.org (Postfix) with ESMTP id 8F79A611EC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 08:33:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=IA7Uh7z2KNQTcpQEpdtgdzMYeAK1Q1ZG3UlNHf9zwUbMLwKN8AZaZnqY+jUZCUbai1kgWS8yo155101Gfw7clS3UjeKz34oXfSKdL6wucYTfkSaeS2P1fh7tDiRBoKIF4dI+quYNVVuoSpt9ZgJNHSCsrnKobAzQ/cI1ktTtYHClf4mfhIQWY6YnHwH65twmQ75VRxdSj+ldeT3gi99gVddCQWUjW968C14MLs/1m8RpUKHVHxAGeQpFi7m2pJMq3CgC3IN11ygU3f/hcO9zHWx78bzMrfGu72foy+8PLOHA6IWoLtwBsR9qMuRzJCSHqqxMhOSKZmrJMTi0l6dYpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=zHuLvafelQ8UJDZDsrJ/z3y9k9KkPBQZ99C26gPQseo=;
	b=H5d6NHFTa8SxEwQV8HzH1De9dKica6GqRaiqLITs2qbd6EVSvr/dyWvZfsfYcQwH3qpSbTqMSHeZrE6CFj417/Cky+dKWERjv/VvQpNUe74xlF1sgB2Z5f8aH7dzEcOp6kig7vN8xyv5ScxxgX4LCjvSOMfngBbuT4pJAQ519pumPBSIxd0K2CeoRt+yhpRPDxe2yxm8yOvSS2067gW6Q5YXy46LHozmjUy5XZV8ZxhHRfou4GQxHK4/MrzLSksOfR5Q+U0ZUe7w+Za3zgmwOsJkIDVi/LCCFH9WnV3PtGvgcnYn9KMuCRYoJRQSrqNTEs+Z6E/pAkoLTAJORHYdiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=siemens.com;
	dmarc=pass action=none header.from=siemens.com; 
	dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=zHuLvafelQ8UJDZDsrJ/z3y9k9KkPBQZ99C26gPQseo=;
	b=eiCzj0w79QjMxNScX0JuPgAYXQ0sQBT0duufoyMBSJ8JZwm4QIikGUkEcsvT475Z3D3CLR3JlN2PX5frabThT/tgFKtZBJ+ZB/eXp86GCq66w0VK3JXRlis1kMUa/Zi/r7beeiGkv2LAZVtxiobcN4Vv2fLRzhp0se4XykJ0pEE=
Received: from PR3PR10MB3867.EURPRD10.PROD.OUTLOOK.COM (20.180.104.80) by
	PR3PR10MB3819.EURPRD10.PROD.OUTLOOK.COM (20.180.107.86) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2772.16; Wed, 4 Mar 2020 08:33:07 +0000
Received: from PR3PR10MB3867.EURPRD10.PROD.OUTLOOK.COM
	([fe80::d1d3:afd:da50:b311]) by PR3PR10MB3867.EURPRD10.PROD.OUTLOOK.COM
	([fe80::d1d3:afd:da50:b311%5]) with mapi id 15.20.2772.019;
	Wed, 4 Mar 2020 08:33:07 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH v2] runqemu: support multiple NICs
Thread-Index: AQHV8f+HTM5RJIbIAEuGciirMsFt0w==
Date: Wed, 4 Mar 2020 08:33:07 +0000
Message-ID: <a96c65a5e8246d44240511aaf666889fd983b8c8.camel@siemens.com>
References: <2b48cd168e6050723f4c30b059098b319e5b6df5.camel@siemens.com>
Accept-Language: de-CH, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=adrian.freihofer@siemens.com; 
x-originating-ip: [165.225.72.111]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4a22663a-dc51-4931-612b-08d7c016aa6c
x-ms-traffictypediagnostic: PR3PR10MB3819:
x-microsoft-antispam-prvs: <PR3PR10MB38197D25D2B8F7D7DB34FC178EE50@PR3PR10MB3819.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 0332AACBC3
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10001)(10009020)(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(199004)(189003)(6506007)(478600001)(6486002)(36756003)(86362001)(2906002)(8936002)(6916009)(55236004)(5660300002)(316002)(81156014)(81166006)(8676002)(6512007)(26005)(66556008)(91956017)(66446008)(2616005)(71200400001)(186003)(66946007)(76116006)(64756008)(66476007);
	DIR:OUT; SFP:1101; SCL:1; SRVR:PR3PR10MB3819;
	H:PR3PR10MB3867.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: siemens.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fmoxBSqs7s84oBQAKwbJ8ajg0A2JJAOsA6b5Y1EzoHQsEuoYWRST2LoPV5RwZ5nO9MN3zTIImQiEco3UF81K1kUR2nZ3B3fV6UedMxWS3hvVoG0dmA3vGc9eH8Mt/9i+5KHG2iQZBJQstEMQ5VBcKNexAXaV8X4cbClP+d7Teg9hvE/cBKW6QuGgBPGbYUcMN070OC5CrWUXROoDHh6rixL5XM8lo8Wc/D3YQASseatP8a6GvpzaMu7N0lQhFomae3WLJh+kjttWDwKWbhGlilWaWteSO7gpO2JVaejjMnHxYHc/z4WlPpw3IaJSQTcuCVd7EWRUmr5Zvl7qQZLWNuAIzHb+oFEg4+voDqSb3ax12LH5pls4RvS/aYuu8LLK/FkXyvvpybTeFnulgrKKmwHnVAYmIOzajK3rxKjQv0MbRaFYvo5v8/9BWcc05bl7RaNVE2jRWOUgVzUDqplqbc9Rpu6iK96N/Olvfv+q3OvF6x77jdaRtLf5znfuZkXABLZkG4hhy5SLjiSC62KOhN/szFvzOkfQm+Yaa675d/8tyDo9tzEn2WQd/rt1GQ7H6sEPT66nKO/gsFvUNTZWPwwe+pLHD7qThIupZmhTW0MuCAElxdGG0oLOBIyV5WAzoO1YXZuOaaGiLLG6kTIaRQ==
x-ms-exchange-antispam-messagedata: xzhBEo1pVspgponTKXGzxcg5RCcGJCecTJ9bmiWcG2mflqrGi3Shu6XtdUHMgdqNdOobsrQrhTXBm5kdlf1w6pQJgb2sbYgk9WAV1AwgRbZH9CBBfE2XR12N3cp4pn2W0WDLYCkkZ4EFyn4HI2gC7g==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a22663a-dc51-4931-612b-08d7c016aa6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2020 08:33:07.5813 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lzHG8i0a7MORPsZYNvcP80fcV8veWIaGtKEqoXv5qqLzQWdS/X8867GlxsefJLZ/QCq8gtwauaRmY9XxqHb9JZ7aPZ8vFeI4eS5x72lG+Q8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB3819
Subject: [PATCH v2] runqemu: support multiple NICs
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
X-List-Received-Date: Wed, 04 Mar 2020 08:33:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <43AC0DA1E3A0CB4DA0BD58C1B1C96821@EURPRD10.PROD.OUTLOOK.COM>
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
ZWQgd2l0aDoNCiBvZS1zZWxmdGVzdCAtLXJ1bi10ZXN0cyBydW5xZW11DQoNClNpZ25lZC1vZmYt
Ynk6IEFkcmlhbiBGcmVpaG9mZXIgPGFkcmlhbi5mcmVpaG9mZXIgYXQgc2llbWVucy5jb20+DQot
LS0NCiBzY3JpcHRzL3J1bnFlbXUgfCAyICstDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9zY3JpcHRzL3J1bnFlbXUgYi9zY3Jp
cHRzL3J1bnFlbXUNCmluZGV4IGRkMGFhNGIyOGYuLmQzNGY4ZWVjMjUgMTAwNzU1DQotLS0gYS9z
Y3JpcHRzL3J1bnFlbXUNCisrKyBiL3NjcmlwdHMvcnVucWVtdQ0KQEAgLTExNDcsNyArMTE0Nyw3
IEBAIGNsYXNzIEJhc2VDb25maWcob2JqZWN0KToNCiAgICAgICAgIGNsaWVudCA9IGdhdGV3YXkg
KyAxDQogICAgICAgICBpZiBzZWxmLmZzdHlwZSA9PSAnbmZzJzoNCiAgICAgICAgICAgICBzZWxm
LnNldHVwX25mcygpDQotICAgICAgICBuZXRjb25mID0gIjE5Mi4xNjguNy4lczo6MTkyLjE2OC43
LiVzOjI1NS4yNTUuMjU1LjAiICUNCihjbGllbnQsIGdhdGV3YXkpDQorICAgICAgICBuZXRjb25m
ID0gIjE5Mi4xNjguNy4lczo6MTkyLjE2OC43LiVzOjI1NS4yNTUuMjU1LjA6OmV0aDAiICUNCihj
bGllbnQsIGdhdGV3YXkpDQogICAgICAgICBsb2dnZXIuaW5mbygiTmV0d29yayBjb25maWd1cmF0
aW9uOiAlcyIsIG5ldGNvbmYpDQogICAgICAgICBzZWxmLmtlcm5lbF9jbWRsaW5lX3NjcmlwdCAr
PSAiIGlwPSVzIiAlIG5ldGNvbmYNCiAgICAgICAgIG1hYyA9ICIlcyUwMngiICUgKHNlbGYubWFj
X3RhcCwgY2xpZW50KQ0KLS0gDQoNClNpZW1lbnMgU2Nod2VpeiBBRywgU21hcnQgSW5mcmFzdHJ1
Y3R1cmUNClNJIEJQIFImRCBaRyBGVyBDQ1ANClRoZWlsZXJzdHJhc3NlIDFhDQo2MzAwIFp1Zywg
U3dpdHplcmxhbmQNCk1vYmlsZTogKzQxIDc5NjgxOTU5Ng0KDQoNCg==

