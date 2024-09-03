Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80123CD342C
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 06:15:57 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.17047.1725344149768575444
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 23:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ca33FkQ8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42bb9d719d4so35712065e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 23:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1725344148; x=1725948948; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XhyRUAuTKP0P0e2WetWlb7tFBNOQbqJxKysyD+mcCnQ=;
        b=ca33FkQ8ZgZNAEyuD8MVKgHpvEA7BHPN6uTRZqhqhXn8DP595L3XyICAlmKLI9W1dk
         KnW4563UFtdrhuKAMow7C/x+x6itZ+JuBoTkY0FOgqLbMjsEGLG5gfWvUnCX8UMPElS2
         EREjR7RRySAMh0mbCqMvlHP0H28ndtPzudXU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725344148; x=1725948948;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XhyRUAuTKP0P0e2WetWlb7tFBNOQbqJxKysyD+mcCnQ=;
        b=hGbeKQDuRa9GNwGklc8iKCUj7WWxw13kqOE1RQky/ob1VMMM1SWYqOAjlNu83ORS0G
         85n6Jt/wNtWXWX6zR5QhRbgO47Z9UvzjUSBIrFc4YeBDV4//Uf7hTxc0BWnKmlfieQEV
         lIKFgsLP1OeV/ebWUigVhcFNR1SG9jcsSDw4wHXteqEtUgKVHuS8+V4cBbNvn9yjQkD9
         4actZkfzMXvia+7X/M12dVswjfVao4+/vL9ntqyGn25YM8xHlUVV/aJg2qaqNMATnM8M
         Rn8puq2YxF40hXUuvCo7C2/pB6JNnOTrgzr34mSk4VSGHUgwKUes9SEGDjFDYOJ8FmY2
         8Iog==
X-Forwarded-Encrypted: i=1; AJvYcCX7+dqPsLgmom9zol+oNSw/c7+0jw+RvXo0xEuqKl/vE/4THFOhD6iBk+AK6Q9nvwRsuG3vd8f9Q3QWtOI1/oiNLg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx9g6vt/RUGLiwVIfgU47JDSR1qOTi9XJ95rps5fAmAcisHaZr8
	a1t+ZB3JSOmF5Yfh5SFlc9l7D2MKzvbrAYNUrxsOQHTNNJUu/3fz2zsWh2X4FCo=
