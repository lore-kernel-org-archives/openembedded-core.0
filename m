Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web09.500.1605889948853367354
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 08:32:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FHa3F4aC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id u12so10704052wrt.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 08:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=yoRz2TiiHsSPRkvK47BitCoZ1lTeUCy1I+4ArOuSLSM=;
        b=FHa3F4aCWCAEvpyqLl7/RAQd8kEvGhOcDa0S+8yGIF3CpH0K2FzPIsEiiETvaj8Yey
         Z5PGYdSbwdg2Jhkv8DBmQ/jDaK1lR4WH8Zac1Xu2BtmCdu/dXN+IRI/5u7AeSflbrgkc
         Fr1UUuUpb2G5d+glLbR4tTICe+gqs4DrNFbRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=yoRz2TiiHsSPRkvK47BitCoZ1lTeUCy1I+4ArOuSLSM=;
        b=K9bSpgfjuufXQyhE/LVbENvSU3347WmfqQaKH9cptrZNxd52C4Z9W0vjf92ySAZAX3
         /Szi7GfY0q/T4rKkFxUEEOqK0LxmfKdrgQ9ds5gxGQz/6pIthaAgKI8QePQm5x65sE1U
         zxY105YyhyjzQ+3hw6DtCMALbBmlZVquvW+wD5byw8ORvP1GT9DK7rIVX7xd35sg2Gew
         rjB8kibVDMioVrJV7JaXL6qPJzh8HSdfK+UXccaK+cbvZS7aUlr5eem8FNoRjL9uVEi4
         QZqFfDGfDPkBfIiHlT0Gig6Msu56qYPmB+MW32CQawavlkOfmgN63xkdtW4WAyGVSWVD
         rM/Q==
X-Gm-Message-State: AOAM53210tSavjguYxF+IoXMSSulvgvTdgtCPuAtYtMlEAaOJGRbeRtu
	AHC1xHanlf2ZksXSgtnix3ZYkw==
X-Google-Smtp-Source: ABdhPJzHZfTFImng3UNOP0j/lwRf7fgenLhraFBZulmIM63Anej18Oq7NvoGaznyBmd8cog8y9iubA==
X-Received: by 2002:a5d:5001:: with SMTP id e1mr16788500wrt.20.1605889946246;
        Fri, 20 Nov 2020 08:32:26 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from c.8.b.3.0.6.d.4.9.0.2.b.0.0.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (c.8.b.3.0.6.d.4.9.0.2.b.0.0.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:6000:b209:4d60:3b8c])
        by smtp.gmail.com with ESMTPSA id e5sm6153891wra.80.2020.11.20.08.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 08:32:25 -0800 (PST)
Message-ID: <b47a68f4240998f40c6f5e4b4d5b5d882632da6e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] valgrind: helgrind: Intercept libc functions
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>, 
	openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>
Date: Fri, 20 Nov 2020 16:32:22 +0000
In-Reply-To: <20201119183151.16752-1-stacy.gaikovaia@windriver.com>
References: <20201119183151.16752-1-stacy.gaikovaia@windriver.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-11-19 at 10:31 -0800, Stacy Gaikovaia wrote:
> From: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
> 
> PTH_FUNC definition needs to be modified in order to
> intercept posix thread functions in both libc and libpthread.
> In order to handle this in helgrind, weak alias the pthread functions
> in glibc.
> This also prevents any need for a special case for musl, where
> these definitions aren't duplicated.
> 
> See https://bugs.kde.org/show_bug.cgi?id=428909 for additional
> discussion.
> 
> Signed-off-by: Paul Floyd <paulf@free.fr>
> Signed-off-by: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>

Unfortunately this failed on musl:

https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/2731
https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/2728

Cheers,

Richard

