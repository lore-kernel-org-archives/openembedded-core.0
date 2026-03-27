Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADD1410BA45D
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 09:17:27 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67947.1774603041114191033
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 02:17:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=RfkIZaCA;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-486507134e4so21912025e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 02:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774603039; x=1775207839; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h5pcnBzOjInPep75EiFsN0eiNCje1zqZJ3vI7Wmx6bA=;
        b=RfkIZaCAV3eH1tnXx7Qx/hXsqzVq7LMC2/yOpq1izYa1B3AOe5ByAvgv/i6Y9cFqxK
         FmBXHlImzDbEmvjs2hxIW7Sn2/pnozHFT6jEnQFC5DcUKTghkwy1uzz6qPEMP2ApsR8I
         YIQ0yUYm3nDmKNAmW8HXqFvwXBS6916mz7lu7ML+0yk/LlzZfvRn+xUmjbZr4Q8ouscb
         OtsCyOGStNGl/m6NHuhgrzbOdk7uZqgjDKyVwGiY4jTrsNLmS25EvD4JJ25IyS4jK07j
         UL/cZ0M/kHp9JfkgdAEXfUddqKDEsviW7OCEJ509160CRHQM4U+6Hl7NucSPNh1ISy8M
         4nqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774603039; x=1775207839;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h5pcnBzOjInPep75EiFsN0eiNCje1zqZJ3vI7Wmx6bA=;
        b=q3ioW19lBDjLzwg8npl2PmTK0rA1BWjIlyzGjIX4EzDKYVKkwQN74T0e2Vie+6ut79
         7BoePvfG4LANvm3pi3k+0zo4u+19u0e8CZzwUpeTCwex++GzcMDl8n9nG6x272Gt0Vhv
         uXsRhwZlQC2xu+s0qBaQa1zLuRv8W2fmI0BTpWtD5CpxfNMCwHyWjJdcAVbzb5Au+sMT
         TS1DhC7JfknmYsjl2P+2h/M0ZdGSv0Z/9jBmSP/WZI9eThXu/lj1QAF57MAsnez7ly4Y
         haH25y/xXqVl7SgSsy77SBr3FJMUHsEc6yrrhxowea0u9wW0sXUKg2/OnqXEBwwrDWLQ
         4VAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzUzT1jEG15K4jAVv7f6xa1EYWaCoKys77hM7yfYsh3GZBscHd1iOJcGCydSb9I2uH8+K5MDlo8h1mrbhh4rrEMg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YytuZwOIcHm6Bs5/gUteYc6UedAe/DIOcu0nRZ+v2HMTi/ilfga
	QJWbscQLakUBAPKFCgp4Y6/8HU+7kRXrzSmQ60nJEqe4sf1KeTcJJc84
X-Gm-Gg: ATEYQzxlkX6OyFdW4LR8OO3xfKAJMlvgjKc9c5/kuTJXeFJv2ZM1qu6L4kKCHoAevrJ
	+s8KBSx/2WnWJm8TNEPvApH0c23+Mzzq7Wwjr7k1mw8h8aIqQu85AGRDBpQa5aFqkJeexjeKsci
	R2pD0zKWLg+6SUO4K+4rh1KRN9uJbZYXBqKFSfihEZ6dpsK7UtpIWl0WSPqonn4YRMq3IUdnekw
	rF8dOfOwTIsbJFupXxYOhkfDSwGmQ7pB8wI3QfW3UfGzev0Mn4cqXnEu0XUN29q2osEZ8TgS/MH
	qGtRvpcFxAvY8VLnuMvy6IUov8SIh2ovkIcKy8+sUfWu0nBA6kPJutTYEVjI7T35lUIawCZxBCs
	ACxfKvPuAUH3zkP9hQNEAQfcnUD4ENbPJhgdaYNy8YH6er6PcKuR91HppaB+VwmK6A6P+J9YxKQ
	X2Z8nD/nsbjIx8KQIoh/WLcrfgKc4t8BK7ZUu4GXg/odDBulYQWsvvJJWY3Dj/YC0onw==
