Return-Path: <yumx@amazon.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E44D20683
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 22:43:52 +0000 (UTC)
Received: from smtp-fw-80009.amazon.com (smtp-fw-80009.amazon.com [99.78.197.220])
 by mx.groups.io with SMTP id smtpd.web10.10062.1729032229237567484
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 15:43:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=p6Z5Gigi;
 spf=pass (domain: amazon.com, ip: 99.78.197.220, mailfrom: prvs=011d078cb=yumx@amazon.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1729032229; x=1760568229;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=oTSF+d7tnZd8WF6UKBakbj0eyXHhrfJ/q2U18au9aRQ=;
  b=p6Z5GigitupxcmfZ3Fe91hHmV8P6aSznkUckrxO7ggxqAZhZtqFFeSxC
   4RutZohvPTTqIaDUT/SBGaKT9+Lb03Ljbc6h6gl1Jfmp8s3c6RYxyTlqd
   VRDQJt5ShrA2ml7oXIDnlcsrdlhuQQ7YYyRYC+gbkTnDKgzWnCBddofGy
   I=;
X-IronPort-AV: E=Sophos;i="6.11,206,1725321600"; 
   d="scan'208";a="138422033"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-80009.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 22:43:47 +0000
Received: from EX19MTAUWB001.ant.amazon.com [10.0.7.35:20413]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.0.29:2525] with esmtp (Farcaster)
 id ba38afd9-b5b4-4260-8640-a42aa88f9bb9; Tue, 15 Oct 2024 22:43:45 +0000 (UTC)
X-Farcaster-Flow-ID: ba38afd9-b5b4-4260-8640-a42aa88f9bb9
Received: from EX19D007UWA003.ant.amazon.com (10.13.138.213) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Tue, 15 Oct 2024 22:43:44 +0000
Received: from EX19D020UWC002.ant.amazon.com (10.13.138.147) by
 EX19D007UWA003.ant.amazon.com (10.13.138.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Tue, 15 Oct 2024 22:43:43 +0000
Received: from EX19D020UWC002.ant.amazon.com ([fe80::25b5:6dfd:9e72:d82]) by
 EX19D020UWC002.ant.amazon.com ([fe80::25b5:6dfd:9e72:d82%5]) with mapi id
 15.02.1258.034; Tue, 15 Oct 2024 22:43:43 +0000
From: "Yu, Max" <yumx@amazon.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
CC: "Sobon, Przemyslaw" <psobon@amazon.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] sstate: remove corrupted artifacts from local
 mirror
Thread-Topic: [OE-core] [PATCH] sstate: remove corrupted artifacts from local
 mirror
Thread-Index: AQHbH1Owxq2th/IZx0a3BdwH89BsfQ==
Date: Tue, 15 Oct 2024 22:43:43 +0000
Message-ID: <F3CE27E5-346C-4673-A31B-3D2C85379F88@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.106.100.30]
Content-Type: text/plain; charset="utf-8"
Content-ID: <7EB0672D91E10A48A48D9BD38A08F05C@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 22:43:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205952

