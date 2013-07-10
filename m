Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 34275605A0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 17:39:33 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 10 Jul 2013 10:41:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1037,1363158000"; d="scan'208";a="368164362"
Received: from unknown (HELO helios.localnet) ([10.252.122.30])
	by fmsmga002.fm.intel.com with ESMTP; 10 Jul 2013 10:39:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
Date: Wed, 10 Jul 2013 18:39:20 +0100
Message-ID: <2537500.7dBumEqH9t@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <51DD5C13.1040701@topic.nl>
References: <20130706213931.GD3288@jama>
	<1373459893-23611-1-git-send-email-Martin.Jansa@gmail.com>
	<51DD5C13.1040701@topic.nl>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: sstate-cache and making a package "host-dependent"
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
X-List-Received-Date: Wed, 10 Jul 2013 17:39:33 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Mike,

On Wednesday 10 July 2013 15:05:23 Mike Looijmans wrote:
> I added a buildserver that also exports its "sstate-cache" directory, so
> that other build machines can grab their stuff from it. This works fine,
> but I have one problem. Some packages are meant to be dependent on the
> system that built it. I want to enforce that each build machine creates
> its own package, and does not grab it from the sstate-cache of the
> central server.
> 
> For example,
> 
> $ cat recipes-core/meta/distro-feed-configs.bbappend
> PRINC="1"
> DISTRO_HOST_NAME ?= "${@os.uname()[1]}"
> DISTRO_FEED_NAME ?= "feed"
> DISTRO_FEED_PREFIX = "topic"
> DISTRO_FEED_URI =
> "http://${DISTRO_HOST_NAME}/${DISTRO_FEED_NAME}/${MACHINE}"
> 
> 
> The purpose being that the host name of the machien that built the image
> ends up in the opkg config files. This works just fine.
> Now that we have a central server, all images on all build hosts grab
> the package from the sstate-cache server, resulting in the feed pointing
> to the central server instead of the private one, which is not what I
> wanted to happen.
> 
> After reading the documentation, I added the following line to the recipe:
> 
> PACKAGE_ARCHS[vardeps] = "DISTRO_FEED_URI"
> 
> This did not have the desired effect. The package is still retrieved
> from the cache, and not rebuilt locally. Even if I clean and force a
> rebuild of the distro-feed-configs package, the package that ends up in
> the image is still the one from the central server.
> 
> What am I missing here?

I think distro-feed-configs (from meta-oe, not OE-Core) is for package 
installation on the target, and has nothing to do with shared state.

I'm not sure if it's entirely appropriate, but you could take a similar 
approach to the one we use for preventing native sstate packages from mixing 
across different distributions (mostly to sidestep host glibc version 
dependency problems) - set SSTATE_EXTRAPATH to some value for the recipes you 
don't want to share and then the packages will go into a subdirectory named 
with that value; you could then delete these automatically from the server.

Cheers,
Paul

PS if you could please avoid replying to an existing thread for a new 
discussion, that would be great.

-- 

Paul Eggleton
Intel Open Source Technology Centre

