Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 2D50D7CFE9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2019 14:00:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46T3Sg1TLBz5c;
	Wed, 11 Sep 2019 16:00:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1568210419;
	bh=SKkxge1LzS+4IDzwHUTn63KpQQ6yDjenYh4frWeIWZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ixr5CrecbFY58wccK/231PChohOx246MOqzoSFSLk7VuNfs8SHCtHaTlOaf43cQEn
	QLiftwBloKsFYvT97ehitlzFi5JVogbrIQx5Ubqy6MjZ+VrjEfhFVb/c+mlYl8/j5Y
	JFlrtZDKphkW9dwwt4w8QJl1LX49lyYGa+fN9CKkMj4TDm3+4BygcvTwiC/D6bdcpS
	Fu/6Dhya3SiygGAn0o/aAqMWL0zMsPAJw7roZZkGUNdXShPVCfezrDsPu8tJyO5cQ3
	B85sVIiaojYE+uovkbDQFg6H/BTTsvKj1jiClyYq8XgzlHR2LggUIZxRaWc4VyYEOU
	KQ+pl91eyKFTYlZNdJF+acd1ugYkyBVxX/PYl1vuBTO2KyXz+U0yxpAdSdyPvziye5
	+np6uuHLUNmd27rydG7m3cEnjZ+n8n6Kwla6WcQ0ZwebewnWQiByZAwPjiBkgtAwz0
	Bg05YrneBKV3lP80f/h+s3pzPw5ZxjG5sd0dcz83QXoL/XMmdG2crJp8N14+E9Ne5Y
	d0fuVprkReEAFQhPSFtMfyfwkEeoG2VQVHkDp1HUzSSvoHP87IsEaskYvu907l2S3H
	TSPDRYXdG7DErlxkOa5bPBIjPEbuTPoKvIrH1qlnbMKhHGimpmGfvcL7Y7gUjB6ezH
	s8+neb3N9GRi7cLyohOsf7dU=
Date: Wed, 11 Sep 2019 17:00:16 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <20190911140016.GB27961@localhost>
References: <20190910214136.22971-1-Randy.MacLeod@windriver.com>
	<20190910214136.22971-4-Randy.MacLeod@windriver.com>
	<20190911123258.GA27961@localhost>
	<f87d660d-9c05-dfdd-ced2-88cfc9a38a4f@windriver.com>
MIME-Version: 1.0
In-Reply-To: <f87d660d-9c05-dfdd-ced2-88cfc9a38a4f@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [v2 4/4] valgrind: disable 256 ptests for aarch64
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
X-List-Received-Date: Wed, 11 Sep 2019 14:00:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Sep 11, 2019 at 09:38:53AM -0400, Randy MacLeod wrote:
> On 9/11/19 8:32 AM, Adrian Bunk wrote:
> > On Tue, Sep 10, 2019 at 05:41:36PM -0400, Randy MacLeod wrote:
> > > On qemuarm64 systems, about half of the valgrind tests fail and
> > > often result in defunct processes, eg:
> > >     root       819   818 25 00:12 pts/0    00:01:52 /usr/bin/valgrind --command-line-only=yes --memcheck:leak-check=no --tool=memcheck -q --track-origins=
> > >     root       861   420  0 00:13 pts/0    00:00:00 [sh] <defunct>
> > > Eventually these processes use so much memory that the
> > > out of memory killer runs.
> > > 
> > > Hide the tests that fail as a horrid work-around until the
> > > root cause has been resolved since this at least allows the
> > > ptest run to complete.
> > > ...
> > 
> > I can reproduce this on hardware,
> 
> Ah good, I was wondering if it was just happening on qemu.
> 
> > and I have the bad feeling that no one
> > will work on resolving the root cause if this is work-arounded in ptest.
> > 
> > IMHO this should instead be listed as M3 blocker,
> > similar to "strace ptest timeout".
> 
> Well, I've enabled 100s of tests that were not being run before
> and most of them pass for qemux86-64 so I don't think it
> should be an M3 blocker like strace since it isn't a regression.

I just tried to reproduce in warrior and it did,
so it doesn't seem to be a regression.

> I did start to debug valgrind but it's a bit of a complicated
> program and will take time so this work-around makes sense to
> me. If no one else gets to it before me, I'll come back to
> debugging this issue but likely not before early 3.1.

It would be good if you could also open a bug, so that people can see 
that there is a problem with this package on an important architecture.

> Thanks,
> ../Randy

Thanks
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


