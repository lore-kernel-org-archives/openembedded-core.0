Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED59CD5BA3
	for <webhook@archiver.kernel.org>; Thu,  5 Sep 2024 09:56:36 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.5672.1725530194818475619
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Sep 2024 02:56:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BAgtXjLo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42bbe809b06so4120095e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Sep 2024 02:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1725530193; x=1726134993; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHaotudtt9qEjY6sSqNF/kw+kgvB5sAMteB4hSggA8U=;
        b=BAgtXjLo4+yvaWFLO50wLwHj9iVkW0xQz6chgd/EoDv66sqZioPq3uzUgljDqEis1n
         Fc3NkI3XYMFUDdsPVlCufM8Lm+B10fs/R9x9NNkK5Gb0TUdNGg4ctP/Y3VZrqeSirGWD
         760lemK5hI7eXiq0b0VLi1RoWoWTC5waMcD2E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725530193; x=1726134993;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eHaotudtt9qEjY6sSqNF/kw+kgvB5sAMteB4hSggA8U=;
        b=UJVldZ//I4IzrJ9IyL1P43y9MdOSq2lVzdr1swZcXEyH5Q3MiDAczkJcdUGRURjEjA
         3jCEnokEX/WrduDhMMFX1ZuexMjOTG5f76JxwodKu5ZPOoIJMszdqUu4yijSE76Mhgx1
         hKtb7x9fXoQJivIOgBTBp0O1sW2X70t5rzGvH9+8eq3AANLnbaAnfuSR43+oC9s2kUGi
         Gi4MMLreGS8t3U5gbkdhRCfxN7FyBwbl0JVv4qR39tE0pZjvFdFF7fKerwTu90XW9cE4
         7sJU77tWAWsPCMUN+P6ksTVWsDuyEIjOkUscQV2GJLIPDdmus4dHtJPmK5sXkdRaZIyq
         qbhA==
X-Forwarded-Encrypted: i=1; AJvYcCXiuIYSyktZKGQDKQM+5cNzn1ps+Zr58yuQIM9qZOxD1vG6Wl2Igx6NE+oT3h6deJLsyb02TVbaX2u8MJU/SCnjsQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywq1PM5GsgCAoU57X/lE8AnsWhBh319KX6r2iCp/7Wc/X+6BQlv
	yWt65GxpKBhQulqGD09YJxfYhnOIEW3yXi8JtMXuOghC0+6sx/pgZrIMLowxl/g=
X-Google-Smtp-Source: AGHT+IHsUF2qpnTC49ICfIFCQy4C3btHwrXie5d1c7q6PQLcbQjuN/pUGAWZlzNssBs3ply6m5UICA==
X-Received: by 2002:a05:600c:1914:b0:426:8884:2c58 with SMTP id 5b1f17b1804b1-42bb02c10bemr190008195e9.4.1725530193087;
        Thu, 05 Sep 2024 02:56:33 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b438:ccaf:fc83:f321? ([2001:8b0:aba:5f3c:b438:ccaf:fc83:f321])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bbdda3958sm196050065e9.26.2024.09.05.02.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 02:56:32 -0700 (PDT)
Message-ID: <67ea9ebc458af8adc9b8c625fea9b27e3b452f76.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] runqemu: lock tap creation process
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: kweihmann@outlook.com, openembedded-core@lists.openembedded.org
Date: Thu, 05 Sep 2024 10:56:31 +0100
In-Reply-To: <GV1PR07MB91203A774F08D3110C579514A89C2@GV1PR07MB9120.eurprd07.prod.outlook.com>
References: 
	<GV1PR07MB91203A774F08D3110C579514A89C2@GV1PR07MB9120.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Sep 2024 09:56:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204229

