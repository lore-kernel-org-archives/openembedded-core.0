Return-Path: <s.zhmylev@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B162C54EBE
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 08:25:24 +0000 (UTC)
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.252])
 by mx.groups.io with SMTP id smtpd.web10.81399.1673598314850268676
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jan 2023 00:25:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yadro.com header.s=mta-01 header.b=BxnC8iyG;
 spf=pass (domain: yadro.com, ip: 89.207.88.252, mailfrom: s.zhmylev@yadro.com)
Received: from mta-01.yadro.com (localhost.localdomain [127.0.0.1])
	by mta-01.yadro.com (Proxmox) with ESMTP id C26E13417F6;
	Fri, 13 Jan 2023 11:25:11 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; h=cc
	:content-id:content-transfer-encoding:content-type:content-type
	:date:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mta-01; bh=A0hH6z7aTozwtBVeaA
	ou1AKs2xTFY7/5LHgMU+f+T2U=; b=BxnC8iyGhC1onenAGKwHfOOHcNGvlsxNjj
	fVZfQug3srM3AtD88Y/q3AnWYeiuQCrpWXSS12oiiW1N7m2dWpUKZT73DCKnSeIC
	Ih2QTbqAMlGIUD56jhYWrEEmufZWz3WsT2RHFcWhIani6WjnJWVOR8PEO/GuziL2
	oLA9bEE4s=
