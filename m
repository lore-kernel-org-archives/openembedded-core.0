Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D64CAC4332F
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 21:21:33 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.107.1665696087514384181
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Oct 2022 14:21:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=O2ynTSCG;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1665696087;
  x=1697232087;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1t+lq6BAzZd7GD20NGShvKldAMeSnyq+bvUsfYwoEWA=;
  b=O2ynTSCGLx9IFeKQnzG6sAlW19uIWPJ5PnFGz0q8aGuoHvCYtb/k357A
   tI3F4n61f31dM4906j/Y/xI8ACIIjV7fkjm5+RKEySRGgs3hFAS9cFZCP
   IqU3cmzhcvCYpRJpqKm1GJMRaOll4LAxGEfSRLlDnXv6lvajjT/qfGMNW
   mQgZNVs7bjYShFHzJtAcof9LGrCGQYIOBDwJfsHo81Lmiwu9ht6s9yRCS
   pSKyI91gl1dw/i8P/2LXB0MJPfufotZs2J/scz5slodEKOGuZLuCvqCEb
   5U7e6CjBhWeQpCR076IxovDjYUOxcKWCBTk+qQmCc7ckqtuPiEuNetfwn
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>
CC: Ross Burton <Ross.Burton@arm.com>, "Patches and discussions about the
 oe-core layer" <openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] gcc: Allow -Wno-error=poison-system-directories
 to take effect
Thread-Topic: [OE-core] [PATCH] gcc: Allow
 -Wno-error=poison-system-directories to take effect
Thread-Index: AQHY3wff9IX3aU5EgUGJzpEIvmlkRq4MW5EAgAAEFrD///UmgIAAfQtQ
Date: Thu, 13 Oct 2022 21:21:25 +0000
Message-ID: <86833f1a66344e14b8191960d12993f4@axis.com>
References: <20221013132926.2771530-1-pkj@axis.com>
 <6E25C44F-E526-49E7-9AAE-336E670B7F15@arm.com>
 <32ff3b495b8640fb9706bcd5119305f1@axis.com>
 <CAMKF1spjQSXimjhUeufGppgKenNLgsR+c_ppWJJd0ON4GS=dHw@mail.gmail.com>
