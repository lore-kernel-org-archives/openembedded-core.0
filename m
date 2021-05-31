Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.42226.1622454767879089206
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 May 2021 02:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:60578 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lnebG-006zpQ-05; Mon, 31 May 2021 05:52:46 -0400
Date: Mon, 31 May 2021 05:52:41 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] follow up: keeping the source with an "externalsrc"-based recipe
In-Reply-To: <20210531085655.tdj73iny3mxhz22a@qschulz>
Message-ID: <a7456217-6dd2-8276-bc4e-6489a3648829@crashcourse.ca>
References: <f25c1d23-ce3-bd0-a5b5-8c5d4e0fda6@crashcourse.ca> <20210528130557.zr762og6uvyv577b@qschulz> <d9f5b68-e151-6848-3c4d-ea3bef28c22c@crashcourse.ca> <20210528141615.klk5hwfmo4gwqfbg@qschulz> <3c62eb6a-ed4c-881f-ded6-625cc4b726da@crashcourse.ca>
 <20210528150703.mueernohsx4wlgry@qschulz> <57954bd8-dd61-ded9-83b1-61cbbc129d8b@crashcourse.ca> <20210528152626.aihuhwh5p5jbfl2d@qschulz> <8fbd5dac-a514-48b-bc14-54b3db5411b6@crashcourse.ca> <20210531085655.tdj73iny3mxhz22a@qschulz>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

On Mon, 31 May 2021, Quentin Schulz wrote:

> Hi Robert,
>
> On Fri, May 28, 2021 at 05:02:13PM -0400, Robert P. J. Day wrote:
> > On Fri, 28 May 2021, Quentin Schulz wrote:
> >
> > ... big snip ...
> >
> > > ${B} = ${S} by default, so that might explain why it works without
> > > externalsrc being inherited.
> > >
> > > You can see in the makefile that this is assumed. Only the install tasks
> > > are installing somewhere else (DESTDIR), c.f.
> > > https://git.savannah.nongnu.org/cgit/dmidecode.git/tree/Makefile
> > >
> > > So yes, except if you patch the Makefile to support out-of-tree build,
> > > you would need both EXTERNALSRC and EXTERNALSRC_BUILD set to the same
> > > value.
> > >
> > > Maybe a Cmake example would suit better since B is set to "${WORKDIR}/build"
> > > by default?
> > >
> > > Otherwise, write a proper Makefile that allows out-of-tree builds for
> > > the example :)
> >
> >   in the end, i suspect i was overthinking it, thinking somehow there
> > was some magic to "externalsrc", only to finally realize it was
> > totally inappropriate for source that had to be built in-tree. so i
> > just switched over to using SRC_URI and, for various recipes like
> > dmidecode, i created a recipe that started with some variation of:
> >
> >   LICENSE = "CLOSED"
> >   LIC_FILES_CHKSUM = ""
> >   FILESEXTRAPATHS_prepend := "${THISDIR}:"
> >   SRC_URI := "file://src"
>
> No need for := here, a simple = should suffice?

  yup, i already simplified that, even though it doesn't hurt
anything.

> >   S = "${WORKDIR}/src"
> >
>
> Why not put the sources in:
> meta-mylayer/recipes-test/test/my-test-0.1/src/
> meta-mylayer/recipes-test/test/my-test_0.1.bb
>
> and have SRC_URI = "file://src/" without needing to add
> FILESEXTRAPATHS_prepend := "${THISDIR}:" so that it follows what
> almost every recipe does?
>
> S will be as you wrote above.

  i know it looks goofy, but these recipes are just meant to be
templates to show other developers what a normal Makefile-based recipe
will look like, and if they have their source elsewhere, they'll have
to set FILESEXTRAPATHS anyway. i was grappling with how to do this,
but this is not meant to be production-level, it's just for people to
see how to structure their code so it follows the OE model. i might
re-do it.

> I thought you were trying to find an example with externalsrc for
> our docs, but it seems you have a different thing in mind, can you
> tell us so we are able to help you with your actual issue/question
> :) ?

  externalsrc turned out to have the fatal flaw that it doesn't scale
well for source that can't be built out-of-tree.

rday
