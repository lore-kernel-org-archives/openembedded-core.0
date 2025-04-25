Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB203C369D1
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 21:18:21 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web10.1789.1745615901318984273
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Apr 2025 14:18:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GmHuoDs+;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-60658e1fedfso192937eaf.2
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 14:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745615900; x=1746220700; darn=lists.openembedded.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=osAdsgfbC7lOx+dxQjWVmrxQFFbPgUFUKB8pEiV2tKQ=;
        b=GmHuoDs+OvVJRXVUzNl+dxN+2YOBYAHKDvZ1jEyv+PeXWHJWVGePSJ/aiq4d3/Z8p9
         1UzvGdsc1x8sjBfgShs/rger9dzyueBhBGapFzOdV3ED+EUHFyDz9nqGGI0FtbNF91iw
         RHpMmvoW5bFB4dq+6l/XHuo6zTgWnbAkOWmgqkzcrfxP4kGWnuNfn/ME1pCRuFysw9tF
         gO9hs+0lj00NnRBwQ1Kw3K8fqNDYroIVdTiPytYM4+BLP0+DE4zpRfwDWSS1iiL5h3wB
         dM/EjnBalv7ytGr5tcSLv2/KHvtJwX5B1tYX5lZxxB1/Omp4CKHkzjIEIwTTKr0DUhdl
         /EQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745615900; x=1746220700;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=osAdsgfbC7lOx+dxQjWVmrxQFFbPgUFUKB8pEiV2tKQ=;
        b=TpQteM8xi2z8RJbc/SI3uiExA4RYCBSBAmoLgRyHtzWE52JbpKQeVJpCwCnkPZlRae
         6J3cZHYRl7b1Ujq5mSLhyFcwo5olY1DCoMbzUKsIMWALOI2k6Z8HDRNex+lCUK5O1aCg
         r1vopGQ6h8U/BTmZLCBxxTNP2A3eGsAA/sW8q7tzeX12EUh0SfVWuc21E/BkD8Q1XKT2
         5g73ORe2H8HmPtqoDvoYyarwEZ8wy0X22Fl1wrfhNnl5sL0HzI381iMJtEX5Dnli6O7b
         P5/uSN1bYtGpBYmiRUn+BVM8p+CClMyOmXis2F/IM5mDglZ4z8GfJwpxBjWfUY7JtWkN
         SXaw==
X-Gm-Message-State: AOJu0Yz6CTxx6cNsteiEDCMS/j/CZjhikx7vKMQeFShESETnpBqrMP2S
	bvkWzB+1flijwgsaN5DscKcv6mB70SzJ0BY6qZ6s7Fp1IUuG82wpT7uZVi+v
X-Gm-Gg: ASbGncstbFmfY4IhPixmShxDFVIhBtzBiyWTMToY/QoX7n9yYtrgIKKWA/0yuRbiNxz
	FlTm4pDQxnCjWIQM9ZeVquFoBNkS3lv//1Q5L7MRsucBuzHCZ1rpM5znqQrvn3lZ6UI1mUiakf4
	EYVSqbIQDqsWa4uUoZDUj6uor4us69gl9nACy7SAVzaOruiuvC0cKboDPx8nTVYc+x4asXTAyx+
	wmc8ehhg6/xf2WvbuBL3ME/J2ZGiF0rp1t10A2h+WznHN9IzSQwwDmOoAyHjt2Z9Lvp7HUqEjrz
	zqOnn4PcYwtDAO1/1COHRJJR2gw9bjqruybN2Ls45U6L2o882qIyD57FnvigLoPyQDklYVCWgXO
	7JXWOXV92H6+wvzbQE9k5OUtdgVJp
X-Google-Smtp-Source: AGHT+IG6oRsPLYnv8mrM5/pVoE1DJCnfKSdS72qglHloDm0vGirKa22KvI00+XW/RwwDlxz6hyPpSw==
X-Received: by 2002:a05:6820:818b:b0:604:6b0:c259 with SMTP id 006d021491bc7-60652b98b63mr2096431eaf.4.1745615900448;
        Fri, 25 Apr 2025 14:18:20 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:f898:7ed7:5763:ec63? ([2601:646:8201:fd20:f898:7ed7:5763:ec63])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-60646862ee9sm883081eaf.4.2025.04.25.14.18.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 14:18:19 -0700 (PDT)
