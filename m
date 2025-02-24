Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BDEFC021A4
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 18:18:28 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.97589.1740421098267657602
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Feb 2025 10:18:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mMWXLo2l;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7272285f120so2717482a34.0
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Feb 2025 10:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740421097; x=1741025897; darn=lists.openembedded.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mVlqaxNtin+1e3kO/RMh/CmxKOV6o7O6iqwkZfdf4oc=;
        b=mMWXLo2lnCPNsnAcqHyBnaCCmPcxP1r/9TRmnx9Z1wndR4XDHamtxL6mYlnIXi1bwR
         ByxY+K4Ui1jBsohlOHwZzWwGmqjEyJzau4bs0/hHhmBgg9qBANbAyRq77cbTsnL0XqEs
         StjS0wLCFQEKqOEHR+hqcv8zXcY6PQ8nH6t6hJxQZ/sOwC22ryeQiPmNfnTnw6evp4CO
         aIz8EiMRZ5n0maBPOQH0/Fvi3S9hJlhExE0R4lDB85SM3gcPzu0VSeRBY4t59FQMufRK
         LSuTJaKDHadUNDxSL6o8odcjDjNsAIDw4jNomCOtNu9eexB9iykJYX+et1AJyusUdbqH
         jBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740421097; x=1741025897;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mVlqaxNtin+1e3kO/RMh/CmxKOV6o7O6iqwkZfdf4oc=;
        b=Jqz0IjnIFba4sElovRGUD+8O6TP24e3Ym4DVgtgrTtaEhdd47kXX/nd4Ma3A/P3+sq
         yrOgSt44b5DXPu+Jgou4e4iwjlBP7UCWkvtiJ56dqzg5ftKU7uN2TuyjlgwbL6ueA5t/
         NSEStoM6hEZIDXtphV+lSW8cWcXQAUbLt2/1oMZTe7my58BC5iN0PR0oz/lNnbIIrevf
         3GTqLA9+VeCkqLFbOxQu+MiJ/HZG8XVg9nnAxqu308mm8Yiofm8GORYkk6vi25nnWF7X
         3xjImdHTpgyoh9mzCRaNjEZIuAolFVP0vRihAEe8y82xf6AJQWkM/Gqv+cfy0iUuGAym
         loig==
X-Gm-Message-State: AOJu0YxqT8M8agHFG468q98kdTLsWkmzzP2q9clsDhIc8gPcu5FVTgyq
	Z0irW/jwjQ4WgYvLNy1lyfXR28aDSMws7cXRf8bm8nvRfeW9YD0O
X-Gm-Gg: ASbGncuR7xV49qLuLGGbIn/Sg1A9bHBneXVVswUN/ya3kTp2k3UZCO4kwC80UoxeAP+
	EBjbZtEz9jnQE73Y68bnP3XI8ysMnkgvyp5yUkVOJsDgPDT59+k1HVPXYHYklWwS6L9ggHN7v+X
	YZdsm/QW146F+ZsqSKQEo5ozDFPvqdMdnaNSVGzRKtuc6GL3jMLphv6LXYKl2ZpYaL5xLF39ZtQ
	GvkKi4f14ig5gfSkM/ns+f36vxrCgw9qCvx3oispPbkTCUJ814M3nnZCY3vJ61z0Xlfz7CIqYki
	dJUqFqJm3KTEIGAOTFXFbqYkulvJnG8U0vNOFHFPaZ8tsWNWSm0mZwshqvhzgnSddSGt83VmuYQ
	xodDViqqc9h0=
X-Google-Smtp-Source: AGHT+IEXx6+4bOXRgTL8Ad9N9Q1uxBA/p0GaeT6aTu1LnXuuWxvElFlpdhOVwdb4/+rs/EQAoRTnnQ==
X-Received: by 2002:a05:6830:349f:b0:727:2fa8:c0e2 with SMTP id 46e09a7af769-7274c57857dmr9407227a34.24.1740421097421;
        Mon, 24 Feb 2025 10:18:17 -0800 (PST)
Received: from ?IPV6:2601:646:8201:fd20:849d:795:3e75:4d27? ([2601:646:8201:fd20:849d:795:3e75:4d27])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b95a7b5495sm8386800fac.36.2025.02.24.10.18.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 10:18:16 -0800 (PST)
Message-ID: <1ac1f18e-1b5a-43e8-acc8-bf97c697c1a3@gmail.com>
Date: Mon, 24 Feb 2025 10:18:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 2/2] mtd-utils: Upgrade to 2.3.0
To: Ross Burton <Ross.Burton@arm.com>, "festevam@gmail.com"
 <festevam@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, Fabio Estevam <festevam@denx.de>
