Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 016F7CCA471
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 21:40:36 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.2068.1759527635112822796
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Oct 2025 14:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k3kDr4kC;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b4736e043f9so492615066b.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 14:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759527633; x=1760132433; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FMFc3LJKjYpjA5E/xRKy+tumTs+9S38uoZdJUTmRxzQ=;
        b=k3kDr4kCJS5PgS32CfU8dddwNh0rrRMxzb3qWYu3eHlJuGCW3fPKYI1XdYNJYhBnG+
         o5mNjZwhNTVdYfggVv26G2mw4NwChX3kXj/LcAuGZ8PjN1Z/56kKMSY9pUMlzKCAsT4E
         MxeLhlxi5hqf3yggpVkLj6Fm0kc87/VjQ3UJKHnfKAZgK3NlohGRlCaihAdSh/GEn3eG
         yxOr2As0jOn1NsK4jTmOgvVqSZF1Pw3lKron5x1kpFbOpb3PvYSyeGZFCwXWvo+8mSAV
         IbbkFdY1UPb+oMSU5rpjlZLVYyoBBFv4uNk62crckXfRAa+KBZ63fj8oiILWNv/KeYbg
         RfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759527633; x=1760132433;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FMFc3LJKjYpjA5E/xRKy+tumTs+9S38uoZdJUTmRxzQ=;
        b=rfoZgA6xV1y9hP4c0PeHzJXsCXNUsVUclZ8T6/dDRP1j3VdP1TOYlez7+8FHh52iEO
         3xyORS2OACR9jjU6JHQaA/RHpXPyCOMWRvOH5Ukr8qaFE/UZKQ/E9YFssYHUn3qlHTQv
         O5lEo1Owu3ovCCYCtYqlwePcMBKgRfj9bLWRlIxSbRXOxOIutpuZc/oHr8tuSvk79VYi
         aEpRoIoMK4IjC+d2QP3DDxbS/+KX+gtyv/5aCMcFVbZVmYSUHkhh8AXcGzL6d7+JQT7A
         yS8Po7bXBFSZ11UIzg66PrRpDkksxFYUhXJPM5V3vM96UBB+2+wpu1s4G+uvEEjINQ4N
         rT0w==
X-Gm-Message-State: AOJu0YzBYYknvPvSnL6FeAHGctgX0KkjsP6LASYWFfIT8l5ykpLfe66G
	w9xKqu/FuSkTjupWdBB/2NON0bQT1So14f6A/iWpGKIGDBnMk/hbOKV5
X-Gm-Gg: ASbGncvpTzdAw9JWVp7qZuOcUVzZonHNUzC3P+bLYBhCO+f3eg7/M/H2u6UEfobtSGF
	1mQZWrVe825Y7ZLZGTCK+o0mde+QLEg92TdQK+oSJRxdtqYatTyN3rPj1eRuiSmNb+3kHofyYk/
	aog80kkOqPINmBASQ8EZk9f5rBhCmDPuMWs23zxOxuMeK7Z6O8ATb0Z6cUg7BYQBZYfvYBmcjIH
	FGcuMrtRcgtoaqruF7RoNFwZbMYRrHJ22bOevAS/lI9S+mqgbsBxfop4VRRf1dK3ZPPUyyYxOOB
	M7Pld8HqT4Zu8tByyqquVTSf6bzS6tiduCuOGCqdMxbH9jyjQYZpVUx5LZPJfKJ8mf4kS55tSYJ
	x6/n3BrHCcylxgl+pOGIg+hygGjLMYzzMVS69O0FBvdqyP6nU5pIOJ3A=
X-Google-Smtp-Source: AGHT+IHR4ftA7CiqPevRGQGx7FKEu0a1rPKWKEZRgi4s+09QOz9eG2NizmaAcG1AhcrBP+zYxbuGVA==
X-Received: by 2002:a17:906:4fce:b0:b40:98b1:7457 with SMTP id a640c23a62f3a-b49c4cde268mr459823366b.47.1759527633327;
        Fri, 03 Oct 2025 14:40:33 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865e7e8cdsm525251966b.38.2025.10.03.14.40.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 14:40:32 -0700 (PDT)
