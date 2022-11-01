Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F07D6C433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 17:44:11 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.9621.1667324643165479040
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 10:44:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IBTaGwhW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id z14so21144308wrn.7
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 10:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wgzgdAW3r/kT8hbBHSE7xNQx6KDfEmQ8K6p5leYpbKo=;
        b=IBTaGwhWlHFVmRKb2faJ9JMi6bPalH+7dyHBMqDY2ABMBy2b5gtSB0S97Ke5B6RZ4A
         8RoBxD/ZSIftJHcC/e3ANjbfVaZ2/VS4yCl0DqdTf3w5dUuLbM6d2yR94d74CPsdARr6
         myHxK/scJHscya5+VHd+4qkb44E7FPbSp0zr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wgzgdAW3r/kT8hbBHSE7xNQx6KDfEmQ8K6p5leYpbKo=;
        b=kfBgaIksMVxP0Rfz3YHs4dWskPtZLUef6tat5NxOi/SinWg04/kntI4EEBPwa00U0a
         ohg8ZcjAPQm/HQoGG9KcSV0Z+gecAZL+zYMNxwSaR1D2MIyXurzgWb2yJkdtQJNVpq/o
         DPCp7D0yFjpaeXvNzYkslvgLX2tAgBk3yGnVd3KY8uVd2i+xtka/m4Smkv9Zzk4qqSOc
         YnI+bBtnnTm+Qr8A/ufuEK3wSpixy4vp89MIXUp2OZDuK2/epbxT852kqhrBO+BWIosw
         IMroo3ZHZiqSs3u+aUlIOCOOTavDfwVnTaL1eD/m+GrtOIMF4JTnCqMBPBqXdcqz20bc
         Pk0Q==
X-Gm-Message-State: ACrzQf0v4jL0vkQd7R43OryxU47Mmjb3EF0mOS2Wajn1JG4tdf+RZ/M8
	PEEMJMYXF2e4kie7JcXXEUfaIw==
X-Google-Smtp-Source: AMsMyM7Nlrrifn5dRW4ZSuKVgvYloiSl7DQsQZmgyC8/RtmWMrNf3jOvSrIZb1nmXYH2f6Iax1Yo5Q==
X-Received: by 2002:adf:e788:0:b0:22e:337a:247 with SMTP id n8-20020adfe788000000b0022e337a0247mr121674wrm.216.1667324641592;
        Tue, 01 Nov 2022 10:44:01 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7f2d:d8cb:afb2:98f4? ([2001:8b0:aba:5f3c:7f2d:d8cb:afb2:98f4])
        by smtp.gmail.com with ESMTPSA id i4-20020a05600c354400b003cf4c1e211fsm11960795wmq.38.2022.11.01.10.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 10:44:00 -0700 (PDT)
Message-ID: <ea92c4e3fda1e06defc28532e8f0b1c7205e09c1.camel@linuxfoundation.org>
Subject: Re: [PATCH 6/6] u-boot: Rework signing to remove interdependencies
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sean Anderson <sean.anderson@seco.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	openembedded-core@lists.openembedded.org, Luca Ceresoli
	 <luca.ceresoli@bootlin.com>
Date: Tue, 01 Nov 2022 17:44:00 +0000
In-Reply-To: <3eccb82e-73ac-1e79-8a99-0d6b3cc7839d@seco.com>
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
	 <42bd04f74f012c2bf921c486087a6659c9534756.camel@linuxfoundation.org>
	 <3eccb82e-73ac-1e79-8a99-0d6b3cc7839d@seco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 17:44:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172376

On Tue, 2022-11-01 at 13:40 -0400, Sean Anderson wrote:
> On 11/1/22 13:29, Richard Purdie wrote:
> > On Tue, 2022-11-01 at 12:14 -0400, Sean Anderson wrote:
> > > On 10/28/22 11:37, Richard Purdie wrote:
> > > > On Fri, 2022-10-28 at 11:29 -0400, Sean Anderson wrote:
> > > > > On 10/28/22 11:09, Richard Purdie wrote:
> > > > > > On Wed, 2022-10-26 at 13:21 -0400, Sean Anderson wrote:
> > > > > > > As noted in the cover letter, I ran
> > > > > > >=20
> > > > > > > oe-selftest -r fitimage.FitImageTests
> > > > > >=20
> > > > > > Ok, good. That at least means you were only running one class o=
f tests.
> > > > > > I was worried you were running all of them!
> > > > > >=20
> > > > > > > I also tried using -j$(nproc), but I saw no increase in paral=
lelism
> > > > > > > outside of the usual for bitbake. This was especially noticab=
le for
> > > > > > > do_rootfs, which is single-threaded.
> > > > > >=20
> > > > > > Sadly the parallelism works on a per test class basis so it wou=
ldn't
> > > > > > help in this case. There are only small marginal gains from run=
ning
> > > > > > tests in individual build directories so we don't do that.
> > > > >=20
> > > > > I estimate it could have saved me 2-3 minutes every build, since =
it could
> > > > > have parallelized the root filesystem stuff.
> > > >=20
> > > > On an initial run, it could have also ended up building a lot of pi=
eces
> > > > in parallel needlessly so it is all a bit of a compromise. It might=
 be
