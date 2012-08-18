Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T2lA0-0002lw-2e for openembedded-core@lists.openembedded.org;
	Sat, 18 Aug 2012 17:42:00 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7IFTvae018780;
	Sat, 18 Aug 2012 16:29:57 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14548-08; Sat, 18 Aug 2012 16:29:54 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7IFTnS5018773
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Sat, 18 Aug 2012 16:29:50 +0100
Message-ID: <1345303789.27428.62.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 18 Aug 2012 16:29:49 +0100
In-Reply-To: <CADkTA4MtFgZv1s4bW0MQVg7BDYX9ukQ7j5qs1416QDuh4cqCOg@mail.gmail.com>
References: <cover.1345059176.git.bruce.ashfield@windriver.com>
	<9adc11ebd961b769e39d0ac664998a2de014b058.1345059176.git.bruce.ashfield@windriver.com>
	<1345291665.27428.36.camel@ted>
	<CADkTA4MtFgZv1s4bW0MQVg7BDYX9ukQ7j5qs1416QDuh4cqCOg@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] linux-yocto: make KBRANCH the exception and not the rule
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
X-List-Received-Date: Sat, 18 Aug 2012 15:42:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-08-18 at 10:33 -0400, Bruce Ashfield wrote:
> On Sat, Aug 18, 2012 at 8:07 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > There is a bit of uncertainty flying around at the moment about why
> > these changes are failing on the autobuilder. For example:
> >
> > http://autobuilder.yoctoproject.org:8010/builders/nightly-mips/builds/560/steps/shell_138/logs/stdio
> >
> > Log data follows:
> > | DEBUG: Executing shell function do_validate_branches
> > | ERROR: SRCREV was set to "1c17c082b6ee565acc176cde5be835ac4269817b", but no branches
> > |        contain this commit
> > | ERROR: Function failed: do_validate_branches
> >
> > It looks like:
> >
> > http://git.yoctoproject.org/cgit.cgi/poky/commit/bitbake/lib/bb/fetch2/git.py?id=64662290d3e7deb0b6093b3959c3f3eddb873893
> >
> > doesn't totally fix the problem. It allows the correct revisions to be
> > found and sets alternatives correctly but imports the wrong branch
> > config.
> 
> bugger. eh. But that's what I saw on the autobuilder as well. There are
> two repos, one is being updated, another isn't and the older/non updated
> one isn't being updated.

In GITDIR, yes.

> But what's causing the inconsistency in the .git and no ".git" repos ? i.e
> aren't all the SRC_URIs now the same ? So why would one be fetched
> into in the downloads, and the other used for the build ?

Its a problem in git itself. It uses one for part of the operation and
the other repository for other bits of the operation. Yes, really :/.
You can see it under strace.

> > I don't really want to have to require a patched git binary so we may
> > end up having to rebuild the branch structure manually.
> 
> Where would we have to do the branch rebuild ? From what I saw, in the
> broken repo, the blobs aren't even present

When it runs the clone command, it does a clone of a hybrid of both
repositories. The alternates link points to the correct repo but it has
the branch and heads of the "bad" one. So the blobs are there in the
clone in WORKDIR, the heads and branches are not.

>  .. so even if you know the
> branch names, you can't set the SRCREV and just dump it in the branch
> ref (which I've tried in the past, and it just breaks in equally impressive
> ways as).
> 
> >
> > I guess the older code cared less about the branch name and more about
> > the revisions being present.
> 
> And the old code was wrong .. or at least not very good. It misses scenarios
> where new BSPs are created, or other branches selected to be built by the
> board descriptions. Human's working on a kernel, work on branches, not
> git hashes and floating branches .. so this actually allows a BSP developer to
> control the content, and have the build system build what he wants.
> 
> I can say is that this works fine here, has been working for over two months
> within Wind River and never a failure seen, but the fetch infrastructure is
> configured differently here.
> 
> We can skip the changes for 1.3, but they are a big step forward in the tools
> and flexibility for working with the tree .. which was one of the macro goals
> that I for 1.3.

If you have git > 1.7.9.2 you won't see the problem. You also won't see
the problem if you don't have two confusing directories in GITDIR from
some of the legacy SRC_URI problems we had (these things come back when
we build denzil for example).

Bottom line, I figured out a workaround for the fetcher. Its evil and
involves magic symlink but should stop this occurring. We can remove
that in a while when git 1.7.9.2 or later is more standard.

I've pushed the workaround into bitbake master, we now need to test your
branch again on the autobuilder and see where we are. Unforunately this
has eaten most of my day :(.

Cheers,

Richard





