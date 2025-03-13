Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F551C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 11:17:30 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.12082.1741864642476155082
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 04:17:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WW4gPV/j;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39129fc51f8so691234f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 04:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1741864641; x=1742469441; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Gizge63GCDzLX/NcCeXqNAJxwieCVUqB8B75H0XovtE=;
        b=WW4gPV/jqI88AQeaxSjjWNFH84wlgFbCuLdCbXiTxreddj88+MA/LiG4h4cmjouSHl
         VDaUw0rdezlmkP2TXIDMHbxNNxCbvKt8vjHU9T0No3Exm3P1KmjUIIqWkPRDviQL6CWT
         prthAH6A06Pr3JIHMSHwzur0NA8uu/7dmXPEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741864641; x=1742469441;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gizge63GCDzLX/NcCeXqNAJxwieCVUqB8B75H0XovtE=;
        b=qR6I/GkB70zRaWIjYldIRyIJgRPCNeFu3zAKy4Gmj6y06aSz/DwQXbzRIcFIIz6BPf
         qytByuA5GsvqUIZ6mXnxSbvc5IKWhMrxBLh3SlzC6mEykoTb4ZNyjA+SR1sjQ5fOw2uY
         fmC5dqG8jTmk6WMaxawmySWgfDELWmQQxaVnrsf9gYM8JOeG+mghCuEeiLSabPplPWB1
         8BeoFXGSDIakc81LnbFMvTYvWTSdJNKnMcYCn/D3DuSdoZ80DY3n76x/V2brEovuP8ax
         zWBL0iJ2wVhJnuhQsdgfLyy0A5zoOq7sAUS5I0GQ7THYReuw8cTqBuPmVaIYkl9mkRka
         QTrw==
X-Forwarded-Encrypted: i=1; AJvYcCVqdpXSaCRxA+/RYrg2tPADPgPiePUAOZadzcjojZDCiFg3/zE31ZRoQEOPJaoS+vRMqYl0I3s00yLg33R1D5Qf5A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwjUsF0L73a/0J+2ejJUPUyKnYS2EKM2RICy5Vw0IY+LsfdGOeX
	kBEJllYhPHfWedVdq7fRj4PBw1HT+8AHpyUgxKPqU7dkc/jr21kTKheCZSjG288eyoruOypPGeo
	Z
X-Gm-Gg: ASbGncsnHfF9BNo2PrsNjEO24b0+L+to220hMZo7qB/B0RgPwJu56qSX5sLK4ZC6Yts
	xda5XliwRYArpV4reJLQR6XHVx/uMCpxosy4p9+8hcBraUe+IkMlqy7YMaQAw9WIIYTQHGzBHnK
	88YeSiuzye6AQ3AFgTM08QwCW0AK3Y6eYShpJJMlIQmwSp8iImJSJQbvWvuSKnGuT7WNy5JiN9B
	m3yYTsGYG72uWPL/v24RzvTelm1wKynNvStj7FDd0G9g8aXGDILq5CEMF0DtQIyJWXIeZ1Mpizm
	lRa9VToP2qF9gmx+gEuQSTj/JEilwy3UgCsRpt5C9m/B9nwvD3+HGRlUl3w6ERZIOviZ3t5jE54
	5dDRJc7BT9UdIVTYXyQTYBnTY4r0gbsjQhQ==