X-Google-Smtp-Source: AGHT+IFGF63MbXOL0lOMUlYy3JQPFLNtCTJrPfZ72M0Jk5u54hTREcO0wQ5hoAUss9ZosvVFfVEHWA==
X-Received: by 2002:a05:600c:1d17:b0:429:e67f:1249 with SMTP id 5b1f17b1804b1-42c880ec58bmr16429095e9.3.1725344148007;
        Mon, 02 Sep 2024 23:15:48 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1580:b583:9f1b:260d? ([2001:8b0:aba:5f3c:1580:b583:9f1b:260d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bbf00e095sm119370255e9.13.2024.09.02.23.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 23:15:47 -0700 (PDT)
Message-ID: <a3f27a205be6de32831548d12be2e019ac9f3371.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/3] devtool: remove obsolete
 SRCTREECOVEREDTASKS handling
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: adrian.freihofer@gmail.com, openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Date: Tue, 03 Sep 2024 07:15:46 +0100
In-Reply-To: <20240902203154.265515-3-adrian.freihofer@gmail.com>
References: <20240902203154.265515-1-adrian.freihofer@gmail.com>
	 <20240902203154.265515-3-adrian.freihofer@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 06:15:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204121

T24gTW9uLCAyMDI0LTA5LTAyIGF0IDIyOjMxICswMjAwLCBBZHJpYW4gRnJlaWhvZmVyIHZpYSBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOgo+IEZyb206IEFkcmlhbiBGcmVpaG9mZXIgPGFk
cmlhbi5mcmVpaG9mZXJAc2llbWVucy5jb20+Cj4gCj4gVGhlIGtlcm5lbC15b2N0by5iYmNsYXNz
IGRlZmluZXMgc29tZSB0YXNrcyB0YXNrcyBhbmQgaXQgYWxzbyBhZGRzIHRoZXNlCj4gdGFza3Mg
dG8gdGhlIFNSQ1RSRUVDT1ZFUkVEVEFTS1MgbGlzdC4gVGhlcmUgaXMgbm8gbmVlZCBmb3IgZGV2
dG9vbCB0bwo+IGR1cGxpY2F0ZSB0aGlzIGNvZGUgYW5kIG92ZXJyaWRlIHdoYXQgdGhlIGtlcm5l
bC15b2N0by5iYmNsYXNzIGFscmVhZHkKPiBkb2VzLgo+IAo+IGRldnRvb2wgbW9kaWZ5IGdlbmVy
YXRlcyBhIGxpbnV4LXlvY3RvLjYuNi5iYmFwcGVuZCBjb250YWluaW5nOgo+IMKgIFNSQ1RSRUVD
T1ZFUkVEVEFTS1M9IlwKPiDCoMKgwqAgZG9fZmV0Y2ggXAo+IMKgwqDCoCBkb19rZXJuZWxfY2hl
Y2tvdXQgXAo+IMKgwqDCoCBkb19rZXJuZWxfY29uZmlnY2hlY2sgXAo+IMKgwqDCoCBkb191bnBh
Y2sgXAo+IMKgwqDCoCBkb192YWxpZGF0ZV9icmFuY2hlcyBcCj4gwqAgIgo+IMKgIGRvX3BhdGNo
W25vZXhlY10gPSAiMSIKPiAKPiBsaW51eC15b2N0byBzZXQgU1JDVFJFRUNPVkVSRURUQVNLUyB0
bwo+IMKgIFNSQ1RSRUVDT1ZFUkVEVEFTS1M9IlwKPiDCoMKgwqAgZG9fZmV0Y2ggXAo+IMKgwqDC
oCBkb19rZXJuZWxfY2hlY2tvdXQgXAo+IMKgwqDCoCBkb19rZXJuZWxfY29uZmlnY2hlY2sgXAo+
IMKgwqDCoCBkb19wYXRjaCBcCj4gwqDCoMKgIGRvX3VucGFjayBcCj4gwqDCoMKgIGRvX3ZhbGlk
YXRlX2JyYW5jaGVzIFwKPiDCoCAiCj4gCj4gVGhlIGNvZGUgaW4gZGV2dG9vbCBtb2RpZnkgaXMg
dGhlcmVmb3JlIGNvbnNpZGVyZWQgYXMgcmVkdW5kYW50IGFuZAo+IHJlbW92ZWQuCj4gCj4gU2ln
bmVkLW9mZi1ieTogQWRyaWFuIEZyZWlob2ZlciA8YWRyaWFuLmZyZWlob2ZlckBzaWVtZW5zLmNv
bT4KPiAtLS0KPiDCoHNjcmlwdHMvbGliL2RldnRvb2wvc3RhbmRhcmQucHkgfCAzIC0tLQo+IMKg
MSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3NjcmlwdHMv
bGliL2RldnRvb2wvc3RhbmRhcmQucHkgYi9zY3JpcHRzL2xpYi9kZXZ0b29sL3N0YW5kYXJkLnB5
Cj4gaW5kZXggMzEyZWI4YWI1MDYuLmIyZTFhNmNhM2E1IDEwMDY0NAo+IC0tLSBhL3NjcmlwdHMv
bGliL2RldnRvb2wvc3RhbmRhcmQucHkKPiArKysgYi9zY3JpcHRzL2xpYi9kZXZ0b29sL3N0YW5k
YXJkLnB5Cj4gQEAgLTk1Miw5ICs5NTIsNiBAQCBkZWYgbW9kaWZ5KGFyZ3MsIGNvbmZpZywgYmFz
ZXBhdGgsIHdvcmtzcGFjZSk6Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZi53
cml0ZSgnRVhURVJOQUxTUkNfQlVJTEQ6cG4tJXMgPSAiJXMiXG4nICUgKHBuLCBzcmN0cmVlKSkK
PiDCoAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiBiYi5kYXRhLmluaGVyaXRzX2NsYXNz
KCdrZXJuZWwnLCByZCk6Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmLndyaXRl
KCdTUkNUUkVFQ09WRVJFRFRBU0tTID0gImRvX3ZhbGlkYXRlX2JyYW5jaGVzIGRvX2tlcm5lbF9j
aGVja291dCAnCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgJ2RvX2ZldGNoIGRvX3VucGFjayBkb19rZXJuZWxfY29uZmlnY2hlY2siXG4nKQo+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZi53cml0ZSgnXG5kb19wYXRjaFtub2V4ZWNdID0g
IjEiXG4nKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGYud3JpdGUoJ1xuZG9f
a2VybmVsX2NvbmZpZ21lOnByZXBlbmQoKSB7XG4nCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICfCoMKgwqAgaWYgWyAtZSAke1N9Ly5jb25maWcgXTsg
dGhlblxuJwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAnwqDCoMKgwqDCoMKgwqAgbXYgJHtTfS8uY29uZmlnICR7U30vLmNvbmZpZy5vbGRcbicKCgpO
b3RlIHRoYXQgImtlcm5lbCIgIT0gImxpbnV4LXlvY3RvIi4gRG9lcyBhIHN0YW5kYXJkIGtlcm5l
bCBzdGlsbCBuZWVkIGZldGNoL3VucGFjaz8KCkNoZWVycywKClJpY2hhcmQKCg==