PiA+ID4gU28gdGhhdCdzIHRoZSB0cmlja3kgdGhpbmcgZm9yIHVzLiBXZSB3aWxsIGhhdmUgdG8g
cnVuIHRoZSBzY3JpcHQgYXQNCj4gPiA+IGEgdGltZSB3aW5kb3cgd2hlcmUgbm8gYnVpbGRzIGFy
ZSBoYXBwZW5pbmcuIEJlY2F1c2Ugd2hlbiBJIHRyaWVkDQo+ID4gPiBkZWxldGluZyBjb3JydXB0
ZWQgb2JqZWN0cyBmcm9tIHRoZSBzMyBzc3RhdGUgY2FjaGUgbWFudWFsbHksIHRoZQ0KPiA+ID4g
Y29ycnVwdGVkIHNzdGF0ZSBvYmplY3QgZW5kZWQgdXAgYmVpbmcgcmV1cGxvYWRlZCBieSBvbmdv
aW5nDQo+ID4gPiBidWlsZHMuLi4gQW5kIHRoaXMgaXMgcHJldHR5IGRpZmZpY3VsdCB0byBleGVj
dXRlIHJlbGlhYmx5LCBzaW5jZSB3ZQ0KPiA+ID4gaGF2ZSBzbyBtYW55IGJ1aWxkcy4NCj4gPg0K
PiA+IEknbSBhIGxpdHRsZSBiaXQgcHV6emxlZCBoZXJlLiBIb3cgd291bGQgc29tZXRoaW5nIHVw
bG9hZCB0aGUgY29ycnVwdA0KPiA+IGFydGVmYWN0IGJhY2sgaW50byB0aGUgc3lzdGVtPw0KPg0K
PiBJIGFtIGFsc28gcHV6emxlZCBieSB0aGlzLiBJIHdhcyBnb2luZyB0byBzdWdnZXN0IHRoYXQg
cGVyaGFwcyB0aGVyZSdzDQo+IGEgcmFyZSBidWcgaW4genN0ZCBjb21wcmVzc29yIHRoYXQgZGV0
ZXJtaW5pc3RpY2FsbHkgKGFuZA0KPiByZXByb2R1Y2libHkpIGNyZWF0ZXMgYSBjb3JydXB0IGFy
Y2hpdmUgb24gYSBjZXJ0YWluIGlucHV0LCBiZWNhdXNlDQo+IG9uZ29pbmcgYnVpbGRzIGNhbid0
IHNpbXBseSAncmV1cGxvYWQnIHNvbWV0aGluZyBjb3JydXB0ZWQgdGhhdCBoYXMNCj4gYmVlbiBk
ZWxldGVkIGZyb20gc3N0YXRlLiBCdXQgbWF5YmUgdGhlcmUncyBzb21lIGV4dHJhIHByb3ByaWV0
YXJ5DQo+IGxheWVyIG9mICdvdmVyd3JpdGluZycgYW5kICdzeW5jaHJvbml6YXRpb24nIHdoZXJl
IGFsbCB0aGlzIHRyb3VibGUgaXMNCj4gY29taW5nIGZyb20uDQoNCkp1c3QgZHVnIGludG8gc29t
ZSBvZiB0aGUgZGV0YWlscyBtb3JlLCBtYXliZSB0aGlzIGlzIHJlbGF0ZWQgdG8gaG93IHdlIGlt
cGxlbWVudGVkIHRoZSBzMyBtaXJyb3IuIEZvciBjb250ZXh0LCBvdXIgWW9jdG8gYnVpbGRzIHdv
cmsgbGlrZSB0aGlzIGZvciBhIHJlY2lwZToNCjEuIGRvd25sb2FkIHRoZSBzc3RhdGUgc2lnaW5m
bytvYmplY3QgZnJvbSBzMywgaW50byBvdXIgbG9jYWwgc3N0YXRlIGNhY2hlLiAoSSB0aGluayB0
aGlzIGlzIHVubW9kaWZpZWQgeW9jdG8gbG9naWMgZm9yIG1pcnJvcnMganVzdCB1c2luZyBTU1RB
VEVfTUlSUk9SRElSKQ0KMi4gYnVpbGQNCjMuIHVwbG9hZCB0aGUgbG9jYWwgc2lnaW5mbytvYmpl
Y3QgYmFjayB0byBzMy4gKFRoaXMgb25seSBoYXBwZW5zIGlmIHMzJ3Mgb2JqZWN0IGlzIGRpZmZl
cmVudCkNCg0KVGhlIHJldXBsb2FkIGhhcHBlbnMgd2hlbiB3ZSBkZWxldGUgdGhlIHMzIG9iamVj
dCBiZXR3ZWVuIHN0ZXBzIDEgYW5kIDMsIHdoZXJlIHN0ZXAgMyB3aWxsIGp1c3QgcmV1cGxvYWQg
dGhlaXIgbG9jYWwgc3N0YXRlIGNhY2hlIG9iamVjdHMgKGNvcnJ1cHRlZCBpbiB0aGlzIGNhc2Up
LiBFc3BlY2lhbGx5IHdpdGggaG93IHlvY3RvIHBhcmFsbGVsaXplcyB0YXNrcywgdGhpcyB0aW1l
IHdpbmRvdyBiZXR3ZWVuIDEgYW5kIDIgaXMgcXVpdGUgbGFyZ2UuIEFuZCB3aXRoIHRoZSBudW1i
ZXIgb2YgYnVpbGRzIHRoYXQgaGFwcGVuLCB3ZSB0aGVuIGhhdmUgbm8gcmVsaWFibGUgd2F5IG9m
IGNsZWFuaW5nIG91dCBzMyBzc3RhdGUgb2JqZWN0cy4gTm90ZSB0aGF0LCBldmVuIGlmIHdlIGNo
YW5nZWQgc3RlcCAzIHRvIG9ubHkgdXBsb2FkIGlmIHRoZSBvYmplY3QgZG9lc24ndCBleGlzdCwg
d2Ugd291bGQgc3RpbGwgaGF2ZSB0aGlzIHByb2JsZW0uDQoNClJlZmxlY3Rpbmcgb24gb3VyIHMz
IG1pcnJvciBzZXR1cCwgbWF5YmUgd2UncmUgZG9pbmcgdGhpbmdzIGluIGEgbm9uLXN0YW5kYXJk
IHdheSwgZXNwZWNpYWxseSByZWdhcmRpbmcgc3RlcCAzLg0KDQpIb3cgZG8gZm9sa3Mgbm9ybWFs
bHkgdXBkYXRlIHNzdGF0ZSBtaXJyb3JzPyBEbyBwZW9wbGUgdXN1YWxseSBvbmx5IGhhdmUgYSBz
aW5nbGUvc21hbGwgbnVtYmVyIG9mIHdyaXRlcnM/IChGb3Igb3VyIHVzZSBjYXNlLCB3ZSB3YW50
IHRvIGtlZXAgdGhlIHJlbW90ZSBzc3RhdGUgbWlycm9yIHZlcnkgdXAgdG8gZGF0ZS4pDQoNCg0K
PiBObywgb3ZlcndyaXRpbmcgZmlsZXMgaXMgYSByZWNpcGUgZm9yIGRpc2FzdGVyLiBTZWUgYWJv
dmUsIHlvdSBnZXQNCj4gcGFydGlhbGx5IGNvbXBsZXRlIGZpbGVzIHdoaWNoIGNvbWUgb3V0IGFz
IGNvcnJ1cHRlZC4NCg0KSSB1bmRlcnN0YW5kIHlvdXIgY29uY2VybnMgd2l0aCBvdmVyd3JpdGlu
Zy4gV2hhdCBJIHdhcyBzdWdnZXN0aW5nIHdpdGggIm92ZXJ3cml0aW5nIiB3YXMgbW9yZSBjcmVh
dGluZyBhIG5ldyBmaWxlIGFuZCBgbXZgaW5nIGl0LCB3aGljaCBzaG91bGQgYmUgYXRvbWljLiBT
YW1lIHdpdGggdGhlIHMzIG9wZXJhdGlvbnMgd2UgdXNlIHRvIHVwbG9hZCwgdGhleSB3aWxsIG5v
dCBsZWF2ZSBhIGZpbGUgcGFydGlhbGx5IHdyaXR0ZW4vb3ZlcndyaXR0ZW4gaWYgd2UgdHJ1c3Qg
czMgY2xhaW1zLg0KDQo+IEkgdGhpbmsgdGhpcyBvdmVyd3JpdGluZyBtYXkgYmUgdGhlIHNvdXJj
ZSBvZiB5b3VyIHByb2JsZW1zLiBZb3Ugc2hvdWxkDQo+IG5vdCBuZWVkIHRvIG9yIGJlIGRvaW5n
IHRoaXMuIFdoeSBkbyB5b3UgbmVlZCB0bz8NCj4gDQo+IEl0IGlzIGVhc3kgdG8gYmxhbWUgYml0
IGZsaXBzIGFuZCBwdXQgYSBoYWNrIGludG8gdGhlIHN5c3RlbSB0byBmb3JjZQ0KPiBhbiBvdmVy
d3JpdGUgYnV0IEkgdGhpbmsgeW91IGhhdmUgYSBtb3JlIGZ1bmRhbWVudGFsIGlzc3VlIGdvaW5n
IG9uDQo+IHdoaWNoIHlvdSBtYXkgd2FudCB0byBmaXggcHJvcGVybHkuDQoNCkxpa2UgSSBzYWlk
LCBpdCdzIHByb2JhYmx5IG5vdCBzb21ldGhpbmcgbGlrZSBiaXQgZmxpcHMsIGJ1dCBzaW5jZSB3
ZSBvbmx5IHNlZSB0aGVzZSBjb3JydXB0aW9ucyBhZnRlciBtb3ZpbmcgdG8ga2lya3N0b25lLCBp
dCBtaWdodCBiZSByZWxhdGVkIHRvIHRoaW5ncyBsaWtlIHVzaW5nIHB6c3RkIG9yIG90aGVyIGlu
ZnJhIGNoYW5nZXMuIFRoZSBzMyB1cGxvYWRpbmcvdXBkYXRpbmcgbG9naWMgZGlkIG5vdCBjaGFu
Z2UsIGFuZCB3ZSBhcmUgZXZlbiB1c2luZyB0aGUgc2FtZSBib3RvMyAoYXdzIHB5dGhvbiBjbGll
bnQpIHZlcnNpb25zLiBXZSBkZWZpbml0ZWx5IGRvIGFsc28gd2FudCB0byBmaXggdGhlIGNvcnJ1
cHRpb247IGl0J3MganVzdCBiZWVuIGluY3JlZGlibHkgaGFyZCB0byBuYXJyb3cgZG93biB3aGF0
IGlzIGNhdXNpbmcgaXQuLi4gDQoNClRoYW5rcyBmb3IgeW91ciBoZWxwIGFuZCBwYXRpZW5jZSwN
Ck1heA0KDQo=

