Return-Path: <mac@mcrowe.com>
Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
	by mail.openembedded.org (Postfix) with ESMTP id 42A4B780E4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 06:04:04 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout06 with smtp
	id 6u431w0030BmcFC01u44Be; Fri, 08 Sep 2017 07:04:05 +0100
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.2 cv=GetnpUfL c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=8nJEP1OIZ-IA:10 a=2JCJgTwv5E4A:10 a=iGHA9ds3AAAA:8
	a=Ittgo3lEJ4A8G1-hn3YA:9
	a=wPNLvfGTeEIA:10 a=opEhNme9xScA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>)
	id 1dqCOZ-0007gv-H9; Fri, 08 Sep 2017 07:04:03 +0100
Date: Fri, 8 Sep 2017 07:04:03 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20170908060403.otjgmahfsdfozosn@mcrowe.com>
References: <20170907111347.u4bixwf2q7mabuy3@mcrowe.com>
	<1504786869.726.13.camel@linuxfoundation.org>
	<20170907170007.ixl53bwhjmk7iwob@mcrowe.com>
	<1504819736.726.26.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1504819736.726.26.camel@linuxfoundation.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Building and using a second toolchain
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
X-List-Received-Date: Fri, 08 Sep 2017 06:04:05 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thursday 07 September 2017 at 22:28:56 +0100, Richard Purdie wrote:
> On Thu, 2017-09-07 at 18:00 +0100, Mike Crowe wrote:
> > On Thursday 07 September 2017 at 13:21:09 +0100, Richard Purdie wrote:
> > > 
> > > defined for the 64 bit system, then just use its 32 bit compiler?
> > I'd persuaded myself that multilib was the x86-style -m32/-m64 thing on one
> > compiler binary and it appeared that ARM didn't do that.
> > 
> > But, now I've read up on
> > http://www.yoctoproject.org/docs/current/dev-manual/dev-manual.html#combining-multiple-versions-library-files-into-one-image
> > and played around I see that oe-core multilib support does generate
> > multiple compiler binaries.
> > 
> > I'm able to generate a second compiler with a machine file containing:
> > 
> >  require conf/machine/include/arm/arch-armv8.inc

> I suspect a glitch in the inheritance order of the arm tune files in
> other to make this work. That said, is there much difference in
> practise between armv7at-neon and cortexa15t?

Probably not, but I wanted to make sure I was using exactly the same
options as our vendor when compiling the bootloader. Having said that, I
can always tweak CFLAGS by hand so this isn't really a showstopper.

> Glad its at least sort of there. You're actually using the multilib in
> a different way to the one it'd normally get used as you're trying to
> put both into one build and its only really designed for one or the
> other.

Ah, well that's going to be a problem then. I probably didn't make it
clear, but this is a single bootloader build that uses both compilers. Some
parts get built with the 32-bit compiler and some with the 64-bit compiler,
and then the whole thing gets combined into a single binary. Splitting it
into three separate recipes would mean making larger changes to the vendor
build system than I'd really like.

> What would be "normal" is to build "lib32-bootloader" which is the
> lib32 BBCLASSEXTEND'd variant of bootloader. If the 64 bit version
> doesn't make sense you can make that raise SkipRecipe for the nonsense
> variants.

I was successfully building a few lib32- recipes in order to test the
compiler and, as you say, they all consistently use the lib32-named work
directory.

I can think of two ways round the problem:

1. Add a do_prepare_sysroot_append that moves the lib32- sysroot into the
correct work directory.

2. The simplest solution is to add a do_clean_append to my bootloader
recipe that also cleans up the problem sysroot directory.

The first is probably preferable and I'll have a go at doing that. Neither
is ideal, but anything else looks like it's going to complicate the
multilib class code greatly and possibly break the intended use of the
secondary toolchain.

Thanks for all your help.

Mike.