T24gV2VkLCAyMDI0LTA5LTA0IGF0IDEyOjIxICswMDAwLCBLb25yYWQgV2VpaG1hbm4gdmlhIGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6Cj4gaW4gY2FzZSBvZiBydW5uaW5nIHR3byBvciBt
b3JlIHJ1bnFlbXUgaW5zdGFuY2VzIGluIHBhcmFsbGVsCj4gd2l0aCBubyBwcmV2aW91c2x5IHNl
dHVwIHRhcCBkZXZpY2VzLCB0aGUgZm9sbG93aW5nIGhhcHBlbnM6Cj4gCj4gaW5zdGFuY2UgQSBw
cm9iZXMgZm9yIHRhcCBkZXZpY2VzLCBidXQgZG9lc24ndCBmaW5kCj4gYW55LCBwcm9jZWVkcyB0
byBnZW5lcmF0aW5nIHRhcCBkZXZpY2VzIHdpdGggdGhlIHN1ZG8gY2FsbCwKPiByZXN1bHRpbmcg
aW4gdGFwMC4KPiBpbnN0YW5jZSBCIHN0YXJ0cyB0byBwcm9iZXMsIGZpbmRzIHRhcDAuCj4gQm90
aCB3aWxsIGxvY2sgdGFwMC4KPiAKPiB0YXAwIHdpbGwgYmUgdGhlbiBmb3J3YXJkZWQgdG8gcWVt
dS4KPiBJbnN0YW5jZSBBIHJlcG9ydGluZwo+IAo+ICJVc2luZyBwcmVjb25maWd1cmVkIHRhcCBk
ZXZpY2UgdGFwMCIKPiAKPiBidXQgdGhlbiBmYWlsaW5nIHdpdGgKPiAKPiBxZW11LXN5c3RlbS4u
LiBjb3VsZCBub3QgY29uZmlndXJlIC9kZXYvbmV0L3R1biAodGFwMCk6IERldmljZSBvciByZXNv
dXJjZSBidXN5Cj4gCj4gVG8gZml4IHRoYXQsIGxvY2sgdGhlIGVudGlyZSB0YXAgY3JlYXRpb24g
cHJvY2VzcyB3aXRoCj4gYW4gZXhjbHVzaXZlIGZpbGUgKGJsb2NraW5nKSBsb2NrLCBzbyBvbmx5
IGEgc2luZ2xlIGluc3RhbmNlIGNhbgo+IHBlcmZvcm0gdGhlIG5vbi1hdG9taWMgY2hhbmdlcy4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBLb25yYWQgV2VpaG1hbm4gPGt3ZWlobWFubkBvdXRsb29rLmNv
bT4KPiAtLS0KPiDCoHNjcmlwdHMvcnVucWVtdSB8IDEwICsrKysrKysrKysKPiDCoDEgZmlsZSBj
aGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3NjcmlwdHMvcnVucWVt
dSBiL3NjcmlwdHMvcnVucWVtdQo+IGluZGV4IDI4MTdhY2IxOWYuLmU1ZGIwNmJlMzcgMTAwNzU1
Cj4gLS0tIGEvc2NyaXB0cy9ydW5xZW11Cj4gKysrIGIvc2NyaXB0cy9ydW5xZW11Cj4gQEAgLTEx
NjMsNiArMTE2Myw5IEBAIHRvIHlvdXIgYnVpbGQgY29uZmlndXJhdGlvbi4KPiDCoAo+IMKgwqDC
oMKgwqDCoMKgwqAgc2VsZi5tYWtlX2xvY2tfZGlyKGxvY2tkaXIpCj4gwqAKPiArwqDCoMKgwqDC
oMKgwqAgdGFwX3NldHVwX2xvY2sgPSBvcGVuKG9zLnBhdGguam9pbihsb2NrZGlyLCAnX3RhcF9j
cmVhdGlvbl9sb2NrJyksICd3JykKPiArwqDCoMKgwqDCoMKgwqAgZmNudGwuZmxvY2sodGFwX3Nl
dHVwX2xvY2ssIGZjbnRsLkxPQ0tfRVgpCj4gKwo+IMKgwqDCoMKgwqDCoMKgwqAgY21kID0gKGlw
LCAnbGluaycpCj4gwqDCoMKgwqDCoMKgwqDCoCBsb2dnZXIuZGVidWcoJ1J1bm5pbmcgJXMuLi4n
ICUgc3RyKGNtZCkpCj4gwqDCoMKgwqDCoMKgwqDCoCBpcF9saW5rID0gc3VicHJvY2Vzcy5jaGVj
a19vdXRwdXQoY21kKS5kZWNvZGUoJ3V0Zi04JykKPiBAQCAtMTE4Nyw2ICsxMTkwLDggQEAgdG8g
eW91ciBidWlsZCBjb25maWd1cmF0aW9uLgo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoCBpZiBub3Qg
dGFwOgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiBvcy5wYXRoLmV4aXN0cyhub3N1ZG9f
ZmxhZyk6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmY250bC5mbG9jayh0YXBf
c2V0dXBfbG9jaywgZmNudGwuTE9DS19VTikKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHRhcF9zZXR1cF9sb2NrLmNsb3NlKCkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBsb2dnZXIuZXJyb3IoIkVycm9yOiBUaGVyZSBhcmUgbm8gYXZhaWxhYmxlIHRhcCBkZXZp
Y2VzIHRvIHVzZSBmb3IgbmV0d29ya2luZywiKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGxvZ2dlci5lcnJvcigiYW5kIEkgc2VlICVzIGV4aXN0cywgc28gSSBhbSBub3QgZ29p
bmcgdG8gdHJ5IGNyZWF0aW5nIiAlIG5vc3Vkb19mbGFnKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHJhaXNlIFJ1blFlbXVFcnJvcigiYSBuZXcgb25lIHdpdGggc3Vkby4iKQoK
VGhpcyBkb2Vzbid0IG1ha2Ugc2Vuc2UgdG8gbWUuIFN1cmVseSB5b3Ugc2hvdWxkIGJlIHRha2lu
ZyB0aGlzIGxvY2sKKndpdGhpbiogdGhlICJpZiBub3QgdGFwIiBjb2RlIGJsb2NrIHNpbmNlIHRo
YXQgaXMgd2hlcmUgdGhlIGlmdXAgaXMKY2FsbGVkIG91dCB0byB3aXRoIHN1ZG8/IFlvdSBhcHBl
YXIgdG8gYmUgZHJvcHBpbmcgdGhlIGxvY2sgdGhlcmUKaW5zdGVhZD8KCkl0IGFwcGVhcnMgeW91
J3JlIHB1dHRpbmcgdGhlIGxvY2tpbmcgYXJvdW5kIHRoZSBzZWFyY2ggZm9yIHByZS0KY29uZmln
dXJlZCB0YXAgZGV2aWNlcyB3aGljaCBpcyBhbHJlYWR5IGF0b21pYyBhbmQgd29ya2luZyB3ZWxs
IGZyb20gYQpyYWNlIHBlcnNwZWN0aXZlPwoKPiBAQCAtMTE5OCw2ICsxMjAzLDggQEAgdG8geW91
ciBidWlsZCBjb25maWd1cmF0aW9uLgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0cnk6Cj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGFwID0gc3VicHJvY2Vzcy5jaGVja19v
dXRwdXQoY21kKS5kZWNvZGUoJ3V0Zi04Jykuc3RyaXAoKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBleGNlcHQgc3VicHJvY2Vzcy5DYWxsZWRQcm9jZXNzRXJyb3IgYXMgZToKPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZjbnRsLmZsb2NrKHRhcF9zZXR1cF9sb2NrLCBmY250
bC5MT0NLX1VOKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGFwX3NldHVwX2xv
Y2suY2xvc2UoKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxvZ2dlci5lcnJv
cignU2V0dGluZyB1cCB0YXAgZGV2aWNlIGZhaWxlZDpcbiVzXG5SdW4gcnVucWVtdS1nZW4tdGFw
ZGV2cyB0byBtYW51YWxseSBjcmVhdGUgb25lLicgJSBzdHIoZSkpCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgc3lzLmV4aXQoMSkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
bG9ja2ZpbGUgPSBvcy5wYXRoLmpvaW4obG9ja2RpciwgdGFwKQo+IEBAIC0xMjA2LDYgKzEyMTMs
OSBAQCB0byB5b3VyIGJ1aWxkIGNvbmZpZ3VyYXRpb24uCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHNlbGYuY2xlYW50YXAgPSBUcnVlCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxvZ2dl
ci5kZWJ1ZygnQ3JlYXRlZCB0YXA6ICVzJyAlIHRhcCkKPiDCoAo+ICvCoMKgwqDCoMKgwqDCoCBm
Y250bC5mbG9jayh0YXBfc2V0dXBfbG9jaywgZmNudGwuTE9DS19VTikKPiArwqDCoMKgwqDCoMKg
wqAgdGFwX3NldHVwX2xvY2suY2xvc2UoKQoKRm9yIGxvY2tzIGxpa2UgdGhpcywgdGhleSBzaG91
bGQgcmVhbGx5IGJlIGluIGEgdHJ5L2ZpbmFsbHkgb3Igd2l0aCBjbGF1c2UuLi4KCkNoZWVycywK
ClJpY2hhcmQK


