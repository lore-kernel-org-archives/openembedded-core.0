Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3845C3DA4A
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 13:43:41 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.19873.1724161413524555492
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Aug 2024 06:43:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=FtXNEdX9;
 spf=pass (domain: baylibre.com, ip: 209.85.219.49, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6bf42a563c8so30508166d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 06:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1724161412; x=1724766212; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pANTdZDgBIdc68iEzW1iBNViVB5v0oROeGRTGYKIX8U=;
        b=FtXNEdX9YHE2kl2a4ypJXqfF5SruTOPZKthOxCYqF7N8/dh6vMNxLMcFCs/9iSdhtJ
         gAl90+nZPRrjuhkYmeDCctsGbHxW8m5aMKtWuutI993OKqawdyNkPF96GevsCUDNfx3h
         j7abJDRZPmV6Ph2EFzXi32fIKqBYjrLu0xLfVQYuRYJClC1RIBMTXaGoNuJ2XxSNpvAp
         nlzcariRdyeTRiTq6zXJ3r1AcQ7irgGj7ofhbfansLk7YXqzitXWsSWZ317NvbQ4VaWN
         blASLduP7/9diCbF4zxJiJmDXVqPhZ485yblGf5fYpT4rrvLZJPFHgG8w632n41SaD5c
         yqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724161412; x=1724766212;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pANTdZDgBIdc68iEzW1iBNViVB5v0oROeGRTGYKIX8U=;
        b=qWeFjHNG4dJWsBENYC+fRt3VVlmfcg4c4OH2j8XnQSo5CIyCzzCTYNmR+sT7k7wbL7
         zHgriEGCihn0ewQU18QJLJCDcl9i3OMej83F0QnVXdBjyXrO+jjciXopSxQDPlFZJM+A
         Z8mJRvRI+jVT03ibeLExYw3i49wS9KXZpgvIPQznkttSrpJG31BxL9IN3+1DS+vst2jE
         P9cxp+jSuIxmcEtCzFRtMc1t6Vo5jD82u9y60RUwNMLwhWq6gsfDCLXqdpxALegWg+Il
         BYzP6BE3n466+kPnL1VTJRVpAoo/ZP8OQ7wX50A374gni7kBDFo2L56KfsMcvnQLaEn0
         aHLg==
X-Forwarded-Encrypted: i=1; AJvYcCU9TWj5YDiJOz5Q7foFWO1O2Q5bgO6kp3LnZh9wXtz3Lt8oRNwuCGaw3DnIuSBYL95HQc5LH95sA9UR3u+p6/4fdg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzB2+cZWyViKuJnY/TOEr+bdzTgW1qmiFlg/thOMf85GGcMxKY1
	nL1SMzFz+ye17eVLDWD02200EBfywm58oSV3U3b1WTI3ftNaxlt/q7w5HWOYUHA=
X-Google-Smtp-Source: AGHT+IGzekuAKMdSyzkfdQczYLYlDGFZpm2sL+RGa4oBVls6hGNPOKC19pkH4nPK+5RV7K91D0osug==
X-Received: by 2002:a05:6214:2c04:b0:6b2:da7e:5cb7 with SMTP id 6a1803df08f44-6bf7cd7923amr155285396d6.5.1724161412355;
        Tue, 20 Aug 2024 06:43:32 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fdd9072sm52530496d6.15.2024.08.20.06.43.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 06:43:32 -0700 (PDT)
Message-ID: <64f53337-d603-487d-a205-94e25d44e8d1@baylibre.com>
Date: Tue, 20 Aug 2024 09:43:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] ovmf: upgrade edk2-stable202402 ->
 edk2-stable202405
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20240816154613.4030253-1-tgamblin@baylibre.com>
 <2cdeeae38c7481a74f4f3dc64cdd47694fe8a0d2.camel@linuxfoundation.org>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <2cdeeae38c7481a74f4f3dc64cdd47694fe8a0d2.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 13:43:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203556


On 2024-08-18 9:55 a.m., Richard Purdie wrote:
> On Fri, 2024-08-16 at 11:46 -0400, Trevor Gamblin via lists.openembedded.org wrote:
>> Changelog (https://github.com/tianocore/edk2/releases):
>>
>> New Features & Bug Fixes
>> - SecurityPkg:Add EFI Device Authentication Signature Database and SPDM
>> - CryptoPkg:add additional RSAES-OAEP crypto functions
>> - OvmfPkg:Add 5-level paging support
>> - OvmfPkg:SEV-SNP Support for running under an SVSM
>> - OvmfPkg:RBP register shall be cleared in TDVMCALL
>> - OvmfPkg:Harden #VC instruction emulation (CVE-2024-25742)
>> - Add SPI bus driver stack
>> - NetworkPkg: Predictable TCP ISNs
>> - NetworkPkg: Use of a Weak PseudoRandom Number Generator
>> - UefiCpuPkg: Add new SmmRelocationLib library
>>
>> Update Notes
>> - NetworkPkg SECURITY PATCH CVE-2023-45237 requires the platform to
>>    provide the right implementation of the EFI_RNG_PROTOCOL (i.e., using
>>    a GUID that appears in the allowlist) and EFI_HASH2_PROTOCOL. If it is
>>    not implemented, the platform will lose the ability to do network
>>    boot.
>>
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> ---
>>   meta/recipes-core/ovmf/ovmf_git.bb | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
> I suspect this upgrade is the cause of these selftest failures:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/7021/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/7021/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/7078/steps/14/logs/stdio
Hmm, I'm not immediately sure what to do with it. I'll have to come back 
around to it soon, unless someone else decides to give it a try.
>
> Cheers,
>
> Richard

