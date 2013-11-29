Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6E59C6DC1C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2013 18:03:21 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Nov 2013 10:03:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,798,1378882800"; d="scan'208";a="417006729"
Received: from pmcgurk-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.121.192])
	by orsmga001.jf.intel.com with ESMTP; 29 Nov 2013 10:03:17 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 29 Nov 2013 18:03:16 +0000
Message-ID: <153974778.HzVWmOegEz@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CAP71Wjy9-8pkU0bLKsn5L-SFDFeidW56ZEuLV25geN1_7ykgHA@mail.gmail.com>
References: <2455395.bHzIGNWoWP@helios>
	<CAP71Wjy9-8pkU0bLKsn5L-SFDFeidW56ZEuLV25geN1_7ykgHA@mail.gmail.com>
MIME-Version: 1.0
Cc: Yocto list discussion <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Automated testing on real hardware
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
X-List-Received-Date: Fri, 29 Nov 2013 18:03:22 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Nicolas,

On Friday 29 November 2013 17:31:40 Nicolas Dechesne wrote:
> On Fri, Nov 29, 2013 at 4:58 PM, Paul Eggleton <
> paul.eggleton@linux.intel.com> wrote:
> > * It requires root to run, since it mounts the images temporarily and
> > modifies the contents. We've done quite a lot to avoid having to run as
> > root in OE, so this is a hard sell.
> 
> i have forwarded this email to the relevant people in Linaro working on
> LAVA. I hope to be able to bring more information about that, as I am not
> involved with LAVA, just a 'user' of it. 

OK, thanks. I'm certainly happy to have a wider discussion on this.

> By 'root' here, you mean on the server side, e.g. the LAVA instance, which
> will typically not be the 'builder', or do you want to couple build and test
> on the same 'server'?

That's what I've been looking at - just using lava-dispatcher rather than the 
full LAVA framework. That said, if all it requires root for is mounting the 
image, modifying it and then unmounting it, to test our images I don't think 
we even want this; but there appears to be no way to disable it. I then found 
a launchpad bug where the root requirement was discussed and the accepted 
solution there was for the dispatcher to just check and error out if not 
running as root.

> LAVA jobs are generally submitted by a CI instance (Jenkins in our case).

Our test code currently queries configuration/image information from the build 
system, which means that the build system has to be involved in the dispatch 
process. Our CI solution (the autobuilder) of course runs the build system 
though. One of the work items in my email is to be able to export the tests, 
thus decoupling them from this; the build system would still need to be in 
charge of exporting the tests, but it would allow a test server to manage the 
deployment, execution and results collection.
 
> > * It expects images to be created by linaro-media-create, which in turn
> > requires an "hwpack" [2]. The hwpack concept seems primarily geared to
> > Ubuntu and distributions like it where you'd have a generic base image
> > upon which you'd install some board-specific packages in order to make it
> > work on the board. OE doesn't work that way - we just build images specific
> > to the board, which makes this mechanism completely superfluous for our
> > usage; but the tool appears to require it.
> 
> that is no longer the case. we do have support for 'native' OE images, and
> we've had that for a while. That is what I am using for my project at
> Linaro. None of our projects/jobs deliverable are 'public' at the moment,
> so you won't find them, but i can confirm that what we deploy for our jobs
> is the output of OE (e.g. what is in the deploy/image folder). hwpack was
> something mostly meant to make it simpler to work with Ubuntu and Android
> root FS, and is not suited for OE.

OK, fair enough - I guess the trouble here is it's hard to find any 
documentation talking about this functionality; everything I could find that 
talks about preparing an image refers to needing an hwpack and using linaro-
media-create. Even mailing list posts that I found (admittedly from last year) 
referred to these in the context of booting OE images; there are also hwpacks 
offered for download under "openembedded" directories on releases.linaro.org. 
Given these I hope you can understand my confusion.

Generally, if someone with experience of doing so successfully could document 
how LAVA can be set up to test OE images I think that would be very helpful. I 
did struggle a bit with the documentation - there are still quite a lot of 
broken links to the old documentation on readthedocs.org.

> > * It's not clear to me how well it will work across different host
> > distributions that we want to support; the main LAVA installer quits if it
> > isn't run on Ubuntu. For convenience I happened to be using an Ubuntu VM,
> > and I wasn't running the full installer so I avoided this check
> > altogether. It just concerns me that such a check would even be there.
> 
> I agree that this is a problem and we should fix. Our IT infrastructure is
> largely based on Ubuntu servers, but that should not affect what we create
> that much.

Right. FWIW, as you probably know, the way we handle "unsupported" host 
distros is to allow running on them, but warn the user that they may 
experience problems (well, in our case we provide this host distro check 
functionality, it's on in Poky and off in OE-Core by default, not sure if 
others are using it).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

