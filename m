Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.1230.1628228011801164856
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Aug 2021 22:33:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZfvLbSz7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id j2so9467912wrx.9
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Aug 2021 22:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=S47TBsnUm20lkOCIvLNPt9JFZpdl4rl04gabEAVgoA8=;
        b=ZfvLbSz7FKKlvSavuFg3cyxdQiV+DDAZ2TCKboCNTWH6SByQ9uZyLgChLZlm/opXn2
         Uid8Dbs/FtRtbjlWBXCNBo1Q6+vpO95dveBAFPGIxRHaA/lZGjlaSRnV6nNspUGkBE8R
         keus4JoVtBCcUXmFlqgRsEFe5u+UNnmAK2KcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=S47TBsnUm20lkOCIvLNPt9JFZpdl4rl04gabEAVgoA8=;
        b=T9T+skPibr1f5ody+voiPf13QPM6iwa1ajfCpniuIfVbHvRpPy2xae1ugfwLkACwJE
         Y9aBC7FXTXSpgpVwwcZMA3+lXi4QXsIZRUYQqhtWQ6t1SernQXrukXc+SKgVNBCNu5f5
         E8a9RUCWJSP+3maH0GpD+FK7FFj24BBd2U1QW0k4wvuAHEAu456bnvv57xy+kLM6qNhH
         Dobnd0eMrIPkIKFkrJCxwEf0qx2zdxo8BjHnBz5g/EytBxcstZrgmxxjw1U4k6AKezAG
         KvFbnFu97mU4lq5BGHz7y4nNqWCB/HnpLtzT9p3HKjm9CjRYlNnLwspsBTvfKrQM8ol+
         ri2A==
X-Gm-Message-State: AOAM5337Fcr126pzo5jHZUZkTqeyNKyt/CNV3hjFdXLF52EiNDg7snmC
	iqI+ylCA0kHGW9W3nQ3MR2BwxA==
X-Google-Smtp-Source: ABdhPJw12Ll2AXXVsZucGIF0fKgPBTXz8yK38xcCKeFQkGMXm/PB9yjfxgSqWgb9cMdsmCp7N0rJVw==
X-Received: by 2002:a05:6000:12ce:: with SMTP id l14mr8952158wrx.41.1628228010060;
        Thu, 05 Aug 2021 22:33:30 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:9b1a:3a88:2016:c4d0? ([2001:8b0:aba:5f3c:9b1a:3a88:2016:c4d0])
        by smtp.gmail.com with ESMTPSA id p15sm7283638wmi.29.2021.08.05.22.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 22:33:29 -0700 (PDT)
Message-ID: <040fe5d8cd3914e7c19fc70ae6d18894b07f8073.camel@linuxfoundation.org>
Subject: Re: [OE-core] [master][PATCH 0/4] Reproducible LTO builds
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Tony Battersby <tonyb@cybernetics.com>, Randy MacLeod
	 <randy.macleod@windriver.com>, openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Date: Fri, 06 Aug 2021 06:33:26 +0100
In-Reply-To: <a0c4c23d-7437-ce14-066f-0f7f6929a987@cybernetics.com>
References: <2efeecad-7ee5-126c-9271-d69fc3428c38@cybernetics.com>
	 <447d4fa9-b915-4e59-0ecc-64d41c6ceee6@windriver.com>
	 <22d7a9866471f53ea283caa1578fbf0b48d5e113.camel@linuxfoundation.org>
	 <a0c4c23d-7437-ce14-066f-0f7f6929a987@cybernetics.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-08-05 at 17:54 -0400, Tony Battersby wrote:
