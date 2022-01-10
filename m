Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E9D7C433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 20:33:49 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.37642.1641846827585682723
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 12:33:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=FTK4jI6u;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1641846827;
  x=1673382827;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=HuAcmAIUnkxX5mv4HmoqnT0xNr6mUwmeJDFqB0dNYw0=;
  b=FTK4jI6uwJ7n9yLazQb51tGVN0deXe4LOxN/t1vEiChWLaTmRIAav4K5
   LGVuY7qRG/OGmWMTSUPa6A55sIreNVkD+THmFqqVc/kMdqTvBSVZUqvI9
   J3U2iSuqSOyMP8+98YusiZU2FglcxoPSCq6LaV+ILSLTHPjSoF6pPLYD6
   oYnw08u4i3R43/8kjjN4Yt1paW1fpAu0cKQs2VXSTRw2Y/ip80Xe84Z3z
   dTMw2szXutUlZxkY48lXB5d2NCXglslZxShb7vNkyJaw+9eRIno1KPH5M
   flqwCFiZ1UMKIKZTTkIQM2ix5TfwhiAmFLbM3WzUjRrDZOIScIe5LPSjR
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] rootfs-postcommands.bbclass: Change the
 default.target location
Thread-Topic: [OE-core] [PATCH] rootfs-postcommands.bbclass: Change the
 default.target location
Thread-Index: AQHYBjju749ye0nDskCnUN48AJu3Aaxcq3Cw
Date: Mon, 10 Jan 2022 20:33:44 +0000
Message-ID: <a15707912cbd4ec39883439a542dccf7@axis.com>
References: <20220110153733.29006-1-pkj@axis.com>
 <71cf0c9e5896ea005d3cfb75a67e8982f2a9aff0.camel@linuxfoundation.org>
In-Reply-To: 
 <71cf0c9e5896ea005d3cfb75a67e8982f2a9aff0.camel@linuxfoundation.org>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 20:33:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160377

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogZGVuIDEwIGphbnVhcmkg
MjAyMiAxNjo0NA0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRA
YXhpcy5jb20+OyBvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0K
PiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSF0gcm9vdGZzLXBvc3Rjb21tYW5kcy5iYmNs
YXNzOiBDaGFuZ2UgdGhlDQo+IGRlZmF1bHQudGFyZ2V0IGxvY2F0aW9uDQo+IA0KPiBPbiBNb24s
IDIwMjItMDEtMTAgYXQgMTY6MzcgKzAxMDAsIFBldGVyIEtqZWxsZXJzdGVkdCB3cm90ZToNCj4g
PiBSYXRoZXIgdGhhbiBhZGRpbmcgYSBkZWZhdWx0LnRhcmdldCBpbiAvZXRjL3N5c3RlbWQvc3lz
dGVtLCBtb2RpZnkgdGhlDQo+ID4gb25lIGluIC91c3IvbGliL3N5c3RlbWQvc3lzdGVtLg0KPiAN
Cj4gV2h5Pw0KPiANCj4gKHRoZSBjb21taXQgbWVzc2FnZSBuZWVkcyB0byBzYXkgd2h5IGFzIHdl
bGwgYXMgd2hhdCBpdCBkb2VzKQ0KDQpJIHRob3VnaHQgaXQgZGlkIChhdm9pZCBoYXZpbmcgdHdv
IGxpbmtzIHdoZXJlIG9uZSB3aWxsIHN1ZmZpY2UpLg0KDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBS
aWNoYXJkDQoNClRoaW5raW5nIGEgYml0IG1vcmUgYWJvdXQgdGhpcyB0aG91Z2gsIEkgYW0gbm90
IHN1cmUgSSBjYW4gd2luLiBXZSBoYXZlIA0KaGFkIGEgY29ycmVzcG9uZGluZyBsb2NhbCBwYXRj
aCBmb3IgbWFueSB5ZWFycywgYW5kIGl0IHNlZW1zIG5hdHVyYWwgdG8gDQpoYXZlIHRoZSBsaW5r
IG9ubHkgaW4gL3Vzci9saWIvc3lzdGVtZC9zeXN0ZW0uIEhvd2V2ZXIsIGZvciBhIHN5c3RlbSB0
aGF0IA0KdXNlcyBwYWNrYWdlIG1hbmFnZW1lbnQgKHdoaWNoIHdlIGRvIG5vdCksIGl0IG1heSBu
b3QgYmUgYXMgbmF0dXJhbCwgDQpzaW5jZSB0aGVuIHVwZGF0aW5nIHRoZSBzeXN0ZW1kIHBhY2th
Z2UgaW4gcnVudGltZSB3b3VsZCByZXN0b3JlIHN5c3RlbWQncyANCmRlZmF1bHQudGFyZ2V0IHJh
dGhlciB0aGFuIHRoZSBvbmUgdGhhdCB3YXMgaW5zdGFsbGVkIHdpdGggdGhlIHN5c3RlbS4NCg0K
V291bGQgeW91IGFjY2VwdCBhIHBhdGNoIHRoYXQgaW5zdGVhZCBpbnRyb2R1Y2VzIGEgdmFyaWFi
bGUgZm9yIHRoZSBwYXRoIA0KdG8gdGhlIGRlZmF1bHQudGFyZ2V0IGxpbmssIHdpdGggdGhlIGZv
bGxvd2luZyBkZWZpbml0aW9uOg0KDQpTWVNURU1EX0RFRkFVTFRfVEFSR0VUX1BBVEggPz0gIiR7
QGJiLnV0aWxzLmNvbnRhaW5zKCdJTUFHRV9GRUFUVVJFUycsICdwYWNrYWdlLW1hbmFnZW1lbnQn
LCAnJHtzeXNjb25mZGlyfS9zeXN0ZW1kL3N5c3RlbScsICcke3N5c3RlbWRfc3lzdGVtX3VuaXRk
aXJ9JywgZH0iDQoNClRoYXQgd291bGQgbWFrZSBpdCByZWFzb25hYmx5IHNhbmUgYnkgZGVmYXVs
dCwgYnV0IHN0aWxsIGFsbG93IGl0IHRvIGJlIA0Kb3ZlcnJpZGRlbiBpZiB5b3UgaGF2ZSBvdGhl
ciBpZGVhcyBmb3IgeW91ciBzeXN0ZW0uDQoNCi8vUGV0ZXINCiANCg==

