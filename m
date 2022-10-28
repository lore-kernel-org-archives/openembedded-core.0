Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED4D5C38A02
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 15:10:06 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.595.1666969797853742760
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Oct 2022 08:09:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RYVoFIqp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id bg9-20020a05600c3c8900b003bf249616b0so4027086wmb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 08:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SDmK/yox9F8yrujiWpD6HCwme6a8Ym/oKG/SPPbLQ80=;
        b=RYVoFIqpSJMZPbtcMl3CFEcX71dBI9ovbK6BfynNI7J402oIssey8FaJeI8z9SBi/R
         ITrKkV4y3G0EUvmarPNBbPhoY/KWCNMdPrfIm5AJEg1G2U+tW5ff1dZZs9Br2BD0oRv/
         EZLrI5JYfYt4BtQpKdWX9LJxr5mMi55SvdqB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SDmK/yox9F8yrujiWpD6HCwme6a8Ym/oKG/SPPbLQ80=;
        b=oM81XKDqC82ejQrVOfAflc/Z3LWV6KPXF1lMdpYY2SYP50T0HXnkH8CpHabhwLJB3b
         ef1OIsKVPdS2RkIp5fSpPSEbIArEYdGTjpMLboLmL+sKZf1RNDbi+DGMKNkUiaDKuBWR
         gt0ggLAwgBTfKhbwDMam1816j5TsH5qMQX80AHqkfcbS2/JuX+93fSRnX4ZonhGqoPf9
         01gCKTP+2ej5NmkTRoXENKDDTPBwKxMdVhMBRspmJ1MfjIBWkBABlaL9XukLS3ua1l06
         vp5lA7QxafXtdUL6oPPY7aLi4jApQl644gqNXIFWuKBhoaCG9BnDIhRdqMAwYeLtujsj
         WlkA==
X-Gm-Message-State: ACrzQf2FnqNRKkYEY2Lp6fe8MkKrIippZBHgKyhxRql0jV2qjdA13e9+
	Ij0G6C1aFGKUrLNlayRiKCvhmQ==
X-Google-Smtp-Source: AMsMyM61Ft4tIXL6Dg/Zr7sdl/zq48gJBM/yerPdU5P8G01CMiUfeFOGKAi9aUQ2lGRH9y6YH9xYyA==
X-Received: by 2002:a05:600c:2b94:b0:3c6:f941:a26f with SMTP id j20-20020a05600c2b9400b003c6f941a26fmr9761921wmc.8.1666969796164;
        Fri, 28 Oct 2022 08:09:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a0a9:5e25:6ede:d416? ([2001:8b0:aba:5f3c:a0a9:5e25:6ede:d416])
        by smtp.gmail.com with ESMTPSA id d5-20020a05600c34c500b003cf568a736csm3659446wmq.20.2022.10.28.08.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 08:09:55 -0700 (PDT)
Message-ID: <1c053ef1a0c03728cb09f5259a1d52adc631460c.camel@linuxfoundation.org>
Subject: Re: [PATCH 6/6] u-boot: Rework signing to remove interdependencies
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sean Anderson <sean.anderson@seco.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	openembedded-core@lists.openembedded.org, Luca Ceresoli
	 <luca.ceresoli@bootlin.com>
Date: Fri, 28 Oct 2022 16:09:54 +0100
In-Reply-To: <b0708cba-a038-7031-58b0-c08ef0fe6625@seco.com>
References: <20221021233726.1751124-1-sean.anderson@seco.com>
	 <20221021233726.1751124-7-sean.anderson@seco.com>
	 <f8039bfc391404e83464c6894ce3ebf5496f1da1.camel@linuxfoundation.org>
	 <dbd14d02-ad22-1036-d659-f71eb09a0e83@seco.com>
	 <514b492351ff6be577b80881adbc6b508fc04071.camel@linuxfoundation.org>
	 <b0708cba-a038-7031-58b0-c08ef0fe6625@seco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 15:10:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172257

