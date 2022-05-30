Return-Path: <kristian.amlie@northern.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DBB6C433F5
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 12:32:20 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web08.36040.1653913933498256927
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 05:32:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@northern.tech header.s=google header.b=WqUSnf9o;
 spf=pass (domain: northern.tech, ip: 209.85.208.176,
 mailfrom: kristian.amlie@northern.tech)
Received: by mail-lj1-f176.google.com with SMTP id g12so11387529lja.3
        for <Openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 05:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=northern.tech; s=google;
        h=message-id:date:mime-version:user-agent:content-language:to
         :references:from:subject:in-reply-to;
        bh=LoaXVUCdMI1jf5rPtm4GSu0p8iq7KMiS2zmDTnn0QH0=;
        b=WqUSnf9oGSD/5UO2WM1UDXaLjKEqkEzCEdTLUPiIHi7MGlmX8R5Q+NuV3v+AFXEtp9
         R4zz7DdKTJs84xn0Gv2rT83f7XF91NIaJvCm2BkwGlQ4mLF9mAttO/oUpWOzRY/iHgwY
         4uQ2fW0AwOAKVOvo3vTFHsy14scxOUkvm7geds6hJUaDvUY3L2/4UriQa9t5+Uswg9Dd
         054pLEhTt6pk7K1MN/LiT4MSOIgEh4lEsw4IDJDBbzZU67Fla/UG8iivheLvTZxhlMvd
         SFJAlpMVlMGbWIPBHSnD6fJqgs0H/FifZn9FtfA9ug+dca/reJyySFpSy3aDj7yJr2WO
         Op8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:references:from:subject:in-reply-to;
        bh=LoaXVUCdMI1jf5rPtm4GSu0p8iq7KMiS2zmDTnn0QH0=;
        b=W73NENCHl+4ylbq5mliW+9b+o+kJsITDF6Oaot9TJxVg8aYPPixpNAMjTG+n3FnCfI
         kWFG3ROmPG1vhqMCaSMz1UrSFtHOLB7vyE3jz5pMhk2Wp2UmWfmTemikbGwk688qcwjB
         YzIUxdpnEtkzBtB4mB4z9jUUZBfQEsAxWy9DknfM7/cRu4ckAA46R/Mkv+eB3cPnfOhW
         1nNoPJ5KIf2WIg71puKNSLzzxwlgJ6DhGqcYWlrh+eU8/4ng6H0ROfsQymxCUtKcugdC
         ZBGJl9KFUaNJVqZyaSnikxtz4XHRFp9wHRx+woPKnaT/7wrqwR1+NINeHcF5sIU3lRSM
         qACg==
X-Gm-Message-State: AOAM5337wwA/ddD4O5fu3lUVJiYuB6hM2M4kiWoJOi7Ue/q38Je543ba
	q7UGQHRJff2Us/xRYm1hwD4tDQ==
X-Google-Smtp-Source: 
 ABdhPJzrzbo5KnC+4uDQWUxyUE+nL8c1pWUcPu2fjP4HpcZeeBKbsDSE6d7Zc0aezUIgKUTmFNJbRQ==
X-Received: by 2002:a2e:9c41:0:b0:24f:1074:79c1 with SMTP id
 t1-20020a2e9c41000000b0024f107479c1mr33362246ljj.474.1653913931699;
        Mon, 30 May 2022 05:32:11 -0700 (PDT)
Received: from [10.180.37.36] ([45.153.104.1])
        by smtp.googlemail.com with ESMTPSA id
 f36-20020a0565123b2400b00477ac39d239sm492529lfv.68.2022.05.30.05.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 May 2022 05:32:11 -0700 (PDT)
Message-ID: <ef9a8546-e0a0-b346-cd3b-1a955088c11d@northern.tech>
Date: Mon, 30 May 2022 14:32:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: richard.purdie@linuxfoundation.org,
 OE-core <Openembedded-core@lists.openembedded.org>
