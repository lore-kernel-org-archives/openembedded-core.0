Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C735B73175
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 16:15:01 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 24 Feb 2016 08:14:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,494,1449561600"; d="scan'208";a="910352162"
Received: from jlock-mobl1.gar.corp.intel.com ([10.252.7.109])
	by fmsmga001.fm.intel.com with ESMTP; 24 Feb 2016 08:14:31 -0800
Message-ID: <1456330468.5333.16.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Date: Wed, 24 Feb 2016 16:14:28 +0000
In-Reply-To: <1456328275.30039.49.camel@intel.com>
References: <cover.1456325292.git.joshua.g.lock@intel.com>
	<1456328275.30039.49.camel@intel.com>
X-Mailer: Evolution 3.18.5.1 (3.18.5.1-1.fc23) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/10] Integrate swupd software updater
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
X-List-Received-Date: Wed, 24 Feb 2016 16:15:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-02-24 at 16:37 +0100, Patrick Ohly wrote:
> Hello!
> 
> I haven't had a chance to play with the actual code yet and I don't
> know
> yet when I'll be able to. Let me ask for some clarifications about
> the
> approach first anyway.
> 
> On Wed, 2016-02-24 at 14:52 +0000, Joshua Lock wrote:
> > 
> > Approach:
> > An image that inherits the swupd-image bbclass will automatically
> > have bundle
> > 'chroots' created which contain the filesystem contents of the
> > specified
> > bundles, with the contents of the inheriting image forming the
> > default os-core
> > bundle.
> > 
> > The mechanism to achieve this is that several virtual image recipes
> > are created
> > using the swupdbundle class, one for each defined bundle plus a
> > 'mega' image
> > recipe. The 'mega' image contains the base image plus the contents
> > of all of the
> > bundles, whilst bundle images contain only the base image plus the
> > contents of a
> > single bundle.
> Just to be sure, the actual "content" (a term that is a bit too
> overloaded to be used precisely in all cases) of a file and its meta
> attributes will come from the mega image, and the virtual image
> recipes,
> including the base image, are merely used to generate file lists?

That's not currently true, no — the file contents for a bundle come
from the bundle image and the file contents for os-core come from the
base image. It shouldn't be too difficult a change to make, I'll take a
look now.

> What is the content of the actual image that gets created? It has to
> match the content (= file content and meta information) of the mega
> image and not of the base image, otherwise there can be
> inconsistencies
> between the actual running image and the core os bundle. I suppose
> swupd
> will be able to fix that, but I'm not sure.
> 
> It sounds like this bundle creation is completely separated from the
> regular image creation; if so, then I suspect that this may have to
> change.

Right, currently bundle creation happens after image creation and as
above bundles are populated from the rootfs of the bundle images.

You're right, of course, we'll need to construct the running image from
the bundle contents for more complex images.

> > 
> > We took the approach of building images, rather than populating the
> > chroot-like
> > bundle directories with a package manager, because various layers
> > and recipes
> > make changes to the rootfs contents outside of the package manager,
> > particularly
> > with IMAGE_POSTPROCESS_COMMAND, etc.
> Makes sense to me.
> 
> Have you considered generating the file lists more efficiently? I can
> think of some alternatives, but all have downsides.
> 

I did consider a couple of other approaches but with a goal of
submitting this for M3 this approach felt like the surest route within
the time available. I'd certainly like to find a more efficient method
and if you have any suggestions I'd be happy to hear them.

Regards,

Joshua

