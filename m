Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2990C369AB
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 00:20:10 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web10.29057.1745281206529552765
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Apr 2025 17:20:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P8Yt0U+c;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3feb3f54339so3980289b6e.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 17:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745281206; x=1745886006; darn=lists.openembedded.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XlwVLonJV2m8aQbCNyY8/Pg1O0DCOhAqXR3bcmRr8KY=;
        b=P8Yt0U+cZeChldX8ntmVqU/V7ylMY9Rkx3dWpNaxHrP+odpkferNnDxSUhmE2AodUj
         7lifSMGc9rZcJs0KwvSTUFUViAQaLBUEgM/fSNJ39IxyAcIzRHTSMU0JwzddN2MaF9yu
         Y+v64y0/tIpQE2bLGj5S5wPvFPxMdj/msMpHGlUF1CHFt78zKTemSQZuMt68HDBzzHxu
         kP/uCzXniT3BRRf86akdK4XOQlrPbM7UDwQTkYMVJSSRJ2FKWCNa1n0Sy1e+kFVyUsDr
         rr5cyNQooFp+kAy04pH5C1+j+WTOljwIw0Tgu+NCq8B/CYRePlDHUrtBFEZDlxDDn438
         T50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745281206; x=1745886006;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XlwVLonJV2m8aQbCNyY8/Pg1O0DCOhAqXR3bcmRr8KY=;
        b=njqW1e7MzKcvfRSKWoQmIcij+Fm+DAY7TwGHKX24nc8qLoyVrMOTnRjmGznxss7EPR
         G8ODK5dtIitl8lOVXk2iGDcvUB9IP8CYTlFJmlsUamHDOMddkDjRvA8ojQn2HUKScVGu
         VfmzLNeAnG82jkeR5VBZIYoaI1ymINSsC5vXL21HyQmTN2h/YOdyqRBkvFrIP0k9h8fC
         16ETljDTjc5y7bSWgX4s0kqzh8q5nRZHIl7NqXRIrqmz8ugeN8y1QUI/SNgj0l5iuDWR
         Nk+MedWHJj6yCMpxx7F+DxC7wiSek4osE9EWBeVsYS9XmadlFyenQzQb3uyOA8Wd1vzA
         7E7g==
X-Gm-Message-State: AOJu0YyhcU+a5PkzTp5Ha1F6wO2+aJthXN9ZPPi9GhDImYLmG5mVWzl6
	ay6WdpeEhp/isgufnn3Lc73wSwIi9dnuOjSx/uQEPP8D7f1M6GUcAc7pDO5S
X-Gm-Gg: ASbGncvAYheaFbe8w2kAcyiDF8fDVzxAnG3ZsCHj0F7Trz6p3o3OUo6h2NVVEWX0cKG
	W06HvpV4wwYt5KLjHdMs3AucRaNFjWi3/mmAPpQdEGNGfDeZ2BaagLFctTy1vwPG20f9ijduIZR
	Rq1pOmhDRctrYNy4/XSQDoQJCCtj+3z55V3ULwKX7YT1NqajHydk20NonjQa5C8rHTxMCBu/OEl
	ubrAn1vT7fQcxnXLBuXf50qgodgZzM+Tk9gXu4eOrc352LYpR2LSp18OGTZvfG3EuzLOB3wmNSc
	6CT+7UxTiPQ59LpugxFO1w2f89ct7Qsm6oQz6LbqXsWD2wBoe34SjFzkFegh5pslY5O4ii40hUj
	4rh+uVdqZxawhoZTmXykOB9Dlh17n2yKZAw==
X-Google-Smtp-Source: AGHT+IFGPeM3WOVsvIPJugSS7BrnItjYCuNlGfW8DKzfkWOLoGHnvA4WKx3owyYv2bdwEyKoNAtEZQ==
X-Received: by 2002:a05:6808:8713:b0:3fe:aebe:d60d with SMTP id 5614622812f47-401c0ab2040mr7152880b6e.21.1745281205646;
        Mon, 21 Apr 2025 17:20:05 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:ad41:4c38:54f5:31e3? ([2601:646:8201:fd20:ad41:4c38:54f5:31e3])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-401bf09d00dsm1794216b6e.46.2025.04.21.17.20.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 17:20:05 -0700 (PDT)
