Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1764C433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 15:31:34 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.27790.1647271893250998889
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 08:31:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=BnOOsTa+;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1647271893;
  x=1678807893;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=GOTSgLZTHTGP5kSRGGvdC7OLJYhHx1jW4Lor/6VSiL0=;
  b=BnOOsTa+jZihPxXmYgpd1m+C6sBWA5rQHMtVYPhuh+oHsPtzc1/hBZDf
   Th9H8dRau9+kOwADybQMP/eKmMkr++6mSoMyMdi1w5W9bnEUJyp+vgNyK
   KRzSPNacpMPXhp0zrQn8GxWJ/D1p7tQYbH0+g1h5npHc2tOBZC1FU7U8U
   xQejqSIWyxQpHw1EpjtCcOa3d3saTzrIeHN9UxdxetWsfeDo+PjbYUNba
   kj5N7JORa99rDMJ07Sod2xPfBY7GQO8DvRnAH8POEkca8Z+LnUCM9YBFJ
   UIbdUf98v6fGfiBMyXBhxkogrP7bFPVFffrEL1cjuDpfCFqdOHBdIUYz1
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, "OE Core
	(openembedded-core@lists.openembedded.org)"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] Building python3 without readline fails for Kirkstone
Thread-Topic: [OE-core] Building python3 without readline fails for Kirkstone
Thread-Index: Adg3qCNDhtoo90H9Tum4/+Umwa0eb///8nEA///Ti1A=
Date: Mon, 14 Mar 2022 15:31:12 +0000
Message-ID: <47f71734c82e4cf48fa59d3f544c97b0@axis.com>
References: <1fcdfa7197764e3ebeeb5ace0b99a550@axis.com>
 <af998e903fb8c67e2c19adcc59225b84e1f92384.camel@linuxfoundation.org>
In-Reply-To: 
 <af998e903fb8c67e2c19adcc59225b84e1f92384.camel@linuxfoundation.org>
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
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 15:31:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163155

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmlj
aGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2VudDogZGVuIDE0IG1hcnMgMjAy
MiAxNDo0NQ0KPiBUbzogUGV0ZXIgS2plbGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhp
cy5jb20+OyBPRSBDb3JlDQo+IChvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnKSA8b3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+IFN1
YmplY3Q6IFJlOiBbT0UtY29yZV0gQnVpbGRpbmcgcHl0aG9uMyB3aXRob3V0IHJlYWRsaW5lIGZh
aWxzIGZvcg0KPiBLaXJrc3RvbmUNCj4gDQo+IE9uIE1vbiwgMjAyMi0wMy0xNCBhdCAxMzozOSAr
MDAwMCwgUGV0ZXIgS2plbGxlcnN0ZWR0IHdyb3RlOg0KPiA+IFdlIGhhdmUgcmVhZGxpbmUgc3Vw
cG9ydCBkaXNhYmxlZCBmb3IgcHl0aG9uMyBmb3IgdGFyZ2V0LiBJdCB3b3Jrcw0KPiA+IGZpbmUg
Zm9yIEhhcmRrbm90dCBhbmQgSG9uaXN0ZXIsIGJ1dCBmYWlscyBmb3IgS2lya3N0b25lIHdpdGgg
dGhlDQo+ID4gZm9sbG93aW5nIGVycm9yOg0KPiA+DQo+ID4gICBUaGUgbmVjZXNzYXJ5IGJpdHMg
dG8gYnVpbGQgdGhlc2Ugb3B0aW9uYWwgbW9kdWxlcyB3ZXJlIG5vdCBmb3VuZDoNCj4gPiAgIF9j
dXJzZXMgICAgICAgICAgICAgICBfY3Vyc2VzX3BhbmVsDQo+ID4NCj4gPiBUaGUgcHJvYmxlbSBj
YW4gYmUgcmVjcmVhdGVkIGJ5IGFkZGluZyB0aGUgZm9sbG93aW5nIHRvIGxvY2FsLmNvbmY6DQo+
ID4NCj4gPiBQQUNLQUdFQ09ORklHOnJlbW92ZTpwbi1weXRob24zOmNsYXNzLXRhcmdldCA9ICJy
ZWFkbGluZSINCj4gPg0KPiA+IGFuZCB0aGVuIGJ1aWxkaW5nIHB5dGhvbjMuDQo+ID4NCj4gPiBB
bnkgaGVscCB0byBzb2x2ZSB0aGUgcHJvYmxlbSB3b3VsZCBiZSBhcHByZWNpYXRlZC4NCj4gDQo+
IEknZCBoYXZlIHRob3VnaHQgdGhhdCB0aG9zZSBtb2R1bGVzIGJlaW5nIG1pc3Npbmcgd2FzIHBy
b2JhYmx5IGV4cGVjdGVkIGlmDQo+IHlvdSBkaXNhYmxlIHJlYWRsaW5lPw0KDQpBRkFJQ1QsIGJv
dGggY3Vyc2VzIGFuZCBjdXJzZXNfcGFuZWwgYXJlIGJ1aWx0IGZvciBIYXJka25vdHQgYW5kIA0K
SG9uaXN0ZXIgZXZlbiBpZiByZWFkbGluZSBpcyByZW1vdmVkIGZyb20gUEFDS0FHRUNPTkZJRy4N
Cg0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJkDQoNCi8vUGV0ZXINCg==