References: <f3eb760d-07f2-b5ca-a425-fc1166be8064@northern.tech>
 <01c18d2c70290294a649df5c8e044b9d680ebf82.camel@linuxfoundation.org>
 <fb8c122a-9524-af6f-8b53-489a9a035f74@northern.tech>
 <b5c562b9ef7f999b4c655cc45e8c50a9d472c81f.camel@linuxfoundation.org>
From: Kristian Amlie <kristian.amlie@northern.tech>
Subject: Re: [OE-core] externalsrc wiping out external source directory
In-Reply-To: 
 <b5c562b9ef7f999b4c655cc45e8c50a9d472c81f.camel@linuxfoundation.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yVNB7bFY7LRjsKTlU2PgkZj0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 12:32:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166285

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------yVNB7bFY7LRjsKTlU2PgkZj0
Content-Type: multipart/mixed; boundary="------------2eClqEjhJBr6PsnaukivueI2";
 protected-headers="v1"
From: Kristian Amlie <kristian.amlie@northern.tech>
To: richard.purdie@linuxfoundation.org,
 OE-core <Openembedded-core@lists.openembedded.org>
Message-ID: <ef9a8546-e0a0-b346-cd3b-1a955088c11d@northern.tech>
Subject: Re: [OE-core] externalsrc wiping out external source directory
References: <f3eb760d-07f2-b5ca-a425-fc1166be8064@northern.tech>
 <01c18d2c70290294a649df5c8e044b9d680ebf82.camel@linuxfoundation.org>
 <fb8c122a-9524-af6f-8b53-489a9a035f74@northern.tech>
 <b5c562b9ef7f999b4c655cc45e8c50a9d472c81f.camel@linuxfoundation.org>
In-Reply-To: <b5c562b9ef7f999b4c655cc45e8c50a9d472c81f.camel@linuxfoundation.org>

