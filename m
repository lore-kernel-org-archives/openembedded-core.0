Return-Path: <denis@denix.org>
X-Greylist: delayed 3602 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 10 Jul 2016 22:28:27 UTC
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by mail.openembedded.org (Postfix) with ESMTP id B26B8601F6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jul 2016 22:28:27 +0000 (UTC)
Received: from vz-proxy-m005.mx.aol.com ([64.236.83.15])
	by vms173007.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OA400J49BNCV900@vms173007.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Sun, 10 Jul 2016 16:28:24 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=NimJJ1rWho3RDXpqkQh0Zg==:117
	a=kj9zAlcOel0A:10 a=cAmyUtKerLwA:10	a=y72ONi3lAAAA:8
	a=c8cKn-tmQt8w5voVrtoA:9 a=CjuIK1q_8ugA:10
Received: by 100.15.86.14 with SMTP id 688cf2c2; Sun, 10 Jul 2016 21:28:24 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id E27F61620AC; Sun,
	10 Jul 2016 17:28:23 -0400 (EDT)
Date: Sun, 10 Jul 2016 17:28:23 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Venkatesh <venkateshv377@gmail.com>
Message-id: <20160710212822.GB8521@denix.org>
References: <1410665660-25145-1-git-send-email-denis@denix.org>
	<CAJTo0Law3iWz=+A1vA7QsikNozeVP7U49=+T9fkT7YgLzJ_hcA@mail.gmail.com>
	<20141107194159.GD9512@denix.org>
	<CAJTo0LYLh9A8zYJDMtyCBw2r1pX8KxNjv=mq5MBX=B8BZvRObw@mail.gmail.com>
	<20141107205445.GF9512@denix.org> <20141107223001.GG9512@denix.org>
	<loom.20160710T184732-108@post.gmane.org>
MIME-version: 1.0
In-reply-to: <loom.20160710T184732-108@post.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot: update to version 2014.07
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
X-List-Received-Date: Sun, 10 Jul 2016 22:28:28 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, Jul 10, 2016 at 04:49:56PM +0000, Venkatesh wrote:
> Denys Dmytriyenko <denis@...> writes:
> 
> > 
> > On Fri, Nov 07, 2014 at 03:54:45PM -0500, Denys Dmytriyenko wrote:
> > > On Fri, Nov 07, 2014 at 08:43:38PM +0000, Burton, Ross wrote:
> > > > On 7 November 2014 19:41, Denys Dmytriyenko <denis@...> wrote:
> > > > 
> > > > > > | scripts/basic/fixdep: 1: scripts/basic/fixdep: Syntax error: word
> > > > > > unexpected (expecting ")")
> > > > > >
> > > > > > I suspect the real problem is:
> > > > > >
> > > > > > $ file fixdep
> > > > > > fixdep: ELF 32-bit LSB executable, ARM, version 1 (SYSV), dynamically
> > > > > > linked (uses shared libs), for GNU/Linux 2.6.32,
> > > > > > BuildID[sha1]=0xb4ea84a189f10b4f3e08fb10f8e490135e2b920c, not stripped
> > > > > >
> > > > > > It appears to have been built using the target compiler, not the host.
> > > > >
> > > > > Ross,
> > > > >
> > > > > I'm a bit lost here - as you said above, this is a target build and
> yet you
> > > > > say it shouldn't use the target compiler. Can you please explain
> what you
> > > > > mean?
> > > > 
> > > > 
> > > > Yes, it's building a binary (fixdep) and then executing it.  That binary
> > > > needs to be built with the host compiler (BUILD_CC).
> > > > 
> > > > Easily replicated for me with "MACHINE=qemuarm bitbake u-boot-mkimage".
> > > 
> > > Ah, got it. Didn't realize, as I build -native version. Give me a sec to
> fix 
> > > it. BTW, 2014.10 is out and I've been using it for a bit now - planning on 
> > > sending the update soon...
> > 
> > Ross,
> > 
> > I've just sent an RFC patch to allow building mkimage for the target. I'd
> like 
> > to collect feedback for it first, but feel free to squash it with the
> previous 
> > patch, if it's accepted (or commit separately - your choice). The update to 
> > 2014.10 will follow shortly, I just want this version to get through
> first, as 
> > it has been in limbo for a few months...
> > 
> 
> 
> I am encountering this problem while compiling my driver code for beagle
> bone black.
> 
> scripts/basic/fixdep: 1: scripts/basic/fixdep: Syntax error: word unexpected
> (expecting ")")
> make[2]: *** [/home/venkyvenkatesh/Driver_Compiler/driver_code.o] Error 2
> make[1]: *** [_module_/home/venkyvenkatesh/Driver_Compiler] Error 2
> make[1]: Leaving directory
> `/home/venkyvenkatesh/Driver_Compiler/usr/src/linux-3.14.4.1-bone-armhf.com'
> make: *** [all] Error 2

How is this related to u-boot? Or even OpenEmbedded?

-- 
Denys

