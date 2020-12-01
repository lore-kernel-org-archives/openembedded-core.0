Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.3679.1606785616499214563
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Nov 2020 17:20:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=nkP0XlRP;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=axis.com; l=2496; q=dns/txt; s=axis-central1;
  t=1606785616; x=1638321616;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=yNy0BuoUblt+lpQiEjrficZjYS5MaO0JmpawimfnD3U=;
  b=nkP0XlRPlDNqnj0bRlL6Pj9pPk9NekmOfI3yWRfDQp70rTLKWKOAOsER
   Uy500I0w/IwYo6CuZymetLLVW7QkB5IOQHBYuYr20g1QRyiQtsYtFDmru
   jDwoc/e+j4gjUNOu43Rk5XjAV3rC+qJ0MQ/LetWR6JswEXZ9Gb94HPdFU
   DcCglVgvpUD4CqDqXMv+nRrKwTOopqhyT+Pmi3AZAMn3anfvzdfen5wYD
   6auKyapIlI6uq2pYIZts0E51anaklnhBTgjqjOvguzHFjT6zlIMvsGtFy
   Smc9kBdH64ItzRUxhdtrVPkFcx9tHayorw0u/jiVTvAlQ5A+NAeQl2QEn
   A==;
IronPort-SDR: kn+9oWyiVjhAaUeUcVRHL0dt0gwrsnFF0OpztZ/JsYkgeU1rP+M81Y1jWFRKNfsvaxPDXjGiqc
 iu658y35aRN8546KfsTi7o3VhZjp/qSESaFoQtE5wR6jeizw/g9oZ0HwCK9YTOBjpxeS/wiyTN
 lLi1+udQnk63zsT6k402NzeCCvBVOn6Qx2pZg3yx652cKw1+g1wxSVHLQXBLqpqLb0SGImzt+N
 s7Y+atfazGXhnZC7KQNhYBotezqe6q9LgxSQbpSfjkEXHq1S0VLkS6a+TUeNCJz5EPUf/y4qJZ
 IkY=
X-IronPort-AV: E=Sophos;i="5.78,382,1599516000"; 
   d="scan'208";a="15040381"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCHv2 1/4] pseudo: Simplify pseudo_client_ignore_path_chroot()
Thread-Topic: [OE-core] [PATCHv2 1/4] pseudo: Simplify
 pseudo_client_ignore_path_chroot()
Thread-Index: AQHWxw6TJaKDjl8LR0aOR09xkD+qUanhbo3Q
Date: Tue, 1 Dec 2020 01:20:13 +0000
Message-ID: <61bfe4c0ea574d5c865e3640a26e06f0@XBOX03.axis.com>
References: <cover.1606312002.git.pkj@axis.com>
	 <dc076eec080ae9dd901ed4387b1a20239f7594ce.1606312002.git.pkj@axis.com>
 <1f005e64f11edd73d83461290baf0805f886fa41.camel@linuxfoundation.org>
