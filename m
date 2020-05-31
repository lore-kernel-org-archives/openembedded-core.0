Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web11.12259.1590917954385436874
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 02:39:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VxHVZqbW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id x6so8358091wrm.13
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 02:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Byw8Pgq+If1eeHiAgdxdS2GB/LUReLBrmDtKlpuP3ok=;
        b=VxHVZqbWs+2k+/R2Qx1R0jvQIG3mULvKqSbzvqA1EgnBZruWZ+2OnOyLTT6nHFGw9x
         pXSCjMb5u1nUcUzpaMUOaqTUenuL+DbKEr57DL9sY7fBENqo2UEE2cheev09bD0F50Bh
         gxYIjTw1hYEIwdAelh0HfYA7C2f5VFMNp3/DU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Byw8Pgq+If1eeHiAgdxdS2GB/LUReLBrmDtKlpuP3ok=;
        b=KYoRUyK3VNz26lbblDGAN40ybcJQ4FKenuUCPs+kLUtOsNeUQbAkSqIByd5yNFBFJL
         v2ZPPGbLka6i5tGfXBvsSIm2txezeQ7ZO3axaEljD0HA6rRf/zToBgyMvcanHHf99n4B
         VxptJQ0ABE448JLhDj2v3ArfEVgO5byYjqDQJ1nQSqcyr3zjLjZ8Hm5V+cPVKIggYpcG
         zKE3mwGc3+tYycta3xF2uPQmHIyyLMW9NHhpBmG7A19gQVrSEyxfHYmlS2xgM0gnGsoP
         XJ2twJrotKQ8+wpW/TbCbWAvvrUxpIn8o//14B84KVCOjFRHmZXc8sz4hL1gO2wjCkGP
         JyCQ==
X-Gm-Message-State: AOAM532uRRHYTiA78PG5ZpDBcLcAYyWUw3NOC5wwFbjBEMbX7JM+DtQz
	ELtO6fizAtEzESF84dyZlq2eh0Xm9Ys3iQ==
X-Google-Smtp-Source: ABdhPJyAzTerlsrM2WDlwegE3xkoWQk4hSDmfdNkS1sdWjH2pPoN8bvXxx7Jeg74sXbgfK9Vjdi43g==
X-Received: by 2002:adf:a15c:: with SMTP id r28mr15877755wrr.337.1590917952586;
        Sun, 31 May 2020 02:39:12 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id f11sm16452348wrm.13.2020.05.31.02.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 02:39:11 -0700 (PDT)
Message-ID: <b2c5a45e2ce62526052b472c80867500d4840a4e.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH 1/1] qemu: force target build type to production
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Joe Slater <joe.slater@windriver.com>, 
	openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com
Date: Sun, 31 May 2020 10:39:10 +0100
In-Reply-To: <20200529212429.145132-1-joe.slater@windriver.com>
References: <20200529212429.145132-1-joe.slater@windriver.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-05-29 at 14:24 -0700, Joe Slater wrote:
> qemu will not build for -Og optimization because macros
> in lockable.h do not work as expected.  Override DEBUG_BUILD.
> 
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  meta/recipes-devtools/qemu/qemu_4.2.0.bb | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta/recipes-devtools/qemu/qemu_4.2.0.bb b/meta/recipes-devtools/qemu/qemu_4.2.0.bb
> index a4018cc448..90b230d62f 100644
> --- a/meta/recipes-devtools/qemu/qemu_4.2.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu_4.2.0.bb
> @@ -10,6 +10,10 @@ DEPENDS = "glib-2.0 zlib pixman bison-native"
>  
>  RDEPENDS_${PN}_class-target += "bash"
>  
> +# Does not compile for -Og
> +#
> +DEBUG_BUILD_class-target = "0"

Would native and nativesdk builds not have the same issue?

Cheers,

Richard

