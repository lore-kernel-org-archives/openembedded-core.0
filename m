Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.7489.1615376293814997564
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 03:38:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from bras-base-otwaon0916w-grc-29-64-229-255-220.dsl.bell.ca ([64.229.255.220]:57346 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lJxAK-0001GK-6V; Wed, 10 Mar 2021 06:38:12 -0500
Date: Wed, 10 Mar 2021 06:38:09 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Khem Raj <raj.khem@gmail.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] any reason for "cmake_" prefix on cmake_runcmake_build()?
In-Reply-To: <cf23928e-ea00-6f4e-78b3-82bed1658fc1@gmail.com>
Message-ID: <ed7fc1ff-d861-a0b9-e749-627193f3db66@crashcourse.ca>
References: <b0117e87-c17f-e22f-c2b9-868dd12ea09@crashcourse.ca> <cf23928e-ea00-6f4e-78b3-82bed1658fc1@gmail.com>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
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

On Mon, 8 Mar 2021, Khem Raj wrote:

>
>
> On 3/8/21 3:22 AM, Robert P. J. Day wrote:
> >
> >    collecting some examples of inheritance of class functions using
> > EXPORT_FUNCTIONS, and ran across this routine in cmake.bbclass:
> >
> >    ... snip ...
> >    cmake_runcmake_build() {
> >  bbnote ...
> >  eval ...
> >    }
> >
> >    cmake_do_compile()  {
> >          cmake_runcmake_build --target ${OECMAKE_TARGET_COMPILE}
> >    }
> >    ... snip ...
> >
> > what puzzles me is that the routine cmake_runcmake_build(), despite
> > having a "cmake_" prefix, is not being exported with EXPORT_FUNCTIONS,
> > so while that's a perfectly respectable function, it's not clear why
> > it would have a "cmake_" prefix. is there some value to that prefix,
> > or is it just arbitrary?
>
> it does not intend to provide a default function like do_compile do_install
> exporting it is not necessary

  no, that part i understand ... the nitpicky observation was the use
of the "cmake_" prefix for a function which was not intended to be
exported for the purpose of inheritance. sure, it's perfectly legal,
but in a stylistic sense, it just leaves open the possibility of
misinterpretation by someone reading the code.

  a simpler style rule might be, "reserve classname_ prefixes for only
those routines you plan on exporting." but i admit this is a quibble.

rday
