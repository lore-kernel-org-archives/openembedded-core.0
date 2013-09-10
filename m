Return-Path: <dvhart@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4A98B61117
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 15:40:00 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 10 Sep 2013 08:40:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,879,1371106800"; d="scan'208";a="393649772"
Received: from unknown (HELO [10.255.14.81]) ([10.255.14.81])
	by fmsmga001.fm.intel.com with ESMTP; 10 Sep 2013 08:40:01 -0700
Message-ID: <1378827601.19978.110.camel@dvhart-mobl4.amr.corp.intel.com>
From: Darren Hart <dvhart@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Tue, 10 Sep 2013 08:40:01 -0700
In-Reply-To: <1378827427.3484.165.camel@ted>
References: <cover.1378483732.git.pkj@axis.com>
	<8455f1f49363caff9ceb89a81d9b9a4650dd8ece.1378483732.git.pkj@axis.com>
	<1378827008.19978.103.camel@dvhart-mobl4.amr.corp.intel.com>
	<1378827427.3484.165.camel@ted>
Organization: Intel
X-Mailer: Evolution 3.8.5 (3.8.5-2.fc19) 
Mime-Version: 1.0
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] bb-matrix: Clean before, rather than after, building
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
X-List-Received-Date: Tue, 10 Sep 2013 15:40:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-09-10 at 16:37 +0100, Richard Purdie wrote:
> On Tue, 2013-09-10 at 08:30 -0700, Darren Hart wrote:
> > On Fri, 2013-09-06 at 18:12 +0200, Peter Kjellerstedt wrote:
> > > This makes sure the the first build starts from a clean state. Otherwise
> > > one could have the first build affected by any leftover state from
> > > a previous build.
> > > 
> > > This also leaves a working state behind after the final build.
> > > 
> > > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > 
> > Hi Peter,
> > 
> > Thanks for taking the time to send in a fix!
> > 
> > > ---
> > >  scripts/contrib/bb-perf/bb-matrix.sh | 12 +++++-------
> > >  1 file changed, 5 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/scripts/contrib/bb-perf/bb-matrix.sh b/scripts/contrib/bb-perf/bb-matrix.sh
> > > index 37721fe..1064565 100755
> > > --- a/scripts/contrib/bb-perf/bb-matrix.sh
> > > +++ b/scripts/contrib/bb-perf/bb-matrix.sh
> > > @@ -63,6 +63,10 @@ for BB in $BB_RANGE; do
> > >  		date
> > >  		echo "BB=$BB PM=$PM Logging to $BB_LOG"
> > >  
> > > +		echo -n "  Preparing the work directory... "
> > > +		rm -rf pseudodone tmp sstate-cache tmp-eglibc &> /dev/null
> > > +		echo "done"
> > > +
> > 
> > Makes sense to me, although there is one point worth discussing. The
> > tmp-eglibc directory could change depending on the DISTRO setting iiuc.
> > All of tmp, sstate-cache, and tmp-eglibc could be dealt with using
> > cleansstate I believe:
> > 
> > bitbake <target> -c cleansstate
> > 
> > Richard, should we consider using this instead?
> 
> Sadly this isn't recursive, it applies to <target> and not any
> dependencies of it. I'd be tempted to simplify this to rm tmp* and
> depend on a convention of calling them tmp*...
> 

yes.... but.... any kind of a wildcard in an rm -rf statement makes me
see purple....

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel



