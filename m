Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F0F5CAC5B0
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 12:39:50 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.6618.1759495188446093933
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Oct 2025 05:39:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=clMWwB2i;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6364eb29e74so4462210a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 05:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759495187; x=1760099987; darn=lists.openembedded.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6I/SrqN1aP2njK1GzBghvU03D7gUoreUbvE+Ht8DIQ=;
        b=clMWwB2iDHZppjQL18/t90XhLV3CpCYt4DVp204bKEtmy7nBY2zxYOY+/CmnxfHqB8
         a7elwpQGm1IrC9azl5ySlv5UPY4n59r/wvXj1FsiF/WOLeLJIgQybvEgKReuMxwM7DbO
         Mh0ENRi+t5if/EM38yw6WXjHkcKr7eVUNnGK7NOMmCUDNRV+QgEskIrw2VHRrrGgAO40
         WbdR4syEM3IoKv/vJN+OMep71TSqLyduY94xfAHKd6NS1pv9P3wFOyH9PMCbJ0RqZrnK
         Lqd4c5NV5VntPeKRpL3hESBfF66zvbWvkYGaDCdRQt1kVICM3dYKwGJjr9GbbCPrQL/c
         2BFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759495187; x=1760099987;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W6I/SrqN1aP2njK1GzBghvU03D7gUoreUbvE+Ht8DIQ=;
        b=Zi4OXzjCiz/yhiJ4TjMPdLtdGRouAI1j+kTmckLITpfwSHK5rYmyBj5s+0DxuKME7r
         eitMmdp/3o7kbjW6httLkfwo1S13tt7GQI7xGs8zAI6A5CZBsBnNt79Hu9JlRx4DcHWZ
         z9gXmJropVlA3V5c1krSbRFqCzWi6n7h2b80WWi67T8HEZ80ffnlMWxkw+Bon4UBgbGI
         QsXWdByoI3kE8fwFjPfNeoAA1HzozCepWfEl056DR+kmPNGTcT6QoHm47SMH6wTpJMZZ
         YhjuqCBK8Ijgez/nYIGtJ1aNgWMpeqP10IdB7u5tYlxL9Ge2a/6DBedmHTWnbAM2ZJtw
         jGDQ==
X-Gm-Message-State: AOJu0YyuWB/SMmxaXT3hrB3wcKQstKN+ZXFCDgxobno54n/Y9o9MxwOZ
	lmLLwD9oPr0lkla+DyJaKTWnx6PVNtdmCgTu+rmPKHIhFMLBY+27pGtK
X-Gm-Gg: ASbGncu368M4FKrRmP8znvCpNLFsXscUuZuW/ZJhbzaBExdm0f4aghWBN57F2zkSyuP
	kDMYVTFJiqBBHlg4gH9XZ9G/cyzKQVKnxULc4UhhMJ828E1mYoOJSwOZaiByabt98Ri1u/ad8RL
	rytP2S1NaC1alqBcuu0L18AimzsEbJObO5+sKHrrHOpzfyo9k7mK3nFW5YfbAJs+XJdw2/jv+Ej
	U/NQDJUcV+o14101hdz0yeaYBsT04zfNnD4uQmXj4pluIw3NiS6p+MAubyZkndqhNGdXDkRFd/s
	uxKpfNnHNytaQ1Mdc8fM/GlVuNwcJMVBLkH1DaSc9EunCwJYV03Pd1o6JXft8/h8mTxlHFaqIyU
	fN6I32MtCEGiK3PFdQpf6CCCwMxdIb9X+JQL36nQd1pZEB9xDMRJRS+Xy9lWPnJsriA==
X-Google-Smtp-Source: AGHT+IH2nBTrJJtyKwzESbRgrMk5CP9z7dAntBd8DEgp3fa+0pomKLmEctyD0K2K4Eze984gSSUV8Q==
X-Received: by 2002:a17:906:4fd1:b0:b3f:d232:5797 with SMTP id a640c23a62f3a-b49c1d65fbdmr310078566b.22.1759495186216;
        Fri, 03 Oct 2025 05:39:46 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970a684sm429315566b.52.2025.10.03.05.39.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 05:39:45 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------OG6Py0ho9mRC7szOMb7bgZ3b"
Message-ID: <6db7fc77-9c35-4f5a-90c4-b0f3c9e983ba@gmail.com>
Date: Fri, 3 Oct 2025 14:39:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] How to have multiple rust cargo vendors
To: Tom Geelen <t.f.g.geelen@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <CAJo0Az632gtPBnWcszxzodqHTnagfqCDW5_d33WnbL_m_Hoezw@mail.gmail.com>
 <186AC5F2410FD5FD.16131@lists.openembedded.org>
 <6c530b3d-83b0-45b1-856b-78bb29f370ef@gmail.com>
 <CAJo0Az40OEnqyuzU_G3uvyf_+bB=+TRd-tsoHDUoGs9xduJ78A@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAJo0Az40OEnqyuzU_G3uvyf_+bB=+TRd-tsoHDUoGs9xduJ78A@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 12:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224388