In-Reply-To: <CAMKF1spjQSXimjhUeufGppgKenNLgsR+c_ppWJJd0ON4GS=dHw@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 13 Oct 2022 21:21:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171721

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1A
Z21haWwuY29tPg0KPiBTZW50OiBkZW4gMTMgb2t0b2JlciAyMDIyIDE3OjQxDQo+IFRvOiBQZXRl
ciBLamVsbGVyc3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4NCj4gQ2M6IFJvc3Mg
QnVydG9uIDxSb3NzLkJ1cnRvbkBhcm0uY29tPjsgUGF0Y2hlcyBhbmQgZGlzY3Vzc2lvbnMgYWJv
dXQgdGhlDQo+IG9lLWNvcmUgbGF5ZXIgPG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBnY2M6IEFsbG93IC1X
bm8tZXJyb3I9cG9pc29uLXN5c3RlbS0NCj4gZGlyZWN0b3JpZXMgdG8gdGFrZSBlZmZlY3QNCj4g
DQo+IE9uIFRodSwgT2N0IDEzLCAyMDIyIGF0IDc6MzggQU0gUGV0ZXIgS2plbGxlcnN0ZWR0IDxw
ZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+IHdyb3RlOg0KPiA+DQo+ID4gPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogUm9zcyBCdXJ0b24gPFJvc3MuQnVydG9uQGFy
bS5jb20+DQo+ID4gPiBTZW50OiBkZW4gMTMgb2t0b2JlciAyMDIyIDE2OjA1DQo+ID4gPiBUbzog
UGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+DQo+ID4gPiBD
YzogUGF0Y2hlcyBhbmQgZGlzY3Vzc2lvbnMgYWJvdXQgdGhlIG9lLWNvcmUgbGF5ZXIgPG9wZW5l
bWJlZGRlZC0NCj4gPiA+IGNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NCj4gPiA+IFN1Ympl
Y3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIXSBnY2M6IEFsbG93IC1Xbm8tZXJyb3I9cG9pc29uLXN5
c3RlbS0NCj4gPiA+IGRpcmVjdG9yaWVzIHRvIHRha2UgZWZmZWN0DQo+ID4gPg0KPiA+ID4gV2hp
bHN0IHRoaXMgaXMgYSBnb29kIGZpeCwgSeKAmW0gaG9ycmlmaWVkIHRvIGFzayB3aHkgeW91IG5l
ZWQgaXTigKYNCj4gPg0KPiA+IFdlIGhhdmUgYSByZWNpcGUgZm9yIHNraWEuIFNvbWV3aGVyZSBp
biB0aGF0IG1lc3Mgb2YgYSBidWlsZA0KPiA+IHN5c3RlbSBpdCB1c2VzIChnbiksIHNvbWV0aGlu
ZyBhZGRzIC1JL3Vzci9pbmNsdWRlL2ZyZWV0eXBlMiwNCj4gPiB3aGljaCByZXN1bHRzIGluIGFu
IGVycm9yIHdpdGggLVdlcnJvcj1wb2lzb24tc3lzdGVtLWRpcmVjdG9yaWVzDQo+ID4gZW5hYmxl
ZCAoYXMgaXQgc2hvdWxkKS4gTm93LCB0byB3b3JrIGFyb3VuZCB0aGF0IHByb2JsZW0sIHRoZQ0K
PiA+IHJlY2lwZSBjdXJyZW50bHkgYWRkcyAtST0vdXNyL2luY2x1ZGUvZnJlZXR5cGUyLCB3aGlj
aCBtZWFucyB3ZQ0KPiA+IGtub3cgdGhhdCB0aGUgY29ycmVjdCBwYXRoIGlzIHVzZWQuIEhvd2V2
ZXIsIHNpbmNlIHRoZSBvcmlnaW5hbA0KPiA+IC1JL3Vzci9pbmNsdWRlL2ZyZWV0eXBlMiBpcyBz
dGlsbCBpbiB0aGUgbGlzdCBvZiBvcHRpb25zLCB0aGUNCj4gPiBlcnJvciBzdGlsbCB0cmlnZ2Vy
cy4NCj4gPg0KPiA+IE5vdywgdG8gZml4IHRoZSBwcm9ibGVtIHByb3Blcmx5LCBza2lhcydzIGJ1
aWxkIGZpbGVzIHNob3VsZCBiZQ0KPiA+IHBhdGNoZWQsIGJ1dCB0aGF0IGlzIG5vdCBteSBqb2Iu
IFdoYXQgSSBhbSB3b3JraW5nIG9uIGlzIHRvIGdldA0KPiA+IG91ciByZWNpcGVzIHRvIGJ1aWxk
IHdpdGggTGFuZ2RhbGUuIFRoaXMgbWVhbnMgSSBjYW4gY3V0IHNvbWUNCj4gPiBjb3JuZXJzIGFu
ZCwgZS5nLiwgZGlzYWJsZSBlcnJvcnMgYW5kIHRoZW4gaGFuZCBvZmYgdG8gdGhlDQo+ID4gcmVz
cG9uc2libGUgdGVhbSB0byBmaXggdGhlIHVuZGVybHlpbmcgcHJvYmxlbSBhdCBhIHRpbWUgdGhh
dA0KPiA+IHN1aXRzIHRoZW0uIFRodXMgaW4gdGhpcyBjYXNlIEkgd2FudGVkIHRvIGFkZA0KPiA+
IC1Xbm8tZXJyb3I9cG9pc29uLXN5c3RlbS1kaXJlY3RvcmllcyBmb3Igc2tpYSwgd2hpY2ggSSB0
aGVuLCB0bw0KPiA+IG15IHN1cnByaXNlLCBub3RpY2VkIGhhZCBubyBlZmZlY3QuLi4NCj4gDQo+
IGZyb20gZ2NjIHJlY2lwZSBwb2ludCBvZiB2aWV3LCB0aGlzIGZpeCBpcyBmaW5lLiBob3dldmVy
IHlvdXIgdXNlIG9mDQo+IHRoaXMgc2VlbXMgdG8gYmUgYSB3b3JrYXJvdW5kIHRoYXQgcGVyaGFw
cyBpcyBiZXR0ZXIgZml4ZWQgaW4gc2tpYQ0KDQpPaCwgSSdtIHdlbGwgYXdhcmUgb2YgdGhhdC4g
QXMgSSBzYWlkLCBteSBqb2IgYXQgdGhpcyBzdGFnZSBpcyB0byBnZXQgDQpldmVyeXRoaW5nIGJ1
aWxkaW5nIHdpdGggTGFuZ2RhbGUuIEFuZCB0byBhY2hpZXZlIHRoYXQsIGl0IGlzIHBlcmZlY3Rs
eSANCmZpbmUgZm9yIG1lIHRvLCBlLmcuLCBkaXNhYmxlIGNvbXBpbGVyIGVycm9ycy4gT25jZSB0
aGUgcGxhdGZvcm0gDQpidWlsZHMsIHRoZSByZXNwZWN0aXZlIGNvZGUgb3duZXJzIGhhdmUgdGhl
IHJlc3BvbnNpYmlsaXR5IHRvIGFjdHVhbGx5IA0KY29ycmVjdCB0aGVpciBjb2RlIHRvIG5vdCBn
ZW5lcmF0ZSB0aGUgZXJyb3JzIGluIHRoZSBmaXJzdCBwbGFjZS4NCg0KPiBiZWNhdXNlID0gc3lu
dGF4IGZvciBzeXNyb290IHdvcmtzIHdpdGggZ2NjIGJ1dCBtYXkgbm90IHdvcmsgd2l0aA0KPiBj
bGFuZyBlLmcuIHNvIHlvdSBhcmUgYmVpbmcgbHVja3kgaGVyZS4NCg0KV2UgZG9uJ3QgdXNlIGNs
YW5nIHNvIHRoYXQgaXMgbm90IGEgcHJvYmxlbSBmb3IgdXMuDQoNCj4gPiAvL1BldGVyDQo+ID4N
Cj4gPiA+IFJvc3MNCg0KLy9QZXRlcg0KDQo=

