Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 1751F6A5AF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 15:48:20 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8AG1hmX028567; Tue, 10 Sep 2013 17:01:43 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id pMkxxXCqvidg; Tue, 10 Sep 2013 17:01:43 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8AG1ctR028564
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 10 Sep 2013 17:01:39 +0100
Message-ID: <1378828074.3484.167.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Darren Hart <dvhart@linux.intel.com>
Date: Tue, 10 Sep 2013 16:47:54 +0100
In-Reply-To: <1378827721.19978.112.camel@dvhart-mobl4.amr.corp.intel.com>
References: <cover.1378483732.git.pkj@axis.com>
	<398be88b2b4779bc227d9f716ebcc360958e02dd.1378483732.git.pkj@axis.com>
	<1378827198.19978.106.camel@dvhart-mobl4.amr.corp.intel.com>
	<1378827477.3484.166.camel@ted>
	<1378827721.19978.112.camel@dvhart-mobl4.amr.corp.intel.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] bb-matrix: Make sure local.conf does not interfere
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
X-List-Received-Date: Tue, 10 Sep 2013 15:48:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-09-10 at 08:42 -0700, Darren Hart wrote:
> On Tue, 2013-09-10 at 16:37 +0100, Richard Purdie wrote:
> > On Tue, 2013-09-10 at 08:33 -0700, Darren Hart wrote:
> > > On Fri, 2013-09-06 at 18:12 +0200, Peter Kjellerstedt wrote:
> > > > If any of BB_NUMBER_THREADS, PARALLEL_MAKE or SSTATE_DIR happened to be
> > > > set in local.conf then the bb-matrix script would not perform as
> > > > intended.
> > > > 
> > > > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > > ---
> > > >  scripts/contrib/bb-perf/bb-matrix.sh | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > > 
> > > > diff --git a/scripts/contrib/bb-perf/bb-matrix.sh b/scripts/contrib/bb-perf/bb-matrix.sh
> > > > index 1064565..d5127e7 100755
> > > > --- a/scripts/contrib/bb-perf/bb-matrix.sh
> > > > +++ b/scripts/contrib/bb-perf/bb-matrix.sh
> > > > @@ -53,6 +53,10 @@ if [ $? -ne 0 ]; then
> > > >  	exit 1
> > > >  fi
> > > >  
> > > > +# Make sure neither of BB_NUMBER_THREADS, PARALLEL_MAKE and SSTATE_DIR are set
> > > > +# in local.conf
> > > > +sed -ri 's/^([[:space:]]*(BB_NUMBER_THREADS|PARALLEL_MAKE|SSTATE_DIR)[[:space:]]*\??=.*)/#\1/' conf/local.conf
> > > > +
> > > 
> > > Unless I'm mistaken, you are modifying the users local.conf?
> > > 
> > > We definitely should *not* be doing that. I would support documenting
> > > this as a requirement and even printing a warning if any of a set of
> > > variables are found in the bitbake environment.
> > > 
> > > Note that local.conf is not the only place where these could be set.
> > > 
> > > Richard, shouldn't the env setting override anything in local.conf?
> > 
> > No, it will override a ?= or ??= but not a =.
> 
> OK, well, a warning if found in local.conf (or site.conf?) is probably
> the best we can do for now. We can't check bitbake -e since that will
> report the default which we wouldn't be able to distinguish from an
> explicit setting.... unless we checked for an explicit assignment? Might
> be doable.... but a warning should be sufficient for a script in
> contrib, yes?

Yes, although I think in the comments, bitbake -e will tell you which
kind of operation was used :)

Cheers,

Richard