On Wed, 2022-10-26 at 13:21 -0400, Sean Anderson wrote:
> On 10/26/22 13:00, Richard Purdie wrote:
> > On Wed, 2022-10-26 at 12:49 -0400, Sean Anderson wrote:
> > > On 10/26/22 10:08, Richard Purdie wrote:
> > > > This looks like a pretty nice improvement, I've been worried about =
how
> > > > entangled all this was becoming. Is there anything better we could =
do
> > > > with testing of this code? We rely increasingly on the tests to spo=
t
> > > > regressions and I doubt the testcases we have cover the code
> > > > complexity.
> > >=20
> > > FWIW, I found the test suite to be fairly helpful when debugging this
> > > whole process, if agonizingly slow. I found many bugs in my initial
> > > implementation which were uncovered by the test suites,
> > >=20
> > > The best way to extend the test suite would probably be to have QEMU =
try
> > > to boot using the Linux and U-Boot. This would help cases where all t=
he
> > > artifacts are created correctly but e.g. the wrong U-Boot is packaged=
.
> > > However, I am rather loathe to add more test cases like this, because=
 it
> > > already takes around 10 minutes (with sstate!) to run the tests. This
> > > basically kills the speed of iterative development.
> >=20
> > Out of interest how were you running the tests? Did you look at the
> > parallelism options? Were you just running specific tests or specific
> > suites of tests?
>=20
> As noted in the cover letter, I ran
>=20
> oe-selftest -r fitimage.FitImageTests

Ok, good. That at least means you were only running one class of tests.
I was worried you were running all of them!

> I also tried using -j$(nproc), but I saw no increase in parallelism
> outside of the usual for bitbake. This was especially noticable for
> do_rootfs, which is single-threaded.

Sadly the parallelism works on a per test class basis so it wouldn't
help in this case. There are only small marginal gains from running
tests in individual build directories so we don't do that.

> This is ommitted above, but I *had* to use -j1 in order to avoid
> manually wiping out my existing build directory each time (and instead
> ending up with dozens of pid-named directories). This is documented
> nowhere, and I found it in some old IRC logs.

Parallelism using differently named build directories is an
implementation detail, not something which the -j option implies. I
guess you were also using --keep-builddir and could have used the -B
option with $PID or similar for the same effect. We could document
that?

> > I do think we need something like you describe and adding a linux+uboot
> > approach is something I've wanted to do for a long time. Usually the
> > time is taken on our automated CI rather than impacting users, unless
> > they're working in that area at which point the tests are hopefully
> > helpful.
>=20
> Which of course provides no incentive to reduce runtime.

Most of the tests do use our standard tasks so there is as much
incentive to optimise do_rootfs as there would be otherwise :/.

> > We haven't really had anyone try and optimise the tests either, I'm
> > sure there will be things in there which can help. Please don't let the
> > speed put you off trying to improve things and extend our coverage!
>=20
> The poor speed of these self tests (and of everything related to the
> yocto project in general) makes this project frustrating to contribute
> to. It took me around 2 days to go from my prototype to this series,
> most of which was spent waiting for tests to compile and losing whatever
> train of thought I had. I probably went through perhaps 20 revisions. If
> I was working on e.g. U-Boot, I could have made 20 revisions in 2 hours,
> as it takes around 15 seconds to recompile it and run the full unit test
> suite.
>=20
> On the topic of these specific tests, part of the problem is that
> do_rootfs is a bottleneck which takes around 45-60s on my system. Every
> test which modifies something in the rootfs incurs this overhead.

For better or worse we've 'a few' more moving pieces than U-Boot.

Building a root filesystem from packages is a non-trivial task, taking
under a minute is in some ways pretty good already. The only other
thing we could do is incremental rootfs construction where it would
add/remove changed packages. I'd worry that the result may not always
be equal to a build from scratch and it might cause weird and
interesting reproducibility problems (particularly when you consider
things like postinsts).

I would love to improve our development "iteration" time but I'm
struggling to see where we could get the speed gains from :(. Open to
other ideas...

Cheers,

Richard





