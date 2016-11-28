Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3F71271A88
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 10:11:30 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 28 Nov 2016 02:11:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,563,1473145200"; d="scan'208";a="1074427295"
Received: from yuenyewk-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.186.79])
	by fmsmga001.fm.intel.com with ESMTP; 28 Nov 2016 02:11:25 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Date: Mon, 28 Nov 2016 23:11:22 +1300
Message-ID: <5308703.KLEPbEOQKq@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.8.8-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <b3516f43-75eb-2fa5-31c6-ad5e3a57d032@pabigot.com>
References: <b3516f43-75eb-2fa5-31c6-ad5e3a57d032@pabigot.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: npm.bbclass support for deep native modules?
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
X-List-Received-Date: Mon, 28 Nov 2016 10:11:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Peter,

On Sat, 26 Nov 2016 18:17:48 Peter A. Bigot wrote:
> I'm using the current head of morty and trying to get a handle on the
> new nodejs support in OE.
> 
> I'm failing to build a recipe for statsd.  Starting with this:
> 
>      devtool add 'npm://registry.npmjs.org;name=statsd;version=0.8.0'
>      bitbake statsd
> 
> produces an error related to the modern-syslog dependency:
> 
>   DEBUG: Executing shell function do_compile
> 
> | npm ERR! Linux 4.4.0-47-generic
> | npm ERR! argv
> 
> "/mnt/devel/oe/omap/build-bb-morty-master/tmp/sysroots/x86_64-linux/usr/bin/
> node"
> "/mnt/devel/oe/omap/build-bb-morty-master/tmp/sysroots/x86_64-linux/usr/bin
> /npm" "--arch=arm" "--target_arch=arm" "--production" "--no-registry"
> "install"
> | npm ERR! node v4.6.1
> | npm ERR! npm  v2.15.9
> 
> | npm ERR! Registry not defined and registry files not found:
> "/mnt/devel/oe/omap/build-bb-morty-master/tmp/work/cortexa8hf-neon-poky-linu
> x-gnueabi/statsd/0.8.0-r0/npm_cache/noregistry/modern-syslog/.cache.json",
> "/mnt/devel/oe/omap/build-bb-morty-master/tmp/work/cortexa8hf-neon-poky-lin
> ux-gnueabi/statsd/0.8.0-r0/npm_cache/modern-syslog/.cache.json".
> 
> modern-syslog 1.1.2 needs node-gyp to build a native component and
> https://wiki.yoctoproject.org/wiki/TipsAndTricks/NPM notes that devtool
> can't detect such things.  Doing this works fine to build that package:
> 
>      devtool add 'npm://registry.npmjs.org;name=modern-syslog;version=1.1.2'
> bitbake modern-syslog
> 
> but I'm having no luck getting "bitbake statsd" to find the result.
> I've added:
> 
>      DEPENDS = "modern-syslog"
> 
> to statsd_0.8.0.bb but that isn't helping.  It looks like I need some
> way to have the recipe install the prepared modern-syslog into the cache
> (or globally?) before baking statsd, but since the cache gets cleared in
> npm_do_compile() it's not clear how to make that happen.
> 
> I'm very rusty with OE (two years away), so am I missing something or is
> this just beyond what the bitbake infrastructure can currently handle?
> If so, can somebody suggest a way to hand-patch the recipe, or outline
> how npm.bbclass might be extended to support this?

Disclaimer - I'm the one who has been doing most of the recent work with npm 
support (aside from the node.js recipe and the original npm fetcher plugin, 
which were the work of others) however my knowledge of node.js is pretty 
limited - most of it has been picked up along the way. So unfortunately I 
can't immediately see why this isn't working. The thing that puzzles me in 
particular about the error you're seeing though is that we're explicitly 
telling npm not to look for a registry, so why is it complaining about the 
lack of a registry?

Henry / Brendan - any suggestions?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

