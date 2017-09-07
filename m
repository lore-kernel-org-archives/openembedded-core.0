Return-Path: <mac@mcrowe.com>
X-Greylist: delayed 455 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 07 Sep 2017 17:07:45 UTC
Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
	by mail.openembedded.org (Postfix) with ESMTP id 6970E780D3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Sep 2017 17:07:45 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout06 with smtp
	id 6h071w0040BmcFC01h08o5; Thu, 07 Sep 2017 18:00:10 +0100
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.2 cv=GetnpUfL c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=2JCJgTwv5E4A:10 a=iGHA9ds3AAAA:8
	a=mgD8Lb_gos96yohmPQcA:9
	a=CjuIK1q_8ugA:10 a=opEhNme9xScA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>)
	id 1dq09v-0005cc-Gk; Thu, 07 Sep 2017 18:00:07 +0100
Date: Thu, 7 Sep 2017 18:00:07 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20170907170007.ixl53bwhjmk7iwob@mcrowe.com>
References: <20170907111347.u4bixwf2q7mabuy3@mcrowe.com>
	<1504786869.726.13.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1504786869.726.13.camel@linuxfoundation.org>
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
X-List-Received-Date: Thu, 07 Sep 2017 17:07:46 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thursday 07 September 2017 at 13:21:09 +0100, Richard Purdie wrote:
> On Thu, 2017-09-07 at 12:13 +0100, Mike Crowe wrote:
> > It thought that the simplest path to making this work would be to ensure
> > that the manifest files generated during the build have the names that all
> > other recipes will expect, but this means using the wrong TARGET_ARCH in my
> > binutils-cross-arm and gcc-cross-initial-arm recipes which I can't do
> > without also overriding TARGET_SYS and PN at least which definitely isn't
> > pretty.
> > 
> > I remember reading posts about doing this on the list in the past, but my
> > search engine skills aren't up to the job of finding anything. Am I missing
> > an easier way to make this work?
> 
> Have you considered using multilib? You could have a 32 bit multilib
> defined for the 64 bit system, then just use its 32 bit compiler?

I'd persuaded myself that multilib was the x86-style -m32/-m64 thing on one
compiler binary and it appeared that ARM didn't do that.

But, now I've read up on
http://www.yoctoproject.org/docs/current/dev-manual/dev-manual.html#combining-multiple-versions-library-files-into-one-image
and played around I see that oe-core multilib support does generate
multiple compiler binaries.

I'm able to generate a second compiler with a machine file containing:

 require conf/machine/include/arm/arch-armv8.inc
 require conf/multilib.conf
 MULTILIBS = "multilib:lib32"
 DEFAULTTUNE_virtclass-multilib-lib32 = "armv7at-neon"

However, what I really want to use is:

 DEFAULTTUNE_virtclass-multilib-lib32 = "cortexa15t"

but this fails in the sanity checker with:

    Toolchain tunings invalid:
    Tuning 'cortexa15t' has no defined features, and cannot be used.

and if I add

 require conf/machine/include/tune-cortexa15.inc

then I get oodles of duplicate-inclusion warnings and I no longer seem to
be generating an aarch64 compiler.

I'm not really sure where the split between arch and tune is supposed to be
in that include directory, so whilst I could probably hack it to work, I
doubt it would be acceptable to you.

So, I went back to using armv7at-neon and managed to generate a compiler.
In my bootloader recipe I added:

 DEPENDS_aarch64_append = "virtual/lib32-arm-oemllib32-linux-gnueabi-gcc"

which results in the compiler ending up in recipe-sysroot-native, but also
ends up with the associated libs32-recipe-sysroot installed outside the work
directory in:

 work/${MACHINE}-oemllib32-linux-gnueabi/bootloader/7-r0/lib32-recipe-sysroot/

which doesn't appear to break anything until I run the clean task on
bootloader and it doesn't get cleaned up. This means that subsequent builds
fail because the files in lib32-recipe-sysroot already exist. :(

(I'm not up-to-date with oe-core master, but I looked through the changes
that I don't have yet and couldn't spot anything that looked like it would
address these problems. If you prefer, I can try to reproduce both with the
current tip of master.)

Your suggestion has been a great help, but it looks like I'm not quite
there yet.

Thanks.

Mike.

