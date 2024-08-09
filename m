Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0C35C3DA4A
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 10:22:44 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.81096.1723198955550205651
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Aug 2024 03:22:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WaCxR4dT;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4280c55e488so11001345e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Aug 2024 03:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1723198954; x=1723803754; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dREu+30Bq1IMlC5ZlT9mZELwojTXXDVgrfr+Rvnjz1s=;
        b=WaCxR4dTLWiE6M5tVRWjsx988EJXmG+ERkcwaE03iI2MkRCM/8TqOf9YfIgTqTjPon
         JOUFaSczhuLV3LyZQtRCGrbz0hpwo8L214xKXuDmMz8cfi3QA/qmheIVQ7LIfIb0IgIw
         KzTBjb9BFpPnvMMD1Qso3mtFs+jJdRbXA+JCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723198954; x=1723803754;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dREu+30Bq1IMlC5ZlT9mZELwojTXXDVgrfr+Rvnjz1s=;
        b=jSz0iHgN15SWjj/oI15jI7ModDjgrceRInpBatMs8yFEW0pk/URYk4OdJMS9758Xrx
         ES1HgYtqPTC49adjRDRCIUIQ0MjhCWJmqVb/52VfUzDHtIfrza3ry2abiO2fMGcxtL2T
         IPWXtgWHEGTD5GaXhheXk/Gb7NLVVFUb9CMgXg+K1Pt5XW8HK5caOtuKO29ycc8j/hMF
         tNNke90DFyoVd5tiWh4eLYDVMiEfTel1ZMNJLmDxXQ3BBJIAeIC0uw/YzyNRy+Ujc1m4
         IFd4czTv9sfYIlBnFI2UqUNJEzZBtA6GEkDAfHF1GzmnTTmxStxBFJuDAbvufwfxWE0r
         A22Q==
X-Forwarded-Encrypted: i=1; AJvYcCUvbgdQpugxtf8kM5owbngKvdEaokHD86wqHcl74yPg0hhSw9TpEEnVf8R9sHWGifovz5pz06cWTh2hM9z6QhPFr6Rn3vy56FnoAbWwfCS82lmWjtPi10fO
X-Gm-Message-State: AOJu0YyRVqIsFd2hyG6EG9gOiLQRbtO2KFuxZQYvndUl1CBxqfrqRsxc
	pELEubTIPpVV3WrLzfdKoOKDFQrsEvLgf0EiosRUMwrWMuN93xbUCedbxvY6TLI=
X-Google-Smtp-Source: AGHT+IGVCCxxt6tBkLFIWxkyBgYa/fmwOvYs7phC4hYT9Ma+TWsfbOEl6vfxADyRHx6mnyivR95PwQ==
X-Received: by 2002:a05:600c:4e8d:b0:424:a7f1:ba2 with SMTP id 5b1f17b1804b1-4290b8dee6dmr39818455e9.17.1723198953559;
        Fri, 09 Aug 2024 03:22:33 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:438f:5259:85a6:c414? ([2001:8b0:aba:5f3c:438f:5259:85a6:c414])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d2716befbsm4818585f8f.27.2024.08.09.03.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 03:22:33 -0700 (PDT)
Message-ID: <ef830cd2a5563a5416472c1db1f4c21fb7cfdf8f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/7] rust: Oe-selftest fixes for rust v1.76
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com, 
	Sundeep.Kokkonda@windriver.com
Date: Fri, 09 Aug 2024 11:22:32 +0100
In-Reply-To: <20240808100039.2455895-1-Yash.Shinde@windriver.com>
References: <20240808100039.2455895-1-Yash.Shinde@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Aug 2024 10:22:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203161