X-Google-Smtp-Source: AGHT+IHx9E7RfSiiMY0qazlcenPSzHRAy4F+RuXO3C4orqTwqViEV5iGWfsebX0J/gWOaTV+nlDwcg==
X-Received: by 2002:a05:6000:1fa5:b0:390:ebae:6c18 with SMTP id ffacd0b85a97d-39132d47b43mr15748537f8f.12.1741864640939;
        Thu, 13 Mar 2025 04:17:20 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cc37:5f80:1a41:4bc8? ([2001:8b0:aba:5f3c:cc37:5f80:1a41:4bc8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7e9f8asm1754197f8f.81.2025.03.13.04.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:17:20 -0700 (PDT)
Message-ID: <da83d8e16dc223d2534213156ce79c0b4b06369a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] scripts/install-buildtools: write
 download URLs to files for traceability
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Thu, 13 Mar 2025 11:17:19 +0000
In-Reply-To: <20250311104152.393470-2-alex.kanavin@gmail.com>
References: <20250311104152.393470-1-alex.kanavin@gmail.com>
	 <20250311104152.393470-2-alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 11:17:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212766

T24gVHVlLCAyMDI1LTAzLTExIGF0IDExOjQxICswMTAwLCBBbGV4YW5kZXIgS2FuYXZpbiB2aWEg
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToKPiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8
YWxleEBsaW51dHJvbml4LmRlPgo+IAo+IFRoaXMgZXh0ZW5kcyB0aGUgcHJldmlvdXMgY29tbWl0
LCBzbyB0aGF0IGRvd25sb2FkIFVSTHMgYXJlIHByZXNlcnZlZAo+IGluIGFkZGl0aW9uIHRvIGFj
dHVhbCBhcnRlZmFjdHMuIEJ5IGRlZmF1bHQgaXQncyBhbGwgd3JpdHRlbiB0byBhIHRlbXBvcmFy
eQo+IGRpcmVjdG9yeSBhbmQgZXJhc2VkIHRvZ2V0aGVyIHdpdGggYXJ0ZWZhY3RzLCBidXQgdXNl
cnMgY2FuIGNob29zZQo+IHRvIHByZXNlcnZlIGJvdGg6Cj4gCj4gJCBpbnN0YWxsLWJ1aWxkdG9v
bHMgLUQgLS1rZWVwLWRvd25sb2Fkcy1kaXJlY3Rvcnk9Lgo+IC4uLgo+IAo+ICQgbHMgLTEKPiBi
dWlsZHRvb2xzX3VybAo+IGNoZWNrX3VybAo+IHg4Nl82NC1idWlsZHRvb2xzLWV4dGVuZGVkLW5h
dGl2ZXNkay1zdGFuZGFsb25lLTUuMS4yLnNoCj4geDg2XzY0LWJ1aWxkdG9vbHMtZXh0ZW5kZWQt
bmF0aXZlc2RrLXN0YW5kYWxvbmUtNS4xLjIuc2guc2hhMjU2c3VtCj4gCj4gU2lnbmVkLW9mZi1i
eTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KPiAtLS0KPiDCoHNjcmlw
dHMvaW5zdGFsbC1idWlsZHRvb2xzIHwgNCArKysrCj4gwqAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3NjcmlwdHMvaW5zdGFsbC1idWlsZHRvb2xzIGIv
c2NyaXB0cy9pbnN0YWxsLWJ1aWxkdG9vbHMKPiBpbmRleCAxYTY4YWFkNTNlNy4uN2JkNjU1NmVk
ZjYgMTAwNzU1Cj4gLS0tIGEvc2NyaXB0cy9pbnN0YWxsLWJ1aWxkdG9vbHMKPiArKysgYi9zY3Jp
cHRzL2luc3RhbGwtYnVpbGR0b29scwo+IEBAIC0yNDMsNiArMjQzLDggQEAgZGVmIG1haW4oKToK
PiDCoMKgwqDCoMKgwqDCoMKgICMgRmV0Y2ggaW5zdGFsbGVyCj4gwqDCoMKgwqDCoMKgwqDCoCBs
b2dnZXIuaW5mbygiRmV0Y2hpbmcgYnVpbGR0b29scyBpbnN0YWxsZXIiKQo+IMKgwqDCoMKgwqDC
oMKgwqAgdG1wYnVpbGR0b29scyA9IG9zLnBhdGguam9pbihzZGtfZGlyLCBmaWxlbmFtZSkKPiAr
wqDCoMKgwqDCoMKgwqAgd2l0aCBvcGVuKG9zLnBhdGguam9pbihzZGtfZGlyLCAnYnVpbGR0b29s
c191cmwnKSwgJ3cnKSBhcyBmOgo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGYud3JpdGUoYnVp
bGR0b29sc191cmwpCj4gwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBzdWJwcm9jZXNzLmNhbGwoIndn
ZXQgLXEgLU8gJXMgJXMiICUKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKHRtcGJ1aWxkdG9vbHMsIGJ1aWxkdG9vbHNfdXJsKSwg
c2hlbGw9VHJ1ZSkKPiDCoMKgwqDCoMKgwqDCoMKgIGlmIHJldCAhPSAwOgo+IEBAIC0yNTYsNiAr
MjU4LDggQEAgZGVmIG1haW4oKToKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2hlY2tfdXJs
ID0gInt9Lnt9Ii5mb3JtYXQoYnVpbGR0b29sc191cmwsIGNoZWNrc3VtX3R5cGUpCj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGNoZWNrc3VtX2ZpbGVuYW1lID0gInt9Lnt9Ii5mb3JtYXQoZmls
ZW5hbWUsIGNoZWNrc3VtX3R5cGUpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRtcGJ1aWxk
dG9vbHNfY2hlY2tzdW0gPSBvcy5wYXRoLmpvaW4oc2RrX2RpciwgY2hlY2tzdW1fZmlsZW5hbWUp
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgd2l0aCBvcGVuKG9zLnBhdGguam9pbihzZGtfZGly
LCAnY2hlY2tfdXJsJyksICd3JykgYXMgZjoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGYud3JpdGUoY2hlY2tfdXJsKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBz
dWJwcm9jZXNzLmNhbGwoIndnZXQgLXEgLU8gJXMgJXMiICUKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKHRt
cGJ1aWxkdG9vbHNfY2hlY2tzdW0sIGNoZWNrX3VybCksIHNoZWxsPVRydWUpCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGlmIHJldCAhPSAwOgo+IAoKClRoZSBuYW1pbmcgb2YgImNoZWNrX3Vy
bCIgbmVlZHMgdG8gYmUgY2hhbmdlZC4gSSBhcHByZWNpYXRlIHlvdSd2ZSB1c2VkCmEgdmFyaWFi
bGUgbmFtZSBmcm9tIHRoZSBjb2RlIGhvd2V2ZXIgd2hlbiB5b3Ugc2VlIHRoaXMgZmlsZSBpbgpp
c29sYXRpb24gaW4gYSBkaXJlY3RvcnksIHlvdSdkIGhhdmUgbm8gcmVhbCBpZGVhIHdoYXQgaXQg
aXMgKGEKY2hlY2tzdW0gZm9yIHRoZSBkb3dubG9hZGVkIGZpbGUpLiAiYnVpbGR0b29sc191cmwu
Y2hlY2tzdW0iIG1pZ2h0IGJlCmV2ZW4gY2xlYXJlcj8KCkNoZWVycywKClJpY2hhcmQKCg==


