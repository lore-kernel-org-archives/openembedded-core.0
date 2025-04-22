Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E252C369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 22:44:06 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web10.47.1745361842126746871
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 15:44:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ndF9cSai;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2cca475546fso2854396fac.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 15:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745361841; x=1745966641; darn=lists.openembedded.org;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jN4mDcr9PBWs8R8/xUF3VbgoGVM0uXBl16lG+/zAkQg=;
        b=ndF9cSaiXtH7avOHdPzLgZ9WoAo6PFKe/i7eiD8WpGNbkcR58qMzIkyN6Ld9uix4KX
         8nfqTUmpPvF6ARRAN06jJ3O4l29hlJW/WjWLWV8P7mOHDpU+MdxY4yOpkS3slFSdYEHB
         AvtKCeqGtao9+9mEzsLPXBBqZXxZIpqVqCY7hINIA16PVogD7XOItc4L8sSsb46K/HpP
         zptoWpv6CTEIGqgz9wIVwJk1r+PjlN21Bf8XqbNH57KB0zvAA7ml3BNyKV+T+mtMVZ5C
         5kafJyryhWbTlZHGhG6tPJdg3Ku8Vnt4Z2aFNctU76LfdTNnuzcxmJSMuWsfH0Z8uyYJ
         f0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745361841; x=1745966641;
        h=in-reply-to:autocrypt:from:content-language:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jN4mDcr9PBWs8R8/xUF3VbgoGVM0uXBl16lG+/zAkQg=;
        b=TeL7F45Ky6lf95UDEbYI4dam80l01ZNzWkZgh4EiisLC1c35k+1ykO5pFUX+g/C0kF
         9YZFkLzi9bhXGGiJ32I4MXKT4Jp867Wzvaf24I/KGysNRib4Cj0Je3+992TXcBYZGodQ
         a2JYnzzFQg97Y/BwQSRj4djBaDDCJW79316dWdMsCjQlJdEv62XyIQShrRFkysCu0JXc
         3NCl9f0GgorvOO7R2fs0JSEUWlBTkSUT6SWNv9MVwr/9/abKOQ8X1YQX3nSEaU8cbvYm
         vxSK5b4nq6au9rwRyTcmZcB4DoBsCiSyM35f1QuqiUkU7Ba3NoN7qLr7ckJn4ZUHPewe
         a0mg==
X-Gm-Message-State: AOJu0YxUte+xi3bhYLY2jkWkL2Isd1puNb6hLmXP+7adOqdurqt0eJDL
	TgDteD8qpEZasthoeX+ARM27KPFf8DyD2WQ02d7DL0VDwI3NWeFCC0gBppo7
X-Gm-Gg: ASbGncsZe9ZC9n58Ikgf6eGbSBbk3HIGSVmuuDoqXn4S2Io5+CEufKSJtTUGeTYVVcN
	mRtYYELQTtSK1xY6P7teAP0+ELk7qkJ5Er/UoGMNx7Vy5us46d9i5fqoSz3KbR5ge2d8tXS9oV/
	ngEFgLyaz15gpNbPhM/eyCSsma6BSB5JDxGdoCv7Ig3uYb0ot+nPoRox7wJYFTOcEVs9vnVWRKu
	Zy9ftGcTG7zNaM4vZrxRYq97W5P4svqP9x4QAGU0+UvFbX+jhsOkrM4mVvGwzdoiN7uW6n/Fgm3
	gojoca81y3shuhOApr/dD0sv2A/pkcNGImP7CvHkttU3FVV7Aa8Puc4sMWhjQVdEetRuMU5Wx1D
	gtbTXINif+pFf7ilKd1Fz9HkHeMGvns26DA==
