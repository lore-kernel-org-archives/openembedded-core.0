Return-Path: <brendan.le.foll@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 49F2E6E5CB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 10:11:13 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 Aug 2016 03:11:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,529,1464678000"; d="scan'208";a="1042668100"
Received: from hippo.iwi.intel.com ([172.28.33.152])
	by fmsmga002.fm.intel.com with ESMTP; 17 Aug 2016 03:11:13 -0700
Date: Wed, 17 Aug 2016 11:11:13 +0100
From: Brendan Le Foll <brendan.le.foll@intel.com>
To: Christopher Lord <clord@mozilla.com>
Message-ID: <20160817101112.GA20728@hippo.iwi.intel.com>
References: <CABDc_zW0Mi9a5G+neZMSAC5mRVo8LC-62ew_X9PiKM8uVxhAUA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABDc_zW0Mi9a5G+neZMSAC5mRVo8LC-62ew_X9PiKM8uVxhAUA@mail.gmail.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: paul.eggleton@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: npm.bbclass
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
X-List-Received-Date: Wed, 17 Aug 2016 10:11:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 16, 2016 at 05:41:28PM +0100, Christopher Lord wrote:
>    I've been using npm.bbclass with various node projects we're working on
>    in the Connected Devices team at Mozilla, and had some
>    questions/comments about behaviour (note that I'm basing this off of
>    ostro master, which I unfortunately have to use as no other Intel
>    Edison bsp is adequate);

I'm sorry :/

>    - Is there a good reason the npm fetcher only works with a registry? It
>    seems it could get most (all?) pertinent information from a
>    package.json in the root of a repository.

Not really a good reason, I'm trying to make it so that you can use it
with a git fetched source but I haven't had the time to finish it off.
It's on the todo list :)

>    - Is there a reason to split the package like it does? Node projects
>    tend to have huge dependency trees, it makes updating and distributing
>    node-based applications a bit of a chore if they end up split into 20
>    packages, most of which have no use separately. It would be great if
>    there was at least a way to disable this.

Paul added this, the worry was that we wanted to make sure all the
licenses where tracked properly of the package etc... I'm not a huge
fan either to be honest. Maybe we can have a npm-no-split.bbclass
would that be ok - Paul? It's in python populate_packages_prepend in
npm.bbclass.

>    - The information about packaging non-registry software here:
>    [1]https://wiki.yoctoproject.org/wiki/TipsAndTricks/NPM is incomplete -
>    you also need to generate a shrinkwrap and install that into the
>    srcdir, or you're very likely to get failures doing dependency
>    resolution. Not an OE issue, but I guess Yocto folks also read this
>    list and it's related :)

Agree 100%, that is still WIP, Henry can you make sure you add a how
to use the npm lockdown file too in the tutorial? Note - If you use
recipetool It does this by default :). And recipetool with node.js
pkgs is quite cool imho.

>    - Any patches end up getting packaged because they get put in the
>    srcdir. I'm guessing this isn't intentional (or maybe it is?)
>    Just wanted to provide some feedback. It's fantastic that OE has the
>    ability to package node software, and despite the teething
>    difficulties, I've appreciated its availability!

That is a good point, didn't think about it tbh. in npm.bbclass we
could maybe delete everything that looks like a patch before
compilation, little bit worried there might be nasty side effects but
I can try :)

Thanks for the comments!
Brendan


