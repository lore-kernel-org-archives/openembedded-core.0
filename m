Return-Path: <s.zhmylev@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD0EC678D4
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 12:29:45 +0000 (UTC)
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.252])
 by mx.groups.io with SMTP id smtpd.web11.85109.1673612976846140820
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jan 2023 04:29:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yadro.com header.s=mta-01 header.b=dpcGwI5b;
 spf=pass (domain: yadro.com, ip: 89.207.88.252, mailfrom: s.zhmylev@yadro.com)
Received: from mta-01.yadro.com (localhost.localdomain [127.0.0.1])
	by mta-01.yadro.com (Proxmox) with ESMTP id 471B23419DA;
	Fri, 13 Jan 2023 15:29:34 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; h=cc
	:cc:content-id:content-transfer-encoding:content-type
	:content-type:date:from:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=mta-01; bh=opjaP3F
	C9eME0rt7yvlTG5vqxuzh+JyeqeR7L59dvKA=; b=dpcGwI5bHztIummF0B99HPO
	l3Lcqsh+k7t2LxHRCYS35NuRXr1B8+XjFoihRjACcSeh+tqGy9JQdhxgWzbC2/aE
	ZgzTj/vnN1QFvbImkrb4oHsyIsRkwW+irrbggmKwsgSvFW41fDONTbASTFjyqjyB
	h53rfNEgWGzyn6KXJhn4=
