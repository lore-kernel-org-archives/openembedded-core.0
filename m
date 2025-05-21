Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB8AC3DA6D
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 01:33:02 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.1272.1747791172720628947
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 18:32:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SqiApsCk;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7399838db7fso5897312b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 18:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747791172; x=1748395972; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Q9j9/bbNE9/qLt/RYMC36ft6Fxxv+qrGnN5khe09cg=;
        b=SqiApsCk45IY4AMNh/NvkM1VsILqC/sdrflsrDpI4AaLoc6p6YFeb6tNaUP59gy4GC
         ZBtKDKLUzYchGpDpsF56UOww3cTDNNLLl6gBS8NOjZ+fKYrd8jGanT2Zo55mWmcGyi+c
         FauwyfNmYP4Tc5oJMdwZk+Rx9CZcl+n8S4cG7xT1GPm8rslAmOZDBzQzw07/BwLe3q95
         pxhKOrfTnNKg1CBxj4MxK/TMZkzEj5VYHUrHQnxjGTcAshtay0x9glcvFohSkmjyoUmV
         d+BXqo5i1keiel+0XMRMrsvzg1QyfZRScY1gVdHGkXj+XHxF6nl+5Hqc8lRNKzxi8IiB
         kNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747791172; x=1748395972;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Q9j9/bbNE9/qLt/RYMC36ft6Fxxv+qrGnN5khe09cg=;
        b=pYDd5SDTuVNNJR6cXpuuo5X4gq3VTMnFB8pKn7bNQ5ptHGSEJ4MqNXNSgp4ji0lgUh
         cQr4kfVmB1C5opxk197UOEJVi9pZ+GRWKCmcZtcEdg5i1vBoNAEhGS061oIB6TytJ4eF
         cBZnORAW+bDEgv5TWtlEwNpjb+EmCKznFVTqssvzTjpzI3DG4lHd7jdNt7cu6CAXq71N
         8oYfb8jal3t0+YmR1RDpBkmb4wlQEY4pcoFlzNLQAT5rScuLco2vpWeXQTCIRvMm3FiI
         CeFs4CkvDbwN019Tl3lFyVUaMAAjKn1y7CIpi7LgstynGHEsuATBA2JuHeAKjzfjvOJW
         i2yw==
X-Forwarded-Encrypted: i=1; AJvYcCUY5UNJVMdWhn9TFcAgzBOOHbeySUuLNhxlNkSzZLfzFv2seEXzIH3RQ+n1BA+U3ZoPPDzRbyClQ3hexMM/y960hg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyjs2UNxUQv9gu3BN3OI4YSukYdHaufRMCYN89zCy55WzVnJr0g
	bp7XP0Bjrn+ImgAE2RBckocYa4n/Q64+zuTuGaTAs/CCU7BzW8wFSM8K
X-Gm-Gg: ASbGncvvb7MWMeSzvE25I5JmJhTynOJ/8g87KKaVwxBADt7z+Gp8VQmThwScTXub9MH
	sXEO8UmK8kVssNx/xpjUQ+tL3TwK9WVyH46Yr7cf7kGlTX6yTcxKUScGpCZStZo1QxyQ29pf5T7
	PoQFa3qjf3zLQkdBUbW2hzKBiiuEnp19jkn/uWb/iaJzK2ZwG32aHUUXpuKDl65PS+0knSww/zD
	5Y8EBD/z/+ZmgTFOBv2bMOGG6eBkhBmnSjEZOxIFP/hvv2y0KSrv7QthnALspnS2wQML/q3P7UL
	2Yz2AeeaimhAL25Ns9y1MA/2gGvI2/zX8YXEr6N3thL8MxkBDk57aKilIYJ6ntjagkrXtOfOeTT
	vAOQX5eXVc1oVTx0VDGld4J9HDMzjAOjfcYGYAbEOooThNM8=
X-Google-Smtp-Source: AGHT+IH3wrsDanh1sjSf+U4yStD4SW2Hwo+zW3nSazifh7IRNyn3ZiXH4uEQgL+sxhOZtMBTh60jlw==
X-Received: by 2002:a05:6a00:e06:b0:742:cdf2:62c7 with SMTP id d2e1a72fcca58-742cdf26398mr15157802b3a.4.1747791171932;
        Tue, 20 May 2025 18:32:51 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:357c:f572:ef47:e08? ([2601:646:8201:fd20:357c:f572:ef47:e08])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a98770eesm8471910b3a.154.2025.05.20.18.32.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 18:32:51 -0700 (PDT)
Message-ID: <783d3f8e-8513-4951-a0a7-e1ac96f1e4d3@gmail.com>
Date: Tue, 20 May 2025 18:32:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] clang: build-depend on
 spirv-llvm-translator-native
To: dmitry.baryshkov@oss.qualcomm.com,
 openembedded-core@lists.openembedded.org
References: <20250520110111.3893998-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20250520110111.3893998-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 01:33:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216961



On 5/20/25 4:01 AM, Dmitry Baryshkov via lists.openembedded.org wrote:
> Building of spirv-mesa and spirv64-mesa CLC targets (which are required
> for Mesa to work) requires a working llvm-spirv tool (provided by the
> spirv-llvm-translator-native package). Make clang build-depend on the
> corresponding recipe in order to be able to build requried targets.
> 
> Fixes: 4178fe97371b ("clang: split SPIRV-LLVM-Translator to its own recipe")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   meta/recipes-devtools/clang/clang_git.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
> index b41b700292c7..bca8c7fa877d 100644
> --- a/meta/recipes-devtools/clang/clang_git.bb
> +++ b/meta/recipes-devtools/clang/clang_git.bb
> @@ -206,7 +206,7 @@ EXTRA_OECMAKE:append:class-target = "\
>   
>   DEPENDS = "binutils zlib zstd libffi libxml2 libxml2-native ninja-native swig-native spirv-tools-native"
>   DEPENDS:append:class-nativesdk = " clang-crosssdk-${SDK_SYS} virtual/nativesdk-cross-binutils nativesdk-python3"
> -DEPENDS:append:class-target = " clang-cross-${TARGET_ARCH} python3 ${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'compiler-rt libcxx', '', d)}"
> +DEPENDS:append:class-target = " clang-cross-${TARGET_ARCH} python3 ${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'compiler-rt libcxx', '', d)} spirv-llvm-translator-native"

LGTM

>   
>   RRECOMMENDS:${PN} = "binutils"
>   RRECOMMENDS:${PN}:append:class-target = "${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', ' libcxx-dev', '', d)}"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216902): https://lists.openembedded.org/g/openembedded-core/message/216902
> Mute This Topic: https://lists.openembedded.org/mt/113208799/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


