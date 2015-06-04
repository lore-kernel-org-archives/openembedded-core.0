Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 921F76AD0D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 13:12:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 04 Jun 2015 06:12:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,552,1427785200"; d="scan'208";a="705271984"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga001.jf.intel.com with ESMTP; 04 Jun 2015 06:12:08 -0700
Message-ID: <1433423527.12084.22.camel@linux.intel.com>
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Thu, 04 Jun 2015 16:12:07 +0300
In-Reply-To: <1883118.cJJW02ZV6v@peggleto-mobl.ger.corp.intel.com>
References: <1430385372-6975-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1883118.cJJW02ZV6v@peggleto-mobl.ger.corp.intel.com>
X-Mailer: Evolution 3.12.11 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/6] devtool: improve handling of local source files
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
X-List-Received-Date: Thu, 04 Jun 2015 13:12:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

On Tue, 2015-05-12 at 19:01 +0100, Paul Eggleton wrote:
> Hi Markus,
> 
> On Thursday 30 April 2015 12:16:06 Markus Lehtonen wrote:
> > This patchset tries to improve handling of local source files (i.e. file://
> > in SRC_URI). First, it improves packages for which S=WORKDIR (that possibly
> > only have local sources. Second, it makes local sources available in the
> > srctree for all packages.
> > 
> > See yocto bug #7602
> 
> I've finally looked at these, apologies for the delay. Some comments:
> 
> * I don't think we really want the local files to become part of the git 
> repository by default - they shouldn't be committed. Once users have finished 
> with devtool, we want them to be able to push the source tree to their own 
> repo and point to that within the recipe, whilst keeping the local files next 
> to the recipe.

So you suggest to add a new command line option to devtool extract and
modify (--local-files or smth)? What to do when there are only local
files (no source tarball / repo) - automatically enable --local-files in
this case?


> * This implies that new files added to the local files dir when we do devtool 
> update-recipe should not be added as a patch, they should be copied next to 
> the recipe and added to SRC_URI. I'm more than happy for us to implement this 
> separately as a follow-up (i.e. we could start by not handling adding files to 
> the local files directory at all.)

Yeah, I actually have this WIP. Currently (i.e. with the current
patchset), new files added to 'local-files' are just ignored. They are
not copied and no patches is generated out of these.


> * The local-files directory needs to be named specific to OE - "oe-local-files" 
> would be ideal. If we could have one place in the code where this was defined 
> that would be ideal as well (maybe at some point we'd allow it to be 
> configured).

This is not a big deal. Should it perhaps be "bb-local-files" instead?


Thanks,
  Markus


