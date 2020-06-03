Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.9570.1591173658644894831
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 01:40:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hW0dbtE4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id j198so4009821wmj.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2020 01:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=XRNoAFVHklkpayrebiLGU5dmy+Un6E4cIpTuFvRvPCo=;
        b=hW0dbtE4uQXI2D0xea10ZKK1s74lRxPyrcZ55TAgmS+bIkAZ4t4VE1SLpXe3V25skh
         HfmExY9xwT7lkZGBoxYsJPG0HbYjslg6v0u/8uCUc3VHg4JtzkHPAn/+cgfsO2PLye1o
         7r03c6DKSoGG+uY3GgrEjYEWeK9JkDcagTKJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=XRNoAFVHklkpayrebiLGU5dmy+Un6E4cIpTuFvRvPCo=;
        b=RwIrywvykwdRNhXcL7jMd/hn8DnA5HNKzBBXEQAdiiPEzT8HR1yXEYnonUxGUYzPp8
         ZznYMoy4poBw+aHrcF55nNUoVCbx31Pe03X2JE/Q44QuBkY4OGUCAUha7pba1BdGxNbU
         wPaxVqwVqSJRNRDRtHi5snmYxlHu/JLRdmbuT4g7tVHGimqP//gx7lIW5A/yUm7JReud
         wSpvzkvUrD5b8FAhzUYoT8KAJIArmbkJaImr/ewITcC9nDWPm0HLyD72RiPEj+uD50Ns
         b7nBMLfWN4uVWGkGg4x1IAyUfb79a+jcedCEygtaS3JGQI9bd8TBiNzcyrFtRlEQg2/g
         idzg==
X-Gm-Message-State: AOAM530WI48btnQzRQoggyR4nh7OFK8pc06PtUrKw8ovEGFQl/mQd27x
	6IG9Jrsg1znO/LQQev9Jer929A==
X-Google-Smtp-Source: ABdhPJyrMVKp1rMAkXvCeyFtdpevhipwK/81m18nGD3OXhqlHNkV/C7vdNbnKc1H6g1UvwJRWff6OQ==
X-Received: by 2002:a7b:ce15:: with SMTP id m21mr7746768wmc.117.1591173657205;
        Wed, 03 Jun 2020 01:40:57 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id s5sm1895559wme.37.2020.06.03.01.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2020 01:40:56 -0700 (PDT)
Message-ID: <84ee1d38f14362475fae9900f94794535a44bafd.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] db: enable verify PACKAGECONFIG
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Wed, 03 Jun 2020 09:40:55 +0100
In-Reply-To: <20200603054858.6762-1-Qi.Chen@windriver.com>
References: <20200603054858.6762-1-Qi.Chen@windriver.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-06-03 at 13:48 +0800, Chen Qi wrote:
> On target, when running `db_verify /var/lib/rpm/Packages', we get
> the following error.
> 
>   db_verify: BDB0571 library build did not include support for database verification
> 
> Enable the 'verify' PACKAGECONFIG to avoid such issue.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-support/db/db_5.3.28.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
> index 3a0923ae36..b64c4c089a 100644
> --- a/meta/recipes-support/db/db_5.3.28.bb
> +++ b/meta/recipes-support/db/db_5.3.28.bb
> @@ -61,7 +61,7 @@ DB5_CONFIG ?= "--enable-o_direct --disable-cryptography --disable-queue --disabl
>  
>  EXTRA_OECONF = "${DB5_CONFIG} --enable-shared --enable-cxx --with-sysroot STRIP=true"
>  
> -PACKAGECONFIG ??= ""
> +PACKAGECONFIG ??= "verify"
>  PACKAGECONFIG[verify] = "--enable-verify, --disable-verify"
>  PACKAGECONFIG[dbm] = "--enable-dbm,--disable-dbm,"

Do we ever need to run this on target? I'm wondering why we need this
and what the implications are (extra size to the binaries?). Perhaps we
just shouldn't ship that binary if verify isn't enabled?

Cheers,

Richard

