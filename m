Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8AFFD60B9B;
	Sat, 28 Dec 2013 11:41:40 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Dec 2013 03:41:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,566,1384329600"; d="scan'208";a="430996765"
Received: from acdivito-mobl.gar.corp.intel.com (HELO helios.localnet)
	([10.252.122.61])
	by orsmga001.jf.intel.com with ESMTP; 28 Dec 2013 03:41:39 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Philip Balister <philip@balister.org>
Date: Sat, 28 Dec 2013 11:41:37 +0000
Message-ID: <1566199.MAIPYk4j6n@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-34-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <52B8DECA.6060704@balister.org>
References: <CAJTo0LZsBfxGm=OJPa++egDjL6L0ZABMebTtTr_Bmw_TdQrohg@mail.gmail.com>
	<52B8DECA.6060704@balister.org>
MIME-Version: 1.0
Cc: Poky Project <poky@yoctoproject.org>,
	OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Piglit in Poky
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
X-List-Received-Date: Sat, 28 Dec 2013 11:41:40 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 23 December 2013 20:09:30 Philip Balister wrote:
> On 12/23/2013 01:01 PM, Burton, Ross wrote:
> > We'd like to integrate Piglit (an OpenGL test suite) into Poky so that
> > we can run automated QA on the GL stack.  Piglit is currently residing
> > in meta-oe, but as Poky is a self-contained project we can't just add
> > meta-oe to it:  apart from the size of meta-oe, we can't ensure
> > stability if meta-oe makes incompatible changes that affect Poky.
> > 
> > Piglit isn't a stand-alone package, there are the dependencies of
> > waffle, python-mako and python-numpy to consider too.  There are two
> > possibilities I can see:
> > 
> > 1) Move piglit and deps to oe-core.  Piglit is for QA purposes only
> > and pushes the boundaries of "core platform".  In a sense this is a
> > repeat of the discussion we had with Midori...  does oe-core contain
> > everything needed to sufficiently exercise the core components it
> > ships or not?
> 
> I expect Richard will push back on this, and I would support him here.

This all depends on the scope of these tools. If the scope is only the Yocto 
Project QA team, adding them to the core would be a difficult sell. However, if 
the target audience were a larger number of BSP maintainers (and to be honest, 
I would expect maintainers of BSPs for hardware supporting GL acceleration to 
want to be able to run these tests) then adding these components to the core 
starts to make sense, to me at least.

> > 2) Add piglit and deps to meta-yocto.  Probably a new layer called
> > meta-yocto-qa (or similar) because the Yocto Compatible guidelines
> > forbid mixing distribution policy and recipes.  We'd need to sync
> > meta-yocto-qa with the pieces of meta-oe that we want somehow, but
> > that's our problem.
> 
> So meta-yocto is right out. I'm a user of numpy, and I certainly do not
> want to include something called meta-yocto-qa just to pick up numpy.
> 
> So this presents a quandry. Moving numpy to a special layer to support a
> specific recipe is just not the right thing to do. Conceivably, we could
> create a layer for the bits of meta-oe that are python related, but I am
> not sure that solves your entire problem.
> 
> I certainly do not want to see one recipe appear in two layers. That is
> a recipe for trouble.

There is a "third" way - use combo-layer to keep a maintained copy of the 
recipe in the "meta-yocto-qa" layer, just as we do with OE-Core within the 
poky repository. It has worked well enough there, although here we would be 
being more selective about the recipes we were pulling; it could be 
problematic if for example a dependency were added from a recipe that is part 
of the filter on a recipe that is not part of the filter.

> Long term, we need to make the layer model work for the entire project
> and get over the reluctance to use other peoples layers.

This is a tricky thing. If we start relying heavily on layers for our builds 
that we don't currently have an active role in maintaining, there will be a 
natural assumption that we'll step up and help maintain those layers; it will 
be made more difficult if those layers contain a large number of recipes.

Specifically regarding meta-oe, as you may be aware our reluctance to use this 
layer directly up to now was because of its use of bbappends and overlayed 
recipes that change the apparent behaviour of core recipes. Most of this has 
been tidied up, however one last such issue still exists [1] and is apparently 
still leading to problems for users [2], so there is still work needing to be 
done here.

Cheers,
Paul

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=5546
[2] https://lists.yoctoproject.org/pipermail/poky/2013-December/009463.html

-- 

Paul Eggleton
Intel Open Source Technology Centre

