Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 351D1C369AB
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 01:13:11 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.29891.1745284390619691848
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Apr 2025 18:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OPHKlJ7T;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3f7f7b70aebso2742791b6e.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 18:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745284390; x=1745889190; darn=lists.openembedded.org;
        h=in-reply-to:autocrypt:content-language:references:cc:to:from
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d8lNa6LSgamA397WS6PQhq9IjFwANwxFUH4mCoLW0/Y=;
        b=OPHKlJ7T8+rnczRY/NuAGwP0uS8LkPcef5ySM5hHL7PZo6ccJ6GZYQMAbuy+NZNpVc
         7gbsRHHxN0737JaMe8jxrJ9zUqUzSt6c8TATuOfc5FHdX5fQ9pJgFmpIm9nc9t2ZCzix
         NRSmDrrZWhpc487JfnBqR2o7kU7vAQvBpcT5tRt2hqy5UFR04aO4te9nKsymUO3ttPcO
         kTfB/aWNw4fZLzFDuyD/N6GyJzIJ3sR37bQnVHTr/TK5iGCPuoCheqVsGK9Mt/5jalv7
         +aeh8Dpzys9H2nQX5MpdohdhowWVeQnHKZCBDIO6DdJ6QQhaKezQ+7ZHLRZWwhkqio6b
         Reow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745284390; x=1745889190;
        h=in-reply-to:autocrypt:content-language:references:cc:to:from
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d8lNa6LSgamA397WS6PQhq9IjFwANwxFUH4mCoLW0/Y=;
        b=kSuMZSDh7B0LppLqVdUvEYqCnmHLygiirZA0lKJ+RMarajlmtEASc42tI/kiipyiTO
         cWSJkPvBntUfRFoLoAkmYWdl1W5qFK870NNc12i/IhvlnsZP3K9AAPnhIm32tbNrxFG0
         WFCJXdcKARaCtIpOqvX+oaBnFgaSKNQkj8HdDYNdc4xraAUkqmSpyWXe1QemwUxz6rGK
         m4Zoo9et9xEUeCZOr11aHrp2Gug1Dxkrj7jZ1gwUJjkE6s8XfiXdI5f/Y+aKYcu3xq2a
         LKC2TNGPbfyOrhi3LtLm+LwDv0m7EqTs7Ak210Kowm8ZCRdAHdGkR7qTCpRoHKgzCOrr
         VAAg==
X-Gm-Message-State: AOJu0YzRKHY644kxwzXq/a5iyLbdT9ZagrSwMROKWsyqzoLY6OvPD8uq
	wC8x99eGS6Y1Rc4LwFRr6bNPbu4paPbN1GfdEOHU8NqGkU+ea8yh
X-Gm-Gg: ASbGncsdW2YdHDKtcidGMO0w1YR8VHqDVoNaVhK+SZnbVZ09l6NtTQ7ZRZQey4MHbwU
	n+RY5REu2OD+wqpu4jzXWlsPSAty/mbO8OGpZGYT4dJoKkcKxxMIig5bbU1sfZu1NPAm2izKB1/
	QkF/9zwb4iT+rmZDKGhqQuR1UnAw66i9A00L8fKckd4kQCIzih8vFrtuz6f/2K5YqfY2YYOpuVo
	fFVUPzEBMdAV7eb6Mwn+naseIG90Hd4PiNGVZ4QGPpGUSoQEAXSArJ/UerGilYluEbfsmMKNvsL
	aD65QpHbAlcAsH7XFTWZNhR1471T1DRSVpI3I/ZmLoptHOK58gTsibdkhatlg3Tetvmp9THb+Zn
	e7rC4nkR1ywaQWTGgyK+TVIHvS4Se
