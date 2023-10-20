Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2754FC001DF
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 16:34:50 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.59036.1697819684420670056
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 09:34:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SFcYEeyp;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5aa481d53e5so688586a12.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 09:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697819684; x=1698424484; darn=lists.openembedded.org;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lf/wtCb9HUdD54jXtcNcw+h4ZaPI1bQchokNF81FfIw=;
        b=SFcYEeyp0gMf7NBNO2DTcrWadC0iWA5TtTO+GlhyCEFzsF2ytIOAK0c39277+KFXRc
         lKfgEMeVLqxBMcjiIIioTjTMc6Dj/srItuA4/fAyC28Si6F9dYFulr3jcX9ZAuTnOHWu
         0f0mL0+joqZXgwcbz4etO48h+Vm/uqOrRkR/xWx7Wxr+erDaxLHOzcAzQygzYdffmDOB
         5CJKchald5fjXCksYupOvYDUhznXtzXcpjpbgS7H/4U4NdnRjDau1eAI+9tAGxcFq+ai
         jvxNNZk8hN1GjvnyLPRQa4r8MgegKhJ0ThL5QGrqVa/186+OwGMB94LjHgHCqp3gMFKJ
         SEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697819684; x=1698424484;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lf/wtCb9HUdD54jXtcNcw+h4ZaPI1bQchokNF81FfIw=;
        b=ZZ+oOnvBPB9OrrfppnOJVmqlxHQuHawKguHRp9R2RkYJy6oRiD1tQw+z3gIHgp7E+p
         BT4RINmGMI3X0eTAM/kj5JYvrbSwzHJvKhRaQgJPnv61ZNSpjsriy14kuhUsQlUoi0V1
         Dp4L7+bKQgjQ8ybGo3g9+alNSlrMDJgMJImN6rxxOkrKFibMrQCcZzBDKAmpih960+M1
         RJU5icTKalzMqKSxSI6pclo1HmC9StXbMsu7GdXNd/3RR1HfeeXfJiEnah1JyRLAAelg
         uwGox3zl8TDRb33CTyVqVt0Zxbf7M1N23RQQ3KfyJuhLLg71M+ktd6RBy0bU53H6tL71
         UavA==
X-Gm-Message-State: AOJu0YwLiEz5CqgwgWF5H4uPOuBkxBaqnlW9e4kMbFLXBKjjhxOm6RlJ
	31/9BujlgdEIpJb0We1Z238=
X-Google-Smtp-Source: AGHT+IHtZ+kxGn5G2CHUegahJvsglOZ/1mQCU0RatYNY29km43yUrJ/Y7ogr4JL1hp1Op9wF1ZXQ1g==
X-Received: by 2002:a05:6a20:3d03:b0:166:6582:a7d5 with SMTP id y3-20020a056a203d0300b001666582a7d5mr2463208pzi.3.1697819683689;
        Fri, 20 Oct 2023 09:34:43 -0700 (PDT)
Received: from ?IPV6:2601:646:9100:2cb0:f423:bfba:96f6:f9d8? ([2601:646:9100:2cb0:f423:bfba:96f6:f9d8])
        by smtp.gmail.com with ESMTPSA id d15-20020a65620f000000b0057e7ae47893sm1462370pgv.47.2023.10.20.09.34.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Oct 2023 09:34:43 -0700 (PDT)
Message-ID: <6190e445-52d0-441c-b105-809429c23f3a@gmail.com>
Date: Fri, 20 Oct 2023 09:34:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 4/4] package_rpm.bbclass: Support compression
 override