X-Google-Smtp-Source: AGHT+IF99VPrlPmWFyaNY+kgdF0o3LecDzhA3EQ/w2IVh7ZcE/8wSdYjZ4XPjvQTO6dlN+ka9i3MBg==
X-Received: by 2002:a05:6870:1b15:b0:2d4:dc79:b8b with SMTP id 586e51a60fabf-2d526a2e937mr10840797fac.10.1745361840863;
        Tue, 22 Apr 2025 15:44:00 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:f90a:1834:bcca:2d8b? ([2601:646:8201:fd20:f90a:1834:bcca:2d8b])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d52178dd17sm2911048fac.32.2025.04.22.15.43.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 15:44:00 -0700 (PDT)
Message-ID: <c573e12e-f8fd-465a-aec5-01f5360c1841@gmail.com>
Date: Tue, 22 Apr 2025 15:43:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Proposal: skip debug builds of native packages
To: openembedded-core@lists.openembedded.org
References: <6xHT.1744794131155604566.Q0NW@lists.openembedded.org>
 <CANNYZj_nbOyz__f2_ruKziyOngMXCw2ibMR3D8ETMS1b_3DOYQ@mail.gmail.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <CANNYZj_nbOyz__f2_ruKziyOngMXCw2ibMR3D8ETMS1b_3DOYQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------UBuHg62COyyBwmZw0lH4xRp8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 22:44:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215249

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------UBuHg62COyyBwmZw0lH4xRp8
Content-Type: multipart/mixed; boundary="------------xvJG9A4408t63ZmqZWlpsCsZ";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <c573e12e-f8fd-465a-aec5-01f5360c1841@gmail.com>
Subject: Re: [OE-core] Proposal: skip debug builds of native packages
References: <6xHT.1744794131155604566.Q0NW@lists.openembedded.org>
 <CANNYZj_nbOyz__f2_ruKziyOngMXCw2ibMR3D8ETMS1b_3DOYQ@mail.gmail.com>
In-Reply-To: <CANNYZj_nbOyz__f2_ruKziyOngMXCw2ibMR3D8ETMS1b_3DOYQ@mail.gmail.com>

--------------xvJG9A4408t63ZmqZWlpsCsZ
Content-Type: multipart/mixed; boundary="------------GARAipIsr5NKzBT9ezWrbsCX"

