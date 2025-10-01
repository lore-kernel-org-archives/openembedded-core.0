Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 164B2CCA470
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 17:04:47 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web11.2431.1759338283375969002
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 10:04:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aXKzE2uE;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-42571642aa7so518215ab.0
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 10:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759338282; x=1759943082; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9ohSzY9CxRuAyG/z1tFwj6BAO1VsMWZS1/fVDbCFAKI=;
        b=aXKzE2uEWbg917Mc0988tp/fs5tbOcTIWuWwuND3dCRBVHZbAK4n9DMa3Uy2voBCaQ
         8vOWpa2OkzKghoh/NIbsav9wP9nvBfUcRtnHof7Uh2t/mQr6vuJawSD6QqiaYRz4/E1A
         l/ggxIWcmtCt5yB5rm4W2mWpKeTa0OSDzMW84RxMQjKAe7K2O80qIs3cMbl383UNuPOp
         Ao0Ena+TO+tlYTwLMsMUVnyBA3efNpfRLnXs359+eY71FTEJ1GXf8/lWSthdpEnXmSjU
         R0pS1fxn3zcbesRsz20RawsK0LSmqQWNMJdSs5ChXZGiJkUv5bRJCdNIUEZcbsqJWm0w
         ajIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759338282; x=1759943082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ohSzY9CxRuAyG/z1tFwj6BAO1VsMWZS1/fVDbCFAKI=;
        b=vGTvyM4CNp1N1SBRRhVyiMj2HxtJyEA8w3CyG14JEod1ckALXp6GCqzkn/SfP6DTnc
         hGhdpNbLyQvMlYCbx0Qgr4bGx3NuTiRss0rGhpZtWk1/R1+jm7Fh6aM3Ij3FT9cGrKxb
         6gddLo4df1+MCMVX7xE+MnRGugqJ4m+fj1AUDyhm6f5MF5TTBT7Aev6XEhvxRVfnf7vn
         ITTltXOGbAu5LhLRAPrsNJfxnst0IROxHQxQWrJBqZhpYK6REz0u7wAKRefpck7p6oDY
         R+PTGbYlRy9cTAxplkVice9WQCRb4dfqKb076JM9p8l0WG1ZttC3uIe8vAn5o7Ofkw4w
         cAuw==
X-Gm-Message-State: AOJu0YzG4Ez9ZtmUYWmc8SWfTrLSGNkq90QXsnu1WNCsg47iMMtxETJ7
	uJx2CclPUkeB2pZJwyD8mqr6xnhsg84niPD/UR4eydDkIPrZIbxCAd0XT3WUrboG
X-Gm-Gg: ASbGncsbTJ2PAcYXuEBYD7nnH2M3DweuL9/5grkD93fNLQQAH+1yUN5iOjFlxRgILt8
	ZeE8opw3XRxJa8GxWTtQlyjCaE0iZqHKvcKN2/T00+7EUaQSbw7rEyef5+kMjF97qgXPNvTUpai
	vVuu3R5gp1gfuZzqgdq+DBmPvaaCfIDt9jQFRBgjSUNv2VCtPqceUdayo+/YNznOtpE091DvFqE
	rTsiJcaqFXexmlJN0dqvHXns30zY48Z6OXbhWi/Z66vFuBLbZwjoX6HaGYxCgWilmF4X1QAKhRl
	fu3fU9yO37Zk/OM0Pv0IQpfDZYa9qyLQGH9xBKLw/AzfxsHkJsNJQV6lEh+jp6J+WzEdGcwml/J
	OIzfW1gwUJ9z2qDwRhefXOPYW3DqtNNyi/MU1hIsgcip8DpvrxNp4ZUPczdFfgIVRa0a77bcyrI
	EB0M9HcsEga9c78kqtquyF9Qb4s2lrOJS3Cscm0rK3DuLSdz6lqj/j8gpiU7Ccxc4YpJh3bmKOv
	EzI6jc5YxbFvLmcpHNwCCrCgBpcVDthCDyf2VfjcymBw+bqq7d6Op8=
X-Google-Smtp-Source: AGHT+IHMyRn//wEpSGmlrKqMO8fXoLkEp9UF3SY9iad5OZ738zjZAZnf3ikN1qS7CJT5pHNm+FV8yg==
X-Received: by 2002:a05:6e02:2589:b0:424:b860:7d84 with SMTP id e9e14a558f8ab-42d8167fdefmr50479995ab.27.1759338280573;
        Wed, 01 Oct 2025 10:04:40 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:8593:d4dc:f652:ce93? ([2601:646:8201:fd20:8593:d4dc:f652:ce93])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-57b5e9ec3basm5996173.13.2025.10.01.10.04.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 10:04:39 -0700 (PDT)
Message-ID: <d3ccec42-7aed-4ee9-bacf-55f204d9d887@gmail.com>
Date: Wed, 1 Oct 2025 10:04:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] clang: Upgrade to 21.1.2 release
To: openembedded-core@lists.openembedded.org
References: <20251001103516.2768272-1-Deepesh.Varatharajan@windriver.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20251001103516.2768272-1-Deepesh.Varatharajan@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 17:04:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224313

LGTM

