Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3014BC47DDB
	for <webhook@archiver.kernel.org>; Sat, 27 Jan 2024 09:36:52 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web10.12683.1706348202653420411
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jan 2024 01:36:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=bpWBBahv;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Wv5/Z8hZ3uUDQxottEWLJt1+pduEI0qr+dcAKdh4OPI=; b=bpWBBahvC+F2sKopSYo0vpEOdM
	zf6xPL6aHS2884ndiosZa7qeMJiOVLHh5T+qyybw29IV1vMxUH1vESN1GOH+bUGd/dIMJT5nEcYPV
	aygGAN0Opft4XrFXJEDLP8Mc+9HlhDuokyDxBz57T8ImMUzWeVyLO4qPwE+Q3XrgnjctNSBaPJAPY
	+CzPBbaIyEQwml87KwI5wI+osTFakuKeGQbQ3nAlqPoAmUUtsxjRo36FhsQ+IqXNAXDgN/Oovsowe
	UopwOOxz9xPZIGcoTcb8gFawN51t96zZrsBpTNl5ztPXSvv6dJh7qKhA8HdownpKrRT+ExSWo4P4U
	rcsBifZQ==;
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.102.5]:50324 helo=fedora)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1rTf76-00BsoR-07;
	Sat, 27 Jan 2024 04:36:40 -0500
Date: Sat, 27 Jan 2024 04:36:29 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Khem Raj <raj.khem@gmail.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] trying to create simple example of "externalsrc"
 recipe
In-Reply-To: <CAMKF1sqO+izPybMT2j+S699RRgB7psge1hYA2r455C6z8AW7Lg@mail.gmail.com>
Message-ID: <01a1aa4-7c38-a478-5ae5-d0c17ed4215@crashcourse.ca>
References: <436ae552-2fad-8de3-9435-b03df2d2a823@crashcourse.ca> <CAMKF1sqO+izPybMT2j+S699RRgB7psge1hYA2r455C6z8AW7Lg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2051499681-1706348198=:3628997"
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jan 2024 09:36:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194433

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2051499681-1706348198=:3628997
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 26 Jan 2024, Khem Raj wrote:

