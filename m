Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C708477CFB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Sep 2017 21:28:57 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v87LSu7I012136
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 7 Sep 2017 22:28:57 +0100
Message-ID: <1504819736.726.26.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Crowe <mac@mcrowe.com>
Date: Thu, 07 Sep 2017 22:28:56 +0100
In-Reply-To: <20170907170007.ixl53bwhjmk7iwob@mcrowe.com>
References: <20170907111347.u4bixwf2q7mabuy3@mcrowe.com>
	<1504786869.726.13.camel@linuxfoundation.org>
	<20170907170007.ixl53bwhjmk7iwob@mcrowe.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
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
X-List-Received-Date: Thu, 07 Sep 2017 21:28:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-09-07 at 18:00 +0100, Mike Crowe wrote:
> On Thursday 07 September 2017 at 13:21:09 +0100, Richard Purdie wrote:
> > 
> > defined for the 64 bit system, then just use its 32 bit compiler?
> I'd persuaded myself that multilib was the x86-style -m32/-m64 thing on one
> compiler binary and it appeared that ARM didn't do that.
> 
> But, now I've read up on
> http://www.yoctoproject.org/docs/current/dev-manual/dev-manual.html#combining-multiple-versions-library-files-into-one-image
> and played around I see that oe-core multilib support does generate
> multiple compiler binaries.
> 
> I'm able to generate a second compiler with a machine file containing:
> 
>  require conf/machine/include/arm/arch-armv8.inc

This is a less walked path on arm than it is in the x86 world. For x86,
tune-corei7 includes tune-i586 for example so it 'stacks' neatly and
you have the various compatible tune options available.

I suspect a glitch in the inheritance order of the arm tune files in
other to make this work. That said, is there much difference in
practise between armv7at-neon and cortexa15t?

>  require conf/multilib.conf
>  MULTILIBS = "multilib:lib32"
>  DEFAULTTUNE_virtclass-multilib-lib32 = "armv7at-neon"
> 
> However, what I really want to use is:
> 
>  DEFAULTTUNE_virtclass-multilib-lib32 = "cortexa15t"
> 
> but this fails in the sanity checker with:
> 
>     Toolchain tunings invalid:
>     Tuning 'cortexa15t' has no defined features, and cannot be used.
> 
> and if I add
> 
>  require conf/machine/include/tune-cortexa15.inc
> 
> then I get oodles of duplicate-inclusion warnings and I no longer seem to
> be generating an aarch64 compiler.
> 
> I'm not really sure where the split between arch and tune is supposed to be
> in that include directory, so whilst I could probably hack it to work, I
> doubt it would be acceptable to you.



> 
> So, I went back to using armv7at-neon and managed to generate a compiler.
> In my bootloader recipe I added:
> 
>  DEPENDS_aarch64_append = "virtual/lib32-arm-oemllib32-linux-gnueabi-gcc"
> 
> which results in the compiler ending up in recipe-sysroot-native, but also
> ends up with the associated libs32-recipe-sysroot installed outside the work
> directory in:
> 
>  work/${MACHINE}-oemllib32-linux-gnueabi/bootloader/7-r0/lib32-recipe-sysroot/
> 
> which doesn't appear to break anything until I run the clean task on
> bootloader and it doesn't get cleaned up. This means that subsequent builds
> fail because the files in lib32-recipe-sysroot already exist. :(
> 
> (I'm not up-to-date with oe-core master, but I looked through the changes
> that I don't have yet and couldn't spot anything that looked like it would
> address these problems. If you prefer, I can try to reproduce both with the
> current tip of master.)
> 
> Your suggestion has been a great help, but it looks like I'm not quite
> there yet.

Glad its at least sort of there. You're actually using the multilib in
a different way to the one it'd normally get used as you're trying to
put both into one build and its only really designed for one or the
other.

What would be "normal" is to build "lib32-bootloader" which is the
lib32 BBCLASSEXTEND'd variant of bootloader. If the 64 bit version
doesn't make sense you can make that raise SkipRecipe for the nonsense
variants.

I'm hoping if you do that the sysroot issue goes away. 

Cheers,

Richard

