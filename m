Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.4.1624402329313220849
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 15:52:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NNRl+I5e;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id h11so441506wrx.5
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 15:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=NBE/H7ZugGbv4ezIjC39fRGqTP5DMJd1Crk93MYTCPY=;
        b=NNRl+I5eJEglzlsbUI5B4eZBhvYOHhQ+Febh4fnYQMI2LcAgOPJvjo40EBOwW1k0HJ
         gHjJ9RR5uGlsV6rIy9syV/9A+66TIMpH+3trRvb6KCbbfSirnY7KmHkh/jt/+7M4qX/3
         pqqEzAhXOjJu+DiDmltwrYxxLmWkX7eRcaZPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=NBE/H7ZugGbv4ezIjC39fRGqTP5DMJd1Crk93MYTCPY=;
        b=hnnfo9d5m5mctZZrBTf5hVCGJLA9A4NJbur17xffOQNLhiVh9Brrt5PEZzpV9G2qp1
         AnKYmN1O0wjNIRojTEh8Zerkvlql9CJMTQ22xLt0ziGqdFlA/g3e5hrn8fFKZMgPKLma
         VxdCawz229thWsgiIv6BEhVUQ09qFq4ItV2HOY73/V2sC1CPxFdBCa9+HYJ8Z2g2SYsO
         /OpSeYy+wuQZwn4OgLOrZPkGPEwPA9qlYifQvXrVjo24St1sbNRIdWJgFAJ4uPBXacry
         WWGqJNqE2jUfHO5SaHIDo2rLAg/PmaCV8Iq497ZVzgSY8C/iinRHopqixr+8sqFD838x
         ndQA==
X-Gm-Message-State: AOAM530x6F8Z0BZEW7d7B9TQ3OlUAXe+PM7ix8w2qj2qtlqgeeYhWxy9
	gbKp2wQP5R6L2+cQSMPbIOxg9Q==
X-Google-Smtp-Source: ABdhPJwJfsfXfsXu5y83vlplIV3Z3MNhx7awnGeHu9y+0pWDc23D9yVQdqWTom1ItrZP7fS+2Cpp4w==
X-Received: by 2002:adf:c790:: with SMTP id l16mr7880001wrg.121.1624402327725;
        Tue, 22 Jun 2021 15:52:07 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6767:206b:b2bd:bdc5? ([2001:8b0:aba:5f3c:6767:206b:b2bd:bdc5])
        by smtp.gmail.com with ESMTPSA id x18sm746331wrw.19.2021.06.22.15.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 15:52:07 -0700 (PDT)
Message-ID: <e55f8738df38061214d7cd823eaab9646bc36f5b.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 1/2] kernel.bbclass: run read_package_metadata only if packaging is enabled
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Andrea Adami <andrea.adami@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 22 Jun 2021 23:52:02 +0100
In-Reply-To: <20210622221818.4613-1-andrea.adami@gmail.com>
References: <20210622221818.4613-1-andrea.adami@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-06-23 at 00:18 +0200, Andrea Adami wrote:
> As exposed in the ML
> https://lists.openembedded.org/g/openembedded-core/message/153000
> 
> up to commit 86142da in Gatesgarth it was possible to build a second mini-kernel w/out
> modules to be just deployed and collected by other recipes.
> 
> These kernels use special care to avoid packaging:
> 
> inherit nopackages
> 
> PACKAGES = ""
> PROVIDES = ""
> 
> Now the change in kernel.bblass calls a packaging routine:
> do_deploy[prefuncs] += "read_subpackage_metadata"
> 
> As a result the kernel build fails.
> 
> Fix this using bb.data.inherits_class() to verify the
> possible previous inherit of nopackages.bbclass.
> 
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  meta/classes/kernel.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 379bed44f2..06e6446a08 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -771,8 +771,8 @@ kernel_do_deploy() {
>  }
>  
> 
>  # We deploy to filenames that include PKGV and PKGR, read the saved data to
> -# ensure we get the right values for both
> -do_deploy[prefuncs] += "read_subpackage_metadata"
> +# ensure we get the right values for both. Do this only if packaging is enabled.
> +do_deploy[prefuncs] += "${@ '' if bb.data.inherits_class('nopackages', d) else 'read_subpackage_metadata' }"
>  
> 
>  addtask deploy after do_populate_sysroot do_packagedata
>  

I'm not convinced this is the right fix. Which values is that function 
finding and reading which cause problems? It sounds like there is a deeper 
issue here that should be fixed instead...

Is there a simple reproducer for this on master?

Cheers,

Richard

