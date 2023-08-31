Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 382A8C83F2E
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 16:52:29 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.3096.1693500747140733089
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Aug 2023 09:52:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Nt3vUehb;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-56c2e840e70so823976a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 09:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693500746; x=1694105546; darn=lists.openembedded.org;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tpSq7J8sL8oZwrMDysLdlcvNcFr3MsotuQWuUgHlhkc=;
        b=Nt3vUehb3j73uQ0g2nX7yjtsAe1J9Mzn/8bAMFlySA0oXVgwL/79pYzRPwxinO3uXr
         RjlCc3N7y1pxSRs1HXaoUTpwKB8aoVK8XJVV5YrNPahZi92XLPjmTV/iIKaHah0XWSc+
         6kxDtrh6gxd/gAoV8LXQvDSR00QAlMyVq3Yzn+6WoMKuVTrM+vqLwPNBjqwg2MAsViDW
         TfQCAfSV0oC5VkVOb609oCSjvCPIgGFjqVL05ELBH2p77ZgrIa1X/Dnbn/S+eMt0NDjC
         NTaxB4cYymOtxcgTPhdI3AwfoHgG1CexaVXvMEMFmV29s6Pz2yet2gRZkFg7n/NA8xPp
         rV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693500746; x=1694105546;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tpSq7J8sL8oZwrMDysLdlcvNcFr3MsotuQWuUgHlhkc=;
        b=AzAqWHi7XpaZuYHom9Q41zivKA+19DNNNjf878E5twF2za4Q8v0mRzzmH/ShxLSqw9
         zEmlINjBXaS+6gJzNj2xKW2LyqM2J3bYc0mGMeMY5c0LS5FxpoSh2NbIlgnSf3uqXPOP
         vaTPTvIJ/iU17Qs2+06XLgzWy6BBa2YGDyI0GHgMj9kRztFo9/eEh1PeirtKJh+WgFh0
         Eis7ySCipHdEmm0o4PJHwm2M4zD4ZadzMEZ6YKIGSJYegOnf+OJ4E8U4mKLJfvYYI0sH
         3fEUL3X4dT1Z2QA2YCojWZT7vm3kPgiWJskDYFoatd9TYaLuUitiiHD9t0D5xOpPuhN2
         50rw==
X-Gm-Message-State: AOJu0YxSszXVddKzpIfryiaAWfORhH9oB5MDe0N2qz/al+9JzZwZFRja
	4R1ZSH3Y+kAf+1+7RSzT4vY=
X-Google-Smtp-Source: AGHT+IGRYz6AFfSnwruv5MWn3MsmoErw6PfPWbU05zMIywRTULa8a6QSBNeZp4I+BgYlsTh892aEtg==
X-Received: by 2002:a05:6a20:555:b0:14b:ea0d:e301 with SMTP id 21-20020a056a20055500b0014bea0de301mr319051pzq.0.1693500746293;
        Thu, 31 Aug 2023 09:52:26 -0700 (PDT)
Received: from ?IPV6:2601:646:9100:2cb0:159a:d94d:d507:6c2c? ([2601:646:9100:2cb0:159a:d94d:d507:6c2c])
        by smtp.gmail.com with ESMTPSA id b15-20020a63714f000000b0056c24c2e23dsm1533309pgn.25.2023.08.31.09.52.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Aug 2023 09:52:25 -0700 (PDT)
Message-ID: <d23c427f-a0a7-458d-be3a-aa6362ad7638@gmail.com>
Date: Thu, 31 Aug 2023 09:52:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] glib-networking: use gnutls backend for TLS
 sockets
