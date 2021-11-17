Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 404DFC433FE
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 18:24:53 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.11163.1637173491699416006
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 10:24:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=IHjhzZ0e;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1637173492;
  x=1668709492;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mvtAoi5s9N8B3MiHnFGLJRiYmbeiHy/asgkKuQeGgIE=;
  b=IHjhzZ0em5e30n4+HVcNDlYv3o5Yn7FJK7BBfi1v6nVlhvCJtDTKh4Gw
   d4ALd5Y6siX5WR5zkJMgK95lcKwQux4Y0x+KEAdSQ3PEr8+M/FdyR9X9/
   GecGZv+IuGfyINCr3Utr4DoeDqTu/Aq6ijB8uVF4rORTvDsdRn9IfxbIh
   2LFUdgmzAtJE0AeRYZpyAAsR/Zwi/HG2wUXqgoVRIvs8bXfbGIuT9Hdpo
   LPyH/NhKtm+VkAT8J+evVA5AjNbGEtgug3sEGczFKnwUs9epTStiq0ofS
   vuN+Jmlo8LsCpiNCwk0Gbpx76M0j9aEO03mVDnUweqQo3cyjjoKk6FFVP
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 2/2] glibc: Append files instead of making then
 part of main SRC_URI
Thread-Topic: [OE-core] [PATCH 2/2] glibc: Append files instead of making then
 part of main SRC_URI
