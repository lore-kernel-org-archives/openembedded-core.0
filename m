Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D66FF767D5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 19:54:45 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 07 Aug 2015 12:54:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,630,1432623600"; d="scan'208";a="537930506"
Received: from mbolton-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.7.213])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Aug 2015 12:54:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 07 Aug 2015 20:54:43 +0100
Message-ID: <2404070.xrxV9F6QNR@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.0.8-200.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <08C4C542-36D0-4009-9492-D2E048CF29DC@gmail.com>
References: <1438851969-4340-1-git-send-email-amarnath.valluri@intel.com>
	<3064000.UnunBGI2RM@peggleto-mobl.ger.corp.intel.com>
	<08C4C542-36D0-4009-9492-D2E048CF29DC@gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] dosfstools-2.11: Fix memory leak in mkdosfs
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
X-List-Received-Date: Fri, 07 Aug 2015 19:54:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 07 August 2015 12:26:56 Khem Raj wrote:
> > On Aug 7, 2015, at 2:51 AM, Paul Eggleton <paul.eggleton@linux.intel.com>
> > wrote:> 
> > On Thursday 06 August 2015 19:52:28 Khem Raj wrote:
> >> On Thu, Aug 6, 2015 at 2:25 AM, Paul Eggleton
> >> 
> >> <paul.eggleton@linux.intel.com> wrote:
> >>> On Thursday 06 August 2015 12:12:35 Alexander Kanavin wrote:
> >>>> On 08/06/2015 12:06 PM, Amarnath Valluri wrote:
> >>>>> Added new patch that fixes the memory leak that was introduced in
> >>>>> mkdosfs-dir.patch.
> >>>> 
> >>>> You should update the original patch then, not pile additional patches
> >>>> on top. The least painful way is:
> >>>> 
> >>>> 1) unpack the sources (manually from tarball, or using bitbake -c
> >>>> unpack)
> >>>> 2) 'git init; git add *; git commit' to create an git repository from
> >>>> the sources
> >>>> 3) apply the patch that needs fixing, then do the fix
> >>>> 4) make a git commit, then produce a patch using git format-patch, then
> >>>> move the new patch back to the recipe directory and update the recipe
> >>>> 5) build the recipe to make sure it still builds
> >>>> 6) make a git commit with the recipe update, and submit it here :)
> >>> 
> >>> On the contrary - the much less painful way (as of fido) is to use
> >>> devtool:
> >>> 
> >>> 1) Extract source and set the build system up to use it:
> >>>   devtool modify dosfstools -x ~/projects/dosfstools
> >>> 
> >>> 2) Make whatever changes you want to in the git tree that has been set
> >>> up
> >>> in the specified path
> >>> 
> >>> 3) Build the recipe (as you would normally) to make sure it still builds
> >>> 
> >>> 4) Write the modified/added commits as patches back to the recipe:
> >>>    devtool update-recipe dosfstools
> >>> 
> >>> 5) Make a git commit with the recipe update, and submit it here :)
> >>> 
> >>> I'd really like people to start using devtool for this kind of thing. If
> >>> it's not working for some reason please do let me know.
> >> 
> >> This assumes either we use OE-Core or poky, I dont get it to work with
> >> angstrom out of box
> >> what am I missing
> > 
> > Well, whatever error / problem you are experiencing seems to be missing at
> > least ;)
> 
> devtool modify dosfstools -x ~/projects/dosfstools
> ERROR: This script can only be run after initialising the build environment
> (e.g. by using oe-init-build-env)
> 
> so is it must now to use the setup script ? or can be extract some needed
> setup from it to let it work with setups not using the init script

Well it needs to be able to run bitbake internally (directly and using 
tinfoil), hence the need to have the environment set up to do so. I don't 
really see a way around that.

Cheers,
Paul


-- 

Paul Eggleton
Intel Open Source Technology Centre

