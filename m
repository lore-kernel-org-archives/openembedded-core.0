Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by mail.openembedded.org (Postfix) with ESMTP id 7F95165E68
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 17:38:58 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N3T00E1OT0ZR360@vms173017.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 10 Apr 2014 12:39:00 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 997A820396; Thu,
	10 Apr 2014 13:38:59 -0400 (EDT)
Date: Thu, 10 Apr 2014 13:38:59 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Chris Larson <clarson@kergoth.com>
Message-id: <20140410173859.GT3370@denix.org>
References: <20140407155333.GA19351@mcrowe.com>
	<CABcZANkEyt9M=A0SEWBTGedh713vdYhgqJciKDvZeQ_f-NoLaw@mail.gmail.com>
	<20140407164951.GA20653@mcrowe.com> <20140410161509.GA421@mcrowe.com>
	<CABcZANkvTa20djh3hNjg5rxx0kshbrDodQ3vjG2_uqW5ZP3JjQ@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CABcZANkvTa20djh3hNjg5rxx0kshbrDodQ3vjG2_uqW5ZP3JjQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Mike Crowe <mac@mcrowe.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: export TARGET_LDFLAGS and native sstate
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
X-List-Received-Date: Thu, 10 Apr 2014 17:39:01 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Apr 10, 2014 at 10:36:07AM -0700, Chris Larson wrote:
> On Thu, Apr 10, 2014 at 9:15 AM, Mike Crowe <mac@mcrowe.com> wrote:
> 
> > On Monday 07 April 2014 at 17:49:51 +0100, Mike Crowe wrote:
> > > On Monday 07 April 2014 at 09:17:38 -0700, Chris Larson wrote:
> > > > On Mon, Apr 7, 2014 at 8:53 AM, Mike Crowe <mac@mcrowe.com> wrote:
> > > >
> > > > > We're building for both ARM and MIPS-based MACHINEs in a single
> > source
> > > > > tree. This seems to result in us compiling (or luckily most of the
> > time
> > > > > resurrecting from sstate-cache) two different versions of all -native
> > > > > packages due to different base hashes.
> > > > >
> > > > > It seems that this difference in base hashes is due to the exported
> > > > > variable TARGET_LDFLAGS being different between the two CPUs:
> > > > >
> > > > > < export TARGET_LDFLAGS="-Wl,-O1  -Wl,--as-needed"
> > > > > ---
> > > > > > export TARGET_LDFLAGS="-Wl,-O1 -Wl,--hash-style=gnu
> > -Wl,--as-needed"
> > > > >
> > > >
> > > > Heh, this i another case of a likely completely unnecessary export.
> > > > Software we build expects LDFLAGS to be used, not TARGET_LDFLAGS, so I
> > > > can't imagine that anything is using this export. Of course, it's
> > > > non-trivial to confirm that this is the case :)
> >
> > My git archaeology shows that this dates from the very first import from
> > svn back in 2005. Back then it looks like it was necessary for
> > wpa_supplicant which used it in its defconfig file. This is no longer the
> > case.
> >
> > I didn't look at any other layers.
> >
> > > It did strike me as an odd thing to be exporting. Given the name I
> > assumed
> > > it had something to do with building the toolchain. I notice though that
> > > the gcc recipes explicitly export LDFLAGS_FOR_TARGET inside tasks based
> > on
> > > TARGET_LDFLAGS anyway so the toolchain "should be fine". :)
> > >
> > > I'm happy to try our complete build without exporting TARGET_LDFLAGS as a
> > > first step but I realise that probably wouldn't be enough proof.
> >
> > I've tested our build without the "export" in front of TARGET_LDFLAGS in
> > bitbake.conf and saw no problems at all so I'm in favour of doing that.
> >
> > Would a patch for this be acceptable? It does cause the world to be
> > rebuilt. :(
> 
> 
> I'm a fan of this, personally, but you'll likely need to check with folks
> like Richard Purdie for a final call, and this particular fix would have to
> go in post-1.6, into the 1.7 timeframe (1.6 isn't branched yet) since we're

^^^ looks like it just got branched off less than an hour ago...


> in the release candidate phase, and this has inherent risk. So, it might be
> worth pursuing the merge of the workaround with alters TARGET_LDFLAGS in
> native.bbclass to improve sstate reuse for 1.6, then pursue the unexport of
> TARGET_LDFLAGS for 1.7.
> -- 
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics

> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


