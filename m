Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4FC3C4332F
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 17:29:41 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.9387.1667323771333009781
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 10:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NiuKzbkN;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id bk15so21073194wrb.13
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 10:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n74tII4KW21ENJIroenB141B9HNdI1r88616LAuo3RQ=;
        b=NiuKzbkNcQnoSAryHvsQDFjE8JzNqbE8GcXBz0fDHa3eob/Dan36+BQsXUiENwrbA5
         Zgf5EO1h1/uu3Oo0pl/FG5eVyJhcFq7vez1Rg3xBofkaN2YILsUZZSLIIhIrjFB1ukii
         kWGANYwqqaMKQ+69j8sCuLcM4+1m3rQQqLo2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n74tII4KW21ENJIroenB141B9HNdI1r88616LAuo3RQ=;
        b=nOB3J0EcaF/m/xCUR9xI4K4UUqFwS4wdckTw7hBgDbl6U3Kf37JmcFVjOFjms8BuS7
         NZtYuypwjmQa7SE32KwbbFpgY+u0tM19a/IjW6y5ip6VJY1szkWozeRNJJz8EJoYYvX3
         3ayKQQYVxZweT223rB5l3edGBY6/LqCGGuLAtr6W+BrAfwqXnAIQmWHiLi8fx9ki5WeI
         Xd8ODEvSqmhsnRY/IHI/5FN/P+QIZxgAt68O6k5d1cjJITHmFW46MfU/pZJYv3atuc1/
         QDnxlA9GK2X5UO03eE5Iy1R6MZjHXFe8oM+AzNMs7IwcxmmZjdPPFAkTbEaouk6GQ28G
         ZHGQ==
X-Gm-Message-State: ACrzQf0YQiY4zlnnjJllP0atDHQAiPwIlPcHeedsHNq5zMauvOQp5Mvh
	VGiCmInNwutFbF8agVb7+xVPbg==
X-Google-Smtp-Source: AMsMyM6Tied5+rbix5w3C2sW4Suwvm/vuqeIUzrBmNGS/5pgGEu59FwRglGZrgLQ3KL87ANCo380WQ==
X-Received: by 2002:a05:6000:614:b0:236:747d:47d5 with SMTP id bn20-20020a056000061400b00236747d47d5mr12453189wrb.457.1667323769638;
        Tue, 01 Nov 2022 10:29:29 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7f2d:d8cb:afb2:98f4? ([2001:8b0:aba:5f3c:7f2d:d8cb:afb2:98f4])
        by smtp.gmail.com with ESMTPSA id m62-20020a1c2641000000b003cf47556f21sm11060637wmm.2.2022.11.01.10.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 10:29:28 -0700 (PDT)
Message-ID: <42bd04f74f012c2bf921c486087a6659c9534756.camel@linuxfoundation.org>
Subject: Re: [PATCH 6/6] u-boot: Rework signing to remove interdependencies
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sean Anderson <sean.anderson@seco.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	openembedded-core@lists.openembedded.org, Luca Ceresoli
	 <luca.ceresoli@bootlin.com>
Date: Tue, 01 Nov 2022 17:29:26 +0000
In-Reply-To: <3b106bb0-ecdb-efb1-1a54-7ad6ae345852@seco.com>
References: <20221021233726.1751124-1-sean.anderson@seco.com>
	 <20221021233726.1751124-7-sean.anderson@seco.com>
	 <f8039bfc391404e83464c6894ce3ebf5496f1da1.camel@linuxfoundation.org>
	 <dbd14d02-ad22-1036-d659-f71eb09a0e83@seco.com>
	 <514b492351ff6be577b80881adbc6b508fc04071.camel@linuxfoundation.org>
	 <b0708cba-a038-7031-58b0-c08ef0fe6625@seco.com>
	 <1c053ef1a0c03728cb09f5259a1d52adc631460c.camel@linuxfoundation.org>
	 <cf9846db-f142-e8bd-3fbc-51a430b5684d@seco.com>
	 <3720dadc9a760c068eed340cd7877c92b6ffd482.camel@linuxfoundation.org>
	 <3b106bb0-ecdb-efb1-1a54-7ad6ae345852@seco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 17:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172372

