Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 495E7ECAAA1
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 23:12:16 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.53.1667257925411475598
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 16:12:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=aAqXxHM8;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1667257926;
  x=1698793926;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oqRZAoZZNKB67Ijo6LXz4r3N5/jLGnjLMHP9H9jRRpo=;
  b=aAqXxHM8M97tuGO308DMC9jwvcF1oNK3vuG/S6tlW4d0KwGUl28ulK3V
   X4Z6oE8MQFKpqmowEOpJkH5fGf2OgWaHzxmCvVxeaJ14/2VHWxnkj09uM
   4xKYU933mu4Q/O2ekhdO3WM5Xio5WYeO7ygk1Zk7cB/qfHz4QB6SVr3Ji
   Jzp1Wp2tNtcD975ZpzLPwJ59JlfO9uRGzEQFXnxF3wuYGWlt1VCqktnmJ
   D3x0KKe8CPJx0vpwy4yKDyM6YSczt1uGmBH7MOna83useIL1PmUGVOV9j
   b3qbPFrqUHsNmuLoA+lZyDhGCyXSUkSYMJt4CCKtGE6eftVMkD33kyLHZ
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Marek Vasut <marex@denx.de>, Jose Quaresma <quaresma.jose@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Alexander Kanavin
	<alex@linutronix.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: RE: [OE-core] [PATCH] bluez5: Point hciattach bcm43xx firmware search
 path to /lib/firmware
Thread-Topic: [OE-core] [PATCH] bluez5: Point hciattach bcm43xx firmware
 search path to /lib/firmware
Thread-Index: AQHY7UYYqVCnhS4w90GfymJKo3h7va4oz+CAgAAawICAADa3IA==
Date: Mon, 31 Oct 2022 23:12:02 +0000
Message-ID: <388b65f1832943a1820b563b70ba6888@axis.com>
References: <20221031163015.19021-1-marex@denx.de>
 <CANPvuRnxR-wLqt4iONT7wjbEpKMOHC97KqAu=cxqX5t04gAZvw@mail.gmail.com>
 <b887a9e5-5d2a-1091-c6b4-13e2ac6266f7@denx.de>
