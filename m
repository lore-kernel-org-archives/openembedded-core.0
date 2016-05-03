Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by mail.openembedded.org (Postfix) with ESMTP id E7BDA70178
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 18:13:48 +0000 (UTC)
Received: from vz-proxy-l006.mx.aol.com ([64.236.82.153])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6M004RS59Y8P80@vms173017.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 03 May 2016 13:13:15 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=IkcTkHD0fZMA:10 a=yrkiwgmsf1kA:10	a=pGLkceISAAAA:8 a=9Wbp7B8dAAAA:8
	a=Q4-j1AaZAAAA:8 a=ADZaxQCHHr4CyMUPJXgA:9	a=QEXdDO2ut3YA:10
Received: by 100.15.86.14 with SMTP id 78fe1f7e; Tue, 03 May 2016 18:13:15 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 99D28161FDE; Tue,
	3 May 2016 14:13:09 -0400 (EDT)
Date: Tue, 03 May 2016 14:13:09 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Martin Jansa <martin.jansa@gmail.com>
Message-id: <20160503181309.GD27602@denix.org>
References: <1462219765-18957-1-git-send-email-kergoth@gmail.com>
	<B873B241-2AB0-4CDA-B4CF-7AEA166BEE68@gmail.com>
	<CABcZAN=ECJ15QzuHx-a2aovhS3hagRJuo3u-kazjZ4xnHjt=zA@mail.gmail.com>
	<A4EC8338-0993-408B-9D4C-2E388348B3B0@gmail.com>
	<20160503080913.GA2851@jama>
MIME-version: 1.0
In-reply-to: <20160503080913.GA2851@jama>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [master][PATCH] gcc-cross{, -canadian}: remove --with-linker-hash-style
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
X-List-Received-Date: Tue, 03 May 2016 18:13:50 -0000
Content-type: text/plain; charset=utf-8
Content-disposition: inline
Content-transfer-encoding: 8bit

On Tue, May 03, 2016 at 10:09:13AM +0200, Martin Jansa wrote:
> On Mon, May 02, 2016 at 02:37:43PM -0700, Khem Raj wrote:
> > 
> > > On May 2, 2016, at 1:37 PM, Christopher Larson <kergoth@gmail.com> wrote:
> > > 
> > > 
> > > 
> > > On Mon, May 2, 2016 at 8:34 PM, Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>> wrote:
> > > 
> > > > On May 2, 2016, at 1:09 PM, Christopher Larson <kergoth@gmail.com <mailto:kergoth@gmail.com>> wrote:
> > > >
> > > > From: Christopher Larson <chris_larson@mentor.com <mailto:chris_larson@mentor.com>>
> > > >
> > > > We explicitly set the hash style to gnu in our LDFLAGS. Setting the default to
> > > > this in the toolchain, while convenient, actually hides bugs, as a failure to
> > > > obey LDFLAGS isn't noticed. By removing this, it's not dissimilar to how we
> > > > poison the sysroot -- rather than relying on the default, notice right away if
> > > > somoeone isn't obeying the needed flags.
> > > >
> > > > This will result in a failure to obey LDFLAGS causing a GNU_HASH QA failure,
> > > > which is what's often seen with external toolchains. This brings us all on the
> > > > same page, and makes sure a failure to obey LDFLAGS is seen early.
> > > >
> > > 
> > > 
> > > Default or gnu linkers is to use sysv for legacy reasons and by passing this option
> > > to configuring the toolchain we want to make sure that components are using sane defaults
> > > even if they have not configured these options.
> > > 
> > > But that's not what we want. We want to know when we're not passing arguments we need to be passing. For example, the sysroot is poisoned today, so we *know* when the user is trying to run it without --sysroot=.
> > 
> > application makefiles can ignore environment e.g. CC, CXX, LD etc and get into same situations.
> > as an application writer I may not be interested in using cross compilation specific nuances.  We may not
> ]> be able to solve it completely
> > 
> > > 
> > > if you do not pass the right linker flags from compiler driver and also ignore
> > > the LDFLAGS then you now have a safe pass for the app to build without GNU hash
> > > while I understand it will spread the external toolchain’s pains into internal toolchain
> > > I fail to understand the benefit of doing this otherwise.
> > > 
> > > Silently ignoring the fact that recipes ignore LDFLAGS is not good default behavior, and this is precisely what oe-core is doing today. If you know of a better way to detect that in another QA check, I'm certainly open to hearing it.
> > 
> > linker would emit .hash for sysv and .gnu.hash section for gnu hash in final ELF, may be adding a QA check for that would be enough ?
> 
> But that doesn't detect if it was set to gnu thanks to respecting
> LDFLAGS or thanks to gnu being the default in oe-core built toolchain
> (from --with-linker-hash-style) - which means that builds with
> external toolchain are still affected if they don't use
> --with-linker-hash-style=gnu.
> 
> After fixing couple recipes used by our internal builds (which are
> using external toolchain) and wondering why nobody else reported
> those I agree with Chris, that to detect this early (with current
> QA check which already reports when the used hash style doesn't match
> with LDFLAGS).

I'd like to back Chris and Martin here - using external toolchain as well and 
seeing few GNU_HASH warnings. Some warning are ours (too busy/lazy to fix now) 
but some are upstream recipes, maybe it's time to clean them up collectively?

-- 
Denys


> It would be nice to really poison the value if possible
> --with-linker-hash-style=YOU_NEED_TO_RESPECT_LDFLAGS
> to cause linker call to fail when someone is using oe-core toolchain
> outside OE itself (so might ignore LDFLAGS, but without running the
> QA check).
> 
> Regards,
> -- 
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


