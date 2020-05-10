Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.14729.1589118059456997861
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 May 2020 06:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WgtoZM/H;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id j5so7491281wrq.2
        for <openembedded-core@lists.openembedded.org>; Sun, 10 May 2020 06:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=WDC9gfiSsTrMxpkGrOTk4LtRyLMhNZ5i3EVsyVmfS48=;
        b=WgtoZM/HpzIHb9M9ZnSo511AfLn8H+oy4RgxMO2plheL8R1Yq1FZ985dzGAeSEA4KX
         xVqIAakEvz7fOLbcEJZvpg/NeznDqdiLEJyQCa1M3RQm48tmhJLQ84xKO5lpuuXXjFLl
         oeZXtjVQGFuy0EKDkz2n3unXYFNY9dqapPqFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=WDC9gfiSsTrMxpkGrOTk4LtRyLMhNZ5i3EVsyVmfS48=;
        b=Zno437AMP9y1WA5a9vsDqrNmT52/wj7DL4n7xitdx00tff+cAxzjKu3MeK1ev9zZ4z
         mqzLmSNSTHMnCqSMnN1Iyq5R8bZafQT/YQN5LS1irrpN6vMF/LpS3KCljQHCHNsLDAya
         widTUjMB8qbqhwFmlpJFB41fViVYnCMbxU6GCxnFLSlH+SW6v353Qp5Yg0DJ+ZGUZ5EI
         dODdN1xUfz3mec5oDxLfkSgDHh+rE9o6MXS/470wC7S4gWOL3Uhh5CMRUd1GWaUwFS/R
         tEUAP/MceKPwzv8DsZslO6d652XyjPZng1L3nyrnPnEfKgnd4Iybd/elO34Z7BuI1HWG
         LfrA==
X-Gm-Message-State: AGi0PuZ+KkUU3XUp8JZ4PjKEhlKjEWO8w0/yAeE73hu9WZ5PCPoUZ7OF
	rv9pPgkdUa5wWv55KuiO1ZsNbg==
X-Google-Smtp-Source: APiQypIFOCQUwjedO+WKc5453km7hlLkhQRzA1bdits1Fjapq/Tv7MfrjB48Agd6rH5joKDQecUGIw==
X-Received: by 2002:adf:e483:: with SMTP id i3mr12964464wrm.88.1589118057808;
        Sun, 10 May 2020 06:40:57 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id u12sm23375186wmu.25.2020.05.10.06.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2020 06:40:56 -0700 (PDT)
Message-ID: <080c0849554edd5710f68f6283a020f578968de9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] buildtools-extended-tarball: add nativesdk-glibc
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: kai <kai.kang@windriver.com>, openembedded-core@lists.openembedded.org
Date: Sun, 10 May 2020 14:40:55 +0100
In-Reply-To: <20200506015447.13003-1-kai.kang@windriver.com>
References: <20200506015447.13003-1-kai.kang@windriver.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-05-06 at 09:54 +0800, kai wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> It requires gcc 5.0 via OE-Core rev abc741a. On centos 7, the gcc
> version is too low then it has to build with buildtools-extended-
> tarball
> which provides nativesdk-gcc.
> 
> But it fails to build nspr-native:
> 
> > gcc   abstract.o -Xlinker -L../../dist/lib -lplc4 -L../../dist/lib
> > -lnspr4 -lpthread -o abstract
> > /PATH/TO/x86_64-wrlinuxsdk-linux/bin/ld: /lib64/librt.so.1:
> > undefined reference to `__clock_getcpuclockid@GLIBC_PRIVATE'
> > /PATH/TO/x86_64-wrlinuxsdk-linux/bin/ld: /lib64/librt.so.1:
> > undefined reference to `__clock_nanosleep@GLIBC_PRIVATE'
> > /PATH/TO/x86_64-wrlinuxsdk-linux/bin/ld: /lib64/librt.so.1:
> > undefined reference to `__clock_settime@GLIBC_PRIVATE'
> > /PATH/TO/x86_64-wrlinuxsdk-linux/bin/ld: /lib64/librt.so.1:
> > undefined reference to `__clock_getres@GLIBC_PRIVATE'
> > collect2: error: ld returned 1 exit status
> > make: *** [Makefile:379: abstract] Error 1
> 
> Add nativesdk-glibc to buildtools-extended-tarball. And it increases
> size of buildtools-extended-tarball about 3K from 48356989 to
> 48360329.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-core/meta/buildtools-extended-tarball.bb | 1 +
>  1 file changed, 1 insertion(+)

This doesn't make sense. Does it mean we need a new uninative version
instead?

Cheers,

Richard

