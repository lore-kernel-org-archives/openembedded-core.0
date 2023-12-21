Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A16C46CD3
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 20:30:00 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.4143.1703190597924514550
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Dec 2023 12:29:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=assDq42d;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-28bfdf3cd12so472627a91.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 12:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703190597; x=1703795397; darn=lists.openembedded.org;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W/I207hWBrycaOcHyvkqKQfeiclQCCroht+1lI/4eLg=;
        b=assDq42dmxNWF7/2a457vS0uDNLKL9F7q+xOjqE0Q1GmoOTrj2bRGrq8L2BX+VrrsN
         Mkw8QyXTIQ+lMOn13sqO/oJrDFbtTwA7kOvywkO6MnY3UD0a3uJwMyS/RFhioj6Ads+t
         e9/qAWDbjY5Zmz8uX9wRIJh8AfTorytUqHT+eIVSxhvQfah+Rxj6ap38YUS/iFiFHN7n
         HDIgQofTwfNZt3Of2FHcUSzUYhJ0y7LwVg+lCh3rJiDecPG+CrRwBN4nILshp/jn8nUh
         vnW/YfEgbgyyRYK0VobYpstR2AwflJw5f8GePd0iQOCGYcJHchUcCUlCekDSgYB78MWN
         eSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703190597; x=1703795397;
        h=in-reply-to:autocrypt:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W/I207hWBrycaOcHyvkqKQfeiclQCCroht+1lI/4eLg=;
        b=ZtHUmbOqTRPuygAKHnGcs8xrGtFTpfQLrd3em4UxEnuBesfEcfkcG5dCnjUi8OJ+LR
         ejYbi91mqX4s1E2/aIDTqZK/CWNM65S2c25nQy+OWnt2puTpgawhrPqAkk0QIV5gJnsT
         BzIIXlNHJDwzqDtCmoUzmL+pOPIuAEZo2BKjpkD7MnPj60+411X56Gc5CDuS4ombSN7B
         p8wRaI+upsKRrJNjGFtvru/tnFH6J2KXjbOvq8rVxLZ9aSO508JjwhaeBhOCGePUgkQz
         gISzCvRWXR9LfGSAAn2yCSs8jd8oTsHHqyLSi5wz0gjt9OYaqMqxGpV8+EG/Hd/Y1eL0
         zXOg==
X-Gm-Message-State: AOJu0Yw8FEp7CBnSTnzKIWHPbWFtFqGfvKlArMDBIBcbRGE4n30I4wGS
	gO1j9bU97Dyw38qWsfAvi08=
X-Google-Smtp-Source: AGHT+IFhrYFcL1JDo7N2tGFgV+7Z2cN+iS1ysGlGsz8m4GFErvzit8+nYAnkeHF967MmrAtCyM+zaA==
X-Received: by 2002:a17:90a:e144:b0:28b:f739:7c2a with SMTP id ez4-20020a17090ae14400b0028bf7397c2amr274743pjb.92.1703190597184;
        Thu, 21 Dec 2023 12:29:57 -0800 (PST)
Received: from ?IPV6:2601:646:9d80:4380:19f6:1dc9:af9a:71f0? ([2601:646:9d80:4380:19f6:1dc9:af9a:71f0])
        by smtp.gmail.com with ESMTPSA id bk3-20020a17090b080300b0028ae8a31664sm2177191pjb.35.2023.12.21.12.29.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Dec 2023 12:29:56 -0800 (PST)
Message-ID: <d031b402-495f-48d2-9c5f-8d5f85e8a12d@gmail.com>
Date: Thu, 21 Dec 2023 12:29:55 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v4] kernel.bbclass: make do_symlink_kernelsrc
 reentrant
Content-Language: en-US
To: Etienne Cordonnier <cordonnier.etienne@gmail.com>
Cc: ecordonnier@snap.com, openembedded-core@lists.openembedded.org
References: <17A23F37CD7211A7.10836@lists.openembedded.org>
 <CAHUKmYZ_czf-Zg=Mr5fN9nREnq3iE8VAiLSRS7hOAN7qRcTX5w@mail.gmail.com>
 <CAMKF1sqpj_PCmQ5KRevqiBMxi6up4rdp3xZ-9TwD3fLOAzhouw@mail.gmail.com>
 <CAJFWPWaSCUcjL1kQ3EWfWqd=95rbY8P9iOddxCTtoR0AE0cKQg@mail.gmail.com>
 <CAJFWPWaocc9xbTSBohwPXf=mkKwSY8tW_eLKW3p_43JehQrisQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
