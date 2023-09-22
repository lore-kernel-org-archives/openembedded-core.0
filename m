Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF4ECE6FE56
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 15:24:48 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.395.1695396283939501314
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 08:24:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MI9K1LsZ;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1c5bf7871dcso19219875ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 08:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695396283; x=1696001083; darn=lists.openembedded.org;
        h=in-reply-to:autocrypt:from:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oUd3eUTz14Vo9x1a/iXu20Bb1c1vJ6M/+te4Xhn3rk=;
        b=MI9K1LsZBJEJWaKkHypk+dHHLKFGDoCVCtFYBg8eClNGRNufP8rfUtnasWFGAs5u/S
         wh0Cwj2ZxCPaPqvisGwYYdks2U0eeyDx0Kc7eKVmOQMVzMEt65Ajbmpn1cOjH3Wobro8
         j1cu3s9TtKKfTqDCuIh9X8z29pzonVxgg2mjKyEUvKUCkzL5xU3r9OKLSnbDNwmzINKo
         f01MBt3XZY3h5CLYA/sxUmXO/U+uP6QKiPgVph+wuRpTaGVGJmWZNioC95dcEjqpSb7r
         kd3a/VL4DT5odhLkFr4VQq8+FBHvBQ+VBE3p1PN4TVDWGue1gCVtO7hJmFMysAcNKxdv
         6GJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695396283; x=1696001083;
        h=in-reply-to:autocrypt:from:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7oUd3eUTz14Vo9x1a/iXu20Bb1c1vJ6M/+te4Xhn3rk=;
        b=ScCmNzS2NF2qLRRuTLVxC610NxIsg4eoDt71QFmRIxHUF00b+/s7qtnwZfP751VZpZ
         9uL/eEhFGEkcTD068UkHxX3q9WmJN7O2TKjRx9gK6w6hJ5e7C3HolTMIoRVIT+wJftVQ
         6VaSPc4vuTph1C+9PUrKb5xwFKt75BhXj+LXNsmzeMVgVJMAwoXbkctWE5uLY+yZF74Y
         +n2TGmIpL4p1+ywBD4Actpe+6g8eYhDF/cwnT2pkaKrGckxiYWUae8o+9y+A1KklB55Z
         5+V75irGDcHgsSkbzt7yu60Dn++KwWgTXRS+6Qot44+Cq+OWdYJSC2xMlU8BRMB10m3m
         cf+w==
X-Gm-Message-State: AOJu0Ywt5Tja+p7IfgU0d6j+cT3zm2BepEFBUT4urRG3oqSEA/yyDvT4
	6vKIG5Ksm2IAX/FxhBmTIcWKbcjPyY9I0A==
X-Google-Smtp-Source: AGHT+IG2m0Iz0l2SRBt8eX/1TCzSTtDUXWDUiVjvaV1OElWltWSIB/KjQCVGNUTFA8fjelgS2FKP4g==
X-Received: by 2002:a17:903:22c3:b0:1c5:f1fd:5da with SMTP id y3-20020a17090322c300b001c5f1fd05damr604665plg.2.1695396283294;
        Fri, 22 Sep 2023 08:24:43 -0700 (PDT)
Received: from ?IPV6:2601:646:9100:2cb0:68a7:e86e:d0e8:e1f2? ([2601:646:9100:2cb0:68a7:e86e:d0e8:e1f2])
        by smtp.gmail.com with ESMTPSA id jk23-20020a170903331700b001bb04755212sm3608573plb.228.2023.09.22.08.24.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Sep 2023 08:24:42 -0700 (PDT)
Message-ID: <6a999a75-fec2-4ee6-bd9b-e5bc4f23a069@gmail.com>
Date: Fri, 22 Sep 2023 08:24:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 06/17] python3-click: Copy recipe from
 meta-python
Content-Language: en-US
To: Samantha Jalabert <samantha.jalabert@syslinbit.com>,
 openembedded-core@lists.openembedded.org, mrybczynska@syslinbit.com,
 leon.anavi@konsulko.com, wangmy@fujitsu.com, zhengrq.fnst@fujitsu.com
References: <20230922144628.2495839-1-samantha.jalabert@syslinbit.com>
 <20230922144628.2495839-7-samantha.jalabert@syslinbit.com>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <20230922144628.2495839-7-samantha.jalabert@syslinbit.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------TejQ0N3LPeP4HhrjEAskkB4J"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 15:24:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188123

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------TejQ0N3LPeP4HhrjEAskkB4J
Content-Type: multipart/mixed; boundary="------------0h6Lh8nvxlVkRBI6Jw2bT18w";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Samantha Jalabert <samantha.jalabert@syslinbit.com>,
 openembedded-core@lists.openembedded.org, mrybczynska@syslinbit.com,
 leon.anavi@konsulko.com, wangmy@fujitsu.com, zhengrq.fnst@fujitsu.com
