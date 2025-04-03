Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27175C3601B
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 11:39:41 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.11204.1743680377308616886
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Apr 2025 04:39:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e0V/Cszs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf680d351so10661995e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 04:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743680376; x=1744285176; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7N3+LvRA8ojWO2S7uFQm4rafH2Wfq2VIsxg4jBuFlmg=;
        b=e0V/CszsGfgHcCppac6cr15tmjmnkF+cT9fZH26JRRE4o+fRGWRO8cugjKtGlIfeSi
         pkd+JrSdO2JyU8bcns1bYsIIbDSKwr0RdOH1g3Rue3DJBGgXoLejjRvxYwKsU/KxOsin
         TmO75i+0Ii+hYJi1SAomOjJjxDqdLVEwUz0o0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743680376; x=1744285176;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7N3+LvRA8ojWO2S7uFQm4rafH2Wfq2VIsxg4jBuFlmg=;
        b=raPufMfDUvAToylJbqGBZ3SnNPsOgUoVTqVN5T68X/U7++NUDfQIIoBY1ZXEOZHRYG
         9sRTiOCfbwltY2fRnCNRwzRsFdReFvocy50lsQSOM0t0npdcWwVpk1l/BAuuafkznQYi
         MbGbWYcVGAomAlfz1L5hQXyiyMD//wrX14ixabAkD52hrACXAXeCAvXw1Oxiga5JaEvC
         9h2HMtEBmi3IErgpzGWdY4ujyazN1ExP1YJjkD/2zmKCMVMEKBrB7jl40cbjiKv6wQU8
         TlwciGLC+WO55Kc73d2q1B9sIikWp4XrEOittNDMGZUuCRpeSp1Pu8Skk6kPV4oGSmgB
         oDDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYvuVbHERkESvHxpijwJuI2zaQAJR/V3cxN2iJ/lr39hr5BOzSI97CvyPK1maqvIVI+tHsKl0Sc2/IWNAGXFLA7A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxljQuHuardf0DlaZaaoVtg5jSiu7hJYHT7jcKyQuYEImRFNXY4
	btH3E7SZQumtFuTsWrSmkrvJmI9xpwC2UYBs7NqJ+ELAlD1tUftqLQsj7eKEiCg=
X-Gm-Gg: ASbGncuCnMBVGhnIqGIYKTYDFzeAl1pSjb+QjAr5gJf5IHDz7oWXpFWGpvN0bL9CUlk
	hgOcaWfaLcYuzr6scQk7tSIZnn+J9rmYp7y4pR+bqH8sFfHMwHSpFiRc+nhQI8ii4ehzF1Vnuky
	3UcsP5k4xF+BxQyxVHyhEz9ZvvpCmPES4RUJSvz8759YWf+RIpmOAM020Q85/jfpQqFV44cC/qw
	WRnm9aZxdilsu8yj8PwlPp9mRL+N/SBdmKOfl5imDzKIc/6JyZhgs4t9vk1leSB2QoOST8fI6PY
	NASV12zK31l3X4p59NOXudqZxkVBM4dIsaukZSa59ZBdkG0pMTMXVKQoBOF4pe19yAg3XBKo4fb
	vaM5JSR5q6Haqosu/HLbr4fkRiYXoCg1V3w==
X-Google-Smtp-Source: AGHT+IGrtAaksOI+tU1a7rOGXXyWweI3qu3yJXgibWYjS7kOi9IAptBE9V3YZyFu//2AeVkepccx+w==
X-Received: by 2002:a7b:c398:0:b0:43d:5264:3cf0 with SMTP id 5b1f17b1804b1-43ebef8f615mr25566005e9.11.1743680375687;
        Thu, 03 Apr 2025 04:39:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4b5f:9de5:8de7:7270? ([2001:8b0:aba:5f3c:4b5f:9de5:8de7:7270])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301b7933sm1615663f8f.54.2025.04.03.04.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 04:39:34 -0700 (PDT)
Message-ID: <57b7abbd040cd8c9c8e9866280414b95ac89dbff.camel@linuxfoundation.org>
Subject: Re: [OE-core] [scarthgap] multilib_header class: issue with custom
 multilib setup
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joao Marcos Costa <joaomarcos.costa@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Cc: Thomas Perrot <thomas.perrot@bootlin.com>, Khem Raj
 <raj.khem@gmail.com>,  Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Thu, 03 Apr 2025 12:39:34 +0100
In-Reply-To: <a4816fa9-091a-4fd8-962e-3cb803699395@bootlin.com>
References: <5746f47c-7e5d-46f5-b089-c613b7275d2b@bootlin.com>
	 <6c36d9830745cb739f1dcb968d74a43395117fa1.camel@linuxfoundation.org>
	 <21e0daef-2b05-4c33-afb8-3a45ebd97fbf@bootlin.com>
	 <a299f47c16bcac1624099c99d29e84bc13e01d69.camel@linuxfoundation.org>
	 <a4816fa9-091a-4fd8-962e-3cb803699395@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 11:39:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214321

