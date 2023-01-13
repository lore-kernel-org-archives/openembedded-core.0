Return-Path: <s.zhmylev@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 967FAC54EBE
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 16:01:56 +0000 (UTC)
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.252])
 by mx.groups.io with SMTP id smtpd.web10.91220.1673625712571839765
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jan 2023 08:01:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yadro.com header.s=mta-01 header.b=XsHrkYl0;
 spf=pass (domain: yadro.com, ip: 89.207.88.252, mailfrom: s.zhmylev@yadro.com)
Received: from mta-01.yadro.com (localhost.localdomain [127.0.0.1])
	by mta-01.yadro.com (Proxmox) with ESMTP id ACFD034196F;
	Fri, 13 Jan 2023 19:01:48 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; h=cc
	:cc:content-id:content-transfer-encoding:content-type
	:content-type:date:from:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=mta-01; bh=zkwdQTe
	NTZkD0zBynV1WjLqSr7IPaP5xQn9Y4nj0nk8=; b=XsHrkYl0KzBuXK00TFNJTUV
	Jia5JHcHscHtAz3z901JltvxdMXHcfHEmEjEOq/bF0mdlc3YVM+ztV6RjsctlrMz
	vUb02RjyQWTO5q0dMQqU/FIvHszKKLmSUGqN77uBPV2JG3kZQ8yrABDPcqhYwD5z
	vuV3m78R0e3QqsvGJNxI=
Received: from T-EXCH-08.corp.yadro.com (unknown [172.17.10.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Proxmox) with ESMTPS id 9876F3419A2;
	Fri, 13 Jan 2023 19:01:48 +0300 (MSK)
Received: from T-EXCH-06.corp.yadro.com (172.17.10.110) by
 T-EXCH-08.corp.yadro.com (172.17.11.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.9; Fri, 13 Jan 2023 19:01:48 +0300
Received: from T-EXCH-08.corp.yadro.com (172.17.11.58) by
 T-EXCH-06.corp.yadro.com (172.17.10.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.15; Fri, 13 Jan 2023 19:01:48 +0300
Received: from T-EXCH-08.corp.yadro.com ([172.17.11.58]) by
 T-EXCH-08.corp.yadro.com ([172.17.11.58]) with mapi id 15.02.1118.009; Fri,
 13 Jan 2023 19:01:48 +0300
From: Sergey Zhmylev <s.zhmylev@yadro.com>
To: "ross.burton@arm.com" <ross.burton@arm.com>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "alex.kanavin@gmail.com"
	<alex.kanavin@gmail.com>
Subject: Re: [OE-core] [PATCH] package_rpm: allow arch overriding
Thread-Topic: [OE-core] [PATCH] package_rpm: allow arch overriding
Thread-Index: AQHZJs17x/I5syU4EUCG/XLoSxy3Eq6bK48AgAClpICAAAKyAIAACxwAgAAKBICAAALOgIAAKaiAgAAGuwCAADSRgA==
Date: Fri, 13 Jan 2023 16:01:48 +0000
Message-ID: <77a8632e7d40624f3af87feba2adccaa986390ed.camel@yadro.com>
References: <20230112213301.11768-1-s.zhmylev@yadro.com>
	 <a956c7ec6640cfee5bebb41720beec74e8b663cf.camel@linuxfoundation.org>
	 <dca56133ff38a2700cdeda8832d187e8f1863a63.camel@yadro.com>
	 <CANNYZj89sJH398ksmtB-TRcTOW6_MYKsDdCie3mHe7QRvKu47Q@mail.gmail.com>
	 <8eae30b2192df5bae48ad7c8eb028b868ef89e55.camel@yadro.com>
	 <ea059c6fd86267376a501008384d57dd9c7f96fa.camel@linuxfoundation.org>
	 <CANNYZj-P38yonASaKJFq_r+KvKvX6wj_7j7O=NFR3=SeUt-38Q@mail.gmail.com>
	 <2ef83acb208a3e7222b699a6ecf894b184f87444.camel@yadro.com>
	 <B94C4C10-689A-4105-93A1-0DC0EBA92161@arm.com>
In-Reply-To: <B94C4C10-689A-4105-93A1-0DC0EBA92161@arm.com>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.22.3.38]
Content-Type: text/plain; charset="utf-8"
Content-ID: <3F9C72D7769900418A9BDBAADA4B9753@yadro.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jan 2023 16:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175836

PiANCj4gV2hhdCBpcyB0aGUgdXNlLWNhc2UgZm9yIHRoaXMgbGV2ZWwgb2YgY29udHJvbCB0aGVu
LCBhbmQgd2h5IHdvdWxkIGl0DQo+IGJlIHNwZWNpZmljIHRvIFJQTT8NCj4gDQoNCkRlc3BpdGUg
QWxleGFuZGVyJ3Mgd29yZHMgYWJvdXQgdGhpcyBkb2N1bWVudCwgbW9zdCBvZiAoSSBzdXBwb3Nl
LA0KYWN0dWFsbHkgYWxsKSB3aWRlLXVzZWQgcnBtLWJhc2VkIGRpc3Ryb3MgdXNlIHRoZSBzYW1l
IHdlbGwta25vd24gcnBtDQpwYWNrYWdlcyBuYW1pbmcgY29udmVudGlvbjogcmVkIGhhdCwgb3Bl
bnN1c2UsIGNlbnRvcywgb3JhY2xlDQplbnRlcnByaXNlIGxpbnV4LCBmZWRvcmEsIC4uLg0KDQpU
aGVyZSBhcmUgYSBsb3Qgb2YgdXNlZnVsIHRvb2xzIGluIHRoaXMgaHVnZSB3b3JsZCBvZiBlbnRl
cnByaXNlLWxldmVsDQpkaXN0cm9zLCBlc3BlY2lhbGx5IGFsbCB0aG9zZSBzdGFmZiByZWxhdGVk
IHRvIHN0YXRpYyBzZWN1cml0eQ0Kc2NhbnMvYXVkaXQgYW5kIGFyb3VuZCBTQk9NIGNvbGxlY3Rp
b24gYW5kIHByb2Nlc3NpbmcuICBUaG9zZSB0b29scw0KcmVseSBvbiBzb21lIGJhc2ljIHJ1bGVz
IG9mIHJwbSBuYW1pbmcgZm9yIHRoZWlyIGFuYWx5c2lzIGFuZCBkbyBub3QNCmhhbmRsZSBhcmNo
aXRlY3R1cmVzIGxpa2UgImdlbmVyaWN4ODZfNjQiLg0KDQpJLmUuIHRoaXMgbGV2ZWwgb2YgY29u
dHJvbCBvcGVucyBmb3IgdXMgYSB0cmVtZW5kb3VzIHdpbmRvdyBvZg0KcG9zc2liaWxpdGllcyB3
aGVuIG91ciBidWlsZCBwcmV0ZW5kcyB0byBiZSBhIG1hdHVyZSBkaXN0cm8uDQoNCkJSLCBTZXJn
ZWkNCg==


