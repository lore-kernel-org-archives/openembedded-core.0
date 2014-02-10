Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 70A266E753
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2014 10:02:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 10 Feb 2014 02:02:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,816,1384329600"; d="scan'208";a="452687758"
Received: from eharbiso-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.194])
	by orsmga001.jf.intel.com with ESMTP; 10 Feb 2014 02:01:39 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Date: Mon, 10 Feb 2014 10:01:32 +0000
Message-ID: <1526681.3gOseygUtX@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.2 (Linux/3.12.9-301.fc20.x86_64; KDE/4.12.2; x86_64; ; )
In-Reply-To: <20140210075949.GA10078@lpalcu-linux>
References: <1391693941-25938-1-git-send-email-paul.eggleton@linux.intel.com>
	<20140210053712.GL5112@lpalcu-linux>
	<20140210075949.GA10078@lpalcu-linux>
MIME-Version: 1.0
Cc: Richard Purdie <rpurdie@rpsys.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] python-smartpm: really ignore conflicts during install with --attempt
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
X-List-Received-Date: Mon, 10 Feb 2014 10:02:28 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 10 February 2014 09:59:49 Laurentiu Palcu wrote:
> On Mon, Feb 10, 2014 at 07:37:12AM +0200, Laurentiu Palcu wrote:
> > On Sun, Feb 09, 2014 at 11:25:11PM +0000, Richard Purdie wrote:
> > > On Thu, 2014-02-06 at 13:39 +0000, Paul Eggleton wrote:
> > > > The original patch added in OE-Core commit
> > > > bdf07b1698d228dc7ff555199a269b1ff8ceca19 was supposed to ignore
> > > > conflicts, but it was unable to do so because it wasn't raising errors
> > > > in the right place. When the --attempt option is used (as is done in
> > > > complementary package installation for RPM), raise errors immediately
> > > > on conflicts, catch errors at the right point so that requested
> > > > packages
> > > > and their dependencies can be ignored, and print appropriate warnings
> > > > when doing so.
> > > > 
> > > > Fixes [YOCTO #5313].
> > > > 
> > > > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > > > ---
> > > > 
> > > >  .../python/python-smartpm/smart-attempt.patch      | 134
> > > >  +++++++++++++++++++-- 1 file changed, 121 insertions(+), 13
> > > >  deletions(-)
> > > 
> > > Could you take a look at:
> > > 
> > > http://autobuilder.yoctoproject.org/main/builders/nightly-multilib/build
> > > s/22
> > > 
> > > please?
> > > 
> > > I've not 100% confirmed it was this change, it could be something else
> > > (e.g. Laurentiu's rootfs changes) but something in master-next broke
> > > multilib :/
> > 
> > I'll do a build locally with your master-next changes and see what
> > happens. At first sight, it looks like an issue with the rootfs
> > changes. However, 'smart channel --add' is not the command I was
> > expecting to fail...
> 
> I pushed a fix on poky-contrib:lpalcu/rootfs_refactoring_ship_oecore
> 
> lib/oe/package_manager.py: RpmPM: fix issue with multilib builds

The lack of detail in the error message is a little bit concerning - we're not 
getting the output from smart in the log, so other than the return value it's 
hard to determine what might have gone wrong. Is this something that could be 
fixed as well?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

