Return-Path: <laurentiu.palcu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 82B566C6C1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 13:25:21 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 05 Sep 2013 06:25:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,847,1371106800"; d="scan'208";a="356337966"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 05 Sep 2013 06:25:05 -0700
Date: Thu, 5 Sep 2013 16:25:04 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Phil Blundell <pb@pbcl.net>
Message-ID: <20130905132503.GE17481@lpalcu-linux>
References: <cover.1378366233.git.laurentiu.palcu@intel.com>
	<20130905115913.GC17481@lpalcu-linux>
	<1378382840.6940.78.camel@phil-desktop.brightsign>
	<3518999.x3yV6XY4Eo@helios>
	<1378384174.6940.86.camel@phil-desktop.brightsign>
MIME-Version: 1.0
In-Reply-To: <1378384174.6940.86.camel@phil-desktop.brightsign>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
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
X-List-Received-Date: Thu, 05 Sep 2013 13:25:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 05, 2013 at 01:29:34PM +0100, Phil Blundell wrote:
> On Thu, 2013-09-05 at 07:19 -0500, Paul Eggleton wrote:
> > I'm clearly missing something here. If we have a generic mechanism to run 
> > postinstall scripts now, and "package-management" is not in IMAGE_FEATURES, 
> > why do we need or want the package manager to be in control of running the 
> > postinstalls?
> 
> We don't.  The postinsts should be getting run by run-postinsts.
Ok, I guess I forgot to mention why the issue mentioned by Paul happens
and run-postinsts doesn't do its job.

Well, as it happens, opkg postinstall creates a S98run-postinsts script
in rcS.d that will overwrite run-postinsts one.

We could fix that by making opkg create the script on position 97 and
both scripts will run in this case. Opkg one will fail, since there is
no metadata available, but run-postinsts will work because the
postinstalls are saved in /etc/(ipk|deb|rpm)_postinsts directory.

The only 'issue' remaining is the lack of metadata if one chooses to
manually install a PM when 'package-management' is disabled.

Now that I think about it, this might be a better alternative. But I
didn't test it though. It just came to my mind...

What do you think?

Laurentiu

> 
> I must admit I still don't entirely understand what the problem is that
> Laurentiu is trying to fix with his patch, and the description in the
> Yocto bugzilla remains opaque to me.  Can you clarify what exactly it is
> that's currently going wrong?
> 
> p.
> 
> 

