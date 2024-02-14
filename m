Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D3FFC48BC4
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 10:37:31 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.38561.1707907045099176213
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 02:37:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FLSqL1KD;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-33cddf4b4b5so1012218f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 02:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707907043; x=1708511843; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZI+Z1lWNKqMobbH5cLhjh/Z2T6cNJctY7zF7iOs2cn8=;
        b=FLSqL1KDOqeZPZWX8K/2PwbV/Wjd6+BH/ATLoD/qjjE3VKswhHr+wd8CAsTF/6Umdl
         kVSfiR3bSdPXUC27hp8gVISvgVSKs6UsTiUt/Fsg9NkCFRiiwloG4rls2PQ0dEI1h+uL
         hG5be/6u6MoRJh7zhdTw5bai2zHvfB4xZ8IxMppQwLVftvtydm7eqGnKqJMPJg999W/z
         uUMREtTJfMC8PlSIL6nAnodvm9LLOksiPDe/e1pDn0b1nT+hTDee71eMxP50LzA6s6rM
         awhHi8DaNGZKlqwzKfBknGPNVk9uFfKOzhACkxRYNFmAm/gIjoWQJ/NCpORfVet+MCxA
         g+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707907043; x=1708511843;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZI+Z1lWNKqMobbH5cLhjh/Z2T6cNJctY7zF7iOs2cn8=;
        b=p24AepgP2w4Sct8QH/Z7Kzqee/TV+qPEopY66bP0GTGo71Uq2g8kqXlJp/56m9FkWo
         9v1kE5QFX79vctMv5Ys2mOxlggrioEGsWMnys82wdD3geao6tYCeJVG8MjxCCnjqPWC7
         yilJ8z+h2vH1GkNVqx0DQCLr8Vqbxx5KN5mQHSHxSLWR8+UlOfarMkn/lktIJb2wH/gP
         DDHphBW/Jx9nrEGkp85sOUz01sqVGqZupg/YGZMZwqOGgpBhrtdatVXDZQBORih3NA56
         l/62zrkOFQsPcg/fZEcdcGNkOL57+Qndc0w87cjfiMRLNUlm+aSJifMyBTAjbN+1et3J
         3bJw==
X-Gm-Message-State: AOJu0YzTjBwPL4DwXkPWvDOb2lHo8vG9285eOI1kU8DBAUyVa+B+8M7g
	VP9ytAkb0IMWYZTgoRI8Js4N+0b7s5MHAbrsEk+KAYPv/vIwP3Xj
X-Google-Smtp-Source: AGHT+IFGciieL17DCrjCCLuizW553FgMjR5WgrkiDonmcBQ1kTe+vpBZpu1H7XIrmdGqMVJhpx8ayw==
X-Received: by 2002:adf:cc81:0:b0:33b:48ef:e746 with SMTP id p1-20020adfcc81000000b0033b48efe746mr1648267wrj.68.1707907043214;
        Wed, 14 Feb 2024 02:37:23 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id az10-20020adfe18a000000b0033b4f82b301sm12313759wrb.3.2024.02.14.02.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 02:37:22 -0800 (PST)
Message-ID: <91f17540acafafe3a16ea187e2f57e04936dfb34.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/4] oe-init-build-env: generate .vscode
 from template
From: adrian.freihofer@gmail.com
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 14 Feb 2024 11:37:22 +0100
In-Reply-To: <CANNYZj_=BJdma_-NuhAoBEzD+To0XR9LqrrGedGT+ogP-CAXcw@mail.gmail.com>
References: <20240213221846.109260-1-adrian.freihofer@siemens.com>
	 <20240213221846.109260-4-adrian.freihofer@siemens.com>
	 <CANNYZj_=BJdma_-NuhAoBEzD+To0XR9LqrrGedGT+ogP-CAXcw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.4 (3.48.4-1.module_f38+17164+63eeee4a) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 10:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195462

