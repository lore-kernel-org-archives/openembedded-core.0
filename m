Return-Path: <laurentiu.palcu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 16EEE62273
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 13:14:25 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Sep 2013 06:14:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,847,1371106800"; d="scan'208";a="356333613"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 05 Sep 2013 06:14:24 -0700
Date: Thu, 5 Sep 2013 16:14:23 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130905131422.GD17481@lpalcu-linux>
References: <cover.1378366233.git.laurentiu.palcu@intel.com>
	<3518999.x3yV6XY4Eo@helios>
	<1378384174.6940.86.camel@phil-desktop.brightsign>
	<3397753.WTGSduA6kl@helios>
MIME-Version: 1.0
In-Reply-To: <3397753.WTGSduA6kl@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 05 Sep 2013 13:14:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 05, 2013 at 01:53:44PM +0100, Paul Eggleton wrote:
> On Thursday 05 September 2013 13:29:34 Phil Blundell wrote:
> > On Thu, 2013-09-05 at 07:19 -0500, Paul Eggleton wrote:
> > > I'm clearly missing something here. If we have a generic mechanism to run
> > > postinstall scripts now, and "package-management" is not in
> > > IMAGE_FEATURES,
> > > why do we need or want the package manager to be in control of running the
> > > postinstalls?
> > 
> > We don't.  The postinsts should be getting run by run-postinsts.
> > 
> > I must admit I still don't entirely understand what the problem is that
> > Laurentiu is trying to fix with his patch, and the description in the
> > Yocto bugzilla remains opaque to me.  Can you clarify what exactly it is
> > that's currently going wrong?
> 
> The reason I reopened the bug (the final comment) is that I had a situation 
> recently where I had got opkg installed in an image via dependencies and I did 
> not have package-management in IMAGE_FEATURES. The result was that 
> postinstalls to be run on first boot just silently did not work, which is not 
> good behaviour.
> 
> Now, with the image I was dealing with I needed to add package-management to 
> IMAGE_FEATURES anyway; but things shouldn't just silently break because the 
> package manager happens to be installed especially as it may not be 
> immediately clear to the user that the latter had even happened. I'm pretty 
> sure this didn't used to be an issue.
Well, it's present since denzil anyway. You confirmed it yourself Paul:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=4484#c13

Before the rework, the metadata (for opkg at least) was deleted no
matter what during rootfs generation. So, there's no way this case (no
'package-management' in IMAGE_FEATURES and opkg installed) worked
recently.

Anyway, do we have a better idea? The solution Phil suggested, is not
quite ok... We'll end up with useless metadata if no PM is installed and
delayed postinstalls are present or, the other case, have the PM
installed with no metadata if the PM is installed but we have no delayed
postinstalls...

Thanks,
Laurentiu

> 
> Cheers,
> Paul
> 
> -- 
> 
> Paul Eggleton
> Intel Open Source Technology Centre

