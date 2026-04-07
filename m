Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E2B2FEEF4A
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 13:54:00 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81909.1775570034926427998
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 06:53:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VLGInrBj;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4887ca8e529so37412685e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 06:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775570033; x=1776174833; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2mAZyGaMVAA+cXzmtigSt+5P2gl0PlSPg3ntgrtdGN4=;
        b=VLGInrBj+RY48pCGDIcsnPdSj3a1A5SCX6NguKFz14hANN0dP/d20Tt5QQqmxjX3hY
         M1Fz5wZHacN3A2x2JqMDNSWuR3aUxNu8HFpFwMVV3ErV7MVhp6aYAThqQdZlGMO8ZhHE
         FASr3xiheeF4Wqd3AgIMttDAmxXTsstNA095lB8wqojeqw4Qj7AOqJQaHX3dT9LEx3jJ
         P9/3bgvt3WAFSeLGPueAstMlwn21cDwUMr2wJkJnYTnbh3KmV8LCKDY6FoK/JIBLZnSw
         K+LYDGiSsygd13KGGjTz1BlOtMPDXjaE+CwCa0IQfuZgKcP/OoitG/kYq2WUpoyLckaF
         xy8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775570033; x=1776174833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2mAZyGaMVAA+cXzmtigSt+5P2gl0PlSPg3ntgrtdGN4=;
        b=GiE5LAHrk7ODarnIlsBd3KVaWWHYRryXBjgsaGqzTmphY97AXE4kqiNOStxhjd7PS9
         T4v6aXJ1nzTfJMvhLr3XkUctmYlEaFoAzwQPz2DdMJO7mtXSlJfJRYKcXFzcpKP3lZep
         0o+V5ichbrU8c8nLgU8x0M7PRRdS3Yn/XZ0SIo6yhurdn6p+lu5QNwi+Y3oJPPhKHL5n
         jnKH5AQWWScnbqgdIxJg2R7vxdg5HOW/O6H/Qa20sFVewE6xQIg9PJb8Aj8wT503wnXg
         OpdnRbexleKurp+gf/crVGOLaZgjrxBKVg0fn26qsottVoWYH25nJdDKPpTSd3dQjjjB
         ty4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWOTy5j+13S9BwsHRB5K4ZTEijwW6Gz96nHFe38BPY/AVNnbuuACFCPdg/zQuYYTP0PYcIVhZYVadFTs3tjkI7L9w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyBuKvQQueMobTWzjvENJM4yNJDtxatv28lhQ641ie9tr4UrPAn
	qBkVUA8FftdYhKyl4/gTIzEcYQwaKN46kQfP8UlRMSvmzmT2rdLXiPzJ
X-Gm-Gg: AeBDiesMF9V/XnFc+ZCFCHXSBUCeKv9fV9mzQWFHyhNTYvPtDc66Lxl+LMflEFEaMey
	L621bNRRqBcVEuRdhhfMURjIqmGXzg6nWeJPUoxJi9AEQ9kY2zhzv6/hu7NEYvka+NvuxNIvmRw
	YIyHMD9pr6xJ5eHmVwLf5bsupi/84lr/zsQDQNG7psGkQoIcXy1GAKQkmmzLumzVWZ40RTNsowW
	LXhzRN0ZO6wwODpIjMG51kXVWJtAr5XD4+pFZGAVPR9Q70CTXWhJ9W6OupmttlvY7Nb71F8ndyo
	ignHmjTy7tBUTiYhgXj6+oCa+QixAJRzDVnACZaNfMzL6vxQpwrxzhw8tAJePXscNFw+OHTeXfL
	xI8y1KUHfrsfzFvOXsjR+O4PEqRr6T+sZLRzYYYvf9sRJPv/UUH70im7ETGR6AChzdBBJfdMjnu
	XRgowqTCPz1rLod+P6bD2yFhc1V/mX0w6r3bhy3J8YIDcIl1EAU7n0+VjV1xujMo7K
X-Received: by 2002:a05:600c:45cf:b0:477:9890:9ab8 with SMTP id 5b1f17b1804b1-4889945f8c3mr201669995e9.3.1775570033056;
        Tue, 07 Apr 2026 06:53:53 -0700 (PDT)
Received: from [192.168.2.122] (95C81E23.dsl.pool.telekom.hu. [149.200.30.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a4b2e111sm291870475e9.1.2026.04.07.06.53.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 06:53:52 -0700 (PDT)
Message-ID: <7e6015d3-bb8c-4267-a7b1-2d79091f108d@gmail.com>
Date: Tue, 7 Apr 2026 15:53:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [bitbake-devel] End of whinlatter stable support
To: yoann.congal@smile.fr, martin.jansa@gmail.com
Cc: Yocto ML <yocto@lists.yoctoproject.org>,
 OE-core ML <openembedded-core@lists.openembedded.org>,
 bitbake ML <bitbake-devel@lists.openembedded.org>
References: <DHJDUJSPA7LG.3IKCP2QUJBMRL@smile.fr>
 <CA+chaQdp8E_HMyo6Qx6C+PuRrLbrqgbFdQF_WdbZS1ONncxb3w@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CA+chaQdp8E_HMyo6Qx6C+PuRrLbrqgbFdQF_WdbZS1ONncxb3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 13:54:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234739

2026. 04. 03. 11:14 keltezéssel, Martin Jansa via lists.openembedded.org írta:
> On Fri, Apr 3, 2026 at 10:46 AM Yoann Congal via
> lists.openembedded.org <yoann.congal=smile.fr@lists.openembedded.org>
> wrote:
>> Hello everyone,
>>
>> As you may have noticed, the end-of-life date of whinlatter (2.16 for
>> bitbake) is near.
>> The last release of whinlatter will be the 5.3.4 and will be built in
>> the week of the 20th of april 2026 for a release the week of the 6th of may.
>>
>> If you have patches that you want to see merged in this last version,
>> please send them before the 10th (next week) so we get enough time for
>> review and testing.
> I would like to see my glibc-2.43 compatibility changes I've sent last
> week merged.
>
> I've tested it on 26.04 in docker, if it doesn't show any issue on
> other hosts used by AB, then what's the harm of merging them to
> whinlatter and scarthgap?

That series is indeed needed for whinlatter in my testing on
Fedora 44 (post-beta, practically final), plus the other series
I just sent that fixes binutils-native and gcc-cross.

Unfurtunately, pseudo would need another fix to work on
Fedora 44 as is, see my mail at
https://lists.openembedded.org/g/openembedded-core/message/234730

For now, I can't build neither whinlatter, nor current master
on Fedora 44 due to the pseudo issue.

> Even after whinlatter gets EOL someone might use latest ubuntu release
> on host and then try to compare his wrynose build (where 26.04 works
> fine) with whinlatter build (which fails immediately without these
> changes). I often use EOL OE releases when trying to "bisect" what
> changed in upstream layers e.g. between scarthgap and wrynose.
>
> Cheers,
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#234574): https://lists.openembedded.org/g/openembedded-core/message/234574
> Mute This Topic: https://lists.openembedded.org/mt/118647081/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