T24gV2VkLCAyMDI0LTAyLTE0IGF0IDExOjAxICswMTAwLCBBbGV4YW5kZXIgS2FuYXZpbiB3cm90
ZToKPiBPbiBUdWUsIDEzIEZlYiAyMDI0IGF0IDIzOjE5LCBBZHJpYW4gRnJlaWhvZmVyCj4gPGFk
cmlhbi5mcmVpaG9mZXJAZ21haWwuY29tPiB3cm90ZToKPiA+ICsrKyBiL21ldGEtcG9reS9jb25m
L3RlbXBsYXRlcy9kZWZhdWx0L3ZzY29kZS9zZXR0aW5ncy5qc29uLnNhbXBsZQo+ID4gQEAgLTAs
MCArMSw0NyBAQAo+ID4gK3sKPiA+ICvCoMKgwqAgImJpdGJha2UucGF0aFRvQml0YmFrZUZvbGRl
ciI6ICIjI09FUk9PVCMjL2JpdGJha2UiLAo+ID4gK8KgwqDCoCAiYml0YmFrZS5wYXRoVG9CdWls
ZEZvbGRlciI6ICIjI0JVSUxERElSIyMiLAo+ID4gK8KgwqDCoCAiYml0YmFrZS5wYXRoVG9FbnZT
Y3JpcHQiOiAiIyNPRUlOSVQjIy9vZS1pbml0LWJ1aWxkLWVudiIsCj4gPiArwqDCoMKgICJmaWxl
cy5leGNsdWRlIjogewo+ID4gK8KgwqDCoMKgwqDCoMKgICIqKi8uZ2l0LyoqIjogdHJ1ZSwKPiA+
ICvCoMKgwqDCoMKgwqDCoCAiKiovX2J1aWxkLyoqIjogdHJ1ZSwKPiA+ICvCoMKgwqDCoMKgwqDC
oCAiKiovYnVpbGRoaXN0b3J5LyoqIjogdHJ1ZSwKPiA+ICvCoMKgwqDCoMKgwqDCoCAiKiovY2Fj
aGUvKioiOiB0cnVlLAo+ID4gK8KgwqDCoMKgwqDCoMKgICIqKi9kb3dubG9hZHMvKioiOiB0cnVl
LAo+ID4gK8KgwqDCoMKgwqDCoMKgICIqKi9ub2RlX21vZHVsZXMvKioiOiB0cnVlLAo+ID4gK8Kg
wqDCoMKgwqDCoMKgICIqKi9vZS1sb2dzLyoqIjogdHJ1ZSwKPiA+ICvCoMKgwqDCoMKgwqDCoCAi
Kiovb2Utd29ya2Rpci8qKiI6IHRydWUsCj4gPiArwqDCoMKgwqDCoMKgwqAgIioqL3NzdGF0ZS1j
YWNoZS8qKiI6IHRydWUsCj4gPiArwqDCoMKgwqDCoMKgwqAgIioqL3RtcCovKioiOiB0cnVlLAo+
ID4gK8KgwqDCoMKgwqDCoMKgICIqKi93b3Jrc3BhY2UvYXR0aWMvKioiOiB0cnVlLAo+ID4gK8Kg
wqDCoMKgwqDCoMKgICIqKi93b3Jrc3BhY2Uvc291cmNlcy8qKiI6IHRydWUKPiA+ICvCoMKgwqAg
fSwKPiA+ICvCoMKgwqAgImZpbGVzLndhdGNoZXJFeGNsdWRlIjogewo+ID4gK8KgwqDCoMKgwqDC
oMKgICIqKi8uZ2l0LyoqIjogdHJ1ZSwKPiA+ICvCoMKgwqDCoMKgwqDCoCAiKiovX2J1aWxkLyoq
IjogdHJ1ZSwKPiA+ICvCoMKgwqDCoMKgwqDCoCAiKiovYnVpbGRoaXN0b3J5LyoqIjogdHJ1ZSwK
PiA+ICvCoMKgwqDCoMKgwqDCoCAiKiovY2FjaGUvKioiOiB0cnVlLAo+ID4gK8KgwqDCoMKgwqDC
oMKgICIqKi9kb3dubG9hZHMvKioiOiB0cnVlLAo+ID4gK8KgwqDCoMKgwqDCoMKgICIqKi9ub2Rl
X21vZHVsZXMvKioiOiB0cnVlLAo+ID4gK8KgwqDCoMKgwqDCoMKgICIqKi9vZS1sb2dzLyoqIjog
dHJ1ZSwKPiA+ICvCoMKgwqDCoMKgwqDCoCAiKiovb2Utd29ya2Rpci8qKiI6IHRydWUsCj4gPiAr
wqDCoMKgwqDCoMKgwqAgIioqL3NzdGF0ZS1jYWNoZS8qKiI6IHRydWUsCj4gPiArwqDCoMKgwqDC
oMKgwqAgIioqL3RtcCovKioiOiB0cnVlLAo+ID4gK8KgwqDCoMKgwqDCoMKgICIqKi93b3Jrc3Bh
Y2UvYXR0aWMvKioiOiB0cnVlLAo+ID4gK8KgwqDCoMKgwqDCoMKgICIqKi93b3Jrc3BhY2Uvc291
cmNlcy8qKiI6IHRydWUKPiA+ICvCoMKgwqAgfSwKPiA+ICvCoMKgwqAgInB5dGhvbi5hbmFseXNp
cy5leGNsdWRlIjogWwo+ID4gK8KgwqDCoMKgwqDCoMKgICIqKi9fYnVpbGQvKioiLAo+ID4gK8Kg
wqDCoMKgwqDCoMKgICIqKi8uZ2l0LyoqIiwKPiA+ICvCoMKgwqDCoMKgwqDCoCAiKiovYnVpbGRo
aXN0b3J5LyoqIiwKPiA+ICvCoMKgwqDCoMKgwqDCoCAiKiovY2FjaGUvKioiLAo+ID4gK8KgwqDC
oMKgwqDCoMKgICIqKi9kb3dubG9hZHMvKioiLAo+ID4gK8KgwqDCoMKgwqDCoMKgICIqKi9ub2Rl
X21vZHVsZXMvKioiLAo+ID4gK8KgwqDCoMKgwqDCoMKgICIqKi9vZS1sb2dzLyoqIiwKPiA+ICvC
oMKgwqDCoMKgwqDCoCAiKiovb2Utd29ya2Rpci8qKiIsCj4gPiArwqDCoMKgwqDCoMKgwqAgIioq
L3NzdGF0ZS1jYWNoZS8qKiIsCj4gPiArwqDCoMKgwqDCoMKgwqAgIioqL3RtcCovKioiLAo+ID4g
K8KgwqDCoMKgwqDCoMKgICIqKi93b3Jrc3BhY2UvYXR0aWMvKioiLAo+ID4gK8KgwqDCoMKgwqDC
oMKgICIqKi93b3Jrc3BhY2Uvc291cmNlcy8qKiIKPiA+ICvCoMKgwqAgXQo+ID4gK30KPiAKPiBE
b2VzIGV2ZXJ5IHRlbXBsYXRlIHJlYWxseSBuZWVkIHRvIHByb3ZpZGUgdGhpcyBzZXBhcmF0ZWx5
PyBJZiB0aGV5Cj4gZG9uJ3QgZG8gaXQsIHRoZW4gZXhwZXJpZW5jZSBpbiB2c2NvZGUgaXMgZ29p
bmcgdG8gYmUgcG9vci4gT24gdGhlCj4gb3RoZXIgaGFuZCBJIGRvbid0IHRoaW5rIHRoZXJlJ3Mg
YW55dGhpbmcgcGFydGljdWxhciB0byBwb2t5L2NvcmUKPiBkZWZhdWx0IHRlbXBsYXRlIGluIHRo
ZSBhYm92ZSwgc28gd2h5IG5vdCBwbGFjZSB0aGlzIHNvbWV3aGVyZSBnbG9iYWwKPiBsaWtlIG1l
dGEvZmlsZXMsIGFuZCB0aGVuIGFsbCB0ZW1wbGF0ZXMgd2lsbCBnYWluIHZzY29kZSBzZXR0aW5n
cwo+IGF1dG9tYXRpY2FsbHk/Cj4gCj4gU2FtZSBzaG91bGQgYmUgY29uc2lkZXJlZCBmb3IgZXh0
ZW5zaW9ucy5qc29uLCBhbHRob3VnaCB0aGVyZSBtaWdodAo+IGJlCj4gYSB1c2UgY2FzZSBmb3Ig
cGVyLXRlbXBsYXRlIGV4dGVuc2lvbnMsIG5vdCBzdXJlLgo+IApJZGVhbGx5IHRoZXJlIHdvdWxk
IGJlIGEgZ2VuZXJpYyB0ZW1wbGF0ZSAoYXMgdGhlIG9uZSBoZXJlKSB3aGljaCBpcwp1c2VkIGJ5
IGRlZmF1bHQgZm9yIGFsbCBidWlsZCBjb25maWd1cmF0aW9ucy4KCkJ1dCB0aGUgLnZzY29kZSBj
b25maWd1cmF0aW9uIGNhbiBhbHNvIGJlIG11Y2ggbW9yZSBzcGVjaWZpYy4gVGhlIGJlc3QKd291
bGQgYmUgdG8gZG8gc29tZXRoaW5nIGluIHRoZSBtaWRkbGUgZnJvbSB3aGF0IG15IHBhdGNoZXMg
ZG8gYW5kIHdoYXQKeW91IHN1Z2dlc3Q6IFRha2UgdGhlIC52c2NvZGUgdGVtcGxhdGVzIGZyb20g
YSB1c2VyIHNwZWNpZmljIGZvbGRlciBpZgp0aGVyZSBpcyBvbmUsIG90aGVyd2lzZSB0YWtlIHRo
ZSBkZWZhdWx0IG9uZSB3aGljaCBpcyBmb3VuZCBpbiBwb2t5LgpDdXJyZW50bHkgdGhpcyBpcyBw
b3NzaWJsZSB3aXRoIHN5bS1saW5rcyBvbiB0aGUgdXNlciBzaWRlIGJ1dCBJIGFncmVlCnRoYXQg
dGhpcyBjb3VsZCBiZSBiZXR0ZXIgKHdpdGhvdXQgc3ltLWxpbmtzKS4KCkkgd2lsbCBzZW5kIGEg
djMgd2hpY2ggd2lsbCBpbXByb3ZlIHRoYXQuCgpUaGFuayB5b3UuCkFkcmlhbgoKPiBBbGV4Cgo=


