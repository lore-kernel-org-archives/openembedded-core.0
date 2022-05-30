Return-Path: <kristian.amlie@northern.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 305CCC433EF
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 11:47:10 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web12.36089.1653911228282940268
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 04:47:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@northern.tech header.s=google header.b=H1ps2qtV;
 spf=pass (domain: northern.tech, ip: 209.85.167.53,
 mailfrom: kristian.amlie@northern.tech)
Received: by mail-lf1-f53.google.com with SMTP id l13so16262844lfp.11
        for <Openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 04:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=northern.tech; s=google;
        h=message-id:date:mime-version:user-agent:content-language:to
         :references:from:subject:in-reply-to;
        bh=h52o5rRJg+bmx+bVGODzAJemRpyn6oSETr6Pi+Tzwag=;
        b=H1ps2qtVyTLkDYWpdxfPebNhqfollDeVh7x6sRco7Q7vxMStOnE65nPr+NCxwezz/j
         UOYQzvJH+bI83JsUwWvu7MgHbGl9IhnuQMjeBx8bD0i7R89A2QniXn4R07OJMv89kREp
         qXMbX+siGJpEMG0/txvSYmDKISXoazTJm53RLrHH1TOMRMuEtBcUdcTfCzwGjkCZk7cn
         Za/W/usTZUQLpotoIOzAtrcyGJlluZ6TGDKAnVdUuiyuE+or+8Yo9Sb7kHA9QB6YC6N5
         Rwe4PLNlFDSqkpor94jQ8I+J1ZPPbte+1qUJEbS7w8DoFEBXwLDYB6AuWvm2/muRwKoo
         iQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:references:from:subject:in-reply-to;
        bh=h52o5rRJg+bmx+bVGODzAJemRpyn6oSETr6Pi+Tzwag=;
        b=AlN+Oktr0aKVkBvjrEfQSTLzehMYbpFFjGAXbITPQT9AhXjwH+8E7bQsnMLPRr91nU
         SV3VrXEylnU9/UkCQzLYrVAvpYOSlB47uTLzUaEmIyA/r+6nEqqjC6jV8k9YCjLknh9d
         xqquJB9EieXc0OtRbYxQh/9uBUt+5pl+ExL2ldqYxRrw3xi5WPUpMMJ85ZApNcGmcq7O
         h96wnGLOCESh18ZRhPuF5+HK7aj1X906s6WWxyx1+hbJvkrIULNEzlwbr6mSNoEfK17k
         y6S3pe2604EV903vGDIhJCCC+gq2L5QBGDsFj7PPhdZy2u10Tv9UJtM3bKvfdiFiWMbr
         ++cQ==
X-Gm-Message-State: AOAM532bMzWZx5Ohnha/qtdOk+LMpGx6158OsIKgG/AONtHJ6Nvw5YPu
	GykxJkic6wgirOaGP23WA8vItQ==
X-Google-Smtp-Source: 
 ABdhPJx9R+9FozkX0Z6aiXaI/qV8hC+nYjz8bljf4q2/bHGpqJECBUrWD0yvaN49VUiCnyRbGdmkWw==
X-Received: by 2002:a05:6512:3981:b0:478:54e2:7003 with SMTP id
 j1-20020a056512398100b0047854e27003mr34787255lfu.416.1653911226286;
        Mon, 30 May 2022 04:47:06 -0700 (PDT)
Received: from [10.180.37.36] ([45.153.104.1])
        by smtp.googlemail.com with ESMTPSA id
 r4-20020a2e8e24000000b00253ebd8805bsm2497548ljk.24.2022.05.30.04.47.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 May 2022 04:47:05 -0700 (PDT)
Message-ID: <fb8c122a-9524-af6f-8b53-489a9a035f74@northern.tech>
Date: Mon, 30 May 2022 13:46:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: richard.purdie@linuxfoundation.org,
 OE-core <Openembedded-core@lists.openembedded.org>
References: <f3eb760d-07f2-b5ca-a425-fc1166be8064@northern.tech>
 <01c18d2c70290294a649df5c8e044b9d680ebf82.camel@linuxfoundation.org>
From: Kristian Amlie <kristian.amlie@northern.tech>
Subject: Re: [OE-core] externalsrc wiping out external source directory
In-Reply-To: 
 <01c18d2c70290294a649df5c8e044b9d680ebf82.camel@linuxfoundation.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5xXrokKHgiLIYEehPS34gs7V"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 11:47:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166281

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5xXrokKHgiLIYEehPS34gs7V
Content-Type: multipart/mixed; boundary="------------bEfkaL7OwB0IwL7RzpzXuoPs";
 protected-headers="v1"
