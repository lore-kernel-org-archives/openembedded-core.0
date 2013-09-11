Return-Path: <dvhart@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4844E6BF57
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 16:17:03 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 11 Sep 2013 09:17:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,885,1371106800"; d="scan'208";a="400025466"
Received: from unknown (HELO [10.255.14.117]) ([10.255.14.117])
	by fmsmga002.fm.intel.com with ESMTP; 11 Sep 2013 09:17:04 -0700
Message-ID: <1378916224.5240.1.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Date: Wed, 11 Sep 2013 09:17:04 -0700
In-Reply-To: <A612847CFE53224C91B23E3A5B48BAC798CD24DEE3@xmail3.se.axis.com>
References: <cover.1378483732.git.pkj@axis.com>
	<398be88b2b4779bc227d9f716ebcc360958e02dd.1378483732.git.pkj@axis.com>
	<1378827198.19978.106.camel@dvhart-mobl4.amr.corp.intel.com>
	<1378827477.3484.166.camel@ted>
	<1378827721.19978.112.camel@dvhart-mobl4.amr.corp.intel.com>
	<1378828074.3484.167.camel@ted>
	<A612847CFE53224C91B23E3A5B48BAC798CD24DEE3@xmail3.se.axis.com>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 11 Sep 2013 16:17:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-09-11 at 16:49 +0200, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: Richard Purdie [mailto:richard.purdie@linuxfoundation.org]
> > Sent: den 10 september 2013 17:48
> > To: Darren Hart
> > Cc: Peter Kjellerstedt; openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH 2/2] bb-matrix: Make sure local.conf does
> > not interfere
> > 
> > On Tue, 2013-09-10 at 08:42 -0700, Darren Hart wrote:
> > > On Tue, 2013-09-10 at 16:37 +0100, Richard Purdie wrote:
> > > > On Tue, 2013-09-10 at 08:33 -0700, Darren Hart wrote:
> > > > > On Fri, 2013-09-06 at 18:12 +0200, Peter Kjellerstedt wrote:
> > > > > > If any of BB_NUMBER_THREADS, PARALLEL_MAKE or SSTATE_DIR
> > happened to be
> > > > > > set in local.conf then the bb-matrix script would not perform
> > as
> > > > > > intended.
> > > > > >
> > > > > > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > > > > ---
> > > > > >  scripts/contrib/bb-perf/bb-matrix.sh | 4 ++++
> > > > > >  1 file changed, 4 insertions(+)
> > > > > >
> > > > > > diff --git a/scripts/contrib/bb-perf/bb-matrix.sh
> > b/scripts/contrib/bb-perf/bb-matrix.sh
> > > > > > index 1064565..d5127e7 100755
> > > > > > --- a/scripts/contrib/bb-perf/bb-matrix.sh
> > > > > > +++ b/scripts/contrib/bb-perf/bb-matrix.sh
> > > > > > @@ -53,6 +53,10 @@ if [ $? -ne 0 ]; then
> > > > > >  	exit 1
> > > > > >  fi
> > > > > >
> > > > > > +# Make sure neither of BB_NUMBER_THREADS, PARALLEL_MAKE and
> > SSTATE_DIR are set
> > > > > > +# in local.conf
> > > > > > +sed -ri
> > 's/^([[:space:]]*(BB_NUMBER_THREADS|PARALLEL_MAKE|SSTATE_DIR)[[:space:]
> > ]*\??=.*)/#\1/' conf/local.conf
> > > > > > +
> > > > >
> > > > > Unless I'm mistaken, you are modifying the users local.conf?
> > > > >
> > > > > We definitely should *not* be doing that. I would support
> > documenting
> > > > > this as a requirement and even printing a warning if any of a set
> > of
> > > > > variables are found in the bitbake environment.
> > > > >
> > > > > Note that local.conf is not the only place where these could be
> > set.
> > > > >
> > > > > Richard, shouldn't the env setting override anything in
> > local.conf?
> > > >
> > > > No, it will override a ?= or ??= but not a =.
> > >
> > > OK, well, a warning if found in local.conf (or site.conf?) is
> > probably
> > > the best we can do for now. We can't check bitbake -e since that will
> > > report the default which we wouldn't be able to distinguish from an
> > > explicit setting.... unless we checked for an explicit assignment?
> > Might
> > > be doable.... but a warning should be sufficient for a script in
> > > contrib, yes?
> > 
> > Yes, although I think in the comments, bitbake -e will tell you which
> > kind of operation was used :)
> > 
> > Cheers,
> > 
> > Richard
> 
> My suggestion is to test that the values can be set by the script 
> before starting the test run. Something like 
> 'BB_NUMBER_THREADS=1234 PARALLEL_MAKE="-j 1234" bitbake -e core-image-minimal'
> and then grep for the expected values. If the correct values are 
> not found then just abort with an error message as the script will 
> not be able to do what it is supposed to do.
> 
> I would also suggest aborting if SSTATE_DIR does not match 
> "$(pwd)/sstate-cache" since the script would clear a directory 
> other than the one that is actually used.
> 
> Finally, if SSTATE_MIRRORS is non-empty I would generate a warning. 
> I would not abort in this case as it can be a useful setup (e.g., 
> I used this to build with a sstate cache mirror that contained the 
> native packages as this halved the build time and I thus could test 
> more combinations over a weekend).
> 
> I'll update my patch as per above unless you have other suggestions.
> 

All sound like good approaches to me. I especially like checking the
actual runtime value rather than scanning conf files.

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