Received: from T-EXCH-08.corp.yadro.com (unknown [172.17.10.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Proxmox) with ESMTPS id B787334174C;
	Fri, 13 Jan 2023 11:25:11 +0300 (MSK)
Received: from T-Exch-05.corp.yadro.com (172.17.10.109) by
 T-EXCH-08.corp.yadro.com (172.17.11.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.9; Fri, 13 Jan 2023 11:25:11 +0300
Received: from T-EXCH-08.corp.yadro.com (172.17.11.58) by
 T-Exch-05.corp.yadro.com (172.17.10.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.9; Fri, 13 Jan 2023 11:25:11 +0300
Received: from T-EXCH-08.corp.yadro.com ([172.17.11.58]) by
 T-EXCH-08.corp.yadro.com ([172.17.11.58]) with mapi id 15.02.1118.009; Fri,
 13 Jan 2023 11:25:11 +0300
From: Sergey Zhmylev <s.zhmylev@yadro.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] package_rpm: allow arch overriding
Thread-Topic: [OE-core] [PATCH] package_rpm: allow arch overriding
Thread-Index: AQHZJs17x/I5syU4EUCG/XLoSxy3Eq6bK48AgAClpIA=
Date: Fri, 13 Jan 2023 08:25:11 +0000
Message-ID: <dca56133ff38a2700cdeda8832d187e8f1863a63.camel@yadro.com>
References: <20230112213301.11768-1-s.zhmylev@yadro.com>
	 <a956c7ec6640cfee5bebb41720beec74e8b663cf.camel@linuxfoundation.org>
In-Reply-To: <a956c7ec6640cfee5bebb41720beec74e8b663cf.camel@linuxfoundation.org>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.199.26.27]
Content-Type: text/plain; charset="utf-8"
Content-ID: <302895B22F1DF2478E63C25E3DA6BC4B@yadro.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 08:25:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175813

RXhhY3RseSEgRXZlbiBtb3JlOiB3aGVuIEkgYnVpbGQgZm9yICJnZW5lcmljeDg2XzY0IiwgSSBn
ZXQgbWl4IG9mDQpwYWNrYWdlcyB3aXRoIGFyY2hpdGVjdHVyZSBvbmUgb2Y6ICJ4ODZfNjQiLCAi
Z2VuZXJpY3g4Nl82NCIsDQoiY29yZTJfNjQiLCBhbmQgIm5vYXJjaCIuIE91ciBhdWRpdCB0ZWFt
IGhpZ2hsaXRlZCB0aGlzIGFzIHRoaXMgaXMgbm90DQpjb21wbGlhbnQgd2l0aCBjb21tb24gUlBN
IG5hbWluZyBjb252ZW50aW9uLg0KDQpJbiB0aGF0IGNhc2Ugb3ZlcnJpZGUgYXJjaGl0ZWN0dXJl
IHN0cmluZyBvbmx5IGZvciBwYWNrYWdpbmcgd291bGQgYmUsDQpmcm9tIG15IHBlcnNwZWN0aXZl
LCB0aGUgYmVzdCB3b3JrYXJvdW5kLiANCg0KQXQgdGhlIHNhbWUgdGltZSBJIGRvdWJ0IHdlIGhh
dmUgdG8gY2hhbmdlIG90aGVyIHBhY2thZ2UgYmFja2VuZHMgYXMNCnRoZXkncmUgbGVzcyBzdHJp
Y3Qgd2hpbGUgYXJjaGl0ZWN0dXJlIG92ZXJyaWRpbmcgZWZmZWN0aXZlbHkgbG9vc2VzDQoocHJv
YmFibHkpIGltcG9ydGFudCBpbmZvcm1hdGlvbi4NCg0KLS0gDQpXaXRoIGJlc3Qgd2lzaGVzLA0K
U2VyZ2VpIFpobXlsZXYNCkVuZ2luZWVyaW5nIGNvbnN1bHRhbnQNCk9TIGRldmVsb3BtZW50IGRl
cGFydG1lbnQNCg0KDQoNCg0KT24gVGh1LCAyMDIzLTAxLTEyIGF0IDIyOjMyICswMDAwLCBSaWNo
YXJkIFB1cmRpZSB3cm90ZToNCj4gwqvQktC90LjQvNCw0L3QuNC1ISDQlNCw0L3QvdC+0LUg0L/Q
uNGB0YzQvNC+INC+0YIg0LLQvdC10YjQvdC10LPQviDQsNC00YDQtdGB0LDRgtCwIcK7DQo+IA0K
PiBPbiBGcmksIDIwMjMtMDEtMTMgYXQgMDA6MzMgKzAzMDAsIFNlcmdleSBaaG15bGV2IHdyb3Rl
Og0KPiA+IEZyb206IFNlcmdlaSBaaG15bGV2IDxzLnpobXlsZXZAeWFkcm8uY29tPg0KPiA+IA0K
PiA+IEN1cnJlbnRseSBhcmNoIGlzIGJlaW5nIGNhbGN1bGF0ZWQgZnJvbSBlaXRoZXIgTUFDSElO
RV9BUkNIIG9yDQo+ID4gVFVORV9QS0dBUkNILsKgIFNvbWUgcmVjaXBlcyBkbyBvdmVycmlkZSBQ
QUNLQUdFX0FSQ0ggaW50ZW50aW9uYWxseS4NCj4gPiBUaGlzIGNvbW1pdCBtYWtlcyBwb3NzaWJs
ZSB0byBvdmVycmlkZSBBUkNIIGZvciBSUE0gcGFja2FnZXMNCj4gPiBzZXBhcmF0ZWx5IGluIG9y
ZGVyIHRvIHNpbXBsaWZ5IGNvbW1vbiBycG0gbmFtaW5nIGNvbmZvcm1hbmNlLg0KPiA+IA0KPiA+
IFNpZ25lZC1vZmYtYnk6IFNlcmdlaSBaaG15bGV2IDxzLnpobXlsZXZAeWFkcm8uY29tPg0KPiA+
IC0tLQ0KPiA+IMKgbWV0YS9jbGFzc2VzLWdsb2JhbC9wYWNrYWdlX3JwbS5iYmNsYXNzIHwgNCAr
KysrDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlm
ZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy1nbG9iYWwvcGFja2FnZV9ycG0uYmJjbGFzcw0KPiA+IGIv
bWV0YS9jbGFzc2VzLWdsb2JhbC9wYWNrYWdlX3JwbS5iYmNsYXNzDQo+ID4gaW5kZXggODVkMGJk
N2ZjZS4uM2ZiNzQ2Njc3OCAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhL2NsYXNzZXMtZ2xvYmFsL3Bh
Y2thZ2VfcnBtLmJiY2xhc3MNCj4gPiArKysgYi9tZXRhL2NsYXNzZXMtZ2xvYmFsL3BhY2thZ2Vf
cnBtLmJiY2xhc3MNCj4gPiBAQCAtNjc4LDYgKzY3OCwxMCBAQCBweXRob24gZG9fcGFja2FnZV9y
cG0gKCkgew0KPiA+IMKgwqDCoMKgIGJiLnV0aWxzLm1rZGlyaGllcihwa2d3cml0ZWRpcikNCj4g
PiDCoMKgwqDCoCBvcy5jaG1vZChwa2d3cml0ZWRpciwgMG83NTUpDQo+ID4gDQo+ID4gK8KgwqDC
oCBycG1fYXJjaF9vdmVycmlkZSA9IGQuZ2V0VmFyKCJSUE1fQVJDSF9PVkVSUklERSIpDQo+ID4g
K8KgwqDCoCBpZiBwYWNrYWdlX2FyY2ggIT0gIm5vYXJjaCIgYW5kIHJwbV9hcmNoX292ZXJyaWRl
Og0KPiA+ICvCoMKgwqDCoMKgwqDCoCBwa2dhcmNoID0gcnBtX2FyY2hfb3ZlcnJpZGUNCj4gPiAr
DQo+ID4gwqDCoMKgwqAgY21kID0gcnBtYnVpbGQNCj4gPiDCoMKgwqDCoCBjbWQgPSBjbWQgKyAi
IC0tbm9jbGVhbiAtLW5vZGVwcyAtLXNob3J0LWNpcmN1aXQgLS10YXJnZXQgIiArDQo+ID4gcGtn
YXJjaCArICIgLS1idWlsZHJvb3QgIiArIHBrZ2QNCj4gPiDCoMKgwqDCoCBjbWQgPSBjbWQgKyAi
IC0tZGVmaW5lICdfdG9wZGlyICIgKyB3b3JrZGlyICsgIicgLS1kZWZpbmUNCj4gPiAnX3JwbWRp
ciAiICsgcGtnd3JpdGVkaXIgKyAiJyINCj4gDQo+IFRoaXMgbWFrZXMgbWUgdmVyeSBuZXJ2b3Vz
LiBQQUNLQUdFX0FSQ0ggY2FuIGJlIG92ZXJyaWRkZW4gYW5kIEkga25vdw0KPiBvZiBCU1BzIHdo
aWNoIGluamVjdCBhIHdob2xlIG5ldyBsZXZlbCBvZiBhcmNoaXRlY3R1cmUgaW50byB0aGUNCj4g
c3lzdGVtDQo+IGJ1dCB0aGV5IGRvbid0IG5lZWQgdG8gbWFrZSBycG0gYmFja2VuZCBzcGVjaWZp
YyBjaGFuZ2VzIHRvIG1ha2UgaXQNCj4gd29yay4NCj4gDQo+IElmIHdlIHdlcmUgdG8gYWRkIHN1
Y2ggYSB0aGluZyB3ZSdkIG5lZWQgYSBtdWNoIGNsZWFyZXIgcGljdHVyZSBvZg0KPiB3aGVuDQo+
IGl0IHNob3VsZCBiZSB1c2VkIGFuZCB3aHkgaXQgaXMgbmVlZGVkLiBXb3VsZG4ndCBhbGwgcGFj
a2FnZSBiYWNrZW5kcw0KPiBuZWVkIHRvIGFkanVzdCB0aGlzPw0KPiANCj4gQ2hlZXJzLA0KPiAN
Cj4gUmljaGFyZA0KPiANCg==