This is a multi-part message in MIME format.
--------------OG6Py0ho9mRC7szOMb7bgZ3b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/2/25 22:39, Tom Geelen wrote:
> Ah that would be great. Actually I had seen the firefox recipes and
> did notice something which looked like something what I would be
> needing. So if you could send an RFC that would be awesome.

I found it my patch... but for some reason it doesn't work with your
recipe :D
I think that my change does what I intended it to do, but maturin still
tries to fetch the workspace crate from the network, just like without
my patch. Going look into this a bit deeper, if I can... will get back.

> On Thu, Oct 2, 2025 at 10:33 PM Gyorgy Sarvari <skandigraun@gmail.com> wrote:
>> On 10/2/25 22:17, Gyorgy Sarvari via lists.openembedded.org wrote:
>>> You can add those in the SRC_URI, as regular git repos, with +=. Make
>>> sure to set the "name" parameter to the crate name, and set the
>>> "destsuffix" to ensure the sources won't mix. After do_configure step
>>> one of the cargo/rust classes will go through the SRC_URI content, and
>>> add these git-crates to the cargo config as local patches.
>> Oh, now I see that this is a workspace - sorry for not looking closer
>> before.
>>
>> At this time cargo_common doesn't support workspaces from git crates...
>>
>> I find it interesting on a personal level, because I just implemented
>> workspace support like 2 weeks ago, but couldn't find any project using
>> workspace crates from git beside Firefox, and didn't want to submit it
>> only for that. (And since Firefox recipe switched away too)
>>
>> If I find my implementation again, will submit it tomorrow as an RFC.
>>
>>> On 10/2/25 21:40, Tom Geelen via lists.openembedded.org wrote:
>>>> I'm trying to create a recipe for uv (https://docs.astral.sh/uv/) to
>>>> be added to meta-python.
>>>> Problem I currently cannot seem to resolve is that I need multiple
>>>> cargo vendor support.
>>>>
>>>> I have created the draft recipe and added the inc file with the crates
>>>> using the update-crates command.
>>>> However it missed several crates as they are not from crates.io but
>>>> via git (see below).
>>>>
>>>> How would I add this to the recipe below?
>>>>
>>>> SUMMARY = "An extremely fast Python package and project manager,
>>>> written in Rust."
>>>> HOMEPAGE = "https://pypi.org/project/uv/"
>>>> LICENSE = "Apache-2.0 & BSD-2-Clause & MIT"
>>>> LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
>>>>                     file://LICENSE-MIT;md5=45674e482567aa99fe883d3270b11184"
>>>> RECIPE_MAINTAINER = "Tom Geelen <t.f.g.geelen@gmail.com>"
>>>>
>>>> SRC_URI[sha256sum] =
>>>> "e6e1289c411d43e0ca245f46e76457f3807de646d90b656591b6cf46348bed5c"
>>>>
>>>> inherit pypi python_maturin cargo-update-recipe-crates
>>>>
>>>> require ${BPN}-crates.inc
>>>>
>>>> SRCREV = "d8efd77673c9a90792da9da31b6c0da7ea8a324b"
>>>>
>>>> PYPI_PACKAGE = "uv"
>>>>
>>>>
>>>> [[package]]
>>>> name = "version-ranges"
>>>> version = "0.1.1"
>>>> source = "git+https://github.com/astral-sh/pubgrub?rev=d8efd77673c9a90792da9da31b6c0da7ea8a324b#d8efd77673c9a90792da9da31b6c0da7ea8a324b"
>>>> dependencies = [
>>>>  "smallvec",
>>>> ]
>>>>
>>>> Regards,
>>>>
>>>> Tom
>>>>
>>>>
>>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#224380): https://lists.openembedded.org/g/openembedded-core/message/224380
>>> Mute This Topic: https://lists.openembedded.org/mt/115558933/6084445
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>

--------------OG6Py0ho9mRC7szOMb7bgZ3b
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-cargo_common-add-workspace-support.patch"
Content-Disposition: attachment;
 filename="0001-cargo_common-add-workspace-support.patch"
Content-Transfer-Encoding: base64

