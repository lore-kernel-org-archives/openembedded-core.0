Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E61CD6E44
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 13:17:38 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10635.1779974255339281471
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2026 06:17:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Qv3qQjgO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso109720665e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 06:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1779974254; x=1780579054; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VVC3FJgBDc2SOp+RN9tVjX6INXMREQ3dsAO775e0Ff4=;
        b=Qv3qQjgOG/2syPSBtCaDwTGzOrShA3G0ga+MZvqFFmJ9xKdtoiL2YY/E9uckB4FRpa
         OFZer1mHmnnah02y5f8CUJmQ3gSG+MRgDeYJR0PiH2sQP12x6u8ZNbJJCMcbt6vFfwlO
         ozBB3TWdMOIToJq7cntLjFmiqAxMMbOovWNAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779974254; x=1780579054;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VVC3FJgBDc2SOp+RN9tVjX6INXMREQ3dsAO775e0Ff4=;
        b=Pl30scWiPWrUABrwh+ic7uvruZzubcCPM1n4m0S5DhqvhRf7pJU/znGwPoWKs/fpz/
         mFXONby3OWL58ozIes/HNcNGQ796LP7vKlYreidSiAHlCeg7Nov7jAjKbTwFtPqL6jU7
         gVQu6G9TOqb9oZvtbQjDn3343JThJqB5uu7EccvcpE/OfsH6bGRZfb/x84g5H3owDbOZ
         f7hu1txJGWp3B5iMKfnFI2TS0YDnUCc4upXNhPE3y/v7pOnDb8Sjn0RRjjlXlFOc6YWh
         rcKMIBc1bSq3vBwkIsl2t2jctX+iMNa79n7JJMKbj3LEHMhmkJgqFne70tLxTu75QNTx
         yWRQ==
X-Forwarded-Encrypted: i=1; AFNElJ8VOohz7BkI0bvVcy3UUvt9hhzQNfe+BQtxMHtrACbEN3r6m3ofJsdrCHlc5XrRh6s6Ep4WMNSSFLVXDnHa6rOP6w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw0fbnDyRwmGHf+4ydjxJ3+4nNSf6aLmghFHPkFIQsQffLTfpXF
	mrGZzsEhCRR+GIULm/n39nzBMeUCZSufNqq+cexIe/FUNgCLX4ptPam3WaQuoxU+nJM=
X-Gm-Gg: Acq92OHfTSaXoXrpDTaxRTJp8GSdMA5g8hvuQ6jI33nWQ4d22T8cWZdYdsC4/BMm/Ik
	tq5RRqokTGfO/YkQscUllCtHtKDnl8d3Qf629WXU5TLeILOLoI3E5yTWzVsZRMehfihpD5YUe5J
	MnG0l+scF1f3cCzaY61y1G75XUQO/W39Lp1m9oGQ4jVr4XIegOvHEukBlyjfoldimu0OpcdQRX5
	Do2tC2zQdPAvHxKpt0XpKDh5ocgdUzlerkAr26IlyB7p7j/bt6p5eYDaJclYI1jU+U69ElMWJVd
	JEGYGxowLDtgv2OdljiNYDBfMHYucSvaZrMmOLsE8+d8dHEEploEw6DZpsan14WwoQ21OTVogn4
	YN7T7ciivSyOQnNHUuRC5k2SlJAMWTlBGtNafm5lV4CqhHUuSaXZDVF3bDrGng6HB/t14qXXvbf
	VJ3LppF+0CkRA9uPWq3p0RBDSyzoRv0MB5eBs6/+cXE5o28IcO8xPq+af8DKrXycniGr18XXiQs
	nIYG32HRC9gjJWJh+aVSB70