Thread-Index: AQHX29QobDXQjyH9NEGUShsVW7YhU6wH64MAgAAAqQCAABt1IA==
Date: Wed, 17 Nov 2021 18:24:43 +0000
Message-ID: <37589655d6014c378b65665345e8534a@axis.com>
References: <20211117165646.70015-1-raj.khem@gmail.com>
 <20211117165646.70015-2-raj.khem@gmail.com>
 <dbfbf7aee5bb837deab0f04d16bfe60f514fb72f.camel@linuxfoundation.org>
 <CAMKF1sr0f61MFBwQ=xqwe34=znuR2HgtOnHKjb_ncQhU0fMaWQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sr0f61MFBwQ=xqwe34=znuR2HgtOnHKjb_ncQhU0fMaWQ@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 18:24:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158453

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgS2hlbSBSYWoNCj4gU2VudDogZGVuIDE3IG5vdmVtYmVyIDIw
MjEgMTg6NDENCj4gVG86IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5k
YXRpb24ub3JnPg0KPiBDYzogUGF0Y2hlcyBhbmQgZGlzY3Vzc2lvbnMgYWJvdXQgdGhlIG9lLWNv
cmUgbGF5ZXIgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+IFN1
YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIDIvMl0gZ2xpYmM6IEFwcGVuZCBmaWxlcyBpbnN0
ZWFkIG9mIG1ha2luZyB0aGVuIHBhcnQgb2YgbWFpbiBTUkNfVVJJDQo+IA0KPiBPbiBXZWQsIE5v
diAxNywgMjAyMSBhdCA5OjM4IEFNIFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51
eGZvdW5kYXRpb24ub3JnPiB3cm90ZToNCj4gPg0KPiA+IE9uIFdlZCwgMjAyMS0xMS0xNyBhdCAw
ODo1NiAtMDgwMCwgS2hlbSBSYWogd3JvdGU6DQo+ID4gPiBUaGlzIHdpbGwgaGVscCBsYXRlciB3
aXRoIHVzaW5nIGRldnVwc3RyZWFtDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogS2hlbSBS
YWogPHJhai5raGVtQGdtYWlsLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gIG1ldGEvcmVjaXBlcy1j
b3JlL2dsaWJjL2dsaWJjXzIuMzQuYmIgfCAxMCArKysrKystLS0tDQo+ID4gPiAgMSBmaWxlIGNo
YW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gPiA+DQo+ID4gPiBkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYmMvZ2xpYmNfMi4zNC5iYiBiL21ldGEvcmVj
aXBlcy1jb3JlL2dsaWJjL2dsaWJjXzIuMzQuYmINCj4gPiA+IGluZGV4IDcyMDY0NzcyNzg5Li43
Nzg4OThmMTk3OSAxMDA2NDQNCj4gPiA+IC0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2ds
aWJjXzIuMzQuYmINCj4gPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWJjL2dsaWJjXzIu
MzQuYmINCj4gPiA+IEBAIC0yOSwxMCArMjksNiBAQCBOQVRJVkVTREtGSVhFUzpjbGFzcy1uYXRp
dmVzZGsgPSAiXA0KPiA+ID4gICINCj4gPiA+DQo+ID4gPiAgU1JDX1VSSSA9ICAiJHtHTElCQ19H
SVRfVVJJfTticmFuY2g9JHtTUkNCUkFOQ0h9O25hbWU9Z2xpYmMgXA0KPiA+ID4gLSAgICAgICAg
ICAgZmlsZTovL2V0Yy9sZC5zby5jb25mIFwNCj4gPiA+IC0gICAgICAgICAgIGZpbGU6Ly9nZW5l
cmF0ZS1zdXBwb3J0ZWQubWsgXA0KPiA+ID4gLSAgICAgICAgICAgZmlsZTovL21ha2VkYnMuc2gg
XA0KPiA+ID4gLSAgICAgICAgICAgXA0KPiA+ID4gICAgICAgICAgICAgJHtOQVRJVkVTREtGSVhF
U30gXA0KPiA+ID4gICAgICAgICAgICAgZmlsZTovLzAwMDktZnNsLWU1MDAtZTU1MDAtZTY1MDAt
NjAzZS1mc3FydC1pbXBsZW1lbnRhdGlvbi5wYXRjaCBcDQo+ID4gPiAgICAgICAgICAgICBmaWxl
Oi8vMDAxMC1wcGMtc3FydC1GaXgtdW5kZWZpbmVkLXJlZmVyZW5jZS10by1fX3NxcnRfZmluaXRl
LnBhdGNoIFwNCj4gPiA+IEBAIC02MCw2ICs1NiwxMiBAQCBTUkNfVVJJID0gIiR7R0xJQkNfR0lU
X1VSSX07YnJhbmNoPSR7U1JDQlJBTkNIfTtuYW1lPWdsaWJjIFwNCj4gPiA+ICAgICAgICAgICAg
IGZpbGU6Ly8wMDAxLWZpeC1jcmVhdGUtdGhyZWFkLWZhaWxlZC1pbi11bnByaXZpbGVnZWQtcHJv
Y2Vzcy1CWi0ucGF0Y2ggXA0KPiA+ID4gICAgICAgICAgICAgZmlsZTovL0NWRS0yMDIxLTQzMzk2
LnBhdGNoIFwNCj4gPiA+ICAgICAgICAgICAgICINCj4gPiA+ICsjIFVzZSBhcHBlbmQgaW5zdGVh
ZCBvZiArPSB0aGF0IHdheSBwYXRjaCBpcyBhcHBsaWVkIHdpdGggZGV2dXBzdHJlYW0gdG9vDQo+
ID4gPiArU1JDX1VSSTphcHBlbmQgPSAiXA0KPiA+ID4gKyAgICAgICAgICAgZmlsZTovL2V0Yy9s
ZC5zby5jb25mIFwNCj4gPiA+ICsgICAgICAgICAgIGZpbGU6Ly9nZW5lcmF0ZS1zdXBwb3J0ZWQu
bWsgXA0KPiA+ID4gKyAgICAgICAgICAgZmlsZTovL21ha2VkYnMuc2ggXA0KPiA+ID4gKyINCj4g
PiA+ICBTID0gIiR7V09SS0RJUn0vZ2l0Ig0KPiA+ID4gIEIgPSAiJHtXT1JLRElSfS9idWlsZC0k
e1RBUkdFVF9TWVN9Ig0KPiA+ID4NCj4gPg0KPiA+IEknbSBhZnJhaWQgSSByZWFsbHkgZGlzbGlr
ZSB0aGVzZSBraW5kcyBvZiBwYXRjaGVzLiBXZSBuZWVkIHRvIGRvDQo+ID4gc29tZXRoaW5nIHdp
dGggb3VyIHN5bnRheCBzbyB3ZSBkb24ndCBoYXZlIHRvIGp1bXAgdGhyb3VnaCB3ZWlyZCANCj4g
PiBob29wcyBsaWtlIHRoaXMuIFRoZXNlIGtpbmQgb2Y+IGNoYW5nZXMgbG9vayByZWFsbHkgZnJh
Z2lsZSBhbmQgDQo+ID4gZWFzeSB0byBicmVhay4NCj4gDQo+IHdoYXQgZG8geW91IHN1Z2dlc3Qg
YXMgYSBiZXR0ZXIgYXBwcm9hY2gNCg0KT25lIHdheSB3b3VsZCBiZSB0byBpbnRyb2R1Y2UsIGUu
Zy46DQoNClNSQ19VUklfQ09NTU9OID0gIiBcDQogICAgZmlsZTovL2V0Yy9sZC5zby5jb25mIFwN
CiAgICBmaWxlOi8vZ2VuZXJhdGUtc3VwcG9ydGVkLm1rIFwNCiAgICBmaWxlOi8vbWFrZWRicy5z
aCBcDQoiDQoNCmFuZCB0aGVuIGFkZCAke1NSQ19VUklfQ09NTU9OfSB0byBib3RoIFNSQ19VUkkg
YW5kIFNSQ19VUkk6Y2xhc3MtZGV2dXBzdHJlYW0uDQoNCj4gPiBFZmZlY3RpdmVseSBpdCBpcyBh
biBhcm1zIHJhY2UgdG8gdHVybiBldmVyeXRoaW5nIGludG8gYW4gYXBwZW5kLCB0aGVuDQo+ID4g
bm90aGluZyBjYW4gZGlzYWJsZSBpdC4NCj4gPg0KPiA+IENoZWVycywNCj4gPg0KPiA+IFJpY2hh
cmQNCg0KLy9QZXRlcg0KDQo=