> On Fri, Jan 26, 2024 at 4:46 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> >
> >   i've been trying to put together a really basic example of a recipe
> > using "externalsrc" that refers to some local source, and cannot get
> > it to work. so here's what i'm trying.
> >
> >   as a demo, i selected a random simple OE recipe -- in this case,
> > "dmidecode", whose recipe you can see here (and which seems
> > conveniently simple for demonstration purposes):
> >
> > https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/dmidecode/dmidecode_3.5.bb?h=master
> >
> > so to start, since the SRC_URI is a tarball, i downloaded the tarball
> > so that i have the equivalent local source here:
> >
> >   $ ls /home/rpjday/oe/srcs/dmidecode-3.5
> >   AUTHORS       dmioem.h     Makefile     util.c
> >   biosdecode.c  dmiopt.c     man          util.h
> >   config.h      dmiopt.h     NEWS         version.h
> >   dmidecode.c   dmioutput.c  ownership.c  vpddecode.c
> >   dmidecode.h   dmioutput.h  README       vpdopt.c
> >   dmioem.c      LICENSE      types.h      vpdopt.h
> >   $
> >
> >   as my first test, i set the build to the source directory in my
> > dmid_1.0.bb recipe file:
> >
> >   inherit externalsrc
> >   EXTERNALSRC = "/home/rpjday/oe/srcs/dmidecode-3.5"
> >   EXTERNALSRC_BUILD = "${EXTERNALSRC}"
> >
> >   do_install() {
> >     oe_runmake \
> >         DESTDIR="${D}" \
> >         prefix="${prefix}" \
> >         sbindir="${sbindir}" \
> >         docdir="${docdir}/${BPN}" \
> >         mandir="${mandir}" \
> >         install
> >
> > then ran:
> >
> >   $ bitbake dmid
> >
> > sure enough, that build in the source directory, generating:
> >
> >   AUTHORS       dmidecode.o  dmioutput.h  ownership*   version.h
> >   biosdecode*   dmioem.c     dmioutput.o  ownership.c  vpddecode*
> >   biosdecode.c  dmioem.h     LICENSE      ownership.o  vpddecode.c
> >   biosdecode.o  dmioem.o     Makefile     README       vpddecode.o
> >   config.h      dmiopt.c     man/         types.h      vpdopt.c
> >   dmidecode*    dmiopt.h     NEWS         util.c       vpdopt.h
> >   dmidecode.c   dmiopt.o     oe-logs@     util.h       vpdopt.o
> >   dmidecode.h   dmioutput.c  oe-workdir@  util.o
> >
> >   great, but i really want to build out-of-tree to preserve the
> > pristine state of the source, so i followed the instructions and
> > allowed EXTERNALSRC_BUILD to default to ${WORKDIR}/${BPN}-${PV}:
> >
> >   inherit externalsrc
> >   EXTERNALSRC = "/home/rpjday/oe/srcs/dmidecode-3.5"
> >   # EXTERNALSRC_BUILD = "${EXTERNALSRC}"
> >
> > so I did a "make clean" in the source directory to start with the
> > pristine source (also deleted the "oe-" symlinks), then:
> >
> > $ bitbake dmid
> > ... snip ...
> > | NOTE: make -j 8
> > DESTDIR=/home/rpjday/oe/builds/qemux86/tmp/work/core2-64-poky-linux/dmid/1.0/image
> > prefix=/usr sbindir=/usr/sbin docdir=/usr/share/doc/dmid
> > mandir=/usr/share/man install
> > | make: *** No rule to make target 'install'.  Stop.
> > | ERROR: oe_runmake failed
> >
> >   from "bitbake -e dmid", i can see:
> >
> > S="/home/rpjday/oe/srcs/dmidecode-3.5"
> > WORKDIR="/home/rpjday/oe/builds/qemux86/tmp/work/core2-64-poky-linux/dmid/1.0"
> > B="/home/rpjday/oe/builds/qemux86/tmp/work/core2-64-poky-linux/dmid/1.0/dmid-1.0"
> >
> > but there is nothing unloaded into the B directory; hence, the
> > failure. in fact, the log file for the compile step is:
> >
> > DEBUG: Executing python function externalsrc_compile_prefunc
> > NOTE: dmid: compiling from external source tree
> > /home/rpjday/oe/srcs/dmidecode-3.5
> > DEBUG: Python function externalsrc_compile_prefunc finished
> > DEBUG: Executing python function fetcher_hashes_dummyfunc
> > DEBUG: Python function fetcher_hashes_dummyfunc finished
> > DEBUG: Executing shell function do_compile
> > NOTE: nothing to compile
> > DEBUG: Shell function do_compile finished
> >
> >   so ... what have i overlooked? did i grab an inappropriate sample
> > recipe that does not support building out-of-tree? the build directory
> > is empty, so i'm perusing the externalsrc.bbclass to see what i have
> > misunderstood.
>
> externalsrc is as good as the components build system since that's
> what it relies on
> so if the makery for that component does not support building out of
> source tree then
> externalsrc will fail doing so too, in such cases you set
> EXTERNALSRC_BUILD = "${EXTERNALSRC}"
> which is what you did in step 1.
>
> Default is B = S in bitbake.conf, so that's what will be used for bare
> make based recipes like dmidecode.
>
> The example you chose, does require you to build inside the source
> tree. If you want a
> sample where S != B then use something other than dmidecode, maybe
> something like
> https://github.com/jameskbride/cmake-hello-world

  thanks for clarifying that i picked a bad example -- that's what i
suspected, and thanks for pointing me at an appropriate demo.

rday
--8323328-2051499681-1706348198=:3628997--

