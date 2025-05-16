Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A24F8C3ABD8
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 10:38:04 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.10073.1747391876310125737
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 May 2025 03:37:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DLBgIIOK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a0b646eff7so1589745f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 03:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747391875; x=1747996675; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bHJDSOVifWoC/IskxBl4PF5yukrG6G2qXwZlqYLUYXY=;
        b=DLBgIIOKwVmEf5bOEy1OkA4sIoKeFWem3eutKBOJkWV+TPDQlfFLTvd7IHfVGd1gHb
         Uzv64Zf0BNH2wnTPbUd1w3XK+R24fBLYaipnims0Q/+P3y0NVlonEHR1ZSrk9w3Id1Ro
         bEFShUYlzrlAYISgkW3zUR0asoJdqk2ixsPRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747391875; x=1747996675;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bHJDSOVifWoC/IskxBl4PF5yukrG6G2qXwZlqYLUYXY=;
        b=Eq/SRpom/qguCbu+/mFQ4GZ0VYyP77JeoknVWOueiSxZFQ9v4UCz43mhN27QTQFZpl
         gtPir38fPvlLh5a3GwhBQVehpmrscAB8gKTD219Zy7H4RM8nPRAVvi21R2zUj1Fh5wHA
         SM1/B8Iq+rGVvhbW42S8ldUKX7w/HmoItw5yrUNyAIN5jwodBs+WFAfuq/QVRAOjXu0V
         R+gkjHqgylKoe0owGd5htleS/0NPiRyWqyHa6dvqhUMBiE72d0P1onyom3EWhJaFi4z/
         y8tTQueDRkUR6n6aeGvYfHVCVcULLkM1iFrrnh1VzlLcOGwX4Lp0hd2JwElfbnJm/Spx
         yjyw==
X-Forwarded-Encrypted: i=1; AJvYcCX5O3OCTY4rhNXSO351gjnp0BwLpIliHDi/EHSdjAyKNQYeKK5a3oV1Nqm0YZY5qAcl8uiG0DJx2pSyCk7uCqUx2A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyK4/HA9m+IfNhO/0+Fk6GqFZuZOZOA1ZL4/U/2WBhoxdQ2Apd3
	j5WeAxgDsTnBiWOglVVy5i1hqg52NDD70NIPInIAS8xnky1crIVTKK22Aop1jPGIfZE=
X-Gm-Gg: ASbGncujIWEC04HH1kl3/+G6mA7dVrVJifwhORYh6vhum4Qep21mNga8Kp8WO5Jv+OC
	mrjrDoJ0TeNsKJNXHj+X2ga8ZY11mJuNJPgLqGBWy7IMaCTtKncwAyGLOVYi/K+49fnXxI3oHS5
	D+4AZLkdUxPF2tDKpOdPpp/3Yn8a9hjm2XOqP6Dn9a5gJpL1i1qdblunhddNAxgQXblbMmQlhnD
	bUoN8Nm80i4FRm9Jm2PytXgsjUFflSdBjW+d5NrP/qj1f1WuvtHrZ6JpnHnfrcJ4XY7pbHHeyx4
	/mDpEQUZJ9aCadsDvuDYesHS6Elhgmda/14JNIjqBYQU2dJeiBe0NRipvtA8it9amwew1ps6j1b
	5ejw3El7eo5lqHDQFM+D3nRNYWLnEYsjDf3nGwdr8
X-Google-Smtp-Source: AGHT+IGHpCjnVjHcR9XKLl1rRARG73fz5I5gF0yLxRfNrdv1/8jrZjSu88U/v7RVcSbUYEFi7E4peA==
X-Received: by 2002:a05:6000:1a86:b0:39d:8d54:5eac with SMTP id ffacd0b85a97d-3a35fe5bb4emr1849221f8f.11.1747391874601;
        Fri, 16 May 2025 03:37:54 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fa4b:a3c2:43a9:a562? ([2001:8b0:aba:5f3c:fa4b:a3c2:43a9:a562])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a363d1fba6sm312172f8f.95.2025.05.16.03.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 03:37:53 -0700 (PDT)
