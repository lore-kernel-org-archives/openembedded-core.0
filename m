Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C73F8C3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 13:17:42 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.20712.1747747053728094469
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 06:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=vXiD5//H;
 spf=pass (domain: linaro.org, ip: 209.85.128.54, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so58670715e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 06:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747747052; x=1748351852; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+BjbkIvnHVrmPkO95JUT09krQsRIxlCKj5J4BxGUfLw=;
        b=vXiD5//H7GZDXgJfiU6mmhtfDqFJVRmpl4/eSXnhuXyj3z8kGytqQvAHRPOn8FhtB2
         r2AmYXDtCMKiNktAfE/aS6fSKoNbHJoFWYVPTxSjSGtXYOks/YwNtnI1sF+jGJmrUg6s
         5be//I9WEi6JBOkYErarOepc0ClLXvlEH9hH6H6Dpcc3Wq8nG6rJvHX9KAvQt3babPUU
         klhP1tW4q8l1xhXmSWM4X25/X7+QmcQLX9/NfMWTtQloWSUENYWPlaI0/UpQFJd7dvmf
         eU5fzTJGXfjpOOnIyb/jBxfU994kXd2pfqdQ0Ou2R35sQgCM3C90OoBJoWBsNQ19FGX6
         OQ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747747052; x=1748351852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BjbkIvnHVrmPkO95JUT09krQsRIxlCKj5J4BxGUfLw=;
        b=izmvQiIsUa1fPx+QzxvBVjmfZsRwKXFDq2lwt4qk7/vzpcmfQsh+QVoNL1R42w61C7
         TYMFiWi6CAful4n22NxOtRPT7ht35aU7PhLI5kDq+iJDfofn2xJMWGstHv+E7Hq5jYgM
         Qjxj29gmHE16KSew+U3RfuBpjH0HC0Fam6jpwX9TXxMv4e+JkTjAssbmWkEC/PoLMKeb
         np6EdWAlVQldth6O8FWnfFqEorO57G7jYw1ygRqQHVjHYCxjPTYLW83GqLylkSkTeU/6
         wohQmHS3UC7byUsroy92AaSd4dtFA6sWE67SwoGywfPfhHYMCOtfRFG5oqP+EiM7EKLI
         iBww==
X-Gm-Message-State: AOJu0Yz+RSiCGGU3fM+ta+545NWA9Syq8QSfsIQdv7Vx0/A5CWDJUBM7
	Pbbw2wf9kbcCqtIJgW/Byd9qLAzeaUqd4n7M4qawZi9XkHKr4PO+k6es8XZpk6z4YcQ=
X-Gm-Gg: ASbGncvFZ+QBxNprc75EcVVgJ32HJjTzombGT/NaoV3cfEhrCGD9yqbFH28TuXUx7/4
	zk8u7O4cu9dQ5d5bSj5OVbUZdw2AT0hnn9Qzegs1Edc2bJjUINcpCW2SHjCAVg5s6r7NQwnlLyS
	mPzTkLHbM9mtP7zMSDkm9qEd3q8Omu1M/R9FtTrugH5ws7Mesk1ud+IEetNj74zPFklm6xjonCL
	A4qF4eMTIwBinAA9Qm1zOF/f1D9y/D5bFDz8YDZKeJfk5Djy23SPswSRJDOfq630jxijxVAsZ+Z
	KfAdMdzEFApHRNVYBXj/rPKYCZbqPCNSQARrZzXaDucNNFp7
X-Google-Smtp-Source: AGHT+IGAnsYXJixKbwVgBnNKO61x/hredaD2xI1kAfbWsUDOHIWuJLNAb56z8d/fuJ4R/rzKuqF49Q==
X-Received: by 2002:a05:600c:3e18:b0:440:6852:5b31 with SMTP id 5b1f17b1804b1-44302ae93ffmr169658895e9.10.1747747052043;
        Tue, 20 May 2025 06:17:32 -0700 (PDT)
Received: from nuoska ([62.48.241.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f3dd94d1sm30863105e9.34.2025.05.20.06.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 06:17:31 -0700 (PDT)
Date: Tue, 20 May 2025 14:17:29 +0100
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2] oeqa selftest: read qemu options from
 TEST_RUNQEMUPARAMS
Message-ID: <aCyA6YrqUnlgEgPX@nuoska>
References: <20250423083634.137495-1-mikko.rapeli@linaro.org>
 <56ae50dcab799e2db27c7e423c5533546fd6ab2b.camel@linuxfoundation.org>
 <aCxgnSnv92n8b30e@nuoska>
 <2421d5a01486a5b15d056d480cb12026aa5024ac.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2421d5a01486a5b15d056d480cb12026aa5024ac.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 13:17:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216910

Hi,

On Tue, May 20, 2025 at 12:10:43PM +0100, Richard Purdie wrote:
> On Tue, 2025-05-20 at 11:59 +0100, Mikko Rapeli wrote:
> > On Tue, May 20, 2025 at 10:30:04AM +0100, Richard Purdie wrote:
> > > 
> > > This has sat in master-next for a long time, mostly because I've been
> > > putting off trying to write down my thoughts on this.
> > > 
> > > The challenge with this change is that it makes slirp work in some
> > > cases but not others. We've been very clear up to now that tap/tun is
> > > our preferred way to run the tests. If this merges, people will start
> > > to expect slirp to become a first class citizen and file bugs against
> > > the tests which don't use it, or submit patches with only the slirp
> > > tests passing and them complain that we shouldn't have the other tests.
> > > 
> > > I'm very wary of having "two ways" of doing things, particularly as one
> > > half always ends up with subtle breakage. I'm also wary of adding
> > > feature support by stealth, which this has potential to become.
> > > 
> > > That said, I can totally understand why running the tests which can use
> > > slirp can be useful, particularly as there are some environments where
> > > tun/tap isn't possible. This means I am torn on the patch despite my
> > > reservations.
> > > 
> > > There also isn't any testing data included. Did you run all the tests
> > > you are patching and are confirming they work with slirp or was this
> > > just a way to pass the option (and potentially other options) to all
> > > tests? Do we know how many tests work with slirp and how many don't?
> > 
> > I would like to run selftests on genericarm64 target machine and aarch64 build
> > host. They don't pass yet. This patch is one of the things I would need,
> > currently, to work on the other problems. A full series is a lot of work
> > and I don't think I'm up to it atm, but maybe over time...
> 
> The autobuilder does run oe-selftest on aarch64 build hosts but it uses
> qemuarm64 for MACHINE. I'd hope there isn't that much difference
> between qemuarm64 and genericarm64 but that should be the only
> difference in your config besides slirp vs tun/tap.

There are a few more but really, genericarm64 should IMO replace qemuarm64
since both run qemu and former also runs on various other boards and is
a good start for developing products on arm64/aarch64.

The fixes are trivial once I figure out which approaches are acceptable to you
and Ross.

For example qemu testing requires a firmware from u-boot, but genericarm64
on purpose doesn't define virtual/bootloader in machine config. Should the
tests define u-boot dependency in local.conf or bitbake command line for
genericarm64 then?

Practically this could be a config snippet added to local.conf after
genericarm64 defaults, like the clearing of SANITY_TESTED_DISTROS.

> > > From a practicality standpoint, I do have an issue with the
> > > implementation since it duplicates the image name for the get_bb_var
> > > and the runqemu call and I'm not sure I like that implementation
> > > detail. That is a solvable problem but the decision above on whether we
> > > want to do this at all remains.
> > 
> > I can fix this if needed. Some tests used variable for image name
> > while many did not.
> 
> It may be better to add something into the runqemu function itself to
> query the variable but I didn't look into the code implications of
> that.

Good idea, I'll try this approach.

> > I'm relatively new to selftests and the environments and configs
> > they run.
> > 
> > slirp and support for it like in this patch is one thing, but there
> > are others.
> > 
> > Which build machine hosts and distributions are supported?
> > I've heard that x86_64 and aarch64 hosts are used with the supported
> > set of distros.
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/workers gives an idea
> of which host distros and architectures we have in the autobuilder.
> "arm" in the name means it is an aarch64 system so those are all
> ubuntus of three different versions.

And those are subset of SANITY_TESTED_DISTROS in poky.

> > Then the config inside of distros is where tun/tap and slirp are the alternatives.
> > Yocto CI runs with tun/tap, but this may be harder to setup for us developers
> > contributing changes to classes and need to adapt the tests. Thus slirp support
> > is nice to have. There was something more regards to graphics support and
> > qemu, maybe even a HW dependency, at least on x86_64.
> 
> x86_64 tries to do GL passthrough on some distros. I don't think we
> have that enabled for arm. The tests should get skipped if not
> supported and include detection code.

Yes, the qemu GL graphics and screenshot testcase.

> > Then build target machines. I presume only machines from oe-core are
> > supported and meta-yocto-bsp machines like genericarm64 not. What about
> > fixing issues when oe-selftests are run with genericarm64 machine config?
> 
> Correct, we only test using MACHINEs from those layers and only under
> qemu. There is no reason genericarm64 shouldn't work, it just hasn't
> been tested/fixed/enabled.

Yes, I can work on this.

> > Usually there are just a few simple things to fix, like dependencies and
> > configs to select. Often these can be the same as on qemuarm64 since
> > qemu is the target to boot images in tests.
> 
> > Target distro then are AFAIK poky and poky-altcfg so custom distros
> > will likely break a number of things which can not be fixed upstream.
> 
> The tests can check the config and skip if some config is not
> supported.

There are some assumptions which are true on qemu but not on other
machines and which then impact for example the qemu config (which
backend block device emulation to use) and which drivers need to
be compiled into the kernel built-in, or if boot with initrd is needed
to load modules and to find the real rootfs.

Cheers,

-Mikko

