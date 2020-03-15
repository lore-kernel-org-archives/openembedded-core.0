Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9DAB06188A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2020 22:24:12 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id h16so12589341qtr.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Mar 2020 15:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sZlwaTFiQeBXBEqskYJn9Mnvbok7PABR26lpAAom+sU=;
	b=H8LCWBvAexSc69RnhyWflrZf44molmK//4Ssqwre2c7J0LwFWL981L6bOBr9/n1T07
	piyWTR7aC2Zh055DwKIkDTRWeXY5t6CB6URwh9O6HCUCGDszv03powTkVhi4rMHHj3Lv
	fROa+ln5P5ZcIuWpRIY4DizLm7FayseNrKNKTvD6R6EN+6Hh7LNViOK3q9dN/sm8B51k
	mSF2Wj+SOOESKrcA2fULMknQtgUQznyq1piFyTHuB/9AwDY3aYNHU8TDYMDTHIF2pa8c
	M7PeE4xzs1G8zT9V1H8mER6FsqC2aaH+im5Dg3OPfnr4cCPxQ3CwiOT5AP8iURjFLnzu
	0q3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sZlwaTFiQeBXBEqskYJn9Mnvbok7PABR26lpAAom+sU=;
	b=jw63RL+p3AWEUsrxjOMFFHq9jrbUoq/kf3kye/2APM0+X2SRwYrjyAQeoKxHgLzVui
	47D5SzXI7SaGTDR8v3rWXzXv3JclWJ4uqxfbObpUprlcKfjh2WCnECFlJGZJRVXTt8GW
	ZtUn88hK9Yy1yHj8+K0Z9I5UhB57SMFUj52kXOaxoFabxbTMrsIUMYvZBSAPVplIN10o
	Et4q57S2MZoq+Pg5WfmaoyvVOi+mLpxdh5sICRVW9doVnA35f15CfReIwggtvprKAMte
	62+DUzSpaV/sqZPdu4dIlY5HAxGsf0R2gTmjG21kTIhr5rYhoNlpiepD34VwwpI6myrA
	AFig==
X-Gm-Message-State: ANhLgQ3PikqAoox6JfRingEu3sj/k8ywhDb9BGTSX/MnR/HO8iyO2YR/
	hmqQ9wz4HTQf5Jd/j5zQXF2E5WvMsikOzOdOJIBJeVsB
X-Google-Smtp-Source: ADFU+vtn55y/bkSLe/37Kj/JMkJeWBr7V4Vq5mrlWQqS7Ma8WXMRI1LStc0D/dh3zGglCKKiG+53RJ3pW99nW/8I4TM=
X-Received: by 2002:ac8:5351:: with SMTP id d17mr22854040qto.190.1584311053063;
	Sun, 15 Mar 2020 15:24:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200315042947.3257882-1-raj.khem@gmail.com>
	<cc5e7bc5640347ac632c65f9f2ebf1f6a2693a0c.camel@linuxfoundation.org>
In-Reply-To: <cc5e7bc5640347ac632c65f9f2ebf1f6a2693a0c.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 15 Mar 2020 15:23:46 -0700
Message-ID: <CAMKF1spW8XY4q2rbo8on6AiVjsrF+xmLCSgJ9-Yza31=18VWEg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bison: Reset load average settings if specified in environment
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Mar 2020 22:24:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 15, 2020 at 3:14 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2020-03-14 at 21:29 -0700, Khem Raj wrote:
> > In some cases, we run into parallel build failures where
> > BUILT_SOURCES
> > is skipped, as a result required header files are not generated and
> > the
> > build fails with missing header errors like
> >
> > ../bison-3.5.2/lib/uniwidth/width.c:21:10: fatal error: uniwidth.h:
> > No such file or directory
> >  #include "uniwidth.h"
> >           ^~~~~~~~~~~~
> > compilation terminated.
> >
> > BUILT_SOURCES should be built automatically with `make all` [1]
> > therefore
> > ensure that make is invoked with `all` target
> >
> > bison-native parallel build fails when -l<n> is passed globally from
> > build environment, errors like below due to race starts to show up
> >
> > Therefore removes a previous load limit if set
> >
> > [1]
> > https://www.gnu.org/software/automake/manual/html_node/Built-Sources-Example.html#Built-Sources-Example
>
> I'm not sure I understand this. We've seen a failure on our ubuntu1604
> performance tester which I think is the same bug as this. The
> environment on that machine doesn't change, so how/where is this -l
> option coming from?
>

From custom distro global settings for EXTRA_OEMAKE

> I suspect there is some issue we're not quite getting to still :(
>
 its well reproducible now with -j and -l together on our builders, From what
I see in makefiles bison is doing right thing in using BUILT_SOURCES so
I suspect it could be make acting in a certain way when those options
are present.

our custom settings use -l options globally in EXTRA_OEMAKE
this is to let machines with certain configurations build when machines are
shared, we don't want a given build to use all resources on box. Yes one
could say why not do something else to limit the resources build uses but
this is a global setting that works well

This patch just ensures that any -l setting passed from environment is
cleaned up and reset. So for general case it will be a noop.

> Cheers,
>
> Richard
>

