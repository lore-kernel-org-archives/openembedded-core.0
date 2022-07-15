Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD99C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 16:58:24 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web08.1683.1657904303382089435
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 09:58:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A3qC1maX;
 spf=pass (domain: gmail.com, ip: 209.85.222.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id f14so4036403qkm.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 09:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:to:references
         :content-language:from:in-reply-to:content-transfer-encoding;
        bh=gn0X/vQw5PKCwV1+U5DEy56ddiVt0i7cnZ1LV8jBwTA=;
        b=A3qC1maXNW5EKe58tBKfvxjpq/KtZAs6N3QRvdvGFpZmGULRiJPG4vsnaMSqaCeQON
         MLYBTMqilMwhJMTyDyGrUZ5XrS98B8kJgzA4HEtBbG/TBmD1pjIJGByjXX80AKLKREDT
         vKN5yKN1sQIJlx/9BPA1ceqRBI2pAjbjjIWT0Wy+QxtfS/xD8fm1zLIlzEy6hdLZBjtS
         D/JkUpOPGXCZrXmdJYWpOlhUWS8deXvyQ512l14vIOx/aaMrpWl2iIjGjSNhXxjFvnT8
         7rpNCm3SdB/Kwy3AT/ZleF9fVhvZoOncqLsg3rlMq5FwX6zbZLbhG7/Z1dK7XKC9QOfh
         Gggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:references:content-language:from:in-reply-to
         :content-transfer-encoding;
        bh=gn0X/vQw5PKCwV1+U5DEy56ddiVt0i7cnZ1LV8jBwTA=;
        b=0DgGK/25xBgavVv1qlx8a8yIabUdxC2yU+Mak2cVZmInqx2y3pVMPHBr9YA6E/Vgsw
         fDnWV3zIoA/2Dp2midCP5GaP8oELfX2gPmnj0Rr0Ty1YIQKNgWjY7pK33ysMr3JhnLvb
         dV2pnHOvJqZQE5Kn5TYBkAQj/TsHFpU1KtaOCe8q0go1+E2r5D6IpEtL1IrbzwFp+G3W
         GhITtcPI5Bf3wNLRTUaq6DlZgjBCPaz7VinPks0Ly+kg11Wc3faRW9hNndi1NLpoJBcy
         QXsEZOVqjPGSwwnV5mt3Q3m/ZNANq32o750/DJK/TQ1myj9vgLl7QSmUDKXoai4ZRXBe
         ow5Q==
X-Gm-Message-State: AJIora+VKZMKx9TVpI3g4svhbjVYQDE3pkinXUNv2e3oqjspHMq+SFOU
	CX3h6AMmCtVyATj1zHbGvWHImDR2Y0Qmaw==
X-Google-Smtp-Source: 
 AGRyM1tAYN9obKtlfyGZnhF+2XBPzjkhSw0/Ui8VKaGkck4V/+WykRlS1EoK0bi8BVZR50AC0NqfMQ==
X-Received: by 2002:ae9:eb88:0:b0:6b5:cc0f:1a54 with SMTP id
 b130-20020ae9eb88000000b006b5cc0f1a54mr3958613qkg.330.1657904302333;
        Fri, 15 Jul 2022 09:58:22 -0700 (PDT)
Received: from ?IPV6:2607:fea8:95df:9730:2953:99a6:d45f:6161?
 ([2607:fea8:95df:9730:2953:99a6:d45f:6161])
        by smtp.gmail.com with ESMTPSA id
 ay17-20020a05620a179100b006b5d3a6f1e1sm991871qkb.0.2022.07.15.09.58.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jul 2022 09:58:22 -0700 (PDT)
Message-ID: <02209961-0c06-6d40-4968-c91e7ffe71a3@gmail.com>
Date: Fri, 15 Jul 2022 12:58:20 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0.2
Subject: Re: [OE-core] [PATCH] gcc-runtime: Fix build when using gold
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20220714091524.475739-1-richard.purdie@linuxfoundation.org>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20220714091524.475739-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 16:58:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168130



On 7/14/22 5:15 AM, Richard Purdie wrote:
> If gold is enabled as the default linker, it errors trying to link
> to our dummy library empty file and this turns off things which should
> be present in libstdc++.
> 
> For example, _GLIBCXX_HAVE_S_ISREG isn't defined and HAVE_S_ISREG in
> libstdc++-v3/config.h isn't set properly.
> 
> Instead of just creating an empty file, create an empty elf binary
> instead which addresses the issue.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/recipes-devtools/gcc/gcc-runtime.inc | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
> index c39a0caf8a7..7e920df2d34 100644
> --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> @@ -68,7 +68,8 @@ do_configure () {
>   	# libstdc++ isn't built yet so CXX would error not able to find it which breaks stdc++'s configure
>   	# tests. Create a dummy empty lib for the purposes of configure.
>   	mkdir -p ${WORKDIR}/dummylib
> -	touch ${WORKDIR}/dummylib/libstdc++.so
> +	touch ${WORKDIR}/dummylib/dummylib.c
> +	${CC} ${WORKDIR}/dummylib/dummylib.c -shared -o ${WORKDIR}/dummylib/libstdc++.so

you can improve it a little by using a one liner

${CC} -x c /dev/null -shared -o ${WORKDIR}/dummylib/libstdc++.so

>   	for d in libgcc ${RUNTIMETARGET}; do
>   		echo "Configuring $d"
>   		rm -rf ${B}/${TARGET_SYS}/$d/
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168028): https://lists.openembedded.org/g/openembedded-core/message/168028
> Mute This Topic: https://lists.openembedded.org/mt/92375338/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