Received: from T-EXCH-07.corp.yadro.com (unknown [172.17.10.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Proxmox) with ESMTPS id 388743419D6;
	Fri, 13 Jan 2023 15:29:34 +0300 (MSK)
Received: from T-EXCH-06.corp.yadro.com (172.17.10.110) by
 T-EXCH-07.corp.yadro.com (172.17.11.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.9; Fri, 13 Jan 2023 15:29:34 +0300
Received: from T-EXCH-08.corp.yadro.com (172.17.11.58) by
 T-EXCH-06.corp.yadro.com (172.17.10.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.15; Fri, 13 Jan 2023 15:29:33 +0300
Received: from T-EXCH-08.corp.yadro.com ([172.17.11.58]) by
 T-EXCH-08.corp.yadro.com ([172.17.11.58]) with mapi id 15.02.1118.009; Fri,
 13 Jan 2023 15:29:33 +0300
From: Sergey Zhmylev <s.zhmylev@yadro.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] package_rpm: allow arch overriding
Thread-Topic: [OE-core] [PATCH] package_rpm: allow arch overriding
Thread-Index: AQHZJs17x/I5syU4EUCG/XLoSxy3Eq6bK48AgAClpICAAAKyAIAACxwAgAAKBICAAALOgIAAKaiA
Date: Fri, 13 Jan 2023 12:29:33 +0000
Message-ID: <2ef83acb208a3e7222b699a6ecf894b184f87444.camel@yadro.com>
References: <20230112213301.11768-1-s.zhmylev@yadro.com>
	 <a956c7ec6640cfee5bebb41720beec74e8b663cf.camel@linuxfoundation.org>
	 <dca56133ff38a2700cdeda8832d187e8f1863a63.camel@yadro.com>
	 <CANNYZj89sJH398ksmtB-TRcTOW6_MYKsDdCie3mHe7QRvKu47Q@mail.gmail.com>
	 <8eae30b2192df5bae48ad7c8eb028b868ef89e55.camel@yadro.com>
	 <ea059c6fd86267376a501008384d57dd9c7f96fa.camel@linuxfoundation.org>
	 <CANNYZj-P38yonASaKJFq_r+KvKvX6wj_7j7O=NFR3=SeUt-38Q@mail.gmail.com>
In-Reply-To: <CANNYZj-P38yonASaKJFq_r+KvKvX6wj_7j7O=NFR3=SeUt-38Q@mail.gmail.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.3.38]
Content-Type: text/plain; charset="utf-8"
Content-ID: <69E0CC515D9BF34694B32AADB80EE5FE@yadro.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 12:29:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175823

PiBPbmUgbW9yZSB0aGluZyBJIHdhbnQgdG8gbWVudGlvbiBpcyB0aGF0IGlmIHlvdSB3YW50IHRv
IGFsaWduIHRoZQ0KPiBhcmNoaXRlY3R1cmVzIHNvIHRoYXQgeW91IGNhbiBpbnN0YWxsIFJQTXMg
ZnJvbSBGZWRvcmEsIFJIRUwgb3IgYW55DQo+IG90aGVyIFJQTS1iYXNlZCBiaW5hcnkgZGlzdHJv
LCBkb24ndC4gSXQncyBub3QgZ29pbmcgdG8gd29yayBhdCBhbGwsDQo+IG9yIHdpbGwgY2F1c2Ug
eW91IGxvdHMgb2YgcGFpbiBhbmQgc3VmZmVyaW5nLiBXZSB1c2UgcnBtIGZvciBpdHMNCj4gcGFj
a2FnaW5nIGFuZCBkZXBlbmRlbmN5IHJlc29sdXRpb24gZnVuY3Rpb25zLCBidXQgbm8gb25lIGV2
ZXINCj4gcHJvbWlzZWQgYW55IGtpbmQgb2YgJ2NvbXBhdGliaWxpdHknIHdpdGggUmVkIEhhdCBw
cm9kdWN0cy4NCj4gDQoNCkluZGVlZCwgSSdtIG5vdCBnb2luZyB0byBhbGlnbiB0aG9zZSBuYW1l
cyBmb3IgdGhpcy4gIE1vcmVvdmVyLCBmb3INCnRoaXMgcGFydGljdWxhciBjYXNlIHJwbSgxKSBz
dXBwb3J0cyBzZXZlcmFsIHBhcmFtZXRlcnMgdG8gZGlzYWJsZQ0KYXJjaC9vcy9ldGMgY2hlY2tz
Lg0KDQo+IFNvIG5vLCBJIGRvbid0IHRoaW5rIHdlIHNob3VsZCBiZSB0YWtpbmcgYSBwYXRjaCB3
aGljaCB3b3VsZCBqdXN0DQo+IGNvbmZ1c2UgdGhpbmdzIGZvciB3aGF0IHNlZW1zIHRvIGJlIGEg
Y29zbWV0aWMgcmVhc29uLg0KPiANCg0KVGhlIHBhdGNoIHByb3Bvc2VkIGlzIG5vdCBhYm91dCBh
IGNvc21ldGljIGNoYW5nZSwgaXQncyBhYm91dCBwcmVjaXNlDQpjb250cm9sIG92ZXIgd2hhdCBw
YWNrYWdpbmcgc3lzdGVtIHByb2R1Y2VzLiAgR2l2ZW4gdGhlIHJlY2lwZXMgY2FuDQpvdmVycmlk
ZSB2YXJpYWJsZXMgd2l0aCBhIHByaW9yaXR5IG92ZXIgYW55IGNvbmZzL2NsYXNzZXMsIGl0IGxv
b2tzDQpsaWtlIHRoZXJlIGlzIG5vIHByb3BlciB3YXkgdG8gb3ZlcmxvYWQgdGhlIHZhbHVlcyAo
aW4gcGFydGljdWxhcg0KUEFDS0FHRV9BUkNIKSB1c2VkIGR1cmluZyBwYWNrYWdpbmcgcHJvY2Vz
cy4gIFNvbWUgdmFyaWFibGVzIGNvdWxkIGJlDQp1c2VkIHRvIGFkanVzdCBUVU5FIGZsYWdzIGFu
ZCB0aGVpciB2YWx1ZXMgc2hvdWxkIHN0YXkgaW50YWN0IHByaW9yIHRvDQpwYWNrYWdpbmcuDQoN
CkFueXdheXMsIHlvdXIgd29yZCB3aWxsIGJlIHRoZSBsYXN0IGJ1dCBJIGFtIHN0aWxsIHN1cmUg
dGhhdCAibW9yZQ0KY29udHJvbCIgaXMgYmV0dGVyIHRoYW4gIm5vIGNvbnJvbCIuIA0KDQpLaW5k
IHdpc2hlcywgU2VyZ2VpDQo=


