Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16320C83F2E
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 16:27:19 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.2406.1693499234728403800
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Aug 2023 09:27:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=RZTPgXR7;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-26f6b2c8e80so725618a91.1
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 09:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693499234; x=1694104034; darn=lists.openembedded.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7i26MDW+aLDXzMgFUFQ0FbMA0FueY73Jc15bnBkKfZQ=;
        b=RZTPgXR7kOuGl/XNwniJ8Mbbn5XHYusa+q2K3mkmahwiP+2mi6Bk8nVxMB5YDUui8W
         UA5QHcd4L4/Ieyehq0pGoCZx6vyM+Dx42vk1m3048edDW6SLskugxVGDuvMXit97qenm
         uzM49fBFaNIvQPiaKi+Zi1OdM4DtQ7YZTC8U3RO3niks0lI8q01Zbk5Eh0YQIpXcMSXp
         S5InK4WGr32p7qBPWF6LRGn3e/PLcCFPxYC87D4EIfYhJg+rzheoAWZEgrO+evFgJtQL
         6QZL7z2CRaPFOVhY26OWEC4W4il2hZzX8ir/eT01gQeYt825WpCYqJTqy99ojgrlPmcA
         6Jug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693499234; x=1694104034;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7i26MDW+aLDXzMgFUFQ0FbMA0FueY73Jc15bnBkKfZQ=;
        b=adhFV9NyU2N20oryFyCc6JeK4K4WG/iZKIRNGbGP6vacEiFNXtzPIkb6Nlt79usHYv
         +YQd4sKNOWgly3b+C7sp0dxSTNWASBcs7q36TccrCI5VIPuoYTR1CeCiPzE4e9FTU81Q
         FHaU8Ku8JprO3kb9m2aRVJ840tS3UHV3IcpHho4+40dZfDONADjyYZKxaC69CKp4iPKc
         +Up9H8BoKg4YCC2jj6RSjKXJfOhlWW7tBYO4ZCy5HNQK4KA/nwIDaSKROURnaVs1NPX7
         OXR06JuPFrpn4hYanYPqHeqDy93D/0uLe8OQvmNXRIcrwcy4C7oPQwNmqbl2xdTtar3w
         COrQ==
X-Gm-Message-State: AOJu0YyeUfTmbYp9Se1FHrjLDiUtrTP063eDaknhBLNXB1svGMsmaHpT
	/RtSNBEgJhOEHp6mQdmty+cdxlNagORShg==
X-Google-Smtp-Source: AGHT+IHcHcrtrVYZfMZWh20oc73nlk5Yy2USommgtMGwauVT7GaB7mqErIvAYprIVq9t1o5p+aRTmA==
X-Received: by 2002:a17:90a:f982:b0:268:6339:318 with SMTP id cq2-20020a17090af98200b0026863390318mr5371689pjb.30.1693499233819;
        Thu, 31 Aug 2023 09:27:13 -0700 (PDT)
Received: from ?IPV6:2601:646:9100:2cb0:159a:d94d:d507:6c2c? ([2601:646:9100:2cb0:159a:d94d:d507:6c2c])
        by smtp.gmail.com with ESMTPSA id 3-20020a17090a08c300b0026b41363887sm3099189pjn.27.2023.08.31.09.27.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Aug 2023 09:27:13 -0700 (PDT)
Message-ID: <f71f323b-fa43-450c-9d76-bc96978a5bb0@gmail.com>
Date: Thu, 31 Aug 2023 09:27:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] glib-networking: use gnutls backend for TLS
 sockets
To: Ross Burton <ross.burton@arm.com>,
 openembedded-core@lists.openembedded.org
Cc: nd@arm.com
References: <20230831100243.3946833-1-ross.burton@arm.com>
 <20230831100243.3946833-2-ross.burton@arm.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <20230831100243.3946833-2-ross.burton@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3OquKxNeKFxVBQP1IMD7cj4b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 16:27:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186980

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3OquKxNeKFxVBQP1IMD7cj4b
Content-Type: multipart/mixed; boundary="------------J1T4lYTTWC7t1Z900nlpn5lr";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Ross Burton <ross.burton@arm.com>,
 openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Message-ID: <f71f323b-fa43-450c-9d76-bc96978a5bb0@gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] glib-networking: use gnutls backend for TLS
 sockets
References: <20230831100243.3946833-1-ross.burton@arm.com>
 <20230831100243.3946833-2-ross.burton@arm.com>
In-Reply-To: <20230831100243.3946833-2-ross.burton@arm.com>

--------------J1T4lYTTWC7t1Z900nlpn5lr
Content-Type: multipart/mixed; boundary="------------iFuUAim0erw4SznhuRlMzsgW"