Message-ID: <d5e3fb23201564091c09882d018b098a315c37da.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] buildstats-diff: find last two buildstats
 files if none are specified
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
Date: Fri, 16 May 2025 11:37:53 +0100
In-Reply-To: <20250516103324.963974-1-ross.burton@arm.com>
References: <20250516103324.963974-1-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 10:38:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216741

T24gRnJpLCAyMDI1LTA1LTE2IGF0IDExOjMzICswMTAwLCBSb3NzIEJ1cnRvbiB2aWEgbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZyB3cm90ZToKPiBJZiBubyBidWlsZHN0YXRzIGRpcmVjdG9yaWVzIGFy
ZSBzcGVjaWZpZWQsIHRoZW4gZmluZCB0aGUgbGFzdCB0d28gcnVucwo+IHVuZGVyIEJVSUxERElS
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPgo+
IC0tLQo+IMKgc2NyaXB0cy9idWlsZHN0YXRzLWRpZmYgfCAyNSArKysrKysrKysrKysrKysrKysr
KysrKy0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvc2NyaXB0cy9idWlsZHN0YXRzLWRpZmYgYi9zY3JpcHRzL2J1
aWxkc3RhdHMtZGlmZgo+IGluZGV4IGM5YWE3NmE4ZmFmLi4wZTk3NWRkY2ZjOSAxMDA3NTUKPiAt
LS0gYS9zY3JpcHRzL2J1aWxkc3RhdHMtZGlmZgo+ICsrKyBiL3NjcmlwdHMvYnVpbGRzdGF0cy1k
aWZmCj4gQEAgLTEyLDYgKzEyLDcgQEAgaW1wb3J0IGdsb2IKPiDCoGltcG9ydCBsb2dnaW5nCj4g
wqBpbXBvcnQgbWF0aAo+IMKgaW1wb3J0IG9zCj4gK2ltcG9ydCBwYXRobGliCj4gwqBpbXBvcnQg
c3lzCj4gwqBmcm9tIG9wZXJhdG9yIGltcG9ydCBhdHRyZ2V0dGVyCj4gwqAKPiBAQCAtMjUxLDEx
ICsyNTIsMzEgQEAgU2NyaXB0IGZvciBjb21wYXJpbmcgYnVpbGRzdGF0cyBvZiB0d28gc2VwYXJh
dGUgYnVpbGRzLiIiIgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgImF2ZXJhZ2Ugb3ZlciB0aGVtIikKPiDCoMKgwqDCoCBwYXJzZXIu
YWRkX2FyZ3VtZW50KCctLW9ubHktdGFzaycsIGRlc3Q9J29ubHlfdGFza3MnLCBtZXRhdmFyPSdU
QVNLJywgYWN0aW9uPSdhcHBlbmQnLCBkZWZhdWx0PVtdLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBoZWxwPSJPbmx5IGluY2x1ZGUgVEFTSyBpbiBy
ZXBvcnQuIE1heSBiZSBzcGVjaWZpZWQgbXVsdGlwbGUgdGltZXMiKQo+IC3CoMKgwqAgcGFyc2Vy
LmFkZF9hcmd1bWVudCgnYnVpbGRzdGF0czEnLCBtZXRhdmFyPSdCVUlMRFNUQVRTMScsIGhlbHA9
IidMZWZ0JyBidWlsZHN0YXQiKQo+IC3CoMKgwqAgcGFyc2VyLmFkZF9hcmd1bWVudCgnYnVpbGRz
dGF0czInLCBtZXRhdmFyPSdCVUlMRFNUQVRTMicsIGhlbHA9IidSaWdodCcgYnVpbGRzdGF0IikK
PiArwqDCoMKgIHBhcnNlci5hZGRfYXJndW1lbnQoJ2J1aWxkc3RhdHMxJywgbWV0YXZhcj0nQlVJ
TERTVEFUUzEnLCBuYXJncz0iPyIsIGhlbHA9IidMZWZ0JyBidWlsZHN0YXQiKQo+ICvCoMKgwqAg
cGFyc2VyLmFkZF9hcmd1bWVudCgnYnVpbGRzdGF0czInLCBtZXRhdmFyPSdCVUlMRFNUQVRTMics
IG5hcmdzPSI/IiwgaGVscD0iJ1JpZ2h0JyBidWlsZHN0YXQiKQo+IMKgCj4gwqDCoMKgwqAgYXJn
cyA9IHBhcnNlci5wYXJzZV9hcmdzKGFyZ3YpCj4gwqAKPiArwqDCoMKgIGlmIGFyZ3MuYnVpbGRz
dGF0czEgYW5kIGFyZ3MuYnVpbGRzdGF0czI6Cj4gK8KgwqDCoMKgwqDCoMKgICMgQm90aCBwYXRo
cyBzcGVjaWZpZWQKPiArwqDCoMKgwqDCoMKgwqAgcGFzcwo+ICvCoMKgwqAgZWxpZiBhcmdzLmJ1
aWxkc3RhdHMxIG9yIGFyZ3MuYnVpbGRzdGF0czI6Cj4gK8KgwqDCoMKgwqDCoMKgICMgSnVzdCBv
bmUgcGF0aCBzcGVjaWZpZWQsIHRoaXMgaXMgYW4gZXJyb3IKPiArwqDCoMKgwqDCoMKgwqAgcGFy
c2VyLnByaW50X3VzYWdlKHN5cy5zdGRlcnIpCj4gK8KgwqDCoMKgwqDCoMKgIHByaW50KCJFaXRo
ZXIgc3BlY2lmeSB0d28gYnVpbGRzdGF0cyBwYXRocywgb3Igbm9uZSB0byB1c2UgdGhlIGxhc3Qg
dHdvIHBhdGhzLiIsIGZpbGU9c3lzLnN0ZGVycikKPiArwqDCoMKgwqDCoMKgwqAgc3lzLmV4aXQo
MSkKPiArwqDCoMKgIGVsc2U6Cj4gK8KgwqDCoMKgwqDCoMKgICMgTm8gcGF0aHMgc3BlY2lmaWVk
LCB0cnkgdG8gZmluZCB0aGUgbGFzdCB0d28gYnVpbGRzdGF0cwo+ICvCoMKgwqDCoMKgwqDCoCB0
cnk6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnVpbGRzdGF0c19kaXIgPSBwYXRobGliLlBh
dGgob3MuZW52aXJvblsiQlVJTERESVIiXSkgLyAidG1wIiAvICJidWlsZHN0YXRzIgo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHBhdGhzID0gc29ydGVkKGJ1aWxkc3RhdHNfZGlyLml0ZXJkaXIo
KSkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhcmdzLmJ1aWxkc3RhdHMyID0gcGF0aHMucG9w
KCkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhcmdzLmJ1aWxkc3RhdHMxID0gcGF0aHMucG9w
KCkKPiArwqDCoMKgwqDCoMKgwqAgZXhjZXB0IEtleUVycm9yOgo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHBhcnNlci5wcmludF91c2FnZShzeXMuc3RkZXJyKQo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHByaW50KCJCdWlsZCBlbnZpcm9ubWVudCBoYXMgbm90IGJlZW4gY29uZmlndXJlZCwg
Y2Fubm90IGZpbmQgYnVpbGRzdGF0cyIsIGZpbGU9c3lzLnN0ZGVycikKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBzeXMuZXhpdCgxKQo+ICsKPiDCoMKgwqDCoCAjIFdlIGRvIG5vdCBuZWRkL3dh
bnQgdG8gcmVhZCBhbGwgYnVpbGRzdGF0cyBpZiB3ZSBqdXN0IHdhbnQgdG8gbG9vayBhdCB0aGUK
PiDCoMKgwqDCoCAjIHBhY2thZ2UgdmVyc2lvbnMKPiDCoMKgwqDCoCBpZiBhcmdzLnZlcl9kaWZm
OgoKU2hvdWxkIHRoaXMgcHJpbnQgc29tZXRoaW5nIHNvIHRoZSB1c2VyIGtub3dzIHdoaWNoIG9u
ZXMgaXQgcGlja2VkPwoKQ2hlZXJzLAoKUmljaGFyZAo=


