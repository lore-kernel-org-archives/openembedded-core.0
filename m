Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3814AC61CE8
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 14:54:37 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.61806.1749480869108726485
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 07:54:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J6toEFD4;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-adb4e36904bso855544666b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 07:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749480867; x=1750085667; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LZlxQk4tDajUFPcIZBh8IgD2mBSiaQdzDDea6C7tXbQ=;
        b=J6toEFD4jikIfrTE9nF3MVWn4JxGA+c0xBHsUmPL0ggW8dAoVo1f3d7KOgJKAXCLZy
         8szD4F5o06Hu+acUiCnd1Qr2nQk6jDiKXEXxi21rCbHwOLKnCtnvowk5I7XvBCP62L08
         b9+Zz+aaV+tUVBdCg6t/9QxHeKywI6bRXA1LYBcT7DqKTDfbRiIyipBTFuPkSnSBXmMn
         QzAd4W4g0EOmL1+n5vo8i9+XtWi73nGEmqABETxjH6D2ibPWeyZNy3uIMpp8BItGa05Z
         6YvYgVGc3iDYiZyLpD3lkQ1XoxNxZcX+5qCz7PXlxIn4U/tLmE/6NKCsyB+1aEjztrdR
         PEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749480867; x=1750085667;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LZlxQk4tDajUFPcIZBh8IgD2mBSiaQdzDDea6C7tXbQ=;
        b=G5Lqh2Fpyl3Q4f1ryU6GI59+dhIXwUZlTpg/uLRjR+9YinGjnJ5DIS3IzqlD3JVBYY
         linmUi8kY9DMVOotZTOeheuHTK+NITvqH3+88FlrWldX/TjA6AI5hV9djURKVSmBWJIL
         h61SNISmsq8tiBIOSfC+84vE2yCpCyMB7S3n+bQd67KoZABVvKGD9Qmyd+BhuhS6G08r
         KWJO4c4S0h2rZEBM+KlL7ryjC34bySMp8jrIHbBtD5ymAp+TQm33mXdBuNsE7bWTXKVl
         mJVSQG6/SyPC2yFvlYrbmybbCbuFCNrBPw6ZjUJe9lP2f9l7Vr2danxtEACZiYQTTS+R
         RJ4A==
X-Forwarded-Encrypted: i=1; AJvYcCU4qblpdEpA36yaEweWnhgatMlStlbWdtH7FE2mIHVAif3bK6XCXAnoZ2XvwsEd5txW7t6j6k4MqIfSv7JmF9uctQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxIUxJ8Y7dOJTqo6LMwVqK99QzhYJkGjiu1URB0AcwSxgjEvKqd
	V4uFysKk6IoPmXFo9QIA/STRWAJ8E5sGkh0O0grcasnmPIR3RrTXHIZo
X-Gm-Gg: ASbGncuTPC5RVis2iQnNUsJLi8/1A6Rx32HqJd7+CkRG8DGamQSAGMm8ZUqdztUAeSf
	9NkwSYnTK6FiBW+rVvFDX9k1mi2dpyc3FKzZdErEBhLfoIpINqvWOapSF9MG5keXr1lD6JIXiSc
	V81vNdJx3t13qWH1dDE7fjLQXV/xicwNeFslMabyQ5tO/gKJc4YbgjXoWgOQw25ENqwiMwilV3v
	8DPSKPJ/R1rMVHyGrNJVj/8hev5+lW1mE0s7GtLaCeB9LsKzYsgWC6nk+C8jgoEQxuf1RoUn1xc
	Gq7WQnrTr+0eNjOFp7o/b7B5EShM/Y8RmaruU+MsEPaYF8fVU+wNP07zKzlT1HI5z+Hkag==
X-Google-Smtp-Source: AGHT+IF6gkPKa4Vzhsj29Z12hCREx+EZqaGvaRvV2dGijuYB1hZr9nyizQQOw+2Zbr4ZRcoscRsWIg==
X-Received: by 2002:a17:907:2d92:b0:ad8:9ff4:c047 with SMTP id a640c23a62f3a-ade1a922afbmr1186526366b.35.1749480867207;
        Mon, 09 Jun 2025 07:54:27 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1db55f3dsm565818966b.60.2025.06.09.07.54.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 07:54:26 -0700 (PDT)
Message-ID: <1e0a1d94-75a2-41f2-b31c-115a6dc3485c@gmail.com>
Date: Mon, 9 Jun 2025 16:54:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] meta/meta-selftest: add selftest-hello-mod
 recipe
To: dixitparmar19@gmail.com, openembedded-core@lists.openembedded.org
References: <20250609134119.11666-1-dixitparmar19@gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250609134119.11666-1-dixitparmar19@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 14:54:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218295

On 6/9/25 15:41, Dixit Parmar via lists.openembedded.org wrote:
> <snip>
> --- /dev/null
> +++ b/meta-selftest/recipes-test/selftest-hello-mod/files/hello-mod/hello.c
> @@ -0,0 +1,24 @@
> +/******************************************************************************
> + *
> + *   Copyright (C) 2011  Intel Corporation. All rights reserved.
> + *
> + *   SPDX-License-Identifier: GPL-2.0-only
> + *
> + *****************************************************************************/
<snip>
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
>

One note: the recipe says MIT license, but the source claims to be
GPL-2.0-only

