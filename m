Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFEDBC71148
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 19:42:57 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.5736.1749843772423816994
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 12:42:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=Z5UPrKXX;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55DJgoAt3213763;
	Fri, 13 Jun 2025 14:42:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749843771;
	bh=W4hA0siFTtT/XRcuy6NPSojfKj4Di2xSndIqINrWHUA=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=Z5UPrKXXWSDLr0UR6U30XvRAOzNmI0Rr4bl4bTTYNrn3/d30pX1IkS3OjxbrinZXe
	 6kcOzaF4M+VKEyVwWo2mQp7Nnv7nOVrud9eSNz25TGgJzSwtQtmWPW23OT9kye826X
	 WVQNg8YY3z/ss+zMqW/wMQkrP8Fm7TwVB/n1RSEU=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55DJgoFk2953395
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 13 Jun 2025 14:42:50 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 13
 Jun 2025 14:42:50 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 13 Jun 2025 14:42:50 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55DJgohY4028210;
	Fri, 13 Jun 2025 14:42:50 -0500
Message-ID: <c165b24c-1d55-439e-859b-6bbae2726acd@ti.com>
Date: Fri, 13 Jun 2025 14:42:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] sstate.bbclass: apply proper umask when
 fetching from SSTATE_MIRROR
To: <richard.purdie@linuxfoundation.org>, Rasmus Villemoes <ravi@prevas.dk>,
        <openembedded-core@lists.openembedded.org>
References: <20250606093905.2715221-1-ravi@prevas.dk>
 <7dfa9fe19ceff14ecb9137044c7e952f759a208e.camel@linuxfoundation.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <7dfa9fe19ceff14ecb9137044c7e952f759a208e.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: base64
X-MIME-Autoconverted: from 8bit to base64 by fllvem-ot03.ext.ti.com id 55DJgoAt3213763
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 19:42:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218624

