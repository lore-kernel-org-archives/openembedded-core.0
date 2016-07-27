Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9B394606BF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 03:43:30 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 26 Jul 2016 20:43:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,428,1464678000"; d="scan'208";a="854251354"
Received: from cakenne1-mobl.amr.corp.intel.com ([10.254.86.8])
	by orsmga003.jf.intel.com with ESMTP; 26 Jul 2016 20:43:31 -0700
Date: Tue, 26 Jul 2016 20:43:30 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160727034330.GA8090@cakenne1-mobl.amr.corp.intel.com>
References: <20160714212038.12385-1-stephano.cetola@linux.intel.com>
	<1469020794.23580.11.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1469020794.23580.11.camel@linuxfoundation.org>
User-Agent: Mutt/1.6.2 (2016-07-01)
Cc: Steven Walter <stevenrwalter@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Allow for simultaneous do_rootfs tasks with rpm
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
X-List-Received-Date: Wed, 27 Jul 2016 03:43:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 07/20, Richard Purdie wrote:
> On Thu, 2016-07-14 at 14:20 -0700, Stephano Cetola wrote:
> > Give each rootfs its own RPM channel to use.  This puts the RPM
> > metadata
> > in a private subdirectory of $WORKDIR, rather than living in
> > DEPLOY_DIR
> > where other tasks may race with it.
> > 
> > This allows us to reduce the time that the rpm.lock is held to only
> > the
> > time needed to hardlink the RPMs, allowing the majority of the rootfs
> > operation to run in parallel.
> > 
> > [ YOCTO #9255 ]
> > 
> > Signed-Off-By: Steven Walter <stevenrwalter@gmail.com>
> > Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
> > ---
> >  meta/classes/rootfs_rpm.bbclass |  5 -----
> >  meta/lib/oe/package_manager.py  | 17 ++++++++++++++---
> >  2 files changed, 14 insertions(+), 8 deletions(-)
> 
> Sadly, much as I'd love to merge this, testing shows we have some
> issues.
> 
> Firstly, it means we no longer generate indexes in tmp/deploy/rpm and
> this breaks -c testimage since some of the tests connect and look for
> packages there, e.g. https://autobuilder.yoctoproject.org/main/builders
> /nightly-qa-logrotate/builds/851 but many others would have also
> failed.
> 

After digging into this I think that I can change the tests so that they
point at the correct location:

e.g.
tmp/work/qemux86-oe-linux/core-image-sato/1.0-r0/rpms/qemux86/repodata

based on the target triplet, image, PV (I'm guessing here), and arch
variables. I realized when digging into this that using "rpms" in the
path (which was a result of this patch) is wrong. It should be "rpm".

Let me know if this sounds right or if I'm dreaming.

> I've also started wondering what happens if we have some scenario where
> we have:
> 
> bitbake core-image-sato epiphany
> <rootfs for core-image-sato starts>
> <rebuild for epiphany or one of its dependencies happens>
> <old package from epiphany or one of its dependencies is removed from
> tmp/deploy/rpm>
> <core-image-sato index references this now removed package>
> 
> I'd hope the system should handle this since it should only be
> referencing things that are direct task dependencies but with
> rpm/smart, who knows :/. We should at least see how this fails (if it
> fails).
> 

When I build these two this morning I got a bunch of failures on
webkit's configure stage. I'll have to look into those.

> It could get particularly ugly if we use globbing for the rootfs
> construction (e.g. *-locale) and the list of packages changed depending
> on what else was built. I'd guess we'd already have this problem but
> this patch could magnify any problem.
> 
> We are going to have to at least solve the testimage package index
> problem before we can merge it.
> 
> Cheers,
> 
> Richard
> 
> 

