Return-Path: <chuck.wolber@boeing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF3FC3DA78
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 17:25:45 +0000 (UTC)
Received: from ewa-mbsout-01.mbs.boeing.net (ewa-mbsout-01.mbs.boeing.net [130.76.20.194])
 by mx.groups.io with SMTP id smtpd.web10.203038.1673976341177801828
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 09:25:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@boeing.com header.s=boeing-s1912 header.b=JgpCmHzG;
 spf=pass (domain: boeing.com, ip: 130.76.20.194, mailfrom: chuck.wolber@boeing.com)
Received: from localhost (localhost [127.0.0.1])
	by ewa-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id 30HHPZYa007290;
	Tue, 17 Jan 2023 09:25:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1673976339;
	bh=oK9I4GPytAsIvDEs7MCZByqEncsh6s+JLukYGf6NazI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=JgpCmHzGeawNBzSigNCWBUXU3K4/UUkZ6obcoD0vZZLszu0g9AxZhDPlWocP61OOv
	 kSouJoiuj9cskJRo1dfWaaJ1vesUgvVImB8obhh0eBNcairaALzJSMp+aEGOUzyqMx
	 WpF80n+WeQPICbg9EFaNuMWPydv2r5lT91zBdlVYzaTIO2UhvfYxbsntP0WNnVBwxz
	 8/CQyc7u9/3SIrxgu/nZ7ZJ1Mzxf70o2ZBrLjJYgrgyU0ADORneXGFsjc96+O1xJx1
	 V7mbWgzFoAFvbQqDJhaeQbeJaaoUHtgk2h3SqNQxxxhQFJCsiRIMYMAp04IA9yTpi1
	 aPoxOAyKFRK3w==
Received: from XCH16-03-01.nos.boeing.com (xch16-03-01.nos.boeing.com [137.137.111.10])
	by ewa-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with ESMTPS id 30HHPXpc007265
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jan 2023 09:25:34 -0800
Received: from XCH16-03-04.nos.boeing.com (137.137.111.13) by
 XCH16-03-01.nos.boeing.com (137.137.111.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Tue, 17 Jan 2023 09:25:32 -0800
Received: from XCH16-03-04.nos.boeing.com ([fe80::7809:c78b:36c8:935e]) by
 XCH16-03-04.nos.boeing.com ([fe80::7809:c78b:36c8:935e%12]) with mapi id
 15.01.2507.016; Tue, 17 Jan 2023 09:25:32 -0800
From: "Wolber (US), Chuck" <chuck.wolber@boeing.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        "luca.ceresoli@bootlin.com"
	<luca.ceresoli@bootlin.com>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [EXTERNAL] Re: [OE-core] [PATCH v2] scripts/oe-setup-layers: Make
 efficiently idempotent
Thread-Topic: [EXTERNAL] Re: [OE-core] [PATCH v2] scripts/oe-setup-layers:
 Make efficiently idempotent
Thread-Index: AQHZKhdbpkIUq4nG1UWU2dBwgECht66jXRGAgAAAlQD//3+SAA==
Date: Tue, 17 Jan 2023 17:25:32 +0000
Message-ID: <82AADBA5-67AA-48AF-A231-DE8EE90CFED4@boeing.com>
References: <1673920770-31378-1-git-send-email-chuck.wolber@boeing.com>
 <20230117180307.52fdcce0@booty>
 <CANNYZj-d-Ref70qgf=+fr8ZDx_KXZ02q36d1Z7Qq4bEF5URAUQ@mail.gmail.com>
In-Reply-To: <CANNYZj-d-Ref70qgf=+fr8ZDx_KXZ02q36d1Z7Qq4bEF5URAUQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/16.69.23010700
x-originating-ip: [137.137.12.6]
x-tm-snts-smtp: 24191845A6BF3D3C2D7108A326B81141CCABFC54D4E211C7A8D74894113894D42000:8
Content-Type: text/plain; charset="utf-8"
Content-ID: <8D3B886396EC644CB0F1226A12D43579@boeing.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TM-AS-GCONF: 00
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 17:25:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176059

T24gMS8xNy8yMywgOTowNSBBTSwgIkFsZXhhbmRlciBLYW5hdmluIiA8YWxleC5rYW5hdmluQGdt
YWlsLmNvbSA8bWFpbHRvOmFsZXgua2FuYXZpbkBnbWFpbC5jb20+PiB3cm90ZToNCg0KPiBPbiBU
dWUsIDE3IEphbiAyMDIzIGF0IDE4OjAzLCBMdWNhIENlcmVzb2xpIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxsdWNhLmNlcmVzb2xpPWJvb3RsaW4uY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcgPG1haWx0bzpib290bGluLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPj4gd3JvdGU6DQo+
DQo+ID4gSSdtIGFmcmFpbmQgSSBhbSB1bmFibGUgdG8gYXBwbHkgdGhpcyBwYXRjaCBvbiBteSB0
ZXN0aW5nIGJyYW5jaCBhcyBpdA0KPiA+IGNvbmZsaWN0cyB3aXRoIGFub3RoZXIgcGF0Y2ggKCJv
ZS1zZXR1cC1idWlsZDogYWRkIGEgdG9vbCBmb3INCj4gPiBkaXNjb3ZlcmluZyBjb25maWcgdGVt
cGxhdGVzIGFuZCBzZXR0aW5nIHVwIGJ1aWxkcyIgYnkgQWxleGFuZGVyDQo+ID4gS2FuYXZpbikg
d2hpY2ggaXMgYWxyZWFkeSBvbiBteSBicmFuY2guDQo+ID4NCj4gPiBZb3UgbWlnaHQgd2FudCB0
byByZXdvcmsgeW91ciBwYXRjaCBvbiB0b3Agb2YgQWxleCdzLCBvciBqdXN0IHdhaXQgZm9yDQo+
ID4gaXQgdG8gYmUgb24gbWFzdGVyIGFuZCB0aGVuIHNlbmQgYSB2My4NCj4NCj4gSSB0aGluayBS
UCBpcyBub3QgZ29pbmcgdG8gYWNjZXB0IHRoZSBvZS1zZXR1cC1idWlsZCBwYXRjaCBpbiBpdHMN
Cj4gY3VycmVudCBmb3JtLCBzbyB5b3UgY2FuIGRyb3AgaXQgZm9yIG5vdy4NCg0KQWdyZWVkLCBp
dCBzb3VuZHMgbGlrZSBSUCBpcyBob2xkaW5nIEFsZXgncyBwYXRjaCBiYWNrLCBzbyB5b3Ugc2hv
dWxkDQpwcm9iYWJseSBnbyB3aXRoIG15IHYyLiBBbGV4IHNob3VsZCBub3QgaGF2ZSBhbnkgcHJv
YmxlbXMgd29ya2luZw0KYWdhaW5zdCBteSB2MiBwYXRjaCB3aGVuIGhlIHVwZGF0ZXMgaGlzIG93
biBwYXRjaC4NCg0KLi5DaDpXLi4NCg0K