Message-ID: <74071025-691b-48ff-8b3a-b982b735adac@gmail.com>
Date: Fri, 3 Oct 2025 23:40:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] How to have multiple rust cargo vendors
To: Tom Geelen <t.f.g.geelen@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <CAJo0Az632gtPBnWcszxzodqHTnagfqCDW5_d33WnbL_m_Hoezw@mail.gmail.com>
 <186AC5F2410FD5FD.16131@lists.openembedded.org>
 <6c530b3d-83b0-45b1-856b-78bb29f370ef@gmail.com>
 <CAJo0Az40OEnqyuzU_G3uvyf_+bB=+TRd-tsoHDUoGs9xduJ78A@mail.gmail.com>
 <6db7fc77-9c35-4f5a-90c4-b0f3c9e983ba@gmail.com>
 <CAJo0Az68Swx2Fh54fW6KhihnQRVfUJ8OE_dquQGhyJc86cC2hQ@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAJo0Az68Swx2Fh54fW6KhihnQRVfUJ8OE_dquQGhyJc86cC2hQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Oct 2025 21:40:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224427

On 10/3/25 21:38, Tom Geelen wrote:
> I've trying some items as well now. I've updated the recipe to the
> version in the patch.
>
> Now all the sources are in CARGO_VENDORING_DIRECTORY as needed.
> Then it still tried to fetch sources via the network, but I tackled
> that by commenting out the following in the source Cargo.toml:
>
> #[patch.crates-io]
> #reqwest-middleware = { git =
> "https://github.com/astral-sh/reqwest-middleware", rev =
> "7650ed76215a962a96d94a79be71c27bffde7ab2" }
> #reqwest-retry = { git =
> "https://github.com/astral-sh/reqwest-middleware", rev =
> "7650ed76215a962a96d94a79be71c27bffde7ab2" }
>
> However it does not compile yet. Stuck on a rust compile error about
> the sources fetched via git:
> - found a virtual manifest at
> `/home/tom/projects/meta-sanctum/build/tmp/work/x86-64-v3-oe-linux/python3-uv/0.8.22/sources/cargo_home/bitbake/reqwest-middleware-0.4.2/Cargo.toml`
> instead of a package manifest

