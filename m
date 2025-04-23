Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0882C369C2
	for <webhook@archiver.kernel.org>; Wed, 23 Apr 2025 00:31:06 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.1852.1745368262103595687
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 17:31:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TEFE7MIH;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3feaedb4d2cso3368910b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 17:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745368261; x=1745973061; darn=lists.openembedded.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hT4zoN0KIH9J6DDDeyF6CsWMxX7QGFfMTzLT0p81QNQ=;
        b=TEFE7MIHf75aMb0fHkKier/Gvc80aAh/qN9p6Z8SZq7t7P2mnS7QvE2g37zSO2aV98
         XhNTMYwUlWwAh52qUdLlorW7fOTJAxbgm6ganlB+1eoqIgpWclfB25d7xSl17p1jX6JV
         tcAQ1ITiwMjhy8wW/d1giDggH0V6zlZPQcYnF3gfPFwxfC3GluUqQswBSVRXqYmi9aWY
         NthQ5OgJs8Ttn0K0tgzTnJId17J0dqByYUNlUZovKPI6jO2BP2umZ1HrsZjni3hSqQwm
         nX/G8RDTWRlBZFa5NPZm1/4WbLhW16/FU3EX7l0OOykj1D2CQ1iuBZk/rlVjsR+w2hid
         qoDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745368261; x=1745973061;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hT4zoN0KIH9J6DDDeyF6CsWMxX7QGFfMTzLT0p81QNQ=;
        b=uMc0/452SRrQm/60YH1fge8gsuWn718NJaV5N+v4niJpF1sWaHosQmdaedD3prbmC/
         F04Ojewh4RnSW8hp9o5dYOcyiXMRwWzdtcQwYWaR0/DJzA8XSGeW5ZFAzDcyg+V4JiLC
         Y5/VhwBrFSZfAaV0xdRHaMXl+rg+79BxuRO0RKL50lbJiCwTkyHD0emAb8BhU8OwLUXB
         BEkKCBv/IZaEeL6hSam2mBYtkOYACjrXu9Q7o2qIQBnPxZ7hVTsUklFs++eOKLUpnf63
         IUmeNPeG0ozHwX51Rg/yVTvrUdtoSmDNVMmLZwFLhdZ5QxbAoXtHdkMOaAlKNhc86ar2
         KAGA==
X-Forwarded-Encrypted: i=1; AJvYcCULw64sBvL9WH4eJPUBRFAZXgKB5pWo1cjeo8ROXZQ/IZBxqwyV8biVgLWjvtlteMa3qIi34aF0LsyaVeAWMLRxkw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz+7BP/aHvZ/f2C3Psr6WyEzsIEGByZcblw1kJByeylhCGsdj+w
	VXOGlLJN7VcRdVtHingAfO6btlUeLhGxUhSl7U/a++zYXYfZoFkX
X-Gm-Gg: ASbGncvXaNUoNNHusPQAIQ0i8ie0us9LYQEV/A5zNEGHiwPBvn+dKX1mz+GoJhI1/m3
	1pDAC0pC5FWYWboxwOMvH4UOJ0NaJ/Dxj4WZbnHRkvLVMAxplW8fB3FCudHfeo0FrTEtEmw4Etr
	CukYLrZy0kWfRT3Q6xqgBUvLJIyZqdN77tN5bOHGFnFBhexhgWpzAUbUDX7MKI88N8QMvdyLlKQ
	2VAVRKIEWcCOcLrm2x3DusOBTyRlzjqxaB1CgqE421MrOjDARfWN8sVihgK/xTn9qZS3VwySJd1
	cylcbH+sAiyGqIwqCW4n5rRa4VEqsp11deU/RfB8WI/+e8MgSn9Cc9x2BPV2nCAgMAt24TLP/8W
	RLRoGbY32Wqkub8kOx7nyoz6E759Qkbm5aQ==
