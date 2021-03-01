Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.11138.1614597794270940281
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 03:23:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ISW7LY9g;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id b18so9233855wrn.6
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Mar 2021 03:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=gVgMSAgKe0COlaTXtJn+pX/GZwU8QHD9Rwe6Eul2H9Q=;
        b=ISW7LY9gw7+0qtdu4QFpAL2LoN3VqIWZ2PwDXt9JRyrsuqNP4hep56K72CBurRH/wZ
         n+NxqPVt/rbv/V0MRnrndXDO9lz0c9Xm+NoJKr7tu/aU/x/yb71kdCSrdOajl+kskcgz
         41A7VTQNBtcCdemXSGufgL2vUMDbBhlhbvEJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=gVgMSAgKe0COlaTXtJn+pX/GZwU8QHD9Rwe6Eul2H9Q=;
        b=gRVZHZAdfctLzfpsIYV+99qp1/igFCUpOEO0OX3yMmgDepoil8b/av8QS5E3TLIONl
         oJeSgA9kp2GIWLWFPJ53DYicz7hVSmjHjUsS3m1epAiYEbsxyyxTwVQtEKHUO7WY+ERt
         llXjVYnmx2X6p9bgvZcEC3HVvPnMOqHTGf2ZE7ljZTIJG1mb26QGq/fyQbJgdzavHT9P
         v8kMnUit9s983vDIkkolQKFDIpOYEBjVywsK+bAZ5bYkNorL68M2dTxHrMI7EYCUnh4Q
         eEMKTEKwyI1+BhD5zViYf2pxMF/5TsNXW9HiCCuk8GraACQh1lPh9EWgejEzxh+XyNzc
         x8Eg==
X-Gm-Message-State: AOAM531bFcEf+KiYFSgaGtCiAFFQG/KdlIiGlwM0F53YTfOknVxkHPcH
	OogDGqRU9SyZrsLpSoHIi4fVMQ==
X-Google-Smtp-Source: ABdhPJyPJmZUlUtFBSbt3PsFQthq5Nw99F0i1FYoFBiU12k2G+hbEoY2TLx7W68wsG8k/5GIRQfOgA==
X-Received: by 2002:adf:e791:: with SMTP id n17mr16309773wrm.322.1614597792570;
        Mon, 01 Mar 2021 03:23:12 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:d6b6:68f5:94dd:1b3a? ([2001:8b0:aba:5f3c:d6b6:68f5:94dd:1b3a])
        by smtp.gmail.com with ESMTPSA id k15sm21479936wmj.6.2021.03.01.03.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 03:23:12 -0800 (PST)
Message-ID: <37ae3d7799e59c96735db95b34da7eaeabe134ce.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] selftest/reproducible: Don't call sync between each file compare
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mikko.Rapeli@bmw.de
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 01 Mar 2021 11:23:09 +0000
In-Reply-To: <YDypMKCRf9xoJbFt@korppu>
References: <20210226174752.3942750-1-richard.purdie@linuxfoundation.org>
	 <YDyezaTI3Vz0mif6@korppu>
	 <8dac13bfdbb13a7d6e6d0277c2d1ec89fe613909.camel@linuxfoundation.org>
	 <YDypMKCRf9xoJbFt@korppu>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-03-01 at 08:43 +0000, Mikko.Rapeli@bmw.de wrote:
> On Mon, Mar 01, 2021 at 08:37:46AM +0000, Richard Purdie wrote:
> > On Mon, 2021-03-01 at 07:59 +0000, Mikko.Rapeli@bmw.de wrote:
> > > On Fri, Feb 26, 2021 at 05:47:52PM +0000, Richard Purdie wrote:
> > > 
> > > 
> > > Based on comment:
> > > 
> > >     # tests can be heavy on IO and if bitbake can't write out its caches, we see timeouts.
> > >     # call sync around the tests to ensure the IO queue doesn't get too large, taking any IO
> > >     # hit here rather than in bitbake shutdown.
> > >     if sync:
> > >         p = os.environ['PATH']
> > >         os.environ['PATH'] = "/usr/bin:/bin:/usr/sbin:/sbin:" + p
> > >         os.system("sync")
> > >         os.environ['PATH'] = p
> > > 
> > > this looks like a workaround for some other bug.
> > 
> > The wider issue is the randomly failing ptests and other issues with the automated
> > testing, particularly things running under qemu system mode. Those seemed partly to 
> > be caused by huge IO queues building up. The idea of the sync calls was to keep the 
> > UI backlog manageable.
> > 
> > In most cases we execute occasional commands so this should work/help. In the case of
> > the reproducible ptest, we execute a cmp on every generated package which really didn't
> > work well hence it makes sense to disable it there.
> > 
> > We don't see this issue with any other tests as far as I've observed. I really don't
> > want to make the runtime testing results worse, anyone who's looked at swat or attended
> > bug triage will know how much trouble we're having with the issues this code helps
> > mitigate :/.
> 
> Ok, understood. You need to keep the system and tests running.
> 
> But IO flushes can take any amount of time. So sounds like timeouts are
> too short, or should not exists at all. Also, systems are doing too much
> parallel work or are actually short on RAM if slow IO to disk starts
> failing things.

I'm far from happy with where we're at with the autobuilder intermittent failures. 
Along with the bug triage team, I've spent the best part of a couple of years trying
to get to grips with them. The sync work around does help to a degree and that is in
itself helpful and reduces the load on build failure handling.

We do already have a ton of memory in the workers. We're reluctant to reduce the 
parallelism numbers as in general things work well, we 'just' see a single failure
in every other build (where the builds report 2 million test results over 4 arches 
each in 32+64 bit, different init systems and so on).

The "timeouts" are things like kernel rcu failures in guests, bitbake event test
issues (where a 5s timeout increased to over 60s doesn't help). Another example is
valgrind's ptests. Where possible we're trying to rewrite not to have the timeouts.

I'd love some help in getting to the bottom of the issues but we have already 
tried the simpler stuff sadly :(. The issues are very very rare but annoying when
they do happen.

Cheers,

Richard


