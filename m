Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F291C48BC3
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 09:05:24 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.9410.1708419917373152445
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Feb 2024 01:05:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gVlZ/URN;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-33d6f26ff33so114090f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 01:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708419916; x=1709024716; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keMif8pptFys1ZnGFx19a0BDLSEYi3oaUTjNnQnqj/s=;
        b=gVlZ/URNsuHN/x4i5d2oMYlKV7IiUAWOb6sT3AfZ8v38g5x4kGcRIQ2/5g3caSYbj2
         HCcEeeBIfR0vwMTIYpTCNeMhFsxnPN2lgJxo4V+2xkousVk5tpOtMO51ZtEcpA6EcTyz
         SDMh7S7vumpYHDA+xZRiW383aiW39tCBTeaZ34LxG45ZYg0APHOjxN6IPBdDqOLY8VIs
         B2fdWl7YP24oxuyLZw4vqGW1Mo7bZeaXhSxE7ZkL4IMcroG2/0Qb7zyDRvkDQJ812Wwp
         h+HbAW890rjh/GIujEhTGm89Zah4eYA2vNhHqb6mc/HIVxjtyrdQwP22qopjAfsNHg+p
         tYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708419916; x=1709024716;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=keMif8pptFys1ZnGFx19a0BDLSEYi3oaUTjNnQnqj/s=;
        b=rhw57baTK95I0FCsyHksor1RX72hQOCT67KKqX0vJ8yUuchDTtPfziKPkLFlLEeMdn
         zx0uCf8K3BcRAkX77zMp58K5G07XqU/F03/kDE37/nPsQHhAo20UCoabscTvNowhHE0t
         pGs0TozGbuCkkFSNGzq5rdI65wFzpsxaLjvINgwWteXYHoQbA4C3HuEm+yiL4VEevMN5
         BfvHHuKTVRq5Xe4MYd+YWgYTB+gWE6auC4idAIaCh6T6ZfiANnwjPNm3lVAk0pTI1FeK
         XDWeJ8COrziHGKveSEj4C4ezO3STADfqhCmOrJ+WbeDmIyyiOyTmlro2u2Yx+Lv6f4cM
         3j6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVYxdgxcP2ikm95shRMhGkq4ul5Nq3Ke8LONqXq+iTEXSufHibnsQx8Ej7krHw6Zacy8WiDxrageMHNfg94B4JVZpghqwqA/LmOwNb+79rbP3crI6J/0F6M
X-Gm-Message-State: AOJu0YyTqMQXxDJ9YXwV+10YTKd2AKaSbSHlQNFHNB5rK3k8R9dECb/0
	cCvABsZrfotB5LidYZrK6DOtSSlTepH0ITzBU0ENeUovVpXPBvKj
X-Google-Smtp-Source: AGHT+IGSHbukgKvOVO0+c2zHc7p5a5LqwwEpKrTyBXIFNDQeFSmO7xihqQ9RIES9h+dBo3m1GKWaxQ==
X-Received: by 2002:a05:6000:d84:b0:33d:2a1e:55d9 with SMTP id dv4-20020a0560000d8400b0033d2a1e55d9mr5101299wrb.35.1708419914803;
        Tue, 20 Feb 2024 01:05:14 -0800 (PST)
Received: from [192.168.113.175] ([178.197.195.255])
        by smtp.gmail.com with ESMTPSA id k5-20020a5d66c5000000b0033af3a43e91sm12696383wrw.46.2024.02.20.01.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 01:05:14 -0800 (PST)
Message-ID: <724ff9e40a756684fb62f228d9cfcdf5a27256fb.camel@gmail.com>
Subject: Re: [PATCH v2 3/5] devtool: ide: vscode: Configure read-only files
From: adrian.freihofer@gmail.com
To: Enguerrand de Ribaucourt
 <enguerrand.de-ribaucourt@savoirfairelinux.com>, 
 openembedded-core@lists.openembedded.org
Date: Tue, 20 Feb 2024 10:05:12 +0100
In-Reply-To: <20240219165525.714512-4-enguerrand.de-ribaucourt@savoirfairelinux.com>
References: 
	<20240219165525.714512-1-enguerrand.de-ribaucourt@savoirfairelinux.com>
	 <20240219165525.714512-4-enguerrand.de-ribaucourt@savoirfairelinux.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 09:05:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195908

