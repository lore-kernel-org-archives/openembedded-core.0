Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B48ECAAA1
	for <webhook@archiver.kernel.org>; Fri, 28 Oct 2022 15:38:07 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.960.1666971477156375631
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Oct 2022 08:37:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e3yMHAkG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id i5-20020a1c3b05000000b003cf47dcd316so6826159wma.4
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 08:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=v2LtrWYwpZ4R4kJUGbUWVtOdiBYfDfIIfw0zLR4u0Ls=;
        b=e3yMHAkGcKQr68hD2a1zpPVxFUXwLe2Xsi4tPHrzg/1WpJdJZ8vD2yTuUaEh9HcXGB
         AIgB05igpQh2FTdXHjzVFE3o4JG4JXzfe5iz67rZy6jPMAX3fxSwNTlgKFA0hINfJJLw
         Kpess2fowAyXlwianHTP27vC0ZllPErjkvUSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v2LtrWYwpZ4R4kJUGbUWVtOdiBYfDfIIfw0zLR4u0Ls=;
        b=ThbpZKeCkFye+6c+xg1UM+OEKbvAfY8m28PzlZszVXxFoGEovJ2JJngJUALG6UlrgD
         8TkVag7Y86NcTnQ7EpeFZk4G9ruxJqDIyNTaQz5ZiZPigdhczOwo8g2BuZct4EnDE07P
         KhosHJwsHX+X1Woh9gH+tyYvVqiJoMn46W/B3AGzgyqMHS5Fwfo73wBSjA047r2gib/j
         m0PGTpZIJs3IuaMTjWimInur3dkrGjfn6mKJAMbYZBqjCXFUqiFUUd3MZT+u5Jjagfxv
         WainAjjyJp0Q09N6c08TJjvmNeOjiOJpZ2c5/wNdWi38GwVlMvcK1Ku0KQpXGG03MO8z
         ulyw==
X-Gm-Message-State: ACrzQf240nertMLx13l3SkHMxC2WLYDRrrXCbI7S1cT+QSXuZNmGEYKi
	PlCihNxTd99PhravSZuSggSOug==
X-Google-Smtp-Source: AMsMyM6ffckGryS0V1awR1AK62ET3claLLrFH7MD5UXGxG9idDVkGroOzbR58j1BwfkUTEIFkTuqAg==
X-Received: by 2002:a05:600c:2212:b0:3cf:6068:3c40 with SMTP id z18-20020a05600c221200b003cf60683c40mr2103051wml.57.1666971475438;
        Fri, 28 Oct 2022 08:37:55 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a0a9:5e25:6ede:d416? ([2001:8b0:aba:5f3c:a0a9:5e25:6ede:d416])
        by smtp.gmail.com with ESMTPSA id u17-20020a05600c19d100b003a3442f1229sm7965134wmq.29.2022.10.28.08.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 08:37:54 -0700 (PDT)
Message-ID: <3720dadc9a760c068eed340cd7877c92b6ffd482.camel@linuxfoundation.org>
Subject: Re: [PATCH 6/6] u-boot: Rework signing to remove interdependencies
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sean Anderson <sean.anderson@seco.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	openembedded-core@lists.openembedded.org, Luca Ceresoli
	 <luca.ceresoli@bootlin.com>
Date: Fri, 28 Oct 2022 16:37:53 +0100
In-Reply-To: <cf9846db-f142-e8bd-3fbc-51a430b5684d@seco.com>
References: <20221021233726.1751124-1-sean.anderson@seco.com>
	 <20221021233726.1751124-7-sean.anderson@seco.com>
	 <f8039bfc391404e83464c6894ce3ebf5496f1da1.camel@linuxfoundation.org>
	 <dbd14d02-ad22-1036-d659-f71eb09a0e83@seco.com>
	 <514b492351ff6be577b80881adbc6b508fc04071.camel@linuxfoundation.org>
	 <b0708cba-a038-7031-58b0-c08ef0fe6625@seco.com>
	 <1c053ef1a0c03728cb09f5259a1d52adc631460c.camel@linuxfoundation.org>
	 <cf9846db-f142-e8bd-3fbc-51a430b5684d@seco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Oct 2022 15:38:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172260

