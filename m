Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8660EC2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 10:38:27 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web10.8066.1747823898523263807
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 03:38:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DKgBHNEg;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-60179d8e65fso2383936a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 03:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747823897; x=1748428697; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/xlCJwWbt6X+sndKBpqvM20GInFXprb3oZFBYLDWXco=;
        b=DKgBHNEgvOzvQcNY4DDfz5wqwLJ8mY1V7/plpY9d3BQKgpMPuBH8nMvOut7pwEahZA
         6DTKaDOEThnWPfNnXWi++OrnOdrGAwi9jAUl/7KtbYcFKnbb7H4LSUJ9RJ4/hKPztcLk
         cHSeWV3gkSl4maTZJVfHclcr30Rq7KVDvK8IwNUUmHPh4mSM97wYqtlpHXsdJlkRDxko
         O7bgHJfLFi8Ns+cWWOKs8bdMiIAqEO2GKy5gdMUlSQ8kp8HEJGGi/8h31ODH2zFFn5pS
         O4bfvHtmuge7I7xfy9w4y6OsRzfG/hTuhREe3tjhWArVvaSPkDeTHJd7DjeZxocXgrW3
         HUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747823897; x=1748428697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/xlCJwWbt6X+sndKBpqvM20GInFXprb3oZFBYLDWXco=;
        b=UEbUdBBmSNp/sj7r+uBHT789OmXmwYICUKVNYKoBDQqcYt3huU4jm2pBxt378FQ2y0
         ZN/C1Xr8oR/nwtkLV0Zat2DxOn+MNh9tnkX92AUAJ9qaLCJ99IDNpwav9ZbY/QEhXhtk
         FDuBq6BDjET7pxBKcsFPJM5LZn5NRaxXeStSXBvexuoRh7Dn4yN7B9kzqUSP+9CAzy5w
         eAugZD+6qlcBZyVKYTjGdaqCN9MOWbRdZbOfyEKPZYX9WbhLXilkKNoOWELbM+l1KRJp
         G7gCXrSL8AKf0hktQfF/zkWRtY+I1MGTfLYH7/QVddDB5T4lE2HMprxayndMsEHT4d03
         rA5A==
X-Forwarded-Encrypted: i=1; AJvYcCXlEThsqQ3JlI2JAjZhKuCs3eO+r5tZayKWXHHTt6r3pDYb/YeXR10QW18mTYoN/VjZbIjYnOqZdd9RUNV/ZQm5fQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzwDwiT5+at+3vdmgCUOh3wEnjZeNFyA+GA+zJfLJh9uoE0w2tm
	aPo1LBSOH48OCjXMyDua24cfKR/Yhhdceu83E86DT1AkuoLFLSm+3imG
X-Gm-Gg: ASbGnctYB88HJ+bfOOrzjBej4qheKkA+EnXWF+faLQgFsxcBjc6F+KUjuVMJkdvqArI
	328HHqNyGW+0vbIJLs8+4ffHoawooVX0lp8B8RjYDDVm1ac6qQr6P4CYVnkv09BYaCbDcx4Dooc
	nAZx5hGMepOtPEk+WebUJYGj2hHZBuwtHxcn/+i+WYfBU58w4z7jD5m007bhTYK9L0OZ3NM/c1+
	4WxA7pJpEigQ5WUiKYC2jgxJ0ZvfFfFvprSsbuBj0GsGJwbNRUTr/7ypviw7hISYoVzl5W9p1Ka
	AwBhvKC8WKyx71wPGiQJfyaXzdoSDI8qvEjLHeWxXdu8i/8xyWVS2r360sI=
X-Google-Smtp-Source: AGHT+IEvgRuWohLAUSEWsC8kMOpiVuWBbrc54nTFQAWlA1WoJihbX0uD8k8DXgmDGcLtE+j0jX/3jg==
X-Received: by 2002:a17:907:3e08:b0:ac7:16ee:9112 with SMTP id a640c23a62f3a-ad52d080e60mr1976565166b.0.1747823896542;
        Wed, 21 May 2025 03:38:16 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04e80asm875267766b.2.2025.05.21.03.38.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 03:38:15 -0700 (PDT)
Message-ID: <d50b735b-d894-4c1b-b902-5d6ffca36edb@gmail.com>
Date: Wed, 21 May 2025 12:38:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH] gcc: AArch64 - Fix strict-align
 cpymem/setmem
To: Sundeep KOKKONDA <Sundeep.Kokkonda@windriver.com>,
 openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, steve@sakoman.com
References: <20250521090916.974418-1-sundeep.kokkonda@windriver.com>
 <eb760092-3915-4133-8f19-c0b6b7dd6743@gmail.com>
 <5e1efec5-8840-42ee-b745-a817a70678df@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <5e1efec5-8840-42ee-b745-a817a70678df@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 10:38:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217019

