Return-Path: <s.zhmylev@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD50C4167B
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 11:41:50 +0000 (UTC)
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.252])
 by mx.groups.io with SMTP id smtpd.web12.10040.1667562103321047774
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Nov 2022 04:41:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@yadro.com header.s=mta-01 header.b=ZM8/0r3O;
 spf=pass (domain: yadro.com, ip: 89.207.88.252, mailfrom: s.zhmylev@yadro.com)
Received: from localhost (unknown [127.0.0.1])
	by mta-01.yadro.com (Postfix) with ESMTP id 3E4A641235;
	Fri,  4 Nov 2022 11:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
	mime-version:content-transfer-encoding:content-id:content-type
	:content-type:content-language:accept-language:in-reply-to
	:references:message-id:date:date:subject:subject:from:from
	:received:received:received:received:received; s=mta-01; t=
	1667562099; x=1669376500; bh=JXKsyl/O0H6oloE0UOTjPp56SkQgkqEi+p1
	xrYNZkv8=; b=ZM8/0r3Ochfhi2pwmZD3BWJNVawoazUZyesMInaoukAtoNnKEzk
	9wVBiAWVclJYPKYm8wa2qQEfYJTq2H06AirlwC7j0ReYAGSlzs1FCn4tNgJxXI39
	5/PTTuAuGjQD+R0vEeT9Tb9OIEpLy3OKXxW9TKTAitGXN2/P3KmfzEA0=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
	by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TyRayDS2lcce; Fri,  4 Nov 2022 14:41:39 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (T-EXCH-02.corp.yadro.com [172.17.10.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Postfix) with ESMTPS id E79F24121C;
	Fri,  4 Nov 2022 14:41:38 +0300 (MSK)
Received: from T-EXCH-09.corp.yadro.com (172.17.11.59) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Fri, 4 Nov 2022 14:41:38 +0300
Received: from T-EXCH-08.corp.yadro.com (172.17.11.58) by
 T-EXCH-09.corp.yadro.com (172.17.11.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.9; Fri, 4 Nov 2022 14:41:38 +0300
Received: from T-EXCH-08.corp.yadro.com ([172.17.11.58]) by
 T-EXCH-08.corp.yadro.com ([172.17.11.58]) with mapi id 15.02.1118.009; Fri, 4
 Nov 2022 14:41:38 +0300
From: Sergey Zhmylev <s.zhmylev@yadro.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] wic: make ext2/3/4 images reproducible
Thread-Topic: [OE-core] [PATCH] wic: make ext2/3/4 images reproducible
Thread-Index: AQHY75ifwO4+DK+R9EW86zJpxlpD7K4tKp0AgAAu8ACAADHzgIAA4NqAgAAG9AA=
Date: Fri, 4 Nov 2022 11:41:37 +0000
Message-ID: <f41bdfd58f6464b2dc923899a2949d6a3ef8ff04.camel@yadro.com>
References: <20221103152607.3940380-1-s.zhmylev@yadro.com>
	 <70a1078f7098f7f1a83b88edac014be98b2da46b.camel@linuxfoundation.org>
	 <a4cb2d144c4987413a90c6dfa4821c7ae27be753.camel@yadro.com>
	 <6f749c3ed28b0bfa7be8e55c5e9c9befbea15c09.camel@linuxfoundation.org>
	 <17245D8A840BF023.24945@lists.openembedded.org>
In-Reply-To: <17245D8A840BF023.24945@lists.openembedded.org>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.178.120.250]
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D1E294D97572B4EB90ACE95876BDB21@yadro.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 11:41:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172709

