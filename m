Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75FB4C61DA4
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 11:06:19 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.15110.1677236768751734142
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 03:06:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=E57Oi0pr;
 spf=pass (domain: smile.fr, ip: 209.85.221.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f52.google.com with SMTP id h14so4843561wru.4
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 03:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=w9u3rwepNMk2Jihpozt3IDYiruqrpWQo/xFE2/lHtnU=;
        b=E57Oi0prt6MDBpVZjhCRllPudQn4iOJUAFxk3cE5cxDv/QZ2IJSuwHagiHyUAMdu3r
         ra4QECYgfTw9S7xAklc5KHPN+QRzF9iy4AKPPqWO+775JjkCRbv2U4l1tXcIjx0vwyQO
         1JvNf8CemasKx6WJ95RHYHfKP66t5WdGYQcp8Bfi1t/M1OhiEOxqFvarkCXbpPbWhMQv
         cF2kKOAP1XAP18Hw//OzaOUtOUQ3cZXi6yPaRFUSh7/GWcY+c/AzQ115ST+f6muBZWNG
         8cmIilrV3CA9RLN7IWgNJIXckyezSBdTw6rQvsSdrpIIHJyWuDFnmCBABphmifsAm3lm
         EReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w9u3rwepNMk2Jihpozt3IDYiruqrpWQo/xFE2/lHtnU=;
        b=dSATO7H4tIdNkLtgkuqkT+OKB7lEhjaIz5iCWdqlKx1cbZ/frESjuwdlGndbvEH0wS
         YxNQSIOpoKXMSxQDg0R+zaPN9aaaHcWhqJMHt4i8qS2Qge9BOUSI2JmGzoRTnN85/6W9
         B/+zWAn9APnwOBn/G+t7XZ1QAJBBLed0thISg8yY6SHRV9KhBVtHD1SRnkfHnmgH9MHv
         s0aeGyFcy78mvoOi7hjTbV3MUkTlv1Ugzrw2QEAM8OkLwZja5dl9uoP25eNjLZm6EjbW
         B6AwKzZbvhNdWOH06F248GVRhcWzEPf2U0hOyxcGOUuiuKyhsDOVLRTqP3/wXQVEVpiz
         HUzw==
X-Gm-Message-State: AO0yUKWptq1CIkbxSdymUw2roJ3Zl2AGdAkdURYANCOxV09PenCE4qZN
	+EMZ0Jzr5QZWshX/BVF0xLn9WA==
X-Google-Smtp-Source: AK7set9B/0Sxa6frE7CmFLTWe3Bgqet+wklc6atH+uj+0AxhdPdl4trdwvnsKzjVKDwqAAEZ0O93sw==
X-Received: by 2002:adf:eccf:0:b0:2c7:e424:eeb8 with SMTP id s15-20020adfeccf000000b002c7e424eeb8mr192406wro.57.1677236766797;
        Fri, 24 Feb 2023 03:06:06 -0800 (PST)
Received: from [192.168.0.28] (89-159-1-53.rev.numericable.fr. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id iw8-20020a05600c54c800b003e70a7c1b73sm2432519wmb.16.2023.02.24.03.06.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 03:06:06 -0800 (PST)
Message-ID: <3400f836-c2d1-d527-f18f-7b9a8c632686@smile.fr>
Date: Fri, 24 Feb 2023 12:06:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [OE-core] [RFC PATCH 0/2] Handling of ${PN}-dev RRECOMMENDS
 non-existent ${PN}
Content-Language: en-US
To: ChenQi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, Fawzi KHABER <fawzi.khaber@smile.fr>
References: <20230223232939.3932270-1-yoann.congal@smile.fr>
 <b0d183bd-d99c-8815-f6e2-e26ac0c292d5@windriver.com>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <b0d183bd-d99c-8815-f6e2-e26ac0c292d5@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 11:06:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177679

Hi,

On 2/24/23 04:05, ChenQi wrote:
> I have some concerns about this series of patches.
> 1. The QA check is not checking for RRECOMMENDS on non-existentent packages, it's only checking for non-existent in-recipe packages. That is, it's not checking packages from other recipes.

Yes, you're right. Our (non-written) reasoning was :
* a out-of-recipe RRECOMMENDS link to a package that won't be built seems totally legitimate (AFAIK, if A RRECOMMENDS B, A has no way to know if B will be built)
* but, for a in-recipe RRECOMMENDS. It shows that the recipe is not internally consistent. So the QA_WARN is legitimate, I guess?

> 2. If patch 2 is sent, then the patch for 'a general way to fix the case' should also be sent, otherwise, we'll be in a situation that a bunch of warnings are there but there's no suggested fix and current workarounds have been explicitly removed.

Yes, I guess some context was missing here as well : these 2 patches are the first step to fix Yocto#6839 & Yocto#8222.
The way to properly fix these is not obvious right now and to help Richard, we pushed these to make the problem appear more clearly.
These are not ready to be merge as-is (hence the RFC tag on the cover letter... which, I now notice, lacks in the patches... sorry)


> 3. There are some typos. s/existant/existent.

Will fix those. Thanks!

> Looking at the original two issues, Yocto#6839 & Yocto#8222, I agree that the appropriate approach is to first create a QA check. However, I think this QA check should either:
> 1. only check for non-existent main package for the dev package (as the default value of -dev package is the main package)
> or
> 2. thoroughly check for non-existent packages across recipes (maybe by using pkgdata)

This is exactly the kind of discussion we need to have. Thanks!

I'm leaning towards "1." but still, I think, it should be generalized to any in-recipe RRECOMMENDS links.

Regards,
 
> Regards,
> Qi
> 
> 
> 
> On 2/24/23 07:29, Yoann Congal via lists.openembedded.org wrote:
>> This series is a work in progress on 2 related bugs :
>> * [YOCTO #6839] Handle dev package with no main package more gracefully
>> * [YOCTO #8222] Elide dependency from -dev package on main package if
>>    there are no shared libraries in it
>>
>> An empty package ${PN} is not generated by default. This has been a
>> problem most frequently seen because ${PN}-dev depends on it. This case
>> has been handled by :
>> * Using ALLOW_EMPTY:${PN} = "1" : forcing ${PN} to be created even
>>    empty.
>> * DEV_PKG_DEPENDENCY = "" : Implicitly removing the dependency on ${PN}
>> * And finally and globally making the ${PN}-dev -> ${PN} relation a
>>    RRECOMMENDS.
>>
>> 2 patches :
>> * insane: Add QA check for RRECOMMENDS on non-existent packages
>> * meta/recipes: Remove empty ${PN}/DEV_PKG_DEPENDENCY workaround
>>
>> First one create a QA check to try to detect the problematic situation.
>> The second removes workarounds setup to hide to problematic case.
>>
>> Together they will prominently show where the problematic cases are.
>> Next step will be to find a generic way to fix the case.
>>
>> Fawzi KHABER (2):
>>    insane: Add QA check for RRECOMMENDS on non-existent packages
>>    meta/recipes: Remove empty ${PN}/DEV_PKG_DEPENDENCY workarounds
>>
>>   meta/classes-global/insane.bbclass                    | 11 +++++++++++
>>   meta/recipes-connectivity/bind/bind_9.18.11.bb        |  1 -
>>   meta/recipes-core/musl/bsd-headers.bb                 |  1 -
>>   meta/recipes-core/musl/libssp-nonshared.bb            |  1 -
>>   meta/recipes-core/newlib/newlib_git.bb                |  3 ---
>>   meta/recipes-devtools/gcc/libgcc-common.inc           |  4 ----
>>   meta/recipes-devtools/python/python3_3.11.2.bb        |  1 -
>>   meta/recipes-graphics/mesa/libglu_9.0.2.bb            |  3 ---
>>   meta/recipes-graphics/mesa/mesa.inc                   |  3 ---
>>   .../recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb |  1 -
>>   meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb        |  1 -
>>   meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb  |  1 -
>>   meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb  |  3 +--
>>   meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb |  3 +--
>>   .../linux-libc-headers/linux-libc-headers.inc         |  1 -
>>   .../make-mod-scripts/make-mod-scripts_1.0.bb          |  1 -
>>   .../argp-standalone/argp-standalone_1.4.1.bb          |  1 -
>>   17 files changed, 13 insertions(+), 27 deletions(-)
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#177640): https://lists.openembedded.org/g/openembedded-core/message/177640
>> Mute This Topic: https://lists.openembedded.org/mt/97195657/3618072
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@windriver.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
> 

-- 
Yoann Congal
Smile ECS - Tech Expert

