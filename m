Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 8C5366F667;
	Fri,  7 Mar 2014 10:09:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 07 Mar 2014 02:09:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,606,1389772800"; d="scan'208";a="487828681"
Received: from lbhoopat-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.98])
	by fmsmga001.fm.intel.com with ESMTP; 07 Mar 2014 02:09:01 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 07 Mar 2014 10:09 +0000
Message-ID: <3158053.US3HkBfSAc@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.3 (Linux/3.13.5-200.fc20.x86_64; KDE/4.12.3; x86_64; ; )
In-Reply-To: <20140306192122.GJ26981@jama>
References: <1394125490-2945-1-git-send-email-Martin.Jansa@gmail.com>
	<2403049.xWs40izQYL@peggleto-mobl5.ger.corp.intel.com>
	<20140306192122.GJ26981@jama>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH] bash-completion: remove allarch
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
X-List-Received-Date: Fri, 07 Mar 2014 10:09:03 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 06 March 2014 20:21:22 Martin Jansa wrote:
> On Thu, Mar 06, 2014 at 05:59:29PM +0000, Paul Eggleton wrote:
> > On Thursday 06 March 2014 18:04:50 Martin Jansa wrote:
> > > * it has runtime dependency on TUNE_PKGARCH bash, so it cannot be
> > > allarch
> > 
> > As we've already discussed this is not universally true. There are other
> > ways to solve this.
> 
> Like making it special case like packagegroups? That is still making me
> headaches when some library (for some reason) included in packagegroup
> is renamed thanks to debian.bbclass and packagegroup isn't rebuilt, so
> it breaks do_rootfs..

Did you report this? FWIW it's the first I recall hearing of the problem; 
perhaps I just missed it.

> I would rather build bash-completion only once per architecture than
> rebuilding it as "allarch" every time I'm building for MACHINE with
> different TUNE_PKGARCH.

As I said last time, I'm not arguing that rebuilding allarch recipes on 
machine change is preferable - obviously it isn't. On the other hand, what 
you're doing with this kind of change is telling the build system that the 
recipe needs to be built differently depending on what the target architecture 
is, which is *not* true; this is only being done to work around the build 
system making an assumption that the rebuild needs to happen. Fix the 
assumption and the problem is fixed, properly. 

If we need to make changes to the core or BitBake to make it easier to handle 
this properly, by all means let's do that; but if we go down the road of 
applying the workaround to every recipe where we hit this issue (and as we 
have seen it's not just one or two recipes) we will never get around to fixing 
the underlying problem.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

