Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1PvWwT-0005WE-04 for openembedded-core@lists.openembedded.org;
	Fri, 04 Mar 2011 16:29:21 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p24FRq9e000963
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Mar 2011 15:27:52 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00806-03 for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2011 15:27:48 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p24FRhmm000957
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Mar 2011 15:27:46 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <20110304145329.GE3312@jama.jama.net>
References: <1299235247-5527-1-git-send-email-Martin.Jansa@gmail.com>
	<1299247286.17567.1349.camel@rex> <20110304145329.GE3312@jama.jama.net>
Date: Fri, 04 Mar 2011 15:27:34 +0000
Message-ID: <1299252454.17567.1454.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] bitbake.conf: point PERSISTENT_DIR outside TMPDIR
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Mar 2011 15:29:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-03-04 at 15:53 +0100, Martin Jansa wrote:
> On Fri, Mar 04, 2011 at 02:01:26PM +0000, Richard Purdie wrote:
> > On Fri, 2011-03-04 at 11:40 +0100, Martin Jansa wrote:
> > > * sanity check warning user that he still has peristent cache in old location
> > > * similar patch was sent to OE, to keep PERSISTENT_DIR location consistent
> > >   http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-March/030623.html
> > > 
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  meta/classes/sanity.bbclass |    8 ++++++++
> > >  meta/conf/bitbake.conf      |    2 +-
> > >  meta/conf/sanity.conf       |    1 +
> > >  3 files changed, 10 insertions(+), 1 deletions(-)
> > 
> > When I saw this on the OE list, I'd assumed you'd done what Poky had
> > done, I've just realised you're moving this file to TOPDIR instead of
> > TMPDIR.
> > 
> > My big concern here is that we really shouldn't be writing to data to
> > the conf directory as its not what the user expects.
> > 
> > I say this knowing the raft of usability problems we've had every time
> > we take something outside of TMPDIR as users have the expectation that
> > deleting tmp wipes out all stored state and rebuilds. Having this file
> > hidden in the conf directory breaks that expectation. Note there are
> > only two things we place outside of TMPDIR, downloads and sstate data.
> > Even things like buildstats which you might want to preserve over
> > different builds are still inside TMPDIR.
> 
> From my experience I always had to say:
> 
> You have to rebuild from scratch. Just wipe out tmp directory, but don't
> forget to save&load tmp/cache/bb_persist_data.sqlite3 because that file is
> really important for upgradable path.

Its really important to a very specific use case albeit a use case that
you use and therefore prioritise.

It will be an annoyance to general user who doesn't use floating source
revisions.

> So that was my motivation to move it outside TMPDIR and no strong
> opinion about keeping it inside conf/toplevel/any other directory.
> 
> > Can we put it in cache as a top level file rather than machine specific?
> 
> "machine specific"?
> 
> something like?
> PERSISTENT_DIR = "${TOPDIR}/persistent"
> or?
> PERSISTENT_DIR = "${TOPDIR}/persistent-cache"
> would be OK?

No, I was meaning to keep it within TMPDIR/cache which is what you want
to change. I think if we want to move this outside TMPDIR, we need to
look to solve the overall/underlying problem better.

The list of things that don't really fit TMPDIR I can think of off the
top of my head are:

* build stats
* downloads
* sstate
* pkghistory

The trouble is the persist cache doesn't fit well against those as the
above can all be shared between machines over NFS, the persist cache
can't. I had been thinking about some kind of shared directory but
persistent data doesn't fit.

Reimplementing it as a flat on disk structure would have the benefit
that it could then be shared amongst a group of autobuilder type
machines over NFS. The other solution we've talked about is a single
daemon talking over the network where the daemon maintains the database.
We do have the problem of how to control the revision numbers for
packages looming in the future with the advent of full sstate enablement
since manual PR bumps will become unneeded which is why I'm thinking
about this very seriously.

Does anyone else have any thoughts on this?

Cheers,

Richard



