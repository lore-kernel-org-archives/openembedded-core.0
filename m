Return-Path: <s.zhmylev@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BE32C433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 11:17:00 +0000 (UTC)
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.252])
 by mx.groups.io with SMTP id smtpd.web10.9901.1667560609642064678
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Nov 2022 04:16:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@yadro.com header.s=mta-01 header.b=T7V9qkDP;
 spf=pass (domain: yadro.com, ip: 89.207.88.252, mailfrom: s.zhmylev@yadro.com)
Received: from localhost (unknown [127.0.0.1])
	by mta-01.yadro.com (Postfix) with ESMTP id 673F841237;
	Fri,  4 Nov 2022 11:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
	mime-version:content-transfer-encoding:content-id:content-type
	:content-type:content-language:accept-language:in-reply-to
	:references:message-id:date:date:subject:subject:from:from
	:received:received:received:received:received; s=mta-01; t=
	1667560605; x=1669375006; bh=cI4ApZjW/ZH87CdVyRdb0MHv9DTUocpAQtM
	0z4CRUnc=; b=T7V9qkDPl++RN8sjcNkLreyyNaRf+5PKa6Cz57k4VdMWaj0jcsY
	ws/53I5D8VXZ9ULc9+59A0M7gkLjFLSsSiuhOMB6RLQ7uvvqE6fTmo9Jt2TimRoL
	ZCKKgYH9yLyuPbsvlMSP1IMV8boE2/GfTIV+DocAPTyiscOs9TJOvzhg=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
	by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3huIQlJ8o2lh; Fri,  4 Nov 2022 14:16:45 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (T-EXCH-02.corp.yadro.com [172.17.10.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Postfix) with ESMTPS id 51EE74121C;
	Fri,  4 Nov 2022 14:16:45 +0300 (MSK)
Received: from T-Exch-05.corp.yadro.com (172.17.10.109) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Fri, 4 Nov 2022 14:16:45 +0300
Received: from T-EXCH-08.corp.yadro.com (172.17.11.58) by
 T-Exch-05.corp.yadro.com (172.17.10.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.9; Fri, 4 Nov 2022 14:16:44 +0300
Received: from T-EXCH-08.corp.yadro.com ([172.17.11.58]) by
 T-EXCH-08.corp.yadro.com ([172.17.11.58]) with mapi id 15.02.1118.009; Fri, 4
 Nov 2022 14:16:44 +0300
From: Sergey Zhmylev <s.zhmylev@yadro.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] wic: make ext2/3/4 images reproducible
Thread-Topic: [OE-core] [PATCH] wic: make ext2/3/4 images reproducible
Thread-Index: AQHY75ifwO4+DK+R9EW86zJpxlpD7K4tKp0AgAAu8ACAADHzgIAA4NqA
Date: Fri, 4 Nov 2022 11:16:44 +0000
Message-ID: <f7e064ae844cd96077a0a2425b0a6bfec2ef3c28.camel@yadro.com>
References: <20221103152607.3940380-1-s.zhmylev@yadro.com>
	 <70a1078f7098f7f1a83b88edac014be98b2da46b.camel@linuxfoundation.org>
	 <a4cb2d144c4987413a90c6dfa4821c7ae27be753.camel@yadro.com>
	 <6f749c3ed28b0bfa7be8e55c5e9c9befbea15c09.camel@linuxfoundation.org>
In-Reply-To: <6f749c3ed28b0bfa7be8e55c5e9c9befbea15c09.camel@linuxfoundation.org>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.178.120.250]
Content-Type: text/plain; charset="utf-8"
Content-ID: <C3591ABADA42014582C8A726DFC85815@yadro.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 11:17:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172708