X-Google-Smtp-Source: AGHT+IHjOMvadJyv3Cw6X6+bc2+mvZakVXdohoHOcoYNRLFIj4qLfu/1yh7CCTDgzAantKyNqKBCFQ==
X-Received: by 2002:a05:6808:4c07:b0:3f6:a6a8:d340 with SMTP id 5614622812f47-401c0a7fd7emr6504189b6e.16.1745284389686;
        Mon, 21 Apr 2025 18:13:09 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:ad41:4c38:54f5:31e3? ([2601:646:8201:fd20:ad41:4c38:54f5:31e3])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-401bf081e80sm1812525b6e.37.2025.04.21.18.13.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 18:13:09 -0700 (PDT)
Message-ID: <9e5acb26-15d0-449f-a122-1d3ec3d99ef7@gmail.com>
Date: Mon, 21 Apr 2025 18:13:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 0/3] mesa: small improvements after 25.0
 merge
From: Khem Raj <raj.khem@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250418-mesa-25-fixes-v2-0-e110ccfe291f@oss.qualcomm.com>
 <CAMKF1sr5VLmBKmrr8Q05C7aaZi6OK7JHS9DKEZyKo4eihnusgg@mail.gmail.com>
 <CAO9ioeU8zhRVX_BgB3Pp_psH49gJt+jeE92TcfrZZoaL-HjUiA@mail.gmail.com>
 <c5d578d2-2fbf-4a47-bdee-d72ac623708b@gmail.com>
Content-Language: en-US
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <c5d578d2-2fbf-4a47-bdee-d72ac623708b@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NqmVub1n8NyM0Wyd30ixusM3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 01:13:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215190

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NqmVub1n8NyM0Wyd30ixusM3
Content-Type: multipart/mixed; boundary="------------lUXmWfgtjov1h9DrRMCLqCdJ";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Message-ID: <9e5acb26-15d0-449f-a122-1d3ec3d99ef7@gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/3] mesa: small improvements after 25.0
 merge
References: <20250418-mesa-25-fixes-v2-0-e110ccfe291f@oss.qualcomm.com>
 <CAMKF1sr5VLmBKmrr8Q05C7aaZi6OK7JHS9DKEZyKo4eihnusgg@mail.gmail.com>
 <CAO9ioeU8zhRVX_BgB3Pp_psH49gJt+jeE92TcfrZZoaL-HjUiA@mail.gmail.com>
 <c5d578d2-2fbf-4a47-bdee-d72ac623708b@gmail.com>
In-Reply-To: <c5d578d2-2fbf-4a47-bdee-d72ac623708b@gmail.com>

--------------lUXmWfgtjov1h9DrRMCLqCdJ
Content-Type: multipart/mixed; boundary="------------5r4cXMxU0pvv4RNsqF7HPNZR"