--------------iFuUAim0erw4SznhuRlMzsgW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gOC8zMS8yMyAzOjAyIEFNLCBSb3NzIEJ1cnRvbiB3cm90ZToNCj4gRnJvbTogUm9zcyBC
dXJ0b24gPHJvc3MuYnVydG9uQGFybS5jb20+DQo+IA0KPiBBcyBwZXIgdXBzdHJlYW06DQo+
IA0KPiAgICBUaGVyZSBhcmUgaGFja3MgaW4gaGFsZiB0aGUgdGVzdHMgd2hlcmUgdGhpcyBi
YWNrZW5kIGRvZXNuJ3QgcmV0dXJuDQo+ICAgIHRoZSBleHBlY3RlZCBlcnJvciBjb2RlIG9y
IGRvZXNuJ3Qgd29yayBhcyBleHBlY3RlZC4gSSBkbyBob3BlIHRvDQo+ICAgIGVuYWJsZSB0
aGlzIGJhY2tlbmQgYnkgZGVmYXVsdCBpbiB0aGUgZnV0dXJlLiBGb3Igbm93LCBpdCdzIG5v
dCB0aGVyZQ0KPiAgICB5ZXQuDQo+IA0KPiBodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05P
TUUvZ2xpYi1uZXR3b3JraW5nLy0vY29tbWl0LzhlMWQ4MGMxZTBmYzUyZDE3ZDA4YTIxOTQ2
ZmE0YTg2ZWMzMGUxZGINCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJvc3MgQnVydG9uIDxyb3Nz
LmJ1cnRvbkBhcm0uY29tPg0KPiAtLS0NCj4gICBtZXRhL3JlY2lwZXMtY29yZS9nbGliLW5l
dHdvcmtpbmcvZ2xpYi1uZXR3b3JraW5nXzIuNzYuMS5iYiB8IDIgKy0NCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtY29yZS9nbGliLW5ldHdvcmtpbmcvZ2xpYi1uZXR3b3JraW5n
XzIuNzYuMS5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL2dsaWItbmV0d29ya2luZy9nbGliLW5l
dHdvcmtpbmdfMi43Ni4xLmJiDQo+IGluZGV4IDY2YjZhNzhhNTMxLi5lZDE2MjU2MTdlNiAx
MDA2NDQNCj4gLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi1uZXR3b3JraW5nL2dsaWIt
bmV0d29ya2luZ18yLjc2LjEuYmINCj4gKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZ2xpYi1u
ZXR3b3JraW5nL2dsaWItbmV0d29ya2luZ18yLjc2LjEuYmINCj4gQEAgLTE2LDcgKzE2LDcg
QEAgREVQRU5EUyA9ICJnbGliLTIuMC1uYXRpdmUgZ2xpYi0yLjAiDQo+ICAgDQo+ICAgU1JD
X1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiNWM2OThhOTk5NGRkZTUxZWZkZmIxMDI2YTU2
Njk4YTIyMWQ2MjUwZTg5ZGM1MGViY2RkZGE3YjgxNDgwYTQyYiINCj4gICANCj4gLVBBQ0tB
R0VDT05GSUcgPz89ICJvcGVuc3NsIGVudmlyb25tZW50ICR7QGJiLnV0aWxzLmNvbnRhaW5z
KCdQVEVTVF9FTkFCTEVEJywgJzEnLCAndGVzdHMnLCAnJywgZCl9Ig0KPiArUEFDS0FHRUNP
TkZJRyA/Pz0gImdudXRscyBlbnZpcm9ubWVudCAke0BiYi51dGlscy5jb250YWlucygnUFRF
U1RfRU5BQkxFRCcsICcxJywgJ3Rlc3RzJywgJycsIGQpfSINCj4NCg0KdGhpcyBpcyBzYWQu
IEFyZSB3ZSBydW5uaW5nIGludG8gdmlzaWJsZSBpc3N1ZXMgd2l0aCBPRSBpZiB3ZSB1c2Ug
DQpvcGVuc3NsIFRMUyBpbXBsZW1lbnRhdGlvbi4NCg0KDQo+ICAgUEFDS0FHRUNPTkZJR1tn
bnV0bHNdID0gIi1EZ251dGxzPWVuYWJsZWQsLURnbnV0bHM9ZGlzYWJsZWQsZ251dGxzIg0K
PiAgIFBBQ0tBR0VDT05GSUdbb3BlbnNzbF0gPSAiLURvcGVuc3NsPWVuYWJsZWQsLURvcGVu
c3NsPWRpc2FibGVkLG9wZW5zc2wiDQo+IA0KPiANCj4gDQo+IC09LT0tPS09LT0tPS09LT0t
PS09LT0tDQo+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlz
IGdyb3VwLg0KPiBWaWV3L1JlcGx5IE9ubGluZSAoIzE4Njk2OCk6IGh0dHBzOi8vbGlzdHMu
b3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMTg2OTY4DQo+
IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzEw
MTA3MDYyOC8xOTk3OTE0DQo+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25l
ckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS91bnN1YiBbcmFqLmtoZW1A
Z21haWwuY29tXQ0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiANCg==
--------------iFuUAim0erw4SznhuRlMzsgW
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------iFuUAim0erw4SznhuRlMzsgW--

--------------J1T4lYTTWC7t1Z900nlpn5lr--

--------------3OquKxNeKFxVBQP1IMD7cj4b
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZPC/XwUDAAAAAAAKCRC7BTNVkZ0zFC/o
AJsFnzfVf1tyZqBLHhjfF46tpCig8wCgj2QqYs/Q5C9xr8Wtw0dd+NGHmLY=
=iaTy
-----END PGP SIGNATURE-----

--------------3OquKxNeKFxVBQP1IMD7cj4b--

