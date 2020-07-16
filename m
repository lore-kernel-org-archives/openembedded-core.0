Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.10810.1594886175508187032
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 00:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NgJZJBRy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id f18so10370481wml.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 00:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=WL7bmqnuZRgV5fV5s6Gc+OCgwJPRLOV+n8aTWmqV/UY=;
        b=NgJZJBRywA1ihLCpVjF6n8CokrCRpuggSpV3hmsSBh8CkPOHOSfBOwHeT/3Vzds2mt
         8AtQGrWCNB+u3kNWjy15s9njA+3r9mIcthbbQXC3DNRU82b7x0RCtl30zX0jIH4AfQ42
         F9c7iqMUg9hu7O5tl5S4OTqJW38a/zPMx7LfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=WL7bmqnuZRgV5fV5s6Gc+OCgwJPRLOV+n8aTWmqV/UY=;
        b=B+IdtswZYQsOoXUjZIGmUE5t9HA3ZTvGzGaN7MRvaT40qNrbQFbM/30qdwZtssZeHl
         GlUErXwPttCTmvxG0JdEIVi2KrkteHbPfamkYcvwK0vyD0+GjFiiH07LGyexg/mZxKHX
         WvPKfUkmwjLjBjE4A+rhjCzVQIYaUOHJJ8FcUzFAWOKtelfra3Pi99UADJZH/XgLReL4
         wNR9wJS1Vdg0nyg3rqE+AT+YwOeS55DXRV/06n1RXN0mIBV7q5GZ3rFoRuYqCLY0sa4P
         9g0TrUJo37a6dQ5slUFGpm+Ii0VtU+Yqvmt2afCXEGRtk+O6X4WfEY4qk8sv+cx2lUqI
         KpAQ==
X-Gm-Message-State: AOAM531nC2Mdg1dd9TLh9dR9pajjqCRZipvsRvuCJZaLaZ3W2FbUlZxq
	9XzGjzrqagAygOjgJei+Mq3g5g==
X-Google-Smtp-Source: ABdhPJz6/CWQ3mzxEbTaSip7QDaZdu+wKot7NFXBM5CJIc5a6w4Pzv2sJl3PMdip5mct0xfnwbWUiQ==
X-Received: by 2002:a1c:6384:: with SMTP id x126mr3264911wmb.144.1594886173946;
        Thu, 16 Jul 2020 00:56:13 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.c.4.9.c.e.0.f.2.5.c.9.7.3.d.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.c.4.9.c.e.0.f.2.5.c.9.7.3.d.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:1d37:9c52:f0ec:94cf])
        by smtp.gmail.com with ESMTPSA id 92sm8223980wrr.96.2020.07.16.00.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 00:56:13 -0700 (PDT)
Message-ID: <1cf3efd45c15d9b79daf0095053acf5df7ec0fce.camel@linuxfoundation.org>
Subject: Re: [RFC] Deterministic build problem
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Changqing Li <changqing.li@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 16 Jul 2020 08:56:10 +0100
In-Reply-To: <142fdb0e-3fe5-de2f-44b3-ad8919dc2b1f@windriver.com>
References: <142fdb0e-3fe5-de2f-44b3-ad8919dc2b1f@windriver.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-07-16 at 15:47 +0800, Changqing Li wrote:
> There are several recipes have broken deterministic build problem.
> 
> wget/quilt/tmon/vim/vim-tiny
> 
> Here is how to reproduce it:
> 
> bitbake recipename
> 
> add "bb.note('test')" in do_fetch of base.bbclass
> 
> bitbake recipename
> 
> 
> we can find for above recipes the installed files under
> ${WORKDIR}/image 
> is different
> 
> since the different configure between 2 times' build.  And the 
> differences always caused
> 
> by different NATIVE_SYSROOT,  the second time build will have more 
> native binaries installed
> 
> during the first time build,  and influence the second time's
> configure 
> task.
> 
> eg:
> 
> wget:  do_package installed rpm-native
> 
> quilt:  do_patch installed quilt-native
> 
> vim:  do_package_write_rpm installeddd glib-2.0-native
> 
> tmon: do_install installed pkgconfig-native
> 
> 
> I know we can fix per recipe by patch configure/Makefile or change 
> PACKAGECONFIG etc, but this
> 
> seems a common problem,  is it possible fix this in common
> framework? 
> Thanks.

Its a good question, one I've pondered a lot. I realised the issue as
we were finishing implementing recipe specific sysroots. The
alternative, task based sysroots are impractical as you have to
reconfigure the source between tasks which defeats the objective.

The challenge is knowing when its safe to remove things from the
sysroot and when it is not. For example, do_package can run in parallel
with do_populate_sysroot and one needs rpm-native, the other does not.
Should do_populate_sysroot uninstall rpm-native? No, do_package may be
using it.

There are some serial points where it might be safe to cleanup, e.g.
do_configure is probably ok. We've not done that as its hard to be sure
and its not generic code.

We could force all tasks to run serially, but that does seem a little
sad to lose the parallelism when it generally works well.

I think we probably can improve, not sure we can fix it for all cases
though generically without significant performance/flexibility loss.

Cheers,

Richard