From: Kristian Amlie <kristian.amlie@northern.tech>
To: richard.purdie@linuxfoundation.org,
 OE-core <Openembedded-core@lists.openembedded.org>
Message-ID: <fb8c122a-9524-af6f-8b53-489a9a035f74@northern.tech>
Subject: Re: [OE-core] externalsrc wiping out external source directory
References: <f3eb760d-07f2-b5ca-a425-fc1166be8064@northern.tech>
 <01c18d2c70290294a649df5c8e044b9d680ebf82.camel@linuxfoundation.org>
In-Reply-To: <01c18d2c70290294a649df5c8e044b9d680ebf82.camel@linuxfoundation.org>

--------------bEfkaL7OwB0IwL7RzpzXuoPs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjcvMDUvMjAyMiAxNjoxOSwgcmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9y
ZyB3cm90ZToNCj4gT24gRnJpLCAyMDIyLTA1LTI3IGF0IDE0OjA3ICswMjAwLCBLcmlzdGlh
biBBbWxpZSB2aWENCj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4+IEhleSBh
bGwsDQo+Pg0KPj4gSSBoYXZlIGEgcHJvYmxlbSBvbiBraXJrc3RvbmUgd2hlcmUgdXNpbmcg
dGhlICJleHRlcm5hbHNyYyIgY2xhc3Mgd2lwZXMNCj4+IG91dCB0aGUgZGlyZWN0b3J5IG1l
bnRpb25lZCBpbiBFWFRFUk5BTFNSQywgaW4gb3RoZXIgd29yZHMgbXkgcGVyc29uYWwNCj4+
IGRldmVsb3BtZW50IHJlcG9zaXRvcnkuDQo+Pg0KPj4gSSBoYXZlIHRyYWNlZCBpdCBkb3du
IHRvIHRoZSAiZG9fdW5wYWNrW2NsZWFuZGlyc10iIHZhcmlhYmxlIGZsYWcuIFRoaXMNCj4+
IGZsYWcgaXMgc3VwcG9zZWQgdG8gYmUgcmVtb3ZlZCBoZXJlIFsxXSB3aGVuIHVzaW5nICJl
eHRlcm5hbHNyYyIsIGFuZA0KPj4gaW5kZWVkIEkgaGF2ZSB2ZXJpZmllZCB0aGF0IHRoaXMg
aXMgdGhlIGNhc2UuIEJ1dCB3aGVuIHRoZSBmdW5jdGlvbiBpcw0KPj4gYWJvdXQgdG8gYmUg
ZXhlY3V0ZWQsIHRoZSAiY2xlYW5kaXJzIiB2YXJpYWJsZSBmbGFnIGhhcyBzb21laG93IGJl
ZW4NCj4+IHJlc3RvcmVkIFsyXS4gVGhpcyBjYXVzZXMgdGhlIGRpcmVjdG9yeSB0byBiZSBy
ZW1vdmVkIGFmdGVyIGFsbCwgZGVzcGl0ZQ0KPj4gdGhlIGF0dGVtcHQgYXQgYXZvaWRpbmcg
aXQuDQo+Pg0KPj4gQXQgdGhpcyBwb2ludCBJJ20gYSBiaXQgbG9zdCwgSSBkb24ndCByZWFs
bHkga25vdyB3aGF0IGhhcHBlbnMgYmV0d2Vlbg0KPj4gdGhvc2UgdHdvIHN0ZXBzLiBEb2Vz
IGFueW9uZSBoYXZlIGFueSBpZGVhIHdoYXQgbWlnaHQgYmUgaGFwcGVuaW5nPyBJdA0KPj4g
c291bmRzIGxpa2UgYSBwcmV0dHkgc2VyaW91cyBidWcgdG8gbWUsIHdpcGluZyBvdXQgdGhp
bmdzIGluIHRoZSBob21lDQo+PiBkaXJlY3Rvcnkgb2YgdGhlIHVzZXIuDQo+Pg0KPj4gWzFd
DQo+PiBodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL3Bva3kvdHJlZS9tZXRhL2NsYXNz
ZXMvZXh0ZXJuYWxzcmMuYmJjbGFzcz9oPWtpcmtzdG9uZSNuOTMNCj4+IFsyXQ0KPj4gaHR0
cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9wb2t5L3RyZWUvYml0YmFrZS9saWIvYmIvYnVp
bGQucHk/aD1raXJrc3RvbmUjbjE5MQ0KPiANCj4gVGhhdCBjZXJ0YWlubHkgaXNuJ3Qgc3Vw
cG9zZWQgdG8gaGFwcGVuLiBBcyB5b3Ugc2F5LCB0aGUgY29kZSBpcw0KPiBzdXBwb3NlZCB0
byBkaXNhYmxlIHRoYXQgYW5kIGlzbid0IGJlaGF2aW5nIGFzIGludGVuZGVkLiBJdCBpcyBo
YXJkIHRvDQo+IHNheSBtb3JlIHRob3VnaC4NCj4gDQo+IElzIHRoZXJlIGEgdGVzdCBjYXNl
IHlvdSBjYW4gc2hhcmUgd2l0aCB1cyBzbyB3ZSBjYW4gcmVwcm9kdWNlIHRoZQ0KPiBpc3N1
ZT8gV2l0aG91dCBzb21lIHdheSB0byByZXBsaWNhdGUgb2YgbW9yZSBkZXRhaWxzIG9mIHRo
ZSBlbnZpcm9ubWVudA0KPiB0aGlzIG9jY3VycmVkIGluLCBkZWJ1Z2dpbmcgaXQgd2lsbCBi
ZSB2ZXJ5IGhhcmQuDQoNCkhlcmUncyBhIHdheSB0byByZXByb2R1Y2UgaXQ6DQoNCjEuIFRh
a2UgYW55IHJlY2lwZSwgbGV0J3Mgc2F5IHJlY2lwZXMtY29yZS9idXN5Ym94L2J1c3lib3hf
MS4zNS4wLmJiDQoNCjIuIEFkZCAiaW5oZXJpdCBnbyIgdG8gdGhhdCByZWNpcGUuDQoNCjMu
IEFkZCAnSU5IRVJJVCArPSAiZXh0ZXJuYWxzcmMiJyB0byBsb2NhbC5jb25mLg0KDQo0LiBB
ZGQgJ0VYVEVSTkFMU1JDOnBuLWJ1c3lib3ggPSAiL3RtcC9idXN5Ym94IicgdG8gbG9jYWwu
Y29uZi4NCg0KNS4gUnVuICJta2RpciAtcCAvdG1wL2J1c3lib3gva2VlcCIuDQoNCjYuIFJ1
biAiYml0YmFrZSAtZmMgdW5wYWNrIGJ1c3lib3giLg0KDQo3LiBBZnRlcndhcmRzLCBvYnNl
cnZlIHRoYXQgIi90bXAvYnVzeWJveC9rZWVwIiBoYXMgdmFuaXNoZWQuDQoNClRoZSBrZXkg
cGFydCBoZXJlIGFwcGVhcnMgdG8gYmUgdGhlICJFWFBPUlRfRlVOQ1RJT05TIiBzdGF0ZW1l
bnQgaW5zaWRlIA0KZ28uYmJjbGFzcy4gSWYgImRvX3VucGFjayIgaXMgcmVtb3ZlZCBmcm9t
IHRoZXJlLCB0aGVuIHRoZSBtZWNoYW5pc20gDQp3b3JrcyBjb3JyZWN0bHkgYWdhaW4uDQoN
Ci0tIA0KS3Jpc3RpYW4NCg==

--------------bEfkaL7OwB0IwL7RzpzXuoPs--

--------------5xXrokKHgiLIYEehPS34gs7V
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEENCehelwanxwH18S/9GRAfJlq8D8FAmKUrrMACgkQ9GRAfJlq
8D+weAf/VMCKptBuDD18PKKjzA1mcoES2plBN3KcSlwneb6CnkiKrVL65Nf1C49k
8hvZbbCKAF41ZrE8MM5olEHeH18AAZ8Z7mOFSMGwq2cOTXa2nyo/dW2s6GqBESf/
29u99WMeb6xCL+h6WHcCFXjeY2AjYjtDHMknRB6hXjwj6itzP2mB59kE+F/Hz33u
jBrXcjEkdQ8azig/FNIskMRQ4prEALMvZGxrNIPTEWjFGyAdthO6v40txUTXx5Rr
otAJIVo0fzyBjoutq8Q43R3LhlhCVQuOfH3CcQnMyzz2awElHiXzmqBzE/OT+CTx
Xkj9Zq2b1X8VHWCNtu0n+B3LuCioGA==
=2B82
-----END PGP SIGNATURE-----

--------------5xXrokKHgiLIYEehPS34gs7V--

