Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 2D1676E759
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Mar 2014 22:58:51 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2GMwhSK013380; Sun, 16 Mar 2014 22:58:43 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id g5ZJQNlX00S2; Sun, 16 Mar 2014 22:58:43 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2GMwZk7013372
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sun, 16 Mar 2014 22:58:37 GMT
Message-ID: <1395010710.3808.15.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Detlev Zundel <dzu@denx.de>
Date: Sun, 16 Mar 2014 22:58:30 +0000
In-Reply-To: <m2ob19robv.fsf@lamuella.denx.de>
References: <090257310d9e463d93ee5cd5fd4d27fe@DM2PR03MB399.namprd03.prod.outlook.com>
	<1387795367.11527.1.camel@ted> <m2ob19robv.fsf@lamuella.denx.de>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Why to make branch info is mandatory for non-master commit with latest bitbake
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
X-List-Received-Date: Sun, 16 Mar 2014 22:58:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-03-14 at 12:50 +0100, Detlev Zundel wrote:
> Hi Richard,
> 
> sorry to jump in so late, but I just realized that this "small" change
> has some impact also on our ELDK recipies, so I would really like to
> understand where the change comes from and why we couple a persistent
> specification (commit ID) with a transient specification (branch name).
> With all my previous git experience, this looks at least somewhat
> strange.
> 
> > On Mon, 2013-12-23 at 06:41 +0000,
> > zhenhua.luo@freescale.com wrote:
> >> Previously the branch name doesn't need to be defined when a
> >> non-master branch commit is referred in recipe, this has been changed
> >> in latest bitbake. 
> >> 
> >> Is this an intentional change? May I know the reason of the change
> >> if it is intentional?
> >
> > It was intentional and was triggered by this change:
> >
> > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=f19546e02d3318ee69fd0c34e21aa97b74c987ec
> >
> > which is a sanity test added to fix certain failure cases where a given
> > revision wasn't on a specified branch.
> >
> > The bug was nasty since the fetcher was hitting the network in cases it
> > shouldn't have been when a branch wasn't specified.
> 
> I looked at the provided link but I'm not certain that I understand the
> problem nor the fix for it.
> 
> As far as I can make out, the "failure mode" was likely a specified
> commit ID that was not available in the local downloads.  As a
> consequence, the fetcher then hit the network and tried to find this
> (locally not existing) version in the upstream repository.  So very
> likely, the "failure" was that a network access happened at all,
> correct?  So the "failure" is much more a "we don't want network access
> at all under certain circumstances".

Imagine you set your recipe to some invalid SRCREV. It was possible that
the fetcher would notice it was missing and attempt to fetch it from
upstream (so far so good), then silently continue the build even though
it had been unable to find the revision.

I think we can agree that is bad, if it can't find something specified,
it should error. This is why we added the extra checks to ensure that
the revision really does exist after we fetch from upstream.

> If this is correct, then I see how the fix prevents this by effectively
> limiting the selectable commit IDs to the _existing_ commits in one
> branch.  But doesn't that prevent me from specifying a commit-id in
> an upstream branch "later" then what I have available locally in that
> old branch state?
> 
> I.e. should we rather find a way to say "no downloads are allowed at
> all" rather than adding this workaround?

This isn't a workaround, it fixed a very specific and nasty issue as
described above.

Cheers,

Richard


