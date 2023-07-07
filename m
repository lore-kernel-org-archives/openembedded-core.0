Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2735FC0015E
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 13:47:30 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web11.12875.1688737649600594600
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jul 2023 06:47:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=CWHBUITz;
 spf=pass (domain: baylibre.com, ip: 209.85.219.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-bcb6dbc477eso1927112276.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Jul 2023 06:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688737649; x=1691329649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tRsQWXRAWFzJsuzJHTkvP/ifrNJgMy5E0l/9dmNcZDI=;
        b=CWHBUITzEIwrpx8f2Z1CHlVtL8nh4Tkdc1h2DhH9lDE5JJNUvNW1HSNvvnh4njqnif
         45itGA34yCGZA3T4VRhInN/LDRgId7NxP8MxkE7UG40EqkrPZnc6ya2sA67GtWP7XINg
         B0wpeLezn0e38RGrsbW/qV3s/RdO+g+SQ2Zs4YlqMaDQOmbiU/Mq2DRSiOuvMjDUtrK7
         EHQbx5froWkH+0JhXkDL/lWivVlJ88LAMFs49yE1xCcC8h282nojI3sSP2Wj4vb64n8B
         JWgBrsxjdqbw+6ClVxPyRU9fhNCTiN4IXarMFWQ/CORCpujrDVfg4sGpfzdFi3++xtQA
         oGOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688737649; x=1691329649;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tRsQWXRAWFzJsuzJHTkvP/ifrNJgMy5E0l/9dmNcZDI=;
        b=HDviHyODD2I/Gq8WmD6NzIPE5SkIM3oAMI4vDXG2WUiavxlBdoaATqk/dMyFij4/e/
         pyqvwyO5oR9tqt6ELieoibCV9aP2LDu/U7RJ7Rir4kznDcnwdc1WR6V+DAsw1e4oWQiQ
         /MWHJhwyDQCTkRAfzUKY54NiMNnWLVSoJDLrc64Ao9YMs2x9Mk3NQcVOolK7SQtgB1ob
         7d8yChe/ZjqmNGCwHIIbBYRfduyRKOs6reS3JXJks9+LGdobLoRczPtOqh4F6VL9fc2P
         z697Cj3L/fElRHo5ylwDygpU94mQhdxk6Mipv960tQSZjEjtW8ASrBdSWP+60BUvhYT9
         lYoQ==
X-Gm-Message-State: ABy/qLawQ6OfVyCNZ9QhVwhDFcqXIvB7+O2xgVG7tKqLWsfGMtf87Emf
	DmnnStnqBzn+J3B2l94kVD+3rw==
X-Google-Smtp-Source: APBJJlHr2aVpkZ222FHS0gcwTi2vbmLC62bJvF1IFTNvAdNFuEkZklmHy98DLjaZVj40itdorGpI1A==
X-Received: by 2002:a25:c484:0:b0:bca:bc83:d315 with SMTP id u126-20020a25c484000000b00bcabc83d315mr4066287ybf.48.1688737648740;
        Fri, 07 Jul 2023 06:47:28 -0700 (PDT)
Received: from ?IPV6:2001:1970:5b1f:ab00:d875:6297:4e81:e577? ([2001:1970:5b1f:ab00:d875:6297:4e81:e577])
        by smtp.gmail.com with ESMTPSA id v26-20020a0ca79a000000b00635e822b1a6sm2119691qva.35.2023.07.07.06.47.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 06:47:28 -0700 (PDT)
Message-ID: <14a271b2-4b34-68c2-dbd0-d5c68595e4f2@baylibre.com>
Date: Fri, 7 Jul 2023 09:47:27 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [OE-core] [PATCH] python3: rework ptest handling
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20230707132649.3841870-1-alex@linutronix.de>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20230707132649.3841870-1-alex@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jul 2023 13:47:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184012


On 2023-07-07 09:26, Alexander Kanavin wrote:
> There are several issues handled here:
>
> - a number of tests were failing due to missing dependencies, which
> are added (thanks Trevor Gamblin for identifying the fixes)
>
> - worse, these failures were not reported due to a combination
> of regressed sed processing that relies on brittle, unstable verbose
> output of python's test module, and shell pipeline obscuring a non-zero
> exit code from python itself. This is changed to a direct handling
> of python's exit code into a single PASS or FAIL, and changing full verbosity (-v)
> into verbose output only for items that did fail (-W).
>
> - bonus improvement: python can run its tests in parallel, so take advantage
> of that, and indeed that makes a complete ptest run four times faster (just over
> five minutes). There's also extra memory required for that.
Thanks Alex. This is a huge improvement on the run time!
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>   meta/recipes-core/images/core-image-ptest.bb   | 1 +
>   meta/recipes-devtools/python/python3/run-ptest | 2 +-
>   meta/recipes-devtools/python/python3_3.11.4.bb | 2 +-
>   3 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
> index 90c26641ba3..563fdb4731f 100644
> --- a/meta/recipes-core/images/core-image-ptest.bb
> +++ b/meta/recipes-core/images/core-image-ptest.bb
> @@ -25,6 +25,7 @@ IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-lttng-tools = "1524288"
>   # ptests need more memory than standard to avoid the OOM killer
>   QB_MEM = "-m 1024"
>   QB_MEM:virtclass-mcextend-lttng-tools = "-m 4096"
> +QB_MEM:virtclass-mcextend-python3 = "-m 2048"
>   QB_MEM:virtclass-mcextend-python3-cryptography = "-m 4096"
>   
>   TEST_SUITES = "ping ssh parselogs ptest"
> diff --git a/meta/recipes-devtools/python/python3/run-ptest b/meta/recipes-devtools/python/python3/run-ptest
> index 05396e91abb..4271a7c94ea 100644
> --- a/meta/recipes-devtools/python/python3/run-ptest
> +++ b/meta/recipes-devtools/python/python3/run-ptest
> @@ -1,3 +1,3 @@
>   #!/bin/sh
>   
> -SETUPTOOLS_USE_DISTUTILS=nonlocal python3 -m test -v | sed -u -e '/\.\.\. ok/ s/^/PASS: /g' -r -e '/\.\.\. (ERROR|FAIL)/ s/^/FAIL: /g' -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
> +SETUPTOOLS_USE_DISTUTILS=nonlocal python3 -m test -W -j 4 && echo "PASS: python3" || echo "FAIL: python3"
> diff --git a/meta/recipes-devtools/python/python3_3.11.4.bb b/meta/recipes-devtools/python/python3_3.11.4.bb
> index 6b074c48cf2..bc03986e175 100644
> --- a/meta/recipes-devtools/python/python3_3.11.4.bb
> +++ b/meta/recipes-devtools/python/python3_3.11.4.bb
> @@ -426,7 +426,7 @@ FILES:${PN}-man = "${datadir}/man"
>   # See https://bugs.python.org/issue18748 and https://bugs.python.org/issue37395
>   RDEPENDS:libpython3:append:libc-glibc = " libgcc"
>   RDEPENDS:${PN}-ctypes:append:libc-glibc = " ${MLPREFIX}ldconfig"
> -RDEPENDS:${PN}-ptest = "${PN}-modules ${PN}-tests ${PN}-dev unzip bzip2 libgcc tzdata coreutils sed"
> +RDEPENDS:${PN}-ptest = "${PN}-modules ${PN}-tests ${PN}-dev ${PN}-cgitb ${PN}-zipapp unzip bzip2 libgcc tzdata coreutils sed gcc g++ binutils"
>   RDEPENDS:${PN}-ptest:append:libc-glibc = " locale-base-fr-fr locale-base-en-us locale-base-tr-tr locale-base-de-de"
>   RDEPENDS:${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', '${MLPREFIX}tk ${MLPREFIX}tk-lib', '', d)}"
>   RDEPENDS:${PN}-idle += "${@bb.utils.contains('PACKAGECONFIG', 'tk', '${PN}-tkinter ${MLPREFIX}tcl', '', d)}"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184011): https://lists.openembedded.org/g/openembedded-core/message/184011
> Mute This Topic: https://lists.openembedded.org/mt/100005852/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

