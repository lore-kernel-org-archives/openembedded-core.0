Return-Path: <dvhart@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5E6076BE34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 15:42:00 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 Sep 2013 08:42:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,879,1371106800"; d="scan'208";a="399377042"
Received: from unknown (HELO [10.255.14.81]) ([10.255.14.81])
	by fmsmga002.fm.intel.com with ESMTP; 10 Sep 2013 08:42:01 -0700
Message-ID: <1378827721.19978.112.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Tue, 10 Sep 2013 08:42:01 -0700
In-Reply-To: <1378827477.3484.166.camel@ted>
References: <cover.1378483732.git.pkj@axis.com>
	<398be88b2b4779bc227d9f716ebcc360958e02dd.1378483732.git.pkj@axis.com>
	<1378827198.19978.106.camel@dvhart-mobl4.amr.corp.intel.com>
	<1378827477.3484.166.camel@ted>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
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
X-List-Received-Date: Tue, 10 Sep 2013 15:42:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-09-10 at 16:37 +0100, Richard Purdie wrote:
> On Tue, 2013-09-10 at 08:33 -0700, Darren Hart wrote:
> > On Fri, 2013-09-06 at 18:12 +0200, Peter Kjellerstedt wrote:
> > > If any of BB_NUMBER_THREADS, PARALLEL_MAKE or SSTATE_DIR happened to be
> > > set in local.conf then the bb-matrix script would not perform as
> > > intended.
> > > 
> > > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > > ---
> > >  scripts/contrib/bb-perf/bb-matrix.sh | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/scripts/contrib/bb-perf/bb-matrix.sh b/scripts/contrib/bb-perf/bb-matrix.sh
> > > index 1064565..d5127e7 100755
> > > --- a/scripts/contrib/bb-perf/bb-matrix.sh
> > > +++ b/scripts/contrib/bb-perf/bb-matrix.sh
> > > @@ -53,6 +53,10 @@ if [ $? -ne 0 ]; then
> > >  	exit 1
> > >  fi
> > >  
> > > +# Make sure neither of BB_NUMBER_THREADS, PARALLEL_MAKE and SSTATE_DIR are set
> > > +# in local.conf
> > > +sed -ri 's/^([[:space:]]*(BB_NUMBER_THREADS|PARALLEL_MAKE|SSTATE_DIR)[[:space:]]*\??=.*)/#\1/' conf/local.conf
> > > +
> > 
> > Unless I'm mistaken, you are modifying the users local.conf?
> > 
> > We definitely should *not* be doing that. I would support documenting
> > this as a requirement and even printing a warning if any of a set of
> > variables are found in the bitbake environment.
> > 
> > Note that local.conf is not the only place where these could be set.
> > 
> > Richard, shouldn't the env setting override anything in local.conf?
> 
> No, it will override a ?= or ??= but not a =.

OK, well, a warning if found in local.conf (or site.conf?) is probably
the best we can do for now. We can't check bitbake -e since that will
report the default which we wouldn't be able to distinguish from an
explicit setting.... unless we checked for an explicit assignment? Might
be doable.... but a warning should be sufficient for a script in
contrib, yes?

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



