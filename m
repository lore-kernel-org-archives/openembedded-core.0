Return-Path: <s.zhmylev@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FCECC54EBE
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 09:14:44 +0000 (UTC)
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.252])
 by mx.groups.io with SMTP id smtpd.web11.82066.1673601278587211229
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jan 2023 01:14:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yadro.com header.s=mta-01 header.b=RpR51ZXE;
 spf=pass (domain: yadro.com, ip: 89.207.88.252, mailfrom: s.zhmylev@yadro.com)
Received: from mta-01.yadro.com (localhost.localdomain [127.0.0.1])
	by mta-01.yadro.com (Proxmox) with ESMTP id C5D833419A4;
	Fri, 13 Jan 2023 12:14:35 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; h=cc
	:cc:content-id:content-transfer-encoding:content-type
	:content-type:date:from:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=mta-01; bh=fPCCjE2
	BDE9IaB59lVuTVoGGfUbLmKJ3Lkt2/88KJGI=; b=RpR51ZXEsrDdFO4+GlGJ6cj
	R55uB/n2uKlVvqJrEW+1ywhtzL0sTN7nJdLkcp6ZPn9q8tDeM1LzZ0pWFcoPSC56
	GiaIFLgTzj3cVrthTVbjrX3N8UjLiiNH3j/VrO7XS/G0RfMP/C6AazI93xFOkOIh
	eR/1RCmJKyAclVMiw89U=
Received: from T-EXCH-07.corp.yadro.com (unknown [172.17.10.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Proxmox) with ESMTPS id B93FC3418D2;
	Fri, 13 Jan 2023 12:14:35 +0300 (MSK)
Received: from T-EXCH-09.corp.yadro.com (172.17.11.59) by
 T-EXCH-07.corp.yadro.com (172.17.11.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.9; Fri, 13 Jan 2023 12:14:35 +0300
Received: from T-EXCH-08.corp.yadro.com (172.17.11.58) by
 T-EXCH-09.corp.yadro.com (172.17.11.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.9; Fri, 13 Jan 2023 12:14:35 +0300
Received: from T-EXCH-08.corp.yadro.com ([172.17.11.58]) by
 T-EXCH-08.corp.yadro.com ([172.17.11.58]) with mapi id 15.02.1118.009; Fri,
 13 Jan 2023 12:14:35 +0300
From: Sergey Zhmylev <s.zhmylev@yadro.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] package_rpm: allow arch overriding
Thread-Topic: [OE-core] [PATCH] package_rpm: allow arch overriding
Thread-Index: AQHZJs17x/I5syU4EUCG/XLoSxy3Eq6bK48AgAClpICAAAKyAIAACxwA
Date: Fri, 13 Jan 2023 09:14:35 +0000
Message-ID: <8eae30b2192df5bae48ad7c8eb028b868ef89e55.camel@yadro.com>
References: <20230112213301.11768-1-s.zhmylev@yadro.com>
	 <a956c7ec6640cfee5bebb41720beec74e8b663cf.camel@linuxfoundation.org>
	 <dca56133ff38a2700cdeda8832d187e8f1863a63.camel@yadro.com>
	 <CANNYZj89sJH398ksmtB-TRcTOW6_MYKsDdCie3mHe7QRvKu47Q@mail.gmail.com>
In-Reply-To: <CANNYZj89sJH398ksmtB-TRcTOW6_MYKsDdCie3mHe7QRvKu47Q@mail.gmail.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.199.26.27]
Content-Type: text/plain; charset="utf-8"
Content-ID: <E85FA9B6D3407248908A83664DB776A8@yadro.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 09:14:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175816

U3VyZSwgUlBNIG5hbWluZyBjb252ZW50aW9uIGZyb20gcnBtLm9yZzoNCmh0dHA6Ly9mdHAucnBt
Lm9yZy9tYXgtcnBtL2NoLXJwbS1maWxlLWZvcm1hdC5odG1sDQpBcyB5b3UgY2FuIHNlZSwgdGhl
cmUgYXJlIG5vdGhpbmcgYWJvdXQgImNvcmUyXzY0IiBhcmNoaXRlY3R1cmUuDQoNCi0tIA0KV2l0
aCBiZXN0IHdpc2hlcywNClNlcmdlaSBaaG15bGV2DQpFbmdpbmVlcmluZyBjb25zdWx0YW50DQpP
UyBkZXZlbG9wbWVudCBkZXBhcnRtZW50DQoNCg0KDQoNCg0KDQoNCg0KT24gRnJpLCAyMDIzLTAx
LTEzIGF0IDA5OjM0ICswMTAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90ZToNCj4gwqvQktC90LjQ
vNCw0L3QuNC1ISDQlNCw0L3QvdC+0LUg0L/QuNGB0YzQvNC+INC+0YIg0LLQvdC10YjQvdC10LPQ
viDQsNC00YDQtdGB0LDRgtCwIcK7DQo+IA0KPiBPbiBGcmksIDEzIEphbiAyMDIzIGF0IDA5OjI1
LCBTZXJnZXkgWmhteWxldiA8cy56aG15bGV2QHlhZHJvLmNvbT4NCj4gd3JvdGU6DQo+ID4gDQo+
ID4gRXhhY3RseSEgRXZlbiBtb3JlOiB3aGVuIEkgYnVpbGQgZm9yICJnZW5lcmljeDg2XzY0Iiwg
SSBnZXQgbWl4IG9mDQo+ID4gcGFja2FnZXMgd2l0aCBhcmNoaXRlY3R1cmUgb25lIG9mOiAieDg2
XzY0IiwgImdlbmVyaWN4ODZfNjQiLA0KPiA+ICJjb3JlMl82NCIsIGFuZCAibm9hcmNoIi4gT3Vy
IGF1ZGl0IHRlYW0gaGlnaGxpdGVkIHRoaXMgYXMgdGhpcyBpcw0KPiA+IG5vdA0KPiA+IGNvbXBs
aWFudCB3aXRoIGNvbW1vbiBSUE0gbmFtaW5nIGNvbnZlbnRpb24uDQo+IA0KPiBDYW4geW91IHBs
ZWFzZSBsaW5rIHRvIChvciBkZXNjcmliZSB3aXRoIHJlZmVyZW5jZXMpIHRoZSBjb21tb24NCj4g
bmFtaW5nDQo+IGNvbnZlbnRpb24/DQo+IA0KPiBBbGV4DQo+IA0K