T24gVGh1LCAyMDIyLTExLTAzIGF0IDIxOjUxICswMDAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToN
Cj4gwqvQktC90LjQvNCw0L3QuNC1ISDQlNCw0L3QvdC+0LUg0L/QuNGB0YzQvNC+INC+0YIg0LLQ
vdC10YjQvdC10LPQviDQsNC00YDQtdGB0LDRgtCwIcK7DQo+IA0KPiBPbiBUaHUsIDIwMjItMTEt
MDMgYXQgMTg6NTMgKzAwMDAsIFNlcmdleSBaaG15bGV2IHdyb3RlOg0KPiA+IEhpIFJpY2hhcmQs
DQo+ID4gDQo+ID4gVGhhbmsgeW91IGZvciB0aGUgY29tbWVudCENCj4gPiBXZWxsLCB0aGUgZW52
aXJvbm1lbnQgZGVzY3JpYmVkIGluIHJlcHJvZHVjaWJsZSBndWlkZXMgY3VycmVudGx5DQo+ID4g
ZG9lcw0KPiA+IG5vdCBwcm92aWRlIGJpbmFyeSByZXByb2R1Y2FiaWxpdHkgZHVlIHRvIGV4dGZz
IGltcGxlbWVudGF0aW9uLg0KPiANCj4gQWdyZWVkLCB0aGVyZSBpcyBhbiBpc3N1ZSBoZXJlLiBJ
IGp1c3QgZG9uJ3QgdGhpbmsgdGhlIHBhdGNoIGxvb2tzDQo+IHF1aXRlIHJpZ2h0Lg0KPiANCj4g
PiBNb3Jlb3ZlciwgYnVpbGRpbmcgb24gc29tZSBGUyAoZm9yIGV4YW1wbGUgbW91bnRlZCB3aXRo
IG5vYXRpbWUgb3INCj4gPiBub3Qgc3VwcG9ydGluZyBjcnRpbWUgZmllbGQgYXQgYWxsIGxpa2Ug
VUZTKSBtYWtlcyB0aGUgZXh0ZnMNCj4gPiBjcmVhdGlvbg0KPiA+IHByb2Nlc3MgdG90YWxseSBu
b3QgcmVwcm9kdWNpYmxlIGluIHNwaXRlIG9mIGFueSBtb2RpZmljYXRpb25zIG9uDQo+ID4gdGhl
DQo+ID4gc291cmNlIGZpbGVzLg0KPiANCj4gWW91J3JlIGFyZ3Vpbmcgd2UgbmVlZCB0byBzZXQg
Y3J0aW1lLCBjdGltZSBhbmQgYXRpbWUgd2hpY2ggSSBjYW4NCj4gYmVsaWV2ZS4gVGhlIG10aW1l
IGhvd2V2ZXIgc2hvdWxkIGJlIGZpbmUgZnJvbSB0aGUgcGFja2FnZSBtYW5hZ2VyIHNvDQo+IEkN
Cj4gZG9uJ3QgdGhpbmsgdGhpcyBwYXRjaCBzaG91bGQgYmUgY2hhbmdpbmcgaXQuDQo+IA0KPiBU
aGVyZSBtYXkgYmUgYSBjYXNlIGZvciBqdXN0IHNldHRpbmcgdGhlIG90aGVycyB0byBtdGltZSBp
bnN0ZWFkIG9mDQo+IFNERQ0KPiB0b28/DQoNClVuZm9ydHVuYXRlbHksIHRoZXJlIGlzIG5vIG90
aGVyIHdheSB0byBwcm9wZXJseSBnZXQgbXRpbWUgb2YgdGhlIGZpbGVzDQppbiBvcmRlciB0byBj
bG9uZSBpdCBpbnRvIGF0aW1lL2N0aW1lL2NydGltZSwgdGhhbiBjcmVhdGUgYSBsYXJnZQ0KbGlz
dGluZyBvZiB0aGUgZmlsZXMgYW5kIGFzayBkZWJ1Z2ZzIHRvIHByaW50IHN0YXQgaW5mb3JtYXRp
b24sIGFuZA0KdGhlbiBwYXJzZSB0aGUgbG9uZyBvdXRwdXQgY3JlYXRpbmcgYSBkZWJ1Z2ZzIHNj
cmlwdC4NClRoaXMgcHJvY2VzcyBjYW4gbGVhZCB0byBhZGRpdGlvbmFsIGJ1Z3MgYW5kIHdpbGwg
dGFrZSBhIHRpbWUuDQoNCj4gDQo+ID4gSSd2ZSBjaGVja2VkIHRoZSBiZWhhdmlvdXIgdW5kZXIg
bXVsdGlwbGUgY29uZGl0aW9ucywgZG91YmxlDQo+ID4gY2hlY2tpbmcNCj4gPiB0aGF0IEkndmUg
c2V0IGFzIG11Y2ggcmVwcm9kdWNpYmxlIHN0dWZmIGFzIHBvc3NpYmxlLCBhbmQgaXQgY29tZXMN
Cj4gPiBvdXQgdGhhdCBpbiBjZXJ0YWluIGNpcmN1bXN0YW5jZXMgcm9vdGZzIGZpbGVzIGhhdmUg
aW5jb3JyZWN0DQo+ID4gdGltZXN0YW1wcyAtLSB0aGV5J3JlIHNldCB0byB0aGUgYnVpbGQgcHJv
Y2VzcyB0aW1lLg0KPiANCj4gV2hpY2ggdGltZXN0YW1wcyB0aG91Z2g/IElzbid0IG10aW1lIG9r
Pw0KDQptdGltZSAibW9zdGx5IiBsb29rcyBvaywgd2hpbGUgdGhlIG90aGVycyB3ZXJlIGRlZmlu
aXRlbHkgYmFkLg0KVGhlcmUgd2VyZSBzZXZlcmFsIGZpbGVzLCBub3Qgb25seSBmc3RhYiBiZWZv
cmUgbXkgcHJldmlvdXMgcGF0Y2gsIGJ1dA0KYWxzbyBycG1kYi5zcWxpdGUgYW5kIHNvbWUgZG5m
LXJlbGF0ZWQgc3R1ZmYsIGFuZCBzbyBvbiwgb24gd2hpY2ggbXRpbWUNCndhcyBzZXQgaW1wcm9w
ZXJseSBhbnl3YXlzLg0KDQpBY2NvcmRpbmcgdG8gaHR0cHM6Ly9yZXByb2R1Y2libGUtYnVpbGRz
Lm9yZy9kb2NzL3NvdXJjZS1kYXRlLWVwb2NoLyBpZg0KdGhlIHVzZXIgc3BlY2lmaWVkIFNERSwg
dGhlICJsYXN0IG1vZGlmaWNhdGlvbiBvZiBzb21ldGhpbmciIChha2ENCm10aW1lKSBtdXN0IGJl
IHNldCB0byB0aGlzIHZhbHVlLg0KDQpUYWtpbmcgYWxsIHRoZSBhYm92ZSBpbnRvIGFjY291bnQs
IHRoZXJlIGlzIG5vdGhpbmcgYmFkIGluIGNoYW5naW5nIGFsbA0KdGhlIGlub2RlcyB0aW1lc3Rh
bXBzOiBtdGltZSAoU0RFIHJlcXVpcmVtZW50KSBhbmQgYXRpbWUvY3RpbWUvY3J0aW1lDQoodG8g
b3ZlcmNvbWUgZXh0ZnMgYnVpbGRpbmcgaXNzdWVzKSB0byB0aGUgc2FtZSB2YWx1ZSAtLSBzcGVj
aWZpZWQgYnkNCnRoZSB1c2VyLiANCg0KPiANCj4gPiBTbyBJJ20gc3VyZSB0aGF0IGlmIHRoZSB1
c2VyIHNldCBTREUgdG8gYSBwYXJ0aWN1bGFyIHRpbWVzdGFtcCwgd2UNCj4gPiBzaG91bGQgYWxz
byBtb2RpZnkgYXRpbWUsIGN0aW1lIGFuZCBjcnRpbWUuDQo+ID4gDQo+ID4gUC5TLiBvdmVycmlk
aW5nIG9ubHkgdGhlIHRpbWUgbGF0ZXIgdGhhbiBTREUgY291bGQgaGF2ZSBhbHNvIGJlZW4NCj4g
PiBhbg0KPiA+IG9wdGlvbiwgYnV0IGluIHJlYWxpdHkgd2UgY2FuIG5vdCBzdXJlbHkgZ2F0aGVy
IHN0YXQgaW5mbyBmb3IgZWFjaA0KPiA+IGZpbGUgd2l0aG91dCBkZWJ1Z2ZzIG9yIHNpbWlsYXIg
dG9vbHMgYW5kIHRoaXMgd2lsbCB0cmVtZW5kb3VzbHkNCj4gPiBkZWdyYWRhdGUgcGVyZm9ybWFu
Y2Ugb2YgYWxyZWFkeSBwcmV0dHkgc2xvdyBpbWFnZSBjcmVhdGlvbg0KPiA+IHByb2Nlc3MuDQo+
ID4gRHVlIHRvIHRoaXMgSSBzdWdnZXN0IHRoZSBwYXRjaCBJJ3ZlIHNlbnQuDQo+IA0KPiBUaGF0
IHN0YXQgaW5mb3JtYXRpb24gc2hvdWxkIGFscmVhZHkgYmUgcHJlc2VudD8NCg0KUmlnaHQsIGJ1
dCBhcyBJIHNhaWQsIGl0J3MgcHJldHR5IHRyaWNreSB0byBvYnRhaW4gaXQgZm9yIGxhdGVyIHVz
ZS4NCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KPiANCg0KVGhhbmsgeW91LCBSaWNo
YXJkDQoNCi0tIA0KV2l0aCBiZXN0IHdpc2hlcywNClNlcmdlaSBaaG15bGV2DQpFbmdpbmVlcmlu
ZyBjb25zdWx0YW50DQpPUyBkZXZlbG9wbWVudCBkZXBhcnRtZW50DQoNCg==