--------------5r4cXMxU0pvv4RNsqF7HPNZR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC8yMS8yNSA1OjIwIFBNLCBLaGVtIFJhaiB3cm90ZToNCj4gT24gNC8yMS8yNSAxMjoz
MiBQTSwgRG1pdHJ5IEJhcnlzaGtvdiB3cm90ZToNCj4+IE9uIE1vbiwgMjEgQXByIDIwMjUg
YXQgMTg6MjIsIEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+IHdyb3RlOg0KPj4+DQo+
Pj4gSGkgRG1pdHJ5DQo+Pj4NCj4+PiBJIGhhdmUgcGlja2VkIHRoZXNlIHBhdGNoIGludG8g
Y2xhbmctbWVyZ2UtMiBicmFuY2guDQo+Pj4NCj4+PiBodHRwczovL3dlYi5naXQueW9jdG9w
cm9qZWN0Lm9yZy9wb2t5LWNvbnRyaWIvbG9nLz9oPWtyYWovY2xhbmctbWVyZ2UtMg0KPj4+
DQo+Pj4gVGhleSBoZWxwIHdpdGggc29tZSBtZXNhLW5hdGl2ZSBidWlsZCBmYWlsdXJlcyBo
b3dldmVyLCBJIGFtIHN0aWxsDQo+Pj4gc2VlaW5nIGEgYnVpbGQgZmFpbHVyZSBidWlsZCBt
ZXNhLW5hdGl2ZQ0KPj4+IG9uIG11c2wgdGFyZ2V0cy4gSSBhbSBub3Qgc3VyZSB3aHkgdGFy
Z2V0IHNob3VsZCBtYXR0ZXIgYnV0IGl0IHNlZW1zDQo+Pj4gdG8gc2VlIHRoZSBlcnJvcg0K
Pj4NCj4+IE5vdGUsIHRoZSBlcnJvciBpcyBhYm91dCAncmVxdWlyZWQgZmlsZScsIGl0IHVz
dWFsbHkgbWVhbnMgdGhhdCB0aGUNCj4+IGR5bmFtaWMgbG9hZGVyIGlzIG5vdCBmb3VuZC4N
Cj4+IEknbGwgdHJ5IHJlcHJvZHVjaW5nIGl0IGxvY2FsbHkuDQo+Pg0KPj4+DQo+Pj4gaHR0
cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMv
MTExL2J1aWxkcy8xNTANCj4+Pg0KPj4+IEVycm9yIGlzIHRoYXQgbWVzYV9jbGMgaXMgbm90
IGF2YWlsYWJsZSBiZWZvcmUgaXRzIHVzZS4gSW50ZXJlc3RpbmdseSwNCj4+PiBpdCBuZXZl
ciBmYWlscyBsb2NhbGx5IGhlcmUgYnV0IGl0IGFsd2F5cyBmYWlscyBvbiBBQi4gSXMgdGhl
cmUgc29tZQ0KPj4+IHNvcnQgb2YgYnVpbGQgcmFjZSBvciBzb21ldGhpbmcgZWxzZSBnb2lu
ZyBvbj8NCj4+DQo+PiBBbmQgdGhpcyBpcyB1c3VhbGx5IGJlY2F1c2UgdGhlcmUgd2FzIGEg
dW5pbmF0aXZlLWVuYWJsZWQgYnVpbGQgaW4NCj4+IHNzdGF0ZSBjYWNoZSB3aGljaCBpcyBu
b3cgYmVpbmcgcmV1c2VkIGZvciB0aGUgbm9uLXVuaW5hdGl2ZS4NCj4+IExldCdzIHNlZSBp
ZiBJIGNhbiByZXByb2R1Y2UgaXQuLi4NCj4gDQo+IEl0cyBpbiByaWdodCBkaXJlY3Rpb24s
IEkgY291bGQgZ2V0IHRoZSBpbmZvcm1hdGlvbiBmcm9tIHRoZSB3b3JrZXIgbWFjaGluZQ0K
PiANCj4gYnVpbGQtcmVuYW1lZC90bXAvd29yay94ODZfNjQtbGludXgvbWVzYS1uYXRpdmUv
MjUuMC4yJCAuL2J1aWxkL3NyYy8gDQo+IGNvbXBpbGVyL2NsYy9tZXNhX2NsYw0KPiAtYmFz
aDogLi9idWlsZC9zcmMvY29tcGlsZXIvY2xjL21lc2FfY2xjOiBjYW5ub3QgZXhlY3V0ZTog
cmVxdWlyZWQgZmlsZSANCj4gbm90IGZvdW5kDQo+IA0KPiBpZiBkdW1wIHRoZSBFTEYgaGVh
ZGVycyBpdCBsb29rcyBmb3IgaW50ZXJwcmV0ZXIgZnJvbSBhIHVuaW5hdGl2ZSBwYXRoDQo+
IHdoaWNoIGlzIGFic29sdXRlIGFuZCBwb2ludHMgdG8gdGhlIGxvY2F0aW9uIHdoZXJlIGl0
IHdhcyBidWlsdCBpbiANCj4gYW5vdGhlciBidWlsZA0KPiANCj4gIMKgwqDCoMKgwqAgW1Jl
cXVlc3RpbmcgcHJvZ3JhbSBpbnRlcnByZXRlcjogL3Nydi9wb2t5YnVpbGQveW9jdG8td29y
a2VyLyANCj4gbWV0YS1vZS9idWlsZC9idWlsZC90bXAvc3lzcm9vdHMtdW5pbmF0aXZlL3g4
Nl82NC1saW51eC9saWIvbGQtbGludXgtIA0KPiB4ODYtNjQuc28uMl0NCj4gDQo+IFRoaXMg
ZmlsZSBkb2VzIG5vdCBleGlzdCBpbiBjdXJyZW50IGJ1aWxkLg0KDQpJIHRoaW5rIEkgZ290
IHRoZSBwcm9ibGVtLCBpdHMgbGRmbGFncyBiZWluZyBpbmplY3RlZCBmcm9tIGxsdm0tY29u
ZmlnIA0KY29udGFpbmluZyB0aGUgYnVpbGR0aW1lIHBhdGhzIHdoZXJlIGxsdm0vY2xhbmct
bmF0aXZlIHdhcyBidWlsdCBpbiwgeW91IA0KaGF2ZSBzZW50IGEgcGF0Y2ggdG8gZml4IGl0
IHdoaWNoIGlzIGFscmVhZHkgYXBwbGllZCB0byBjb3JlLCBJIG1pc3NlZCANCmFwcGx5aW5n
IGl0IHRvIGNsYW5nIDooLiBJIGhhdmUgYXBwbGllZCBpdCB0byBhbGwgY2xhbmcgdmFyaWFu
dHMgc2luY2UgDQp3ZSB1c2Ugc2hhcmVkIHNvdXJjZXMgZm9yIGFsbCBjbGFuZyByZWNpcGVz
LCB3ZSBuZWVkIHRvIGtlZXAgc291cmNlIHRyZWUgDQppbiBzeW5jIGZvciBhbGwgb2YgdGhl
bSwgYWxzbyBwdXNoZWQgaXQgaW50byB0aGUga3Jhai9jbGFuZy1tZXJnZS0yIA0KYnJhbmNo
IG5vdy4gSSB0aGluayB0aGlzIHNob3VsZCBnZXQgdXMgdGhyb3VnaCB0aGlzIGJ1bXAuDQoN
CldvdWxkIGJlIGdvb2QsIHRvIGdldCBzb21lIG1vcmUgZmVlZGJhY2sgb24gaG93IGl0IHBs
YXlzIG91dCBpbiB5b3VyIA0KdGVzdGluZy4NCg0KPiANCj4gDQo+Pg0KPj4+IFdvdWxkIGFw
cHJlY2lhdGUgaGVscC4NCj4+Pg0KPj4+IE9uIFRodSwgQXByIDE3LCAyMDI1IGF0IDU6NTfi
gK9QTSBEbWl0cnkgQmFyeXNoa292IHZpYQ0KPj4+IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcN
Cj4+PiA8ZG1pdHJ5LmJhcnlzaGtvdj1vc3MucXVhbGNvbW0uY29tQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc+IHdyb3RlOg0KPj4+Pg0KPj4+PiBTZXZlcmFsIGJ1Z2ZpeGVzIGFmdGVyIE1l
c2EgMjUuMCByZWNpcGUgd2FzIG1lcmdlZDoNCj4+Pj4gLSBSZXBsYWNlIHRoZSBiaW5kZ2Vu
IHBhdGNoZXMgd2l0aCBtZXNvbi1iYXNlZCBmaXggKER5bGFuIEJha2VyKQ0KPj4+PiAtIEJ1
bmRsZSBPcGVuQ0wgQyBoZWFkZXJzDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IERtaXRy
eSBCYXJ5c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZAb3NzLnF1YWxjb21tLmNvbT4NCj4+Pj4g
LS0tDQo+Pj4+IENoYW5nZXMgaW4gdjI6DQo+Pj4+IC0gRHJvcHBlZCBhcHBsaWVkIHBhdGNo
ZXMNCj4+Pj4gLSBBZGQgdGhlIGJ1bmRsZS1vcGVuY2wtaGVhZGVycyBwYXRjaA0KPj4+PiAt
IExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA0MTItbWVzYS0y
NS1maXhlcy0gDQo+Pj4+IHYxLTAtNzkxODQwMzkxMjcxQG9zcy5xdWFsY29tbS5jb20NCj4+
Pj4NCj4+Pj4gLS0tDQo+Pj4+IERtaXRyeSBCYXJ5c2hrb3YgKDMpOg0KPj4+PiDCoMKgwqDC
oMKgwqAgbWVzb246IHBhc3MgLXRhcmdldCBhbmQgLUkgdG8gYmluZGdlbiBjYWxscw0KPj4+
PiDCoMKgwqDCoMKgwqAgbWVzYTogZHJvcCB0aGUgYmluZGdlbiBwYXRjaA0KPj4+PiDCoMKg
wqDCoMKgwqAgbWVzYTogYnVuZGxlIENsYW5nIE9wZW5DTCBoZWFkZXJzIGludG8gbWV0YS1j
bGMNCj4+Pj4NCj4+Pj4gwqAgbWV0YS9jbGFzc2VzLXJlY2lwZS9tZXNvbi5iYmNsYXNzwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMSArDQo+Pj4+IMKgIC4uLmQt
YW4tb3B0aW9uLXRvLWZvcmNlLWluY2x1c2lvbi1vZi1PcGVuQ0wtLnBhdGNoIHwgNTcgKysr
KysrKysrKyANCj4+Pj4gKysrKysrKysNCj4+Pj4gwqAgLi4udmlkZS1jcm9zcy1jb21waWxh
dGlvbi1hcmd1bWVudHMtdG8tTExWTS0ucGF0Y2ggfCA2NyANCj4+Pj4gLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQ0KPj4+PiDCoCBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNhLmlu
Y8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgOSArLS0NCj4+Pj4gwqAgNCBm
aWxlcyBjaGFuZ2VkLCA2MSBpbnNlcnRpb25zKCspLCA3MyBkZWxldGlvbnMoLSkNCj4+Pj4g
LS0tDQo+Pj4+IGJhc2UtY29tbWl0OiA1M2M3NzJjOTQxZDVjZTY5YWI4OWYzNWNkMDQ3MjRi
NzQwZGFmMjY5DQo+Pj4+IGNoYW5nZS1pZDogMjAyNTA0MTEtbWVzYS0yNS1maXhlcy01YTM4
ZmU1NWRkM2MNCj4+Pj4NCj4+Pj4gQmVzdCByZWdhcmRzLA0KPj4+PiAtLSANCj4+Pj4gRG1p
dHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5LmJhcnlzaGtvdkBvc3MucXVhbGNvbW0uY29tPg0KPj4+
Pg0KPj4+Pg0KPj4+PiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPj4+PiBMaW5rczogWW91
IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4+Pj4gVmlldy9S
ZXBseSBPbmxpbmUgKCMyMTUxMTUpOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcv
Zy8gDQo+Pj4+IG9wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMjE1MTE1DQo+Pj4+IE11dGUg
VGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzExMjMyNDU0
NC8xOTk3OTE0DQo+Pj4+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+Pj4+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtY29yZS8gDQo+Pj4+IHVuc3ViIFty
YWoua2hlbUBnbWFpbC5jb21dDQo+Pj4+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+Pj4+
DQo+Pg0KPj4NCj4+DQo=
--------------5r4cXMxU0pvv4RNsqF7HPNZR
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

--------------5r4cXMxU0pvv4RNsqF7HPNZR--

--------------lUXmWfgtjov1h9DrRMCLqCdJ--

--------------NqmVub1n8NyM0Wyd30ixusM3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCaAbtJAUDAAAAAAAKCRC7BTNVkZ0zFIrv
AJ90ZM7HXs8KfJDOYpas29Xu3D42WwCeIg/FAEp6Y+aFdQ+3IV+PROmWCxQ=
=Vie4
-----END PGP SIGNATURE-----

--------------NqmVub1n8NyM0Wyd30ixusM3--