Message-ID: <c5d578d2-2fbf-4a47-bdee-d72ac623708b@gmail.com>
Date: Mon, 21 Apr 2025 17:20:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 0/3] mesa: small improvements after 25.0
 merge
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250418-mesa-25-fixes-v2-0-e110ccfe291f@oss.qualcomm.com>
 <CAMKF1sr5VLmBKmrr8Q05C7aaZi6OK7JHS9DKEZyKo4eihnusgg@mail.gmail.com>
 <CAO9ioeU8zhRVX_BgB3Pp_psH49gJt+jeE92TcfrZZoaL-HjUiA@mail.gmail.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <CAO9ioeU8zhRVX_BgB3Pp_psH49gJt+jeE92TcfrZZoaL-HjUiA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------G34wJcE8WKjRAFXJ8cHQ6h3f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 00:20:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215188

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------G34wJcE8WKjRAFXJ8cHQ6h3f
Content-Type: multipart/mixed; boundary="------------Gd1bq6KGnHLgwbdLR0LaOlF5";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Message-ID: <c5d578d2-2fbf-4a47-bdee-d72ac623708b@gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/3] mesa: small improvements after 25.0
 merge
References: <20250418-mesa-25-fixes-v2-0-e110ccfe291f@oss.qualcomm.com>
 <CAMKF1sr5VLmBKmrr8Q05C7aaZi6OK7JHS9DKEZyKo4eihnusgg@mail.gmail.com>
 <CAO9ioeU8zhRVX_BgB3Pp_psH49gJt+jeE92TcfrZZoaL-HjUiA@mail.gmail.com>
In-Reply-To: <CAO9ioeU8zhRVX_BgB3Pp_psH49gJt+jeE92TcfrZZoaL-HjUiA@mail.gmail.com>

--------------Gd1bq6KGnHLgwbdLR0LaOlF5
Content-Type: multipart/mixed; boundary="------------XKUApsAkAt77CTRrJUe82xYo"