--------------GARAipIsr5NKzBT9ezWrbsCX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC8yMi8yNSA3OjU2IEFNLCBBbGV4YW5kZXIgS2FuYXZpbiB2aWEgbGlzdHMub3BlbmVt
YmVkZGVkLm9yZyB3cm90ZToNCj4gQWJzb2x1dGVseSBub3QuIEp1c3QgYmVjYXVzZSB5b3Ug
aGFkIG9uZSBpc29sYXRlZCBidWlsZCBmYWlsIGluDQo+IHN5c3RlbWQgZG9lc24ndCBtZWFu
IHdlIG5vdyBuZWVkIHRvIHN3aXRjaCBpdCBvZmYgYWNyb3NzIGV2ZXJ5dGhpbmcuDQo+IA0K
PiBBbnlvbmUgd2hvIGRvZXMgc2VyaW91cyBsYXllciBtYWludGVuYW5jZSBoYXMgdG8gZGVi
dWcgY3Jhc2hlcyBhbmQNCj4gbXlzdGVyaW91cyBiZWhhdmlvdXIgaW4gbmF0aXZlIGV4ZWN1
dGFibGVzLCBhbmQgdGhpcyBpcyByZXF1aXJlZA0KPiBmdW5jdGlvbmFsaXR5Lg0KDQpRdWVz
dGlvbiBpcyBpZiBERUJVR19CVUlMRCBzaG91bGQgZXh0ZW5kIHRvIG5hdGl2ZSBwYWNrYWdl
cywgeW91IGNhbiANCnN0aWxsIGRlYnVnIGNyYXNoZXMgd2l0aCBkZWZhdWx0cy4gREVCVUdf
QlVJTEQgbG93ZXJzIGRlZmF1bHQgb3B0bGV2ZWwNCndoaWNoIG1lYW5zIHdlIGFyZSBidWls
ZGluZyB0aGUgcGFja2FnZSB3aXRoIGFuIG9wdGlvbiBzZXQgdGhhdCBpcyBub3QNCmNvbW1v
bmx5IHRlc3RlZC4gVGhpcyBjb3N0IGlzIHVuZGVyc3Rvb2QgZm9yIHRhcmdldCBwYWNrYWdl
cywgYnV0IGRvIHdlDQp3YW50IHRoZSBzdXBwb3J0aW5nIHRvb2xzIHRvIGJlIGJ1aWx0IHdp
dGggdGhlc2Ugb3B0aW9ucyA/IEkgZG9uJ3QgdGhpbmsgDQpzby4gSXQgd2lsbCBzbG93IHRo
ZW0gZG93biB0b28uDQoNClNvIGhhdmluZyBhbiBvcHRpb24gdG8gdHVybiBERUJVR19CVUlM
RCBwcm9wYWdhdGlvbiB0byBub24tdGFyZ2V0IA0KcGFja2FnZXMgY2FuIGluIGZhY3QgaGVs
cCB0aGUgbWFqb3JpdHkgb2YgdXNlLWNhc2VzIHdoZXJlIE9FIGlzIHVzZWQuDQoNCj4gDQo+
IEFsZXgNCj4gDQo+IE9uIFdlZCwgMTYgQXByIDIwMjUgYXQgMTE6MDIsIEphbiBLaXJjaGVy
IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IDxqYW4ua2lyY2hlcj1sZWljYS1taWNy
b3N5c3RlbXMuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0KPj4NCj4+IEZv
bGxvd2luZyB0aGUgc3VnZ2VzdGlvbiBvZiBLaGVtIFJhaiBhZnRlciBteSBpc3N1ZSB3aXRo
IHN5c3RlbWQtc3lzdGVtY3RsLW5hdGl2ZSAoaHR0cHM6Ly9saXN0cy55b2N0b3Byb2plY3Qu
b3JnL2cvcG9reS9tZXNzYWdlLzEzNTg5KSwgSSBwcm9wb3NlIHRvIG5vdCBidWlsZCBkZWJ1
ZyB2ZXJzaW9ucyBvZiAqLW5hdGl2ZSBwYWNrYWdlcyB3aGVuIERFQlVHX0JVSUxEIGlzIGVu
YWJsZWQuIEF0IGxlYXN0IGZvciBvdXIgdXNlLWNhc2UsIGJ1aWxkaW5nIGRlYnVnIHZlcnNp
b25zIG9mIG5hdGl2ZSBwYWNrYWdlcyBpcyB1bm5lY2Vzc2FyeS4gUGxlYXNlIHNoYXJlIHlv
dXIgb3BpbmlvbnMuDQo+Pg0KPj4gR3JlZXRpbmdzLA0KPj4gSmFuDQo+Pg0KPj4NCj4+DQo+
Pg0KPj4NCj4+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+PiBMaW5rczogWW91IHJlY2Vp
dmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4+IFZpZXcvUmVwbHkgT25s
aW5lICgjMjE1MjI5KTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVt
YmVkZGVkLWNvcmUvbWVzc2FnZS8yMTUyMjkNCj4+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6
Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzExMjI5MTgwMi8xOTk3OTE0DQo+PiBHcm91
cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9y
Zw0KPj4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29w
ZW5lbWJlZGRlZC1jb3JlL3Vuc3ViIFtyYWoua2hlbUBnbWFpbC5jb21dDQo+PiAtPS09LT0t
PS09LT0tPS09LT0tPS09LQ0KPj4NCg==
--------------GARAipIsr5NKzBT9ezWrbsCX
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------GARAipIsr5NKzBT9ezWrbsCX--

--------------xvJG9A4408t63ZmqZWlpsCsZ--

--------------UBuHg62COyyBwmZw0lH4xRp8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCaAgbrwUDAAAAAAAKCRC7BTNVkZ0zFMwa
AJ46w0SGCqAncbEF442HEpCiAEW1cwCfTd2zpl9APndabCcDYd/Dq1NJNcE=
=80J8
-----END PGP SIGNATURE-----

--------------UBuHg62COyyBwmZw0lH4xRp8--