> On 8/5/21 6:21 AM, Richard Purdie wrote:
> > On Wed, 2021-08-04 at 20:13 -0400, Randy MacLeod wrote:
> > > On 2021-07-27 9:34 a.m., Tony Battersby wrote:
> > > > Currently, enabling Link Time Optimization via:
> > > > 
> > > > require conf/distro/include/lto.inc
> > > > DISTRO_FEATURES_append = " lto"
> > > > 
> > > > makes the build non-reproducible (as in
> > > > https://reproducible-builds.org/).  This patch set fixes some of the
> > > > problems, but is not yet a complete solution.
> > > > 
> > > > This patch set addresses the following bugs:
> > > > https://bugzilla.yoctoproject.org/show_bug.cgi?id=14481
> > > > https://bugzilla.yoctoproject.org/show_bug.cgi?id=14490
> > > > 
> > > > openembedded-core patches
> > > > 1/4: lto.inc: disable LTO for grub
> > > > 2/4: gcc: Backport patch to make LTO builds more reproducible
> > > > 3/4: bitbake.conf: add DEBUG_PREFIX_MAP to TARGET_LDFLAGS
> > > > 
> > > > openembedded-devel patches
> > > > 4/4: net-snmp: fix QA Issue after LDFLAGS change
> > > > 
> > > > Patch 3 adds DEBUG_PREFIX_MAP to TARGET_LDFLAGS (it was already in
> > > > TARGET_CFLAGS).  This could possibly be done differently, such as by
> > > > removing it from TARGET_CFLAGS and adding it to TOOLCHAIN_OPTIONS,
> > > > TARGET_CC_ARCH, or TUNE_CCARGS, but I haven't tested those.  Let me know
> > > > if there is a better/preferred way to do it.
> > > > 
> > > > The TARGET_LDFLAGS change broke net-snmp from meta-networking, so I have
> > > > included a patch to fix that.  Other packages might have been broken as
> > > > well, although I haven't found any others.
> > > > 
> > > > With all these patches, there are still many shared libraries in /lib
> > > > and /usr/lib that are still not reproducible with LTO enabled because
> > > > x86_64-poky-linux-libtool filters out the -f*-prefix-map flags added by
> > > > patch 3 when linking shared libraries.  /usr/lib/libbz2.so.1.0.6 from
> > > > the libbz2 package from the bzip2 recipe is a good example.  I do not
> > > > have a patch for that problem.  I will leave that to someone else.
> > > > 
> > > > So this is what we need to achieve reproducible LTO builds:
> > > > *) This patch set
> > > > *) A fix for libtool
> > > > *) Add LTO to reproducible builds testing if appropriate (e.g.
> > > > meta/lib/oeqa/selftest/cases/reproducible.py, CI on Autobuilder)
> > > > *) Fixes for individual packages, if needed
> > > > *) Once everything works, update the documentation again (I previously
> > > > requested a documentation change for this bug, which will eventually
> > > > show up at
> > > > http://docs.yoctoproject.org/test-manual/reproducible-builds.html).
> > > This is certainly a few steps in the right direction with a good outline
> > > of what's next.
> > > 
> > > I suspect that Richard has been busy with other things like overrides
> > > and the update to glibc-2.34.
> > > 
> > > Do you have any suggestions or questions about what we should do
> > > with this patch series Richard?
> > Thanks for the reminder, I've been meaning to queue/test this which I will
> > do. The gcc version has been bumped but I ported the patch forward to it
> > and the patches are in master-next for testing. It is great to see this
> > support moving forward.
> > 
> > Much as it pains me to admit having any libtool knowledge, I may be able to
> > help with that bit. There is an untested patch below which may address that
> > issue, or at least give a good hint on how to do it if it doesn't work. I
> > don't have an environment to test easily right now.
> > 
> > Cheers,
> > 
> > Richard
> 
> I tested your libtool patch in master-next with the bzip2 recipe.  It
> works as intended; libbz2.so.1.0.6 and all the other output files are
> now reproducible with LTO enabled.  I also verified that libtool is
> passing the -f*-prefix-map flags to the link command in log.do_compile
> as intended.
> 
> I also verified that core-image-minimal builds successfully with the
> libtool patch.

Thanks for testing that, sounds like it helps that issue. I'll queue that patch.

Unfortunately even with the ruby fix I queued, we still see reproduciblity
issues with the LDFLAGS change in curl-dev, gettext-ptest, ruby and ruby-dbg 
packages:

https://autobuilder.yoctoproject.org/typhoon/#/builders/115/builds/515/steps/12/logs/stdio

We'll need to resolve those before I can merge the flags change.

Diffoscope output:

https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210805-8jfd55ki/packages/diff-html/

Basically LDFLAGS get encoded into a couple of scripts and the ruby binary.

Cheers,

Richard

