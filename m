Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.1420.1615333403016966208
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 15:43:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YVRzCmxZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id l22so4440774wme.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 15:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=iaxZ29dEZQHpd8wHTLb7/GTrCNvwqKw60YCAsBzidOk=;
        b=YVRzCmxZOXhRkuL++GYZYhfm5o7dCH4nLgnK3Yeg5/GCOcC0N43o8EAp6GzKZ+J9Ov
         r65qJJRxLbvRmvMeMveBIZeS5Dh9mOfx/0V+xdTung6dU5d38KyK4EgpH7x0E0DAbJif
         0PBr8rq0Y8hajmfIW3rgetOpUigWp4RDdH4Yg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=iaxZ29dEZQHpd8wHTLb7/GTrCNvwqKw60YCAsBzidOk=;
        b=QqutQl0I11agdXDtCmXB4ATlfqvVYbc4cVXb28sGkWU0eCKnK/vgO0EDyubkDsyy9K
         fGG3+R0Q1oOcmTTlWeT+vmhqa6H2Yncj3U9yNxIOc+BvxifIh0D9XryygeKJret4aO3L
         bLHlpitXpC04WlOQ8nAzkjVPSlrVqdsLA3adli1eWjnaPfgF2i1BaiKsPymlkSbJubpX
         vzHerFmxanPWBtlnSdZwjjUy3tVAJSAHR4p+FUU6jr/OiskCuYkjNnx0RGfCpevA/CBh
         S8vZ+8Bx9VLoiQXwN9Ew4KMkYw1ouRnLS3YRHiavhZHCfJB/pcwt+hZF3l9edTnvm2zN
         hMHQ==
X-Gm-Message-State: AOAM533/HLmL2bPlZFfKcSguF2Y1Gglm2DCZOPctObLbMLODDRUv9tyZ
	xurmJ3rXKch9beTU2lX/j9iRuw==
X-Google-Smtp-Source: ABdhPJy6iEHLYaa+/tx6oL4NHdsvwsqaaZCRX9ALZZt002bPgSmrXbjI/lxESieheIBGXVi0+YpQpg==
X-Received: by 2002:a1c:3c02:: with SMTP id j2mr342251wma.92.1615333401332;
        Tue, 09 Mar 2021 15:43:21 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:723d:6f27:5f9:3d7b? ([2001:8b0:aba:5f3c:723d:6f27:5f9:3d7b])
        by smtp.gmail.com with ESMTPSA id u15sm5606161wmq.4.2021.03.09.15.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 15:43:20 -0800 (PST)
Message-ID: <681b7ba8baca230a2b95f5c1fc40e1b5108e9a70.camel@linuxfoundation.org>
Subject: Re: [PATCH v9] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: luca.boccassi@gmail.com, openembedded-core@lists.openembedded.org
Cc: bluelightning@bluelightning.org, Kory Maincent
 <kory.maincent@bootlin.com>
Date: Tue, 09 Mar 2021 23:43:19 +0000
In-Reply-To: <20210309135606.508593-1-luca.boccassi@gmail.com>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	 <20210309135606.508593-1-luca.boccassi@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-03-09 at 13:56 +0000, luca.boccassi@gmail.com wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
> 
> Recently util-linux gained an (optional) build dependency on libcryptsetup.
> But libcryptsetup build-depends on util-linux for blkid (optional, can be disabled)
> and uuid (mandatory).
> Split out util-linux-uuid in a different recipe to break the cycle.
> 
> https://github.com/karelzak/util-linux/pull/898
> 
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
> v1: util-linux 2.35 is not out yet, but I'd like to get the preparatory work
>     underway as I'm not sure if this is the best approach or if there are
>     alternatives. Suggestions and comments very welcome. Thanks!
> v2: changed packages names to reflect old ones (eg: libuuid1 -> util-linux-libuuid)
>     and leave uuid build enable in main recipe to allow for uuidgen build to happen,
>     as it does not have its own autoconf switch. Delete the library manualy from
>     the main recipe after build instead, and add dependency.
>     Might help to break loop python3 -> util-linux -> libselinux -> python3, as it's
>     only libuuid that is needed, see https://lists.yoctoproject.org/g/yocto/message/47570
> v3: rebased and refactored to have a common util-linux.inc file
> v4: added RDEPENDS on util-linux-libuuid on various packages to fix QA warnings
> v5: remove RDEPENDS and instead have util-linux RDEPEND on util-linux-uuid.
>     Removed PACKAGES_remove and instead filter out libuuid via the package generation
>     regex.
>     Rebased on util-linux 2.36.2.
> v6: install libuuid.a in libuuid-dev
>     change rdepends on uuid to use binary package rather than source
>     add rdepends on uuid-dev to libuuid-dev
>     remove rprovides of libuuid-dev from uuid-dev
> v7: do not use '_append' for RDEPENDS, as it is not supported by BBCLASSEXTEND, use
>     simply '+='
> v8: added missing libuuid-staticdev package
>     remove libx32/libuuid* too
> v9: set RECIPE_MAINTAINER_pn-util-linux-uuid, same value as RECIPE_MAINTAINER_pn-util-linux

Sorry, there are still issues:

https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/3207
https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/1608
https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/3159

:(

I really want to get this into the release but we're past feature freeze and
running out of opportunity as each broken test run is delaying other patches.

I'm a little unclear if debian renaming was allowed before the split and if
so, why it is disabled in the split version. I suspect there is a missing
MLPREFIX somewhere causing the multilib issue too.

Cheers,

Richard