On 5/21/25 12:29, Sundeep KOKKONDA wrote:
> On 21-May-25 15:23, Gyorgy Sarvari wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>>
>> On 5/21/25 11:09, Sundeep KOKKONDA via lists.openembedded.org wrote:
>>> From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
>>>
>>> The cpymemdi/setmemdi implementation doesn't fully support strict alignment.
>>> Block the expansion if the alignment is less than 16 with STRICT_ALIGNMENT.
>>> Clean up the condition when to use MOPS. (PR103100)
>>>
>>> Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=b9d16d8361a9e3a82a2f21e759e760d235d43322]
>> Is this a partial backport of the commit?
>> I wouldn't expect the backported patch to match the original 1-to-1, but
>> the original commit also contains some changes of the machine
>> description, which is missing from this patch. Is that not required?
> The original commit was for gcc-12 and above and the gcc community is 
> not going to do downward backport of the patch for gcc-11.
>
> The original patch contains 'alignment part in .c' & .md file changes. 
> The changes in machine description files (which are not mandatory as per 
> the author) are causing some failures on other modules while building 
> the image due to missing RTL instructions (gcc compiles successfully). 
> So, I took only the alignment part of the patch. This cherrypicked patch 
> & it's output correctness I get it verified with the patch author.
>
Got it, thank you for the clarification. Do you think you could add
something along these lines to the commit message also?

> Thanks,
>
> Sundeep K.
>
>>> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
>>> ---
>>>   meta/recipes-devtools/gcc/gcc-11.5.inc        |  1 +
>>>   ...rch64-fix-strict-align-cpymem-setmem.patch | 45 +++++++++++++++++++
>>>   2 files changed, 46 insertions(+)
>>>   create mode 100644 meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch
>>>
>>> diff --git a/meta/recipes-devtools/gcc/gcc-11.5.inc b/meta/recipes-devtools/gcc/gcc-11.5.inc
>>> index f17ec9da5c..1e8371b2bd 100644
>>> --- a/meta/recipes-devtools/gcc/gcc-11.5.inc
>>> +++ b/meta/recipes-devtools/gcc/gcc-11.5.inc
>>> @@ -60,6 +60,7 @@ SRC_URI = "\
>>>              file://0029-Fix-install-path-of-linux64.h.patch \
>>>              file://0030-rust-recursion-limit.patch \
>>>              file://0031-gcc-sanitizers-fix.patch \
>>> +           file://0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch \
>>>              file://0001-CVE-2021-42574.patch \
>>>              file://0002-CVE-2021-42574.patch \
>>>              file://0003-CVE-2021-42574.patch \
>>> diff --git a/meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch b/meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch
>>> new file mode 100644
>>> index 0000000000..4c2d827799
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/gcc/gcc/0032-gcc-aarch64-fix-strict-align-cpymem-setmem.patch
>>> @@ -0,0 +1,45 @@
>>> +gcc: AArch64 - Fix strict-align cpymem/setmem
>>> +
>>> +The cpymemdi/setmemdi implementation doesn't fully support strict alignment.
>>> +Block the expansion if the alignment is less than 16 with STRICT_ALIGNMENT.
>>> +Clean up the condition when to use MOPS.
>>> +
>>> +Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=b9d16d8361a9e3a82a2f21e759e760d235d43322]
>>> +
>>> +Signed-off-by: Wilco Dijkstra <wilco.dijkstra@arm.com>
>>> +Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
>>> +---
>>> +--- a/gcc/config/aarch64/aarch64.c   2025-05-08 20:40:10.969865898 -0700
>>> ++++ b/gcc/config/aarch64/aarch64.c   2025-05-13 23:11:07.006796627 -0700
>>> +@@ -23621,14 +23621,15 @@
>>> +   int mode_bits;
>>> +   rtx dst = operands[0];
>>> +   rtx src = operands[1];
>>> ++  unsigned align = UINTVAL (operands[3]);
>>> +   rtx base;
>>> +   machine_mode cur_mode = BLKmode;
>>> +
>>> +   /* Only expand fixed-size copies.  */
>>> +-  if (!CONST_INT_P (operands[2]))
>>> ++  if (!CONST_INT_P (operands[2]) || (STRICT_ALIGNMENT && align < 16))
>>> +     return false;
>>> +
>>> +-  unsigned HOST_WIDE_INT size = INTVAL (operands[2]);
>>> ++  unsigned HOST_WIDE_INT size = UINTVAL (operands[2]);
>>> +
>>> +   /* Inline up to 256 bytes when optimizing for speed.  */
>>> +   unsigned HOST_WIDE_INT max_copy_size = 256;
>>> +@@ -23750,11 +23751,12 @@
>>> +   unsigned HOST_WIDE_INT len;
>>> +   rtx dst = operands[0];
>>> +   rtx val = operands[2], src;
>>> ++  unsigned align = UINTVAL (operands[3]);
>>> +   rtx base;
>>> +   machine_mode cur_mode = BLKmode, next_mode;
>>> +
>>> +   /* We can't do anything smart if the amount to copy is not constant.  */
>>> +-  if (!CONST_INT_P (operands[1]))
>>> ++  if (!CONST_INT_P (operands[1]) || (STRICT_ALIGNMENT && align < 16))
>>> +     return false;
>>> +
>>> +   bool speed_p = !optimize_function_for_size_p (cfun);
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#217009): https://lists.openembedded.org/g/openembedded-core/message/217009
>>> Mute This Topic: https://lists.openembedded.org/mt/113226173/6084445
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>


