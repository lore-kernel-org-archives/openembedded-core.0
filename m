Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E1FC369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 22:51:26 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.157.1745362285306304790
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 15:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MNDTIwIs;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2b8e2606a58so3172395fac.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 15:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745362284; x=1745967084; darn=lists.openembedded.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3LFNQSpw3+Ll79lePOl997LTpOgR5dx28/8hMsmqi5E=;
        b=MNDTIwIsx6xaJVv9hMpqufM9Jr4U0WOBjjgfoAGC6xWs36WHMMi8v1k0sr8oV3d745
         9KyGMdJSD9L2GOHnq/zJ4U/2qlk3i0NeE4XEDl4Nd/WJpA9pelveEbNKT6DFw0OK70aD
         8EJgItXcYaw7eXgRa1jmoweIsryZMXTZ6M9O5l0PuI5QQFpTZ5KtuvnXxo3ivstlAvEo
         L0GNE9CmbUPf8SKOqNVSumUkBiqVuJ4GpqPSXmj8vHkPOz8MrhoIrY0oByp5OMtJ37Lo
         sMYKs0uoDNEzFJefwj0H8GEhAqoXGKIODV5JFPYDlx7jDgPv4rSKeb0W4/a1qs4w7ow6
         bhmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745362284; x=1745967084;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3LFNQSpw3+Ll79lePOl997LTpOgR5dx28/8hMsmqi5E=;
        b=djsH4fY/jGZi8ViTBF/WKNyOtoQZe72E3ZKi3TMEynZ8N3wrSrHeoI6/g8QGYQiqjl
         o56obeeSWQLeFLnejiL2zHsqwE2xWHOtMFldQHG8mHOYNyLQhsLMCgn09GrhMe2lOpn6
         AVniAJMzOBp0PfCVnTQxZB3w4yAMzANoBKqB8KeWsmpw51L7SYJMI/BcSkNCY8YwxXPL
         Qs6L50OB6cbbfyFWibLYPHplfXJQh6Dq4lSPQlEsp5IGXCYnHXLvNy30ZpmcgISH4uPw
         eIsr4e8FlNs36IKoJAgH7gVYwN8X2ifiz0YpX3X9rJSdOioT4VFkRfhXnhl1BO8VqPC5
         qrpA==
X-Forwarded-Encrypted: i=1; AJvYcCWS3aQ0gBeEZYdc/rSLZRZg6rmOxeCKHmFK++9YPIN67uf1XquC1WAnvzMAw35y8ckbUtrBgzJXUvgSIY4+l2/Ubg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz52PBYJ5giNJ6WvairtZH0KaWWn1XgocCKah17qUE61ghCspNT
	nObon3rB89R0LZa2m0qBdm/WEcLAUNWJFJ/hmwY51lSXSoZ+0rUV
X-Gm-Gg: ASbGncuY9nj5kkpdhoeFyIuCQwAQWmglH0k/oEWQvMSQSeJd44VIgQ0SV/YX5fPjaq6
	KVY59gpmjK/AyEevQekSo//twwVmlhnCDASxqPKA/YwTDjPDGeJsaoRfFXFO03IQkXO+cGUUzbR
	fyaQo7A6ErfSH0gj/JSpibWAOpypcIzdgttOymbzLSVMd5lhIDQG66WEwyKHFWK2U32bZVcWuTm
	rqJOgG0igfsIrYhFcqwLoyRmnZBXRdj77RG+4gMt2SqONLmkiPebIg1+HSBZhMjhlhZXDOqrKsO
	r/lU1O8kr+U0GdWm/OK5NUzUkRaXpKtgYR3nLWDLSpbIMuCM2Ic20AO0N+4hQwEFP6z+yhdXVp3
	aCOrwy7XUdrIqYaIw6jR1fST6vQVf8nYKMw==
X-Google-Smtp-Source: AGHT+IHyHzlqtwDpAg3dIM0MCRw2eNbxILmvUAGqWRsVB1gb38EeGZ9KkM+TJhO8M3GddQy6YHKpSw==
X-Received: by 2002:a05:6871:332a:b0:2d5:246d:4b67 with SMTP id 586e51a60fabf-2d526d6e9dbmr9955384fac.24.1745362284412;
        Tue, 22 Apr 2025 15:51:24 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:f90a:1834:bcca:2d8b? ([2601:646:8201:fd20:f90a:1834:bcca:2d8b])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d52178ded3sm2833533fac.34.2025.04.22.15.51.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 15:51:23 -0700 (PDT)
Message-ID: <8f5a866f-e11d-4619-b159-8d3db541af52@gmail.com>
Date: Tue, 22 Apr 2025 15:51:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] gzip: upgrade 1.13 -> 1.14
To: richard.purdie@linuxfoundation.org, alex.kanavin@gmail.com,
 leimaohui@fujitsu.com
Cc: Denys Dmytriyenko <denis@denix.org>,
 openembedded-core@lists.openembedded.org
References: <20250417102130.800-1-leimaohui@fujitsu.com>
 <CANNYZj919ZzBoW6iDURx=aH2DRFyB0Yhy0V8TLwBv_5xH64cTg@mail.gmail.com>
 <41b65472c37b399e2d4c770819bf7868cd145665.camel@linuxfoundation.org>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <41b65472c37b399e2d4c770819bf7868cd145665.camel@linuxfoundation.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------SPwfb7EwoI2KHD0RkWhGiAby"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 22:51:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215250

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------SPwfb7EwoI2KHD0RkWhGiAby
Content-Type: multipart/mixed; boundary="------------H8GzzV66inilIk1GpPZP2dEX";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: richard.purdie@linuxfoundation.org, alex.kanavin@gmail.com,
 leimaohui@fujitsu.com