X-Google-Smtp-Source: AGHT+IH8SGziw5gbVnoANuGClUf3eEoQOEEN+vrt0F+heK/IVYwIMt3+2FSFwfaWK0SjKsaWoj35tw==
X-Received: by 2002:a05:6808:6f8c:b0:3f6:a476:f7ea with SMTP id 5614622812f47-401c0c5125bmr11725592b6e.32.1745368261237;
        Tue, 22 Apr 2025 17:31:01 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:f90a:1834:bcca:2d8b? ([2601:646:8201:fd20:f90a:1834:bcca:2d8b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-401beee7540sm2343488b6e.19.2025.04.22.17.31.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 17:31:00 -0700 (PDT)
Message-ID: <71fc1751-abb8-4061-80f4-c0095961fcd7@gmail.com>
Date: Tue, 22 Apr 2025 17:30:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] gzip: upgrade 1.13 -> 1.14
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: richard.purdie@linuxfoundation.org, leimaohui@fujitsu.com,
 Denys Dmytriyenko <denis@denix.org>, openembedded-core@lists.openembedded.org
References: <20250417102130.800-1-leimaohui@fujitsu.com>
 <CANNYZj919ZzBoW6iDURx=aH2DRFyB0Yhy0V8TLwBv_5xH64cTg@mail.gmail.com>
 <41b65472c37b399e2d4c770819bf7868cd145665.camel@linuxfoundation.org>
 <8f5a866f-e11d-4619-b159-8d3db541af52@gmail.com>
 <CANNYZj8yBO2o9BgTkzYCECVgX89-0C6tJthfvWhxoKA3SSAMiA@mail.gmail.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <CANNYZj8yBO2o9BgTkzYCECVgX89-0C6tJthfvWhxoKA3SSAMiA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kAS6mDTIt0rSqW1ayQo0Qgdu"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Apr 2025 00:31:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215253

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------kAS6mDTIt0rSqW1ayQo0Qgdu
Content-Type: multipart/mixed; boundary="------------wVxpf2X6YTt541owxykB8WOR";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: richard.purdie@linuxfoundation.org, leimaohui@fujitsu.com,
 Denys Dmytriyenko <denis@denix.org>, openembedded-core@lists.openembedded.org
Message-ID: <71fc1751-abb8-4061-80f4-c0095961fcd7@gmail.com>
Subject: Re: [OE-core] [PATCH] gzip: upgrade 1.13 -> 1.14
References: <20250417102130.800-1-leimaohui@fujitsu.com>
 <CANNYZj919ZzBoW6iDURx=aH2DRFyB0Yhy0V8TLwBv_5xH64cTg@mail.gmail.com>
 <41b65472c37b399e2d4c770819bf7868cd145665.camel@linuxfoundation.org>
 <8f5a866f-e11d-4619-b159-8d3db541af52@gmail.com>
 <CANNYZj8yBO2o9BgTkzYCECVgX89-0C6tJthfvWhxoKA3SSAMiA@mail.gmail.com>
In-Reply-To: <CANNYZj8yBO2o9BgTkzYCECVgX89-0C6tJthfvWhxoKA3SSAMiA@mail.gmail.com>

--------------wVxpf2X6YTt541owxykB8WOR
Content-Type: multipart/mixed; boundary="------------8qhHR58OB5vlRTkbk0TEllJd"

--------------8qhHR58OB5vlRTkbk0TEllJd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC8yMi8yNSA0OjQwIFBNLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90ZToNCj4gT24gV2Vk
LCAyMyBBcHIgMjAyNSBhdCAwMDo1MSwgS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4g
d3JvdGU6DQo+PiBDb25zaWRlciBvdGhlciBzaWRlIG9mIHRoaXMgYXMgd2VsbC4NCj4+IE1h
bnkgZW1iZWRkZWQgc3lzdGVtcyBkbyB1c2UgYnVzeWJveCBoZWF2aWx5LCBpbXBvc2luZyBk
ZXBlbmRlbmNpZXMgZm9yDQo+PiB0ZXN0cyBsaWtlIHRoaXMgd291bGQgbWVhbiBwdGVzdHMg
YXJlIGxlc3MgcmVsZXZhbnQgZm9yIHN1Y2ggdXNlY2FzZXMNCj4+IHNpbmNlIGJyaW5naW5n
IGNvcmV1dGlscyBtaWdodCBhbHNvIHNodW50IG90aGVyIGJ1c3lib3ggdXRpbGl0aWVzIGFs
b25nDQo+PiB0aGUgd2F5Lg0KPj4NCj4+IEkgd291bGQgYXNrIHRoaXMgcGF0Y2ggdG8gYmUg
cHJvcG9zZWQgdG8gZ3ppcCB1cHN0cmVhbSBmaXJzdCB0aG91Z2guDQo+IA0KPiBOZWFybHkg
YWxsIHVwc3RyZWFtcyBydW4gdGhlc2UgdGVzdHMgd2l0aCBhIEdOVSB1c2Vyc3BhY2UgZW52
aXJvbm1lbnQNCj4gb24gc29tZSBjbGFzc2ljIGJpbmFyeSBkaXN0cm8uIEl0J3Mgbm90IHRo
YXQgd2UgaW1wb3NlIEdOVSBvbiBwdGVzdHMsDQo+IGl0J3MgdGhhdCB3ZSBkb24ndCB3YW50
IHRvIGRldmlhdGUgZnJvbSB1cHN0cmVhbSBleHBlY3RhdGlvbnMsIGFzDQo+IGRvaW5nIHRo
YXQgb25seSByZXN1bHRzIGluIHVwc3RyZWFtIHVua25vd2luZ2x5IGludHJvZHVjaW5nDQo+
IHJlZ3Jlc3Npb25zIGFuZCB1cyBmaXhpbmcgdGhlbSBhZnRlciB0aGUgZmFjdCwgd2l0aCBu
byBndWFyYW50ZWUgdGhhdA0KPiB1cHN0cmVhbXMgd2lsbCB0YWtlIHRoZSBmaXhlcy4gVmVy
c2lvbiB1cGRhdGVzIGFyZSBoYXJkIGVub3VnaCBhcyBpdA0KPiBpcy4NCg0KVGhhdCBpcyBm
aW5lLCBhbmQgSSBjYW4gZW1wYXRoaXplLiBPRXMgdXNlY2FzZXMgYXJlIHVubGlrZSBjbGFz
c2ljIA0KYmluYXJ5IGRpc3Ryb3MsIG90aGVyd2lzZSB0aGF0cyB3aGF0IHVzZXJzIHdvdWxk
IHVzZS4gV2UgbmVlZCB0byBiZSANCm1pbmRmdWwgb2YgZW5kIHVzZXJzIHRvby4gQSBiaXQg
b2YgZXh0cmEgcG9ydGFiaWxpdHkgaGVscHMgdXMsIGlmIHdlIGNhbiANCmdldCB1cHN0cmVh
bXMgdG8gc3VwcG9ydCB0aGF0IHRoZW4gaXQgaGVscHMgb3VyIHVzZWNhc2UuDQoNCj4gDQo+
IEkgY2FuIGtpbmRhIHNlZSB0aGUgcG9pbnQgaW4gZml4aW5nIHB0ZXN0cyB0byB3b3JrIHdp
dGggbXVzbCwgYnV0DQo+IGZpeGluZyB0aGVtIHRvIHdvcmsgd2l0aCBidXN5Ym94IGlzIGEg
c3RlcCB0b28gZmFyLiBUaGVyZSdzIGEgbG90IG9mDQo+IHB0ZXN0cyB0aGF0IGFscmVhZHkg
cHVsbCBpbiB2YXJpb3VzIEdOVSBwaWVjZXMsIHNvIGFkZGluZyBnemlwIHRvIHRoYXQNCj4g
c2V0IHdpbGwgbm90IG1ha2UgaXQgYW55IHdvcnNlLg0KPiANCj4gQWxleA0K
--------------8qhHR58OB5vlRTkbk0TEllJd
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------8qhHR58OB5vlRTkbk0TEllJd--

--------------wVxpf2X6YTt541owxykB8WOR--

--------------kAS6mDTIt0rSqW1ayQo0Qgdu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCaAg0wwUDAAAAAAAKCRC7BTNVkZ0zFDYC
AKCGJQFaB442s4NzUc2T7zTgR31HAACeKadGg5wNU9+A3DWlhpvO4Jltc1g=
=awte
-----END PGP SIGNATURE-----

--------------kAS6mDTIt0rSqW1ayQo0Qgdu--