Message-ID: <dc91ce00-80e7-4bca-8539-9dd39d1d97c0@gmail.com>
Date: Fri, 25 Apr 2025 14:18:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] clang-merge: Bring clang recipes from meta-clang
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org,
 Liu Yiding <liuyd.fnst@fujitsu.com>
References: <20250424-clang-merge-v2-0-0a51d0c1940d@gmail.com>
 <aujf4cdo2qhrzn72sx2ctwnpyckkplkmizzuvkbvm2s7circvr@kv6tiwmj3jwt>
 <ztns5wzhs562l7hsyrludvvinocsppknusdkenmspda3nogsm2@p2iml5ncm3am>
 <hmxfon6u3s3wutu66qxvlm5k7tjlabyytyssvbkk3v6pfrmpxd@4oxiedpyhc7q>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <hmxfon6u3s3wutu66qxvlm5k7tjlabyytyssvbkk3v6pfrmpxd@4oxiedpyhc7q>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------G2fZt2wwxmfHxolDpJvS7DfH"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Apr 2025 21:18:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215497

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------G2fZt2wwxmfHxolDpJvS7DfH
Content-Type: multipart/mixed; boundary="------------G42om6fvAeHfFaHNjhtJ3kPe";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org,
 Liu Yiding <liuyd.fnst@fujitsu.com>
Message-ID: <dc91ce00-80e7-4bca-8539-9dd39d1d97c0@gmail.com>
Subject: Re: [PATCH v2 0/7] clang-merge: Bring clang recipes from meta-clang
References: <20250424-clang-merge-v2-0-0a51d0c1940d@gmail.com>
 <aujf4cdo2qhrzn72sx2ctwnpyckkplkmizzuvkbvm2s7circvr@kv6tiwmj3jwt>
 <ztns5wzhs562l7hsyrludvvinocsppknusdkenmspda3nogsm2@p2iml5ncm3am>
 <hmxfon6u3s3wutu66qxvlm5k7tjlabyytyssvbkk3v6pfrmpxd@4oxiedpyhc7q>
In-Reply-To: <hmxfon6u3s3wutu66qxvlm5k7tjlabyytyssvbkk3v6pfrmpxd@4oxiedpyhc7q>

--------------G42om6fvAeHfFaHNjhtJ3kPe
Content-Type: multipart/mixed; boundary="------------u4u0LVMIJZgbrHFJ0b6DpAEm"

