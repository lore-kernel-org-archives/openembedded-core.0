Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C975BFC72AF
	for <webhook@archiver.kernel.org>; Sun, 22 Mar 2026 07:12:04 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26549.1774163522861902255
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Mar 2026 00:12:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AcwYg2OK;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-482f454be5bso38960655e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Mar 2026 00:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774163521; x=1774768321; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r9Pf4dBlc6Wq7/9mFI3IU3WYmhk/dV62aOc69bOkUQU=;
        b=AcwYg2OKz7UP0ZLiPmsM/b24kwd99/4Su27buZBZpXbA2irYhFF7ep8oZnBGTpOCaW
         B0ZsRl9aICGJj8n2ivR2LCLwBJVj8DqWNaPAFmthTl8VATFkibZKVwtV5+VC0faeZNQG
         E9pF49e5vH7e5FojFNm2wm7sObuNyZNEl7kczNV4yVBdgvxVZlDuZps4eaN4FNf9bWUX
         SAGWGzVMFo9FA/uFmzUmrR6mdM1Gkog/SY8SsNNolJgJ/h6zv9/hvoVqNUjVtBQncbG3
         j4MJtLXtG8DigtT+nz4A3ornQH6YSBpasbK636yZW94qJzzucui3lR/7r1sjWQqMNYT6
         tLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774163521; x=1774768321;
        h=content-transfer-encoding:in-reply-to:from:cc:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r9Pf4dBlc6Wq7/9mFI3IU3WYmhk/dV62aOc69bOkUQU=;
        b=coo5BPzMlYetpp+diAGn+QbEwg9FPADjneYh4oHPUkuMveYY9bEJh1dHgTTTKjJe1S
         gDHvLgyG/RyOk/ZsUGIqgZlEgayuqJvBGrUceBOffdK714iTOEUExhk1a7hLEoNvmVFX
         q6Z54CI5ZEWgDJmmCJqz19E+4kaX8IX5pypa0XiXNM63trzVemQIZWd6KrgdQ1ewohFJ
         xcGMvt2gcJEbUAiYe+NbY8X5TjX0mH3LaZWl3bKvg3GRRDWMmg4dV3PQ22eZu9gmfmDM
         cZDLL7EnPdlcC9MiJPjnFfL7mLf0iP7gcLALVI7W1mj9mgfjMfskijQdHWymfmUVRWE0
         /Q6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWZjxajzwPICN0HrbNQJK+PIkhk1X/3E9OtNtFLp+TfE6Oci5z9knq8SeJHu1eDudxhWOC59DsHZPYfuGakrb8wDA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz6wKcLyUU20KLUmTds/yqgtuzAkAyNTzZoJ6+ZpMIHLiADnkvH
	9Nl77mftD/aM5L5EF3WAx0hl29NTAllhDOyxVp/XmdbHbdGBTlXfV0Dr
X-Gm-Gg: ATEYQzzqp67k09gCG/dt8oAeBMylZX629QX1ZFL4Nb4ohrr74gCek0B5yJ0boxfIxnq
	rQ5/AzdBYW2D1sLRq/nT8t/9pPQy7tLxrxHCR5lXfI1aiaPyGpdCo16ZVHo/kH1hchCi6+8pdE2
	2aggFt4GvWGqSzFvcaRuDs1wpXc+HVF5+vVM9lMfsTHdOLZYJjCJe1eQ8TGpJ/ivQ7KEU6N+BAn
	ntupnEvsfkyY+BH4YmtDKY4pQXR/pJ1IqDI+TXDgXXeJtsWG1Nb4nKnFZ/JUpgSSJlZZfVIXIzu
	4fehCjaQqjNbqCtnzQwrLpDZ3Z/G81oTfLVliOZ6o8ClAN/SnI34bUVWogChYclKbD1aebZHqSF
	vdP2J7TGkVf6z7ocTLIacRyzwvBza0vfSrudz55yoXGNaDIAouHkeCnQy4O5xyuEDz33HpB70w7
	4G2E49GSbOsyJH5PJLp+VVCazJGNzaLuJzsdEhV4/lS9DQum9OuHwhxHM=
X-Received: by 2002:a05:600c:1e0d:b0:485:3cef:d6ea with SMTP id 5b1f17b1804b1-486fe8efb0amr134599595e9.13.1774163520811;
        Sun, 22 Mar 2026 00:12:00 -0700 (PDT)
