Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.7415.1620993132811235729
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 May 2021 04:52:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:41016 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lhWMV-0004Nu-La; Fri, 14 May 2021 07:52:11 -0400
Date: Fri, 14 May 2021 07:52:08 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Konrad Weihmann <kweihmann@outlook.com>
cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] is there an easy to prevent *creation* of some recipe's packages?
In-Reply-To: <AM9PR09MB46423C546EF564C11A177062A8509@AM9PR09MB4642.eurprd09.prod.outlook.com>
Message-ID: <a7ff2123-a71b-a4d7-abb6-85e17dcfe6e@crashcourse.ca>
References: <15ece592-a5f2-5ca7-db9c-2fd614ea6eea@crashcourse.ca> <AM9PR09MB46423C546EF564C11A177062A8509@AM9PR09MB4642.eurprd09.prod.outlook.com>
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

On Fri, 14 May 2021, Konrad Weihmann wrote:

> On 14.05.21 13:16, Robert P. J. Day wrote:
> >
> >    pretty sure i know the answer to this one, but was asked the
> > other day and wanted to make sure. in order to speed up the normal
> > OE build, someone suggested bypassing the creation of packages
> > that weren't going to be relevant, such as -dev, -doc and so on --
> > the idea was that that could make a significant difference in
> > build time.
>
> I pretty much doubt it will speed up anything. If for instance the
> -dev package will be removed from PACKAGES it is very likely that
> the files of that package will end up in the base package ${PN},
> which results in larger target packages that need to be installed
> (and potentially further RDEPENDS)
>
> Furthermore this will break DEPENDS for recipes that do rely on the
> -dev package - so chances are high that this will break (or
> magically change) something further down the line.
>
> One thing that you can do to speed up the build process in terms of
> packaging time is to delete any **really** not needed files in a
> do_install_append, if no proper configuration option (cmake flag,
> make flag, PACKAGECONFIG) does exist which prevents the creation of
> these files in the first place.
>
> I would recommend not to mess with the packaging defaults for
> reasons such as speeding things up - as this is IMHO addressing the
> issue at the wrong end - just make sure the files in <workdir>/image
> won't get created

  that's the general idea i was trying to get across (so let's confirm
that i was speaking accurately). i suggested that the majority of time
spent in processing a recipe was doing all the fetching and unpacking
and patching and (mostly) compiling, the end result of which was to
populate that recipe's WORKDIR/image directory, at which time the
packaging step took over. so unless one wanted to dangerously mangle
the package definitions, if it ended up in ${D}, it was going to get
packaged, correct?

  so unless one wanted to go back and mess with the recipe's build
configuration to, perhaps, not generate some artifacts, those packages
were going to be built, whether they were subsequently installed or
not. so short of mangling each recipe file to change its
configuration, just leave it alone as the payoff just isn't worth it.

  sound about right?

rday
