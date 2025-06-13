Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0122C71136
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 16:31:06 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.1493.1749832257134749368
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 09:30:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NvsgXkaU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4530921461aso20812465e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 09:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749832255; x=1750437055; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dh36xcuuRC1jEy99LwL0ieJVZtR+FuarAO7No5ZBFEE=;
        b=NvsgXkaU2z91RBOzMyizNFuZmM3XciGKeviCVNQlJYMTFGzvHXkhV1ca0iYMeUjI1J
         4B7g+452vTZ5AqiapxfA3Dsq6INlWz6/Bo2J6zhBQTWmOBlpW9SXRn53k7fiw/BeusSO
         28XM7umpjVWW+WpAijT7QGHK415r0D5RmjKxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749832255; x=1750437055;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dh36xcuuRC1jEy99LwL0ieJVZtR+FuarAO7No5ZBFEE=;
        b=u+WB1U+suv28yHHIsoGW+DLHVsQgDLNJVxCEbBrEPlv0JWiL8FbXyEYoxwnfmMIaFR
         pefB3xpPMMvK+tWZbk8gZhv1LQhNWLo8/PnTZ8hvn7uLS3ul59KdyQ2HUQxxlDTnL1eX
         pPjjQGcVQGRloTYugE8WoFHrkYMe9twhbcdnxasRUqwQ0LxDIzMhc158Uk4uXu3Jujtk
         ub597Jy7vdlZhCobLUQRLms5Zq+2ATg6mqlEYlwXqZP6zIzUWZYJtoyUVrXqZHMEsss2
         ZXdnKH2NRQONVjQeIRycxjMCE4wKDF19ACZ6uArklYkA5jmU1nSkihJ37g57npbhBBq6
         dCaw==
X-Forwarded-Encrypted: i=1; AJvYcCXWnz/yWpLmDretielkWmu6moL+dgsxDyFCqiDszsTPFrn6LZy3c3oIrD78+e1P30hsSqv85/AnWZbNlChop8AWkQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyKsJs8alcJO5j3q1/HL98d8FGzHIzY5MBBh7BuDdbBiV3Br76a
	W6nSDoRERgJ8GSD1VAYAbzyOn1Tfwy8aQf1+hT3KCFF3Ul7cBHdLYh9PDV59snfOdmk=
X-Gm-Gg: ASbGnctHIgFyZN3Zfiy0onXOB0IkTYxo0P73ZYHGRY6Mwls1kiwoLw4CzLK9hWbwunw
	UbegEs3H0EISadChS8Vln4gZZUUjdeOzq3VQ7YlrgCQJCvOGN08Gcgy68nwRajL+8mnFV/3iNH8
	3cYFBiIN8258n+vTFF8KuiZJZp7Wv9SYAXv5iX70tymIYXqe0xmLlPv/a7XLufpT55QKi5aFFCe
	dnnUq0/WZyZPUODVDCpe5kxDGJB8+Xy4esMnqcX6NuU/LYVkaIeQH25XVl7NxjtdemLlpY3EWcp
	XjVKPPh5SpHyr6fPvBvI8BeSH0YycCUCwviMqVs+hRA+yVAO+Fg9SKR9wJKfvdADtic/2R74Dzx
	SxB3dCSJgpmB4XlmBg1bKhbYoiXkdzpEELVmYdGfPanOcYV96/AisWIT766Dsqw==
X-Google-Smtp-Source: AGHT+IHXVUltIT3TsJZ3+tz+4k/pwLT+miNBqSTPPwFBi0S2fDYOLVHVN6n3futsbrEk+qp4bSQXow==
X-Received: by 2002:a05:600c:3e19:b0:43d:2313:7b49 with SMTP id 5b1f17b1804b1-4533ca66cd0mr3227045e9.12.1749832255525;
        Fri, 13 Jun 2025 09:30:55 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3ba4:44fa:9d9b:3977? ([2001:8b0:aba:5f3c:3ba4:44fa:9d9b:3977])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b47198sm2748970f8f.81.2025.06.13.09.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 09:30:54 -0700 (PDT)