In-Reply-To: <b887a9e5-5d2a-1091-c6b4-13e2ac6266f7@denx.de>
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
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 23:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172346

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIE1hcmVrIFZhc3V0DQo+IFNlbnQ6IGRlbiAzMSBva3Rv
YmVyIDIwMjIgMjE6NTQNCj4gVG86IEpvc2UgUXVhcmVzbWEgPHF1YXJlc21hLmpvc2VAZ21haWwu
Y29tPg0KPiBDYzogb3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzsgQWxl
eGFuZGVyIEthbmF2aW4NCj4gPGFsZXhAbGludXRyb25peC5kZT47IEFsZXhhbmRyZSBCZWxsb25p
IDxhbGV4YW5kcmUuYmVsbG9uaUBib290bGluLmNvbT47DQo+IFJpY2hhcmQgUHVyZGllIDxyaWNo
YXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPg0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVd
IFtQQVRDSF0gYmx1ZXo1OiBQb2ludCBoY2lhdHRhY2ggYmNtNDN4eCBmaXJtd2FyZQ0KPiBzZWFy
Y2ggcGF0aCB0byAvbGliL2Zpcm13YXJlDQo+IA0KPiBPbiAxMC8zMS8yMiAyMDoxOCwgSm9zZSBR
dWFyZXNtYSB3cm90ZToNCj4gPiBIaSBNYXJlaywNCj4gDQo+IEhpLA0KPiANCj4gPiBNYXJlayBW
YXN1dCA8bWFyZXhAZGVueC5kZT4gZXNjcmV2ZXUgbm8gZGlhIHNlZ3VuZGEsIDMxLzEwLzIwMjIg
w6AocykNCj4gMTY6MzA6DQo+ID4NCj4gPj4gQ3VycmVudGx5IHRoZSBoY2lhdHRhY2ggYmNtNDN4
eCBmaXJtd2FyZSBsb2FkZXIgbG9va3MgdXAgdGhlIGZpcm13YXJlDQo+ID4+IGJsb2IgaW4gL2V0
Yy9maXJtd2FyZSAuIENoYW5nZSB0aGlzIHRvIC9saWIvZmlybXdhcmUgaW5zdGVhZCwgc28gdGhh
dA0KPiA+PiB0aGUgcGF0aCBpcyBjb25zaXN0ZW50IHdpdGggTGludXgga2VybmVsIHdoaWNoIGFs
c28gbG9va3MgdXAgZmlybXdhcmUNCj4gPj4gZm9yIHRoZSBXaUZpIHBhcnQgaW4gL2xpYi9maXJt
d2FyZSAuDQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IE1hcmVrIFZhc3V0IDxtYXJleEBkZW54
LmRlPg0KPiA+PiAtLS0NCj4gPj4gQ2M6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4QGxpbnV0cm9u
aXguZGU+DQo+ID4+IENjOiBBbGV4YW5kcmUgQmVsbG9uaSA8YWxleGFuZHJlLmJlbGxvbmlAYm9v
dGxpbi5jb20+DQo+ID4+IENjOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhm
b3VuZGF0aW9uLm9yZz4NCj4gPj4gLS0tDQo+ID4+ICAgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9ibHVlejUvYmx1ZXo1LmluYyB8IDIgKysNCj4gPj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspDQo+ID4+DQo+ID4+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2JsdWV6NS9ibHVlejUuaW5jDQo+ID4+IGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9i
bHVlejUvYmx1ZXo1LmluYw0KPiA+PiBpbmRleCBmMDdlMzE4ODk3Li5mZTEwYmU3MzI0IDEwMDY0
NA0KPiA+PiAtLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2JsdWV6NS9ibHVlejUuaW5j
DQo+ID4+ICsrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvYmx1ZXo1L2JsdWV6NS5pbmMN
Cj4gPj4gQEAgLTY4LDYgKzY4LDggQEAgRVhUUkFfT0VDT05GID0gIlwNCj4gPj4gICAgIC0td2l0
aG91dC16c2gtY29tcGxldGlvbi1kaXIgXA0KPiA+PiAgICINCj4gPj4NCj4gPj4gK0NGTEFHUzph
cHBlbmQgPSAiIC1ERklSTVdBUkVfRElSPVxcIi9saWIvZmlybXdhcmVcXCIiDQo+ID4+DQo+ID4N
Cj4gPiBFc2NhcGUgY2hhcnMgY2FuIGJlIHRyaWNreSB3aGVuIHBhcnNpbmcgYW5kIGFzIHRoZSBw
YXRoDQo+ID4gZG9lc24ndCBoYXZlIGFueSBzcGFjZSB3ZSBjYW4gaGF2ZSAiIC1ERklSTVdBUkVf
RElSPS9saWIvZmlybXdhcmUiDQo+ID4gb3Igbm90Pw0KPiANCj4gTm8sIGJlY2F1c2UgdGhlbiB0
aGUgbWFjcm8gZ2V0cyBleHBhbmRlZCBpbiBwbGFjZSBpbiBoY2ljb25maWdfYmNtNDN4eC5jDQo+
IHRvIHNvbWV0aGluZyBsaWtlIHByaW50ZigvbGliL2Zpcm13YXJlKTsgd2hpY2ggdGhlIGNvbXBp
bGVyIGRvZXMgbm90DQo+IGxpa2Ugb2J2aW91c2x5LiBUaGUgcXVvdGVzIGFyZSByZWFsbHkgbWFu
ZGF0b3J5IHRoZXJlLCBJIHRyaWVkIHZhcmlvdXMNCj4gY29tYmluYXRpb25zIChzaWdoKSB1bnRp
bCBJIGFycml2ZWQgYXQgdGhpcyB3b3JraW5nIG9uZS4NCj4gDQo+ID4gQW5vdGhlciBvcHRpb25z
IHRvIGF2b2lkIGVzY2FwZSBjaGFycyBjYW4gYmUNCj4gPiBDRkxBR1M6YXBwZW5kID0gJyAtREZJ
Uk1XQVJFX0RJUj0iL2xpYi9maXJtd2FyZSInDQo+IA0KPiBbLi4uXQ0KDQpZb3Ugc2hvdWxkIGNo
YW5nZSAiL2xpYiIgdG8gIiR7bm9uYXJjaF9iYXNlX2xpYmRpcn0iLg0KDQovL1BldGVyDQoNCg==