In-Reply-To: <1f005e64f11edd73d83461290baf0805f886fa41.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogZGVuIDMwIG5vdmVtYmVy
IDIwMjAgMTI6NDcNCj4gVG86IFBldGVyIEtqZWxsZXJzdGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0
QGF4aXMuY29tPjsgb3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcN
Cj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0h2MiAxLzRdIHBzZXVkbzogU2ltcGxpZnkN
Cj4gcHNldWRvX2NsaWVudF9pZ25vcmVfcGF0aF9jaHJvb3QoKQ0KPiANCj4gSGkgUGV0ZXIsDQo+
IA0KPiBPbiBXZWQsIDIwMjAtMTEtMjUgYXQgMTQ6NDggKzAxMDAsIFBldGVyIEtqZWxsZXJzdGVk
dCB3cm90ZToNCj4gPiBUaGlzIGFsc28gcGx1Z3MgYSBtZW1vcnkgbGVhayBpbiBwc2V1ZG9fY2xp
ZW50X2lnbm9yZV9wYXRoX2Nocm9vdCgpLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGV0ZXIg
S2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+DQo+IA0KPiBJIG1ha2Ug
bm8gY2xhaW0gdG8gdW5kZXJzdGFuZCB3aGF0IGhhcHBlbmVkIGJ1dCBJIHRyaWVkIHBhdGNoZXMg
MSBhbmQgMg0KPiBpbiBhIGJ1aWxkIG92ZXIgdGhlIHdlZWtlbmQgYW5kIHdpdGggdGhlIGZpcnN0
IHR3byBwcmVzZW50Og0KPiANCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3Jn
L3R5cGhvb24vIy9idWlsZGVycy83OS9idWlsZHMvMTYwMg0KPiBodHRwczovL2F1dG9idWlsZGVy
LnlvY3RvcHJvamVjdC5vcmcvdHlwaG9vbi8jL2J1aWxkZXJzLzgwL2J1aWxkcy8xNTg0DQo+IGh0
dHBzOi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy90eXBob29uLyMvYnVpbGRlcnMvODYv
YnVpbGRzLzE1ODYNCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3R5cGhv
b24vIy9idWlsZGVycy84Ny9idWlsZHMvMTYxMA0KPiANCj4gSSB0aGVuIHJlbW92ZWQgdGhpcyBv
bmUgbGVhdmluZyBvbmx5IHBhdGNoIDIgYW5kIHRoZSBidWlsZCB3YXMgZmluZS4NCj4gDQo+IFNv
IHRoZXJlIGlzIHNvbWV0aGluZyBvZGQgaW4gdGhpcyBwYXRjaCBidXQgSSd2ZSBub3QgbG9va2Vk
IGludG8gd2hhdA0KPiBvciB3aHkgb25seSBzZWxmdGVzdCBpcyBhZmZlY3RlZC4NCj4gDQo+IENo
ZWVycywNCj4gDQo+IFJpY2hhcmQNCg0KSSBiZWxpZXZlIEkgaGF2ZSBmb3VuZCB0aGUgcHJvYmxl
bS4gSSBoYWQgbWlzc2VkIHRoZSBlZGdlIGNhc2Ugd2hlcmUgDQp0d28gY29tbWFzIGFyZSBzcGVj
aWZpZWQgaW1tZWRpYXRlbHkgYWZ0ZXIgZWFjaCBvdGhlciwgb3IgdGhlcmUgaXMgYQ0KbGVhZGlu
Zy90cmFpbGluZyBjb21tYS4gVGhpcyB3b3VsZCBlZmZlY3RpdmVseSBjYXVzZSBwc2V1ZG8gdG8g
aWdub3JlIA0KYWxsIHBhdGhzLiBUaGFua2Z1bGx5IHRoZSBmaXggaXMgdHJpdmlhbC4NCg0KSSBo
YXZlIHZlcmlmaWVkIHRoYXQgSSBjb3VsZCByZXBlYXQgdGhlIG9lLXNlbGZ0ZXN0IHByb2JsZW1z
IGZvciB0aGUgDQp3aWMuV2ljMiB0ZXN0cywgYW5kIHRoYXQgdGhleSBhcmUgYmFjayB0byB3b3Jr
aW5nIHdpdGggbXkgdXBkYXRlZCANCmNvZGUuDQoNCkkgd2lsbCB3YWl0IHdpdGggc2VuZGluZyBh
biB1cGRhdGVkIHBhdGNoIHNlcmllcyB1bnRpbCBJIGhhdmUgYSANCnJlc3BvbnNlIHJlZ2FyZGlu
ZyBob3cgeW91IHdhbnQgbWUgdG8gaGFuZGxlIHRoZSB0aGlyZCBwYXRjaCBpbiANCnRoZSBzZXJp
ZXMgKHNlZSBteSBvdGhlciBtYWlsIGZyb20gZWFybGllciB0b2RheSkuDQoNCi8vUGV0ZXINCg0K