Message-ID: <7dfa9fe19ceff14ecb9137044c7e952f759a208e.camel@linuxfoundation.org>
Subject: Re: [PATCH] sstate.bbclass: apply proper umask when fetching from
 SSTATE_MIRROR
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Rasmus Villemoes <ravi@prevas.dk>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 13 Jun 2025 17:30:54 +0100
In-Reply-To: <20250606093905.2715221-1-ravi@prevas.dk>
References: <20250606093905.2715221-1-ravi@prevas.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 16:31:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218618

T24gRnJpLCAyMDI1LTA2LTA2IGF0IDExOjM5ICswMjAwLCBSYXNtdXMgVmlsbGVtb2VzIHdyb3Rl
Ogo+IEZyb206IFJhc211cyBWaWxsZW1vZXMgPHJhdmlAcHJldmFzLmRrPgo+IAo+IEN1cnJlbnRs
eSwgZmlsZXMgYW5kIGRpcmVjdG9yaWVzIGNyZWF0ZWQgdW5kZXIgJHtTU1RBVEVfRElSfSB3aGVu
Cj4gZmV0Y2hpbmcgZnJvbSBhbiBzc3RhdGUgbWlycm9yIGFyZSBub3QgY3JlYXRlZCB3aXRoIGdy
b3VwIHdyaXRlLAo+IHVubGlrZSB3aGVuIHRoZSBzc3RhdGUgYXJ0aWZhY3RzIGFyZSBnZW5lcmF0
ZWQgbG9jYWxseS4gVGhhdCdzCj4gaW5jb25zaXN0ZW50LCBhbmQgcHJvYmxlbWF0aWMgd2hlbiB0
aGUgbG9jYWwgc3N0YXRlIGRpciBpcyBzaGFyZWQKPiBhbW9uZyBtdWx0aXBsZSB1c2Vycy4KPiAK
PiBXcmFwIHRoZSBmZXRjaGluZyBpbiBhIGJiLnV0aWxzLnVtYXNrKCkgY29udGV4dCBtYW5hZ2Vy
LCBhbmQgZm9yIHNpbXBsaWNpdHkKPiBtb3ZlIHRoZSBta2RpciBvZiBTU1RBVEVfRElSIGluc2lk
ZSB0aGF0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhc211cyBWaWxsZW1vZXMgPHJhdmlAcHJldmFz
LmRrPgo+IC0tLQo+IMKgbWV0YS9jbGFzc2VzLWdsb2JhbC9zc3RhdGUuYmJjbGFzcyB8IDIyICsr
KysrKysrKysrKy0tLS0tLS0tLS0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCsp
LCAxMCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvbWV0YS9jbGFzc2VzLWdsb2JhbC9z
c3RhdGUuYmJjbGFzcyBiL21ldGEvY2xhc3Nlcy1nbG9iYWwvc3N0YXRlLmJiY2xhc3MKPiBpbmRl
eCAxZDdiMDMzYjgwLi4yOTY4Y2M0YzJlIDEwMDY0NAo+IC0tLSBhL21ldGEvY2xhc3Nlcy1nbG9i
YWwvc3N0YXRlLmJiY2xhc3MKPiArKysgYi9tZXRhL2NsYXNzZXMtZ2xvYmFsL3NzdGF0ZS5iYmNs
YXNzCj4gQEAgLTcyNiw3ICs3MjYsNiBAQCBkZWYgcHN0YWdpbmdfZmV0Y2goc3N0YXRlZmV0Y2gs
IGQpOgo+IMKgwqDCoMKgIGxvY2FsZGF0YSA9IGJiLmRhdGEuY3JlYXRlQ29weShkKQo+IMKgCj4g
wqDCoMKgwqAgZGxkaXIgPSBsb2NhbGRhdGEuZXhwYW5kKCIke1NTVEFURV9ESVJ9IikKPiAtwqDC
oMKgIGJiLnV0aWxzLm1rZGlyaGllcihkbGRpcikKPiDCoAo+IMKgwqDCoMKgIGxvY2FsZGF0YS5k
ZWxWYXIoJ01JUlJPUlMnKQo+IMKgwqDCoMKgIGxvY2FsZGF0YS5zZXRWYXIoJ0ZJTEVTUEFUSCcs
IGRsZGlyKQo+IEBAIC03NDYsMTYgKzc0NSwxOSBAQCBkZWYgcHN0YWdpbmdfZmV0Y2goc3N0YXRl
ZmV0Y2gsIGQpOgo+IMKgwqDCoMKgIGlmIGJiLnV0aWxzLnRvX2Jvb2xlYW4oZC5nZXRWYXIoIlNT
VEFURV9WRVJJRllfU0lHIiksIEZhbHNlKToKPiDCoMKgwqDCoMKgwqDCoMKgIHVyaXMgKz0gWydm
aWxlOi8vezB9LnNpZztkb3dubG9hZGZpbGVuYW1lPXswfS5zaWcnLmZvcm1hdChzc3RhdGVmZXRj
aCldCj4gwqAKPiAtwqDCoMKgIGZvciBzcmN1cmkgaW4gdXJpczoKPiAtwqDCoMKgwqDCoMKgwqAg
bG9jYWxkYXRhLmRlbFZhcignU1JDX1VSSScpCj4gLcKgwqDCoMKgwqDCoMKgIGxvY2FsZGF0YS5z
ZXRWYXIoJ1NSQ19VUkknLCBzcmN1cmkpCj4gLcKgwqDCoMKgwqDCoMKgIHRyeToKPiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBmZXRjaGVyID0gYmIuZmV0Y2gyLkZldGNoKFtzcmN1cmldLCBsb2Nh
bGRhdGEsIGNhY2hlPUZhbHNlKQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZldGNoZXIuY2hl
Y2tzdGF0dXMoKQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZldGNoZXIuZG93bmxvYWQoKQo+
ICvCoMKgwqAgd2l0aCBiYi51dGlscy51bWFzaygwbzAwMik6Cj4gK8KgwqDCoMKgwqDCoMKgIGJi
LnV0aWxzLm1rZGlyaGllcihkbGRpcikKPiDCoAo+IC3CoMKgwqDCoMKgwqDCoCBleGNlcHQgYmIu
ZmV0Y2gyLkJCRmV0Y2hFeGNlcHRpb246Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGFzcwo+
ICvCoMKgwqDCoMKgwqDCoCBmb3Igc3JjdXJpIGluIHVyaXM6Cj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgbG9jYWxkYXRhLmRlbFZhcignU1JDX1VSSScpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgbG9jYWxkYXRhLnNldFZhcignU1JDX1VSSScsIHNyY3VyaSkKPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB0cnk6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmZXRjaGVyID0g
YmIuZmV0Y2gyLkZldGNoKFtzcmN1cmldLCBsb2NhbGRhdGEsIGNhY2hlPUZhbHNlKQo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmV0Y2hlci5jaGVja3N0YXR1cygpCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmZXRjaGVyLmRvd25sb2FkKCkKPiArCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZXhjZXB0IGJiLmZldGNoMi5CQkZldGNoRXhjZXB0aW9uOgo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGFzcwo+IMKgCgpQcm9iYWJseSB0aGUgcmln
aHQgdGhpbmcgdG8gZG8sIEkganVzdCBjYW4ndCBoZWxwIHdvbmRlciBpZiAwbzAwMgpzaG91bGQg
YmUgaW4gYSB2YXJpYWJsZSBsaWtlIFNTVEFURV9VTUFTSyBvciBzb21ldGhpbmcganVzdCBzbyBp
dCBpc24ndApzbyBoYXJkY29kZWQuIEkgZGlkIG5vdGUgd2UgYWxyZWFkeSBoYXZlIG90aGVyIHJl
ZmVyZW5jZXMgdG8gaXQuCgpDaGVlcnMsCgpSaWNoYXJkCgo=


