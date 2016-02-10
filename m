Return-Path: <paul.eggleton@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6A8DD731C1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 12:31:30 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 10 Feb 2016 04:31:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,425,1449561600"; d="scan'208";a="45543057"
Received: from klim22-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.179.126])
	by fmsmga004.fm.intel.com with ESMTP; 10 Feb 2016 04:31:29 -0800
From: Paul Eggleton <paul.eggleton@intel.com>
To: openembedded-core@lists.openembedded.org,
	Patrick Ohly <patrick.ohly@intel.com>
Date: Thu, 11 Feb 2016 01:31:27 +1300
Message-ID: <6866081.X0YIs6bN8t@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.3.4-300.fc23.x86_64; KDE/4.14.16; x86_64; ;
	)
In-Reply-To: <1454934920.8641.4.camel@intel.com>
References: <1454914617-2042-1-git-send-email-patrick.ohly@intel.com>
	<1454921553.16142.42.camel@linuxfoundation.org>
	<1454934920.8641.4.camel@intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH] buildhistory.bbclass: remove out-dated information on request
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
X-List-Received-Date: Wed, 10 Feb 2016 12:31:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Mon, 08 Feb 2016 13:35:20 Patrick Ohly wrote:
> On Mon, 2016-02-08 at 08:52 +0000, Richard Purdie wrote:
> > On Mon, 2016-02-08 at 07:56 +0100, Patrick Ohly wrote:
> > > buildhistory.bbclass by design is incremental: each build adds or
> > > updates information. Information is never removed.
> > > 
> > > Sometimes it can be useful to reduce the information only to those
> > > recipes that were build during a specific bitbake invocation, for
> > > example when the invocation does a full world build.
> > > 
> > > This is now possible by invoking bitbake with:
> > >    BB_ENV_EXTRAWHITE=BUILDHISTORY_REMOVE_OLD
> > > 
> > > BUILDHISTORY_REMOVE_OLD=1 bitbake

I think you'd be more likely to just set this in the auto.conf created by the 
CI infrastructure, but of course there's nothing to stop you doing it this 
way.

> > > In this mode, buildhistory.bbclass first moves all existing
> > > information into a temporary directory called "old" inside the build
> > > history directory. There the information is used for the "version
> > > going backwards QA check". Then when the build is complete and before
> > > (potentially) committing to git, the temporary directory gets
> > > deleted.
> > > 
> > > Because information that has not changed during the build will be
> > > reconstructed, a git log will then only show real updates, additions
> > > and removals.
> > > 
> > > Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> > 
> > The implicit assumption here is that you'd only every build large
> > targets like "world". A "bitbake bash" isn't really going to do what
> > you'd expect/want.
> 
> Yes, I know. I think the "reduce the information only to those recipes
> that were built during a specific bitbake invocation" is a bit clearer
> about that than the last paragraph, which assumes a full build.
> 
> > I think we need to make that clearer in the comments and that this is
> > only useful on automated infrastructure.
> 
> I wouldn't say that. One could do "BUILDHISTORY_REMOVE_OLD=1 bitbake
> <something> && bitbake <something else> && bitbake <even more>", and
> that would work fine also when doing manual builds. The drawback in that
> case is that the version-going-backwards check does not work for
> <something else> and <even more>.
> 
> Perhaps it would be more appropriate to replace BUILDHISTORY_REMOVE_OLD
> with "BUILDHISTORY_RESET"?

FWIW, I'm reasonably happy with this if we add the suggested comments and 
rename the variable to BUILDHISTORY_RESET.

Cheers,
Paul

-- 
Paul Eggleton
Intel Open Source Technology Centre

