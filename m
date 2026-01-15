Return-Path: <elmehdi.younes@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8122AD41148
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 08:58:12 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31585.1768467491253233958
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 00:58:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PaiBGCK4;
 spf=pass (domain: smile.fr, ip: 209.85.221.65, mailfrom: elmehdi.younes@smile.fr)
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa9so326377f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 00:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1768467490; x=1769072290; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uxaUyCEjrL2p+Udp4p29k6nGLVSqMu1eAXrEp0V1C7A=;
        b=PaiBGCK404TeJLSVAbB5qdDuYWEajeVLAnWPHBol3E/m5qNPIdsbAJOfiJEwIv2AYM
         pPojGEJgKbLByyYxB3yHNpAMncusAlZOEXt7hGbxVs/afLyFmXUtjgppYN6YgQARGUFN
         VEWWitkYjBRHsF+Hd8ucMGhnY49ZgRVGOVi6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768467490; x=1769072290;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uxaUyCEjrL2p+Udp4p29k6nGLVSqMu1eAXrEp0V1C7A=;
        b=iQb+3jD99gNL1iU/YFo6GBWX4j0JfTKfBtckFKxwk3XUzHsgbCfSgM5xxu0EJGysqn
         H/FjgLUTdYqt6WTmXm/KC+3mlJZ/L2VCTSj/12wNAryogS/H/OugN+oPqXuTWW/+iOpl
         a5jaVixkyZw8NGHep2UIuSYP+GV/tgOIOghuiWUclfax+mkkyX8Lx2w5oOURtFoVT6gm
         n3PX7YRG1R3Q1zqgGDrt8rPKcJJawVNr5OETVY5JlUF2HZbKBOpwOH+gkK4uTMVOwm8Y
         IL6ToVRSGEiSzYDk1q5Auszf+N5UkzjBiMmFbABLVGKikPoEvtl/DMkprhPlywD5fGgR
         EgOg==
X-Forwarded-Encrypted: i=1; AJvYcCWl+eUmg1qurZHpQqMD3yKtAProSHlKmKAGLnDwqH63v0xiFGhnOFVJ1oWHOHVPgrdbgWnFLZs/pdU3PthHhN5aVw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw3WYNjtd3afRKVoSPoZgAGKIIGQU/iXhgLT4z6a3Ahvm5LCzNt
	COZ5CQZymv9meCOsjyw/gT65usuIlmihUsa09152aMdi7acVh/NulksvpNneu559XkI=
X-Gm-Gg: AY/fxX4Zqqhx6fZh/0fyaTWVX3qfMloHXx2/9VsbacSV/S/bkxPqlxbQFLHMgmdVP1m
	QN2iwpfJVfkvDGpXFFIko+eMEGFpU8px/h2s+8ZC4r8fHdI0DYdV/LlKsgHWX48FFvYlmjM5KJc
	Fs4LF79VgxZK7aAetv4c4je3CxynH1UKreiQIVIW+bnMtJXfpKc8+oflhYPv2mCzCrVlZvffPY+
	pnjXI0XbVQIYuR75gtJXWh8tgyp4nMOnhFT6pqmW4anO89XszWrAocUVDIRESaY1xP120gt47Tp
	VwpFOFlAzlh/DV9H9IYVIL0VE+6R8CJnHmdVGHWclvOq83ds5I1HgMAZCxuT2dme+zQ1Sj8v1uo
	H3TBbnonwUNlh6tZbydKNHvemUo6pJ+7nDUxuO4EDgXfJGQcyoZH9fIfKf5DCe+Hu3ME1883qx4
	h72cJj7PxIjd7wR8pS4an1SAYVmHZZb36BN3GzhPHzajg8mZG/7Il8DPbbvRuu7ukWyQwrfOQ1z
	xsUrp19+nxu+UNvnb9tI2m/vS7/HpqUqDCpqlnJbXpaGy4/eh3ckh2Nx0R6PhOrSA==
X-Received: by 2002:a05:6000:2601:b0:432:8653:6bc8 with SMTP id ffacd0b85a97d-4342c547566mr7066101f8f.29.1768467489512;
        Thu, 15 Jan 2026 00:58:09 -0800 (PST)
