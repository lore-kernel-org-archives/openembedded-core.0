Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A49C3C433F5
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 09:42:33 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.8370.1636623751928241841
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 01:42:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=dsxZ/8Js;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636623752;
  x=1668159752;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qGmm/FXmtI4zG+Jxn92+aUB3XyOx14KWsf5IjVTSubQ=;
  b=dsxZ/8JsdtDF8AmUMNpq9VIpMEECBeLhEu7b1gdPDXiATlcVuh0nV02s
   VS3WPXQA7aroZQz0p8Ya5+i+yqbz80Jsfo2hLhP3KeEVDQGsZPuiBUrHb
   g1Syq4sq6Qhxd/s6OUb6YcwJGOkPZngCF2SYLVOEZEKztEs+ou2g5+wkE
   oy7bqq107UUdqqEhJbiWpAOtjOWQ5eNvg8zWl8lJ5j24uwuvxK+NIe2X7
   Cvof6/ylsLPylwwLSFu/2XkyyMTV0O7RInW5AbKxse10WSDVdGARa3jbd
   oSiTXeZOFZJdrit9DBrYtU2CauOCBFHUmRbGaxHzwpr9MWJ0QVSMDsaO+
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
CC: "OE Core (openembedded-core@lists.openembedded.org)"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [honister][PATCH] insane.bbclass: Add a check for
 directories that are expected to be empty
Thread-Topic: [OE-core] [honister][PATCH] insane.bbclass: Add a check for
 directories that are expected to be empty
Thread-Index: AQHX1MXXbNmfgIiCK0q5pwkLNzMfoav7RMeAgAH5nPCAAFmIAIAAfjeQ
Date: Thu, 11 Nov 2021 09:42:28 +0000
Message-ID: <d62d07f792e4450c981095d86eee280c@axis.com>
References: <20211108171057.23971-1-pkj@axis.com>
	 <a5024677e6141ec6c93bda07a2d77c6b0a9a5110.camel@intel.com>
	 <bd35b97c54314581be874f9bd8adcf83@axis.com>
 <0acd0e851fab2cbbc1580ec45b1765d5c22e26b5.camel@intel.com>