Received: from [192.168.2.122] (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff1db4aesm68855275e9.7.2026.03.22.00.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 00:12:00 -0700 (PDT)
Message-ID: <c4e5c72f-84eb-419f-ba74-7a091de6848f@gmail.com>
Date: Sun, 22 Mar 2026 08:11:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [whinlatter][PATCH 0/4] gn: upgrade to latest revision
To: Yoann Congal <yoann.congal@smile.fr>,
 openembedded-core@lists.openembedded.org
References: <20260321073820.1403645-1-zboszor@gmail.com>
 <DH8CJYGCGVWY.CKRVLGTIY6JG@smile.fr>
 <8723b2eb-3931-4aaf-a406-e17fd62fa72e@gmail.com>
 <DH8OLEZRDNFV.3D8WHZTAXNI2F@smile.fr>
Content-Language: en-US
Cc: Max Ihlenfeldt <max@igalia.com>
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <DH8OLEZRDNFV.3D8WHZTAXNI2F@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Mar 2026 07:12:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233668

2026. 03. 21. 19:45 keltezéssel, Yoann Congal írta:
> On Sat Mar 21, 2026 at 3:02 PM CET, Böszörményi Zoltán wrote:
>> 2026. 03. 21. 10:19 keltezéssel, Yoann Congal írta:
>>> On Sat Mar 21, 2026 at 8:36 AM CET, Zoltan Boszormenyi via lists.openembedded.org wrote:
>>>> The latest revision of gn is needed to build Chromium 145
>>>> for whinlatter. Nothing else.
>>>>
>>>> See https://github.com/OSSystems/meta-browser/pull/963
>>>>
>>>> Please merge these into whinlatter.
>>> Hello,
>>>
>>> Sorry but general upgrades like this are not acceptable for stable.
>> I can keep the gn_git.bbappend in the meta-browser PR.
>>
>> But then it's not better when every layer shipped their version
>> before moving it to core.
>>
>>> Is there a verifiable stability promise from gn upstream that would
>>> somehow make that acceptable? Note that I'm not familiar with it.
>> Chromium updates carry a lot of CVE fixes, too.
>> gn is just a build tool for it and other projects.
> Yes I understand.
> But this upgrade has feature changes in it (see below) and those are
> generaly unacceptable on the risk breaking existing code and our
> stability promise.
>
> Your whole series upgrade gn by 43 commits. I saw these ones that are
> problematic just by reading the commit title:
>   $ git log --oneline 81b24e01531ecf0eff12ec9359a555ec3944ec4e..9d19a7870add65151ff91bcc26252bb7521065cf
> 7498ca2e Add validation support to gn analyze/desc/path/refs
> 3c0f5be7 Add pcm files to the deps of phony target
> bd3356ac Add `validations` dependency type to targets
> 1d89b984 Add conductor setup files
> 4e0818fd Add a sha256 hash implementation and use it for string_hash
> 0eb071f6 Add a `module_name` flag to source_set.
> bf891ce4 Refactor module name to be dynamic.
> 8450d601 Optimize vector creation in compile_commands_writer.cc.
> 6e0b557d Run 'tools/run_formatter.sh'
> ab6f8b21 Implement `string_hash` function.

At least this one is needed by Chromium 145.
Its do_configure failed due to missing function.

> d92aee22 Support weak_libraries
> 4619125b Do not add .inputdeps paths to --ninja-outputs-file
> fb3b73df Make clang modules output -fmodule-file=foo=<pcm>.
> e7f32021 Add --file_relation to gn refs command
> 20a6b6d6 Optimize vector initialization and preallocation in desc_builder.cc.
> a0c5124a Add `reserve` statement when vector size is known beforehand.
> 092f4f0d Refactor container update by preferring the range insert.
>
> If you want a shared repo with an upgraded gn for LTS, what do
> you think about creating a mixin layer?
> https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#LTS_%E2%80%9CMixin%E2%80%9D_repositories
> https://git.yoctoproject.org/meta-lts-mixins
>
> For whinlatter (stable but not a LTS) which have more or less a month of
> support left, the bbappend in your layer is, IMHO, the realistic
> solution.

meta-browser is not my layer, I just create PRs for it.
Thanks, anyway.

cc-ed the maintainer of meta-browser.
Maybe it would be best to branch off whinlatter and
cherry-pick new versions and add the gn bbappend there later.


