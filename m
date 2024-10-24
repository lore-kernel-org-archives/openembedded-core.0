Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 867DACE8E70
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 12:48:47 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.13763.1729774117473095072
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 05:48:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=rvyUhrOM;
 spf=pass (domain: baylibre.com, ip: 209.85.219.49, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6cbf0769512so5658386d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 05:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729774116; x=1730378916; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a1AmGGlmYrtCPfcymFzP8QLOb9daJtikYYRfaZw4Lps=;
        b=rvyUhrOMrr/gzVabIyLy21IX9bVh9fHeZvFuXt3gbFrCb4zTNE3r5w5LG89E4pMC5w
         QZRFW3nUt9fBchqEn4XMqfsrAp7ld0cds48ZnM/DGV4iKPFK+U9JuSztGu+ZMNchbnMr
         uWA+vaLRkKRHfpaX2sW1Xodbk38ItAG7Lam1KE/2L4WjCEtxNM8gyAg6lo3QGXJo4HoZ
         cUqks7wh8cdcOuGI9Svkvs7JdGNuietBLzEvD6IbqimRETd61RtTm3wW9U44tVpL0r6L
         PianuZI/fvEualZXemmjMnbeXJj6jysaRDbGaHH9DwO7zz78CKIX7b4XJLxadD7GIFS1
         Qbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729774116; x=1730378916;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a1AmGGlmYrtCPfcymFzP8QLOb9daJtikYYRfaZw4Lps=;
        b=M0eh/kwFdcht1lwonJETmUiNVGwlUBw2jA9pi00aXrTFinjCl2GFuD7D2/MiddBLCP
         U1w46QSNzd9Am+QUedz70fr36xIzQirWeaS1skuKrrTpBDz+ItfBNumNbDjOe60BQJ2S
         t/hOs8aMFm5bs2pevrmEI8668xWAL4l1/z88dVyHUD7YxBKOPBXcPf82bi0fu+079lnZ
         53LrVG/289utJDjb4EC8Y8+q/b4cxLaeDRBmzMqFljG/K1z13TqGJwDuEUp9f5HpAXqw
         HLCpiSB4k+b+WsH4xMi8bQAHTVIHVYFM8JmswFn7FPzyv5HTKohWLkDVFVW/ka9hmIuj
         +iGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQn+ghX4kj0FlLp4co0KFs8L7ThStY6+AoCgGUPtGOSqE/C1hi7LRfqPI8akhsKtVPSfSCqWC5MiF4fcR9vpG/dw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz9gfcXvbCEq5n8Lqx3rfiyZE2jGHE3kisSmuh+ygllDFrp5eeY
	QLCpccb2bYXg4qwzLCoRDOkoTLIaxKs4o97kjFIR2sPZdRrLmHx5aZh86dJGFDjXYk2luKdYYG8
	+
X-Google-Smtp-Source: AGHT+IFLqjMn99n/tIbO/YylM9mpGqoLZMggjr3Lw5asdboi8pXLLPXdWxZt2aS0p3zWQJVe4gBZow==
X-Received: by 2002:a05:6214:5d04:b0:6cb:e770:f505 with SMTP id 6a1803df08f44-6ce3430f02cmr73305776d6.50.1729774115543;
        Thu, 24 Oct 2024 05:48:35 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ce00a01354sm49049386d6.140.2024.10.24.05.48.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 05:48:35 -0700 (PDT)
Message-ID: <e6713433-e01a-4065-b9f2-0be0d0ac9cf4@baylibre.com>
Date: Thu, 24 Oct 2024 08:48:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 4/4 v2] python3-dtc: upgrade 1.7.0 -> 1.7.1
To: Ross Burton <Ross.Burton@arm.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20240924150001.2586819-1-tgamblin@baylibre.com>
 <20240924150001.2586819-4-tgamblin@baylibre.com>
 <5E176A0E-4995-428E-AF5A-F625EF7A2000@arm.com>
 <457AF752-98B2-4032-8720-DD0EA976DFF8@arm.com>
 <17F8CB639310258B.14701@lists.openembedded.org>
 <86d505f3-e6e7-4c30-85f6-2f12848e3dce@baylibre.com>
 <Zxnvl_Ghdbxjz-R6@bootlin-mathieu>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <Zxnvl_Ghdbxjz-R6@bootlin-mathieu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 12:48:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206294


On 2024-10-24 02:56, Mathieu Dubois-Briand wrote:
> On Mon, Oct 21, 2024 at 03:04:21PM -0400, Trevor Gamblin wrote:
>> On 2024-09-26 08:34, Trevor Gamblin via lists.openembedded.org wrote:
>>> On 2024-09-26 07:51, Ross Burton wrote:
>>>> I suspect the problem is the rebase of the symbol visibility patch
>>>> went wrong?
>>> Possibly. I'll take another look.
>> I came back to this today. Looks like there was an update to lopper in
>> meta-virt on September 30th. I can't reproduce this failure with MACHINE =
>> "qemuarm64" and building either lopper or lopper-native. I do, however, run
>> into a do_rootfs dnf error that I'm assuming is a problem with me forgetting
>> something for meta-virt:
>>
>> |No match for argument: kernel-module-xen-blkback
>> |No match for argument: kernel-module-xen-gntalloc
>> |No match for argument: kernel-module-xen-gntdev
>> |No match for argument: kernel-module-xen-netback
>> |No match for argument: kernel-module-xen-wdt
>> |Error: Unable to find a match: kernel-module-xen-blkback
>> kernel-module-xen-gntalloc kernel-module-xen-gntdev
>> kernel-module-xen-netback kernel-module-xen-wdt
>>
>> Could this patch be re-tested (assuming that error isn't hiding the issue)?
> Hi Trevor,
>
> Sorry, I retested your patch, and it seems the issue is still there:
>
> https://valkyrie.yoctoproject.org/#/builders/89/builds/274/steps/16/logs/stdio
Alright. I'll keep trying to reproduce. It's odd that I can't hit these 
issues on my end.
>
> | [WARNING]: cant load yaml, disabling support: No module named 'ruamel'
> | Traceback (most recent call last):
> |   File
> "/srv/pokybuild/yocto-worker/meta-virt/build/build/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0/recipe-sysroot-native/usr/lib/python3.12/site-packages/lopper/fdt.py",
> line 39, in <module>
> |     import libfdt
> |   File
> "/srv/pokybuild/yocto-worker/meta-virt/build/build/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0/recipe-sysroot-native/usr/lib/python3.12/site-packages/libfdt.py",
> line 12, in <module>
> |     import _libfdt
> | ImportError:
> /srv/pokybuild/yocto-worker/meta-virt/build/build/tmp/work/qemuarm64-poky-linux/xen-image-minimal/1.0/recipe-sysroot-native/usr/lib/python3.12/site-packages/_libfdt.cpython-312-x86_64-linux-gnu.so:
> undefined symbol: fdt_get_symbol
> |
>

