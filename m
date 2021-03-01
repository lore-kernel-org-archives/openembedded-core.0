Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.9967.1614587870171613422
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 00:37:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q/1NNdhv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id o7-20020a05600c4fc7b029010a0247d5f0so2558790wmq.1
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Mar 2021 00:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=XE9eDGyKMFoXxxE4xpdjhGnlep2UKT3z3yVaz4wRSbA=;
        b=Q/1NNdhv3HqF/yWaLaUr+lQSAhPoBDdGuzPTovQN56qsYezo5+ue5Foo/scscacKV/
         GS/94qmuXAt6e1t2y3h9qWnlxB6XiI7PYWWhtGHRuGlK22Ocm5WSBiy/ybqquyi6grhy
         wJ2eH9ySqG38TzwIuPrf6fflSnPxGxoSoeAT8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=XE9eDGyKMFoXxxE4xpdjhGnlep2UKT3z3yVaz4wRSbA=;
        b=j3Dii5TvSLCoeoVjRSIYTSmjEqFHkTX6lbpECIVpW9H3abEyWYuVS/+keuTlVObrR5
         zZITEnmWu8q+H/dQTSgMuFtQ89VR02IrALb/ml9QLeLrtOHM7TzxZCGlI5KpPUHbjSsN
         /rrBXUmH4DBVLOgT+oJFn9K37wiixM8OB1xwLWMdbs2mDBYIi14nvUjF5x71MqPAwRJk
         slJ5uvAaveUQHx0gdRV9TiEewU8N/BrGuVDVtH/UFbxffiiOvJyqO4DihKtokU78/sLY
         THDca767CRxQYxDBITYWY4A28My0gJ4j4vystqvauF+ZmeHL7WMqZd5j0FXTfZN7Sqa2
         xPhw==
X-Gm-Message-State: AOAM532zHcfKn/OosD1io5Um+RprDzuUrZT3c32J4QvLlTWxoB/r7jKA
	djMnqbPxX2hmsKJ6gm3Psju4Mw==
X-Google-Smtp-Source: ABdhPJwPnm5fTfDpsuo9HdBa9Kpy9fqnO8FfW7HxCjU0ad4e2zAd2bfhJOl/Rw1QdUj0YcSua6UFNA==
X-Received: by 2002:a1c:7415:: with SMTP id p21mr4475371wmc.187.1614587868370;
        Mon, 01 Mar 2021 00:37:48 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:d6b6:68f5:94dd:1b3a? ([2001:8b0:aba:5f3c:d6b6:68f5:94dd:1b3a])
        by smtp.gmail.com with ESMTPSA id l15sm8251420wme.43.2021.03.01.00.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 00:37:48 -0800 (PST)
Message-ID: <8dac13bfdbb13a7d6e6d0277c2d1ec89fe613909.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] selftest/reproducible: Don't call sync between each file compare
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mikko.Rapeli@bmw.de
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 01 Mar 2021 08:37:46 +0000
In-Reply-To: <YDyezaTI3Vz0mif6@korppu>
References: <20210226174752.3942750-1-richard.purdie@linuxfoundation.org>
	 <YDyezaTI3Vz0mif6@korppu>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-03-01 at 07:59 +0000, Mikko.Rapeli@bmw.de wrote:
> Hi,
> 
> On Fri, Feb 26, 2021 at 05:47:52PM +0000, Richard Purdie wrote:
> > Calling sync between each file compare is horrible performance wise
> > as we compare thousands of files. We don't care about IO latency here
> > so disable.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/lib/oeqa/selftest/cases/reproducible.py | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
> > index ce4e8ebe06b..05fc4b7fa0a 100644
> > --- a/meta/lib/oeqa/selftest/cases/reproducible.py
> > +++ b/meta/lib/oeqa/selftest/cases/reproducible.py
> > @@ -123,7 +123,7 @@ def compare_file(reference, test, diffutils_sysroot):
> >          result.status = MISSING
> >          return result
> >  
> > 
> > -    r = runCmd(['cmp', '--quiet', reference, test], native_sysroot=diffutils_sysroot, ignore_status=True)
> > +    r = runCmd(['cmp', '--quiet', reference, test], native_sysroot=diffutils_sysroot, ignore_status=True, sync=False)
> 
> Uh, sync is horrible for performance. Why don't we change it to false
> by default:
> 
> --- a/meta/lib/oeqa/utils/commands.py
> +++ b/meta/lib/oeqa/utils/commands.py
> @@ -167,7 +167,7 @@ class Result(object):
>      pass
>  
> 
>  
> 
> -def runCmd(command, ignore_status=False, timeout=None, assert_error=True, sync=True,
> +def runCmd(command, ignore_status=False, timeout=None, assert_error=True, sync=False,
>            native_sysroot=None, limit_exc_output=0, output_log=None, **options):
>      result = Result()
>  
> 
> 
> Based on comment:
> 
>     # tests can be heavy on IO and if bitbake can't write out its caches, we see timeouts.
>     # call sync around the tests to ensure the IO queue doesn't get too large, taking any IO
>     # hit here rather than in bitbake shutdown.
>     if sync:
>         p = os.environ['PATH']
>         os.environ['PATH'] = "/usr/bin:/bin:/usr/sbin:/sbin:" + p
>         os.system("sync")
>         os.environ['PATH'] = p
> 
> this looks like a workaround for some other bug.

The wider issue is the randomly failing ptests and other issues with the automated
testing, particularly things running under qemu system mode. Those seemed partly to 
be caused by huge IO queues building up. The idea of the sync calls was to keep the 
UI backlog manageable.

In most cases we execute occasional commands so this should work/help. In the case of
the reproducible ptest, we execute a cmp on every generated package which really didn't
work well hence it makes sense to disable it there.

We don't see this issue with any other tests as far as I've observed. I really don't
want to make the runtime testing results worse, anyone who's looked at swat or attended
bug triage will know how much trouble we're having with the issues this code helps
mitigate :/.

Cheers,

Richard