In-Reply-To: <0acd0e851fab2cbbc1580ec45b1765d5c22e26b5.camel@intel.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 09:42:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158149

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNaXR0YWwsIEFudWogPGFudWou
bWl0dGFsQGludGVsLmNvbT4NCj4gU2VudDogZGVuIDExIG5vdmVtYmVyIDIwMjEgMDQ6MDYNCj4g
VG86IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPg0KPiBT
dWJqZWN0OiBSZTogW09FLWNvcmVdIFtob25pc3Rlcl1bUEFUQ0hdIGluc2FuZS5iYmNsYXNzOiBB
ZGQgYSBjaGVjayBmb3INCj4gZGlyZWN0b3JpZXMgdGhhdCBhcmUgZXhwZWN0ZWQgdG8gYmUgZW1w
dHkNCj4gDQo+IE9uIFdlZCwgMjAyMS0xMS0xMCBhdCAyMDo1MyArMDAwMCwgUGV0ZXIgS2plbGxl
cnN0ZWR0IHdyb3RlOg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZy
b206IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmfCoDxvcGVuZW1iZWRk
ZWQtDQo+ID4gPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBBbnVq
IE1pdHRhbA0KPiA+ID4gU2VudDogZGVuIDkgbm92ZW1iZXIgMjAyMSAxNTozNg0KPiA+ID4gVG86
IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc7IFBldGVyIEtqZWxsZXJz
dGVkdA0KPiA+ID4gPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4NCj4gPiA+IFN1YmplY3Q6
IFJlOiBbT0UtY29yZV0gW2hvbmlzdGVyXVtQQVRDSF0gaW5zYW5lLmJiY2xhc3M6IEFkZCBhDQo+
ID4gPiBjaGVjayBmb3INCj4gPiA+IGRpcmVjdG9yaWVzIHRoYXQgYXJlIGV4cGVjdGVkIHRvIGJl
IGVtcHR5DQo+ID4gPg0KPiA+ID4gT24gTW9uLCAyMDIxLTExLTA4IGF0IDE4OjEwICswMTAwLCBQ
ZXRlciBLamVsbGVyc3RlZHQgd3JvdGU6DQo+ID4gPiA+IEZyb206IFBldGVyIEtqZWxsZXJzdGVk
dCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPg0KPiA+ID4gPg0KPiA+ID4gPiBUaGUgZW1w
dHktZGlycyBRQSBjaGVjayB2ZXJpZmllcyB0aGF0IGFsbCBkaXJlY3RvcmllcyBzcGVjaWZpZWQN
Cj4gPiA+ID4gaW4NCj4gPiA+ID4gUUFfRU1QVFlfRElSUyBhcmUgZW1wdHkuIEl0IGlzIHBvc3Np
YmxlIHRvIHNwZWNpZnkgd2h5IGENCj4gPiA+ID4gZGlyZWN0b3J5IGlzDQo+ID4gPiA+IGV4cGVj
dGVkIHRvIGJlIGVtcHR5IGJ5IGRlZmluaW5nDQo+ID4gPiA+IFFBX0VNUFRZX0RJUlNfUkVDT01N
RU5EQVRJT046PHBhdGg+LA0KPiA+ID4gPiB3aGljaCB3aWxsIHRoZW4gYmUgaW5jbHVkZWQgaW4g
dGhlIGVycm9yIG1lc3NhZ2UgaWYgdGhlIGRpcmVjdG9yeQ0KPiA+ID4gPiBpcw0KPiA+ID4gPiBu
b3QgZW1wdHkuIElmIGl0IGlzIG5vdCBzcGVjaWZpZWQgZm9yIGEgZGlyZWN0b3J5LCB0aGVuICJi
dXQgaXQNCj4gPiA+ID4gaXMNCj4gPiA+ID4gZXhwZWN0ZWQgdG8gYmUgZW1wdHkiIHdpbGwgYmUg
dXNlZC4NCj4gPiA+ID4NCj4gPiA+ID4gQ2hhbmdlLUlkOiBJYzYxMDE5NTI4ZjRiMjJmMjZlNDJl
NzgxMjVhOTk2NjZhZTI3YzdmNQ0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBLamVsbGVy
c3RlZHQgPHBldGVyLmtqZWxsZXJzdGVkdEBheGlzLmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+
DQo+ID4gPiA+IENvbXBhcmVkIHRvIHRoZSBjb3JyZXNwb25kaW5nIHBhdGNoIGZvciBtYXN0ZXIs
IHRoZXJlIGFyZSB0d28NCj4gPiA+ID4gZGlmZmVyZW5jZXM6DQo+ID4gPiA+DQo+ID4gPiA+ICog
Ii92YXIvdm9sYXRpbGUiIGlzIG5vdCBhZGRlZCB0byBRQV9FTVBUWV9ESVJTIGJ5IGRlZmF1bHQu
DQo+ID4gPiA+ICogImVtcHR5LWRpcnMiIGlzIGFkZGVkIHRvIFdBUk5fUUEgaW5zdGVhZCBvZiBF
UlJPUl9RQS4NCj4gPiA+ID4NCj4gPiA+ID4gVGhpcyBzaG91bGQgbWFrZSBpdCBzYWZlIHRvIGFk
ZCB0aGlzIFFBIHRlc3QgdG8gSG9uaXN0ZXIgd2l0aG91dA0KPiA+ID4gPiBpbnRyb2R1c2luZyBh
bnkgbmV3IFFBIGVycm9ycywgd2hpbGUgc3RpbGwgYWxsb3dpbmcgdGhlIFFBIHRlc3QgdG8gYmUN
Cj4gPiA+ID4gYWN0aXZhdGVkIGZvciB0aG9zZSB3aG8gd2FudHMgdG8gdXNlIGl0Lg0KPiA+ID4N
Cj4gPiA+IERvZXMgaXQgaGF2ZSB0byBiZSBlbmFibGVkIGJ5IGRlZmF1bHQ/DQo+ID4NCj4gPiBX
ZWxsLCBpdCBkb2Vzbid0IGhhdmUgdG8gYmUgZW5hYmxlZC4gSG93ZXZlciwgd2l0aG91dCAvdmFy
L3ZvbGF0aWxlIGluDQo+ID4gUUFfRU1QVFlfRElSUywgdGhlcmUgc2hvdWxkIGJlIG5vIHdhcm5p
bmdzIGdlbmVyYXRlZCBmb3IgT0UtQ29yZSBvcg0KPiA+IE9wZW5FbWJlZGRlZCBzbyBpdCBzaG91
bGQgbm90IGh1cnQgdG8gaGF2ZSBpdCBpbiBXQVJOX1FBLg0KPiANCj4gUmlnaHQsIGJ1dCB0aGVy
ZSBjb3VsZCBiZSB1bmV4cGVjdGVkIHdhcm5pbmdzIGZvciBvdGhlciBkb3duc3RyZWFtDQo+IGxh
eWVycyBpbiByZWxlYXNlIHZlcnNpb25zLg0KDQpUcnVlLCBidXQgdGhleSB3b3VsZCBzdGlsbCBq
dXN0IGJlIHdhcm5pbmdzLg0KDQo+IEkgdGhpbmsgd2UgY2FuIGFkZCB0aGUgdGVzdCBidXQgb25s
eSBmb3IgcGVvcGxlIHRvIHVzZSBpdCBpZiB0aGV5J2QNCj4gbGlrZSB0by4NCg0KU3VyZSwgaWYg
eW91IHByZWZlciB0aGF0LiBEbyB5b3Ugd2FudCBtZSB0byBzZW5kIGFuIHVwZGF0ZWQgcGF0Y2gs
IG9yIHdpbGwgDQp5b3UgdGFrZSBjYXJlIG9mIGl0Pw0KDQo+IFRoYW5rcywNCj4gDQo+IEFudWoN
Cg0KLy9QZXRlcg0K

