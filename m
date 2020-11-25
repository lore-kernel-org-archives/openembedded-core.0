Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web09.4980.1606300251162414725
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2020 02:30:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z/agQX86;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id i2so1378401wrs.4
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2020 02:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=NS9iN/Oxht3ywLk/aN6dMmnAETIaKvt2BuUtsNfVGAI=;
        b=Z/agQX86vlZxK46jWobXv1UZXQZ0DttlF40v+/+JA8LSZwEo4W1ziY4PjMOS4DvI8L
         TF598oyFks60LIDldr4cUItv9zeplf3M01ChUglgmO5FYwRTPghea66sCstmnE1LMGTM
         denVlCokmIMTcxLynWtRZ0a/Tx8Gx8/wuSxH8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=NS9iN/Oxht3ywLk/aN6dMmnAETIaKvt2BuUtsNfVGAI=;
        b=K0o+xz+Wvfy6r7wSs4hOuCarp+DLkN8+VrFv872hyVUkYC62PvppacB/Mh7ct0HKLV
         vz+AfgQUq9Dri7GlBZA93X/zB8gRBcS2PEW/KJjnyamauXCjOjULBR6Wmm8csKNOBsGs
         vnS/WTt5/UOrsnaeE+U+U+zQiaslqklB4coJBKQklAhc4H8oYx2E4apvBj1SojNFhVVd
         y6wOuFqnSjnoW/yLR7t0pXjWLhpCS4aqiQQtHT2dU3zba5EETXrkUwqkOSycKmLCmHss
         N60e2LQ5P3qvLA6A1P8JPm7WIVo2Q2EgsCqT/cC43x9xagfkcEg3ePYBfJIqD89S8QeN
         W0hw==
X-Gm-Message-State: AOAM5334TdlCY8wD6Cxwflo7cavv1M6WH8NScfL+YSWTxYCdFqP+BZQg
	+V0yjwdFdxItPEzHb/mgRLaeUA==
X-Google-Smtp-Source: ABdhPJzKoTy19q1Z5yaBKH9gWY5FUhtyZnRny9UPuDJQN7HnIkS7Tpj1Npy94kdixCJ7TupvyjEFMQ==
X-Received: by 2002:a5d:634d:: with SMTP id b13mr3335383wrw.310.1606300249613;
        Wed, 25 Nov 2020 02:30:49 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.3.1.2.4.d.e.0.6.7.2.2.d.6.0.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.3.1.2.4.d.e.0.6.7.2.2.d.6.0.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:906d:2276:ed4:2134])
        by smtp.gmail.com with ESMTPSA id g131sm4120754wma.35.2020.11.25.02.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 02:30:48 -0800 (PST)
Message-ID: <32812d8ef3f7b29686e3a591e29315e82a80ead5.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v2 1/2] bitbake.conf: Split optimization into common part
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andrej Valek <andrej.valek@siemens.com>, 
	openembedded-core@lists.openembedded.org
Cc: Pascal Bach <pascal.bach@siemens.com>, Adrian Freihofer
	 <adrian.freihofer@siemens.com>
Date: Wed, 25 Nov 2020 10:30:46 +0000
In-Reply-To: <20201123190029.13811-1-andrej.valek@siemens.com>
References: <20201122124853.30262-1-andrej.valek@siemens.com>
	 <20201123190029.13811-1-andrej.valek@siemens.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-11-23 at 20:00 +0100, Andrej Valek wrote:
> This option allows correctly handle the release/debug flags separation in
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

I am a bit worried about this as we're effectively letting cmake's idea
of flags separation determine how we have to set things in OE. Once we
go down this route, we're going to have problems any time we try and
add a new compiler flag.

What does this buy us in the end?

Cheers,

Richard