T24gTW9uLCAyMDI0LTAyLTE5IGF0IDE3OjU1ICswMTAwLCBFbmd1ZXJyYW5kIGRlIFJpYmF1Y291
cnQgd3JvdGU6Cj4gV2hlbiBkZWJ1Z2dpbmcgb3IgYnJvd3NpbmcgZmlsZXMsIHRoZSB1c2VyIG1h
eSBmYWxsIGludG8gZXh0ZXJuYWwKPiBzb3VyY2VzIGZyb20gb3RoZXIgcGFja2FnZXMgaW4gdGhl
IHN5c3Jvb3Qgb3IgZGJnLXJvb3Rmcy4gTW9kaWZ5aW5nCj4gdGhlbQo+IHdpbGwgb25seSBsZWFk
IHRvIGNvbmZ1c2lvbiBzaW5jZSB0aGV5IHdpbGwgYmUgb3ZlcndyaXR0ZW4gYnkgWW9jdG8uCj4g
VGhlCj4gdXNlciBzaG91bGQgb3BlbiB0aGVtIGluIGEgc2VwYXJhdGUgZGV2dG9vbCBtb2RpZnkg
c2Vzc2lvbiBpZiB0aGV5Cj4gd2FudAo+IHRvIG1ha2UgY2hhbmdlcy4gTWVhbndoaWxlLCB3ZSBz
aG91bGQgcHJldmVudCB3cml0ZSBhY2Nlc3MgdG8gdGhlbS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBF
bmd1ZXJyYW5kIGRlIFJpYmF1Y291cnQKPiA8ZW5ndWVycmFuZC5kZS1yaWJhdWNvdXJ0QHNhdm9p
cmZhaXJlbGludXguY29tPgo+IC0tLQo+IMKgc2NyaXB0cy9saWIvZGV2dG9vbC9pZGVfcGx1Z2lu
cy9pZGVfY29kZS5weSB8IDExICsrKysrKysrKy0tCj4gwqAxIGZpbGUgY2hhbmdlZCwgOSBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9zY3JpcHRzL2xpYi9k
ZXZ0b29sL2lkZV9wbHVnaW5zL2lkZV9jb2RlLnB5Cj4gYi9zY3JpcHRzL2xpYi9kZXZ0b29sL2lk
ZV9wbHVnaW5zL2lkZV9jb2RlLnB5Cj4gaW5kZXggYzA2M2I3ZDA1OTAuLjdiNjgzYzc0MDg2IDEw
MDY0NAo+IC0tLSBhL3NjcmlwdHMvbGliL2RldnRvb2wvaWRlX3BsdWdpbnMvaWRlX2NvZGUucHkK
PiArKysgYi9zY3JpcHRzL2xpYi9kZXZ0b29sL2lkZV9wbHVnaW5zL2lkZV9jb2RlLnB5Cj4gQEAg
LTEyNSw3ICsxMjUsNyBAQCBjbGFzcyBJZGVWU0NvZGUoSWRlQmFzZSk6Cj4gwqDCoMKgwqDCoMKg
wqDCoCBzZXR0aW5nc19kaWN0WyJjbWFrZS5jb25maWd1cmVPbk9wZW4iXSA9IFRydWUKPiDCoMKg
wqDCoMKgwqDCoMKgIHNldHRpbmdzX2RpY3RbImNtYWtlLnNvdXJjZURpcmVjdG9yeSJdID0KPiBt
b2RpZmllZF9yZWNpcGUucmVhbF9zcmN0cmVlCj4gwqAKPiAtwqDCoMKgIGRlZiB2c2NvZGVfc2V0
dGluZ3Moc2VsZiwgbW9kaWZpZWRfcmVjaXBlKToKPiArwqDCoMKgIGRlZiB2c2NvZGVfc2V0dGlu
Z3Moc2VsZiwgbW9kaWZpZWRfcmVjaXBlLCBpbWFnZV9yZWNpcGUpOgo+IMKgwqDCoMKgwqDCoMKg
wqAgZmlsZXNfZXhjbHVkZXMgPSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICIqKi8uZ2l0
LyoqIjogVHJ1ZSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIioqL29lLWxvZ3MvKioiOiBU
cnVlLAo+IEBAIC0xMzgsOSArMTM4LDE2IEBAIGNsYXNzIElkZVZTQ29kZShJZGVCYXNlKToKPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIioqL29lLXdvcmtkaXIvKioiLAo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAiKiovc291cmNlLWRhdGUtZXBvY2gvKioiCj4gwqDCoMKgwqDCoMKgwqDC
oCBdCj4gK8KgwqDCoMKgwqDCoMKgIGZpbGVzX3JlYWRvbmx5ID0gewo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIG1vZGlmaWVkX3JlY2lwZS5yZWNpcGVfc3lzcm9vdCArICcvKionOiBUcnVlLAo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1vZGlmaWVkX3JlY2lwZS5yZWNpcGVfc3lzcm9vdF9u
YXRpdmUgKyAnLyoqJzogVHJ1ZSwKPiArwqDCoMKgwqDCoMKgwqAgfQo+ICvCoMKgwqDCoMKgwqDC
oCBpZiBpbWFnZV9yZWNpcGUucm9vdGZzX2RiZyBpcyBub3QgTm9uZToKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBmaWxlc19yZWFkb25seVtpbWFnZV9yZWNpcGUucm9vdGZzX2RiZyArICcvKion
XSA9IFRydWUKPiDCoMKgwqDCoMKgwqDCoMKgIHNldHRpbmdzX2RpY3QgPSB7Cj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICJmaWxlcy53YXRjaGVyRXhjbHVkZSI6IGZpbGVzX2V4Y2x1ZGVzLAo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiZmlsZXMuZXhjbHVkZSI6IGZpbGVzX2V4Y2x1ZGVz
LAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJmaWxlcy5yZWFkb25seUluY2x1ZGUiOiBmaWxl
c19yZWFkb25seSwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgInB5dGhvbi5hbmFseXNpcy5l
eGNsdWRlIjogcHl0aG9uX2V4Y2x1ZGUKPiDCoMKgwqDCoMKgwqDCoMKgIH0KPiDCoMKgwqDCoMKg
wqDCoMKgIHNlbGYuX192c2NvZGVfc2V0dGluZ3NfY21ha2Uoc2V0dGluZ3NfZGljdCwgbW9kaWZp
ZWRfcmVjaXBlKQo+IEBAIC00MjUsNyArNDMyLDcgQEAgY2xhc3MgSWRlVlNDb2RlKElkZUJhc2Up
Ogo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzZWxmLnZzY29kZV90YXNrc19mYWxsYmFjayhh
cmdzLCBtb2RpZmllZF9yZWNpcGUpCj4gwqAKPiDCoMKgwqDCoCBkZWYgc2V0dXBfbW9kaWZpZWRf
cmVjaXBlKHNlbGYsIGFyZ3MsIGltYWdlX3JlY2lwZSwKPiBtb2RpZmllZF9yZWNpcGUpOgo+IC3C
oMKgwqDCoMKgwqDCoCBzZWxmLnZzY29kZV9zZXR0aW5ncyhtb2RpZmllZF9yZWNpcGUpCj4gK8Kg
wqDCoMKgwqDCoMKgIHNlbGYudnNjb2RlX3NldHRpbmdzKG1vZGlmaWVkX3JlY2lwZSwgaW1hZ2Vf
cmVjaXBlKQo+IMKgwqDCoMKgwqDCoMKgwqAgc2VsZi52c2NvZGVfZXh0ZW5zaW9ucyhtb2RpZmll
ZF9yZWNpcGUpCj4gwqDCoMKgwqDCoMKgwqDCoCBzZWxmLnZzY29kZV9jX2NwcF9wcm9wZXJ0aWVz
KG1vZGlmaWVkX3JlY2lwZSkKPiDCoMKgwqDCoMKgwqDCoMKgIGlmIGFyZ3MudGFyZ2V0OgoKTEdU
TS4KQWRyaWFuCgo=


