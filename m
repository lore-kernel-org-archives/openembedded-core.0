Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88E02C369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 10:36:03 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.11967.1745490961880152213
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 03:36:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QXYtySx7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso7708855e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 03:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745490960; x=1746095760; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ToBVl3NqDKgdHRS5d8UBKzRaZTINhWagZ5UnvSh27Qk=;
        b=QXYtySx7JbnJ03bm4kuwtfyurAOQ+83CnAQwUMOP4VM7p54lp72sc0HmPnfIFEelKC
         yAUevNai9MAOoxBPMSNnEcYClPaehYw39peO1i7dfrcc/4nstliOXaKe9Q29mWoj5oEf
         nzKv7crYWQu11Ut/fU4Px4SABpc4htU97BZWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490960; x=1746095760;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ToBVl3NqDKgdHRS5d8UBKzRaZTINhWagZ5UnvSh27Qk=;
        b=R839RDAfG9V/E7phPK4HxnEMflTT8hX5aE0tDf45eq9Vx2ZvK19/TumYNBQAW4poL2
         IrTa38vK+/S2RCouZDR8IcltDzm5LeLHpOVmiHsKxETgxt/eyUFzirqeedF7OWZbuwzV
         dZoU3qjpEuXKB4oWcY+9vVmG6htF8ODshYctbl/Rmq9QJoi636wMKhS7y0AOJ4d2F3o0
         MkOfCE1Hfnh4o0zagv13NoRAoUbrXy6y56+w5MR+Y55AtiuGF2xbxbtPLFNKGJjP3b9b
         04jXBRxAV3k710yru+0vKs19AYF8tz+XcqcBW9B/AkwOVJ8BzYGIC/eFNIo0LZTxqYU7
         tiCg==
X-Forwarded-Encrypted: i=1; AJvYcCXXglrtKjynH7W5LLKs2jQDiWjRd9asazwcseC9/uJPoOzHKNEp0saQzBbLlkMeD1bbCXHWi6Wt399W7fNQt7pBvw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzYiQDQm0wMz6aPNLKK/9qVL53pXbbiHX/KbIr9lWWlL0aUisLJ
	SXSPxtSNsjYcXm/eajf5rslnRfWkVJChNG49b9zzvpj9QwPlfxXxIKIqLC/OTHYWGmWpFdvF4iO
	y
X-Gm-Gg: ASbGncsER0Xr80j3raR1lWsS+0Aa/JiJEat0RdSKhcvPE9SdL+OiAna/1aQ8xlv+6LZ
	FJYyuet4AoFeReb6epJArNRXpjYtG561nd4ktRvFBzel1UZfpOHgcS1+mn/ujuf+iHf5ZQlGS/j
	jIrfCZMkRaeU252r0+BIp8w4osPXhq0nsWOL1kS5/G9Qxi0epvs0nlBhgGW5SToqgkxeM7fGDpv
	m4RvdAfuY85kJz+hp/W9y1t8hU4D+oaXVvnLexumMxKjubzs0qJ/J5NXyfsXOZM6UXk5SMJkPmM
	rwBeeSpxvL8MdG76p1Uyxdp+TIyTFH6/g4TljtSwcUEBns1P3lI2YatrTP01KCIALLRMmhFs809
	6cGt0q0PI6UzzPerhGzXD4se90L72jg==