X-Received: by 2002:a05:600d:844a:10b0:490:4b89:535d with SMTP id 5b1f17b1804b1-4904b8955f6mr292996455e9.1.1779974253548;
        Thu, 28 May 2026 06:17:33 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2db8:3c60:1e4f:5bd? ([2001:8b0:aba:5f3c:2db8:3c60:1e4f:5bd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49092654befsm39724885e9.6.2026.05.28.06.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 06:17:32 -0700 (PDT)
Message-ID: <b4e726b5a3803edce5545f6b504e3ecb072dcdcc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] clang: introduce thin-lto-pgo
 PACKAGECONFIG for PGO bootstrap
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mark.yang@lge.com, openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 May 2026 14:17:31 +0100
In-Reply-To: <20260521003929.14947-1-mark.yang@lge.com>
References: <20260521003929.14947-1-mark.yang@lge.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 May 2026 13:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237707

T24gVGh1LCAyMDI2LTA1LTIxIGF0IDA5OjM5ICswOTAwLCBtYXJrLnlhbmcgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgd3JvdGU6Cj4gRnJvbTogIm1hcmsueWFuZyIgPG1hcmsueWFuZ0BsZ2Uu
Y29tPgo+IAo+IEludHJvZHVjZSB0aGluLWx0by1wZ28gUEFDS0FHRUNPTkZJRyBlbmFibGluZyBj
bGFuZydzIFBHTytUaGluTFRPIGJvb3RzdHJhcCBmb3Igc3RhbmRhbG9uZSBjbGFuZyBidWlsZHMu
Cj4gY2xhbmctbmF0aXZlIGFuZCBsbHZtLW5hdGl2ZSBhcmUgc2VwYXJhdGUgcmVjaXBlcywgc28g
dGhlIFBHTyBidWlsZCBydW5zIGluIHN0YW5kYWxvbmUgbW9kZS4KPiAKPiBVc2luZyBQR08gb25s
eSBmb3IgY2xhbmcgb3B0aW1pemVzIG9ubHkgdGhlIGZyb250ZW5kLCBzbyBpdCBpcyByZWNvbW1l
bmRlZCB0byBhbHNvIGFwcGx5IFBHTyBvcHRpbWl6YXRpb24gdG8gbGliTExWTSAobWlkLWVuZCwg
YmFja2VuZCkuCj4gbGx2bS1wcm9qZWN0IGFzc3VtZXMgUEdPIG9wdGltaXphdGlvbiBpcyBwZXJm
b3JtZWQgd2hlbiBjbGFuZyBhbmQgbGx2bSBhcmUgaW4gYSBtb25vcmVwby4KPiAKPiBTZWxlY3Rl
ZCB0aGUgdG9wIDEwIGNvbXBvbmVudHMgdXNpbmcgY2xhbmcgYXMgYSB0b29sY2hhaW4gaW4gY29y
ZS1pbWFnZS1zYXRvIGFuZCBjb21wYXJlZCB0aGVpciBkb19jb21waWxlIHRpbWUgZnJvbSBidWls
ZHN0YXQuCj4gQnVpbHQgc2VxdWVudGlhbGx5IHRvIGF2b2lkIHdhcm0gY2FjaGUgaGl0cyBhbmQg
cGVyZm9ybWVkIDEwIGN5Y2xlcy4KPiBDb21wYXJlZCB0aGUgbWVkaWFuIG9mIGNvbXBpbGUgdGlt
ZS4KPiBBTUQgUnl6ZW4gOSA3OTUweCAoMTYgY29yZXMsIDMyIHRocmVhZHMpCj4gQkJfTlVNQkVS
X1RIUkVBRFMgPSAiMzIiCj4gUEFSQUxMRUxfTUFLRSA9ICItaiAzMiIKPiBUT09MQ0hBSU4gPSAi
Y2xhbmciCj4gUEFDS0FHRUNPTkZJRzphcHBlbmQ6cG4tY2xhbmctbmF0aXZlID0gIiB0aGluLWx0
by1wZ28iCj4gCj4gUmVjaXBlwqDCoMKgwqDCoMKgwqDCoCBiYXNlbGluZSAocynCoMKgIHRoaW4t
bHRvLXBnbyAocynCoMKgIGRpZmYKPiBzcWxpdGUzwqDCoMKgwqDCoMKgwqAgMzYuNDU1wqDCoMKg
wqDCoMKgwqDCoCAzNS41NTDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLTIuNSUKPiBmbXTCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIDI0Ljc3MMKgwqDCoMKgwqDCoMKgwqAgMjEuNjg1wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC0xMi41JQo+IHBlcmzCoMKgwqDCoMKgwqDCoMKgwqDCoCAzNi40NzDC
oMKgwqDCoMKgwqDCoMKgIDM1LjI1MMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtMy4zJQo+IGxp
YnVuaXN0cmluZ8KgwqAgMzYuMzAwwqDCoMKgwqDCoMKgwqDCoCAzMC44MjDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgLTE1LjElCj4gaWN1wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAzMC45MzDCoMKg
wqDCoMKgwqDCoMKgIDE5Ljg0MMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtMzUuOSUKPiBsaWJy
c3ZnwqDCoMKgwqDCoMKgwqAgNzMuNzg1wqDCoMKgwqDCoMKgwqDCoCA3NC43MDDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgKzEuMiUKPiBtZXNhwqDCoMKgwqDCoMKgwqDCoMKgwqAgMzkuNjEwwqDC
oMKgwqDCoMKgwqDCoCAyOC4zODDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLTI4LjQlCj4gb3Bl
bnNzbMKgwqDCoMKgwqDCoMKgIDI3LjUwNcKgwqDCoMKgwqDCoMKgwqAgMjAuNDg1wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIC0yNS41JQo+IGJpbnV0aWxzwqDCoMKgwqDCoMKgIDM2Ljg1NcKgwqDC
oMKgwqDCoMKgwqAgMzMuMjgwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC05LjclCj4gYnVzeWJv
eMKgwqDCoMKgwqDCoMKgIDE4LjEwMMKgwqDCoMKgwqDCoMKgwqAgMTYuOTI1wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIC02LjUlCj4gCj4gT25lLXRpbWUgYm9vdHN0cmFwIGNvc3Q6IGNsYW5nLW5h
dGl2ZSBkb19jb21waWxlIDQ0OHMgLT4gMTMwN3MKClRoaXMgaXMgZGVmaW5pdGVseSBpbnRlcmVz
dGluZyB3b3JrLCB0aGFua3MgZm9yIHNoYXJpbmcgaXQhCgpJJ20gYSBiaXQgd29ycmllZCBmcm9t
IHR3byBwZXJzcGVjdGl2ZXMuIEZpcnN0bHksIGl0IGFkZHMgc29tZQpsYXJnZXIvY29tcGxleCBw
YXRjaGVzIHdoaWNoIGFyZSBtYXJrZWQgYXMgIkluYXBwcm9wcmlhdGUiIGZvcgp1cHN0cmVhbS4g
VGhlc2UgYXJlIGdvaW5nIHRvIG1ha2UgaXQgaGFyZCB0byB1cGRhdGUgY2xhbmcgdmVyc2lvbnMg
YW5kCmdlbmVyYWxseSBjb21wbGljYXRlIG91ciBtYWludGVuYW5jZSBvZiB0aGUgY2xhbmcvbGx2
bSByZWNpcGVzLiBJcwp0aGVyZSBzb21ldGhpbmcgd2UgY291bGQgZGlzY3VzcyB3aXRoIHVwc3Ry
ZWFtIHRvIHJlbW92ZSB0aGUgbmVlZCB0bwpjYXJyeSBwYXRjaGVzPwoKU2Vjb25kbHksIEkgYW0g
d29ycmllZCBhYm91dCB0aGUgY29tcGlsZSB0aW1lcy4gQW4gZXh0cmEgfjkwMHMgb3IgMTUKbWlu
dXRlcyBpcyBhIGxvdCBvZiBleHRyYSB0aW1lIHRvIGFkZCB0byBvdXIgYnVpbGRzLiBJIGFwcHJl
Y2lhdGUgdGhpcwppc24ndCB0dXJuZWQgb24gYnkgZGVmYXVsdCwgYnV0IHRoZW4gaWYgaXQgaXNu
J3QgdHVybmVkIG9uLCBpdCBpc24ndApnb2luZyB0byBnZXQgdGVzdGVkIGFuZCB0aGlzIGZlZWxz
IGxpa2Ugc29tZXRoaW5nIHRoYXQgY291bGQgZ2V0IGVhc2lseQpicm9rZW4uCgpHaXZlbiB0aG9z
ZSB0d28gdGhpbmdzLCBJJ20gcmF0aGVyIHJlbHVjdGFudCB0byB0YWtlIHBhdGNoZXMgbGlrZSB0
aGlzCmluIHRoZWlyIGN1cnJlbnQgZm9ybS4KCkNoZWVycywKClJpY2hhcmQKCgoK


