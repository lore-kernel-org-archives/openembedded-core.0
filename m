Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web12.15463.1607615571356651594
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Dec 2020 07:52:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a1fmnOfF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id t16so5985248wra.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Dec 2020 07:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=I5PxdE7Au2TyJARSCmHgUkc//1v95bGXI9XFQhA5WEs=;
        b=a1fmnOfFbVXpMh3aCQFxfT1htxO3NR0kzdkVKrPHYdygflCBaTnsPGuPzMrXjszzGL
         X4gLmlLHTwBGQJHirgsFFk7tjP/gQLg2ZAWTIC+dfefpnkCnRjHpIAZM3r3DzR2V/13L
         xZtl8inFr1q82+DQk/BCaw4ZdVMOmDDJmmSu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=I5PxdE7Au2TyJARSCmHgUkc//1v95bGXI9XFQhA5WEs=;
        b=Jl35Xha/skoEGl3aTEgPx+w5fVEoEVk5EpXNXzT5eKTsPkxXUoSu/OvkQii3LJMxaU
         Lb0ojkIAS8FmWLz/E9kNm2k2AEABECGyw7sJyuE0OnWCFjDivu8xOmyEbET13A6UItJI
         Q1w3RF3LFCdKwUKiTKcK4yazL1aqZB93pkCDzU1/DXqP0ljXuQ9Yvz9BnKK1BccTR8kn
         nmYwC+44/+tg1CNnUQOs4LLaqbJwLbQE3E6wAj2tBs5vjXQ/34zZb29P4uAw8zFhqTq0
         8q8c7E6JRV3mCHkBbybrAS95w+/HgdaffDgvgd90g98oqMq4ZUev9E1+RqguJ/MNE+5/
         EGhQ==
X-Gm-Message-State: AOAM531BHMVDV9enoMuxSaRmeNR5rrkD/03ywNVkKV2ZNGSUraQy1cQQ
	FaVZSTBONfPWgpf5e+CiDSo6MQ==
X-Google-Smtp-Source: ABdhPJwxx3hD4Ou+p7qIicl1OwKOr6XiRvoc2tWxrHatsedYETzsQMYEGJ7GJMBx6j5lMhtzmu15rg==
X-Received: by 2002:a5d:65c8:: with SMTP id e8mr9393135wrw.338.1607615569864;
        Thu, 10 Dec 2020 07:52:49 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 3.3.1.1.b.6.c.f.9.3.b.7.3.e.5.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (3.3.1.1.b.6.c.f.9.3.b.7.3.e.5.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:15e3:7b39:fc6b:1133])
        by smtp.gmail.com with ESMTPSA id 20sm9608792wmk.16.2020.12.10.07.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 07:52:49 -0800 (PST)
Message-ID: <2d012b8dcd17962239264152e6969edda609e16c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Luca Bocassi <luca.boccassi@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2020 15:52:46 +0000
In-Reply-To: <20201123132823.3996355-1-luca.boccassi@gmail.com>
References: <20191209162419.4343-1-luca.boccassi@gmail.com>
	 <20201123132823.3996355-1-luca.boccassi@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-11-23 at 13:28 +0000, Luca Bocassi wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
> 
> In v2.35 util-linux  gained an (optional) build
> dependency on libcryptsetup. But libcryptsetup build-depends on
> util-linux for blkid (optional, can be disabled) and uuid (mandatory).
> Split out util-linux-uuid in a different recipe to break the cycle.
> 
> Add a packageconfig switch (disabled by default) to allow using the
> new dependency.
> 
> https://github.com/karelzak/util-linux/pull/898
> 
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
> v1: util-linux 2.35 is not out yet, but I'd like to get the preparatory work
>     underway as I'm not sure if this is the best approach or if there are
>     alternatives. Suggestions and comments very welcome. Thanks!
> v2: changed packages names to reflect old ones (eg: libuuid1 -> util-linux-libuuid)
>     and leave uuid build enable in main recipe to allow for uuidgen build to happen,
>     as it does not have its own autoconf switch. Delete the library manualy from
>     the main recipe after build instead, and add dependency.
>     Might help to break loop python3 -> util-linux -> libselinux -> python3, as it's
>     only libuuid that is needed, see https://lists.yoctoproject.org/g/yocto/message/47570
> v3: rebased and refactored to have a common util-linux.inc file
> 

I'm afraid this causes do_package_qa errors in basic testing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1668

I am worried about this change as we're starting to see a number of
circular dependencies in util-linux (there is a new bug about the
pylibmount PACKAGECONFIG option too), maybe we should flag this
upstream?

Multiple recipes like this usually turn into a maintenance nightmare
unfortunately which is part of my reluctance to go in this direction,
not sure we have any choice though.

Cheers,

Richard