To: niko.mauno@vaisala.com,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20231020124450.9736-1-niko.mauno@vaisala.com>
 <20231020124450.9736-4-niko.mauno@vaisala.com>
 <d53085e46d3b3af2071bc3c1b4cfdb0f6517b1a5.camel@linuxfoundation.org>
 <d96313a1-5ed6-4ea5-977f-84c21ba0c37f@vaisala.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 xsDiBEqXaJERBACUvFofpD3FsxD9675wcPv+rzguIfsRWilrrpSZ61JHjLHwkUnmDLpLSdfv
 Zw2ZDXeaQbGU2thctxXTyYf6N1fY6P5Tww6mWKInuGU3yAv8Mg5p+Xd8itwOoVR41DOBkftV
 miO2G7FtXsnqonB6F43a2yvc+h9OwPRVxAFss5mSmwCglSXPWndN1Ka4M/hzt7g+FmeyEssD
 /1V/G8lLeAS9gQCNjS7jch+uHMFJuWgHzMXdw99e1ywlIkvXN77NPkW+FLVxKxNAHyWZZ3wO
 4BQ9/GVR2y0s/rrF1lQSIcfnUmzZrh/Bh0b1wVOSLhl0Vx4MI0/MbdL3xx17JAWy+s67evuK
 ER4Y8ycTq3gbIGJtVrIJjWPCzWF8BACAA2u52uDmJ2pS8SIhEW0jMK/zYQ5Od9l9fM6BmS6Q
 jnIlzzcuMvRdZn2IrnuE/YoC8yyzBK3mN+MVc2jWN9rfSg6ml7r14Zjem9Ee0O5Ca7Jg3ZvN
 6g3vSlrRJqKgsnq3vdatDF+5rd0NJ7ZKUy6x2i1Pavgtv3qaAgPGa1qQdM0dS2hlbSBSYWog
 PHJhai5raGVtQGdtYWlsLmNvbT7CYAQTEQoAIAIbAwYLCQgHAwIEFQIIAwQWAgMBAh4BAheA
 BQJTBC0aAAoJELsFM1WRnTMUul4An282FaN7oYXM2A8JzQt1ZWeUTlJZAJ0eOgup2Eqxx6gZ
 FOQE7EkRmOb6iM7DTQRKl2iREBAAjjbVQ55RAouAe0l0nPsKkWdtMuUHwBdLBkpF3rGM/f0u
 DlPaQzYGLjKT7xDoyRh8x2tFwWvOfiqrZFArxX8e4fsACmJdL0kahTbxC/8SmSWVHXi10JUX
 2fmZ5ufzlXAnl0ivXkWnrUfLX9DdNwL6DR4DeFK9qBFqtHmK5TQXMu87G+MJwgNJIwCKQX4i
 I9YJILMuqInVwaxg5/ALdKfE3QPmtadnKb/cuUm4gICdaJeyQfI6qdYLcSuyBWCbAEMM1wmh
 RAhw5RgzMRRIquZlxPt7lZkXXjals7M6juh87VGRoIJwYoQi97Q1ZHzPBo3AlMPe3haNihkd
 6D3lwvdB4pmjYG4I6bHCgtEhEss3hHvsBaqV9jV1dMUSs95ZxQtT9qtkOxydHgOlwRX3CG+r
 584J/s4vWm+iPQtLvDY1u4UFwOLjCOFe709BcLJdPR2GQiOPoyZF7lVY8nu/dtTrAEuiZFk4
 HD7afUlcr/IKwPWID1V9kRLoDlzdbNuoUy/XfVErK8wcoiGowerEMed4ajNoKxCxBweIkjxq
 KMt8CKgp30n9UxljglEcgf+/UumwSHxqZcCPVbWXtdhy/hwMk27shOdUvaiynep8OsVGqAzS
 seL4qZIJ5XzCcyV4KJCmwmdQzt5+ZylcVmeq6R4ob+d8JIDU0ELqdwxwIDiTj0cAAwUP/inN
 3/r8IFDms4g5xafPrCw31o2jIYahkIfN0WVPWI5K/hFCo2PczPStzDcTsZx7mN2qwpGOe3Lz
 9/0krZeksrz1ZIHNi5LTasuzXyFJbO05Y+eiHgV1rV7VVEipOrpV1496w112Y/0SZ/FhOfEm
 EA1TeDejy2sZiTOUW4gyzewbHMpE07d27F2qM2NfMMhKQCcvzr+N0VJmAOeATEivxPUHn+Dp
 X/NniBWOcWv++wHlxv0Xr63gsRKSt62eFKGjgF50hHD5lM31ziqycc42sbgcqAZ+rYFlb9k0
 3JcKyq1XdVUSm+xcC2DMSstTI6iqFMGo6FnEO+gyE5VdceajbuZ1GOmJXJUCyYIdGuvCyIoK
 jTE9lcIYSEEDZQej5xdiGk9eUz0MPmZEUwSR/nLmmwjHDJi0prVvs9xqe5bvS3ddPAqepvZ5
 UrisgtWD+TDI8ktkt5VLh3XsG9FuXUVAaahOvFMGiZtsioDXTorL4AfMeuA9f+yLwrCVQO3x
 mH/WA0Tgf/5gYB3t9KoHPjLBNruVOuQbAjubi0pvRAOUcMdBfmPofksK4uWS1zGtPWS7Uu1c
 suq7Hnb7vszlFYdbzeqjY81LSyxA0kcpgJxdLv9o7UuCEnHDZLPbHdQ83PmyyBKSI31AKe7R
 XlQNlB5grwH9o6uNtPbV7q/uRqmKq5EiwkkEGBECAAkFAkqXaJECGwwACgkQuwUzVZGdMxR1
 VACcCkdaO3rb8/gRprldmAH6eR49eo4AnjD3h3aTwv/1bl+BAz1twmZmz8ul