Content-Language: en-US
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, nd <nd@arm.com>
References: <20230831100243.3946833-1-ross.burton@arm.com>
 <20230831100243.3946833-2-ross.burton@arm.com>
 <f71f323b-fa43-450c-9d76-bc96978a5bb0@gmail.com>
 <9A6118FB-20AD-421D-AE1D-0ECA08BC4664@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <9A6118FB-20AD-421D-AE1D-0ECA08BC4664@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------UarDuHvzz6FYnotQ7u5zDHiS"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 16:52:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186982

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------UarDuHvzz6FYnotQ7u5zDHiS
Content-Type: multipart/mixed; boundary="------------DnrBvHMtQfdrAYTB8onaacKE";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, nd <nd@arm.com>
Message-ID: <d23c427f-a0a7-458d-be3a-aa6362ad7638@gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] glib-networking: use gnutls backend for TLS
 sockets
References: <20230831100243.3946833-1-ross.burton@arm.com>
 <20230831100243.3946833-2-ross.burton@arm.com>
 <f71f323b-fa43-450c-9d76-bc96978a5bb0@gmail.com>
 <9A6118FB-20AD-421D-AE1D-0ECA08BC4664@arm.com>
In-Reply-To: <9A6118FB-20AD-421D-AE1D-0ECA08BC4664@arm.com>

--------------DnrBvHMtQfdrAYTB8onaacKE
Content-Type: multipart/mixed; boundary="------------UgKAnlDt3v2uwIH7YOboVF8x"