--------------u4u0LVMIJZgbrHFJ0b6DpAEm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC8yNS8yNSA0OjE4IEFNLCBEbWl0cnkgQmFyeXNoa292IHdyb3RlOg0KPiBPbiBGcmks
IEFwciAyNSwgMjAyNSBhdCAwMjowNDo1M1BNICswMzAwLCBEbWl0cnkgQmFyeXNoa292IHdy
b3RlOg0KPj4gT24gRnJpLCBBcHIgMjUsIDIwMjUgYXQgMDE6Mjc6NDVQTSArMDMwMCwgRG1p
dHJ5IEJhcnlzaGtvdiB3cm90ZToNCj4+PiBPbiBUaHUsIEFwciAyNCwgMjAyNSBhdCAxMDo0
MzoyMVBNIC0wNzAwLCBLaGVtIFJhaiB3cm90ZToNCj4+Pj4gTGF0ZXN0IG1lc2EgMjUrIG5l
ZWRzIGxpYmNsYW5nIGR1cmluZyBidWlsZCBmb3IgdG9vbHMgbGlrZSBtZXNhX2NsYywNCj4+
Pj4gd2UgZW5haG5jZWQgYWxyZWFkeSBleGlzdGluZyBsbHZtIHJlY2lwZSB0byBidWlsZCBw
aWVjZXMgb2YgY2xhbmcgYXMNCj4+Pj4gd2VsbCwgd2hpY2ggd29ya2VkIGZvciBtZXNhJ3Mg
bmVlZHMgYnV0IGJyb2tlIHN0YXRpYyBjbGFuZyBjb21waWxlcg0KPj4+PiBwcm92aWRlZCBi
eSBtZXRhLWNsYW5nIGR1ZSB0byBuZXdmb3VuZCBjb25mbGljdHMsIHNpbmNlIGNsYW5nIGlz
IG5vdw0KPj4+PiBidWlsdCB3aXRoIGxsdm0gcmVjaXBlIGZyb20gY29yZSBhbmQgYWxzbyBi
eSBtZXRhLWNsYW5nIGFuZCB0aGV5DQo+Pj4+IGNvbXBldGUgZm9yIHNhbWUgbmFtZXNwYWNl
LCBhbiBhdHRlbXB0IHRvIG1ha2UgdGhlbSBjby1oYWJpdCBkaWQgcmV2ZWFsDQo+Pj4+IG1v
cmUgZGlmZmljdWx0aWVzLiBDbGFuZyBjb21waWxlciBmcm9tIG1ldGEtY2xhbmcgaXMgbm90
IGFibGUgdG8gdXNlDQo+Pj4+IGxsdm0gbGlicmFyaWVzIGZyb20gY29yZSBzaW5jZSB0aGV5
IHBhdGNoIHRoZW0gZGlmZmVyZW50bHkuDQo+Pj4+DQo+Pj4+IFRoaXMgcGF0Y2ggc2VyaWVz
IHRoZXJlZm9yZSBicmluZ3MgY2xhbmcgYW5kIGFsbCByZWNpcGVzIHRoYXQgYnVpbGQgZnJv
bQ0KPj4+PiBsbHZtIHNvdXJjZXMgaW50byBjb3JlLiBXaXRoIHRoaXMgY2hhbmdlc2V0LCBj
bGFuZyByZWNpcGVzIGNhbiBiZSByZW1vdmVkDQo+Pj4+IGZyb20gbWV0YS1jbGFuZyB0aGVy
ZSBpcyBhIHB1bGwgcmVxdWVzdCBmb3IgdGhhdCBhbHJlYWR5IFsxXQ0KPj4+PiBBcyBhbiBh
c2lkZSwgd2Ugb25seSBidWlsZCBjbGFuZyBvbmNlIGFuZCB1c2UgaXQgZm9yIG1ldGEtY2xh
bmcgbmVlZHMNCj4+Pj4gYW5kIGNvcmUgbmVlZHMuDQo+Pj4+DQo+Pj4+IFdpdGggdGhpcywg
bWV0YS1jbGFuZyBjYW4gZGVwZW5kIHVwb24gY29yZSBsYXllciB0byBwcm92aWRlIGNsYW5n
IGFuZA0KPj4+PiByZWxhdGVkIHJlY2lwZXMsIG1ldGEtY2xhbmcgd2lsbCBzdGlsbCBwcm92
aWRlIHRoZSB0b29sY2hhaW4gcG9saWNpZXMNCj4+Pj4gYXJvdW5kIGNsYW5nIGJhc2VkIHRv
b2xjaGFpbnMuIENsYW5nIGNvbXBpbGVyIGZyb20gY29yZSwgd2hpbGUgdXNhYmxlDQo+Pj4+
IGZvciBtZXNhIGlzIG5vdCB5ZXQgZnVsbHkgdXNhYmxlIG91dCBvZiBib3gsIHNpbmNlIHdl
IG5lZWQgdG8gd29ya291dA0KPj4+PiB0aGUgbXVsdGktdG9vbGNoYWluIGFyY2hpdGVjdHVy
ZSBmb3IgY29yZSwgd2hpY2ggd2lsbCBiZSBkb25lIGluIG5leHQNCj4+Pj4gcGhhc2UgYWZ0
ZXIgdGhpcyBtZXJnZS4NCj4+Pj4NCj4+Pj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9rcmFq
L21ldGEtY2xhbmcvcHVsbC8xMDg4DQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEtoZW0g
UmFqIDxyYWoua2hlbUBnbWFpbC5jb20+DQo+Pj4NCj4+PiBXaXRoIHRoZSBmb2xsb3dpbmcg
bGluZXMgaW4gbG9jYWwuY29uZiBJIGdvdCB0aGUgUlBST1ZJREVTIGVycm9yOg0KPj4+DQo+
Pj4gUEFDS0FHRUNPTkZJRzphcHBlbmQ6cG4tbWVzYSA9ICIgb3BlbmNsIGxpYmNsYyBnYWxs
aXVtLWxsdm0gIg0KPj4+IFBBQ0tBR0VDT05GSUc6YXBwZW5kOnBuLW1lc2EtbmF0aXZlID0g
IiBvcGVuY2wgbGliY2xjIGdhbGxpdW0tbGx2bSAiDQo+Pj4gUEFDS0FHRUNPTkZJRzphcHBl
bmQ6cG4tbmF0aXZlc2RrLW1lc2EgPSAiIG9wZW5jbCBsaWJjbGMgZ2FsbGl1bS1sbHZtICIN
Cj4+Pg0KPj4+ICQgRElTVFJPPXBva3kgTUFDSElORT1xZW11eDg2LTY0IGJpdGJha2UgbWVz
YQ0KPj4+DQo+Pj4gRVJST1I6IE5vdGhpbmcgUlBST1ZJREVTICdzcGlydi1sbHZtLXRyYW5z
bGF0b3InIChidXQgL2hvbWUvbHVtYWcvUHJvamVjdHMvUlBCL2J1aWxkLXJwYi9jb25mLy4u
Ly4uL2xheWVycy9vcGVuZW1iZWRkZWQtY29yZS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVz
YS9tZXNhLmJiIFJERVBFTkRTIG9uIG9yIG90aGVyd2lzZSByZXF1aXJlcyBpdCkNCj4+PiBO
T1RFOiBSdW50aW1lIHRhcmdldCAnc3BpcnYtbGx2bS10cmFuc2xhdG9yJyBpcyB1bmJ1aWxk
YWJsZSwgcmVtb3ZpbmcuLi4NCj4+PiBNaXNzaW5nIG9yIHVuYnVpbGRhYmxlIGRlcGVuZGVu
Y3kgY2hhaW4gd2FzOiBbJ3NwaXJ2LWxsdm0tdHJhbnNsYXRvciddDQo+Pj4gRVJST1I6IFJl
cXVpcmVkIGJ1aWxkIHRhcmdldCAnbWVzYScgaGFzIG5vIGJ1aWxkYWJsZSBwcm92aWRlcnMu
DQo+Pj4gTWlzc2luZyBvciB1bmJ1aWxkYWJsZSBkZXBlbmRlbmN5IGNoYWluIHdhczogWydt
ZXNhJywgJ3NwaXJ2LWxsdm0tdHJhbnNsYXRvciddDQo+Pg0KPj4gQWZ0ZXIgYWRkaW5nIHRo
ZSBSUFJPVklERVMgZm9yIGxpYmNsYyBhbmQgc3BpcnYtbGx2bS10cmFuc2xhdG9yLCB0aGUN
Cj4+IHNhbWUgY29tbWFuZCBmYWlscyB3aXRoOg0KPj4NCj4+IEVSUk9SOiBtZXNhLTJfMjUu
MC4yLXIwIGRvX3BhY2thZ2VfcWE6IFFBIElzc3VlOiBGaWxlIC91c3IvbGliL2xpYk1lc2FP
cGVuQ0wuc28uMS4wLjAgaW4gcGFja2FnZSBsaWJvcGVuY2wtbWVzYSBjb250YWlucyByZWZl
cmVuY2UgdG8gVE1QRElSIFtidWlsZHBhdGhzXQ0KDQpJIGNhbiBzZWUgdGhpcyBvbiBxZW11
eDg2LTY0IGFzIHdlbGwuDQoNCj4+IEVSUk9SOiBtZXNhLTJfMjUuMC4yLXIwIGRvX3BhY2th
Z2VfcWE6IEZhdGFsIFFBIGVycm9ycyB3ZXJlIGZvdW5kLCBmYWlsaW5nIHRhc2suDQo+PiBF
UlJPUjogTG9nZmlsZSBvZiBmYWlsdXJlIHN0b3JlZCBpbjogL2hvbWUvbHVtYWcvUHJvamVj
dHMvUlBCL2J1aWxkLXJwYi90bXAtcG9reS93b3JrL2NvcmUyLTY0LXBva3ktbGludXgvbWVz
YS8yNS4wLjIvdGVtcC9sb2cuZG9fcGFja2FnZV9xYS4zNDkxNDM1DQo+PiBFUlJPUjogVGFz
ayAoL2hvbWUvbHVtYWcvUHJvamVjdHMvUlBCL2J1aWxkLXJwYi9jb25mLy4uLy4uL2xheWVy
cy9vcGVuZW1iZWRkZWQtY29yZS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbWVzYS9tZXNhLmJi
OmRvX3BhY2thZ2VfcWEpIGZhaWxlZCB3aXRoIGV4aXQgY29kZSAnMScNCj4gDQo+IEFzIHdp
dGggdGhlIHYxLCBidWlsZGluZyB3aXRoIHRoZSBSUFJPVklERVMgYW5kIFBBQ0tBR0VDT05G
SUcgYmVpbmcgc2V0DQo+IGZvciBwb2t5L3FlbXVhcm02NCBmYWlscyB3aXRoOg0KPiANCj4g
L2hvbWUvbHVtYWcvUHJvamVjdHMvUlBCL2J1aWxkLXJwYi90bXAtcG9reS93b3JrL2NvcnRl
eGE1Ny1wb2t5LWxpbnV4L21lc2EvMjUuMC4yL3JlY2lwZS1zeXNyb290L3Vzci9pbmNsdWRl
L2xsdm0vQURUL0RlbnNlTWFwSW5mby5oOjE3OjEwOiBmYXRhbCBlcnJvcjogJ2Nhc3NlcnQn
IGZpbGUgbm90IGYNCj4gb3VuZA0KPiBVbmFibGUgdG8gZ2VuZXJhdGUgYmluZGluZ3M6IGNs
YW5nIGRpYWdub3NlZCBlcnJvcjogL2hvbWUvbHVtYWcvUHJvamVjdHMvUlBCL2J1aWxkLXJw
Yi90bXAtcG9reS93b3JrL2NvcnRleGE1Ny1wb2t5LWxpbnV4L21lc2EvMjUuMC4yL3JlY2lw
ZS1zeXNyb290L3Vzci9pbmNsdWRlL2xsdm0vQURUL0Rlbg0KPiBzZU1hcEluZm8uaDoxNzox
MDogZmF0YWwgZXJyb3I6ICdjYXNzZXJ0JyBmaWxlIG5vdCBmb3VuZA0KPiANCg0KdGhpcyBo
ZWFkZXIgY29tZXMgZnJvbSBDKysgcnVudGltZSBwYWNrYWdlIGVpdGhlciBsaWJzdGRjKysg
b3IgbGliY3h4LCANCmRvIHlvdSBzdGlsbCBzZWUgdGhpcyB3aXRoIHYyIHNlcmllcyA/DQo=

--------------u4u0LVMIJZgbrHFJ0b6DpAEm
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------u4u0LVMIJZgbrHFJ0b6DpAEm--

--------------G42om6fvAeHfFaHNjhtJ3kPe--

--------------G2fZt2wwxmfHxolDpJvS7DfH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCaAv8GwUDAAAAAAAKCRC7BTNVkZ0zFCwr
AJ98wslF1VZEjG+IKwD8szVnB9XarwCfckZqDciwAf90m7g90dXpbF6fFqA=
=Pl7E
-----END PGP SIGNATURE-----

--------------G2fZt2wwxmfHxolDpJvS7DfH--