Yes, that's the workspace-not-supported issue. When patching the
dependencies, the patch needs to point to the crate folder, not to the
parent workspace. You need to do two things:
1. Make cargo_common not to add these dependency patches. You can find
an example here[1] (not my proudest thing, but that's why I worked on
workspace support). You can limit it only to workspace crates.
2. You need to patch the dependencies in Cargo.toml (or in cargo's
config.toml, similar to what cargo_common does currently, but with the
crate paths.
For example: https://github.com/astral-sh/reqwest-middleware - this has
3 subfolders, reqwest-middleware, -retry and -tracing. Each of this is a
crate. To make them visible for cargo, you need add something like this
to one of the configs:

[patch."https://github.com/astral-sh/reqwest-middleware"]
request-middleware = {path = "$UNPACKDIR/reqwest/reqwest-middleware"}
request-retry = {path = "$UNPACKDIR/reqwest/reqwest-retry"}
request-tracing = {path = "$UNPACKDIR/reqwest/reqwest-tracing"}

(Make sure to set the correct paths to the checked out repos, without
variables, the above is just example. The path can be relative also)

Regarding the patch I just sent:
- I have sent a v1 patch, which refactors the cargo_common class'
dependency patching behavior. It works on my machine, and did some
testing, but it can always use more. If you would like to, feel free to
try it - I'd be happy to get any feedback.
- That patch will change for sure, I already know that if it won't be
shot down, there will be at least a v2 (and probably more).
- It won't be merged into Whinlatter though most likely in any case, it
is already too late for that.

A note regarding uv 0.8.22: it seems to use some detached orphan
commits, which is not easy to fetch in any case, but I think it's not
possible to do so with Bitbake fetcher at all (without changing it). The
last where I could find all revisions was 0.8.19.

[1]:
https://github.com/OSSystems/meta-browser/blob/master/meta-firefox/recipes-browser/firefox/firefox.inc#L155

>
> On Fri, Oct 3, 2025 at 2:39 PM Gyorgy Sarvari <skandigraun@gmail.com> wrote:
>> On 10/2/25 22:39, Tom Geelen wrote:
>>> Ah that would be great. Actually I had seen the firefox recipes and
>>> did notice something which looked like something what I would be
>>> needing. So if you could send an RFC that would be awesome.
>> I found it my patch... but for some reason it doesn't work with your
>> recipe :D
>> I think that my change does what I intended it to do, but maturin still
>> tries to fetch the workspace crate from the network, just like without
>> my patch. Going look into this a bit deeper, if I can... will get back.
>>
>>> On Thu, Oct 2, 2025 at 10:33 PM Gyorgy Sarvari <skandigraun@gmail.com> wrote:
>>>> On 10/2/25 22:17, Gyorgy Sarvari via lists.openembedded.org wrote:
>>>>> You can add those in the SRC_URI, as regular git repos, with +=. Make
>>>>> sure to set the "name" parameter to the crate name, and set the
>>>>> "destsuffix" to ensure the sources won't mix. After do_configure step
>>>>> one of the cargo/rust classes will go through the SRC_URI content, and
>>>>> add these git-crates to the cargo config as local patches.
>>>> Oh, now I see that this is a workspace - sorry for not looking closer
>>>> before.
>>>>
>>>> At this time cargo_common doesn't support workspaces from git crates...
>>>>
>>>> I find it interesting on a personal level, because I just implemented
>>>> workspace support like 2 weeks ago, but couldn't find any project using
>>>> workspace crates from git beside Firefox, and didn't want to submit it
>>>> only for that. (And since Firefox recipe switched away too)
>>>>
>>>> If I find my implementation again, will submit it tomorrow as an RFC.
>>>>
>>>>> On 10/2/25 21:40, Tom Geelen via lists.openembedded.org wrote:
>>>>>> I'm trying to create a recipe for uv (https://docs.astral.sh/uv/) to
>>>>>> be added to meta-python.
>>>>>> Problem I currently cannot seem to resolve is that I need multiple
>>>>>> cargo vendor support.
>>>>>>
>>>>>> I have created the draft recipe and added the inc file with the crates
>>>>>> using the update-crates command.
>>>>>> However it missed several crates as they are not from crates.io but
>>>>>> via git (see below).
>>>>>>
>>>>>> How would I add this to the recipe below?
>>>>>>
>>>>>> SUMMARY = "An extremely fast Python package and project manager,
>>>>>> written in Rust."
>>>>>> HOMEPAGE = "https://pypi.org/project/uv/"
>>>>>> LICENSE = "Apache-2.0 & BSD-2-Clause & MIT"
>>>>>> LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
>>>>>>                     file://LICENSE-MIT;md5=45674e482567aa99fe883d3270b11184"
>>>>>> RECIPE_MAINTAINER = "Tom Geelen <t.f.g.geelen@gmail.com>"
>>>>>>
>>>>>> SRC_URI[sha256sum] =
>>>>>> "e6e1289c411d43e0ca245f46e76457f3807de646d90b656591b6cf46348bed5c"
>>>>>>
>>>>>> inherit pypi python_maturin cargo-update-recipe-crates
>>>>>>
>>>>>> require ${BPN}-crates.inc
>>>>>>
>>>>>> SRCREV = "d8efd77673c9a90792da9da31b6c0da7ea8a324b"
>>>>>>
>>>>>> PYPI_PACKAGE = "uv"
>>>>>>
>>>>>>
>>>>>> [[package]]
>>>>>> name = "version-ranges"
>>>>>> version = "0.1.1"
>>>>>> source = "git+https://github.com/astral-sh/pubgrub?rev=d8efd77673c9a90792da9da31b6c0da7ea8a324b#d8efd77673c9a90792da9da31b6c0da7ea8a324b"
>>>>>> dependencies = [
>>>>>>  "smallvec",
>>>>>> ]
>>>>>>
>>>>>> Regards,
>>>>>>
>>>>>> Tom
>>>>>>
>>>>>>
>>>>>>
>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>> Links: You receive all messages sent to this group.
>>>>> View/Reply Online (#224380): https://lists.openembedded.org/g/openembedded-core/message/224380
>>>>> Mute This Topic: https://lists.openembedded.org/mt/115558933/6084445
>>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>>


