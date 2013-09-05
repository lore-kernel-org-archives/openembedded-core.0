Return-Path: <laurentiu.palcu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4A6B36B064
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 11:59:15 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 05 Sep 2013 04:59:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,846,1371106800"; d="scan'208";a="391446762"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 05 Sep 2013 04:59:14 -0700
Date: Thu, 5 Sep 2013 14:59:13 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Phil Blundell <philb@brightsign.biz>
Message-ID: <20130905115913.GC17481@lpalcu-linux>
References: <cover.1378366233.git.laurentiu.palcu@intel.com>
	<728bbce2f20eefd81accfbbe48c6f5f4e85aabb2.1378366233.git.laurentiu.palcu@intel.com>
	<20130905081516.GI11500@jama>
	<1378377834.6940.66.camel@phil-desktop.brightsign>
	<20130905111155.GB17481@lpalcu-linux>
	<1378381064.6940.75.camel@phil-desktop.brightsign>
	<1378381226.6940.77.camel@phil-desktop.brightsign>
MIME-Version: 1.0
In-Reply-To: <1378381226.6940.77.camel@phil-desktop.brightsign>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] image.bbclass: leave metadata in place if a PM is installed in the image
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
X-List-Received-Date: Thu, 05 Sep 2013 11:59:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 05, 2013 at 12:40:26PM +0100, Phil Blundell wrote:
> On Thu, 2013-09-05 at 12:37 +0100, Phil Blundell wrote:
> > On Thu, 2013-09-05 at 14:11 +0300, Laurentiu Palcu wrote:
> > > This solution is the most decent I could find in order to address this:
> > > https://bugzilla.yoctoproject.org/show_bug.cgi?id=4484
> > > in this stage of 1.5 release. Other ideas are always welcome.
> > 
> > I couldn't quite follow the long and complicated history of that bug,
> > but based on the description and the contents of comment #1 it sounds as
> > though the bug is at best tangentially related to this issue.
See last comment to understand what this patch fixes. The original issue
was fixed by the patchset mentioned here:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=4484#c4
> > 
> > In the case where you have postinsts on the target but package
> > management is disabled, rootfs_ipk should be installing run-postinsts
> > (not opkg) and in that case it doesn't seem like this patch will help.
> > 
> > It looks as though this breakage was probably introduced by
> > 928df79cd3964f775c4c6e4283ef84b8882f9328 which moved the call to
> > remove_packaging_data_files() from rootfs_ipk (which was only calling it
> > if it knew that all postinsts had already been completed) to
> > image.bbclass (which doesn't have that knowledge and will call it
> > irrespective of what state the postinsts are in).
> 
> Actually, that last sentence is slightly incorrect.  image.bbclass does
> have the knowledge, it just seems to be failing to act on it.  So
> perhaps the easiest fix for the time being is simply to move the
> remove_packaging_data_files call in rootfs_uninstall_unneeded () a few
> lines higher up so that it's inside the "if [ -z $(delayed_postinsts) ]"
> block.
What you're suggesting means that we will have the PM metadata present
if there are delayed postinstalls present. But, since the PM is not
present, what's the use of that? Your suggestion will work, however, in
the case Paul mentioned, when reopening the bug, but we'll break the
current functionality...

Thanks,
Laurentiu
> 
> p.
> 
> 

