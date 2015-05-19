Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C42FA60168
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 08:35:37 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 19 May 2015 01:35:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,457,1427785200"; d="scan'208";a="573520546"
Received: from jmcmill1-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.0.158])
	by orsmga003.jf.intel.com with ESMTP; 19 May 2015 01:35:38 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Tue, 19 May 2015 09:35:36 +0100
Message-ID: <5994133.HlFem3UHYJ@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/3.19.7-200.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <555AE1AB.8070907@windriver.com>
References: <55555B65.80600@windriver.com>
	<3693019.ZXHb2MZYRx@peggleto-mobl.ger.corp.intel.com>
	<555AE1AB.8070907@windriver.com>
MIME-Version: 1.0
Cc: Christopher Larson <clarson@kergoth.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Add something like bitbake -cmenuconfig <recipe>?
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
X-List-Received-Date: Tue, 19 May 2015 08:35:39 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 19 May 2015 15:09:31 Robert Yang wrote:
> Has a uniform backend for configuration sounds like a good idea, here are
> some rough thoughts that we can do in metadata, please feel free to give
> your comments:
> 
> 1) Add a conf file, bbclass or bb which contains the configable var list
>     for the build, for example, DISTRO, MACHINES, DISTRO_FEATURES,
>     PACKAGE_CLASSES and so on, we need maintain this file manually, we can
>     discuss what is configurable in the mailing list, it may cost us a few
>     time, but it is really good for OOBE, and would make the new user's
>     life more easier.
> 
> 2) Other layer can extend the configable var list easily.

I'd rather we end up with the configuration being defined where the variable is 
actually used - it's tidier and easier to extend.

> 3) Suppose we call the file config-build (.conf, .bbclass or .bb).
> 
> 4) The UIs (toaster UI, web HOB, or menuconfig) can invoke the contents in
>     config-build and display them.
> 
> 5) The format of config-build can be:
>     CONFIG_MACHINE[keys] = "machine1, machine2, ..."
>     # The machines should be got automatically from a function.
>     CONFIG_MACHINE[doc] = "xxx"
>     # Re-use the MACHINE[doc] in meta/conf/documentation.conf
>     [snip]

MACHINE is such that we don't need to define the valid values for it - we can 
simply search for conf/machine/*.conf along BBPATH. (This is what Hob does, 
the mechanism it uses for finding conf files probably still exists.)
 
>     CONFIG_IMAGE_FSTYPES[keys] = "typ1, type2, ..."
>     CONFIG_IMAGE_FSTYPES[doc] = "xxx"
>     CONFIG_IMAGE_FSTYPES[bbclass] = "image"
>     # The required bbclass.
>     [snip]

Similarly here we already have IMAGE_TYPES which defines the valid choices for 
IMAGE_FSTYPES. Possibly not ideal, but it does already exist. On bbclasses, 
surely the usage for a class and any variables it supports ought to be defined 
in the class itself (see bug 6059), then it's easily applicable to any class 
outside of the core.

I think we need to step back a bit and think about how this should be 
implemented properly. I would urge you to consider that we went through a lot 
of this stuff already quite some time ago with Hob; not that that ended up as a 
perfect codebase by any means, but it would be worth learning from it.

As Chris was suggesting I'd rather we look at setting up a type declaration 
mechanism (possibly at the bitbake level?) and make use of that rather than 
creating something just for this UI where possible.
 
> 6) The result will be saved to a file such as local.conf.extend, and
>     local.conf will include/require it.

We went back-and-forth on this in the Hob timeframe; eventually it was 
realised that what people really wanted is to have the settings applied in 
local.conf itself rather than some UI-specific conf file. (On the other hand, 
thinking further ahead, we ought to be thinking about distro customisation and 
whether it's really appropriate to put every setting in local.conf as opposed 
to a custom distro config that you select via DISTRO.)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

