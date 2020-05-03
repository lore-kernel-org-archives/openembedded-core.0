Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.19158.1588494084223307320
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 01:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gq7aQIOx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id g13so17091049wrb.8
        for <openembedded-core@lists.openembedded.org>; Sun, 03 May 2020 01:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=WK50fX5qR6I4Oa/iaKnR2sAdsIRtOdI9WHzCGs0E8Jk=;
        b=gq7aQIOxNXVigd+4XgkQq8OUBMFLiVF3xsmruf3Soa4FpKZQ+pqqUQMlATMQ+4kICj
         V5CI7AUaUmWvnhk0+OuS4U0dQ1EJ2YNIKe1ZDS73ANK7ECAvsGBGKZWRiO0B8Dfd5OaP
         D5fFlLiKTXh7EGB9veeA1Ct15MlnQY8hdh6Lo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=WK50fX5qR6I4Oa/iaKnR2sAdsIRtOdI9WHzCGs0E8Jk=;
        b=gJhMokV8TG+ZY/jZbuQiUtyXwEbdnmWlcKpPGCJD8TnvMFFYa2ipAKgYhKmcNLqnWC
         P/PzhLJU0LAdHKWkI2OVID4dX8uLocKdySzX9ByCSfoPybs5H4Xj9trzLcATtrPVYojU
         OeUKwMUulzNTKKA7jnG6SuZ0OlQMB64R81lmTiJlmvI1P+pkrLILLILH6qv8T5UQYTQq
         NdkfHeAA/dYYPel7lXyihi08NokOMd86PSRu/gg7mvpfMLWnCE/iuDS1VG9nXmYFkk6b
         qlGWv2u9pM9Vb220QL5UBoDEd/76CmJoibFBLC3M2CXwKCCsJA8vegz8o4D+omR9VIxt
         TAIw==
X-Gm-Message-State: AGi0PuaJqQDQ46S3PH/8yWZwW9aVLzVx2dhHIt6AUn6cnZnDTvJIgqoB
	HqmQMxlTpXl/Hk54HciqiHyllkcw1gc=
X-Google-Smtp-Source: APiQypL0/fQBKOa7/gp0I6vcXr7ny+FZmy0p4NI/LklYkS8iWSc7LwKlGsM8wcEuMUhyO+bFHP1DpQ==
X-Received: by 2002:adf:fe87:: with SMTP id l7mr13933757wrr.360.1588494082165;
        Sun, 03 May 2020 01:21:22 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id w11sm7459492wmi.32.2020.05.03.01.21.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 01:21:21 -0700 (PDT)
Message-ID: <24fa564f2ed31f3285051048de648f6cb6bf75e0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] lib/oe/package_manager: update default rpm config %_prefer_color
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 03 May 2020 09:21:20 +0100
In-Reply-To: <1588219837-337689-1-git-send-email-changqing.li@windriver.com>
References: <1588219837-337689-1-git-send-email-changqing.li@windriver.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-04-30 at 12:10 +0800, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
> 
> * %_prefer_color is used by rpm to determine which color's ELF file
> is preferred to be installed.
> 
> Here are file colors:
> 0 is unknown or other
> 1 is Elf32
> 2 is Elf64
> 3 is (contains) both
> 
> if default value set to 7, both 32 and 64 bits's ELF will be
> installed,
> in this condition, when we have 64bits python3 installed first,
> then install lib32-python3 later, 64bits python3 will be overwrited,
> 
> file /usr/bin/python3 will be 32bits ELF
> and sys.path will point to /usr/lib, not /usr/lib64, this may cause
> some python3 modules not work. so fixed by remove setting of default
> value 7, and use default value 2 of rpm.
> 
> * other distro like fedora also use the default %_prefer_color 2
> 
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta/lib/oe/package_manager.py | 2 --
>  1 file changed, 2 deletions(-)

This causes a failure on the autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/1867

Cheers,

Richard