UC5TLiBSaWNoYXJkLCB5b3UgY2FuIGVhc2lseSBjaGVjayBpdCBvbiB5b3VycyBzeXN0ZW0uDQpK
dXN0IG1ha2UgYSBjbGVhbiBidWlsZCBvZiBzb21ldGhpbmcgd2l0aCBhbGwgdGhlIHJlcHJvZHVj
aWJsZSBzdHVmZg0Kc2V0IGFuZCBpbnNwZWN0IHRoZSByZXN1bHRpbmcgRlMgaW1hZ2UuDQoNCkV2
ZW4gd2l0aCBhIHZlcnkgdGlueSBjb3JlIGltYWdlIChsaW51eCArIGJhc2ggKyBjb3JldXRpbHMp
IHRoZXJlIGFyZQ0Kc2V2ZXJhbCBpbm9kZXMgd2l0aCBpbXByb3BlciB0aW1lc3RhbXBzOg0KDQok
IC9zYmluL2RlYnVnZnMgLWYgY21kIC4vcGxhdGZvcm0uaW1nIDI+L2Rldi9udWxsIHxncmVwIC1l
ICdeSW5vZGU6JyAtZQ0KJ210aW1lJyB8cGFzdGUgLSAtIHxncmVwIDIwMjIkDQpJbm9kZTogMSAg
IFR5cGU6IGJhZCB0eXBlICAgIE1vZGU6ICAwMDAwICAgRmxhZ3M6IDB4MCAgIG10aW1lOg0KMHg2
MzY0ZjY3MyAtLSBGcmkgTm92ICA0IDE0OjI0OjM1IDIwMjINCklub2RlOiAyICAgVHlwZTogZGly
ZWN0b3J5ICAgIE1vZGU6ICAwNzU1ICAgRmxhZ3M6IDB4ODAwMDAgICAgICAgbXRpbWU6DQoweDYz
NjRmNjczOjAwMDAwMDAwIC0tIEZyaSBOb3YgIDQgMTQ6MjQ6MzUgMjAyMg0KSW5vZGU6IDcgICBU
eXBlOiByZWd1bGFyICAgIE1vZGU6ICAwNjAwICAgRmxhZ3M6IDB4MCAgICAgbXRpbWU6DQoweDYz
NjRmNjczOjAwMDAwMDAwIC0tIEZyaSBOb3YgIDQgMTQ6MjQ6MzUgMjAyMg0KSW5vZGU6IDggICBU
eXBlOiByZWd1bGFyICAgIE1vZGU6ICAwNjAwICAgRmxhZ3M6IDB4ODAwMDAgICAgICAgICBtdGlt
ZToNCjB4NjM2NGY2NzM6MDAwMDAwMDAgLS0gRnJpIE5vdiAgNCAxNDoyNDozNSAyMDIyDQpJbm9k
ZTogMTEgICBUeXBlOiBkaXJlY3RvcnkgICAgTW9kZTogIDA3MDAgICBGbGFnczogMHg4MDAwMCAg
ICAgIG10aW1lOg0KMHg2MzY0ZjY3MzowMDAwMDAwMCAtLSBGcmkgTm92ICA0IDE0OjI0OjM1IDIw
MjINCklub2RlOiAxMjMgICBUeXBlOiByZWd1bGFyICAgIE1vZGU6ICAwNjY0ICAgRmxhZ3M6IDB4
ODAwMDAgICAgICAgbXRpbWU6DQoweDYzNjRmNjc3OjAwMDAwMDAwIC0tIEZyaSBOb3YgIDQgMTQ6
MjQ6MzkgMjAyMg0KDQpjbWQgaXMganVzdCBhIGNvbW1hbmQgZmlsZSBvZiAic3RhdCA8MTIzPiIg
bGluZXMgZnJvbSAxIHRvIDIwMDAwLg0KLS0gDQpXaXRoIGJlc3Qgd2lzaGVzLA0KU2VyZ2VpIFpo
bXlsZXYNCkVuZ2luZWVyaW5nIGNvbnN1bHRhbnQNCk9TIGRldmVsb3BtZW50IGRlcGFydG1lbnQN
Cg0KDQoNCk9uIEZyaSwgMjAyMi0xMS0wNCBhdCAxMToxNiArMDAwMCwgU2VyZ2V5IFpobXlsZXYg
d3JvdGU6DQo+IE9uIFRodSwgMjAyMi0xMS0wMyBhdCAyMTo1MSArMDAwMCwgUmljaGFyZCBQdXJk
aWUgd3JvdGU6DQo+ID4gDQo+ID4gT24gVGh1LCAyMDIyLTExLTAzIGF0IDE4OjUzICswMDAwLCBT
ZXJnZXkgWmhteWxldiB3cm90ZToNCj4gPiA+IEhpIFJpY2hhcmQsDQo+ID4gPiANCj4gPiA+IFRo
YW5rIHlvdSBmb3IgdGhlIGNvbW1lbnQhDQo+ID4gPiBXZWxsLCB0aGUgZW52aXJvbm1lbnQgZGVz
Y3JpYmVkIGluIHJlcHJvZHVjaWJsZSBndWlkZXMgY3VycmVudGx5DQo+ID4gPiBkb2VzDQo+ID4g
PiBub3QgcHJvdmlkZSBiaW5hcnkgcmVwcm9kdWNhYmlsaXR5IGR1ZSB0byBleHRmcyBpbXBsZW1l
bnRhdGlvbi4NCj4gPiANCj4gPiBBZ3JlZWQsIHRoZXJlIGlzIGFuIGlzc3VlIGhlcmUuIEkganVz
dCBkb24ndCB0aGluayB0aGUgcGF0Y2ggbG9va3MNCj4gPiBxdWl0ZSByaWdodC4NCj4gPiANCj4g
PiA+IE1vcmVvdmVyLCBidWlsZGluZyBvbiBzb21lIEZTIChmb3IgZXhhbXBsZSBtb3VudGVkIHdp
dGggbm9hdGltZQ0KPiA+ID4gb3INCj4gPiA+IG5vdCBzdXBwb3J0aW5nIGNydGltZSBmaWVsZCBh
dCBhbGwgbGlrZSBVRlMpIG1ha2VzIHRoZSBleHRmcw0KPiA+ID4gY3JlYXRpb24NCj4gPiA+IHBy
b2Nlc3MgdG90YWxseSBub3QgcmVwcm9kdWNpYmxlIGluIHNwaXRlIG9mIGFueSBtb2RpZmljYXRp
b25zIG9uDQo+ID4gPiB0aGUNCj4gPiA+IHNvdXJjZSBmaWxlcy4NCj4gPiANCj4gPiBZb3UncmUg
YXJndWluZyB3ZSBuZWVkIHRvIHNldCBjcnRpbWUsIGN0aW1lIGFuZCBhdGltZSB3aGljaCBJIGNh
bg0KPiA+IGJlbGlldmUuIFRoZSBtdGltZSBob3dldmVyIHNob3VsZCBiZSBmaW5lIGZyb20gdGhl
IHBhY2thZ2UgbWFuYWdlcg0KPiA+IHNvDQo+ID4gSQ0KPiA+IGRvbid0IHRoaW5rIHRoaXMgcGF0
Y2ggc2hvdWxkIGJlIGNoYW5naW5nIGl0Lg0KPiA+IA0KPiA+IFRoZXJlIG1heSBiZSBhIGNhc2Ug
Zm9yIGp1c3Qgc2V0dGluZyB0aGUgb3RoZXJzIHRvIG10aW1lIGluc3RlYWQgb2YNCj4gPiBTREUN
Cj4gPiB0b28/DQo+IA0KPiBVbmZvcnR1bmF0ZWx5LCB0aGVyZSBpcyBubyBvdGhlciB3YXkgdG8g
cHJvcGVybHkgZ2V0IG10aW1lIG9mIHRoZQ0KPiBmaWxlcw0KPiBpbiBvcmRlciB0byBjbG9uZSBp
dCBpbnRvIGF0aW1lL2N0aW1lL2NydGltZSwgdGhhbiBjcmVhdGUgYSBsYXJnZQ0KPiBsaXN0aW5n
IG9mIHRoZSBmaWxlcyBhbmQgYXNrIGRlYnVnZnMgdG8gcHJpbnQgc3RhdCBpbmZvcm1hdGlvbiwg
YW5kDQo+IHRoZW4gcGFyc2UgdGhlIGxvbmcgb3V0cHV0IGNyZWF0aW5nIGEgZGVidWdmcyBzY3Jp
cHQuDQo+IFRoaXMgcHJvY2VzcyBjYW4gbGVhZCB0byBhZGRpdGlvbmFsIGJ1Z3MgYW5kIHdpbGwg
dGFrZSBhIHRpbWUuDQo+IA0KPiA+IA0KPiA+ID4gSSd2ZSBjaGVja2VkIHRoZSBiZWhhdmlvdXIg
dW5kZXIgbXVsdGlwbGUgY29uZGl0aW9ucywgZG91YmxlDQo+ID4gPiBjaGVja2luZw0KPiA+ID4g
dGhhdCBJJ3ZlIHNldCBhcyBtdWNoIHJlcHJvZHVjaWJsZSBzdHVmZiBhcyBwb3NzaWJsZSwgYW5k
IGl0DQo+ID4gPiBjb21lcw0KPiA+ID4gb3V0IHRoYXQgaW4gY2VydGFpbiBjaXJjdW1zdGFuY2Vz
IHJvb3RmcyBmaWxlcyBoYXZlIGluY29ycmVjdA0KPiA+ID4gdGltZXN0YW1wcyAtLSB0aGV5J3Jl
IHNldCB0byB0aGUgYnVpbGQgcHJvY2VzcyB0aW1lLg0KPiA+IA0KPiA+IFdoaWNoIHRpbWVzdGFt
cHMgdGhvdWdoPyBJc24ndCBtdGltZSBvaz8NCj4gDQo+IG10aW1lICJtb3N0bHkiIGxvb2tzIG9r
LCB3aGlsZSB0aGUgb3RoZXJzIHdlcmUgZGVmaW5pdGVseSBiYWQuDQo+IFRoZXJlIHdlcmUgc2V2
ZXJhbCBmaWxlcywgbm90IG9ubHkgZnN0YWIgYmVmb3JlIG15IHByZXZpb3VzIHBhdGNoLA0KPiBi
dXQNCj4gYWxzbyBycG1kYi5zcWxpdGUgYW5kIHNvbWUgZG5mLXJlbGF0ZWQgc3R1ZmYsIGFuZCBz
byBvbiwgb24gd2hpY2gNCj4gbXRpbWUNCj4gd2FzIHNldCBpbXByb3Blcmx5IGFueXdheXMuDQo+
IA0KPiBBY2NvcmRpbmcgdG8gaHR0cHM6Ly9yZXByb2R1Y2libGUtYnVpbGRzLm9yZy9kb2NzL3Nv
dXJjZS1kYXRlLQ0KPiBlcG9jaC/CoGlmDQo+IHRoZSB1c2VyIHNwZWNpZmllZCBTREUsIHRoZSAi
bGFzdCBtb2RpZmljYXRpb24gb2Ygc29tZXRoaW5nIiAoYWthDQo+IG10aW1lKSBtdXN0IGJlIHNl
dCB0byB0aGlzIHZhbHVlLg0KPiANCj4gVGFraW5nIGFsbCB0aGUgYWJvdmUgaW50byBhY2NvdW50
LCB0aGVyZSBpcyBub3RoaW5nIGJhZCBpbiBjaGFuZ2luZw0KPiBhbGwNCj4gdGhlIGlub2RlcyB0
aW1lc3RhbXBzOiBtdGltZSAoU0RFIHJlcXVpcmVtZW50KSBhbmQgYXRpbWUvY3RpbWUvY3J0aW1l
DQo+ICh0byBvdmVyY29tZSBleHRmcyBidWlsZGluZyBpc3N1ZXMpIHRvIHRoZSBzYW1lIHZhbHVl
IC0tIHNwZWNpZmllZCBieQ0KPiB0aGUgdXNlci4gDQo+IA0KPiA+IA0KPiA+ID4gU28gSSdtIHN1
cmUgdGhhdCBpZiB0aGUgdXNlciBzZXQgU0RFIHRvIGEgcGFydGljdWxhciB0aW1lc3RhbXAsDQo+
ID4gPiB3ZQ0KPiA+ID4gc2hvdWxkIGFsc28gbW9kaWZ5IGF0aW1lLCBjdGltZSBhbmQgY3J0aW1l
Lg0KPiA+ID4gDQo+ID4gPiBQLlMuIG92ZXJyaWRpbmcgb25seSB0aGUgdGltZSBsYXRlciB0aGFu
IFNERSBjb3VsZCBoYXZlIGFsc28gYmVlbg0KPiA+ID4gYW4NCj4gPiA+IG9wdGlvbiwgYnV0IGlu
IHJlYWxpdHkgd2UgY2FuIG5vdCBzdXJlbHkgZ2F0aGVyIHN0YXQgaW5mbyBmb3INCj4gPiA+IGVh
Y2gNCj4gPiA+IGZpbGUgd2l0aG91dCBkZWJ1Z2ZzIG9yIHNpbWlsYXIgdG9vbHMgYW5kIHRoaXMg
d2lsbCB0cmVtZW5kb3VzbHkNCj4gPiA+IGRlZ3JhZGF0ZSBwZXJmb3JtYW5jZSBvZiBhbHJlYWR5
IHByZXR0eSBzbG93IGltYWdlIGNyZWF0aW9uDQo+ID4gPiBwcm9jZXNzLg0KPiA+ID4gRHVlIHRv
IHRoaXMgSSBzdWdnZXN0IHRoZSBwYXRjaCBJJ3ZlIHNlbnQuDQo+ID4gDQo+ID4gVGhhdCBzdGF0
IGluZm9ybWF0aW9uIHNob3VsZCBhbHJlYWR5IGJlIHByZXNlbnQ/DQo+IA0KPiBSaWdodCwgYnV0
IGFzIEkgc2FpZCwgaXQncyBwcmV0dHkgdHJpY2t5IHRvIG9idGFpbiBpdCBmb3IgbGF0ZXIgdXNl
Lg0KPiANCj4gPiANCj4gPiBDaGVlcnMsDQo+ID4gDQo+ID4gUmljaGFyZA0KPiA+IA0KPiANCj4g
VGhhbmsgeW91LCBSaWNoYXJkDQo+IA0KPiAtLSANCj4gV2l0aCBiZXN0IHdpc2hlcywNCj4gU2Vy
Z2VpIFpobXlsZXYNCj4gRW5naW5lZXJpbmcgY29uc3VsdGFudA0KPiBPUyBkZXZlbG9wbWVudCBk
ZXBhcnRtZW50DQo+IA0KPiANCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlv
dSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkg
T25saW5lICgjMTcyNzA4KToNCj4gaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3Bl
bmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8xNzI3MDgNCj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczov
L2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvOTQ3NTg3ODkvNzIyMDU0Ng0KPiBHcm91cCBPd25l
cjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1
YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLQ0K
PiBjb3JlL3Vuc3ViwqBbcy56aG15bGV2QHlhZHJvLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09
LT0tPS0NCj4gDQo=