DQoNCk9uIDYvMTMvMjAyNSAxMTozMCBBTSwgUmljaGFyZCBQdXJkaWUgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+IE9uIEZyaSwgMjAyNS0wNi0wNiBhdCAxMTozOSAr
MDIwMCwgUmFzbXVzIFZpbGxlbW9lcyB3cm90ZToNCj4+IEZyb206IFJhc211cyBWaWxsZW1v
ZXMgPHJhdmlAcHJldmFzLmRrPg0KPj4NCj4+IEN1cnJlbnRseSwgZmlsZXMgYW5kIGRpcmVj
dG9yaWVzIGNyZWF0ZWQgdW5kZXIgJHtTU1RBVEVfRElSfSB3aGVuDQo+PiBmZXRjaGluZyBm
cm9tIGFuIHNzdGF0ZSBtaXJyb3IgYXJlIG5vdCBjcmVhdGVkIHdpdGggZ3JvdXAgd3JpdGUs
DQo+PiB1bmxpa2Ugd2hlbiB0aGUgc3N0YXRlIGFydGlmYWN0cyBhcmUgZ2VuZXJhdGVkIGxv
Y2FsbHkuIFRoYXQncw0KPj4gaW5jb25zaXN0ZW50LCBhbmQgcHJvYmxlbWF0aWMgd2hlbiB0
aGUgbG9jYWwgc3N0YXRlIGRpciBpcyBzaGFyZWQNCj4+IGFtb25nIG11bHRpcGxlIHVzZXJz
Lg0KPj4NCj4+IFdyYXAgdGhlIGZldGNoaW5nIGluIGEgYmIudXRpbHMudW1hc2soKSBjb250
ZXh0IG1hbmFnZXIsIGFuZCBmb3Igc2ltcGxpY2l0eQ0KPj4gbW92ZSB0aGUgbWtkaXIgb2Yg
U1NUQVRFX0RJUiBpbnNpZGUgdGhhdC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBSYXNtdXMg
VmlsbGVtb2VzIDxyYXZpQHByZXZhcy5kaz4NCj4+IC0tLQ0KPj4gIMKgbWV0YS9jbGFzc2Vz
LWdsb2JhbC9zc3RhdGUuYmJjbGFzcyB8IDIyICsrKysrKysrKysrKy0tLS0tLS0tLS0NCj4+
ICDCoDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkN
Cj4+DQo+PiBkaWZmIC0tZ2l0IGEvbWV0YS9jbGFzc2VzLWdsb2JhbC9zc3RhdGUuYmJjbGFz
cyBiL21ldGEvY2xhc3Nlcy1nbG9iYWwvc3N0YXRlLmJiY2xhc3MNCj4+IGluZGV4IDFkN2Iw
MzNiODAuLjI5NjhjYzRjMmUgMTAwNjQ0DQo+PiAtLS0gYS9tZXRhL2NsYXNzZXMtZ2xvYmFs
L3NzdGF0ZS5iYmNsYXNzDQo+PiArKysgYi9tZXRhL2NsYXNzZXMtZ2xvYmFsL3NzdGF0ZS5i
YmNsYXNzDQo+PiBAQCAtNzI2LDcgKzcyNiw2IEBAIGRlZiBwc3RhZ2luZ19mZXRjaChzc3Rh
dGVmZXRjaCwgZCk6DQo+PiAgwqDCoMKgwqAgbG9jYWxkYXRhID0gYmIuZGF0YS5jcmVhdGVD
b3B5KGQpDQo+PiAgIA0KPj4gIMKgwqDCoMKgIGRsZGlyID0gbG9jYWxkYXRhLmV4cGFuZCgi
JHtTU1RBVEVfRElSfSIpDQo+PiAtwqDCoMKgIGJiLnV0aWxzLm1rZGlyaGllcihkbGRpcikN
Cj4+ICAgDQo+PiAgwqDCoMKgwqAgbG9jYWxkYXRhLmRlbFZhcignTUlSUk9SUycpDQo+PiAg
wqDCoMKgwqAgbG9jYWxkYXRhLnNldFZhcignRklMRVNQQVRIJywgZGxkaXIpDQo+PiBAQCAt
NzQ2LDE2ICs3NDUsMTkgQEAgZGVmIHBzdGFnaW5nX2ZldGNoKHNzdGF0ZWZldGNoLCBkKToN
Cj4+ICDCoMKgwqDCoCBpZiBiYi51dGlscy50b19ib29sZWFuKGQuZ2V0VmFyKCJTU1RBVEVf
VkVSSUZZX1NJRyIpLCBGYWxzZSk6DQo+PiAgwqDCoMKgwqDCoMKgwqDCoCB1cmlzICs9IFsn
ZmlsZTovL3swfS5zaWc7ZG93bmxvYWRmaWxlbmFtZT17MH0uc2lnJy5mb3JtYXQoc3N0YXRl
ZmV0Y2gpXQ0KPj4gICANCj4+IC3CoMKgwqAgZm9yIHNyY3VyaSBpbiB1cmlzOg0KPj4gLcKg
wqDCoMKgwqDCoMKgIGxvY2FsZGF0YS5kZWxWYXIoJ1NSQ19VUkknKQ0KPj4gLcKgwqDCoMKg
wqDCoMKgIGxvY2FsZGF0YS5zZXRWYXIoJ1NSQ19VUkknLCBzcmN1cmkpDQo+PiAtwqDCoMKg
wqDCoMKgwqAgdHJ5Og0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmV0Y2hlciA9IGJi
LmZldGNoMi5GZXRjaChbc3JjdXJpXSwgbG9jYWxkYXRhLCBjYWNoZT1GYWxzZSkNCj4+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZldGNoZXIuY2hlY2tzdGF0dXMoKQ0KPj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZmV0Y2hlci5kb3dubG9hZCgpDQo+PiArwqDCoMKgIHdpdGgg
YmIudXRpbHMudW1hc2soMG8wMDIpOg0KPj4gK8KgwqDCoMKgwqDCoMKgIGJiLnV0aWxzLm1r
ZGlyaGllcihkbGRpcikNCj4+ICAgDQo+PiAtwqDCoMKgwqDCoMKgwqAgZXhjZXB0IGJiLmZl
dGNoMi5CQkZldGNoRXhjZXB0aW9uOg0KPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGFz
cw0KPj4gK8KgwqDCoMKgwqDCoMKgIGZvciBzcmN1cmkgaW4gdXJpczoNCj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGxvY2FsZGF0YS5kZWxWYXIoJ1NSQ19VUkknKQ0KPj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgbG9jYWxkYXRhLnNldFZhcignU1JDX1VSSScsIHNyY3VyaSkN
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRyeToNCj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgZmV0Y2hlciA9IGJiLmZldGNoMi5GZXRjaChbc3JjdXJpXSwgbG9j
YWxkYXRhLCBjYWNoZT1GYWxzZSkNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZmV0Y2hlci5jaGVja3N0YXR1cygpDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGZldGNoZXIuZG93bmxvYWQoKQ0KPj4gKw0KPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZXhjZXB0IGJiLmZldGNoMi5CQkZldGNoRXhjZXB0aW9uOg0KPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwYXNzDQo+PiAgIA0KPiANCj4gUHJvYmFibHkgdGhl
IHJpZ2h0IHRoaW5nIHRvIGRvLCBJIGp1c3QgY2FuJ3QgaGVscCB3b25kZXIgaWYgMG8wMDIN
Cj4gc2hvdWxkIGJlIGluIGEgdmFyaWFibGUgbGlrZSBTU1RBVEVfVU1BU0sgb3Igc29tZXRo
aW5nIGp1c3Qgc28gaXQgaXNuJ3QNCj4gc28gaGFyZGNvZGVkLiBJIGRpZCBub3RlIHdlIGFs
cmVhZHkgaGF2ZSBvdGhlciByZWZlcmVuY2VzIHRvIGl0Lg0KDQorMSBmb3IgbmV2ZXIgaGFy
ZCBjb2RpbmcgdGhpbmdzLiAgTWFrZSBpdCBhIHZhcmlhYmxlLCBqdXN0IGluIGNhc2UuDQoN
Cg0KPiBDaGVlcnMsDQo+IA0KPiBSaWNoYXJkDQo+IA0KPiANCj4gDQo+IC09LT0tPS09LT0t
PS09LT0tPS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0
byB0aGlzIGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzIxODYxOCk6IGh0dHBzOi8v
bGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMjE4
NjE4DQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3Jn
L210LzExMzUwMDQxOC82NTUxMDU0DQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29y
ZStvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOiBodHRwczov
L2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YiBbcmVh
dG1vbkB0aS5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IA0KDQotLSANClJ5
YW4gRWF0bW9uICAgICAgICAgICAgICAgIHJlYXRtb25AdGkuY29tDQotLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KVGV4YXMgSW5zdHJ1bWVudHMsIEluYy4g
IC0gIExDUEQgIC0gIE1HVFMNCg==

