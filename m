Return-Path: <mac@mcrowe.com>
Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
	by mail.openembedded.org (Postfix) with ESMTP id 2C44D77226
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 11:14:52 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout06 with smtp
	id CzEq1s0070BmcFC01zEr2j; Mon, 01 Feb 2016 11:14:52 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.1 cv=Rr04V3SK c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=L9H7d07YOLsA:10 a=9cW_t1CCXrUA:10 a=s5jvgZ67dGcA:10 a=kj9zAlcOel0A:10
	a=jFJIQSaiL_oA:10 a=BkSv4lXCrV1DmqWJtFMA:9 a=VWKo1J5PeS2DiUcm:21
	a=vmJOQ6Y-xWbsVOxD:21 a=CjuIK1q_8ugA:10
Received: from mac by deneb with local (Exim 4.84)
	(envelope-from <mac@mcrowe.com>)
	id 1aQCRW-0007Y4-Ot; Mon, 01 Feb 2016 11:14:50 +0000
Date: Mon, 1 Feb 2016 11:14:50 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160201111450.GA28760@mcrowe.com>
References: <20160129154748.GB19208@mcrowe.com>
	<1454089333.10340.80.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1454089333.10340.80.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: package.tgz files not touched in sstate-cache
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
X-List-Received-Date: Mon, 01 Feb 2016 11:14:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Friday 29 January 2016 at 17:42:13 +0000, Richard Purdie wrote:
> On Fri, 2016-01-29 at 15:47 +0000, Mike Crowe wrote:
> > We have a shared sstate-cache that is populated by us building nightly
> > images for various branches using Jenkins. This cache is pruned
> > periodically (with special care of the siginfo files since we don't have
> > 80b3974081c4a8c604e23982a6db8fb32c616058 yet.)
> > 
> > Recently we went back to one of those branches that hadn't been changed for
> > a while and were surprised to find that Bitbake wanted to build loads of
> > packages from source.
> > 
> > It turned out that whilst the populate_sysroot.gz and package_ipk.tgz files
> > were still in the sstate-cache, the package.tgz tarball was not. This meant
> > that the whole package was built again in order to satisfy the build
> > dependencies of other packages that had changed.
> > 
> > I'm suspicious that this behaviour was introduced by the optimisation in
> > a0f584ac3d5a94dec121b684206ecd40c968f7fc so we hadn't seen it on older
> > branches.
> > 
> > Is there a way to cause the package.tgz file to be touched during these
> > nightly builds too? Or, is there a way to get hold of the complete set of
> > sstate files so they can be touched all in one go?
> 
> The "right" answer here is to figure out what in your builds seems to
> be needing the package.tgz files.
> 
> The only time the system should need to pull the package tgzs from
> sstate is if package_qa or package_write_* were going to rerun. This
> doesn't happen often, if ever. I've sometimes wondered if we should in
> fact generate them. They are useful for switching package backends.

Indeed. These files are currently taking up over fifty gigabytes in our
shared sstate-cache!

> So the fact they're not getting touched doesn't surprise me. The more
> concerning thing is that its actually trying to use them.
> 
> We have found a number of bugs in this area in sstate and have some
> patches merged, I know there are a small number pending too. Whether
> we've found all the issues remains unknown.

The branch we saw this on was using dizzy from about
e848484989307ae6826ba0f5217f7702322181e3 so it's quite likely that we're
lacking some more recent fixes.

I've tried to reproduce the problem with the current tip of oe-core and
cannot so I'll go looking for patches.

> For debugging this, you usually need the task graph info and the -DDDv
> output of a build, then investigate what was depending on the package
> sstate file.

Thanks for your help.

Mike.