In-Reply-To: <CAJFWPWaocc9xbTSBohwPXf=mkKwSY8tW_eLKW3p_43JehQrisQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------KLVCx3d811QDml72xvN5Jix2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 20:30:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192848

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------KLVCx3d811QDml72xvN5Jix2
Content-Type: multipart/mixed; boundary="------------LEK38a5JB3piRpGjhBX2klSv";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Etienne Cordonnier <cordonnier.etienne@gmail.com>
Cc: ecordonnier@snap.com, openembedded-core@lists.openembedded.org
Message-ID: <d031b402-495f-48d2-9c5f-8d5f85e8a12d@gmail.com>
Subject: Re: [OE-core][PATCH v4] kernel.bbclass: make do_symlink_kernelsrc
 reentrant
References: <17A23F37CD7211A7.10836@lists.openembedded.org>
 <CAHUKmYZ_czf-Zg=Mr5fN9nREnq3iE8VAiLSRS7hOAN7qRcTX5w@mail.gmail.com>
 <CAMKF1sqpj_PCmQ5KRevqiBMxi6up4rdp3xZ-9TwD3fLOAzhouw@mail.gmail.com>
 <CAJFWPWaSCUcjL1kQ3EWfWqd=95rbY8P9iOddxCTtoR0AE0cKQg@mail.gmail.com>
 <CAJFWPWaocc9xbTSBohwPXf=mkKwSY8tW_eLKW3p_43JehQrisQ@mail.gmail.com>
In-Reply-To: <CAJFWPWaocc9xbTSBohwPXf=mkKwSY8tW_eLKW3p_43JehQrisQ@mail.gmail.com>

--------------LEK38a5JB3piRpGjhBX2klSv
Content-Type: multipart/mixed; boundary="------------j37TJecdrBXKPwyr950chRBC"

