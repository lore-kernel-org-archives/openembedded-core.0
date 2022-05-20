Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50A27C433EF
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 12:20:02 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web09.7950.1653049197970105138
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 05:19:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QyBU+qcK;
 spf=pass (domain: gmail.com, ip: 209.85.167.52,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id y32so14007765lfa.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 05:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=niNFtC1r6EVLguD1RtEK+s7VbKinMiu6iATfHyd3HYg=;
        b=QyBU+qcKaH+Wws6a9IBtqxwjOxeNyE4aTBiXISlFumfUmPw6w/jqCGyrS7QqZh+qTy
         x+VCqGRbZrkmL7swO0YHVP2qp6oGh9/nGoqTNkyyaUKQ8nYo59KlyREsv2YI8kOiYYwW
         FtAUdU4kgMuAjQaQmWlgflRP2JSa8luyX/c6YuRTwrZIL8EJNNZR7XUWIbSfGSifjy/k
         0B4F5h+ziigN/vNWYgvUyL+ZYTRbeLneKm2G4ju9T9HsVO/CZjqizfb95vMMyfvrqJRN
         +qWQwVsy4uNANK5uMTWKmU+0RJFngbJjTbwNdXcmYAEYrFPdzmTLqTTMPO6MiEfu84kd
         YcuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=niNFtC1r6EVLguD1RtEK+s7VbKinMiu6iATfHyd3HYg=;
        b=cpI/+0ZeOPn0/cdwBeX1HYTx9sTP9LQa5jt9zP6JmWaRWuzf3lJajIS20QsaLPR1Ax
         LEwQ/xtD7/FbSRoN6e1nqUrFTq9zCC9rHVt4DldIsxjLaRR1U45OmZTGD2+kwAeDKvXG
         /UxQNQx9kV6ln/AIOLNtvW51Es0uCAMmbIzk38dAntzJ8xW/yRxofH539AV1V2aJqh77
         0QYXUWQZw2LdnLAO5LmW3RFwsVY8+qtUgt84ERZGJQJo2xCMlL0H7E9gBr55MR7oDHnm
         yFVTPbWiB4yiJGdY8Go7UifJWUwkTg23VN8Iiw3P1YUdUSzqapVoCpbGAOsNIyoz3cUP
         Axcg==
X-Gm-Message-State: AOAM531D/nQ6Hf70/Gjy/nmyub80jz6hpc1Vy2WnX5LmdGuEa7tTzm7k
	1igMlIOCdwvKtT+yrm0Abh0=
X-Google-Smtp-Source: 
 ABdhPJyewbcR7xQeNqV1VJPtdIsl+v4iAUitYINvPZHGZuFYaj90gvmyGYNdJ9GJGdTp4PryuBsxuA==
X-Received: by 2002:a05:6512:252b:b0:477:b184:3d39 with SMTP id
 be43-20020a056512252b00b00477b1843d39mr6729761lfb.69.1653049196153;
        Fri, 20 May 2022 05:19:56 -0700 (PDT)
Received: from [192.168.10.102] (89-253-118-72.customers.ownit.se.
 [89.253.118.72])
        by smtp.gmail.com with ESMTPSA id
 n12-20020ac242cc000000b00473e8c88b92sm641931lfl.117.2022.05.20.05.19.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 05:19:55 -0700 (PDT)
Message-ID: <6eed596f-6ca3-5977-bb1a-4d3d904bb154@gmail.com>
Date: Fri, 20 May 2022 14:19:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [OE-core][PATCH] webkitgtk: limit the number of compilation
 threads
Content-Language: en-US
To: thomas.perrot@bootlin.com, openembedded-core@lists.openembedded.org
References: <20220520121617.2993631-1-thomas.perrot@bootlin.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: <20220520121617.2993631-1-thomas.perrot@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 May 2022 12:20:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165928

On 5/20/22 14:16, Thomas Perrot via lists.openembedded.org wrote:
> Otherwise the compilation may lead to out-of-memories.
> 
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> ---
>   meta/recipes-sato/webkit/webkitgtk_2.36.1.bb | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.1.bb
> index 65757c36a733..e7cfe49e2b87 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.36.1.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.36.1.bb
> @@ -80,6 +80,8 @@ setup_python_link() {
>   	fi
>   }
>   
> +PARALLEL_MAKE = ""
> +
>   EXTRA_OECMAKE = " \
>   		-DPORT=GTK \
>   		${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
> @@ -164,4 +166,3 @@ src_package_preprocess () {
>               ${B}/WebKit2Gtk/DerivedSources/webkit2/*.h
>   
>   }
> -
> 

Why punish build machines with lots of RAM ? Maybe it could be set 
depending on available RAM/number of cores ?

Jacob