References: <20250219185119.2168718-1-festevam@gmail.com>
 <20250219185119.2168718-2-festevam@gmail.com>
 <4CEF303F-CC01-4067-A1DB-2F9C1A2990FA@arm.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <4CEF303F-CC01-4067-A1DB-2F9C1A2990FA@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6LxGUvzHMlqnM9mx4mmcdh8K"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Feb 2025 18:18:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211848

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6LxGUvzHMlqnM9mx4mmcdh8K
Content-Type: multipart/mixed; boundary="------------N1oTKFNq6C00ZrxLtd2Hcu0n";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Ross Burton <Ross.Burton@arm.com>, "festevam@gmail.com"
 <festevam@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, Fabio Estevam <festevam@denx.de>
Message-ID: <1ac1f18e-1b5a-43e8-acc8-bf97c697c1a3@gmail.com>
Subject: Re: [OE-core] [PATCH v3 2/2] mtd-utils: Upgrade to 2.3.0
References: <20250219185119.2168718-1-festevam@gmail.com>
 <20250219185119.2168718-2-festevam@gmail.com>
 <4CEF303F-CC01-4067-A1DB-2F9C1A2990FA@arm.com>
In-Reply-To: <4CEF303F-CC01-4067-A1DB-2F9C1A2990FA@arm.com>

--------------N1oTKFNq6C00ZrxLtd2Hcu0n
Content-Type: multipart/mixed; boundary="------------OaAOYCXDW8gZD06cyIAD3Syo"

--------------OaAOYCXDW8gZD06cyIAD3Syo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMi8yNC8yNSA0OjIzIEFNLCBSb3NzIEJ1cnRvbiB3cm90ZToNCj4gT24gMTkgRmViIDIw
MjUsIGF0IDE4OjUxLCBGYWJpbyBFc3RldmFtIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
IDxmZXN0ZXZhbT1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+
Pg0KPj4gK0RFUEVORFM6YXBwZW5kOmxpYmMtbXVzbCA9ICIgbGliZXhlY2luZm8iDQo+PiAr
TERGTEFHUzphcHBlbmQ6bGliYy1tdXNsID0gIiAtbGV4ZWNpbmZv4oCdDQo+IA0KPiBXZSBh
bHJlYWR5IGhhdmUgYSBnY29tcGF0IHJlY2lwZSBpbiBjb3JlIHdoaWNoIHByb3ZpZGVzIHRo
aXM6DQo+IA0KPiBodHRwczovL2dpdC5hZGVsaWVsaW51eC5vcmcvYWRlbGllL2djb21wYXQv
LS9ibG9iL2N1cnJlbnQvbGliZ2NvbXBhdC9leGVjaW5mby5jP3JlZl90eXBlPWhlYWRzDQo+
IA0KPiBXb3VsZCB0aGlzIGJlIGJldHRlciB0aGFuIGFub3RoZXIgcmVjaXBlIGZvciB0aGUg
c2FtZSBjb2RlPw0KDQpnY29tcGF0J3MgZ29hbCBpcyB0byBydW4gYmluYXJpZXMgcHJlLWJ1
aWx0IGZvciBnbGliYyBvbiBhIG11c2wgc3lzdGVtLiANClNvIGl0IHByb3ZpZGVzIHRoZSBB
UEkgaW1wbGVtZW50YXRpb25zIGJ1dCBkbyBub3QgcHJvdmlkZSBoZWFkZXJzIHRvIA0KZXhw
b3J0IHRoZW0gdG8gYmUgdXNlZCBmb3IgYnVpbGRpbmcgdGhlIHBhY2thZ2VzLCB3aGljaCBp
cyBleHBlY3RlZC4NCg0KbGliZXhlY2luZm8gaXMgZGV2ZWxvcG1lbnQgbGlicmFyeSBhbmQg
aGVhZGVyIHBhY2thZ2UuDQoNCkhUSA0KDQo+IA0KPiBSb3NzDQo=
--------------OaAOYCXDW8gZD06cyIAD3Syo
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------OaAOYCXDW8gZD06cyIAD3Syo--

--------------N1oTKFNq6C00ZrxLtd2Hcu0n--

--------------6LxGUvzHMlqnM9mx4mmcdh8K
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZ7y35wUDAAAAAAAKCRC7BTNVkZ0zFCap
AJ4vL7c5fZjUJjXHstwVir7sDBhwTwCfTEDhQn8PtISOLAz7ESJO4lR+RaY=
=A/il
-----END PGP SIGNATURE-----

--------------6LxGUvzHMlqnM9mx4mmcdh8K--