--------------UgKAnlDt3v2uwIH7YOboVF8x
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gOC8zMS8yMyA5OjI4IEFNLCBSb3NzIEJ1cnRvbiB3cm90ZToNCj4gT24gMzEgQXVnIDIw
MjMsIGF0IDE3OjI3LCBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPiB3cm90ZToNCj4+
DQo+PiBPbiA4LzMxLzIzIDM6MDIgQU0sIFJvc3MgQnVydG9uIHdyb3RlOg0KPj4+IEZyb206
IFJvc3MgQnVydG9uIDxyb3NzLmJ1cnRvbkBhcm0uY29tPg0KPj4+IEFzIHBlciB1cHN0cmVh
bToNCj4+PiAgICBUaGVyZSBhcmUgaGFja3MgaW4gaGFsZiB0aGUgdGVzdHMgd2hlcmUgdGhp
cyBiYWNrZW5kIGRvZXNuJ3QgcmV0dXJuDQo+Pj4gICAgdGhlIGV4cGVjdGVkIGVycm9yIGNv
ZGUgb3IgZG9lc24ndCB3b3JrIGFzIGV4cGVjdGVkLiBJIGRvIGhvcGUgdG8NCj4+PiAgICBl
bmFibGUgdGhpcyBiYWNrZW5kIGJ5IGRlZmF1bHQgaW4gdGhlIGZ1dHVyZS4gRm9yIG5vdywg
aXQncyBub3QgdGhlcmUNCj4+PiAgICB5ZXQuDQo+Pj4gaHR0cHM6Ly9naXRsYWIuZ25vbWUu
b3JnL0dOT01FL2dsaWItbmV0d29ya2luZy8tL2NvbW1pdC84ZTFkODBjMWUwZmM1MmQxN2Qw
OGEyMTk0NmZhNGE4NmVjMzBlMWRiDQo+Pj4gU2lnbmVkLW9mZi1ieTogUm9zcyBCdXJ0b24g
PHJvc3MuYnVydG9uQGFybS5jb20+DQo+Pj4gLS0tDQo+Pj4gICBtZXRhL3JlY2lwZXMtY29y
ZS9nbGliLW5ldHdvcmtpbmcvZ2xpYi1uZXR3b3JraW5nXzIuNzYuMS5iYiB8IDIgKy0NCj4+
PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPj4+
IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLW5ldHdvcmtpbmcvZ2xpYi1u
ZXR3b3JraW5nXzIuNzYuMS5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItbmV0d29ya2lu
Zy9nbGliLW5ldHdvcmtpbmdfMi43Ni4xLmJiDQo+Pj4gaW5kZXggNjZiNmE3OGE1MzEuLmVk
MTYyNTYxN2U2IDEwMDY0NA0KPj4+IC0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItbmV0
d29ya2luZy9nbGliLW5ldHdvcmtpbmdfMi43Ni4xLmJiDQo+Pj4gKysrIGIvbWV0YS9yZWNp
cGVzLWNvcmUvZ2xpYi1uZXR3b3JraW5nL2dsaWItbmV0d29ya2luZ18yLjc2LjEuYmINCj4+
PiBAQCAtMTYsNyArMTYsNyBAQCBERVBFTkRTID0gImdsaWItMi4wLW5hdGl2ZSBnbGliLTIu
MCINCj4+PiAgICAgU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiNWM2OThhOTk5NGRk
ZTUxZWZkZmIxMDI2YTU2Njk4YTIyMWQ2MjUwZTg5ZGM1MGViY2RkZGE3YjgxNDgwYTQyYiIN
Cj4+PiAgIC1QQUNLQUdFQ09ORklHID8/PSAib3BlbnNzbCBlbnZpcm9ubWVudCAke0BiYi51
dGlscy5jb250YWlucygnUFRFU1RfRU5BQkxFRCcsICcxJywgJ3Rlc3RzJywgJycsIGQpfSIN
Cj4+PiArUEFDS0FHRUNPTkZJRyA/Pz0gImdudXRscyBlbnZpcm9ubWVudCAke0BiYi51dGls
cy5jb250YWlucygnUFRFU1RfRU5BQkxFRCcsICcxJywgJ3Rlc3RzJywgJycsIGQpfSINCj4+
Pg0KPj4NCj4+IHRoaXMgaXMgc2FkLiBBcmUgd2UgcnVubmluZyBpbnRvIHZpc2libGUgaXNz
dWVzIHdpdGggT0UgaWYgd2UgdXNlIG9wZW5zc2wgVExTIGltcGxlbWVudGF0aW9uLg0KPiAN
Cj4gVmlzaWJsZSBpc3N1ZXM/IE5vLiAgQnV0IHRoZSBnbGliLW5ldHdvcmtpbmcgbWFpbnRh
aW5lcnMgZXhwbGljaXRseSBzYXkgdGhlIG9wZW5zc2wgYmFja2VuZCBpcyBub3QgYXMgZnVu
Y3Rpb25hbCBhbmQga25vd24gdG8gYmUgYnVnZ2llciB0aGFuIHRoZSBnbnV0bHMgYmFja2Vu
ZC4NCg0KWWVzIEkgYW0gbm90IG9wcG9zZWQgdG8gdGhlIHBhdGNoIHBlciBzZS4gQnV0IHRy
eWluZyB0byBmaW5kIG1vcmUgDQppbmZvcm1hdGlvbiBvbiBzdGF0dXMgb2Ygb3BlbnNzbCBU
TFMgc3VwcG9ydCBpbiBnbGliLW5ldHdvcmtpbmcuDQoNCj4gDQo+IElmIHlvdSB3YW50IHRv
IHVzZSB0aGUgb3BlbnNzbCBiYWNrZW5kIHRoZW4geW914oCZcmUgd2VsY29tZSB0byBzd2l0
Y2ggYmFjaywgYnV0IEkgdGhpbmsgdGhlIGRlZmF1bHQgc2hvdWxkIHJlc3BlY3QgdGhlIHdp
bGwgb2YgdGhlIGF1dGhvcnMgdW5sZXNzIHdlIGhhdmUgYSBnb29kIGFyZ3VtZW50IG90aGVy
d2lzZS4NCj4gDQo+IFJvc3MNCg==
--------------UgKAnlDt3v2uwIH7YOboVF8x
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------UgKAnlDt3v2uwIH7YOboVF8x--

--------------DnrBvHMtQfdrAYTB8onaacKE--

--------------UarDuHvzz6FYnotQ7u5zDHiS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZPDFSAUDAAAAAAAKCRC7BTNVkZ0zFEAV
AJ9Ok3HZ/iXG83FrinbXmH2ufmL4kQCfSG1lPXF9e/9x8nJvFwM3Mqn74EM=
=FAd+
-----END PGP SIGNATURE-----

--------------UarDuHvzz6FYnotQ7u5zDHiS--