--------------XKUApsAkAt77CTRrJUe82xYo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC8yMS8yNSAxMjozMiBQTSwgRG1pdHJ5IEJhcnlzaGtvdiB3cm90ZToNCj4gT24gTW9u
LCAyMSBBcHIgMjAyNSBhdCAxODoyMiwgS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4g
d3JvdGU6DQo+Pg0KPj4gSGkgRG1pdHJ5DQo+Pg0KPj4gSSBoYXZlIHBpY2tlZCB0aGVzZSBw
YXRjaCBpbnRvIGNsYW5nLW1lcmdlLTIgYnJhbmNoLg0KPj4NCj4+IGh0dHBzOi8vd2ViLmdp
dC55b2N0b3Byb2plY3Qub3JnL3Bva3ktY29udHJpYi9sb2cvP2g9a3Jhai9jbGFuZy1tZXJn
ZS0yDQo+Pg0KPj4gVGhleSBoZWxwIHdpdGggc29tZSBtZXNhLW5hdGl2ZSBidWlsZCBmYWls
dXJlcyBob3dldmVyLCBJIGFtIHN0aWxsDQo+PiBzZWVpbmcgYSBidWlsZCBmYWlsdXJlIGJ1
aWxkIG1lc2EtbmF0aXZlDQo+PiBvbiBtdXNsIHRhcmdldHMuIEkgYW0gbm90IHN1cmUgd2h5
IHRhcmdldCBzaG91bGQgbWF0dGVyIGJ1dCBpdCBzZWVtcw0KPj4gdG8gc2VlIHRoZSBlcnJv
cg0KPiANCj4gTm90ZSwgdGhlIGVycm9yIGlzIGFib3V0ICdyZXF1aXJlZCBmaWxlJywgaXQg
dXN1YWxseSBtZWFucyB0aGF0IHRoZQ0KPiBkeW5hbWljIGxvYWRlciBpcyBub3QgZm91bmQu
DQo+IEknbGwgdHJ5IHJlcHJvZHVjaW5nIGl0IGxvY2FsbHkuDQo+IA0KPj4NCj4+IGh0dHBz
Oi8vYXV0b2J1aWxkZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS8jL2J1aWxkZXJzLzEx
MS9idWlsZHMvMTUwDQo+Pg0KPj4gRXJyb3IgaXMgdGhhdCBtZXNhX2NsYyBpcyBub3QgYXZh
aWxhYmxlIGJlZm9yZSBpdHMgdXNlLiBJbnRlcmVzdGluZ2x5LA0KPj4gaXQgbmV2ZXIgZmFp
bHMgbG9jYWxseSBoZXJlIGJ1dCBpdCBhbHdheXMgZmFpbHMgb24gQUIuIElzIHRoZXJlIHNv
bWUNCj4+IHNvcnQgb2YgYnVpbGQgcmFjZSBvciBzb21ldGhpbmcgZWxzZSBnb2luZyBvbj8N
Cj4gDQo+IEFuZCB0aGlzIGlzIHVzdWFsbHkgYmVjYXVzZSB0aGVyZSB3YXMgYSB1bmluYXRp
dmUtZW5hYmxlZCBidWlsZCBpbg0KPiBzc3RhdGUgY2FjaGUgd2hpY2ggaXMgbm93IGJlaW5n
IHJldXNlZCBmb3IgdGhlIG5vbi11bmluYXRpdmUuDQo+IExldCdzIHNlZSBpZiBJIGNhbiBy
ZXByb2R1Y2UgaXQuLi4NCg0KSXRzIGluIHJpZ2h0IGRpcmVjdGlvbiwgSSBjb3VsZCBnZXQg
dGhlIGluZm9ybWF0aW9uIGZyb20gdGhlIHdvcmtlciBtYWNoaW5lDQoNCmJ1aWxkLXJlbmFt
ZWQvdG1wL3dvcmsveDg2XzY0LWxpbnV4L21lc2EtbmF0aXZlLzI1LjAuMiQgDQouL2J1aWxk
L3NyYy9jb21waWxlci9jbGMvbWVzYV9jbGMNCi1iYXNoOiAuL2J1aWxkL3NyYy9jb21waWxl
ci9jbGMvbWVzYV9jbGM6IGNhbm5vdCBleGVjdXRlOiByZXF1aXJlZCBmaWxlIA0Kbm90IGZv
dW5kDQoNCmlmIGR1bXAgdGhlIEVMRiBoZWFkZXJzIGl0IGxvb2tzIGZvciBpbnRlcnByZXRl
ciBmcm9tIGEgdW5pbmF0aXZlIHBhdGgNCndoaWNoIGlzIGFic29sdXRlIGFuZCBwb2ludHMg
dG8gdGhlIGxvY2F0aW9uIHdoZXJlIGl0IHdhcyBidWlsdCBpbiANCmFub3RoZXIgYnVpbGQN
Cg0KICAgICAgIFtSZXF1ZXN0aW5nIHByb2dyYW0gaW50ZXJwcmV0ZXI6IA0KL3Nydi9wb2t5
YnVpbGQveW9jdG8td29ya2VyL21ldGEtb2UvYnVpbGQvYnVpbGQvdG1wL3N5c3Jvb3RzLXVu
aW5hdGl2ZS94ODZfNjQtbGludXgvbGliL2xkLWxpbnV4LXg4Ni02NC5zby4yXQ0KDQpUaGlz
IGZpbGUgZG9lcyBub3QgZXhpc3QgaW4gY3VycmVudCBidWlsZC4NCg0KDQo+IA0KPj4gV291
bGQgYXBwcmVjaWF0ZSBoZWxwLg0KPj4NCj4+IE9uIFRodSwgQXByIDE3LCAyMDI1IGF0IDU6
NTfigK9QTSBEbWl0cnkgQmFyeXNoa292IHZpYQ0KPj4gbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KPj4gPGRtaXRyeS5iYXJ5c2hrb3Y9b3NzLnF1YWxjb21tLmNvbUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnPiB3cm90ZToNCj4+Pg0KPj4+IFNldmVyYWwgYnVnZml4ZXMgYWZ0ZXIgTWVz
YSAyNS4wIHJlY2lwZSB3YXMgbWVyZ2VkOg0KPj4+IC0gUmVwbGFjZSB0aGUgYmluZGdlbiBw
YXRjaGVzIHdpdGggbWVzb24tYmFzZWQgZml4IChEeWxhbiBCYWtlcikNCj4+PiAtIEJ1bmRs
ZSBPcGVuQ0wgQyBoZWFkZXJzDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgQmFy
eXNoa292IDxkbWl0cnkuYmFyeXNoa292QG9zcy5xdWFsY29tbS5jb20+DQo+Pj4gLS0tDQo+
Pj4gQ2hhbmdlcyBpbiB2MjoNCj4+PiAtIERyb3BwZWQgYXBwbGllZCBwYXRjaGVzDQo+Pj4g
LSBBZGQgdGhlIGJ1bmRsZS1vcGVuY2wtaGVhZGVycyBwYXRjaA0KPj4+IC0gTGluayB0byB2
MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1MDQxMi1tZXNhLTI1LWZpeGVzLXYx
LTAtNzkxODQwMzkxMjcxQG9zcy5xdWFsY29tbS5jb20NCj4+Pg0KPj4+IC0tLQ0KPj4+IERt
aXRyeSBCYXJ5c2hrb3YgKDMpOg0KPj4+ICAgICAgICBtZXNvbjogcGFzcyAtdGFyZ2V0IGFu
ZCAtSSB0byBiaW5kZ2VuIGNhbGxzDQo+Pj4gICAgICAgIG1lc2E6IGRyb3AgdGhlIGJpbmRn
ZW4gcGF0Y2gNCj4+PiAgICAgICAgbWVzYTogYnVuZGxlIENsYW5nIE9wZW5DTCBoZWFkZXJz
IGludG8gbWV0YS1jbGMNCj4+Pg0KPj4+ICAgbWV0YS9jbGFzc2VzLXJlY2lwZS9tZXNvbi5i
YmNsYXNzICAgICAgICAgICAgICAgICAgfCAgMSArDQo+Pj4gICAuLi5kLWFuLW9wdGlvbi10
by1mb3JjZS1pbmNsdXNpb24tb2YtT3BlbkNMLS5wYXRjaCB8IDU3ICsrKysrKysrKysrKysr
KysrKw0KPj4+ICAgLi4udmlkZS1jcm9zcy1jb21waWxhdGlvbi1hcmd1bWVudHMtdG8tTExW
TS0ucGF0Y2ggfCA2NyAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+Pj4gICBtZXRhL3JlY2lw
ZXMtZ3JhcGhpY3MvbWVzYS9tZXNhLmluYyAgICAgICAgICAgICAgICB8ICA5ICstLQ0KPj4+
ICAgNCBmaWxlcyBjaGFuZ2VkLCA2MSBpbnNlcnRpb25zKCspLCA3MyBkZWxldGlvbnMoLSkN
Cj4+PiAtLS0NCj4+PiBiYXNlLWNvbW1pdDogNTNjNzcyYzk0MWQ1Y2U2OWFiODlmMzVjZDA0
NzI0Yjc0MGRhZjI2OQ0KPj4+IGNoYW5nZS1pZDogMjAyNTA0MTEtbWVzYS0yNS1maXhlcy01
YTM4ZmU1NWRkM2MNCj4+Pg0KPj4+IEJlc3QgcmVnYXJkcywNCj4+PiAtLQ0KPj4+IERtaXRy
eSBCYXJ5c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZAb3NzLnF1YWxjb21tLmNvbT4NCj4+Pg0K
Pj4+DQo+Pj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4+PiBMaW5rczogWW91IHJlY2Vp
dmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4+PiBWaWV3L1JlcGx5IE9u
bGluZSAoIzIxNTExNSk6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5l
bWJlZGRlZC1jb3JlL21lc3NhZ2UvMjE1MTE1DQo+Pj4gTXV0ZSBUaGlzIFRvcGljOiBodHRw
czovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTEyMzI0NTQ0LzE5OTc5MTQNCj4+PiBH
cm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KPj4+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcv
Zy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YiBbcmFqLmtoZW1AZ21haWwuY29tXQ0KPj4+IC09
LT0tPS09LT0tPS09LT0tPS09LT0tDQo+Pj4NCj4gDQo+IA0KPiANCg==
--------------XKUApsAkAt77CTRrJUe82xYo
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------XKUApsAkAt77CTRrJUe82xYo--

--------------Gd1bq6KGnHLgwbdLR0LaOlF5--

--------------G34wJcE8WKjRAFXJ8cHQ6h3f
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCaAbgtAUDAAAAAAAKCRC7BTNVkZ0zFKd5
AJ4lHoYZ3dPBstM2gc4BOELXZEY05gCfbdScjf/yfopKqldnSG1EvfXQYyo=
=3uS+
-----END PGP SIGNATURE-----

--------------G34wJcE8WKjRAFXJ8cHQ6h3f--

