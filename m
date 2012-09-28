Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1THiFJ-0007DW-HZ for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 23:37:17 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8SLOKY1014806;
	Fri, 28 Sep 2012 22:24:20 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14346-03; Fri, 28 Sep 2012 22:24:14 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8SLOCLc014800
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 28 Sep 2012 22:24:13 +0100
Message-ID: <1348867454.15753.84.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 28 Sep 2012 22:24:14 +0100
In-Reply-To: <20120928180251.GB3049@jama.jama.net>
References: <1348782166.15753.28.camel@ted>
	<20120928180251.GB3049@jama.jama.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: OE-Core Release Status
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Sep 2012 21:37:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-09-28 at 20:02 +0200, Martin Jansa wrote:
> On Thu, Sep 27, 2012 at 10:42:46PM +0100, Richard Purdie wrote:
> > We're now at -rc2 for the October release of OE-Core. I've noticed a
> > sudden surge of patches on the list, several of which are things like
> > version increments which are no longer really appropriate at this point
> > in the release cycle.
> > 
> > Why haven't we branched?
> > 
> > The plus side of branching now would be continued patches into master.
> > The downside is that QA and autobuilder resources are concentrating on
> > release and hence not on ensuring regressions are being added. I also
> > really need my energy focused on the release rather than reviewing other
> > code. I'm out of bandwidth so I'm putting off branching.
> > 
> > There is also the risk that if we branch, people will continue with
> > master development and ignore the release branch and I'd like to apply a
> > little pressure against this.
> > 
> > So if patches are getting ignored its likely they've been deemed not
> > suited to the state of the tree right now. I may start to queue things
> > on master-next but no guarantees and I would ask people to try and help
> > make the release a good one.
> > 
> > If there are patches being ignored you think do qualify for -rcX, please
> > ping me as it is hard to keep track of everything.
> 
> I don't know what to do with tune* and qt patchset.
> 
> This one is not important, but if you like the idea then it would be
> better to get it in this release already:
> [PATCH] kernel.bbclass: include PE in KERNEL_IMAGE_BASE_NAME

The trouble is this close to release, this will likely break the
autobuilder or qemu scripts or something like that. We can't just rename
output like that without quite a bit of checking :(.

> And I have 2 patches to remove time dependent variables from images
> which I haven't sent to ML yet, because still testing if it has some bad
> sideeffect and if it's enough to resolve the issue I was seeing.
> I'll send them as RFC.
> 
> commit 9c65f68dc380be34f06c4677d6867bbb874a75d1
> Author: Martin Jansa <Martin.Jansa@gmail.com>
> Date:   Wed Sep 26 15:56:05 2012 +0200
> 
>     bitbake.conf: exclude DATETIME var dependency from IMAGE_NAME
>     
>     * resolves ERROR shown when bitbake -S is used for image:
>       ERROR: Bitbake's cached basehash does not match the one we just generated
>       (/OE/oe-core/openembedded-core/meta/recipes-core/images/core-image-minimal.bb.do_rootfs)!
>       ERROR: The mismatched hashes were 8c35cdf8a5d09c03941f081dd9f6d8dc and b5d6e2e5952770557c48c5779ddb73fc
>     
>     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Hmm, that might be ok...

> commit 7173532f91a755911e4822a103c98e7b81b18cb6
> Author: Martin Jansa <Martin.Jansa@gmail.com>
> Date:   Wed Sep 26 00:57:21 2012 +0200
> 
>     rootfs_*.bbclass: exclude BUILDNAME var dependency from do_rootfs
>     
>     * I have kernel recipe which depends on other recipe to build tiny initramfs
>       image, without this change it rebuilds not only that initramfs image
>       but also whole kernel when DATE or TIME is changed and OEBasicHash enabled
>     * also resolves ERROR shown when bitbake -S is used for image:
>       ERROR: Bitbake's cached basehash does not match the one we just generated
>       (/OE/oe-core/openembedded-core/meta/recipes-core/images/core-image-minimal.bb.do_rootfs)!
>       ERROR: The mismatched hashes were 8c35cdf8a5d09c03941f081dd9f6d8dc and b5d6e2e5952770557c48c5779ddb73fc
>     
>     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Doesn't the above fix obsolete this one?

Cheers,

Richard





