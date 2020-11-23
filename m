Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web08.40552.1606159045125947272
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2020 11:17:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FGkMfeXw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id 23so19674929wrc.8
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2020 11:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=xiN/UIyV4eqd+SmQM+rh/LfNhPHw6xXpksfgJDj96LM=;
        b=FGkMfeXwLmOg83HlTDaVrxrqJu6ZADMp7Zn9VaQGAdyT7RkTdEAzJAhacmYUM4/Vu7
         J4l5r8p+DkBYLOGzmW+efosdHJDZWLQZuy0/jOa6zNfdfgnr/M/IxEIxjxNTtWLMq50E
         OD3YtH4sLivHXy22pxigd408C09EWPecM/tMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=xiN/UIyV4eqd+SmQM+rh/LfNhPHw6xXpksfgJDj96LM=;
        b=FJCmNZz0IrvT8VfuDOC5fgwMl0vG+nQsVZh/ob9ZgdfTnUU2/zdvUHLJGAptnPHoWI
         m03JB1MHax+QwKlb5thOz00ueiBlNqVrUCXlxSfhNqgJH+dQis3YbMYzzuJXK03Z7ZjP
         OD66OdxEs5wjnxccebE4gWuCHeoMSG90o/g70U70UluJbYaUBPoTu5M4k1UETgM4ZfAo
         gUTNFq9LIBoIAZO7UNNkio1sajcURAZswfilzujFrT7oxrsA9IcNdP7cxo9M8Cv56YS7
         8S6k6w+I0qZypyk/97FDqt3RW3pxaWZy/hz9SP6FsevuTEAUtGgVK6ivsoUJWRzdkQnD
         ZUhQ==
X-Gm-Message-State: AOAM530d3ssXX7CxVnMUg0FzSlknZs70O0RqWH018LKEyqQRTHYTro1b
	Ftrb16H9YfxH8610f5kMerUfaQ==
X-Google-Smtp-Source: ABdhPJw3l5sdz+LenB/7+bw8x0CkADOb/WY3APUHiW8ejUW6Oue0APXvHnLsroQcWoN4eP3B+gnBuw==
X-Received: by 2002:adf:e60e:: with SMTP id p14mr1264965wrm.188.1606159043723;
        Mon, 23 Nov 2020 11:17:23 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from c.8.b.3.0.6.d.4.9.0.2.b.0.0.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (c.8.b.3.0.6.d.4.9.0.2.b.0.0.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:6000:b209:4d60:3b8c])
        by smtp.gmail.com with ESMTPSA id b145sm533508wmd.0.2020.11.23.11.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 11:17:22 -0800 (PST)
Message-ID: <96f00422db0f45f642f33828d7cb21e85db81ab6.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v2 1/2] bitbake.conf: Split optimization into common part
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andrej Valek <andrej.valek@siemens.com>, 
	openembedded-core@lists.openembedded.org
Cc: Pascal Bach <pascal.bach@siemens.com>, Adrian Freihofer
	 <adrian.freihofer@siemens.com>
Date: Mon, 23 Nov 2020 19:17:20 +0000
In-Reply-To: <20201123190029.13811-1-andrej.valek@siemens.com>
References: <20201122124853.30262-1-andrej.valek@siemens.com>
	 <20201123190029.13811-1-andrej.valek@siemens.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-11-23 at 20:00 +0100, Andrej Valek wrote:
> This option allows correctly handle the release/debug flags
> separation in
> upper recipe like cmake. Adopt SELECTED_OPTIMIZATION usage in other
> recipes.
> 
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  meta/conf/bitbake.conf                            | 7 ++++---
>  meta/conf/distro/include/security_flags.inc       | 8 ++++----
>  meta/conf/local.conf.sample.extended              | 1 +
>  meta/recipes-devtools/valgrind/valgrind_3.16.1.bb | 1 +
>  4 files changed, 10 insertions(+), 7 deletions(-)

This, or the cmake change that follows seemed to cause:

https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/2738
https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/2718
https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/1129

and maybe

https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/956

Cheers,

Richard

