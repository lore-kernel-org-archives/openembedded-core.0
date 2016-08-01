Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C642560853
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 03:55:17 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 31 Jul 2016 20:55:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,453,1464678000"; d="scan'208";a="1027378364"
Received: from pequod.jf.intel.com (HELO jguillor-mobl1.amr.corp.intel.com)
	([10.7.198.54])
	by orsmga002.jf.intel.com with ESMTP; 31 Jul 2016 20:55:18 -0700
Date: Sun, 31 Jul 2016 20:55:17 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160801035517.GA42740@jguillor-mobl1.amr.corp.intel.com>
References: <20160714212038.12385-1-stephano.cetola@linux.intel.com>
	<1469020794.23580.11.camel@linuxfoundation.org>
	<20160727034330.GA8090@cakenne1-mobl.amr.corp.intel.com>
	<1469655599.23580.119.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1469655599.23580.119.camel@linuxfoundation.org>
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
X-List-Received-Date: Mon, 01 Aug 2016 03:55:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 07/27, Richard Purdie wrote:
> On Tue, 2016-07-26 at 20:43 -0700, Stephano Cetola wrote:
> > On 07/20, Richard Purdie wrote:
> > > On Thu, 2016-07-14 at 14:20 -0700, Stephano Cetola wrote:
> > > > Give each rootfs its own RPM channel to use.  This puts the RPM
> > > > metadata
> > > > in a private subdirectory of $WORKDIR, rather than living in
> > > > DEPLOY_DIR
> > > > where other tasks may race with it.
> > > > 
> > > > This allows us to reduce the time that the rpm.lock is held to
> > > > only
> > > > the
> > > > time needed to hardlink the RPMs, allowing the majority of the
> > > > rootfs
> > > > operation to run in parallel.
> > > > 
> > > > [ YOCTO #9255 ]
> > > > 
> > > > Signed-Off-By: Steven Walter <stevenrwalter@gmail.com>
> > > > Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
> > > > ---
> > > >  meta/classes/rootfs_rpm.bbclass |  5 -----
> > > >  meta/lib/oe/package_manager.py  | 17 ++++++++++++++---
> > > >  2 files changed, 14 insertions(+), 8 deletions(-)
> > > 
> > > Sadly, much as I'd love to merge this, testing shows we have some
> > > issues.
> > > 
> > > Firstly, it means we no longer generate indexes in tmp/deploy/rpm
> > > and
> > > this breaks -c testimage since some of the tests connect and look
> > > for
> > > packages there, e.g. 
> > > https://autobuilder.yoctoproject.org/main/builders
> > > /nightly-qa-logrotate/builds/851 but many others would have also
> > > failed.
> > > 
> > 
> > After digging into this I think that I can change the tests so that
> > they
> > point at the correct location:
> > 
> > e.g.
> > tmp/work/qemux86-oe-linux/core-image-sato/1.0
> > -r0/rpms/qemux86/repodata
> > 
> > based on the target triplet, image, PV (I'm guessing here), and arch
> > variables. I realized when digging into this that using "rpms" in the
> > path (which was a result of this patch) is wrong. It should be "rpm".
> > 
> > Let me know if this sounds right or if I'm dreaming.
> 
> Its not the right fix. The tests can be run against a pre-existing
> image which wasn't "built" by the same build directory. tmp/deploy/xxx
> is therefore the correct location for the packages/index, we just need
> to ensure something has built the indexes there.
> 
> Cheers,
> 
> Richard

I see what you are saying. I'll look into smart and createrepo to see
if there is a "smart" way to update the indexes without requiring a
lock. Is there a place in OE where we can inject code to be run "after
all rootfs"?

-S