On Fri, 2022-10-28 at 11:29 -0400, Sean Anderson wrote:
> On 10/28/22 11:09, Richard Purdie wrote:
> > On Wed, 2022-10-26 at 13:21 -0400, Sean Anderson wrote:
> > > As noted in the cover letter, I ran
> > >=20
> > > oe-selftest -r fitimage.FitImageTests
> >=20
> > Ok, good. That at least means you were only running one class of tests.
> > I was worried you were running all of them!
> >=20
> > > I also tried using -j$(nproc), but I saw no increase in parallelism
> > > outside of the usual for bitbake. This was especially noticable for
> > > do_rootfs, which is single-threaded.
> >=20
> > Sadly the parallelism works on a per test class basis so it wouldn't
> > help in this case. There are only small marginal gains from running
> > tests in individual build directories so we don't do that.
>=20
> I estimate it could have saved me 2-3 minutes every build, since it could
> have parallelized the root filesystem stuff.

On an initial run, it could have also ended up building a lot of pieces
in parallel needlessly so it is all a bit of a compromise. It might be
worth looking into whether we can make that an option, off by default.

> > > This is ommitted above, but I *had* to use -j1 in order to avoid
> > > manually wiping out my existing build directory each time (and instea=
d
> > > ending up with dozens of pid-named directories). This is documented
> > > nowhere, and I found it in some old IRC logs.
> >=20
> > Parallelism using differently named build directories is an
> > implementation detail, not something which the -j option implies.I
> > guess you were also using --keep-builddir
>=20
> Failing builds don't remove the test directory so you can inspect the bui=
ld
> output. As you might imagine, I had a lot of failing builds.

I'm very familiar with that myself, yes.

We did once used to reuse the build directory, that challenge is we
have no idea what the user has done in there prior to the test so it
potentially makes the test results potentially incorrect.

> > > > We haven't really had anyone try and optimise the tests either, I'm
> > > > sure there will be things in there which can help. Please don't let=
 the
> > > > speed put you off trying to improve things and extend our coverage!
> > >=20
> > > The poor speed of these self tests (and of everything related to the
> > > yocto project in general) makes this project frustrating to contribut=
e
> > > to. It took me around 2 days to go from my prototype to this series,
> > > most of which was spent waiting for tests to compile and losing whate=
ver
> > > train of thought I had. I probably went through perhaps 20 revisions.=
 If
> > > I was working on e.g. U-Boot, I could have made 20 revisions in 2 hou=
rs,
> > > as it takes around 15 seconds to recompile it and run the full unit t=
est
> > > suite.
> > >=20
> > > On the topic of these specific tests, part of the problem is that
> > > do_rootfs is a bottleneck which takes around 45-60s on my system. Eve=
ry
> > > test which modifies something in the rootfs incurs this overhead.
> >=20
> > For better or worse we've 'a few' more moving pieces than U-Boot.
> >=20
> > Building a root filesystem from packages is a non-trivial task, taking
> > under a minute is in some ways pretty good already. The only other
> > thing we could do is incremental rootfs construction where it would
> > add/remove changed packages. I'd worry that the result may not always
> > be equal to a build from scratch and it might cause weird and
> > interesting reproducibility problems (particularly when you consider
> > things like postinsts).
> >=20
> > I would love to improve our development "iteration" time but I'm
> > struggling to see where we could get the speed gains from :(. Open to
> > other ideas...
>=20
> We don't have to build a full root filesystem. All of these tests just wa=
nt
> e.g. an initramfs. An empty (or one file) filesystem would work just as w=
ell.
> If you still want to boot, you can make a busybox filesystem.

Could we update the test just to use an initramfs then?

I'm definitely a fan of keeping the tests as simple as we can whilst
still testing what we need to test.

Cheers,

Richard

