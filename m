Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web08.3309.1610638858687652602
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 07:40:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: kamel.bouhara@bootlin.com)
X-Originating-IP: 78.193.40.249
Received: from kb-xps (unknown [78.193.40.249])
	(Authenticated sender: kamel.bouhara@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id AA428FF818;
	Thu, 14 Jan 2021 15:40:55 +0000 (UTC)
Date: Thu, 14 Jan 2021 16:40:54 +0100
From: "Kamel Bouhara" <kamel.bouhara@bootlin.com>
To: Jean-Marie Lemetayer <jeanmarie.lemetayer@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	sandra.tobajas@savoirfairelinux.com
Subject: Re: [OE-core] [PATCH 0/2] Fix issue with npm shrinkwrap fetcher
Message-ID: <YABmBpmfl8WIK/Jf@kb-xps>
References: <20210114071235.2210763-1-kamel.bouhara@bootlin.com>
 <CAAdc0hwtbSPoTmBoG60e-5UL+BBTEkmoQi8r+BdzOu5Eek_Pmw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAdc0hwtbSPoTmBoG60e-5UL+BBTEkmoQi8r+BdzOu5Eek_Pmw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 14, 2021 at 03:25:50PM +0100, Jean-Marie Lemetayer wrote:
> Hi Kamel,
>

Hi Jean-Marie,

> Thanks for your work. I should have fixed this a long time ago but I
> didn't have the time :(
>

Well its never too late !

> There is actually an open bug for this issue:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13901
> I think you can add the reference to your commit messages. And close
> it if merged.
>

OK, let's see if there are other comments then I shall resent with
proper commit messages.

> Please add some tests to ensure that:
>  1. devtool / recipetool do not create empty shrinkwrap file
>  2. the npmsw fetcher allows empty shrinkwrap file
>  3. the npm class allows empty shrinkwrap

Actually the fix is only to check wether or not the dependencies are
listed and if not we make sure the npm fetcher will not look for them.

So the empty shrinkwrap file is still created and allowed.

I've already done some test in both case with and w/o dependencies.

>
> See:
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=22dd46cc34629d0750177fddff2e1c178c854340
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=44b2ab8d5eb4fd1fc9a157fce37aaa7b7a7065e5
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=f6728edb7e022b27223d28bd80ce40c2f2374a13
>
> Also Sandra has already worked on it, but it didn't get merged. I
> don't know why.
>
> See:
> https://lists.openembedded.org/g/bitbake-devel/topic/76459311#11643
> https://lists.openembedded.org/g/bitbake-devel/message/11648
>

I see, yet I went a bit further ensuring the npm recipes will not call
the npmsw fetcher when no dependencies are given.

Thanks for you comments.

Cheers,
Kamel

> BR
> Jean-Marie
>
> On Thu, Jan 14, 2021 at 8:13 AM Kamel Bouhara <kamel.bouhara@bootlin.com> wrote:
> >
> > Hello all,
> >
> > This small patch series aims to fix the following build issue faced
> > with some npm packages:
> >
> > DEBUG: Executing python function do_fetch
> > DEBUG: Executing python function base_do_fetch
> > DEBUG: Python function base_do_fetch finished
> > DEBUG: Python function do_fetch finished
> > ERROR: Failure expanding variable TUNE_FEATURES_tune-armv7at-neon, expression was ${TUNE_FEATURES_tune-armv7at} neon which triggered exception RecursionError: maximum recursion depth exceeded while calling a Python object
> >
> > After struggling a lot, I figured out that this only happen for npm
> > packages not having dependencies listed in their shrinkwrap file (e.g. bcryptjs).
> >
> > Yet I still didn't got how is the json parsing impacting
> > the python context here ?
> >
> > Please feel free to comment.
> >
> > Thanks.
> >
> > Kamel Bouhara (2):
> >   npm.bbclass: make shrinkwrap file optional
> >   recipetool: create: only add npmsw url if required
> >
> >  meta/classes/npm.bbclass             | 31 +++++++++++++++++++++----------
> >  scripts/lib/recipetool/create_npm.py |  6 +++++-
> >  2 files changed, 26 insertions(+), 11 deletions(-)
> >
> > --
> > 2.11.0
> >
> >
> > 
> >

--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