RnJvbSAzMmNjZGRiZDA5N2YyYmI3NDgwZGY2OTJhZTM4NmMzMDRkZDQ1NmYwIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBHeW9yZ3kgU2FydmFyaSA8c2thbmRpZ3JhdW5AZ21h
aWwuY29tPgpEYXRlOiBGcmksIDMgT2N0IDIwMjUgMTQ6Mjk6NDggKzAyMDAKU3ViamVjdDog
W1BBVENIXSBjYXJnb19jb21tb246IGFkZCB3b3Jrc3BhY2Ugc3VwcG9ydAoKV0lQCgotLS0K
IG1ldGEvY2xhc3Nlcy1yZWNpcGUvY2FyZ29fY29tbW9uLmJiY2xhc3MgfCA0MSArKysrKysr
KysrKysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspLCA4
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy1yZWNpcGUvY2FyZ29f
Y29tbW9uLmJiY2xhc3MgYi9tZXRhL2NsYXNzZXMtcmVjaXBlL2NhcmdvX2NvbW1vbi5iYmNs
YXNzCmluZGV4IGM5ZWIyZDA5YTUuLmE2OWI5NjJkYmEgMTAwNjQ0Ci0tLSBhL21ldGEvY2xh
c3Nlcy1yZWNpcGUvY2FyZ29fY29tbW9uLmJiY2xhc3MKKysrIGIvbWV0YS9jbGFzc2VzLXJl
Y2lwZS9jYXJnb19jb21tb24uYmJjbGFzcwpAQCAtMTI5LDYgKzEyOSwyMCBAQCBjYXJnb19j
b21tb25fZG9fY29uZmlndXJlICgpIHsKIHB5dGhvbiBjYXJnb19jb21tb25fZG9fcGF0Y2hf
cGF0aHMoKSB7CiAgICAgaW1wb3J0IHNodXRpbAogCisgICAgZGVmIGxvYWRfY2FyZ29fdG9t
bChjYXJnb190b21sX3BhdGgpOgorICAgICAgICBpbXBvcnQgdG9tbGxpYgorICAgICAgICB3
aXRoIG9wZW4oY2FyZ29fdG9tbF9wYXRoLCAicmIiKSBhcyBmOgorICAgICAgICAgICAgY2Fy
Z29fdG9tbCA9IHRvbWxsaWIubG9hZChmKQorICAgICAgICByZXR1cm4gY2FyZ29fdG9tbAor
CisgICAgZGVmIGFkZF90b19wYXRjaGVzKHBhdGNoZXMsIHVkLCBuYW1lLCBwYXRoKToKKyAg
ICAgICAgaWYgdWQudXNlcjoKKyAgICAgICAgICAgIHJlcG8gPSAnJXM6Ly8lc0AlcyVzJyAl
ICh1ZC5wcm90bywgdWQudXNlciwgdWQuaG9zdCwgdWQucGF0aCkKKyAgICAgICAgZWxzZToK
KyAgICAgICAgICAgIHJlcG8gPSAnJXM6Ly8lcyVzJyAlICh1ZC5wcm90bywgdWQuaG9zdCwg
dWQucGF0aCkKKyAgICAgICAgcGF0aCA9ICclcyA9IHsgcGF0aCA9ICIlcyIgfScgJSAobmFt
ZSwgcGF0aCkKKyAgICAgICAgcGF0Y2hlcy5zZXRkZWZhdWx0KHJlcG8sIFtdKS5hcHBlbmQo
cGF0aCkKKwogICAgIGNhcmdvX2NvbmZpZyA9IG9zLnBhdGguam9pbihkLmdldFZhcigiQ0FS
R09fSE9NRSIpLCAiY29uZmlnLnRvbWwiKQogICAgIGlmIG5vdCBvcy5wYXRoLmV4aXN0cyhj
YXJnb19jb25maWcpOgogICAgICAgICByZXR1cm4KQEAgLTE0MywxNSArMTU3LDI2IEBAIHB5
dGhvbiBjYXJnb19jb21tb25fZG9fcGF0Y2hfcGF0aHMoKSB7CiAgICAgZm9yIHVybCBpbiBm
ZXRjaGVyLnVybHM6CiAgICAgICAgIHVkID0gZmV0Y2hlci51ZFt1cmxdCiAgICAgICAgIGlm
IHVkLnR5cGUgPT0gJ2dpdCcgb3IgdWQudHlwZSA9PSAnZ2l0c20nOgotICAgICAgICAgICAg
bmFtZSA9IHVkLnBhcm0uZ2V0KCduYW1lJykKICAgICAgICAgICAgIGRlc3RzdWZmaXggPSB1
ZC5wYXJtLmdldCgnZGVzdHN1ZmZpeCcpCi0gICAgICAgICAgICBpZiBuYW1lIGlzIG5vdCBO
b25lIGFuZCBkZXN0c3VmZml4IGlzIG5vdCBOb25lOgotICAgICAgICAgICAgICAgIGlmIHVk
LnVzZXI6Ci0gICAgICAgICAgICAgICAgICAgIHJlcG8gPSAnJXM6Ly8lc0AlcyVzJyAlICh1
ZC5wcm90bywgdWQudXNlciwgdWQuaG9zdCwgdWQucGF0aCkKLSAgICAgICAgICAgICAgICBl
bHNlOgotICAgICAgICAgICAgICAgICAgICByZXBvID0gJyVzOi8vJXMlcycgJSAodWQucHJv
dG8sIHVkLmhvc3QsIHVkLnBhdGgpCi0gICAgICAgICAgICAgICAgcGF0aCA9ICclcyA9IHsg
cGF0aCA9ICIlcyIgfScgJSAobmFtZSwgb3MucGF0aC5qb2luKHdvcmtkaXIsIGRlc3RzdWZm
aXgpKQotICAgICAgICAgICAgICAgIHBhdGNoZXMuc2V0ZGVmYXVsdChyZXBvLCBbXSkuYXBw
ZW5kKHBhdGgpCisgICAgICAgICAgICBpZiBkZXN0c3VmZml4IGlzIE5vbmU6CisgICAgICAg
ICAgICAgICAgY29udGludWUKKworICAgICAgICAgICAgdG9wX2NhcmdvX3RvbWxfcGF0aCA9
IG9zLnBhdGguam9pbih3b3JrZGlyLCBkZXN0c3VmZml4LCAnQ2FyZ28udG9tbCcpCisgICAg
ICAgICAgICBpZiBvcy5wYXRoLmV4aXN0cyh0b3BfY2FyZ29fdG9tbF9wYXRoKToKKyAgICAg
ICAgICAgICAgICBjYXJnb190b21sID0gbG9hZF9jYXJnb190b21sKHRvcF9jYXJnb190b21s
X3BhdGgpCisgICAgICAgICAgICAgICAgaWYgJ3dvcmtzcGFjZScgaW4gY2FyZ29fdG9tbDoK
KyAgICAgICAgICAgICAgICAgICAgd3NfbWVtYmVycyA9IGNhcmdvX3RvbWxbJ3dvcmtzcGFj
ZSddWydtZW1iZXJzJ10KKyAgICAgICAgICAgICAgICAgICAgZm9yIHdzX21lbWJlciBpbiB3
c19tZW1iZXJzOgorICAgICAgICAgICAgICAgICAgICAgICAgbWVtYmVyX2NyYXRlX2ZvbGRl
ciA9IG9zLnBhdGguam9pbih3b3JrZGlyLCBkZXN0c3VmZml4LCB3c19tZW1iZXIpCisgICAg
ICAgICAgICAgICAgICAgICAgICBtZW1iZXJfY2FyZ29fdG9tbF9wYXRoID0gb3MucGF0aC5q
b2luKG1lbWJlcl9jcmF0ZV9mb2xkZXIsICdDYXJnby50b21sJykKKyAgICAgICAgICAgICAg
ICAgICAgICAgIG1lbWJlcl9jYXJnb190b21sID0gbG9hZF9jYXJnb190b21sKG1lbWJlcl9j
YXJnb190b21sX3BhdGgpCisgICAgICAgICAgICAgICAgICAgICAgICBtZW1iZXJfY3JhdGVf
bmFtZSA9IG1lbWJlcl9jYXJnb190b21sWydwYWNrYWdlJ11bJ25hbWUnXQorICAgICAgICAg
ICAgICAgICAgICAgICAgYWRkX3RvX3BhdGNoZXMocGF0Y2hlcywgdWQsIG1lbWJlcl9jcmF0
ZV9uYW1lLCBtZW1iZXJfY3JhdGVfZm9sZGVyKQorCisgICAgICAgICAgICAgICAgaWYgJ3Bh
Y2thZ2UnIGluIGNhcmdvX3RvbWw6CisgICAgICAgICAgICAgICAgICAgIGNyYXRlX25hbWUg
PSBjYXJnb190b21sWydwYWNrYWdlJ11bJ25hbWUnXQorICAgICAgICAgICAgICAgICAgICBj
cmF0ZV9mb2xkZXIgPSBvcy5wYXRoLmpvaW4od29ya2RpciwgZGVzdHN1ZmZpeCkKKyAgICAg
ICAgICAgICAgICAgICAgYWRkX3RvX3BhdGNoZXMocGF0Y2hlcywgdWQsIGNyYXRlX25hbWUs
IGNyYXRlX2ZvbGRlcikKIAogICAgIHdpdGggb3BlbihjYXJnb19jb25maWcsICJhKyIpIGFz
IGNvbmZpZzoKICAgICAgICAgZm9yIGssIHYgaW4gcGF0Y2hlcy5pdGVtcygpOgo=

--------------OG6Py0ho9mRC7szOMb7bgZ3b--

