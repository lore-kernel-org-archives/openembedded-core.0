Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF420C54EE9
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 17:14:45 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.246.1663089280293931045
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 10:14:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=mU3pRMWN;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1663089281;
  x=1694625281;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=10gfGZ/cGsA+vX5MXIuBl7+CnvMWYafN5kxv+1UGWzw=;
  b=mU3pRMWN/OH9vvtHdpFBWghM2GhiBO0JC2OhMbquFUnwBdYsSF6I6bVy
   EuyYiYT0MuWlQQM/dzDXB6L/Rl7lwcKlTANuIuzKg3J56Ie6bUHfwzLpc
   LSVJR5FVc+c+SrzvQd5D7JjHmrG0sgUhVpAut4hTF43dhyb2i95cIPve7
   yMN1d5oeE19o5Wd2/V6xT6lT2yGp621LJOFwbur9R87noC7s6OQ7x88an
   INzTv5Rc0L4sqGMlCYyNyQtduNNfdbweAQrYsuh6Wyi7+4Qfbj4UrUttk
   hUeXiNdTQaEG1Ul9uYGEAxhox0fXSPtUlQGTJFQ6XP85X0I7UnQZD/zs5
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton
	<ross.burton@arm.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "schnitzeltony@gmail.com" <schnitzeltony@gmail.com>
Subject: RE: [OE-core] [PATCH] libxml2: don't override XML_CATALOG_FILES in
 xmllint wrapper if already set
Thread-Topic: [OE-core] [PATCH] libxml2: don't override XML_CATALOG_FILES in
 xmllint wrapper if already set
Thread-Index: AQHYxGpbMA/2aMkiF0ihc6gXBUX2q63bj4GEgAINMiA=
Date: Tue, 13 Sep 2022 17:14:37 +0000
Message-ID: <9bcbd925bbfd4d8480a759c31a96b1e5@axis.com>
References: <20220909163640.1985612-1-ross.burton@arm.com>
	 <17135317F9CABC3C.4025@lists.openembedded.org>
	 <1713EE7A59F012D9.1776@lists.openembedded.org>
 <c36da2945102cf2e0b90562bedcedb83687cc3fd.camel@linuxfoundation.org>