On Tue, 2022-11-01 at 12:14 -0400, Sean Anderson wrote:
> On 10/28/22 11:37, Richard Purdie wrote:
> > On Fri, 2022-10-28 at 11:29 -0400, Sean Anderson wrote:
> > > On 10/28/22 11:09, Richard Purdie wrote:
> > > > On Wed, 2022-10-26 at 13:21 -0400, Sean Anderson wrote:
> > > > > As noted in the cover letter, I ran
> > > > >=20
> > > > > oe-selftest -r fitimage.FitImageTests
> > > >=20
> > > > Ok, good. That at least means you were only running one class of te=
sts.
> > > > I was worried you were running all of them!
> > > >=20
> > > > > I also tried using -j$(nproc), but I saw no increase in paralleli=
sm
> > > > > outside of the usual for bitbake. This was especially noticable f=
or
> > > > > do_rootfs, which is single-threaded.
> > > >=20
> > > > Sadly the parallelism works on a per test class basis so it wouldn'=
t
> > > > help in this case. There are only small marginal gains from running
> > > > tests in individual build directories so we don't do that.
> > >=20
> > > I estimate it could have saved me 2-3 minutes every build, since it c=
ould
> > > have parallelized the root filesystem stuff.
> >=20
> > On an initial run, it could have also ended up building a lot of pieces
> > in parallel needlessly so it is all a bit of a compromise. It might be
> > worth looking into whether we can make that an option, off by default.
> >=20
> > > > > This is ommitted above, but I *had* to use -j1 in order to avoid
> > > > > manually wiping out my existing build directory each time (and in=
stead
> > > > > ending up with dozens of pid-named directories). This is document=
ed
> > > > > nowhere, and I found it in some old IRC logs.
> > > >=20
> > > > Parallelism using differently named build directories is an
> > > > implementation detail, not something which the -j option implies.I
> > > > guess you were also using --keep-builddir
> > >=20
> > > Failing builds don't remove the test directory so you can inspect the=
 build
> > > output. As you might imagine, I had a lot of failing builds.
> >=20
> > I'm very familiar with that myself, yes.
> >=20
> > We did once used to reuse the build directory, that challenge is we
> > have no idea what the user has done in there prior to the test so it
> > potentially makes the test results potentially incorrect.
> >=20
> > > > > > We haven't really had anyone try and optimise the tests either,=
 I'm
> > > > > > sure there will be things in there which can help. Please don't=
 let the
> > > > > > speed put you off trying to improve things and extend our cover=
age!
> > > > >=20
> > > > > The poor speed of these self tests (and of everything related to =
the
> > > > > yocto project in general) makes this project frustrating to contr=
ibute
> > > > > to. It took me around 2 days to go from my prototype to this seri=
es,
> > > > > most of which was spent waiting for tests to compile and losing w=
hatever
> > > > > train of thought I had. I probably went through perhaps 20 revisi=
ons. If
> > > > > I was working on e.g. U-Boot, I could have made 20 revisions in 2=
 hours,
> > > > > as it takes around 15 seconds to recompile it and run the full un=
it test
> > > > > suite.
> > > > >=20
> > > > > On the topic of these specific tests, part of the problem is that
> > > > > do_rootfs is a bottleneck which takes around 45-60s on my system.=
 Every
> > > > > test which modifies something in the rootfs incurs this overhead.
> > > >=20
> > > > For better or worse we've 'a few' more moving pieces than U-Boot.
> > > >=20
> > > > Building a root filesystem from packages is a non-trivial task, tak=
ing
> > > > under a minute is in some ways pretty good already. The only other
> > > > thing we could do is incremental rootfs construction where it would
> > > > add/remove changed packages. I'd worry that the result may not alwa=
ys
> > > > be equal to a build from scratch and it might cause weird and
> > > > interesting reproducibility problems (particularly when you conside=
r
> > > > things like postinsts).
> > > >=20
> > > > I would love to improve our development "iteration" time but I'm
> > > > struggling to see where we could get the speed gains from :(. Open =
to
> > > > other ideas...
> > >=20
> > > We don't have to build a full root filesystem. All of these tests jus=
t want
> > > e.g. an initramfs. An empty (or one file) filesystem would work just =
as well.
> > > If you still want to boot, you can make a busybox filesystem.
> >=20
> > Could we update the test just to use an initramfs then?
> >=20
> > I'm definitely a fan of keeping the tests as simple as we can whilst
> > still testing what we need to test.
>=20
> I can look into this, but I'd prefer to do it as a follow-up to this seri=
es.
>=20
> I'll probably send a v2 later this week a fleshed-out commit message for =
patch
> 5/6 (and with it possibly all those variables moved to a separate bbclass=
 to
> make it easier for other classes to create signed FITs).

The series did already merge so anything would be incremental
improvements at this point!

Cheers,

Richard