> > > > worth looking into whether we can make that an option, off by defau=
lt.
> > > >=20
> > > > > > > This is ommitted above, but I *had* to use -j1 in order to av=
oid
> > > > > > > manually wiping out my existing build directory each time (an=
d instead
> > > > > > > ending up with dozens of pid-named directories). This is docu=
mented
> > > > > > > nowhere, and I found it in some old IRC logs.
> > > > > >=20
> > > > > > Parallelism using differently named build directories is an
> > > > > > implementation detail, not something which the -j option implie=
s.I
> > > > > > guess you were also using --keep-builddir
> > > > >=20
> > > > > Failing builds don't remove the test directory so you can inspect=
 the build
> > > > > output. As you might imagine, I had a lot of failing builds.
> > > >=20
> > > > I'm very familiar with that myself, yes.
> > > >=20
> > > > We did once used to reuse the build directory, that challenge is we
> > > > have no idea what the user has done in there prior to the test so i=
t
> > > > potentially makes the test results potentially incorrect.
> > > >=20
> > > > > > > > We haven't really had anyone try and optimise the tests eit=
her, I'm
> > > > > > > > sure there will be things in there which can help. Please d=
on't let the
> > > > > > > > speed put you off trying to improve things and extend our c=
overage!
> > > > > > >=20
> > > > > > > The poor speed of these self tests (and of everything related=
 to the
> > > > > > > yocto project in general) makes this project frustrating to c=
ontribute
> > > > > > > to. It took me around 2 days to go from my prototype to this =
series,
> > > > > > > most of which was spent waiting for tests to compile and losi=
ng whatever
> > > > > > > train of thought I had. I probably went through perhaps 20 re=
visions. If
> > > > > > > I was working on e.g. U-Boot, I could have made 20 revisions =
in 2 hours,
> > > > > > > as it takes around 15 seconds to recompile it and run the ful=
l unit test
> > > > > > > suite.
> > > > > > >=20
> > > > > > > On the topic of these specific tests, part of the problem is =
that
> > > > > > > do_rootfs is a bottleneck which takes around 45-60s on my sys=
tem. Every
> > > > > > > test which modifies something in the rootfs incurs this overh=
ead.
> > > > > >=20
> > > > > > For better or worse we've 'a few' more moving pieces than U-Boo=
t.
> > > > > >=20
> > > > > > Building a root filesystem from packages is a non-trivial task,=
 taking
> > > > > > under a minute is in some ways pretty good already. The only ot=
her
> > > > > > thing we could do is incremental rootfs construction where it w=
ould
> > > > > > add/remove changed packages. I'd worry that the result may not =
always
> > > > > > be equal to a build from scratch and it might cause weird and
> > > > > > interesting reproducibility problems (particularly when you con=
sider
> > > > > > things like postinsts).
> > > > > >=20
> > > > > > I would love to improve our development "iteration" time but I'=
m
> > > > > > struggling to see where we could get the speed gains from :(. O=
pen to
> > > > > > other ideas...
> > > > >=20
> > > > > We don't have to build a full root filesystem. All of these tests=
 just want
> > > > > e.g. an initramfs. An empty (or one file) filesystem would work j=
ust as well.
> > > > > If you still want to boot, you can make a busybox filesystem.
> > > >=20
> > > > Could we update the test just to use an initramfs then?
> > > >=20
> > > > I'm definitely a fan of keeping the tests as simple as we can whils=
t
> > > > still testing what we need to test.
> > >=20
> > > I can look into this, but I'd prefer to do it as a follow-up to this =
series.
> > >=20
> > > I'll probably send a v2 later this week a fleshed-out commit message =
for patch
> > > 5/6 (and with it possibly all those variables moved to a separate bbc=
lass to
> > > make it easier for other classes to create signed FITs).
> >=20
> > The series did already merge so anything would be incremental
> > improvements at this point!
>=20
> Huh...
>=20
> I really wish you guys sent thank-you messages when you merged something.=
 Makes
> it a lot easier to keep track of which series still need work.

That would result in a lot of messages on the mailing list and ends up
being a lot of work for the maintainers as well.

Looking at the repository is accurate and you can see exactly what
merged and when...

Cheers,

Richard