On 10/1/25 3:35 AM, Varatharajan, Deepesh via lists.openembedded.org wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> 
> Brings following bugfixes on top of 21.1.1
> 
> b708aea0bc71 [SCEV] Don't perform implication checks with many predicates (#158652)
> 77a3b0eda361 [RISCV] Refactor RVV builtin code generation for reduce compilation time [NFC] (#154906)
> f14551dbc4e8 [RISCV] Reduce ManualCodeGen for RVV intrinsics with rounding mode. NFC
> dcc2c1c933be [RISCV] Reduce ManualCodeGen for segment load/store intrinsics. NFC
> e625a781211e [LLVM] Update CUDA ELF flags for their new ABI (#149534)
> 3e93017936b5 MC: Better handle backslash-escaped symbols (#158780)
> bc5e9a5e2009 [MC] Add parseSymbol() helper (NFC) (#158106)
> e2e5eb2f1cd9 [Loads] Check for overflow when adding MaxPtrDiff + Offset.
> 661c387fc2f1 release/21.x: [VPlan] Don't narrow op multiple times in narrowInterleaveGroups.
> f5c1b5206cbe [PowerPC] Avoid working on deleted node in ext bool trunc combine (#160050)
> db70369f400e [Clang] Fix an error-recovery crash after d1a80dea (#159976)
> 9c8736f348e0 [ELF] -r/--emit-relocs: Fix crash when processing .rela.text before .text (#156354)
> 15a31832eab7 [RISCV] Re-work how VWADD_W_VL and similar _W_VL nodes are handled in combineOp_VLToVWOp_VL. (#159205)
> f089fb21fffa [LoongArch] Fix MergeBaseOffset for constant pool index operand (#159336)
> 9eedaf5b1001 [VectorCombine] Fix scalarizeExtExtract for big-endian (#157962)
> 5af5cfb60d9e [clang-format] Handle C digit separators (#158418)
> 0174263ac214 Bump version to 21.1.2
> ff039a98523f [RISCV] Support PreserveMost calling convention (#148214)
> 1a644bc50948 [X86] Fix assertion in AVX512 setcc combine due to invalid APInt mask width (#155775)
> 2c8cb316b5d2 [lldb][test] Only assert function name is in user-code on Darwin platforms
> f5ba88341e7c [lldb][test] TestTsanBasic.py: fix function name assertion
> faedeb1a2420 [lldb][Instrumentation] Set selected frame to outside sanitizer libraries (#133079)
> 54896838ca5e [lldb][Target] Clear selected frame index after a StopInfo::PerformAction (#133078)
> f4907049285c [Clang][Cygwin] Use correct mangling rule (#158404)
> 
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>   meta/conf/distro/include/maintainers.inc     | 2 +-
>   meta/recipes-devtools/clang/common-clang.inc | 2 +-
>   meta/recipes-devtools/clang/common.inc       | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 0988bf50a7..699cfd0aca 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -481,7 +481,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-rt = "Bruce Ashfield <bruce.ashfield@gmail.com>
>   RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.com>"
>   RECIPE_MAINTAINER:pn-lld = "Khem Raj <raj.khem@gmail.com>"
>   RECIPE_MAINTAINER:pn-lldb = "Khem Raj <raj.khem@gmail.com>"
> -RECIPE_MAINTAINER:pn-llvm-project-source-21.1.1 = "Khem Raj <raj.khem@gmail.com>"
> +RECIPE_MAINTAINER:pn-llvm-project-source-21.1.2 = "Khem Raj <raj.khem@gmail.com>"
>   RECIPE_MAINTAINER:pn-llvm-tblgen-native = "Khem Raj <raj.khem@gmail.com>"
>   RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
>   RECIPE_MAINTAINER:pn-log4cplus = "Unassigned <unassigned@yoctoproject.org>"
> diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
> index bf3a63914a..ca3a3a08b4 100644
> --- a/meta/recipes-devtools/clang/common-clang.inc
> +++ b/meta/recipes-devtools/clang/common-clang.inc
> @@ -5,7 +5,7 @@ LLVM_HTTP ?= "https://github.com/llvm"
>   
>   MAJOR_VER = "21"
>   MINOR_VER = "1"
> -PATCH_VER = "1"
> +PATCH_VER = "2"
>   # could be 'rcX' or 'git' or empty ( for release )
>   VER_SUFFIX = ""
>   
> diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
> index 512bf1dd02..59d164adba 100644
> --- a/meta/recipes-devtools/clang/common.inc
> +++ b/meta/recipes-devtools/clang/common.inc
> @@ -17,7 +17,7 @@ BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}${VER_SUFFI
>   UPSTREAM_CHECK_URI = "${LLVM_HTTP}/llvm-project/releases/"
>   UPSTREAM_CHECK_REGEX = "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
>   SOURCEDIR ?= "llvm-project-${PV}${VER_SUFFIX}.src"
> -SRC_URI[sha256sum] = "8863980e14484a72a9b7d2c80500e1749054d74f08f8c5102fd540a3c5ac9f8a"
> +SRC_URI[sha256sum] = "1a417d1c8faf8d93e73fec1cbb76d393ed3218974c2283c7bac9672d3d47c54b"
>   
>   SRC_URI = "\
>       ${BASEURI} \
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#224206): https://lists.openembedded.org/g/openembedded-core/message/224206
> Mute This Topic: https://lists.openembedded.org/mt/115530053/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


