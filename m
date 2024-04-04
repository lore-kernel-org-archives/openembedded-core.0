Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB308CD1292
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 07:58:42 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.33145.1712217516279502680
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Apr 2024 00:58:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=nA31m8ZG;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=MIME-Version:Content-Transfer-Encoding:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Inmp4hf6cxe44akE2sEECZRcQDCJ3O6iDzH5/tw2Pwk=; b=nA31m8ZGSoiTj7tTwUc0fkUL1D
	Qge/vhoaW4gc1jS4AZgUbnkjRBzUb4KBYV0JLtFZ4FZQiMJiuqXp2qPPUNPhalW7WYpcFCq4WyxIu
	yf1ytHXoRPJs6kkjGNigaXzFUTaEOD2AJnD1mEan6dhunrKTZP0okBrgOzU2LZiJlz068X2DF//Dy
	pY/kasylnqE0HP7hDI4I5h5CLbRg+dSJ+1Hi5PNrWLHJPtFmx49wXFgdSx52E/zatd5b0WxPnPMFu
	xO8efbBCq3x/qJ6sXcqxPLUoo1w0wvuOjryedrm07KEanYiYzn15AIMGLeKxB3jBENhSbpjRJi5xk
	ncGKJyng==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <martin@geanix.com>)
	id 1rsHzV-0009GC-5G; Thu, 04 Apr 2024 09:58:33 +0200
Received: from [185.17.218.86] (helo=[192.168.64.76])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <martin@geanix.com>)
	id 1rsHzU-0000tp-2h;
	Thu, 04 Apr 2024 09:58:32 +0200
Message-ID: <0fb30b6a38e91309aae320190c8f11b2a811ae4e.camel@geanix.com>
Subject: Re: [OE-core] [PATCH 1/5] classes: jobserver: support gnu make fifo
 jobserver
From: Martin =?ISO-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>
To: Andreas Helbech Kleist <andreaskleist@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, Khem Raj
 <raj.khem@gmail.com>,  Randy MacLeod <randy.macleod@windriver.com>
Date: Thu, 04 Apr 2024 09:58:32 +0200
In-Reply-To: <3fd7861181945979c16d57176b45aa2e78a1f700.camel@gmail.com>
References: <20240403070204.367470-1-martin@geanix.com>
	 <20240403070204.367470-2-martin@geanix.com>
	 <3fd7861181945979c16d57176b45aa2e78a1f700.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.0 
MIME-Version: 1.0
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27234/Wed Apr  3 10:25:27 2024)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Apr 2024 07:58:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197948

SGkgQW5kcmVhcywKCk9uIFRodSwgMjAyNC0wNC0wNCBhdCAwOTo1NiArMDIwMCwgQW5kcmVhcyBI
ZWxiZWNoIEtsZWlzdCB3cm90ZToKPiA+ICvCoMKgwqAgIyBhdm9pZCBtYWtpbmcgbWFrZS1uYXRp
dmUgb3IgaXRzIGRlcGVuZGVuY2llcyBkZXBlbmQgb24gbWFrZS0KPiA+IG5hdGl2ZSBpdHNlbGYK
PiA+ICvCoMKgwqAgaWYgZC5nZXRWYXIoIlBOIikgaW4gKAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAibWFrZS1uYXRpdmUiLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAibGlidG9vbC1uYXRpdmUiLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAicGtnY29uZmlnLW5hdGl2ZSIsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICJhdXRvbWFrZS1uYXRpdmUiLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAiYXV0b2NvbmYtbmF0aXZlIiwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Im00LW5hdGl2ZSIsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJ0ZXhpbmZv
LWR1bW15LW5hdGl2ZSIsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJnZXR0
ZXh0LW1pbmltYWwtbmF0aXZlIiwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
InF1aWx0LW5hdGl2ZSIsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJnbnUt
Y29uZmlnLW5hdGl2ZSIsCj4gCj4gVGhpcyBzZWVtcyBhIGJpdCBicml0dGxlLCBidXQgSSBndWVz
cyBtYWtlJ3MgZGVwZW5kZW5jaWVzIGRvZXNuJ3QKPiBjaGFuZ2Ugb2Z0ZW4uIFNvIGl0IGlzIHBy
b2JhYmx5IG5vdCBhIGJpZyBpc3N1ZS4KPiAKPiBIb3cgZG9lcyBpdCBicmVhayBpZiBhIGRlcGVu
ZGVuY3kgaXMgbWlzc2luZz8KCkJpdGJha2UgZXJyb3JzIG91dCB3aXRoIGEgZGVwZW5kZW5jeSBs
b29wLgoKLy8gTWFydGluCg==