Cc: Denys Dmytriyenko <denis@denix.org>,
 openembedded-core@lists.openembedded.org
Message-ID: <8f5a866f-e11d-4619-b159-8d3db541af52@gmail.com>
Subject: Re: [OE-core] [PATCH] gzip: upgrade 1.13 -> 1.14
References: <20250417102130.800-1-leimaohui@fujitsu.com>
 <CANNYZj919ZzBoW6iDURx=aH2DRFyB0Yhy0V8TLwBv_5xH64cTg@mail.gmail.com>
 <41b65472c37b399e2d4c770819bf7868cd145665.camel@linuxfoundation.org>
In-Reply-To: <41b65472c37b399e2d4c770819bf7868cd145665.camel@linuxfoundation.org>

--------------H8GzzV66inilIk1GpPZP2dEX
Content-Type: multipart/mixed; boundary="------------Z3G5U4rmnmyp0bt0RyIIj2o6"

--------------Z3G5U4rmnmyp0bt0RyIIj2o6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC8yMi8yNSA4OjM2IEFNLCBSaWNoYXJkIFB1cmRpZSB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyB3cm90ZToNCj4gT24gVHVlLCAyMDI1LTA0LTIyIGF0IDE3OjI0ICswMjAwLCBB
bGV4YW5kZXIgS2FuYXZpbiB2aWENCj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToN
Cj4+IE9uIFRodSwgMTcgQXByIDIwMjUgYXQgMTI6MjEsIGxlaW1hb2h1aSB2aWEgbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZw0KPj4gPGxlaW1hb2h1aT1mdWppdHN1LmNvbUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiB3cm90ZToNCj4+PiArU3ViamVjdDogW1BBVENIXSB0ZXN0cy9yZWZl
cmVuY2U6IGZpeCBpbnZhbGlkIG9wdGlvbiBvZiBvZCBpc3N1ZQ0KPj4+ICsNCj4+PiArcHRl
c3QgaXNzdWU6DQo+Pj4gK3wgb2Q6IGludmFsaWQgb3B0aW9uIC0tICdBJw0KPj4+ICt8IEJ1
c3lCb3ggdjEuMzcuMCAoKSBtdWx0aS1jYWxsIGJpbmFyeS4NCj4+DQo+PiBJbnN0ZWFkIG9m
IHdvcmtpbmcgYXJvdW5kIGJ1c3lib3ggb2QgbGltaXRhdGlvbnMgd2l0aCBhIHBhdGNoLCBw
dGVzdA0KPj4gcGFja2FnZSBzaG91bGQgcmRlcGVuZCBvbiBjb3JldXRpbHMgdG8gcHVsbCBp
biB0aGUgcmVhbCBvcmlnaW5hbCBvZC4NCj4gDQo+IEFncmVlZCwgSSd2ZSBiZWVuIG1lYW5p
bmcgdG8gcmVwbHkgdG8gc2F5IGV4YWN0bHkgdGhpcyENCj4gDQoNCkNvbnNpZGVyIG90aGVy
IHNpZGUgb2YgdGhpcyBhcyB3ZWxsLg0KTWFueSBlbWJlZGRlZCBzeXN0ZW1zIGRvIHVzZSBi
dXN5Ym94IGhlYXZpbHksIGltcG9zaW5nIGRlcGVuZGVuY2llcyBmb3IgDQp0ZXN0cyBsaWtl
IHRoaXMgd291bGQgbWVhbiBwdGVzdHMgYXJlIGxlc3MgcmVsZXZhbnQgZm9yIHN1Y2ggdXNl
Y2FzZXMgDQpzaW5jZSBicmluZ2luZyBjb3JldXRpbHMgbWlnaHQgYWxzbyBzaHVudCBvdGhl
ciBidXN5Ym94IHV0aWxpdGllcyBhbG9uZyANCnRoZSB3YXkuDQoNCkkgd291bGQgYXNrIHRo
aXMgcGF0Y2ggdG8gYmUgcHJvcG9zZWQgdG8gZ3ppcCB1cHN0cmVhbSBmaXJzdCB0aG91Z2gu
DQoNCj4gQ2hlZXJzLA0KPiANCj4gUmljaGFyZA0KPiANCj4gDQo+IA0KPiAtPS09LT0tPS09
LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQg
dG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxpbmUgKCMyMTUyMzMpOiBodHRwczov
L2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS9tZXNzYWdlLzIx
NTIzMw0KPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zy9tdC8xMTIzMTA5OTAvMTk5NzkxNA0KPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNv
cmUrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBVbnN1YnNjcmliZTogaHR0cHM6
Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvdW5zdWIgW3Jh
ai5raGVtQGdtYWlsLmNvbV0NCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gDQo=
--------------Z3G5U4rmnmyp0bt0RyIIj2o6
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------Z3G5U4rmnmyp0bt0RyIIj2o6--

--------------H8GzzV66inilIk1GpPZP2dEX--

--------------SPwfb7EwoI2KHD0RkWhGiAby
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCaAgdagUDAAAAAAAKCRC7BTNVkZ0zFEbT
AJ9au9zdZVrPt80AmC3HqzDXzvx1rgCfbQlB5MrQP0p2cm6C3zqAMt8+mQc=
=z+Tn
-----END PGP SIGNATURE-----

--------------SPwfb7EwoI2KHD0RkWhGiAby--