Received: from ?IPV6:2a01:cb05:946e:b300:5eaf:5342:11bb:3b02? (2a01cb05946eb3005eaf534211bb3b02.ipv6.abo.wanadoo.fr. [2a01:cb05:946e:b300:5eaf:5342:11bb:3b02])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af6b143fsm4547031f8f.25.2026.01.15.00.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 00:58:09 -0800 (PST)
Message-ID: <3cb873cf-38fa-43b0-b1b7-fcc574789faa@smile.fr>
Date: Thu, 15 Jan 2026 09:58:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/15] kernel-yocto.bbclass: Disable ccache when
 rust-kernel is enabled
To: Alban MOIZAN <alban.moizan@smile.fr>,
 Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: harish.sadineni@windriver.com, Randy.MacLeod@windriver.com,
 Sundeep.Kokkonda@windriver.com, openembedded-core@lists.openembedded.org,
 Yoann Congal <yoann.congal@smile.fr>
References: <CA+TGqK9Yd2WWKrhMkhofF-8N0cESCSefWD2DXr4sBO9fDQXyrg@mail.gmail.com>
 <CADkTA4P_8ScPBxuou2Jn7Jphk5ZCr9vWbsd7CPQHuGe8B=bd3w@mail.gmail.com>
 <CA+TGqK8PvL+Y9Paj2eQZKBLt7xhL2q+d_P39UByaxEmaPXFw2A@mail.gmail.com>
Content-Language: en-US
From: El Mehdi YOUNES <elmehdi.younes@smile.fr>
In-Reply-To: <CA+TGqK8PvL+Y9Paj2eQZKBLt7xhL2q+d_P39UByaxEmaPXFw2A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 08:58:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229392

Hi All,

On 1/14/26 18:05, Alban MOIZAN wrote:
> Hi,
>
>> No wrappers around the compilers. In my experience, wrapping an executable
>> to manipulate the parameters just causes to many issues with observability
>> and debug issues. So that rules out option #3 IMHO.
> Understandable, I remove this one.
>
>> Honestly, I just lean towards #5 while the handling is worked out upstream
>> between the tools.  I don't use ccache, and don't have the impression that
>> it is in widespread use .. but with the right amount of data, I could
>> be convinced
>> I'm wrong on that.
> I mean, it is not only a ccache issue, it is for possible future (or
> existing like `sccache`) other tools, the issue make any
> `CC="<my-wrapper-tool> <my-compiler>"` incompatible with a kernel
> built with rust for now.

This issue is definitely not specific to ccache, but rather intrinsic to 
how rustc

handles the -Clinker argument. It rejects any HOSTCC that is a composite 
string,

regardless of whether it is a wrapper or just flags.

I recently encountered this exact scenario in another build environment

completely unrelated to ccache. In that case, HOSTCC was defined as a 
composite string

embedding flags to ensure host settings were respected (e.g., 
HOSTCC="gcc <cflags> <ldflags>").

As a result, rustc took the executable path correctly but interpreted 
the rest of the string

as arguments intended for itself, which naturally caused the build to fail.

Regarding this specific ccache failure: when I first worked on this series,

I did not encounter the problem as I do not use ccache by default. It 
was actually reported by Yoann,

who had it enabled in his configuration. We considered disabling ccache 
but as Alban points out

this is not a ccache-specific issue. It affects any setup involving a 
composite HOSTCC.

>> That being said, I'd also add:  Don't worry about enabling ALL kernels while
>> working through the enablement. By that, I mean if there's a simple
>> kernel patch,
>> I could carry it on linux-yocto while upstream work is happening, and we could
>> confirm no ccache issues there.  The patch could also be taken by other kernel
>> maintainers that want it for their configuration, but we wouldn't have
>> to do much
>> else on that front.
> Then I will try do give you a patch soon.
>
>> I haven't gone and looked at any code, but isn't it just simpler to
>> filter ccache
>> out in the kernel Makefile's themselves before any rust invocations ? I assume
>> that is inherent in your option 1/2, but the comment about needing to patch
>> rustc as well has me wondering.
> Filter out on the kernel is my proposed solution 4
>
>>> 4. Kernel only: Patch the kernel Makefile to filter out `ccache` from CC (works in practice but not generic for a possible other wrapper in the future).
> While technically working, it is still not compatible with
> `CC="<my-wrapper-tool> <my-compiler>"` things more generically.
>
> In fact, as I said on my Trial 1, since rustc `-Clinker` only accepts
> Paths (or things in $PATH), you can only mitigate the ccache issue,
> but not the overall issue, without patching rustc.
>
> I can try to send a patch to rust with my proposed solution 1 and see
> what append on their side.
Thanks for your help.
>
>> Bruce
> Thank you for responding,
>
> Alban

Best regards,

Mehdi


