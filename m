Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1728B6B22E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 10:38:22 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 02 Aug 2013 03:38:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,800,1367996400"; d="scan'208";a="380041950"
Received: from unknown (HELO helios.localnet) ([10.252.122.201])
	by fmsmga002.fm.intel.com with ESMTP; 02 Aug 2013 03:38:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Fri, 02 Aug 2013 11:38:20 +0100
Message-ID: <2141715.fZzytAtgVl@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <51FB787A.2040406@windriver.com>
References: <cover.1375354695.git.hongxu.jia@windriver.com>
	<2353783.439DWQmp63@helios> <51FB787A.2040406@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] list-packageconfig-flag.py: add a script to list all PACKAGECONFIG's flags
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
X-List-Received-Date: Fri, 02 Aug 2013 10:38:22 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 02 August 2013 17:14:34 Hongxu Jia wrote:
> On 08/02/2013 04:24 PM, Paul Eggleton wrote:
> > So, this is fairly simple and works for most cases; however it would
> > probably be a bit more robust if the script used bitbake's own parser to
> > extract the flags. The "tinfoil" module should help with this. We can
> > always address this in a follow-up patch later on, though - I can
> > certainly show you some examples of how to do this or I can do it,
> > whichever you prefer.
> 
> Great, this is what I hope to do in the follow-up, I am very pleased to
> do the investigate on bitbake parser, very thankful to share some
> examples of how to do this with me.

Sure - we use the parser in the layer index. The latest in-development code
has a module that does most of the work:

http://git.yoctoproject.org/cgit/cgit.cgi/layerindex-web/tree/layerindex/recipeparse.py?h=paule/features

Specifically, you can call bb.cache.Cache.loadDataFull() for each recipe file
and that will give you a datastore you can query for information.

I'm not sure, but you may wish to use bitbake's cache to get the list of recipes
rather than just walking the directory tree so the utility has the same
understanding of PN and preferred versions as bitbake. If you do want to
go down this route I've put together this example:

https://gist.github.com/bluelightning/6138980

Hope this helps.

> Should this simple patch be accepted? And I will include bitbake parser
> in follow-up patch.
> Or
> Drop this patch and waiting till bitbake parser has been included.

I'd say let's accept this simple version for now after the naming/message
corrections (especially since it's a contrib script) and then follow up 
with another patch when you have the bitbake-based version working.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

