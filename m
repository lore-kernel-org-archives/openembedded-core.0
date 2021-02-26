Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.11224.1614354820551395823
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 07:53:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KLp/owPY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id e10so8805589wro.12
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 07:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=bDAQIm8lz+5eZNfvBcfBuL7SkHYs/U3X99XuH6G21Pc=;
        b=KLp/owPYZpVsC3KJ2iRRHDrGtqjZQeWK9cwRRRAHvePHQxcRp9xeeF8eXHZLQeKpq9
         0MWvmjRHd3Gp5TnHh9Ni7p/gBuEG3HkJmKCIYN0lzMR8WvtPAx481PSKLBlBOEYk8LZI
         d0QvbNWJDuTyP26izvwHVCxd++w5QGQzsHxHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=bDAQIm8lz+5eZNfvBcfBuL7SkHYs/U3X99XuH6G21Pc=;
        b=hN5kGdO1qLrbeCIYLNYuUgw10Gvl6dz5BBFtNs4fMhytmPjAU/4KI2FKE4PHR0GVR+
         Ex5u7pr7KnscuZYT2pzCcJXzZ0eTlmtmspIGjsvucGRBtaOIKSkWvtXFG5ZtI3BQoq9s
         4BbD5wXFLxPuKwI+fEb+1Jlll4WpLVa709KwcZxV91JdrmRF0et5QwaMN7rmisTJVMSC
         jlirtyS/DOUYlv/EbFWDHeJGk/eNZRsFoTm0TsOqyIUNgCW4jtxZcW5BjlMH0jBLlZDc
         u7Scw5zirfzxXZaoFgWB7vZwzUn/F9M1/Ah+MCpmknoy+beKJYjVVdlpRflTH+2MYLsx
         V/yA==
X-Gm-Message-State: AOAM532a9F9v3FGsw+VKZdBwPfCL6w8pKKEaN6H75D1zzOmHLDvt9jQe
	38mbWRhI2dy/5g+38Qn7WBZV/QjcfROz7w==
X-Google-Smtp-Source: ABdhPJyzTKSTpjs6Q3AbZQ78v/45YcuR2JzZbwEKAtMcs8tJ13COoAoAPNYwn6O6vljhwcRfwGrCQQ==
X-Received: by 2002:a5d:6381:: with SMTP id p1mr3986788wru.266.1614354819077;
        Fri, 26 Feb 2021 07:53:39 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e9fa:5b01:958e:e80f? ([2001:8b0:aba:5f3c:e9fa:5b01:958e:e80f])
        by smtp.gmail.com with ESMTPSA id j14sm3771394wrw.69.2021.02.26.07.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 07:53:38 -0800 (PST)
Message-ID: <27cd8d13140defc517650f2a1ef76c1d58d9928a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC][PATCH] sstatesig.py: show an error instead of warning when sstate manifest isn't found
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Martin Jansa <Martin.Jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 26 Feb 2021 15:53:38 +0000
In-Reply-To: <20210223135101.gcailiou4lhceoa7@jama>
References: <166663E8BC670D0D.6890@lists.openembedded.org>
	 <20210223135101.gcailiou4lhceoa7@jama>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-02-23 at 14:51 +0100, Martin Jansa wrote:
> On Tue, Feb 23, 2021 at 02:35:53PM +0100, Martin Jansa via lists.openembedded.org wrote:
> > * not sure if there are some valid use-cases for missing manifest, but
> >   recently I'm seeing increasing number of build failures where something
> >   from native recipe is missing (seen it with pseudo, autoconf, nodejs
> >   recently) and the only indication that something is wrong (before showing
> >   sometimes misleading error like:
> >   recipe-sysroot-native/usr/bin/node: No such file or directory
> >   is this warning:
> >   NOTE: Running task 7844 of 12431 (/meta-oe/meta-oe/recipes-devtools/nodejs/nodejs_12.20.2.bb:do_prepare_recipe_sysroot)
> >   NOTE: recipe nodejs-12.20.2-r0: task do_prepare_recipe_sysroot: Started
> >   WARNING: nodejs-12.20.2-r0 do_prepare_recipe_sysroot: Manifest /BUILD/sstate-control/manifest-x86_64_ubuntu-18.04-nodejs-native.populate_sysroot not found in x86_64 x86_64_ubuntu-18.04 (variant '')?
> >   NOTE: Running task 7845 of 12431 (/meta-oe/meta-oe/recipes-devtools/nodejs/nodejs_12.20.2.bb:do_unpack)
> >   NOTE: recipe nodejs-12.20.2-r0: task do_unpack: Started
> >   WARNING: nodejs-12.20.2-r0 do_prepare_recipe_sysroot: Manifest /BUILD/sstate-control/manifest-x86_64_ubuntu-18.04-nodejs-native.populate_sysroot not found in x86_64 x86_64_ubuntu-18.04 (variant '')?
> >   NOTE: recipe nodejs-12.20.2-r0: task do_prepare_recipe_sysroot: Succeeded
> > 
> >   if I rebuild that native dependency, then it gets fixed and I don't
> >   see these failures in clean builds (as without sstate and with empty
> >   TMPDIR), only in incremental builds
> > 
> > * but if there isn't valid reason for missing manifest file, then I think
> >   it would be better to error early (or even bb.fatal())
> 
> Looks like this warning was first introduced in 2014:
> https://git.openembedded.org/openembedded-core/commit/?id=79ea036de331bde65a88fb777647dc099ef05acf
> then extended and updated for RSS in:
> https://git.openembedded.org/openembedded-core/commit/?id=809746f56df4b91af014bf6a3f28997d6698ac78
> then added for package management in:
> https://git.openembedded.org/openembedded-core/commit/?id=85e72e129362db896b0d368077033e4a2e373cf9
> and then unified last 2 to common function in:
> https://git.openembedded.org/openembedded-core/commit/?id=68150bac7444f089f19c789e9f6602d59f605d7a

I merged this. There were cases where the warning showed in cases where
there wasn't a problem but I think we've fixed all those now.

Cheers,

Richard

