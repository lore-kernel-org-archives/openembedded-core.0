Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF39E77198
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 13:55:28 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.20597.1736258126266825380
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 05:55:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AVxEhaLZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso93997855e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 05:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1736258125; x=1736862925; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+tkTtzQa+AarTp0CeFfncF55k28hBZca6Zmd9gfEafI=;
        b=AVxEhaLZv1ec1X3izbWnL01V2+PcrRjmuubN7uqiWS1+8HOvszzd5EtPAEiDlbvnLb
         Isni6Q2Y8MoDEIzXd00fP5R4osez3chnJN92bsdQ6E6jolvNKG8CteA+C3sVbWxXMYFL
         CqEWq0hoIh6KfZZ93Dr0bsul15yAXliQhTTlA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736258125; x=1736862925;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+tkTtzQa+AarTp0CeFfncF55k28hBZca6Zmd9gfEafI=;
        b=ljcnYCtTAyOi93YxLRLOGE/t1DwgEr7mj5rinb8XYT7YTWyts3VX4wQ++s7DCJohs4
         UFRU+3rNMRNP4aYVR2QH9On6cC9MWSisV09j02c0rGDg8o1Qo0izjVAuQw9nHKpCkkRM
         PQZlG9xCPQ0lWAqcWwWc/KSPRYqFLt6y3ClAw3g/JGOC/tFVfiZt6u9PbE9toDidkSGV
         9FWSZ+xLElHb3tvzWcCiMUsUkYXi2lt1tiIAEQgFvsA7sPZ+xOMqTlCui+hD/fUjWvar
         9FWspYv0NT7eVxgJ9s88h7OdX59fgvV2ryfiVvekEFEitx1hbe3VFJl5YYwDDPMd5yuI
         lLgA==
X-Forwarded-Encrypted: i=1; AJvYcCXEEVd5cDlRumlHWzB1f0L4jLlb7C20FRark/k98EUVVw1rSZmdaOqLbiWB/+QcjS4FQEPSUwyBWw437LgJzk1ITQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzm9/6MSk230ElLrwK+BQmUd4v8roFORNCQ2IgnHo4hAFYua9AM
	NNdUffaVg+TPWf+i3L+rrxhkl2g5KNcOj9PTNzvr5xIxpRQ0fCsrDzvaQ6ZYIo/BKn2K5wnfTDR
	vshI=
X-Gm-Gg: ASbGncsJRTcMl+aezkYcXPn66ZTre1o5cADg6xs82Ujs3e2oUS6eB1oEboJqoKa7uWV
	rVlBFbTX7AE107R8ulNxozMp78qjSvVqwGqPjULnrpmTLcASkb7pypVokYzM6pD+YePGSk7mToG
	hatYvWIxZx6FEiSEeMK6k/hkZEeMr28syS+WwP8VskRU5nkSOEOya+iyYKOtMRDljF1/o3cCcNl
	mV9sYA74DMmzRdHpvX6VA4ow/5rXBUlHnNF25O59w28i3250S4t3QIffvaf1KXctYecxDpasrau
	nSU833AKqKFgmqFiJOkIOfZEeGVR2KSnBlxGP2aTMBozPQ==
X-Google-Smtp-Source: AGHT+IGntXQuCG5RfMukvB48ptEfBlJYWulznYMxdMNbkx7LUyYvq5taVOoNJfLuxkwPISNtWbeEaw==
X-Received: by 2002:a05:600c:3504:b0:42c:baf1:4c7 with SMTP id 5b1f17b1804b1-436dc1c1674mr21361725e9.4.1736258124673;
        Tue, 07 Jan 2025 05:55:24 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a621:21b2:eb2a:5bdb? ([2001:8b0:aba:5f3c:a621:21b2:eb2a:5bdb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c515sm600896725e9.30.2025.01.07.05.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 05:55:24 -0800 (PST)
Message-ID: <51162d376801104d5d961bf9d7ddb06dd711cc09.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 08/19] clang/recipes: Add missing SUMMARY field
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Date: Tue, 07 Jan 2025 13:55:23 +0000
In-Reply-To: <20241105184540.3450302-8-raj.khem@gmail.com>
References: <20241105184540.3450302-1-raj.khem@gmail.com>
	 <20241105184540.3450302-8-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 13:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209471

T24gVHVlLCAyMDI0LTExLTA1IGF0IDEwOjQ1IC0wODAwLCBLaGVtIFJhaiB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyB3cm90ZToKPiBFbmhhbmNlIGRlc2NyaXB0aW9uIHdoaWxlIGhlcmUKPiAK
PiBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgo+IC0tLQo+IMKg
Li4uL2NsYW5nL2NsYW5nLWNyb3NzLWNhbmFkaWFuX2dpdC5iYsKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCAyICstCj4gwqBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2xhbmcvY2xh
bmctY3Jvc3NfZ2l0LmJiwqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0KPiDCoG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9jbGFuZy9jbGFuZy1jcm9zc3Nka19naXQuYmLCoMKgwqDCoCB8wqAgMiArLQo+IMKg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2NsYW5nL2NsYW5nX2dpdC5iYsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHwgMTEgKysrKysrKysrKy0KPiDCoC4uLi9jbGFuZy9jb21waWxlci1ydC1zYW5p
dGl6ZXJzX2dpdC5iYsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDQgKysrLQo+IMKg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2NsYW5nL2NvbXBpbGVyLXJ0X2dpdC5iYsKgwqDCoMKgwqDC
oMKgIHzCoCA2ICsrKysrLQo+IMKgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NsYW5nL2xpYmNsY19n
aXQuYmLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0KPiDCoG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9jbGFuZy9saWJjeHhfZ2l0LmJiwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAy
ICstCj4gwqBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2xhbmcvbmF0aXZlc2RrLWNsYW5nLWdsdWUu
YmLCoMKgIHzCoCAyICstCj4gwqBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY2xhbmcvb3Blbm1wX2dp
dC5iYsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+IMKgMTAgZmlsZXMgY2hhbmdl
ZCwgMjUgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpUaGlzIGNhbiBwcm9iYWJseSBi
ZSBtZXJnZWQgaW50byB0aGUgcmVjaXBlcyBpbiBtZXRhLWNsYW5nIHNvIGl0IHdvdWxkCmp1c3Qg
YmUgcGFydCBvZiB0aGUgcmVjaXBlIG1lcmdlIGluIGZ1dHVyZT8KCkNoZWVycywKClJpY2hhcmQK



