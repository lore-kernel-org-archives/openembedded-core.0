Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 379F4EE49A0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 13:25:07 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.11357.1692797097045417397
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 06:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=CnrGS5RW;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-4ff9b389677so8579518e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 06:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692797095; x=1693401895;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1lq7BdZnDLqCBUeCZosWkH1yWjZ4j+NAV6XuXXDVaWw=;
        b=CnrGS5RWWRacx5/gIMKpmb/KeQQE6eHzifUoodAFQuSIBNGS4cWIEdWhZKNArEKUar
         Xe711/pqJZMaaB2pKFVwnZ7zfY1jahktNXmGcSO7o8hSygzUbd4/ujwhSkmOJxttlCw+
         MKXktl4FS3I5KVqul+YjF0COIqnMbMLjhsD5QJGbo1DNLOuck3NcG2jYdb5wQYx16GGD
         LSVY7nLo8asZ+SoxbYzrSUiLF02xVh6B5RUlhgQ4meFTVB0eznRbBZVZ7InJpSrZ+Fty
         kGQNtJQKz+lEPCKVNzoXAr8N5awYXJTrxbtNJ9n3O/KQsGZzOjDD9Gjd1fHtbQTL21nG
         pMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692797095; x=1693401895;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1lq7BdZnDLqCBUeCZosWkH1yWjZ4j+NAV6XuXXDVaWw=;
        b=aSVQozYfALPEku6s0HyTL6cZl9jMib5Q8eJeoIrVVaaWml1ZAqT/oxQ597lp6e8Lqe
         FYpyqVwA9P0uU5k+tMklGStqze1aSQyHiwJn5guFXXPq78+v778XZnb4ap/p/sq7rsef
         i2w8lkSA2XfxUBrb7t9tq88wyt21jD0b8uWRitTyodeHeTDxDVgeCSn6Cy+1mm9UJLr8
         CZawlVgna8Lr7CzsbuL98MfpeKqAPB9yF5mXwztd+YDJyOWjRqfZqMPK9t60fpB9Bfv0
         rV/OFfJBrMbi2pxbMdWWIae4MWQz0oRJmSzqJyBEZDp9ggjIBnhHdfsXluHjInC8pxha
         6veg==
X-Gm-Message-State: AOJu0YxN4RXlpSCiJQ7SBQ0y1hzWERo1utDzgZVvnBM0ZQeyxRn0lUKM
	MT7DzHdIcYRAi2ig5Rfm9MRfSRmCp93zTcytuPs=
X-Google-Smtp-Source: AGHT+IF+7JdgEFUK0qBsZQdy3YIh/KfvmAdzTxbbPTW5U+ZxLqXFBUvhd1xpR7/V4QjGewtXcGRnEc5YEz+TTYhmU+Y=
X-Received: by 2002:ac2:4c4f:0:b0:4fe:62f:35eb with SMTP id
 o15-20020ac24c4f000000b004fe062f35ebmr11227701lfk.20.1692797095016; Wed, 23
 Aug 2023 06:24:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
 <20230823061025.3952909-2-mikko.rapeli@linaro.org> <CAMKF1spz74E1N6tf=FzwrWwnHr0Gddo2J4pY8NdxW6h127=oSA@mail.gmail.com>
 <ZOW1tEl+PiOK09l/@nuoska> <44b46fe9ef454e80895ce2b0ecbdac1bea9784bb.camel@linuxfoundation.org>
 <ZOXVyxiqDDnjCp61@nuoska> <CANNYZj_q-DgNoGL6JLP+XQv-3+2QFomNTYeUY9WF8FcpfCXgNQ@mail.gmail.com>
 <177DFD85A9F91D1D.28529@lists.openembedded.org> <ZOYDPQgCfD8PyWmD@nuoska>
In-Reply-To: <ZOYDPQgCfD8PyWmD@nuoska>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 23 Aug 2023 15:24:43 +0200
Message-ID: <CANNYZj_q1Y=78wBmVp20Rb6166FvtvzYMyo8eoQQjoGGgHX3rA@mail.gmail.com>
Subject: Re: openssh ptest banner failure (was Re: [OE-core] [PATCH v2 2/9]
 testimage.bbclass: detect slirp from TEST_RUNQEMUPARAMS )
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj <raj.khem@gmail.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 13:25:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186576

I've just seen this too. I think to trigger this you need to run the
test via bitbake -c testimage rather than directly over console - the
output is then piped over ssh, and something goes wrong due to the
large volume of banner data perhaps? Would *really* appreciate if you
can get to the bottom of it.

Alex

On Wed, 23 Aug 2023 at 15:01, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
>
> Hi,
>
> On Wed, Aug 23, 2023 at 01:49:39PM +0300, Mikko Rapeli via lists.openembedded.org wrote:
> > The tests passed with one warning, which I'll try to check:
> >
> > WARNING: core-image-ptest-openssh-1.0-r0 do_testimage: There were failing ptests.
> > Traceback (most recent call last):
> >   File "/home/builder/src/poky/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
> >     return func(*args, **kwargs)
> >   File "/home/builder/src/poky/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
> >     return func(*args, **kwargs)
> >   File "/home/builder/src/poky/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
> >     return func(*args, **kwargs)
> >   File "/home/builder/src/poky/meta/lib/oeqa/runtime/cases/ptest.py", line 27, in test_ptestrunner_expectfail
> >     self.do_ptestrunner()
> >   File "/home/builder/src/poky/meta/lib/oeqa/runtime/cases/ptest.py", line 120, in do_ptestrunner
> >     self.fail(failmsg)
> > AssertionError:
> > Failed ptests:
> > {'openssh': ['banner']}
>
> Has this openssh banner test on x86_64 been failing on yocto autobuilders?
>
> Log tmp/work/qemux86_64-poky-linux/core-image-ptest-openssh/1.0/temp/log.do_testimage
> shows:
>
> PASS: environment passing
> run test transfer.sh ...
> PASS: transfer data
> run test banner.sh ...
> test banner: missing banner file
> test banner: size 0
> test banner: size 10
> test banner: size 100
> test banner: size 1000
> cmp: EOF on /usr/lib/openssh/ptest/regress/banner.in
> banner size 1000 mismatch
> test banner: size 10000
> test banner: size 100000
> test banner: suppress banner (-q)
> FAIL:  banner
> make: *** [Makefile:223: t-exec] Error 1
>
> On manual execution this passes:
>
> $ runqemu slirp nographic novga core-image-ptest-openssh
> ...
> root@qemux86-64:~# ptest-runner
> START: ptest-runner
> 2023-08-23T12:04
> BEGIN: /usr/lib/openssh/ptest
> ...
> PASS: transfer data
> run test banner.sh ...
> test banner: missing banner file
> test banner: size 0
> test banner: size 10
> test banner: size 100
> test banner: size 1000
> test banner: size 10000
> test banner: size 100000
> test banner: suppress banner (-q)
> PASS: banner
> ...
>
> client rekey tests are still running.
>
> Cheers,
>
> -Mikko

