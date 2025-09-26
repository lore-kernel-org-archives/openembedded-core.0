Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31704CAC5AE
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 17:06:06 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web11.508.1758906360402478108
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Sep 2025 10:06:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bhcxQHjo;
 spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-91122373653so34427639f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 10:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758906359; x=1759511159; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TXyUJjbRODRsx+oURtwVjv5FThhW+Y+sllrzk85sDEk=;
        b=bhcxQHjoC90k+XK/Go363tAjY9eUNOoFhaThauWHPvmf+lr3X0KPAAd3IZWrgmBFf4
         FNqUW2eUCPgwh1qU/BhCvlKBFaBP7WYvZfeCtLF5BxQyZl/qf2Eyxe36CzOaT+6RQ7T6
         0MJmMyHzJXO0VJbVzYoxB5tmcIFZe21WPdXoMFnteaVO8e6jermKFdnRhHPAVhS3djN3
         nzknas22xDI9kJEyFXwySkof+BP4YPRNZbEL6sFKiIitbfX08y+KYEGnzRG/OZirtO69
         VklebcutgHtUHV/wQHBD392UyXxedcTofSDoZ2SLaebS2BBtXUT+zVaifWMrIx+MXVva
         B76Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758906359; x=1759511159;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TXyUJjbRODRsx+oURtwVjv5FThhW+Y+sllrzk85sDEk=;
        b=hv2OQXPB4dTeGGZwaXzPiO8fQstYbG2AFzq15RRAsU/Jf44sNZ5P+VWatT/kIVjwoH
         A8/2Qkit67TrqbQxmhI1ukPYGFsEXTgThac13ZWLcgxb7GHmzyQdh/mgj6wWYV2Et35e
         zzhHNTe7IJPL0VuThSafg3OsMvH2XSc//B5IZmK0npRK2MNJl5QNxzSm+PSjnYbPqK/u
         /nnur5I3zEUjnbOI4uNnEVR4/8XIXEoIT/AAoFFx8T641qkkqo8zhlg8JAWccgNT+k0s
         Ph9Fvhyayw2v91sj0T5TbkITqRuUKv/9gjMVcq4DleioaClq35lw4hrCTro3G6OOCH0w
         0y3w==
X-Gm-Message-State: AOJu0YyYnt1maQ+xtzgYxCPop8ZlcewQQeVTLk4eV10/feKJ1RTkjOF0
	i1gj7ZmfDCZMD4yK9L1c4kNJqRxAKUUXBWgu3xqmuF6De7ZN+u+8izEXMkHL8zyV
X-Gm-Gg: ASbGncuCA8tseCW+/MjlDYoWmw1eH7H0m9VCJWIn+F64tPuqUqmJxgVE26uOQFhfAFC
	gXnt5aEGFWFn4cuGuEgvaMk85VW9AwCdi2ozoElVvpiv8fNbxydXuTST/o2dGmgaCzBqTBjM4BD
	HDLoyDRJ6bB4H+g/xv0fsY4cg14vXJ1CXSZlQFWoekCC4sCUc46epWcnRgdSo195GXd0OTr+bf1
	9XHMeuXrp6ljvwHG9+ocO+v3XNAMeWRxRMrDZulsjQ0g9KW/E1hqypg4QH0Zlf2Eo1Yy/opYjtr
	L0IAJ8vH1ELZNxPwqxqrR0d1rzZuBtb7jiQqf9+HotqjUS7FCzskvte0pq7El6GDVKYS4i8Pkkg
	JhJEAF0J8sezLiB3Qw5wHJi4/kqUFCt+UKPQ1dSUm5cnmIJ5B9rYH5JBQjv0BnzZPEq+KoDoVss
	gKo06AUCuBwXuDtaX/MbaFXJmhHWlwiCwhKXnURuBFmOCp3tkVNwPL+ZUuBivVSxHObL0IS8YoL
	MZII6821X8JLHLIxRkjlammPkqahmY5IhlBA3l9sg==
X-Google-Smtp-Source: AGHT+IEwQz42TANkCWupxJGvzQYf+Z09lEkx3T2FldJYi5EmW6ZSZa1qOAJEI8ZGvAz//7Mo+9QuVw==
X-Received: by 2002:a92:b704:0:b0:420:f97:7446 with SMTP id e9e14a558f8ab-4259567c94emr88932985ab.22.1758906359341;
        Fri, 26 Sep 2025 10:05:59 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:8d7c:fa44:7948:cb52? ([2601:646:8201:fd20:8d7c:fa44:7948:cb52])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425c016c7f2sm23268395ab.36.2025.09.26.10.05.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 10:05:58 -0700 (PDT)
Message-ID: <551f878a-05d0-47a1-98f3-5eb31bafc6ea@gmail.com>
Date: Fri, 26 Sep 2025 10:05:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] syslinux: clean old object and dependency files
 before do_install
To: alex.kanavin@gmail.com, Haixiao Yan <haixiao.yan.cn@windriver.com>
Cc: openembedded-core@lists.openembedded.org
References: <20250926073618.4162662-1-haixiao.yan.cn@windriver.com>
 <CANNYZj_QnvcztWCEeDa98DVJjbrpZYhsb56D1jMe+pL+=_uwUA@mail.gmail.com>
 <8f9969b9-aa03-4225-b72d-7df98d3f9490@windriver.com>
 <CANNYZj_+3yOR14u2s6ooqQg8CuQYZqOhmi3M=k903gedmgTLLw@mail.gmail.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CANNYZj_+3yOR14u2s6ooqQg8CuQYZqOhmi3M=k903gedmgTLLw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 17:06:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224088



On 9/26/25 1:27 AM, Alexander Kanavin via lists.openembedded.org wrote:
> On Fri, 26 Sept 2025 at 10:03, Haixiao Yan <haixiao.yan.cn@windriver.com> wrote:
> 
>> Executing `make clean` deletes all existing .o and .d files from the OBJ
>> directories, ensuring that zlib is rebuilt from scratch and preventing
>> stale dependencies from causing build errors.
> 
> Thanks for the explanation. The next question I had was why the
> standard clean mechanism that is usually triggered in do_configure()
> isn't working, and indeed I am seeing this in the recipe:
> 
> do_configure() {
>          oe_runmake firmware="bios" clean
> }
> ...
> 
> do_configure:class-target() {
>          # No need to do anything as we're mostly shipping the
> precompiled binaries
>          :
> }
> 
> Should this second function be removed instead, so that the standard
> one takes over and does the cleaning?

I wonder, if it is cleaning the pre-compiled stuff too, it seems
the intent is to use pre-compiled binaries for target. So checking
if those are kept intact after clean might be prudent.

> 
> Alex
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224063): https://lists.openembedded.org/g/openembedded-core/message/224063
> Mute This Topic: https://lists.openembedded.org/mt/115444935/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


