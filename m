Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web12.8908.1595498259562591166
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2020 02:57:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QEaCtIr7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id f2so4539318wrp.7
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2020 02:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=5YFWib+Km4gqmaUWqStx5s3d4ZtYT5iFD8r2Xz9ptoU=;
        b=QEaCtIr7G+dfNrFjZkMt+rKKa+K8UQNzd8XwBfC/w9qlbq9lKPfbM1cVekevGa2Qas
         4FcO7Y/sctWhvuyXYWgv2KP31YisHa8vUJYX0xw9ZB/QNoZwFC7cjS4jkavvsSva+d1G
         YqHeLlqWWeamQKjdZk/Pmm/9aHBZT8Hrtm6j0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=5YFWib+Km4gqmaUWqStx5s3d4ZtYT5iFD8r2Xz9ptoU=;
        b=JIjX2cx58YJDl5oiWqcmu9HPHR0Tq0jB+TG9C9VDlVqnT2orbO1hiX4CqNr9xy0icm
         NEapPwMElmZVMoK+EkQ6fcH66AbAhnBKkB9uiu3PR+2UMMS6i2Rt8SMGQ0bn3VkEe6N5
         qarz6Vc2vXmFph4lYf+f8dyOHxIXr4twYmq93r+EJZAIm47UuVrIBptzQJzjZYSyaf/n
         +Ph95IQZvsLpO7qKT4ddbhKmYJlH5j7wkfhAiJFuqVyUoo/cs0bRs9x3Av3TUFdrtb97
         7zToLpm+1OJsrxYErfEF+v7RhfenxddLu0UC/iK4tqgSesv3xM8GvImepvMCz09HJVfB
         w6wA==
X-Gm-Message-State: AOAM533VtjmUvobIYKNixoyo4qFTlWudd3atfxWI5MQhlo0RpNLomYOO
	ESzjQe4eEdffKkjyvo6LEyfBEg==
X-Google-Smtp-Source: ABdhPJysnhuEbkeg3QfdZ03c2UA228jsEgAtpaCRmihvOiBWkvMIkOAqwrYBuVRELtmj/hjDNEQmJg==
X-Received: by 2002:a05:6000:1211:: with SMTP id e17mr3396475wrx.263.1595498258061;
        Thu, 23 Jul 2020 02:57:38 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.a.5.c.a.d.d.d.3.0.d.d.c.1.8.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.a.5.c.a.d.d.d.3.0.d.d.c.1.8.9.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:981c:dd03:ddda:c5af])
        by smtp.gmail.com with ESMTPSA id n3sm3488966wre.29.2020.07.23.02.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 02:57:37 -0700 (PDT)
Message-ID: <6cf99b2a8074d34b119f9d634a4b5b225e3edce8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5] Add package managers as a plugin
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Fredrik Gustafsson <fredrik.gustafsson@axis.com>, 
	openembedded-core@lists.openembedded.org
Cc: tools-cfpbuild-internal@axis.com
Date: Thu, 23 Jul 2020 10:57:34 +0100
In-Reply-To: <20200722133120.11484-1-fredrigu@axis.com>
References: <20200722133120.11484-1-fredrigu@axis.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-07-22 at 15:31 +0200, Fredrik Gustafsson wrote:
> OE-core today has three different package managers, the well-known
> formats deb
> and rpm is supported as well as ipkg that is good for embedded
> devices.
> 
> When building and having a good cache hit, a significant amount of
> time is
> spent in the phase of generating a rootfs, which is really about the
> performance of the package manager. To save build time and also get a
> package manager that is suitanle for use on targets where flash
> memory is a
> concern, support for apk is suggested.
> 
> However, it might or might not be what's wanted for OE-core since it
> increases
> the test matrix. Therefore I will refactor the package management
> code to
> allow a layer to add a new package manager without editing the meta
> layer.
> 
> This refactor will be divided into multiple patch series to be easier
> to review,
> this series will only move code but keep existing functionality.
> 
> Changes since v4:
> * Removed blank lines in end of new files
> * Rename package_managers to package_manager
> * Move import statements out from function when it's possible.
> * Edit commit message to prepend subject with rpm:, ipk:, deb:, etc.

I did try this on the autobuilder to see where things stood. I showed
at least one problem with quite widespread effects:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1197

Cheers,

Richard

