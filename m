Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9FD2C77B7D
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 16:15:40 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.54612.1684340139058300089
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 09:15:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=A5GRoDqv;
 spf=pass (domain: baylibre.com, ip: 209.85.219.52, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-623852980dfso4692686d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 09:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684340138; x=1686932138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WNBK6TL7HL95B2yOFzT1017do+c1L9JEUKkGpVbH+dM=;
        b=A5GRoDqvwge6lw/8q2QCItxExYPbfE+8m7cXzhFHXhYcmKpbT0BoG5dtly4aeub88Y
         fmGmQ50vo7G211LkjaH0JBeFuxlQ3nAujQfwNVYG1+w6j59t5gAz1/ntdR2pAW7UtI6g
         cpMAqq5z3I3fd54l+wcQC1wHq6gJWSUaxIjZx0IoC3ORz8JkP1MrouHAwnrBwnT6s8dC
         mHpFNtxCD8WAk0WEKxJEjCgM7ImW0r2yhyxMJW0YMtDM1H3YYeuRe8EcG8CjTNSAfyQb
         atwy6r0Zc08EuWJApbCnL/tuHkM8AYw+uAEzOIZmJu5QEvuaQQMmebf1tklPr5LH1ibv
         1xrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684340138; x=1686932138;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WNBK6TL7HL95B2yOFzT1017do+c1L9JEUKkGpVbH+dM=;
        b=JcexZHdITYpKsONA5AT2l1BPqgtFGPpxwDN3j4Z8KOJpjR9biu4KTX2ZOYL4Vct0Ec
         2H3BhJcyAmdtxS22IoJENjxHKeQrp0YXoGa1bNams5/3LQfLVuMOYhoPU7HD4NnNLu62
         JTa15uT51Rij3Tie/4mkIg/vvDglZ5q217zKB2GZ3yjUWKAooCvo4D6Jw94VT5oIJ0Qv
         hAAIi5pTviUxNjMnljtCxA1NbpGYZqGseiVFJBDdF5Qk/8sVsQucfNFWICX2TeF1XCMN
         IphAtD9NUkSfN6GcQvCN82sa6jLDpXGtW1io827CJARI9L8XBW8DHPjBiSpVwBdpopWn
         XLZw==
X-Gm-Message-State: AC+VfDwMCryActEzPdRhgD/FvO5v+uSD/xL1HflgEb3SNbrSrMtt3tHS
	W/3hA4zCj9nrm+Re/IgdOHwyNg==
X-Google-Smtp-Source: ACHHUZ7JUwVeyU1w7fco57l+vsZz3g1rXROtMMJdFz/n84unfQZ1Iwc8Mnnn2I+BzzUsxqNf2vMJmQ==
X-Received: by 2002:a05:6214:2462:b0:61f:1a72:6c7d with SMTP id im2-20020a056214246200b0061f1a726c7dmr335219qvb.27.1684340137482;
        Wed, 17 May 2023 09:15:37 -0700 (PDT)
Received: from [192.168.0.195] (cpe64777de11593-cm64777de11590.cpe.net.cable.rogers.com. [174.115.224.47])
        by smtp.gmail.com with ESMTPSA id m16-20020ad45050000000b0061b62c15351sm743233qvq.90.2023.05.17.09.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 09:15:37 -0700 (PDT)
Message-ID: <b021da3e-d485-64db-a5b7-67e2cd4df372@baylibre.com>
Date: Wed, 17 May 2023 12:15:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core][PATCH 01/20] python3-async: add missing run-time
 dependencies
To: Bartosz Golaszewski <brgl@bgdev.pl>, Khem Raj <raj.khem@gmail.com>,
 Bruce Ashfield <bruce.ashfield@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230517080639.9336-1-brgl@bgdev.pl>
 <20230517080639.9336-2-brgl@bgdev.pl>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20230517080639.9336-2-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 16:15:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181494


On 2023-05-17 04:06, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Add missing RDEPENDS for this package.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   meta/recipes-devtools/python/python-async.inc | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/python/python-async.inc b/meta/recipes-devtools/python/python-async.inc
> index fde864601c..53f8d79361 100644
> --- a/meta/recipes-devtools/python/python-async.inc
> +++ b/meta/recipes-devtools/python/python-async.inc
> @@ -9,6 +9,9 @@ inherit pypi
>   SRC_URI[md5sum] = "9b06b5997de2154f3bc0273f80bcef6b"
>   SRC_URI[sha256sum] = "ac6894d876e45878faae493b0cf61d0e28ec417334448ac0a6ea2229d8343051"
>   
> -RDEPENDS:${PN} += "${PYTHON_PN}-threading"
> +RDEPENDS:${PN} += " \
> +    python3-logging \
> +    python3-threading \
> +"
>   
>   BBCLASSEXTEND = "native nativesdk"

This is an OK change, but the recipe should arguably be removed from 
oe-core instead, given that it 1) hasn't been updated in 9 years and has 
been abandoned in favor of alternatives by the maintainer, and 2) 
doesn't appear to be a dependency for anything else in oe-core or 
meta-openembedded.

- Trevor

>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181450): https://lists.openembedded.org/g/openembedded-core/message/181450
> Mute This Topic: https://lists.openembedded.org/mt/98943997/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