In-Reply-To: <d96313a1-5ed6-4ea5-977f-84c21ba0c37f@vaisala.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qFeJPaQa9F36tXDgPD9p5Bh9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 16:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189573

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------qFeJPaQa9F36tXDgPD9p5Bh9
Content-Type: multipart/mixed; boundary="------------sSkoNOKKs80L3gx2TMinvt7M";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: niko.mauno@vaisala.com,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Message-ID: <6190e445-52d0-441c-b105-809429c23f3a@gmail.com>
Subject: Re: [OE-core] [PATCH 4/4] package_rpm.bbclass: Support compression
 override
References: <20231020124450.9736-1-niko.mauno@vaisala.com>
 <20231020124450.9736-4-niko.mauno@vaisala.com>
 <d53085e46d3b3af2071bc3c1b4cfdb0f6517b1a5.camel@linuxfoundation.org>
 <d96313a1-5ed6-4ea5-977f-84c21ba0c37f@vaisala.com>
In-Reply-To: <d96313a1-5ed6-4ea5-977f-84c21ba0c37f@vaisala.com>

--------------sSkoNOKKs80L3gx2TMinvt7M
Content-Type: multipart/mixed; boundary="------------7AWYng2dgY0JSZATZd0Pb0d2"

--------------7AWYng2dgY0JSZATZd0Pb0d2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAvMjAvMjMgNjo0MiBBTSwgTmlrbyBNYXVubyB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyB3cm90ZToNCj4gDQo+IA0KPiBPbiAyMC4xMC4yMDIzIDE2LjAwLCBSaWNoYXJkIFB1
cmRpZSB3cm90ZToNCj4+IElzIGl0IGNvbW1vbiBmb3IgcGVvcGxlIHRvIG5lZWQgdG8gbWFu
aXB1bGF0ZSBycG1zIG9uIHRhcmdldCB3aXRob3V0DQo+PiBycG0gYmVpbmcgcHJlc2VudCB1
c2luZyBidXN5Ym94PyBEbyB5b3Uga25vdyBpZiBidXN5Ym94IHBsYW5zIHRvIGFkZA0KPj4g
enN0ZCBzdXBwb3J0Pw0KPj4NCj4+IEFzIGZhciBhcyBJIGNvdWxkIHRlbGwgd2hlbiB3ZSBs
b29rZWQgYXQgdGhpcywgdGhlIHJwbSB3b3JsZCB3YXMgbW92aW5nDQo+PiBvdmVyIHRvIHpz
dGQgc28gYWRkaW5nIGluIGNvbmRpdGlvbmFsIHh6IHN1cHBvcnQgZm9yIGEgbGltaXRlZCB1
c2UgY2FzZQ0KPj4gcHJvYmFibHkganVzdCBjcmVhdGVzIGEgbWFpbnRlbmFuY2UgaGVhZGFj
aGUgZ29pbmcgZm9yd2FyZCBhcyBpdCBpc24ndA0KPj4gc29tZXRoaW5nIHdlIHRlc3Qgb3Ig
cGxhbiB0byB0ZXN0Pw0KPj4NCj4+IEFyZSB5b3UgdXNpbmcgdGhpcyBvbiBhbiBMVFMgcmVs
ZWFzZSBvciBtYXN0ZXI/DQo+IA0KPiBIaSBSaWNoYXJkLA0KPiANCj4gQWZ0ZXIgbW92aW5n
IHRvIFlvY3RvIEtpcmtzdG9uZSAoTFRTKSB3aGljaCB3ZSBjdXJyZW50bHkgdXNlLCB3ZSBz
dGFydGVkDQo+IGdldHRpbmcgZGV2ZWxvcGVyIHJlcG9ydHMgb2YgJ25vIGd6aXAvYnppcDIv
eHogbWFnaWMnIGVycm9yIGZyb20gQnVzeUJveA0KPiBhcHBsZXQuIEZvciBleGFtcGxlIGRl
dmVsb3BlciB1cGxvYWRzIGFuIHJwbSBmaWxlIHRvIHRhcmdldCBkZXZpY2UgYW5kDQo+IHRo
ZW4gdW5wYWNrcyBpdCBpbiBydW50aW1lIHVzaW5nICdycG0yY3BpbyA8c29tZXBrZy5ycG0+
IHwgY3BpbyAtaWRtdicNCj4gY29tbWFuZC4NCj4gDQo+IFdlIGRvbid0IGluY2x1ZGUgcnBt
IHBhY2thZ2Ugb24gdGFyZ2V0IGZpbGVzeXN0ZW1zIGFzIHRoYXQgd291bGQNCj4gaW5jcmVh
c2Ugcm9vdGZzIGZvb3RwcmludCBhcHByb3hpbWF0ZWx5IDUgTUIuIEluY2x1ZGluZyBvbmx5
IHJwbTJjcGlvDQo+IGZyb20gcnBtIHBhY2thZ2UgbmVlZHMgc3RpbGwgYWNjb21wYW55aW5n
IGxpYnJhcmllcywgaW5jcmVhc2luZyB0aGUgc2l6ZQ0KPiBieSAyLjUgTUIgYXBwcm94aW1h
dGVseSB3aGljaCBhbHNvIGZlZWxzIHRvbyBiaWcuDQo+IA0KDQppdCBzZWVtcyB5b3UgYXJl
IHF1aXRlIHNlbnNpdGl2ZSB0byBzaXplLCBJIHdvbmRlciBpZiBvcGtnIGJhY2tlbmQgaXMg
DQpiZXR0ZXIgc3VpdGVkIGZvciB5b3VyIHVzZWNhc2UgdGhhbiBycG0uDQoNCj4gSSBjaGVj
a2VkIHRoZSBkaXNjdXNzaW9ucyBmcm9tIEJ1c3lCb3ggbWFpbGluZyBsaXN0IGFuZCBmb3Vu
ZCB0aGF0IGluDQo+IDIwMjEgdGhlIG1haW50YWluZXIgc2VlbWVkIHJlbHVjdGFudCB0byBh
Y2NlcHQgdGhlIHByb3Bvc2VkIHpzdGQgc3VwcG9ydA0KPiBiZWNhdXNlIGl0IHdhcyBub3Qg
b3B0aW1pemVkIGZvciBlbWJlZGRlZCBzeXN0ZW1zLg0KPiBodHRwOi8vbGlzdHMuYnVzeWJv
eC5uZXQvcGlwZXJtYWlsL2J1c3lib3gvMjAyMS1TZXB0ZW1iZXIvMDg5MTc5Lmh0bWwNCj4g
DQo+IEJSLCBOaWtvDQo+IA0KPiANCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlu
a3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZp
ZXcvUmVwbHkgT25saW5lICgjMTg5NTMyKTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQu
b3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8xODk1MzINCj4gTXV0ZSBUaGlzIFRv
cGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTAyMDgwMTE0LzE5OTc5
MTQNCj4gR3JvdXAgT3duZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcNCj4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vuc3ViIFtyYWoua2hlbUBnbWFpbC5jb21dDQo+
IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IA0K
--------------7AWYng2dgY0JSZATZd0Pb0d2
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsDiBEqXaJERBACUvFofpD3FsxD9675wcPv+rzguIfsRWilrrpSZ61JHjLHwkUnm
DLpLSdfvZw2ZDXeaQbGU2thctxXTyYf6N1fY6P5Tww6mWKInuGU3yAv8Mg5p+Xd8
itwOoVR41DOBkftVmiO2G7FtXsnqonB6F43a2yvc+h9OwPRVxAFss5mSmwCglSXP
WndN1Ka4M/hzt7g+FmeyEssD/1V/G8lLeAS9gQCNjS7jch+uHMFJuWgHzMXdw99e
1ywlIkvXN77NPkW+FLVxKxNAHyWZZ3wO4BQ9/GVR2y0s/rrF1lQSIcfnUmzZrh/B
h0b1wVOSLhl0Vx4MI0/MbdL3xx17JAWy+s67evuKER4Y8ycTq3gbIGJtVrIJjWPC
zWF8BACAA2u52uDmJ2pS8SIhEW0jMK/zYQ5Od9l9fM6BmS6QjnIlzzcuMvRdZn2I
rnuE/YoC8yyzBK3mN+MVc2jWN9rfSg6ml7r14Zjem9Ee0O5Ca7Jg3ZvN6g3vSlrR
JqKgsnq3vdatDF+5rd0NJ7ZKUy6x2i1Pavgtv3qaAgPGa1qQdM0dS2hlbSBSYWog
PHJhai5raGVtQGdtYWlsLmNvbT7CYAQTEQIAIAUCSpdokQIbAwYLCQgHAwIEFQII
AwQWAgMBAh4BAheAAAoJELsFM1WRnTMUhOMAoJJleT2hdT7uw9Fyn26+w+/K4i0g
AJ9wRt36PqfjNe904evWolFf5cMmp8JgBBMRCgAgAhsDBgsJCAcDAgQVAggDBBYC
AwECHgECF4AFAlMELRoACgkQuwUzVZGdMxS6XgCfbzYVo3uhhczYDwnNC3VlZ5RO
UlkAnR46C6nYSrHHqBkU5ATsSRGY5vqIzsNNBEqXaJEQEACONtVDnlECi4B7SXSc
+wqRZ20y5QfAF0sGSkXesYz9/S4OU9pDNgYuMpPvEOjJGHzHa0XBa85+KqtkUCvF
fx7h+wAKYl0vSRqFNvEL/xKZJZUdeLXQlRfZ+Znm5/OVcCeXSK9eRaetR8tf0N03
AvoNHgN4Ur2oEWq0eYrlNBcy7zsb4wnCA0kjAIpBfiIj1gkgsy6oidXBrGDn8At0
p8TdA+a1p2cpv9y5SbiAgJ1ol7JB8jqp1gtxK7IFYJsAQwzXCaFECHDlGDMxFEiq
5mXE+3uVmRdeNqWzszqO6HztUZGggnBihCL3tDVkfM8GjcCUw97eFo2KGR3oPeXC
90HimaNgbgjpscKC0SESyzeEe+wFqpX2NXV0xRKz3lnFC1P2q2Q7HJ0eA6XBFfcI
b6vnzgn+zi9ab6I9C0u8NjW7hQXA4uMI4V7vT0Fwsl09HYZCI4+jJkXuVVjye792
1OsAS6JkWTgcPtp9SVyv8grA9YgPVX2REugOXN1s26hTL9d9USsrzByiIajB6sQx
53hqM2grELEHB4iSPGooy3wIqCnfSf1TGWOCURyB/79S6bBIfGplwI9VtZe12HL+
HAyTbuyE51S9qLKd6nw6xUaoDNKx4vipkgnlfMJzJXgokKbCZ1DO3n5nKVxWZ6rp
Hihv53wkgNTQQup3DHAgOJOPRwADBQ/+Kc3f+vwgUOaziDnFp8+sLDfWjaMhhqGQ
h83RZU9Yjkr+EUKjY9zM9K3MNxOxnHuY3arCkY57cvP3/SStl6SyvPVkgc2LktNq
y7NfIUls7Tlj56IeBXWtXtVUSKk6ulXXj3rDXXZj/RJn8WE58SYQDVN4N6PLaxmJ
M5RbiDLN7BscykTTt3bsXaozY18wyEpAJy/Ov43RUmYA54BMSK/E9Qef4Olf82eI
FY5xa/77AeXG/RevreCxEpK3rZ4UoaOAXnSEcPmUzfXOKrJxzjaxuByoBn6tgWVv
2TTclwrKrVd1VRKb7FwLYMxKy1MjqKoUwajoWcQ76DITlV1x5qNu5nUY6YlclQLJ
gh0a68LIigqNMT2VwhhIQQNlB6PnF2IaT15TPQw+ZkRTBJH+cuabCMcMmLSmtW+z
3Gp7lu9Ld108Cp6m9nlSuKyC1YP5MMjyS2S3lUuHdewb0W5dRUBpqE68UwaJm2yK
gNdOisvgB8x64D1/7IvCsJVA7fGYf9YDROB//mBgHe30qgc+MsE2u5U65BsCO5uL
Sm9EA5Rwx0F+Y+h+Swri5ZLXMa09ZLtS7Vyy6rsedvu+zOUVh1vN6qNjzUtLLEDS
RymAnF0u/2jtS4ISccNks9sd1Dzc+bLIEpIjfUAp7tFeVA2UHmCvAf2jq4209tXu
r+5GqYqrkSLCSQQYEQIACQUCSpdokQIbDAAKCRC7BTNVkZ0zFHVUAJ9IDpNFYVZL
U2T1aHmEmAcFBe5D5wCbBVUufOp45pebD9wGNMgoKf5XVr/CSQQYEQIACQUCSpdo
kQIbDAAKCRC7BTNVkZ0zFHVUAJwKR1o7etvz+BGmuV2YAfp5Hj16jgCeMPeHdpPC
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------7AWYng2dgY0JSZATZd0Pb0d2--

--------------sSkoNOKKs80L3gx2TMinvt7M--

--------------qFeJPaQa9F36tXDgPD9p5Bh9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZTKsIQUDAAAAAAAKCRC7BTNVkZ0zFKgh
AJ49XCyw30Mlk+sy19nHGuJPLDR44ACcDV5TYl9pgSJMEAG3TB/3gxN/xiY=
=N/la
-----END PGP SIGNATURE-----

--------------qFeJPaQa9F36tXDgPD9p5Bh9--

