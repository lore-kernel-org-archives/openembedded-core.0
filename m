Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C687CC433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 16:29:04 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web12.141.1654100941123218316
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 09:29:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mWkZPbPB;
 spf=pass (domain: gmail.com, ip: 209.85.222.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id m68so1703865qkb.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 09:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7iOcEK79L9A/fzO78X9oxDOddsFjOJEjgMrpfpbX1zw=;
        b=mWkZPbPBnAkCfqoHkqKfEATyjoeSGnLF7sjP+TYMxWfe0F4cwjYN7fv5dP+fcVC0GP
         Dt4TuWYjdm/89eS/6zMOYiqtK/ycvCmWdNOV/cVht4L6PW69yRo5kzIsQQ6t5aUVKYUS
         Ohl4kDGw96X44+UTOi9d/eogN/xUYwow4HBfMkgRJIV5GopeOiHDgKPKMWeOZ9RJehe2
         mj8UV+UvfXn6fYulI6++7pXT/1crUqAUB4f89LpQZtbbZLIx6W/MVos3bHmZ82twp0yN
         bEbgrdF2bOqOC4KWCGSvjDoeU9QQPbQ7uDnf3/rFffTlExnQ32nB+QChzUxHmmfsGMaX
         IpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7iOcEK79L9A/fzO78X9oxDOddsFjOJEjgMrpfpbX1zw=;
        b=QigKise36ggMiumbrKjtjaS3vxMSIpXi23VXKk4gtvWgcxDJPfD6U9y2L9BSz8mZkB
         ADYj3zCq34eSyZRKZF+h3AXcYo4sURiaclsUsj9a8sAr3LmkFF4g0Pgb9mtNoBEtbZhW
         cfhTamATKm038gTVTMg9hU8YSpsu2SguufD+e5zHSXL2nHnDpP4Tp2v9P6fm0QNpXmwR
         q1Jj778IJwhnII8QQOghb3NuMOLAE4J6VyNW6Qii+2oLXKgGAyHJu+MuE+9hFUWLo5h/
         mIzzN0FSHGdCJBQeFpjbJcShzGk+t9K3EywvRhUVrPQQqpfqgzGTdpPBfdIiB47MGRGq
         j+/Q==
X-Gm-Message-State: AOAM532zxPFM8ZaaMvLaGzyg0YbNDDkmlyYFbcEowUN0HIIk+JOsFOeO
	CCH63XC3S1kideHnmg5ips9jRGOm5rVuaKIYTGo=
X-Google-Smtp-Source: 
 ABdhPJw24puVZdp0ZxtgEU9RcE8iBOmgx+nmxOXiZrrEBBTwlf+Yrg/mP7CDIOQf+E1+t9Srbk+4aOCH52Rbz2KTVK8=
X-Received: by 2002:a05:620a:1712:b0:6a3:abba:697a with SMTP id
 az18-20020a05620a171200b006a3abba697amr247790qkb.149.1654100940137; Wed, 01
 Jun 2022 09:29:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220525184852.3999906-1-Martin.Jansa@gmail.com>
 <CAOSpxdY=WZZfZNAEYQRyVG_jmE0=0_6xAH9fDCALMDjm=K9k6g@mail.gmail.com>
 <CA+chaQfSE-oiUxdSJxqCT-GjUP_KGA4dOvcD49xPqwez=ohhFg@mail.gmail.com>
 <CAOSpxdYXrnJRdc_NghthSexaq_R10h0=JBTfqPTP3TR7PbwGLA@mail.gmail.com>
 <3aea71febbe02c97dabec307ace0c4389d45d913.camel@linuxfoundation.org>
 <CAOSpxdYO+QJV64ugouK+Yw8M3VNKv=War5MQRo3JfT6EY8uLjQ@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdYO+QJV64ugouK+Yw8M3VNKv=War5MQRo3JfT6EY8uLjQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Jun 2022 09:28:33 -0700
Message-ID: 
 <CAMKF1sqFS=hCZXWPoWYKvzz1OjnSYYqmwe7HkvrF_PH64D3kqg@mail.gmail.com>
Subject: Re: [kirkstone][PATCH 1/2] gcc: Upgrade to 11.3 release
To: Steve Sakoman <steve@sakoman.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 16:29:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166434

does it use objdump from host ?

On Wed, Jun 1, 2022 at 9:21 AM Steve Sakoman <steve@sakoman.com> wrote:
>
> On Wed, Jun 1, 2022 at 6:10 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Wed, 2022-06-01 at 05:29 -1000, Steve Sakoman wrote:
> > > On Wed, Jun 1, 2022 at 12:10 AM Martin Jansa <martin.jansa@gmail.com> wrote:
> > > >
> > > > As discussed on IRC yesterday I've tried to reproduce this failure locally and it works fine with poky master cee443ae75f (last commit in master before the upgrade to 12.1)
> > > > 2022-06-01 09:46:37,051 - oe-selftest - INFO - RESULTS - reproducible.ReproducibleTests.test_reproducible_builds: PASSED (6429.19s)
> > > > and now it passed with kirkstone as well:
> > > >
> > > > poky $ git cherry-pick 44a36caa7c2
> > > > Auto-merging meta/conf/distro/include/maintainers.inc
> > > > [jansa/kirkstone-gcc-11.3 5c6e280eed5] gcc: Upgrade to 11.3 release
> > > > ...
> > > > poky $ oe-selftest -r reproducible 2>&1 | tee log.oe-selftest.reproducible.kirkstone
> > > > 2022-06-01 09:51:31,653 - oe-selftest - INFO - Changing cwd to /OE/build/poky/build
> > > > 2022-06-01 09:51:31,653 - oe-selftest - INFO - Adding layer libraries:
> > > > 2022-06-01 09:51:31,653 - oe-selftest - INFO -  /OE/build/poky/meta-poky/lib
> > > > 2022-06-01 09:51:31,653 - oe-selftest - INFO -  /OE/build/poky/meta/lib
> > > > 2022-06-01 09:51:31,654 - oe-selftest - INFO -  /OE/build/poky/meta-yocto-bsp/lib
> > > > 2022-06-01 09:51:31,654 - oe-selftest - INFO -  /OE/build/poky/meta-selftest/lib
> > > > 2022-06-01 09:51:31,655 - oe-selftest - INFO - Running bitbake -e to test the configuration is valid/parsable
> > > > hint: Using 'master' as the name for the initial branch. This default branch name
> > > > hint: is subject to change. To configure the initial branch name to use in all
> > > > hint: of your new repositories, which will suppress this warning, call:
> > > > hint:
> > > > hint:   git config --global init.defaultBranch <name>
> > > > hint:
> > > > hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
> > > > hint: 'development'. The just-created branch can be renamed via this command:
> > > > hint:
> > > > hint:   git branch -m <name>
> > > > 2022-06-01 09:51:37,091 - oe-selftest - INFO - Adding: "include selftest.inc" in /OE/build/poky/build-st/conf/local.conf
> > > > 2022-06-01 09:51:37,091 - oe-selftest - INFO - Adding: "include bblayers.inc" in bblayers.conf
> > > > 2022-06-01 09:51:37,092 - oe-selftest - INFO - test_diffoscope (reproducible.DiffoscopeTests)
> > > > 2022-06-01 10:08:42,982 - oe-selftest - INFO -  ... ok
> > > > 2022-06-01 10:08:42,983 - oe-selftest - INFO - test_reproducible_builds (reproducible.ReproducibleTests)
> > > > 2022-06-01 10:09:56,114 - oe-selftest - INFO - Building reproducibleA (sstate allowed)...
> > > > ^Ap2022-06-01 11:11:09,785 - oe-selftest - INFO - Building reproducibleB (sstate NOT allowed)...
> > > > 2022-06-01 11:55:00,507 - oe-selftest - INFO - Checking deb packages for differences...
> > > > 2022-06-01 11:55:00,946 - oe-selftest - INFO - Reproducibility summary for deb: same=139 different=0 different_excluded=0 missing=0 total=139
> > > > unused_exclusions=[]
> > > > 2022-06-01 11:55:00,946 - oe-selftest - INFO - Checking ipk packages for differences...
> > > > 2022-06-01 11:55:01,330 - oe-selftest - INFO - Reproducibility summary for ipk: same=139 different=0 different_excluded=0 missing=0 total=139
> > > > unused_exclusions=[]
> > > > 2022-06-01 11:55:01,331 - oe-selftest - INFO - Checking rpm packages for differences...
> > > > 2022-06-01 11:55:01,760 - oe-selftest - INFO - Reproducibility summary for rpm: same=139 different=0 different_excluded=0 missing=0 total=139
> > > > unused_exclusions=[]
> > > > 2022-06-01 11:55:01,760 - oe-selftest - INFO -  ... ok
> > > > 2022-06-01 11:56:29,573 - oe-selftest - INFO - ----------------------------------------------------------------------
> > > > 2022-06-01 11:56:29,573 - oe-selftest - INFO - Ran 2 tests in 7495.224s
> > > > 2022-06-01 11:56:29,573 - oe-selftest - INFO - OK
> > > > 2022-06-01 11:56:31,723 - oe-selftest - INFO - RESULTS:
> > > > 2022-06-01 11:56:31,724 - oe-selftest - INFO - RESULTS - reproducible.DiffoscopeTests.test_diffoscope: PASSED (1025.89s)
> > > > 2022-06-01 11:56:31,724 - oe-selftest - INFO - RESULTS - reproducible.ReproducibleTests.test_reproducible_builds: PASSED (6378.78s)
> > > > 2022-06-01 11:56:31,881 - oe-selftest - INFO - SUMMARY:
> > > > 2022-06-01 11:56:31,881 - oe-selftest - INFO - oe-selftest () - Ran 2 tests in 7495.225s
> > > > 2022-06-01 11:56:31,881 - oe-selftest - INFO - oe-selftest - OK - All required tests passed (successes=2, skipped=0, failures=0, errors=0)
> > > >
> > > > Is it possible that the reproducibility failure was caused by something else included in your run on autobuilder?
> > >
> > > It is quite possible that it is host distro specific, I've seen that
> > > quite often in the past.  Let me know which distro you used for your
> > > test and I'll try the same on the autobuilder.
> >
> > Keep in mind that the test uses sstate to compare against so even that
> > isn't a guarantee of identifying the issue.
> >
> > Did you try the strings comparison I suggested? Do you have the file
> > section tables comparison (diff) I could look at?
>
> Are you referring to the section header info from objdump -h ?
>
> If so I've attached the a/b info, they are quite compact.
>
> Steve

