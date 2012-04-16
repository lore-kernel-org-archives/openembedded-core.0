Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SJnHI-0007NM-JU for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 16:51:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3GEgFbB000773;
	Mon, 16 Apr 2012 15:42:15 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00569-02; Mon, 16 Apr 2012 15:42:10 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3GEg3Qo000767
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 16 Apr 2012 15:42:04 +0100
Message-ID: <1334587325.616.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andreas Oberritter <obi@opendreambox.org>
Date: Mon, 16 Apr 2012 15:42:05 +0100
In-Reply-To: <4F8C24CB.3080607@opendreambox.org>
References: <4F847380.6000401@windriver.com>
	<4F8489DE.1050905@opendreambox.org> <4F8C24CB.3080607@opendreambox.org>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: MIPS vs MIPS32 tunings -- summary and questions
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
X-List-Received-Date: Mon, 16 Apr 2012 14:51:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-04-16 at 15:55 +0200, Andreas Oberritter wrote:
> On 10.04.2012 21:28, Andreas Oberritter wrote:
> > On 10.04.2012 19:53, Mark Hatle wrote:
> >> We still do not have a clean answer for how to resolve the concerns in
> >> the recent thread "conf/machine/include: Cleanup MIPS tunings to match
> >> README".  The following is in response to a request I received to
> >> summarize the discussion so far, and include the options to resolve the
> >> issue for the current OE-Core release.
> >>
> >> If you are interested in this, please be sure to read until the end
> >> before commenting.
> >>
> >> Background:
> >>
> >> About 2 weeks ago, in response to a number of patches sent for PowerPC
> >> issues, I set to the task of documenting and cleaning up the various
> >> tune files.  It was discovered that since they were originally
> >> implemented, a number of minor conflicts and defects had crept into the
> >> system.  The recent patch set added a number of README files and
> >> attempted to resolve any duplication, or confusion between items.
> >>
> >> During this work it was discovered that there were two tunings that
> >> produced the same package architecture:
> >>
> >> mips (tune), optimized for mips1 - o32 ABI, produced packages with a
> >> "mips" arch
> >>
> >> mips32 (tune), optimized for mips32 - o32 ABI, produced packages also
> >> with a "mips" arch.
> >>
> >> While "mips1" should work on a "mips32" system, the reverse is not
> >> true.  There was no way to distinguish, in a package feed, the
> >> difference between the two sets of binaries.
> >>
> >> I updated the MIPS tune files to resolve this issue.  The result was:
> >>
> >> mips (tune), mips1 - o32 ABI, produced packages with a "mips" arch
> >>
> >> mips32 (tune), mips32 - o32 ABI, produced packages with a "mips32" arch
> >>
> >> This lead to the thread mentioned above.  At first there were concerns
> >> that the GNU target arch had changed (from mips to mips32), this was not
> >> the case.  The only change is in the produced package arch names.  So
> >> the package feeds and image generation are the only components affected
> >> by this change.
> >>
> >> After various discussion with folks, such as Khem Raj, it is unlikely
> >> that anyone would be using oe-core with a "mips1" target.  There may be
> >> some mips3 or mips4 targets, but we find it highly unlikely based on our
> >> current experience. Khem suggested resolving this my simply making the
> >> "mips" include mips32 as the default optimization.
> >>
> >> Image generation was verified to produce the same images before and
> >> after this change for the qemumips target.  I am unable to verify the
> >> package feeds, as I do not have a suitable setup for this.
> >>
> >> So possible solutions to this particular issue, which we do need on
> >> prior to the upcoming release:
> >>
> >> 1) Revert the behavior and match that last release.  We have two tunes
> >> that produce different binaries w/ the same "mips" package arch.
> >>    * This preserves previous behavior, but IMHO continues to implement
> >> the defect
> >>
> >> mips (tune) - mips1 processor, o32 ABI - mips package arch
> >> mips32 (tune) - mips32 processor, o32 ABI - mips package arch
> >>
> >> 2) Keep it as it is currently checked in.  Provide the ability to build
> >> a basic "mips" and a more optimized "mips32" tuned target and package set.
> >>    * This fixes the defect and provides the opportunity for "mips" to be
> >> a basic common package arch, while mips32 (or additional mips3? mips4?
> >> mips32r2?) tunes could be used to augment this for specific systems.
> >>
> >> mips (tune) - mips1 processor, o32 ABI - mips package arch
> >> mips32 (tune) - mips32 processor, o32 ABI - mips32 package arch
> > 
> > If the tune should reflect the optimization, then mips should be renamed
> > to mips1 and specified explicitly using -march=mips1, in order to
> > protect against changing defaults when using a newer compiler. However,
> > as Phil pointed out, there are many more optimization settings, e.g. -O2
> > vs. -Os, that aren't encoded into the package arch, so the goal to have
> > distinct package archs for different binaries won't be reached.
> > 
> > I don't see what a common "mips" package arch would give us. Within OE,
> > you'd usually compile all your applications for the package arch of your
> > target system. Adding compatible package archs to the feed just
> > increases the complexity of online updates.
> > 
> >> 3) Define only one mips tune, with a target package arch of "mips". 
> >> Changing the basic mips tune, and corresponding mips package arch to
> >> include mips32 optimizations and instructions.
> >>    * This preserves the "mips" tune, but changes the behavior of the
> >> tune from default compiler, to mips32 optimization
> >>    * Anyone requiring mips3 or mips4 will need to add a tune, and that
> >> tune will not be compatible with "mips"
> > 
> > Also, mips1 could be added back anytime if anybody starts using it.
> > 
> >> mips (tune) - mips32 processor, o32 ABI - mips package arch
> >>
> >>   3a) Preserve the mips32 tune entries, but define it as being equal to
> >> mips
> >>       * Preserves the tune entries for compatibility, but is anyone
> >> directly using them?
> >>
> >>   3b) Remove the mips32 tune entries -- effectively eliminating mips32
> >> as a tune
> >>       * Removes the tune entries (cleans up the tunes), no compatibility
> >> -- but it's unlikely anyone was directly specifying "mips32" as their
> >> machine's DEFAULTTUNE.
> > 
> > Actually I have (had) machines specifying mips32el and mips32el-nf as
> > their DEFAULTTUNEs, which your first patch, that got applied upstream,
> > broke. But I've already switched to use your latest patch using mipsel
> > and mipsel-nf instead, (which I prefer over the former).
> > 
> >> My recommendation is either 2 or 3.  The 3a/b variation is simply an
> >> implementation detail to me, and I will be happy to implement it either
> >> way if this is the chosen direction.
> > 
> > I'm fine with either way that restores mips/mipsel for mips32 targets
> > *before the release*, because the online update feeds broke and all
> > packages had to be built again from scratch.
> 
> Richard, can you please state your opinion about this issue?
> 
> The mips package feed (e.g. qemumips) is now broken since weeks. Can I
> expect this to be corrected before the release, or should anybody
> relying on mipsel package feeds stop using oe-core's
> meta/conf/machine/include/mips/arch-mips.inc?

Sorry, I got distracted by a ton of other issues. I think the cleanup
did make sense and things are more correct now, its just a shame about
the package feed naming issue.

There comes a point we need to try and clean up some of these things so
my proposal would be that people who don't want to use the new naming
set the following in their distro config:

MIPSPKGSFX_VARIANT_tune-mips32el = "mipsel"

and then should still be able to use the arch-mips.inc from OE-Core.
Does that work for people?

Cheers,

Richard





