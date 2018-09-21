Return-Path: <Alexey.Brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (us01smtprelay-2.synopsys.com
	[198.182.60.111])
	by mail.openembedded.org (Postfix) with ESMTP id 92FB574561
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 11:41:19 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost3.synopsys.com [10.12.238.238])
	by smtprelay.synopsys.com (Postfix) with ESMTP id E21EB10C1B2A;
	Fri, 21 Sep 2018 04:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1537530080; bh=SM1kpHphFp9+UFGhJ1RYcoRgRnJvsHTYMgT71DE29fU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=cTGHv4UAnQLDNXSmWkWFgPK4wCGgyCkpkimEyn5t5QtaNuTOKuQbcpEwY5OuQEEkC
	Oi4O68enrRumjKaRLHyYbAMZEVVEOykxDYXN+HiDywOFGPsleSlcRpOloJTHrRc9nS
	opWKS8A07k1sJPJECPKNYm/fOJ+2z3jV80jsaLESmKFORvndTUw5U8b6JNH66YXu3c
	YY5+lyeacB95tYPEEG5l31bokYQQL3+hV5qJzuS0vhDWwSQ634a/ZLeT+63gxREH79
	+a5Z0NnByJ1lWvV6s1Ss3z95zYFs5i1+MrDkqF6UdpqGMWjek0Rn0HsQUihx1YWqc6
	F9vocgl5spYPw==
Received: from US01WEHTC3.internal.synopsys.com
	(us01wehtc3.internal.synopsys.com [10.15.84.232])
	by mailhost.synopsys.com (Postfix) with ESMTP id 881AD3BD9;
	Fri, 21 Sep 2018 04:41:20 -0700 (PDT)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
	US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Fri, 21 Sep 2018 04:41:20 -0700
Received: from DE02WEMBXB.internal.synopsys.com ([fe80::95ce:118a:8321:a099])
	by DE02WEHTCB.internal.synopsys.com ([::1]) with mapi id
	14.03.0361.001; Fri, 21 Sep 2018 13:41:18 +0200
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: "ross.burton@intel.com" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH v2 8/9] binutils: Fix Glibc building for ARC
Thread-Index: AQHUUSKFknM9iUerwEeGjw/2XZ3IVqT6b4QAgAAMsgA=
Date: Fri, 21 Sep 2018 11:41:17 +0000
Message-ID: <a370dc1964172f81c3c8fec7a3165d0657ad6042.camel@synopsys.com>
References: <20180920204232.10583-1-abrodkin@synopsys.com>
	<20180920204232.10583-9-abrodkin@synopsys.com>
	<CAJTo0Lb9HFXbXVNDHoMyx8eF06kd0710B0+KXuiCAocvGLevfw@mail.gmail.com>
In-Reply-To: <CAJTo0Lb9HFXbXVNDHoMyx8eF06kd0710B0+KXuiCAocvGLevfw@mail.gmail.com>
Accept-Language: en-US, ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.225.15.87]
MIME-Version: 1.0
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>
Subject: Re: [PATCH v2 8/9] binutils: Fix Glibc building for ARC
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Sep 2018 11:41:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <66A691477BA86D44A3F3B7A1A38A1BE8@internal.synopsys.com>
Content-Transfer-Encoding: base64

SGkgUm9zcywNCg0KT24gRnJpLCAyMDE4LTA5LTIxIGF0IDExOjU1ICswMTAwLCBCdXJ0b24sIFJv
c3Mgd3JvdGU6DQo+IEkgZG9uJ3QgbGlrZSBhY2N1bXVsYXRpbmcgcGVuZGluZyBwYXRjaGVzIGZv
ciBzb21ldGhpbmcgYXMga2V5IGFzDQo+IGJpbnV0aWxzLCBhcmUgdGhlc2UgYWN0dWFsbHkgd29y
a2luZyB0aGVpciB3YXkgdXBzdHJlYW0gbm93Pw0KDQpTdXJlIHRoZXkgYXJlIQ0KDQpPdXIgdGVh
bSBkZXZlbG9wbWVudCBpcyB2ZXJ5IHVwc3RyZWFtIHRhcmdldGVkLCBpLmUuIHdlIHRyeSB0bw0K
c3VibWl0IGFsbCBvdXIgY2hhbmdlcyB1cHN0cmVhbS4gQnV0IHdpdGggQmludXRpbHMgd2UncmUg
bGFnZ2luZw0KYmVoaW5kIHVwc3RyZWFtIGEgYml0IGJlY2F1c2UgcmVjZW50bHkgd2UgbWFkZSBz
b21lIHNpZ25pZmljYW50IHJld29ya3MNCmFuZCBub3cgY2F0Y2hpbmcgdXAgd2l0aCB1cHN0cmVh
bS4NCg0KV2hhdCdzIG1vcmUgbXkgY29sbGVhZ3VlIENsYXVkaXUgWmlzc3VsZXNjdSByZWNlbnRs
eSBiZWNhbWUNCm9mZmljaWFsIEJpbnV0aWxzIG1haW50YWluZXIgZm9yIEFSQywgc2VlDQpodHRw
czovL3NvdXJjZXdhcmUub3JnL2dpdC9naXR3ZWIuY2dpP3A9YmludXRpbHMtZ2RiLmdpdDthPWNv
bW1pdDtoPTAyZDdhNzllMWI5MzI0MDcyOWE1MjI0NjQzMmQ5YTg0NTgzYmNmODINCnNvIEkgZXhw
ZWN0IGxlc3MgYW5kIGxlc3MgcGF0Y2hlcyBmb3IgQVJDIHdpbGwgYmUgInBlbmRpbmciLg0KDQpO
b3Qgc3VyZSB0aG91Z2ggaWYgdGhhdCBtYWtlcyBtdWNoIHNlbnNlLg0KDQotQWxleGV5DQo=