T24gVGh1LCAyMDI0LTA4LTA4IGF0IDAzOjAwIC0wNzAwLCBZYXNoIFNoaW5kZSB2aWEgbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZyB3cm90ZToKPiBGcm9tOiBZYXNoIFNoaW5kZSA8WWFzaC5TaGluZGVA
d2luZHJpdmVyLmNvbT4KPiAKPiBBZGQgdGhlIGZhaWxpbmcgdGVzdHMgaW4gcnVzdCB2MS43NiB0
byB0aGUgZXhjbHVkZSBsaXN0Cj4gYW5kIGFkZCAiaWdub3JlIiB0YWdzIHRvIGlnbm9yZSBmYWls
aW5nIHVuaXQgdGVzdCBjYXNlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBZYXNoIFNoaW5kZSA8WWFz
aC5TaGluZGVAd2luZHJpdmVyLmNvbT4KPiAtLS0KPiDCoG1ldGEvbGliL29lcWEvc2VsZnRlc3Qv
Y2FzZXMvcnVzdC5wecKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMTkgKwo+IMKgLi4uL3J1c3QvZmls
ZXMvcnVzdC1vZS1zZWxmdGVzdC5wYXRjaMKgwqDCoMKgwqDCoMKgwqAgfCAzNDUgKysrKysrKysr
KysrKysrKysrCj4gwqBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcnVzdC9ydXN0LXNvdXJjZS5pbmPC
oMKgwqAgfMKgwqAgMSArCj4gwqAzIGZpbGVzIGNoYW5nZWQsIDM2NSBpbnNlcnRpb25zKCspCj4g
wqBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1c3QvZmlsZXMvcnVz
dC1vZS1zZWxmdGVzdC5wYXRjaAo+IAo+IGRpZmYgLS1naXQgYS9tZXRhL2xpYi9vZXFhL3NlbGZ0
ZXN0L2Nhc2VzL3J1c3QucHkgYi9tZXRhL2xpYi9vZXFhL3NlbGZ0ZXN0L2Nhc2VzL3J1c3QucHkK
PiBpbmRleCA0Y2NiZTk4NjdiLi42MTgxYzEwZWE5IDEwMDY0NAo+IC0tLSBhL21ldGEvbGliL29l
cWEvc2VsZnRlc3QvY2FzZXMvcnVzdC5weQo+ICsrKyBiL21ldGEvbGliL29lcWEvc2VsZnRlc3Qv
Y2FzZXMvcnVzdC5weQo+IEBAIC0xODcsNiArMTg3LDI1IEBAIGNsYXNzIFJ1c3RTZWxmVGVzdFN5
c3RlbUVtdWxhdGVkKE9FU2VsZnRlc3RUZXN0Q2FzZSwgT0VQVGVzdFJlc3VsdFRlc3RDYXNlKToK
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAndGVzdHMvcnVzdGRvYy11aS9uby1ydW4tZmxhZy5ycycsCj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJ3Rlc3RzL3VpLWZ1bGxkZXBz
LycsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgJ3Rlc3RzL3VpL251bWJlcnMtYXJpdGhtZXRpYy91MTI4LnJzJwo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJ3Rlc3RzL3J1bi1w
YXNzLXZhbGdyaW5kJywKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICd0ZXN0cy91aS9jb2RlZ2VuL21pc21hdGNoZWQtZGF0YS1sYXlvdXRz
LnJzJywKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICd0ZXN0cy9jb2RlZ2VuL2kxMjgteDg2LWFsaWduLnJzJywKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICdzcmMvdG9vbHMvc3Vn
Z2VzdC10ZXN0cycsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAnc3JjL3Rvb2xzL3J1c3QtaW5zdGFsbGVyJywKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICdzcmMvYm9vdHN0cmFw
JywKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICdzcmMvdG9vbHMvdGlkeS9zcmMvJywKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICdsaWJyYXJ5L3N0ZC9zcmMvdGhyZWFkL3Rlc3Rz
LnJzJywKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICdjb21waWxlci9ydXN0Y19lcnJvcnMvc3JjL21hcmtkb3duL3Rlc3RzL3Rlcm0ucnMn
LAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgJ2NvbXBpbGVyL3J1c3RjX2ludGVyZmFjZS9zcmMvdGVzdHMucnMnLAo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJ2xpYnJhcnkvc3Rk
L3NyYy9pby9idWZmZXJlZC90ZXN0cy5ycycsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAnbGlicmFyeS9zdGQvc3JjL2lvL3N0ZGlvL3Rl
c3RzLnJzJywKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICdsaWJyYXJ5L3N0ZC9zcmMvc3luYy9tcHNjL3N5bmNfdGVzdHMucnMnLAo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJ2xp
YnJhcnkvc3RkL3NyYy9zeW5jL21wc2MvdGVzdHMucnMnLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJ2xpYnJhcnkvc3RkL3NyYy9zeW5j
L211dGV4L3Rlc3RzLnJzJywKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICdsaWJyYXJ5L3N0ZC9zcmMvc3luYy9yd2xvY2svdGVzdHMucnMn
LAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgJ2xpYnJhcnkvc3RkL3NyYy90aHJlYWQvdGVzdHMucnMnLAo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJ2xpYnJhcnkvdGVzdC9zcmMv
c3RhdHMvdGVzdHMucnMnLAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgJ3RpZHlzZWxmdGVzdCcKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXQo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoCBleGNs
dWRlX2ZhaWxfdGVzdHMgPSAiICIuam9pbihbIiAtLWV4Y2x1ZGUgIiArIGl0ZW0gZm9yIGl0ZW0g
aW4gZXhjbHVkZV9saXN0XSkKPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3J1
c3QvZmlsZXMvcnVzdC1vZS1zZWxmdGVzdC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9y
dXN0L2ZpbGVzL3J1c3Qtb2Utc2VsZnRlc3QucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
IGluZGV4IDAwMDAwMDAwMDAuLjAyODBiMWVmOGMKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3J1c3QvZmlsZXMvcnVzdC1vZS1zZWxmdGVzdC5wYXRjaAo+IEBA
IC0wLDAgKzEsMzQ1IEBACj4gK0JhY2twb3J0IHRoZSBwYXRjaCBmb3IgImVuc3VyZSBzdGQgZm9y
IGNyb3NzLXRhcmdldHMiLgo+ICsKPiArUHJldmlvdXNseSwgZG9pbmcgYHggdGVzdCBjb21waWxl
ci8qYCB3b3VsZCBmYWlsIHRoZSBidWlsZCBkdWUgdG8gbWlzc2luZyBzdGQuCj4gK1RoaXMgY2hh
bmdlIGVuc3VyZXMgdGhhdCBpdCBpcyBwcmVwYXJlZC4KPiArCj4gK0Fsc28sIGFkZCAiW2lnbm9y
ZV0iIHRhZ3MgdG8gdGhlIGZhaWxpbmcgdW5pdCB0ZXN0cyB0bwo+ICtpZ25vcmUgdGhlbSBkdXJp
bmcgcnVzdCBvZS1zZWxmdGVzdC4KPiArCj4gK1Vwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0
dHBzOi8vZ2l0aHViLmNvbS9ydXN0LWxhbmcvcnVzdC9wdWxsLzEyMjIwNS9jb21taXRzLzVhZWNl
N2ZhZDA2YmFhYTc0NTc4NGQxMThkYjg2MmIzZTNjY2Y3ZjhdCj4gKwo+ICtTaWduZWQtb2ZmLWJ5
OiBZYXNoIFNoaW5kZSA8WWFzaC5TaGluZGVAd2luZHJpdmVyLmNvbT4KCldoZW4gYWRkaW5nIGNo
YW5nZXMgaW4gYSBwYXRjaCBsaWtlIHRoaXMsIHBsZWFzZSBzZXBhcmF0ZSAiYmFja3BvcnRzIgpm
cm9tIHRoZSBwaWVjZXMgd2hpY2ggYXJlbid0IGJhY2twb3J0cy4gVGhlc2Ugc2hvdWxkIGJlIHR3
byBzZXBhcmF0ZQpwYXRjaGVzLCBzbyB3aGVuIHdlIHVwZ3JhZGUsIHRoZSBpZ25vcmUgcGFydCBv
ZiB0aGUgcGF0Y2ggY2FuIGJlIG1vcmUKZWFzaWx5IHJldGFpbmVkIChpZiBzdGlsbCBuZWVkZWQp
IGFuZCB3ZSBjYW4gc2ltcGx5IGRyb3AgdGhlIGJhY2twb3J0CnBpZWNlLgoKSSd2ZSB0d2Vha2Vk
IHRoZSBwYXRjaCBpbiB0aGUgbWVyZ2UgcXVldWUgdG8gZG8gdGhpcyBvbiB0aGlzIG9jY2FzaW9u
LgpJJ3ZlIGhhZCB0byBtYWtlIHRoZSBzYW1lIGNoYW5nZSB0byBhIGxhdGVyIDEuNzcgcGF0Y2gg
dG9vLgoKQ2hlZXJzLAoKUmljaGFyZAoKCg==


