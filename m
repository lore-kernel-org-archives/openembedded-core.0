Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B211C369C2
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 22:07:27 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.32466.1744841237644664638
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Apr 2025 15:07:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TG3GhK/M;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39ee623fe64so111115f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 15:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744841236; x=1745446036; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5d8sMzfCvGhZBWW/BQ13vZle4sJWpH01+hpszfEU1OA=;
        b=TG3GhK/M9QBDOsEJ4IRc/PS/PxHLHTK0mT50+cZsWPkH89WYkmn+hp9jmNXqljkocn
         vlis7vOE8fpW6CUJlVb+zjHrj1LS1eRplrANUK09GZHiTy60lN7QePX79eq3/5e4JNJT
         0c+rOgzw7UTLdM+mcrP2S1bKdnjpHGWortbj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744841236; x=1745446036;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5d8sMzfCvGhZBWW/BQ13vZle4sJWpH01+hpszfEU1OA=;
        b=owAzEHRasy/0rUsjuN/0ZDWLQd/ZvAYbgnmM4/UA03yhMlv+w2DPs/5AlXIS2Gklur
         c9YDtTg9Z2lWYmLJLT6IkUP5iySvJ2Tkh0v/vh9sKNdJJkvT6cWQJ7Z20BIROjQX4yzR
         7O+Ai5CmrQSx1VwYpkUZETjEJ20ov1jJLk5BeQkFMi0j9RD77FG3wj8ngJRKA7iVR8VB
         2KF7r8MciRhr166SSgaumhuoPLCf0hY0V/57Pfh8p/xZKBbA6PO89+ZPYN0LeZJMcoj7
         K7etn3tuPTaO6BtZR2hPJ2css5RFy2phCCBRPHybnKBzC2/xWvsIhEcWMK2sFT0IJKyE
         Fv6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/85JdkJ2K3BZ0OTAGf/jfsMTcfXfWauMZR1pSVmb/LUn5aBT1IDsj8oOydJ0292Ltb1/GqaS7+urjgSv3KePEOg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzhKPsMEe3G0j6ntJ9z24KnE5DpvvnlpIAeazvbbxs97sBE8P7P
	0RUvtAA5vXlU2+kYY07EEW2RSyAliDXD+2RDjej8GSohq0hRHC/j5G9XmrVBXas=
X-Gm-Gg: ASbGncuG4oe2fwmE0gciKT5cF43zdlOmMTyTnnsbwhLeIWPCEDOc7F90HWdaNk3myv9
	/7WobZx6Qqa3DE3GNnnCZCw1yyHFTvVoG6QDpb4ViOxb+1VQMjtOgiPREz68dAy7lzrHLPhLLPI
	8B5+miEnXjOkKMaBcXLanETz5RTu5K6OkCMkuZ/PYJIgVctFwwzi9PqIoPhrk9zT1TCWyTXTMgz
	/QPeCkt7oL2SdaeFb5k+dLm5+7pYeQLrzJZLO6thdhu/YvINosa0m61Mfq5cu2cX229NsXpLRgR
	Z6gbCcOUCxczDMd7LNJmvUcpxSOfpR7l48HSwQ17AV+Yd4+OXxdJd7oypHPRXS6KDhFwoor0i3i
	5Dn8PTcgpuCqa0++UNN1KeZZ19wwkrw==
X-Google-Smtp-Source: AGHT+IG2oHbKRYX3FzYGRPIfAI+uqTrosmgj4+2A9QwbEBZhNV3spwQBNaO9kQQrsiWG25QTUH/69w==
X-Received: by 2002:a05:6000:420b:b0:39c:1efc:1c1c with SMTP id ffacd0b85a97d-39ee5b1c966mr2998346f8f.34.1744841235742;
        Wed, 16 Apr 2025 15:07:15 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e3e1:10a8:f859:c922? ([2001:8b0:aba:5f3c:e3e1:10a8:f859:c922])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b512c52sm32249325e9.30.2025.04.16.15.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 15:07:14 -0700 (PDT)