--------------j37TJecdrBXKPwyr950chRBC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIvMjEvMjMgMTI6MTIgUE0sIEV0aWVubmUgQ29yZG9ubmllciB3cm90ZToNCj4gQWxz
byB3aGljaCByZWxlYXNlIG9mIHlvY3RvIGFyZSB5b3UgcmVmZXJyaW5nIHRvPyBCb3RoIHRo
b3NlDQo+IHJlcG9zaXRvcmllcyBkb24ndCBoYXZlIGEgbmFuYmllbGQgYnJhbmNoLg0KPiAN
Cj4gT24gVGh1LCBEZWMgMjEsIDIwMjMgYXQgOTowOeKAr1BNIEV0aWVubmUgQ29yZG9ubmll
cg0KPiA8Y29yZG9ubmllci5ldGllbm5lQGdtYWlsLmNvbT4gd3JvdGU6DQo+Pg0KPj4gSXMg
aXQgZnJvbSBodHRwczovL2dpdGh1Yi5jb20vdmFyaWdpdC9tZXRhLXZhcmlzY2l0ZS1ic3At
dGkgb3INCj4+IGh0dHBzOi8vZ2l0aHViLmNvbS92YXJpZ2l0L21ldGEtdmFyaXNjaXRlLWJz
cC1pbXggPyBJIGRpZCBub3QgZmluZCBhDQo+PiByZXBvc2l0b3J5IGNhbGxlZCAibWV0YS12
YXJpc2NpdGUtYnNwIi4NCj4+DQoNCnllcyBpdCBoYXMgYmVlbiByZW5hbWVkIHVwc3RyZWFt
DQpodHRwczovL2dpdGh1Yi5jb20vdmFyaWdpdC9tZXRhLXZhcmlzY2l0ZS1ic3AtaW14L3Ry
ZWUva2lya3N0b25lLXZhcjAyL3JlY2lwZXMta2VybmVsL2xpbnV4DQoNCnVzZSBraXJrc3Rv
bmUtdmFyMDIgYnJhbmNoDQoNCj4+IE9uIFRodSwgRGVjIDIxLCAyMDIzIGF0IDU6MTTigK9Q
TSBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPiB3cm90ZToNCj4+Pg0KPj4+IHRoaXMg
ZmFpbHMgaW4gbGludXgtdmFyaXNjcml0ZSByZWNpcGUgZnJvbSBtZXRhLXZhcmlzY2l0ZS1i
c3ANCj4+Pg0KPj4+IGh0dHBzOi8vc25pcHMuc2gvZi85a2xHWnhsQ1JFDQo+Pj4NCj4+PiBP
biBUdWUsIERlYyAxOSwgMjAyMyBhdCA1OjQw4oCvQU0gRXRpZW5uZSBDb3Jkb25uaWVyIHZp
YQ0KPj4+IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPGVjb3Jkb25uaWVyPXNuYXAuY29tQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+Pj4gd3JvdGU6DQo+Pj4+DQo+Pj4+IFBhdGNoIHY0
OiB1c2UgaWRlbXBvdGVudCBjb3B5IG9mIHRoZSBmaWxlcyBpbnN0ZWFkIG9mIHNpbXBseSBz
a2lwcGluZyB0aGUgY29kZSAoc2VlIGRpc2N1c3Npb24gdW5kZXIgdjIgb2YgdGhlIHBhdGNo
KS4NCj4+Pj4NCj4+Pj4gT24gVHVlLCBEZWMgMTksIDIwMjMgYXQgMjozOOKAr1BNIEV0aWVu
bmUgQ29yZG9ubmllciB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8ZWNvcmRvbm5pZXI9
c25hcC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+Pj4+Pg0KPj4+Pj4g
RnJvbTogRXRpZW5uZSBDb3Jkb25uaWVyIDxlY29yZG9ubmllckBzbmFwLmNvbT4NCj4+Pj4+
DQo+Pj4+PiBUaGUgZnVuY3Rpb24gZG9fc3ltbGlua19rZXJuc3JjIGlzIG5vdCByZWVudHJh
bnQgaW4gdGhlIGNhc2Ugd2hlcmUgUyBpcyBkZWZpbmVkDQo+Pj4+PiB0byBhIG5vbi1kZWZh
dWx0IHZhbHVlLiBUaGlzIGNhdXNlcyBidWlsZC1mYWlsdXJlcyBlLmcuIHdoZW4gYnVpbGRp
bmcgbGludXgteW9jdG8sIHRoZW4gdXBkYXRpbmcNCj4+Pj4+IHBva3kgdG8gYSBjb21taXQg
d2hpY2ggbW9kaWZpZXMga2VybmVsLmJiY2xhc3MsIGFuZCB0aGVuIGJ1aWxkaW5nIGxpbnV4
LXlvY3RvIGFnYWluLg0KPj4+Pj4NCj4+Pj4+IEJ1Z3ppbGxhOiBodHRwczovL3VybGRlZmVu
c2UucHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cHMtM0FfX2J1Z3ppbGxhLnlvY3RvcHJv
amVjdC5vcmdfc2hvdy01RmJ1Zy5jZ2ktM0ZpZC0zRDE1MzI1JmQ9RHdJREFnJmM9bmNEVG1w
aGtKVHZqSURQaDBocEZfNHZDSHZhYmdHa0lDQzJlcGNrZmRpdyZyPUFoa2JOb25WdU1JR1Jm
UHhfUWo5VHNSaWgxRFVMSlRLVWtTR2E2Nm02N0UmbT1WQjF6WEFpRTlxX0NxTTlEZ29BMEJi
dGxvVXhwUUVfclE3ZXFrN0hHekJXOUt6RnU0NEs5aFMxaWFoc3FTdUlrJnM9OUNyOHZ3V2dV
d3dHTTVvQ08wN0RCNHNPOXNRcE1DZHdlUzF1OENtWjBRdyZlPQ0KPj4+Pj4NCj4+Pj4+IFRl
c3RlZCB3aXRoIGEgcmVjaXBlICJteS1jdXN0b20tbGludXgiIHdoaWNoIHVucGFja3Mgc291
cmNlcyB0byBhIGN1c3RvbSAke1N9IGRpcmVjdG9yeQ0KPj4+Pj4gYW5kIHJhbiBzeW1saW5r
X2tlcm5zcmMgc2V2ZXJhbCB0aW1lczoNCj4+Pj4+ICQgYml0YmFrZSAtZiAtYyBzeW1saW5r
X2tlcm5zcmMgbXktY3VzdG9tLWxpbnV4DQo+Pj4+Pg0KPj4+Pj4gU2lnbmVkLW9mZi1ieTog
RXRpZW5uZSBDb3Jkb25uaWVyIDxlY29yZG9ubmllckBzbmFwLmNvbT4NCj4+Pj4+IC0tLQ0K
Pj4+Pj4gICBtZXRhL2NsYXNzZXMtcmVjaXBlL2tlcm5lbC5iYmNsYXNzIHwgOCArKysrKysr
LQ0KPj4+Pj4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pDQo+Pj4+Pg0KPj4+Pj4gZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy1yZWNpcGUva2Vy
bmVsLmJiY2xhc3MgYi9tZXRhL2NsYXNzZXMtcmVjaXBlL2tlcm5lbC5iYmNsYXNzDQo+Pj4+
PiBpbmRleCA5ZmYzN2Y1YzM4Li40MmM1NTE5ZjgxIDEwMDY0NA0KPj4+Pj4gLS0tIGEvbWV0
YS9jbGFzc2VzLXJlY2lwZS9rZXJuZWwuYmJjbGFzcw0KPj4+Pj4gKysrIGIvbWV0YS9jbGFz
c2VzLXJlY2lwZS9rZXJuZWwuYmJjbGFzcw0KPj4+Pj4gQEAgLTE4OSwxMSArMTg5LDE3IEBA
IHB5dGhvbiBkb19zeW1saW5rX2tlcm5zcmMgKCkgew0KPj4+Pj4gICAgICAgICAgICAgICAj
IGRyb3AgdHJhaWxpbmcgc2xhc2gsIHNvIHRoYXQgb3Muc3ltbGluayhrZXJuc3JjLCBzKSBk
b2Vzbid0IHVzZSBzIGFzDQo+Pj4+PiAgICAgICAgICAgICAgICMgZGlyZWN0b3J5IG5hbWUg
YW5kIGZhaWwNCj4+Pj4+ICAgICAgICAgICAgICAgcyA9IHNbOi0xXQ0KPj4+Pj4gLSAgICAg
ICAgaWYgZC5nZXRWYXIoIkVYVEVSTkFMU1JDIik6DQo+Pj4+PiArICAgICAgICBpZiBkLmdl
dFZhcigiRVhURVJOQUxTUkMiKSBhbmQgbm90IG9zLnBhdGguaXNsaW5rKHMpOg0KPj4+Pj4g
ICAgICAgICAgICAgICAjIFdpdGggRVhURVJOQUxTUkMgUyB3aWxsIG5vdCBiZSB3aXBlZCBz
byB3ZSBjYW4gc3ltbGluayB0byBpdA0KPj4+Pj4gICAgICAgICAgICAgICBvcy5zeW1saW5r
KHMsIGtlcm5zcmMpDQo+Pj4+PiAgICAgICAgICAgZWxzZToNCj4+Pj4+ICAgICAgICAgICAg
ICAgaW1wb3J0IHNodXRpbA0KPj4+Pj4gKyAgICAgICAgICAgICMgcGVyZm9ybSBpZGVtcG90
ZW50L3JlZW50cmFudCBjb3B5DQo+Pj4+PiArICAgICAgICAgICAgc19jb3B5ID0gcyArICIu
b3JpZyINCj4+Pj4+ICsgICAgICAgICAgICBpZiBub3Qgb3MucGF0aC5pc2RpcihzX2NvcHkp
Og0KPj4+Pj4gKyAgICAgICAgICAgICAgICBzaHV0aWwuY29weXRyZWUocywgc19jb3B5KQ0K
Pj4+Pj4gKyAgICAgICAgICAgIGJiLnV0aWxzLnJlbW92ZShzLCByZWN1cnNlPVRydWUpDQo+
Pj4+PiArICAgICAgICAgICAgc2h1dGlsLmNvcHl0cmVlKHNfY29weSwgcykNCj4+Pj4+ICAg
ICAgICAgICAgICAgc2h1dGlsLm1vdmUocywga2VybnNyYykNCj4+Pj4+ICAgICAgICAgICAg
ICAgb3Muc3ltbGluayhrZXJuc3JjLCBzKQ0KPj4+Pj4gICB9DQo+Pj4+PiAtLQ0KPj4+Pj4g
Mi4zNi4xLnZmcy4wLjANCj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4NCj4+Pj4+DQo+Pj4+DQo+Pj4+
DQo+Pj4+DQo+Pj4NCj4+PiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPj4+IExpbmtzOiBZ
b3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlzIGdyb3VwLg0KPj4+IFZpZXcv
UmVwbHkgT25saW5lICgjMTkyODM4KTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3Jn
L2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8xOTI4MzgNCj4+PiBNdXRlIFRoaXMgVG9w
aWM6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tdC8xMDMyNjIxMTQvNzI1OTM3
NQ0KPj4+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtY29yZStvd25lckBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+Pj4gVW5zdWJzY3JpYmU6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vuc3ViIFtjb3Jkb25uaWVyLmV0aWVubmVA
Z21haWwuY29tXQ0KPj4+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+Pj4NCg==
--------------j37TJecdrBXKPwyr950chRBC
Content-Type: application/pgp-keys; name="OpenPGP_0xBB053355919D3314.asc"
Content-Disposition: attachment; filename="OpenPGP_0xBB053355919D3314.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
//VuX4EDPW3CZmbPy6U=3D
=3D+jUt
-----END PGP PUBLIC KEY BLOCK-----

--------------j37TJecdrBXKPwyr950chRBC--

--------------LEK38a5JB3piRpGjhBX2klSv--

--------------KLVCx3d811QDml72xvN5Jix2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wmMEABEIACMWIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCZYSgQwUDAAAAAAAKCRC7BTNVkZ0zFCvG
AJ45EVw5jBmsEHuMnpAloyb8TYNJuQCdGSNCDMzZdV+HLIeBVZRYRr1+t7k=
=BgQS
-----END PGP SIGNATURE-----

--------------KLVCx3d811QDml72xvN5Jix2--