--------------2eClqEjhJBr6PsnaukivueI2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMzAvMDUvMjAyMiAxMzo0OCwgcmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9y
ZyB3cm90ZToNCj4gT24gTW9uLCAyMDIyLTA1LTMwIGF0IDEzOjQ2ICswMjAwLCBLcmlzdGlh
biBBbWxpZSB3cm90ZToNCj4+IE9uIDI3LzA1LzIwMjIgMTY6MTksIHJpY2hhcmQucHVyZGll
QGxpbnV4Zm91bmRhdGlvbi5vcmcgd3JvdGU6DQo+Pj4gT24gRnJpLCAyMDIyLTA1LTI3IGF0
IDE0OjA3ICswMjAwLCBLcmlzdGlhbiBBbWxpZSB2aWENCj4+PiBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIHdyb3RlOg0KPj4+PiBIZXkgYWxsLA0KPj4+Pg0KPj4+PiBJIGhhdmUgYSBwcm9i
bGVtIG9uIGtpcmtzdG9uZSB3aGVyZSB1c2luZyB0aGUgImV4dGVybmFsc3JjIiBjbGFzcyB3
aXBlcw0KPj4+PiBvdXQgdGhlIGRpcmVjdG9yeSBtZW50aW9uZWQgaW4gRVhURVJOQUxTUkMs
IGluIG90aGVyIHdvcmRzIG15IHBlcnNvbmFsDQo+Pj4+IGRldmVsb3BtZW50IHJlcG9zaXRv
cnkuDQo+Pj4+DQo+Pj4+IEkgaGF2ZSB0cmFjZWQgaXQgZG93biB0byB0aGUgImRvX3VucGFj
a1tjbGVhbmRpcnNdIiB2YXJpYWJsZSBmbGFnLiBUaGlzDQo+Pj4+IGZsYWcgaXMgc3VwcG9z
ZWQgdG8gYmUgcmVtb3ZlZCBoZXJlIFsxXSB3aGVuIHVzaW5nICJleHRlcm5hbHNyYyIsIGFu
ZA0KPj4+PiBpbmRlZWQgSSBoYXZlIHZlcmlmaWVkIHRoYXQgdGhpcyBpcyB0aGUgY2FzZS4g
QnV0IHdoZW4gdGhlIGZ1bmN0aW9uIGlzDQo+Pj4+IGFib3V0IHRvIGJlIGV4ZWN1dGVkLCB0
aGUgImNsZWFuZGlycyIgdmFyaWFibGUgZmxhZyBoYXMgc29tZWhvdyBiZWVuDQo+Pj4+IHJl
c3RvcmVkIFsyXS4gVGhpcyBjYXVzZXMgdGhlIGRpcmVjdG9yeSB0byBiZSByZW1vdmVkIGFm
dGVyIGFsbCwgZGVzcGl0ZQ0KPj4+PiB0aGUgYXR0ZW1wdCBhdCBhdm9pZGluZyBpdC4NCj4+
Pj4NCj4+Pj4gQXQgdGhpcyBwb2ludCBJJ20gYSBiaXQgbG9zdCwgSSBkb24ndCByZWFsbHkg
a25vdyB3aGF0IGhhcHBlbnMgYmV0d2Vlbg0KPj4+PiB0aG9zZSB0d28gc3RlcHMuIERvZXMg
YW55b25lIGhhdmUgYW55IGlkZWEgd2hhdCBtaWdodCBiZSBoYXBwZW5pbmc/IEl0DQo+Pj4+
IHNvdW5kcyBsaWtlIGEgcHJldHR5IHNlcmlvdXMgYnVnIHRvIG1lLCB3aXBpbmcgb3V0IHRo
aW5ncyBpbiB0aGUgaG9tZQ0KPj4+PiBkaXJlY3Rvcnkgb2YgdGhlIHVzZXIuDQo+Pj4+DQo+
Pj4+IFsxXQ0KPj4+PiBodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL3Bva3kvdHJlZS9t
ZXRhL2NsYXNzZXMvZXh0ZXJuYWxzcmMuYmJjbGFzcz9oPWtpcmtzdG9uZSNuOTMNCj4+Pj4g
WzJdDQo+Pj4+IGh0dHBzOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvcG9reS90cmVlL2JpdGJh
a2UvbGliL2JiL2J1aWxkLnB5P2g9a2lya3N0b25lI24xOTENCj4+Pg0KPj4+IFRoYXQgY2Vy
dGFpbmx5IGlzbid0IHN1cHBvc2VkIHRvIGhhcHBlbi4gQXMgeW91IHNheSwgdGhlIGNvZGUg
aXMNCj4+PiBzdXBwb3NlZCB0byBkaXNhYmxlIHRoYXQgYW5kIGlzbid0IGJlaGF2aW5nIGFz
IGludGVuZGVkLiBJdCBpcyBoYXJkIHRvDQo+Pj4gc2F5IG1vcmUgdGhvdWdoLg0KPj4+DQo+
Pj4gSXMgdGhlcmUgYSB0ZXN0IGNhc2UgeW91IGNhbiBzaGFyZSB3aXRoIHVzIHNvIHdlIGNh
biByZXByb2R1Y2UgdGhlDQo+Pj4gaXNzdWU/IFdpdGhvdXQgc29tZSB3YXkgdG8gcmVwbGlj
YXRlIG9mIG1vcmUgZGV0YWlscyBvZiB0aGUgZW52aXJvbm1lbnQNCj4+PiB0aGlzIG9jY3Vy
cmVkIGluLCBkZWJ1Z2dpbmcgaXQgd2lsbCBiZSB2ZXJ5IGhhcmQuDQo+Pg0KPj4gSGVyZSdz
IGEgd2F5IHRvIHJlcHJvZHVjZSBpdDoNCj4+DQo+PiAxLiBUYWtlIGFueSByZWNpcGUsIGxl
dCdzIHNheSByZWNpcGVzLWNvcmUvYnVzeWJveC9idXN5Ym94XzEuMzUuMC5iYg0KPj4NCj4+
IDIuIEFkZCAiaW5oZXJpdCBnbyIgdG8gdGhhdCByZWNpcGUuDQo+Pg0KPj4gMy4gQWRkICdJ
TkhFUklUICs9ICJleHRlcm5hbHNyYyInIHRvIGxvY2FsLmNvbmYuDQo+Pg0KPj4gNC4gQWRk
ICdFWFRFUk5BTFNSQzpwbi1idXN5Ym94ID0gIi90bXAvYnVzeWJveCInIHRvIGxvY2FsLmNv
bmYuDQo+Pg0KPj4gNS4gUnVuICJta2RpciAtcCAvdG1wL2J1c3lib3gva2VlcCIuDQo+Pg0K
Pj4gNi4gUnVuICJiaXRiYWtlIC1mYyB1bnBhY2sgYnVzeWJveCIuDQo+Pg0KPj4gNy4gQWZ0
ZXJ3YXJkcywgb2JzZXJ2ZSB0aGF0ICIvdG1wL2J1c3lib3gva2VlcCIgaGFzIHZhbmlzaGVk
Lg0KPj4NCj4+IFRoZSBrZXkgcGFydCBoZXJlIGFwcGVhcnMgdG8gYmUgdGhlICJFWFBPUlRf
RlVOQ1RJT05TIiBzdGF0ZW1lbnQgaW5zaWRlDQo+PiBnby5iYmNsYXNzLiBJZiAiZG9fdW5w
YWNrIiBpcyByZW1vdmVkIGZyb20gdGhlcmUsIHRoZW4gdGhlIG1lY2hhbmlzbQ0KPj4gd29y
a3MgY29ycmVjdGx5IGFnYWluLg0KPiANCj4gVGhhbmtzLCBhIHJlcHJvZHVjZXIgaGVscHMg
YSBsb3QuIFRoaXMgd2FzIGFsbW9zdCBjZXJ0YWlubHkgYSByZXN1bHQNCj4gb2Y6DQo+IA0K
PiBodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL3Bva3kvY29tbWl0Lz9pZD03M2ZhODU1
ZjZhZjVlZjljM2E3ODY1NmFhNTZmMDlkMjEzNjAxYmUyDQoNCkluZGVlZCwgYnV0IHRoYXQg
c2VlbXMgdG8gb25seSBoYXZlIHJldmVhbGVkIHRoZSBwcm9ibGVtLiBUaGUgZGVzaXJlZCAN
CmJlaGF2aW9yIGlzIGZvciBjbGVhbmRpcnMgdG8gd29yaywgYnV0ICphbHNvKiBmb3IgZXh0
ZXJuYWxzcmMgdG8gYmUgYWJsZSANCnRvIGRlbGV0ZSBpdCwgcmlnaHQ/DQoNCi0tIA0KS3Jp
c3RpYW4NCg==

--------------2eClqEjhJBr6PsnaukivueI2--

--------------yVNB7bFY7LRjsKTlU2PgkZj0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEENCehelwanxwH18S/9GRAfJlq8D8FAmKUuUoACgkQ9GRAfJlq
8D8aywgAn0m6HHIXU7P8ZDMobcyxH7ilAYlTOs5OVehxo5xssz8H9Zps9H0z0lwT
Cf9dhrSmSpKaHslfasaWFTDiZvZj00dzZD+PZfPSXlcnxLLfkS2JDTuEdZluTHHX
1w8Pm4vej+5CXHf6XiJpDj5LN/iuUPZNQXa/KLj2mz4ohMta8xyaARQ/8v5jaZFj
Hd7jRagHaP0XLhz4+iSJyL9QyZMlKZwG/JXfuKzXa5xLggPWytSqqQBxYKiKDljt
QEX0Lm8LqNKngBAugoH+0ViInsz8bWRQxJFJinVGv/T4AsSzDdL1xAAE/z1i2UT4
AdXEsvAjrtmg2vWm8foYwcN4Shmg6w==
=BIOJ
-----END PGP SIGNATURE-----

--------------yVNB7bFY7LRjsKTlU2PgkZj0--