X-Received: by 2002:a05:600c:6819:b0:485:40fd:8390 with SMTP id 5b1f17b1804b1-48727f238d9mr29596485e9.26.1774603039313;
        Fri, 27 Mar 2026 02:17:19 -0700 (PDT)
Received: from [192.168.2.122] (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c8cfdcsm109837905e9.8.2026.03.27.02.17.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 02:17:18 -0700 (PDT)
Message-ID: <8eb452fd-0111-4be8-90eb-31e3cc439685@gmail.com>
Date: Fri, 27 Mar 2026 10:17:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 01/12] python3: Add warning comment before
 PACKAGECONFIG[freethreading]
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>,
 Trevor Gamblin <tgamblin@baylibre.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>
References: <18A06529173E9998.57592@lists.openembedded.org>
 <20260326143020.2083293-1-zboszor@gmail.com>
 <DHDFFKPALHBR.U69UUGIUROAO@bootlin.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <DHDFFKPALHBR.U69UUGIUROAO@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 09:17:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234074

MjAyNi4gMDMuIDI3LiA5OjM3IGtlbHRlesOpc3NlbCwgTWF0aGlldSBEdWJvaXMtQnJpYW5k
IMOtcnRhOg0KPiBPbiBUaHUgTWFyIDI2LCAyMDI2IGF0IDM6MzAgUE0gQ0VULCBab2x0YW4g
Qm9zem9ybWVueWkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+PiBUaGUg
d2FybmluZyBjb21tZW50IGlzIHJlYWxseSBuZWVkZWQuIFdoaWxlIFB5dGhvbiAzLjE0IHN1
cHBvcnRzDQo+PiBmcmVlLXRocmVhZGluZyBvZmZpY2lhbGx5LCB0aGUgZWNvc3lzdGVtIGFy
b3VuZCBpdCBkb2VzIG5vdCB5ZXQuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogWm9sdMOhbiBC
w7ZzesO2cm3DqW55aSA8emJvc3pvckBnbWFpbC5jb20+DQo+PiAtLS0NCj4gSGkgWm9sdMOh
biwNCj4NCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoLiBXZSBhcmUgc2VlaW5nIHR3byBpc3N1
ZXMgb24gdGhlIGF1dG9idWlsZGVyOg0KPg0KPiBGaXJzdCwgc29tZSBmaWxlIGlzIG5vdCBz
aGlwcGVkOg0KPiBFUlJPUjogbmF0aXZlc2RrLXB5dGhvbjMtMy4xNC4zLXIwIGRvX3BhY2th
Z2U6IFFBIElzc3VlOiBuYXRpdmVzZGstcHl0aG9uMzogRmlsZXMvZGlyZWN0b3JpZXMgd2Vy
ZSBpbnN0YWxsZWQgYnV0IG5vdCBzaGlwcGVkIGluIGFueSBwYWNrYWdlOg0KPiAgICAvdXNy
L2xvY2FsL29lLXNkay1oYXJkY29kZWQtYnVpbGRwYXRoL3N5c3Jvb3RzL3g4Nl82NC1wb2t5
c2RrLWxpbnV4L3Vzci9iaW4vcHl0aG9uMy4xNC5yZWFsDQo+DQo+IFRoZW4sIHNvbWUgcGFj
a2FnZSBjb25mbGljdDoNCj4gRVJST1I6IGNvcmUtaW1hZ2Utc2F0by0xLjAtcjAgZG9fcm9v
dGZzOiBDb3VsZCBub3QgaW52b2tlIGRuZi4gQ29tbWFuZCAnL3Nydi9wb2t5YnVpbGQveW9j
dG8td29ya2VyL2dlbmVyaWN4ODYtNjQvYnVpbGQvYnVpbGQvdG1wL3dvcmsvZ2VuZXJpY3g4
Nl82NC1wb2t5LWxpbnV4L2NvcmUtaW1hZ2Utc2F0by8xLjAvcmVjaXBlLXN5c3Jvb3QtbmF0
aXZlL3Vzci9iaW4vZG5mIC12IC0tcnBtdmVyYm9zaXR5PWluZm8gLXkgLWMgL3Nydi9wb2t5
YnVpbGQveW9jdG8td29ya2VyL2dlbmVyaWN4ODYtNjQvYnVpbGQvYnVpbGQvdG1wL3dvcmsv
Z2VuZXJpY3g4Nl82NC1wb2t5LWxpbnV4L2NvcmUtaW1hZ2Utc2F0by8xLjAvcm9vdGZzL2V0
Yy9kbmYvZG5mLmNvbmYgLS1zZXRvcHQ9cmVwb3NkaXI9L3Nydi9wb2t5YnVpbGQveW9jdG8t
d29ya2VyL2dlbmVyaWN4ODYtNjQvYnVpbGQvYnVpbGQvdG1wL3dvcmsvZ2VuZXJpY3g4Nl82
NC1wb2t5LWxpbnV4L2NvcmUtaW1hZ2Utc2F0by8xLjAvcm9vdGZzL2V0Yy95dW0ucmVwb3Mu
ZCAtLWluc3RhbGxyb290PS9zcnYvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9nZW5lcmljeDg2
LTY0L2J1aWxkL2J1aWxkL3RtcC93b3JrL2dlbmVyaWN4ODZfNjQtcG9reS1saW51eC9jb3Jl
LWltYWdlLXNhdG8vMS4wL3Jvb3RmcyAtLXNldG9wdD1sb2dkaXI9L3Nydi9wb2t5YnVpbGQv
eW9jdG8td29ya2VyL2dlbmVyaWN4ODYtNjQvYnVpbGQvYnVpbGQvdG1wL3dvcmsvZ2VuZXJp
Y3g4Nl82NC1wb2t5LWxpbnV4L2NvcmUtaW1hZ2Utc2F0by8xLjAvdGVtcCAtLXJlcG9mcm9t
cGF0aD1vZS1yZXBvLC9zcnYvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9nZW5lcmljeDg2LTY0
L2J1aWxkL2J1aWxkL3RtcC93b3JrL2dlbmVyaWN4ODZfNjQtcG9reS1saW51eC9jb3JlLWlt
YWdlLXNhdG8vMS4wL29lLXJvb3Rmcy1yZXBvIC0tbm9ncGdjaGVjayBpbnN0YWxsIGRuZiBw
YWNrYWdlZ3JvdXAtYmFzZS1leHRlbmRlZCBwYWNrYWdlZ3JvdXAtY29yZS1ib290IHBhY2th
Z2Vncm91cC1jb3JlLXNzaC1kcm9wYmVhciBwYWNrYWdlZ3JvdXAtY29yZS14MTEtYmFzZSBw
YWNrYWdlZ3JvdXAtY29yZS14MTEtc2F0byBwc3BsYXNoIHJwbSBydW4tcG9zdGluc3RzIGxv
Y2FsZS1iYXNlLWMgbG9jYWxlLWJhc2UtZW4tdXMgbG9jYWxlLWJhc2UtZW4tZ2InIHJldHVy
bmVkIDE6DQo+IERORiB2ZXJzaW9uOiA0LjI0LjANCj4gY2FjaGVkaXI6IC9zcnYvcG9reWJ1
aWxkL3lvY3RvLXdvcmtlci9nZW5lcmljeDg2LTY0L2J1aWxkL2J1aWxkL3RtcC93b3JrL2dl
bmVyaWN4ODZfNjQtcG9reS1saW51eC9jb3JlLWltYWdlLXNhdG8vMS4wL3Jvb3Rmcy92YXIv
Y2FjaGUvZG5mDQo+IEFkZGVkIG9lLXJlcG8gcmVwbyBmcm9tIC9zcnYvcG9reWJ1aWxkL3lv
Y3RvLXdvcmtlci9nZW5lcmljeDg2LTY0L2J1aWxkL2J1aWxkL3RtcC93b3JrL2dlbmVyaWN4
ODZfNjQtcG9reS1saW51eC9jb3JlLWltYWdlLXNhdG8vMS4wL29lLXJvb3Rmcy1yZXBvDQo+
IFVzZXItQWdlbnQ6IGZhbGxpbmcgYmFjayB0byAnbGliZG5mJzogY291bGQgbm90IGRldGVj
dCBPUyBvciBiYXNlYXJjaA0KPiByZXBvOiB1c2luZyBjYWNoZSBmb3I6IG9lLXJlcG8NCj4g
b2UtcmVwbzogdXNpbmcgbWV0YWRhdGEgZnJvbSBUaHUgMjYgTWFyIDIwMjYgMDk6NTc6MjQg
UE0gVVRDLg0KPiAtLT4gU3RhcnRpbmcgZGVwZW5kZW5jeSByZXNvbHV0aW9uDQo+IC0tPiBG
aW5pc2hlZCBkZXBlbmRlbmN5IHJlc29sdXRpb24NCj4gRXJyb3I6DQo+ICAgUHJvYmxlbSAx
OiBjb25mbGljdGluZyByZXF1ZXN0cw0KPiAgICAtIG5vdGhpbmcgcHJvdmlkZXMgcHl0aG9u
My1jb21wcmVzc2lvbiBuZWVkZWQgYnkgZG5mLTQuMjQuMC1yMC5jb3JlMl82NCBmcm9tIG9l
LXJlcG8NCj4gICAgLSBub3RoaW5nIHByb3ZpZGVzIHB5dGhvbjMtY3R5cGVzIG5lZWRlZCBi
eSBkbmYtNC4yNC4wLXIwLmNvcmUyXzY0IGZyb20gb2UtcmVwbw0KPiAgICAtIG5vdGhpbmcg
cHJvdmlkZXMgcHl0aG9uMy1lbWFpbCBuZWVkZWQgYnkgZG5mLTQuMjQuMC1yMC5jb3JlMl82
NCBmcm9tIG9lLXJlcG8NCj4gICAgLSBub3RoaW5nIHByb3ZpZGVzIHB5dGhvbjMtanNvbiBu
ZWVkZWQgYnkgZG5mLTQuMjQuMC1yMC5jb3JlMl82NCBmcm9tIG9lLXJlcG8NCj4gICAgLSBu
b3RoaW5nIHByb3ZpZGVzIHB5dGhvbjMtbG9nZ2luZyBuZWVkZWQgYnkgZG5mLTQuMjQuMC1y
MC5jb3JlMl82NCBmcm9tIG9lLXJlcG8NCj4gICAgLSBub3RoaW5nIHByb3ZpZGVzIHB5dGhv
bjMtc2hlbGwgbmVlZGVkIGJ5IGRuZi00LjI0LjAtcjAuY29yZTJfNjQgZnJvbSBvZS1yZXBv
DQo+ICAgIC0gbm90aGluZyBwcm92aWRlcyBweXRob24zLXRocmVhZGluZyBuZWVkZWQgYnkg
ZG5mLTQuMjQuMC1yMC5jb3JlMl82NCBmcm9tIG9lLXJlcG8NCj4gICAgLSBub3RoaW5nIHBy
b3ZpZGVzIHB5dGhvbjMtY29kZWNzIG5lZWRlZCBieSBkbmYtNC4yNC4wLXIwLmNvcmUyXzY0
IGZyb20gb2UtcmVwbw0KPiAgICAtIG5vdGhpbmcgcHJvdmlkZXMgcHl0aG9uMy1jdXJzZXMg
bmVlZGVkIGJ5IGRuZi00LjI0LjAtcjAuY29yZTJfNjQgZnJvbSBvZS1yZXBvDQo+ICAgIC0g
bm90aGluZyBwcm92aWRlcyBweXRob24zLW5ldGNsaWVudCBuZWVkZWQgYnkgZG5mLTQuMjQu
MC1yMC5jb3JlMl82NCBmcm9tIG9lLXJlcG8NCj4gICAgLSBub3RoaW5nIHByb3ZpZGVzIHB5
dGhvbjMtc3FsaXRlMyBuZWVkZWQgYnkgZG5mLTQuMjQuMC1yMC5jb3JlMl82NCBmcm9tIG9l
LXJlcG8NCj4gICBQcm9ibGVtIDI6IHBhY2thZ2UgcGFja2FnZWdyb3VwLWNvcmUteDExLXNh
dG8tYmFzZS0xLjAtcjAuZ2VuZXJpY3g4Nl82NCBmcm9tIG9lLXJlcG8gcmVxdWlyZXMgc2V0
dGluZ3MtZGFlbW9uLCBidXQgbm9uZSBvZiB0aGUgcHJvdmlkZXJzIGNhbiBiZSBpbnN0YWxs
ZWQNCj4gICAgLSBwYWNrYWdlIHBhY2thZ2Vncm91cC1jb3JlLXgxMS1zYXRvLTEuMC1yMC5n
ZW5lcmljeDg2XzY0IGZyb20gb2UtcmVwbyByZXF1aXJlcyBwYWNrYWdlZ3JvdXAtY29yZS14
MTEtc2F0by1iYXNlLCBidXQgbm9uZSBvZiB0aGUgcHJvdmlkZXJzIGNhbiBiZSBpbnN0YWxs
ZWQNCj4gICAgLSBwYWNrYWdlIHNldHRpbmdzLWRhZW1vbi0wLjAuMitnaXQwK2RmNjY5YzY1
NzktcjAuY29yZTJfNjQgZnJvbSBvZS1yZXBvIHJlcXVpcmVzIGxpYmdjb25mLTIuc28uNCgp
KDY0Yml0KSwgYnV0IG5vbmUgb2YgdGhlIHByb3ZpZGVycyBjYW4gYmUgaW5zdGFsbGVkDQo+
ICAgIC0gcGFja2FnZSBzZXR0aW5ncy1kYWVtb24tMC4wLjIrZ2l0MCtkZjY2OWM2NTc5LXIw
LmNvcmUyXzY0IGZyb20gb2UtcmVwbyByZXF1aXJlcyBnY29uZiA+PSAzLjIuNiwgYnV0IG5v
bmUgb2YgdGhlIHByb3ZpZGVycyBjYW4gYmUgaW5zdGFsbGVkDQo+ICAgIC0gY29uZmxpY3Rp
bmcgcmVxdWVzdHMNCj4gICAgLSBub3RoaW5nIHByb3ZpZGVzIHB5dGhvbjMteG1sIG5lZWRl
ZCBieSBnY29uZi0zLjIuNi1yMC5jb3JlMl82NCBmcm9tIG9lLXJlcG8NCj4gKHRyeSB0byBh
ZGQgJy0tc2tpcC1icm9rZW4nIHRvIHNraXAgdW5pbnN0YWxsYWJsZSBwYWNrYWdlcykNCj4N
Cj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVp
bGRlcnMvNC9idWlsZHMvMzQ3OA0KPg0KPiBDYW4geW91IGhhdmUgYSBsb29rIGF0IHRoZSBp
c3N1ZXM/DQoNClRoZSB2MyBzZXJpZXMgb3ZlciB0aGUgcGF0Y2ggZW50aXRsZWQgInB5dGhv
bjM6IEZpeCBtYW5pZmVzdCINCmZpeGVzIGJvdGggb2YgdGhlc2UgcHJvYmxlbXMuDQoNCg==