T24gVGh1LCAyMDI1LTA0LTAzIGF0IDEzOjMxICswMjAwLCBKb2FvIE1hcmNvcyBDb3N0YSB3cm90
ZToKPiAKPiAKPiBPbiA0LzMvMjUgMTM6MTksIFJpY2hhcmQgUHVyZGllIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIHdyb3RlOgo+ID4gT24gVGh1LCAyMDI1LTA0LTAzIGF0IDEzOjA2ICswMjAw
LCBKb2FvIE1hcmNvcyBDb3N0YSB3cm90ZToKPiA+ID4gCj4gPiA+IFRoYW5rcyBmb3IgeW91ciBy
ZXBseS4KPiA+ID4gCj4gPiA+IEV2ZW4gd2l0aCB0aGUgY2ZpIHN1ZmZpeCBzZXQgY29ycmVjdGx5
LCB0aGUgYWN0dWFsIGZpbGUgcmFpc2luZwo+ID4gPiB0aGUKPiA+ID4gY29uZmxpY3QgaXMgdGhl
IGdlbmVyYXRlZCB0ZW1wbGF0ZSwgbm8gdGhlIGhlYWRlciB3aXRoIHRoZQo+ID4gPiBzdWZmaXg6
Cj4gPiA+IAo+ID4gPiBmaWxlIC91c3IvaW5jbHVkZS9nbnUvbGliLW5hbWVzLWxwNjRkLmggY29u
ZmxpY3RzIGJldHdlZW4KPiA+ID4gYXR0ZW1wdGVkCj4gPiA+IGluc3RhbGxzIG9mIGxpYmNmaS1s
aWJjNi1kZXYtMi4zNy1yMC5yaXNjdjY0Y2ZpIGFuZAo+ID4gPiBsaWJjNi1kZXYtMi4zNy1yMC5y
aXNjdjY0Cj4gPiA+IAo+ID4gPiBJbiBteSBwcmV2aW91cyBtYWlsLCBJIHNob3VsZCBoYXZlIHBh
c3RlZCB0aGlzIG9uZSBpbnN0ZWFkLiBNeQo+ID4gPiBiYWQuCj4gPiAKPiA+IEkgdHJpZWQgdG8g
ZXhwbGFpbiBob3cgaXQgc2hvdWxkIHdvcmsgYnV0IEkgY2FuJ3QgZG8gbXVjaCBiZXlvbmQKPiA+
IHRoYXQuCj4gPiBUaGUgdHdvIGdlbmVyYXRlZCB0ZW1wbGF0ZSBmaWxlcyBzaG91bGQgYmUgaWRl
bnRpY2FsLgo+ID4gCj4gPiBDYW4geW91IHNoYXJlIHRoZSBjb250ZW50cyBvZiB0aGUgdHdvIGhl
YWRlciBmaWxlcyBzbyB3ZSBjYW4gc2VlCj4gPiB3aGF0Cj4gPiB0aGUgY29uZmxpY3QgaXM/Cj4g
PiAKPiA+IENoZWVycywKPiA+IAo+ID4gUmljaGFyZAo+IAo+IE1vc3QgY2VydGFpbmx5LiBIZXJl
J3MgdGhlIHN0YW5kYXJkIChpLmUuLCBub24tY2ZpKSB2ZXJzaW9uIG9mIGl0Ogo+IAo+IC8qIFRo
aXMgZmlsZSBpcyBhdXRvbWF0aWNhbGx5IGdlbmVyYXRlZC7CoCAqLwo+ICNpZm5kZWYgX19HTlVf
TElCX05BTUVTX0gKPiAjIGVycm9yICJOZXZlciB1c2UgPGdudS9saWItbmFtZXMtbHA2NGQuaD4g
ZGlyZWN0bHk7IGluY2x1ZGUgCj4gPGdudS9saWItbmFtZXMuaD4gaW5zdGVhZC4iCj4gI2VuZGlm
Cj4gCj4gI2RlZmluZSBMRF9MSU5VWF9SSVNDVjY0X0xQNjREX1NPwqDCoMKgwqDCoMKgICJsZC1s
aW51eC1yaXNjdjY0LWxwNjRkLnNvLjEiCj4gI2RlZmluZSBMRF9TT8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgImxkLWxpbnV4LXJpc2N2NjQtbHA2
NGQuc28uMSIKPiAjZGVmaW5lIExJQkFOTF9TT8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICJsaWJhbmwuc28uMSIKPiAjZGVmaW5lIExJQkJST0tFTkxPQ0FMRV9T
T8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJsaWJCcm9rZW5Mb2NhbGUuc28uMSIKPiAjZGVm
aW5lIExJQkNSWVBUX1NPwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAi
bGliY3J5cHQuc28uMSIKPiAjZGVmaW5lIExJQkNfTUFMTE9DX0RFQlVHX1NPwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAibGliY19tYWxsb2NfZGVidWcuc28uMCIKPiAjZGVmaW5lIExJQkNfU0/CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgImxpYmMuc28uNiIK
PiAjZGVmaW5lIExJQkRMX1NPwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAibGliZGwuc28uMiIKPiAjZGVmaW5lIExJQkdDQ19TX1NPwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAibGliZ2NjX3Muc28uMSIKPiAjZGVmaW5lIExJQk1W
RUNfU0/CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgImxpYm12ZWMu
c28uMSIKPiAjZGVmaW5lIExJQk1fU0/CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgImxpYm0uc28uNiIKPiAjZGVmaW5lIExJQk5TTF9TT8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJsaWJuc2wuc28uMSIKPiAjZGVmaW5l
IExJQk5TU19DT01QQVRfU0/CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgImxpYm5zc19j
b21wYXQuc28uMiIKPiAjZGVmaW5lIExJQk5TU19EQl9TT8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICJsaWJuc3NfZGIuc28uMiIKPiAjZGVmaW5lIExJQk5TU19ETlNfU0/C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgImxpYm5zc19kbnMuc28uMiIKPiAj
ZGVmaW5lIExJQk5TU19GSUxFU19TT8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJs
aWJuc3NfZmlsZXMuc28uMiIKPiAjZGVmaW5lIExJQk5TU19IRVNJT0RfU0/CoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgImxpYm5zc19oZXNpb2Quc28uMiIKPiAjZGVmaW5lIExJQk5TU19M
REFQX1NPwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAibGlibnNzX2xkYXAuc28u
MiIKPiAjZGVmaW5lIExJQlBUSFJFQURfU0/CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgImxpYnB0aHJlYWQuc28uMCIKPiAjZGVmaW5lIExJQlJFU09MVl9TT8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJsaWJyZXNvbHYuc28uMiIKPiAjZGVmaW5lIExJ
QlJUX1NPwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAibGli
cnQuc28uMSIKPiAjZGVmaW5lIExJQlRIUkVBRF9EQl9TT8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgICJsaWJ0aHJlYWRfZGIuc28uMSIKPiAjZGVmaW5lIExJQlVUSUxfU0/CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgImxpYnV0aWwuc28uMSIKPiAKPiBB
bmQgdGhlIGRpZmYgYmV0d2VlbiB0aGlzIGhlYWRlciBhbmQgdGhlIENGSSBvbmUgaXM6Cj4gCj4g
JCBkaWZmICguLi4paW1hZ2UvdXNyL2luY2x1ZGUvZ251L2xpYi1uYW1lcy1scDY0ZC5oIAo+ICgu
Li4pbGliY2ZpLWdsaWJjLzIuMzcvaW1hZ2UvdXNyL2luY2x1ZGUvZ251L2xpYi1uYW1lcy1scDY0
ZC5oCj4gNiw3YzYsNwo+IDwgI2RlZmluZSBMRF9MSU5VWF9SSVNDVjY0X0xQNjREX1NPwqDCoMKg
wqDCoMKgICJsZC1saW51eC1yaXNjdjY0LQo+IGxwNjRkLnNvLjEiCj4gPCAjZGVmaW5lIExEX1NP
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAibGQt
bGludXgtcmlzY3Y2NC0KPiBscDY0ZC5zby4xIgo+IC0tLQo+IMKgPiAjZGVmaW5lIExEX0xJTlVY
X1JJU0NWNjRfTFA2NERfQ0ZJX1NPwqDCoCAibGQtbGludXgtcmlzY3Y2NC1scDY0ZC0KPiBjZmku
c28uMSIKPiDCoD4gI2RlZmluZSBMRF9TT8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgImxkLWxpbnV4LXJpc2N2NjQtbHA2NGQtCj4gY2ZpLnNvLjEi
CgpOZWl0aGVyIG9mIHRob3NlIGxvb2sgbGlrZSB0aGUgZ2VuZXJhdGVkIHRlbXBsYXRlIGZpbGUu
IEknZCBndWVzcyB0aGVyZQphcmUgYXBwZW5kcyBnb2luZyBvbiBpbiB0aGUgcmVjaXBlIGFuZCB0
aGUgbXVsdGlsaWIgaGVhZGVyIG1hbmlwdWxhdGlvbgpoYXBwZW5zIHRvbyBlYXJseSBmb3Igc29t
ZSBvZiB0aGUgY29udGVudC4gSSdtIGp1c3QgZ3Vlc3NpbmcgdGhvdWdoLi4uCgpJJ2QgbG9vayBh
dCB0aGUgb3JkZXIgb2Ygd2hhdCBpcyBoYXBwZW5pbmcgaW4gZG9faW5zdGFsbC4KCkNoZWVycywK
ClJpY2hhcmQKCgo=


