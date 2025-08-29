Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD1ACA0FF0
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 14:11:31 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.14766.1756476686258561647
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Aug 2025 07:11:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JfjGwKxJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-afefc7be9d4so143849366b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 07:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756476684; x=1757081484; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mLOywO/utTj5Rhvb/x3grs8o/6I1S5SupGOq+RjJ2xA=;
        b=JfjGwKxJCmsF5UqCq2FoDOsnCuIvdeGjbDv7RIdRb0U07Zm8ZFlnK/EWYWBEVXjSL9
         6vKhoy2lYDSCZ1nI+y+QeyibPnaQw1GNNS5az25NeO+u6dpxM+nfeRAn1zJtPdN4g1IJ
         O/jFKtyYed7JN7JP3v1wSHZZzXAO+ErhwPWzCTZcxf4yMRJtmf2218hVYKQiGdrgo8Yf
         uwNxPnyfRJuyKV/bBVROUL08W8J8JRCXGl+jgn/muDwDpHwbzeO28q7EUhAZ7CZ9CGoR
         uQD9te1o0aDMks42xEdX8Pt/aZstLF4V8gAzKVyXXAFrtux4RBV2WKojKf442tJI/R8m
         5Lfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756476684; x=1757081484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mLOywO/utTj5Rhvb/x3grs8o/6I1S5SupGOq+RjJ2xA=;
        b=eKQu0XEYxwPyg9k84//FQB4w5GWDZA+twLenvoi7JBO4U0NWRI+jLPdsH7y51a1vOd
         UzMAOoHyubV+lAf8ZUlWLuDbIwjy8K9ZYuFjy7BDee4Izynl0t4P7E+0MNyuag661Hee
         3OR39FnwBAw6DZ2rMYlQ+UNbzcmGRiupqwPlrSSKZO/HVqAwLvGzkmR9dh1NlFxBe4z2
         rvDQWgMegxtzNH8zjtoutFl57M/C46QUg6+OrfGaxjIMLl7bv4LSrNV2a0RPr7urD7v2
         vjEvNEkjxP0IukVVeOOaSsnN2/403NxlxYTKOjRjWmXZWlVZr2uHVhiHEzIk7AtUvz39
         XP0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUgSlkuW5fqO2dXi7SIbtIoyqQxuOT8nrDwozbVG13oPTsdwCGom4exHy1e9rS5SdBQhvJsfQtwM6XeYg1YXxBogQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzPSfQEq9XrxJHZhdm3r7aeo/LxRPyXEe4+eXDW63ezMd1lgMQB
	PmP8bWdYgaZ09w7vzHMCO8WeMDQlDARLAgxOnVePwIONVplsrgLH/wMK
X-Gm-Gg: ASbGnctmB0HWS8caAK/PJQyOfmbXcsewffbyMqsKpMJP8+7tgqfrhOR38hHArnJai68
	MPgH3tRgphSR34azt5VOa1OEf/eEy58mtUAZOyLksSPhPZmWuGifN3GTFWK8r6/5H7+td8uyb3j
	yAUeqGfYzyZElUIgFDp+8CJUfj9ADG2WvG5mjk16iAWgFl6bCz60gxzVKqFrdVJ9vhOPAm1NE9M
	3C76JTear616hx4cCVIpmxrfbFrhobGVhIvxhEeI8RUWEXpqcHfVsnF0vSSpkZvKZ7ENqgRmgbt
	M/Tj2SQhzZ+UMQndPDLnJGyTnZR/BksuuCPgTSjgNv9PtV1TKCpvRCaEFvSquy5vsMrl5rDvw4Z
	weNGo01OAz+eWYa4/kbAb961TLQhTHASbOTil/XgSpyfS7tLPOITZ
X-Google-Smtp-Source: AGHT+IFF16RHAwzKP9ipmTbdOFWrJdjDxL7wxLXPynXbdG6BzD6b1RKuYa2Z9+JOi+JwxWgG392oDw==
X-Received: by 2002:a17:906:478f:b0:af9:3589:68cb with SMTP id a640c23a62f3a-afe2974a001mr2696995566b.48.1756476684194;
        Fri, 29 Aug 2025 07:11:24 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc22dfa1sm1843912a12.22.2025.08.29.07.11.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 07:11:23 -0700 (PDT)
Message-ID: <356fbb5d-9212-473b-8a9a-fd2f57e5d064@gmail.com>
Date: Fri, 29 Aug 2025 16:11:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][walnascar 10/12] linux-yocto/6.12: riscv: Enable
 TUNE_FEATURES based KERNEL_FEATURES