Message-ID: <dd0877909b1240d999dae6979ce1efa269180173.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oeqa/sdk/sdktest: Add test discovery across
 layers
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: thune.a.tran@boeing.com, openembedded-core@lists.openembedded.org
Cc: Chuck Wolber <chuck.wolber@boeing.com>
Date: Wed, 16 Apr 2025 23:07:13 +0100
In-Reply-To: <20250416164134.399-1-thune.a.tran@boeing.com>
References: <20250416164134.399-1-thune.a.tran@boeing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Apr 2025 22:07:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215019

T24gV2VkLCAyMDI1LTA0LTE2IGF0IDE2OjQxICswMDAwLCBUaHVuZSBUcmFuIHZpYSBsaXN0cy5v
cGVuZW1iZWRkZWQub3JnIHdyb3RlOgo+IFRoZSB0ZXN0c2RrIHRhc2sgb25seSBsb2FkcyBTREsg
dGVzdHMgZnJvbSB0aGUgb3BlbmVtYmVkZGVkLWNvcmUKPiBsYXllcidzIG1ldGEvbGliL29lcWEv
c2RrL2Nhc2VzLy4KPiAKPiBUaGlzIHBhdGNoIGltcGxlbWVudHMgdGVzdCBkaXNjb3ZlcnkgdG8g
aW5jbHVkZSBTREsgdGVzdHMgZnJvbSBhbGwKPiBjb25maWd1cmVkIGxheWVycyB0aGF0IG1pcnJv
ciA8TEFZRVJfRElSPi9saWIvb2VxYS9zZGsvY2FzZXMvLiBUaGUKPiBpbXBsZW1lbnRhdGlvbiBt
aXJyb3JzIGdldF9ydW50aW1lX3BhdGhzKCkgaW4gbWV0YS9jbGFzc2VzLXJlY2lwZS90ZXN0aW1h
Z2UuCj4gCj4gVGVzdGVkIGJ5Ogo+IAo+IDEuIEFkZGluZyBTREsgdGVzdCBjYXNlcyB0byA8TEFZ
RVJfRElSPi9saWIvb2VxYS9zZGsvY2FzZXMvIGFuZAo+IMKgwqAgdmVyaWZ5aW5nIHRoZXkgYXJl
IGRpc2NvdmVyZWQgYW5kIGV4ZWN1dGVkIHdpdGggbm8gZXJyb3JzLgo+IDIuIFZlcmlmeWluZyBl
eGlzdGluZyBTREsgdGVzdCBjYXNlcyBpbiBvcGVuZW1iZWRkZWQtY29yZSBsYXllcgo+IMKgwqAg
YXJlIGRpc2NvdmVyZWQgYW5kIGV4ZWN1dGVkIHdpdGggbm8gZXJyb3JzLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFRodW5lIFRyYW4gPHRodW5lLmEudHJhbkBib2VpbmcuY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IENodWNrIFdvbGJlciA8Y2h1Y2sud29sYmVyQGJvZWluZy5jb20+Cj4gLS0tCj4gwqBtZXRh
L2xpYi9vZXFhL3Nkay90ZXN0c2RrLnB5IHwgMTYgKysrKysrKysrKysrKysrLQo+IMKgMSBmaWxl
IGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvbWV0YS9saWIvb2VxYS9zZGsvdGVzdHNkay5weSBiL21ldGEvbGliL29lcWEvc2RrL3Rlc3Rz
ZGsucHkKPiBpbmRleCA1MThiMDlmZWJiLi41MDVhZGQ4ZjhjIDEwMDY0NAo+IC0tLSBhL21ldGEv
bGliL29lcWEvc2RrL3Rlc3RzZGsucHkKPiArKysgYi9tZXRhL2xpYi9vZXFhL3Nkay90ZXN0c2Rr
LnB5Cj4gQEAgLTMxLDYgKzMxLDIwIEBAIGNsYXNzIFRlc3RTREsoVGVzdFNES0Jhc2UpOgo+IMKg
wqDCoMKgIGNvbnRleHRfY2xhc3MgPSBPRVNES1Rlc3RDb250ZXh0Cj4gwqDCoMKgwqAgdGVzdF90
eXBlID0gJ3NkaycKPiDCoAo+ICvCoMKgwqAgZGVmIGdldF9zZGtfcGF0aHMoc2VsZiwgZCk6Cj4g
K8KgwqDCoMKgwqDCoMKgICIiIgo+ICvCoMKgwqDCoMKgwqDCoCBSZXR1cm5zIGEgbGlzdCBvZiBw
YXRocyB3aGVyZSBTREsgdGVzdCBtdXN0IHJlc2lkZS4KPiArCj4gK8KgwqDCoMKgwqDCoMKgIFNE
SyB0ZXN0cyBhcmUgZXhwZWN0ZWQgaW4gPExBWUVSX0RJUj4vbGliL29lcWEvc2RrL2Nhc2VzLwo+
ICvCoMKgwqDCoMKgwqDCoCAiIiIKPiArwqDCoMKgwqDCoMKgwqAgcGF0aHMgPSBbXQo+ICsKPiAr
wqDCoMKgwqDCoMKgwqAgZm9yIGxheWVyIGluIGQuZ2V0VmFyKCdCQkxBWUVSUycpLnNwbGl0KCk6
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGF0aCA9IG9zLnBhdGguam9pbihsYXllciwgJ2xp
Yi9vZXFhL3Nkay9jYXNlcycpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgb3MucGF0aC5p
c2RpcihwYXRoKToKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBhdGhzLmFwcGVu
ZChwYXRoKQo+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gcGF0aHMKPiArCj4gwqDCoMKgwqAgZGVm
IGdldF90Y25hbWUoc2VsZiwgZCk6Cj4gwqDCoMKgwqDCoMKgwqDCoCAiIiIKPiDCoMKgwqDCoMKg
wqDCoMKgIEdldCB0aGUgbmFtZSBvZiB0aGUgU0RLIGZpbGUKPiBAQCAtMTE0LDcgKzEyOCw3IEBA
IGNsYXNzIFRlc3RTREsoVGVzdFNES0Jhc2UpOgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGhvc3RfcGtnX21hbmlmZXN0PWhvc3RfcGtnX21hbmlmZXN0LCAqKmNvbnRleHRfYXJn
cykKPiDCoAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0cnk6Cj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB0Yy5sb2FkVGVzdHMoc2VsZi5jb250ZXh0X2V4ZWN1dG9yX2NsYXNz
LmRlZmF1bHRfY2FzZXMpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0Yy5sb2Fk
VGVzdHMoc2VsZi5nZXRfc2RrX3BhdGhzKGQpKQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBl
eGNlcHQgRXhjZXB0aW9uIGFzIGU6Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
aW1wb3J0IHRyYWNlYmFjawo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJiLmZh
dGFsKCJMb2FkaW5nIHRlc3RzIGZhaWxlZDpcbiVzIiAlIHRyYWNlYmFjay5mb3JtYXRfZXhjKCkp
Cj4gCgpJIHN1c3BlY3QgdGhpcyBjYXVzZXMgc29tZSByZWdyZXNzaW9ucyBpbiBvdXIgYXV0b21h
dGVkIHRlc3RpbmcgdW5mb3J0dW5hdGVseToKCmJ1aWxkdG9vbHM6Cmh0dHBzOi8vYXV0b2J1aWxk
ZXIueW9jdG9wcm9qZWN0Lm9yZy92YWxreXJpZS8jL2J1aWxkZXJzLzQzL2J1aWxkcy8xMzk2Cgpt
ZXRhLW1pbmd3OgpodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUv
Iy9idWlsZGVycy83L2J1aWxkcy8xNDMwCgpDaGVlcnMsCgpSaWNoYXJkCg==