Message-ID: <6a999a75-fec2-4ee6-bd9b-e5bc4f23a069@gmail.com>
Subject: Re: [OE-core] [PATCH 06/17] python3-click: Copy recipe from
 meta-python
References: <20230922144628.2495839-1-samantha.jalabert@syslinbit.com>
 <20230922144628.2495839-7-samantha.jalabert@syslinbit.com>
In-Reply-To: <20230922144628.2495839-7-samantha.jalabert@syslinbit.com>

--------------0h6Lh8nvxlVkRBI6Jw2bT18w
Content-Type: multipart/mixed; boundary="------------tlK60IP8EldZNmNsOB1Rt4nV"

--------------tlK60IP8EldZNmNsOB1Rt4nV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gOS8yMi8yMyA3OjQ2IEFNLCBTYW1hbnRoYSBKYWxhYmVydCB3cm90ZToNCj4gRnJvbTog
U2FtYW50aGEgSmFsYWJlcnQgPHNhbWFudGhhLmphbGFiZXJ0QHN5c2xpbmJpdC5jb20+DQo+
IA0KPiBjb21taXQ6IDFhMTRhMjhmMTMyYTEwZTlkYjdiM2U1YmIyYjUzNjFjNDY3OTk0NmUN
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hcnRhIFJ5YmN6eW5za2EgPG1yeWJjenluc2thQHN5
c2xpbmJpdC5jb20+DQoNClBsZWFzZSBzZW5kIGEgcmVtb3ZhbCBwYXRjaCBmb3IgbWV0YS1w
eXRob24gYXMgd2VsbC4gU28gd2UgY2FuIGtlZXAgDQpwYXNzaW5nIHRoZSB5cCBjb21wYXQg
Y2hlY2tzIGZvciBtZXRhLW9wZW5lbWJlZGRlZCBvbiBBQiBhbmQgY29vcmRpbmF0ZSANCnRo
ZSBjaGFuZ2UgYmV0d2VlbiBtZXRhLXB5dGhvbiBhbmQgb2UtY29yZQ0KDQo+IC0tLQ0KPiAg
IC4uLi9weXRob24vcHl0aG9uMy1jbGljay9ydW4tcHRlc3QgICAgICAgICAgICB8ICAzICsr
DQo+ICAgLi4uL3B5dGhvbi9weXRob24zLWNsaWNrXzguMS43LmJiICAgICAgICAgICAgIHwg
MzkgKysrKysrKysrKysrKysrKysrKw0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0
aW9ucygrKQ0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtY2xpY2svcnVuLXB0ZXN0DQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jbGlja184LjEuNy5iYg0K
PiANCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1jbGljay9ydW4tcHRlc3QgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtY2xpY2svcnVuLXB0ZXN0DQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAw
MDAwMDAwMDAuLmI2M2M0ZGUwZDkNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2xpY2svcnVuLXB0ZXN0DQo+IEBAIC0w
LDAgKzEsMyBAQA0KPiArIyEvYmluL3NoDQo+ICsNCj4gK3B5dGVzdCAtbyBsb2dfY2xpPXRy
dWUgLW8gbG9nX2NsaV9sZXZlbD1JTkZPIHwgc2VkIC1lICdzL1xbLi4uJVxdLy9nJ3wgc2Vk
IC1lICdzL1BBU1NFRC9QQVNTL2cnfCBzZWQgLWUgJ3MvRkFJTEVEL0ZBSUwvZyd8c2VkIC1l
ICdzL1NLSVBQRUQvU0tJUC9nJ3wgYXdrICd7aWYgKCRORj09IlBBU1MiIHx8ICRORj09IkZB
SUwiIHx8ICRORj09IlNLSVAiIHx8ICRORj09IlhGQUlMIiB8fCAkTkY9PSJYUEFTUyIpe3By
aW50ZiAiJXM6ICVzXG4iLCAkTkYsICQwfWVsc2V7cHJpbnR9fSd8IGF3ayAne2lmICgkTkY9
PSJQQVNTIiB8fCAkTkY9PSJGQUlMIiB8fCAkTkY9PSJTS0lQIiB8fCAkTkY9PSJYRkFJTCIg
fHwgJE5GPT0iWFBBU1MiKSB7JE5GPSIiO3ByaW50ICQwfWVsc2V7cHJpbnR9fScNCj4gZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jbGlja184
LjEuNy5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jbGlja184
LjEuNy5iYg0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwLi5h
NGVjNmNkMWVmDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWNsaWNrXzguMS43LmJiDQo+IEBAIC0wLDAgKzEsMzkgQEAN
Cj4gK1NVTU1BUlkgPSAiQSBzaW1wbGUgd3JhcHBlciBhcm91bmQgb3B0cGFyc2UgZm9yIHBv
d2VyZnVsIGNvbW1hbmQgbGluZSB1dGlsaXRpZXMuIg0KPiArREVTQ1JJUFRJT04gPSAiXA0K
PiArQ2xpY2sgaXMgYSBQeXRob24gcGFja2FnZSBmb3IgY3JlYXRpbmcgYmVhdXRpZnVsIGNv
bW1hbmQgbGluZSBpbnRlcmZhY2VzIFwNCj4gK2luIGEgY29tcG9zYWJsZSB3YXkgd2l0aCBh
cyBsaXR0bGUgY29kZSBhcyBuZWNlc3NhcnkuIEl0J3MgdGhlICJDb21tYW5kIFwNCj4gK0xp
bmUgSW50ZXJmYWNlIENyZWF0aW9uIEtpdCIuIEl0J3MgaGlnaGx5IGNvbmZpZ3VyYWJsZSBi
dXQgY29tZXMgd2l0aCBcDQo+ICtzZW5zaWJsZSBkZWZhdWx0cyBvdXQgb2YgdGhlIGJveC4i
DQo+ICtIT01FUEFHRSA9ICJodHRwOi8vY2xpY2sucG9jb28ub3JnLyINCj4gK0xJQ0VOU0Ug
PSAiQlNELTMtQ2xhdXNlIg0KPiArTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5T
RS5yc3Q7bWQ1PTFmYTk4MjMyZmQ2NDU2MDg5MzdhMGZkYzgyZTk5OWI4Ig0KPiArDQo+ICtT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiY2E5ODUzYWQ0NTllNzg3ZTIxOTIyMTE1NzhjYzkwN2U3
NTk0ZTI5NGM3Y2NjODM0MzEwNzIyYjQxYjljYTZkZSINCj4gKw0KPiAraW5oZXJpdCBweXBp
IHNldHVwdG9vbHMzIHB0ZXN0DQo+ICsNCj4gK1NSQ19VUkkgKz0gImZpbGU6Ly9ydW4tcHRl
c3QiDQo+ICsNCj4gK1JERVBFTkRTOiR7UE59LXB0ZXN0ICs9ICIgXA0KPiArCSR7UFlUSE9O
X1BOfS1weXRlc3QgXA0KPiArCSR7UFlUSE9OX1BOfS10ZXJtaW5hbCBcDQo+ICsJJHtQWVRI
T05fUE59LXVuaXhhZG1pbiBcDQo+ICsiDQo+ICsNCj4gK2RvX2luc3RhbGxfcHRlc3QoKSB7
DQo+ICsgICAgaW5zdGFsbCAtZCAke0R9JHtQVEVTVF9QQVRIfS90ZXN0cw0KPiArICAgIGNw
IC1yZiAke1N9L3Rlc3RzLyogJHtEfSR7UFRFU1RfUEFUSH0vdGVzdHMvDQo+ICsgICAgY3Ag
LXJmICR7U30vc2V0dXAuY2ZnICR7RH0ke1BURVNUX1BBVEh9Lw0KPiArICAgIGNwIC1yZiAk
e1N9L2RvY3MgJHtEfSR7UFRFU1RfUEFUSH0vDQo+ICt9DQo+ICsNCj4gK1VQU1RSRUFNX0NI
RUNLX1JFR0VYID0gImNsaWNrLyg/UDxwdmVyPlxkKyhcLlxkKykrKS8iDQo+ICsNCj4gK0NM
RUFOQlJPS0VOID0gIjEiDQo+ICsNCj4gK1JERVBFTkRTOiR7UE59ICs9ICJcDQo+ICsgICAg
JHtQWVRIT05fUE59LWlvIFwNCj4gKyAgICAke1BZVEhPTl9QTn0tdGhyZWFkaW5nIFwNCj4g
KyAgICAiDQo+ICsNCj4gK0JCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayINCj4g
DQo+IA0KPiANCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gTGlua3M6IFlvdSByZWNl
aXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+IFZpZXcvUmVwbHkgT25s
aW5lICgjMTg4MTA5KTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVt
YmVkZGVkLWNvcmUvbWVzc2FnZS8xODgxMDkNCj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczov
L2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTAxNTIyNDk2LzE5OTc5MTQNCj4gR3JvdXAg
T3duZXI6IG9wZW5lbWJlZGRlZC1jb3JlK293bmVyQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcN
Cj4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5l
bWJlZGRlZC1jb3JlL3Vuc3ViIFtyYWoua2hlbUBnbWFpbC5jb21dDQo+IC09LT0tPS09LT0t
PS09LT0tPS09LT0tDQo+IA0K
--------------tlK60IP8EldZNmNsOB1Rt4nV
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------tlK60IP8EldZNmNsOB1Rt4nV--

--------------0h6Lh8nvxlVkRBI6Jw2bT18w--

--------------TejQ0N3LPeP4HhrjEAskkB4J
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZQ2xuQUDAAAAAAAKCRC7BTNVkZ0zFCsR
AJ9aCXHenBOhEEOIyK5ggfWTjMD80QCbBBejFWAUJ2VzDaIX5A3SIPCKKPg=
=eO8W
-----END PGP SIGNATURE-----

--------------TejQ0N3LPeP4HhrjEAskkB4J--