In-Reply-To: 
 <c36da2945102cf2e0b90562bedcedb83687cc3fd.camel@linuxfoundation.org>
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
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 17:14:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170604

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgUmljaGFyZCBQdXJkaWUNCj4gU2VudDogZGVuIDEyIHNlcHRl
bWJlciAyMDIyIDEwOjQ0DQo+IFRvOiBSb3NzIEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT47
IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gQ2M6IHNjaG5pdHpl
bHRvbnlAZ21haWwuY29tDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBsaWJ4bWwy
OiBkb24ndCBvdmVycmlkZSBYTUxfQ0FUQUxPR19GSUxFUyBpbiB4bWxsaW50IHdyYXBwZXIgaWYg
YWxyZWFkeSBzZXQNCj4gDQo+IE9uIFN1biwgMjAyMi0wOS0xMSBhdCAyMzoyMSArMDEwMCwgUmlj
aGFyZCBQdXJkaWUgdmlhDQo+IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+ID4gT24g
RnJpLCAyMDIyLTA5LTA5IGF0IDIzOjU0ICswMTAwLCBSaWNoYXJkIFB1cmRpZSB2aWENCj4gPiBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiA+ID4gT24gRnJpLCAyMDIyLTA5LTA5IGF0
IDE3OjM2ICswMTAwLCBSb3NzIEJ1cnRvbiB3cm90ZToNCj4gPiA+ID4gVGhlIEtERSBidWlsZCB1
c2VzIGN1c3RvbSBjYXRhbG9ncyBieSBzZXR0aW5nIFhNTF9DQVRBTE9HX0ZJTEVTLCBzbyB0aGlz
DQo+ID4gPiA+IHdyYXBwZXIgc2hvdWxkIG5vdCBvdmVycmlkZSB0aGF0IHZhbHVlIGlmIGl0IGhh
cyBhbHJlYWR5IGJlZW4gc2V0Lg0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBSb3Nz
IEJ1cnRvbiA8cm9zcy5idXJ0b25AYXJtLmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+ICBtZXRh
L3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMl8yLjkuMTQuYmIgfCAyICstDQo+ID4gPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPiA+ID4NCj4g
PiA+ID4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyXzIuOS4x
NC5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyXzIuOS4xNC5iYg0KPiA+ID4g
PiBpbmRleCAyYjIyODllMzhhNi4uMTY1YzkyZDQxMTQgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL21l
dGEvcmVjaXBlcy1jb3JlL2xpYnhtbC9saWJ4bWwyXzIuOS4xNC5iYg0KPiA+ID4gPiArKysgYi9t
ZXRhL3JlY2lwZXMtY29yZS9saWJ4bWwvbGlieG1sMl8yLjkuMTQuYmINCj4gPiA+ID4gQEAgLTEy
MSw3ICsxMjEsNyBAQCBkb19pbnN0YWxsOmFwcGVuZDpjbGFzcy1uYXRpdmUgKCkgew0KPiA+ID4g
PiAgCSMgRG9jcyBhcmUgbm90IG5lZWRlZCBpbiB0aGUgbmF0aXZlIGNhc2UNCj4gPiA+ID4gIAly
bSAke0R9JHtkYXRhZGlyfS9ndGstZG9jIC1yZg0KPiA+ID4gPg0KPiA+ID4gPiAtCWNyZWF0ZV93
cmFwcGVyICR7RH0ke2JpbmRpcn0veG1sbGludCBYTUxfQ0FUQUxPR19GSUxFUz0ke3N5c2NvbmZk
aXJ9L3htbC9jYXRhbG9nDQo+ID4gPiA+ICsJY3JlYXRlX3dyYXBwZXIgJHtEfSR7YmluZGlyfS94
bWxsaW50ICdYTUxfQ0FUQUxPR19GSUxFUz0ke1hNTF9DQVRBTE9HX0ZJTEVTOi0ke3N5c2NvbmZk
aXJ9L3htbC9jYXRhbG9nfScNCj4gPiA+ID4gIH0NCj4gPiA+DQo+ID4gPiBodHRwczovL2F1dG9i
dWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdHlwaG9vbi8jL2J1aWxkZXJzLzY5L2J1aWxkcy81ODIz
L3N0ZXBzLzI0L2xvZ3Mvc3RkaW8NCj4gPg0KPiA+IERlcGVuZGVuY3kgb24gdmFyaWFibGUgWE1M
X0NBVEFMT0dfRklMRVM6LS9tZWRpYS9idWlsZDEvcG9reS9idWlsZC1zdC0yODIyODQvdG1wLXNz
dGF0ZXNhbWVoYXNoL3dvcmsveDg2XzY0LWxpbnV4L2xpYnhtbDItbmF0aXZlLzIuOS4xNC1yMC9y
ZWNpcGUtc3lzcm9vdC1uYXRpdmUvZXRjL3htbC9jYXRhbG9nIHdhcyBhZGRlZA0KPiA+IERlcGVu
ZGVuY3kgb24gVmFyaWFibGUgWE1MX0NBVEFMT0dfRklMRVM6LS9tZWRpYS9idWlsZDEvcG9reS9i
dWlsZC1zdC0yODIyODQvdG1wLXNzdGF0ZXNhbWVoYXNoMi93b3JrL3g4Nl82NC1saW51eC9saWJ4
bWwyLW5hdGl2ZS8yLjkuMTQtcjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL2V0Yy94bWwvY2F0YWxv
ZyB3YXMgcmVtb3ZlZA0KPiA+DQo+ID4gaS5lLiBpdCBpcyBleHBhbmRpbmcgdGhlIHZhcmlhYmxl
IGluIHRoZSBrZXluYW1lIQ0KPiANCj4gSSB0d2Vha2VkIHRoZSBwYXRjaCB0byBleGNsdWRlIHRo
aXMgdmFyaWFibGUgZm9yIG5vdy4gV2UgcHJvYmFibHkgbmVlZA0KPiB0byB0aGluayBhIGJpdCBt
b3JlIGFib3V0IHdoYXQgYml0YmFrZSBpcyBjb25zaWRlcmluZyBhIHZhcmlhYmxlIG5hbWUNCj4g
dGhvdWdoLi4uDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJkDQoNCkhhc24ndCB0aGlzIGFs
d2F5cyBiZWVuIHRoZSBjYXNlIGZvciBzaGVsbCB2YXJpYWJsZXMgd2hlcmUgeW91IG5lZWQgdG8g
DQp1c2UgJHsuLi59IGZvciBvbmUgcmVhc29uIG9yIGFub3RoZXI/IEkga25vdyBJIGhhdmUgY2hh
bmdlZCBhIG51bWJlciBvZiANCiIke3NvbWVfc2hlbGxfdmFyaWFibGV9IiB0byAiJHNvbWVfc2hl
bGxfdmFyaWFibGUiIG92ZXIgdGhlIHllYXJzIHRvIA0KbWl0aWdhdGUgaXQgYSBsaXR0bGUsIGJ1
dCB0aGF0IGlzIG9idmlvdXNseSBub3QgcG9zc2libGUgZm9yIG5vbi10cml2aWFsIA0KY2FzZXMg
b2Ygc2hlbGwgcGFyYW1ldGVyIGV4cGFuc2lvbnMuDQoNCi8vUGV0ZXINCg0K