To: steve@sakoman.com, openembedded-core@lists.openembedded.org,
 mark.hatle@amd.com
References: <cover.1753041740.git.steve@sakoman.com>
 <850949594410a9a228e164977c9e8a08f4a52876.1753041740.git.steve@sakoman.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <850949594410a9a228e164977c9e8a08f4a52876.1753041740.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 14:11:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222615

Since this patch, it looks like qemuriscv64 doesn't boot in Walnascar.

I'm using a vanilla core-image-sato with some extra added applications.
I can't really figure out how to save the console output from qemu, so
all I offer is a useless screenshot that is not showing anything because
it scrolled too far: https://postimg.cc/G8sqjK0b

Once I remove this patch, it boots again. Am I missing something on my
end, or is this something with the combo of Walnascar and this patch?

On 7/20/25 22:04, Steve Sakoman via lists.openembedded.org wrote:
> From: Mark Hatle <mark.hatle@amd.com>
>
> Allow the risc-v TUNE_FEATURES to select specific ISA (kconfig) selections
> in the kernel config via config fragments selected by KERNEL_FEATURES.
>
> This allows the following items to be selected dynamically:
>
>     CONFIG_ARCH_RV32I
>     CONFIG_ARCH_RV64I
>     CONFIG_FPU
>     CONFIG_RISCV_ISA_C
>     CONFIG_RISCV_ISA_V
>     CONFIG_RISCV_ISA_ZBB
>     CONFIG_RISCV_ISA_ZICBOM
>     CONFIG_RISCV_ISA_ZICBOZ
>     CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
>
> Note: Some ISA options, such as CONFIG_RISCV_ISA_C may be reenabled by other
> options such as CONFIG_EFI.  This is properly reported by the configuration
> tooling.
>
> Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 45a1b5aa6abc9007d0d87efc2d740b5564a209dd)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto.inc | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
> index 389329030d..4d0a726bb6 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -37,6 +37,22 @@ KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'efi', 'cfg/
>  KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
>  KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'vfat', 'cfg/fs/vfat.scc', '', d)}"
>  
> +KERNEL_FEATURES_RISCV = "\
> +    arch/riscv/tunes/riscv-isa-clear.scc \
> +    ${@bb.utils.contains(    'TUNE_FEATURES', 'rv 32 i m a', 'arch/riscv/tunes/riscv-isa-rv32i.scc',  '', d)} \
> +    ${@bb.utils.contains(    'TUNE_FEATURES', 'rv 64 i m a', 'arch/riscv/tunes/riscv-isa-rv64i.scc',  '', d)} \
> +    ${@bb.utils.contains(    'TUNE_FEATURES', 'f d',         'arch/riscv/tunes/riscv-isa-fpu.scc',    '', d)} \
> +    ${@bb.utils.contains(    'TUNE_FEATURES', 'c',           'arch/riscv/tunes/riscv-isa-c.scc',      '', d)} \
> +    ${@bb.utils.contains(    'TUNE_FEATURES', 'v',           'arch/riscv/tunes/riscv-isa-v.scc',      '', d)} \
> +    ${@bb.utils.contains_any('TUNE_FEATURES', 'b zba',       'arch/riscv/tunes/riscv-isa-zba.scc',    '', d)} \
> +    ${@bb.utils.contains_any('TUNE_FEATURES', 'b zbb',       'arch/riscv/tunes/riscv-isa-zbb.scc',    '', d)} \
> +    ${@bb.utils.contains(    'TUNE_FEATURES', 'zbc',         'arch/riscv/tunes/riscv-isa-zbc.scc',    '', d)} \
> +    ${@bb.utils.contains(    'TUNE_FEATURES', 'zicbom',      'arch/riscv/tunes/riscv-isa-zicbom.scc', '', d)} \
> +    "
> +
> +KERNEL_FEATURES:append:riscv32 = " ${KERNEL_FEATURES_RISCV}"
> +KERNEL_FEATURES:append:riscv64 = " ${KERNEL_FEATURES_RISCV}"
> +
>  # A KMACHINE is the mapping of a yocto $MACHINE to what is built
>  # by the kernel. This is typically the branch that should be built,
>  # and it can be specific to the machine or shared
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220635): https://lists.openembedded.org/g/openembedded-core/message/220635
> Mute This Topic: https://lists.openembedded.org/mt/114257145/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