X-Google-Smtp-Source: AGHT+IEcoE/HVSpLUdjLDYEvILhcIjUiGnUZcRbpMrSYiiniN86B5zH16ZPukWXpenzJbpVep+gROw==
X-Received: by 2002:a05:600c:3149:b0:440:6760:d06a with SMTP id 5b1f17b1804b1-4409bcfa3c8mr16112075e9.5.1745490960259;
        Thu, 24 Apr 2025 03:36:00 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:94cb:8780:19ce:62be? ([2001:8b0:aba:5f3c:94cb:8780:19ce:62be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2c3b0asm15699965e9.40.2025.04.24.03.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:35:59 -0700 (PDT)
Message-ID: <5537bb59deeb08b9984078a4a61c32fe559a191d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4 8/9] wic bootimg-efi.py: fail build if no
 binaries installed
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Date: Thu, 24 Apr 2025 11:35:58 +0100
In-Reply-To: <20250422143501.99565-9-mikko.rapeli@linaro.org>
References: <20250422143501.99565-1-mikko.rapeli@linaro.org>
	 <20250422143501.99565-9-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 10:36:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215350

T24gVHVlLCAyMDI1LTA0LTIyIGF0IDE3OjM1ICswMzAwLCBNaWtrbyBSYXBlbGkgdmlhIGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6Cj4gV2l0aCBzeXN0ZW1kLWJvb3QsIHNvbWUgYnVpbGRz
IGluY2x1ZGVkIGNvcnJlY3QgRUZJCj4gYm9vdGxvYWRlciBiaW5hcmllcyBhbmQgc29tZSBub3Qu
IFRodXMgc29tZSBidWlsZHMKPiBib290ZWQgYW5kIHNvbWUgbm90LiBDaGVjayB0aGF0IHNvbWUg
Ym9vdCBiaW5hcnkKPiB3YXMgaW5zdGFsbGVkIHNvIHRoYXQgYnVpbGQgZmFpbHMgaWYgbm9uZSB3
ZXJlIGluc3RhbGxlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNaWtrbyBSYXBlbGkgPG1pa2tvLnJh
cGVsaUBsaW5hcm8ub3JnPgo+IC0tLQo+IMKgc2NyaXB0cy9saWIvd2ljL3BsdWdpbnMvc291cmNl
L2Jvb3RpbWctZWZpLnB5IHwgMyArKysKPiDCoDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KykKPiAKPiBkaWZmIC0tZ2l0IGEvc2NyaXB0cy9saWIvd2ljL3BsdWdpbnMvc291cmNlL2Jvb3Rp
bWctZWZpLnB5IGIvc2NyaXB0cy9saWIvd2ljL3BsdWdpbnMvc291cmNlL2Jvb3RpbWctZWZpLnB5
Cj4gaW5kZXggOTZjNzEwYmY3Ny4uMjBiMWMzNmE0NiAxMDA2NDQKPiAtLS0gYS9zY3JpcHRzL2xp
Yi93aWMvcGx1Z2lucy9zb3VyY2UvYm9vdGltZy1lZmkucHkKPiArKysgYi9zY3JpcHRzL2xpYi93
aWMvcGx1Z2lucy9zb3VyY2UvYm9vdGltZy1lZmkucHkKPiBAQCAtMzQxLDYgKzM0MSw5IEBAIGNs
YXNzIEJvb3RpbWdFRklQbHVnaW4oU291cmNlUGx1Z2luKToKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNwX2NtZCA9ICJjcCAtdiAtcCAlcy8lcyAlcy9FRkkvQk9P
VC8lcyIgJSAoa2VybmVsX2RpciwgbW9kLCBoZGRkaXIsIG1vZFs4Ol0pCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvdXQgPSBleGVjX2NtZChjcF9jbWQsIFRydWUp
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsb2dnZXIuZGVidWco
InN5c3RlbWQtYm9vdCBmaWxlczpcbiVzIiAlIG91dCkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICMgbXVzdCBoYXZlIGluc3RhbGxlZCBhdCBsZWFzdCBvbmUgRUZJIGJvb3Rsb2Fk
ZXIKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG91dCA9IGV4ZWNfY21kKCJscyAl
cy9FRkkvQk9PVC9ib290Ki5lZmkiICUgKGhkZGRpciksIFRydWUpCj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBsb2dnZXIuZGVidWcoIkluc3RhbGxlZCBzeXN0ZW1kLWJvb3QgZmls
ZXM6XG4lcyIgJSBvdXQpCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVsaWYgc291cmNlX3Bh
cmFtc1snbG9hZGVyJ10gPT0gJ3VlZmkta2VybmVsJzoKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBrZXJuZWwgPSBnZXRfYml0YmFrZV92YXIoIktFUk5FTF9JTUFHRVRZUEUiKQo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIG5vdCBrZXJuZWw6CgpMZXRzIGF2
b2lkIHRoZSBleGVjIG92ZXJoZWFkIG9mIHVzaW5nICJscyIgaGVyZSBhbmQgdXNlIGdsb2IuZ2xv
YigpIHRvCmNoZWNrIGZvciB0aGUgZmlsZXMsIHdoaWNoIG1ha2VzIHRoZSBjb2RlIG1vcmUgcmVh
ZGFibGUvbWFpbnRhaW5hYmxlCmludG8gdGhlIGZ1dHVyZS4KClRoYW5rcyEKClJpY2hhcmQK


