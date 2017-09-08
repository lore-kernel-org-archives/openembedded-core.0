Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6C3B272F42
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 06:53:41 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v886rfJN004614
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 8 Sep 2017 07:53:42 +0100
Message-ID: <1504853621.726.32.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Crowe <mac@mcrowe.com>
Date: Fri, 08 Sep 2017 07:53:41 +0100
In-Reply-To: <20170908060403.otjgmahfsdfozosn@mcrowe.com>
References: <20170907111347.u4bixwf2q7mabuy3@mcrowe.com>
	<1504786869.726.13.camel@linuxfoundation.org>
	<20170907170007.ixl53bwhjmk7iwob@mcrowe.com>
	<1504819736.726.26.camel@linuxfoundation.org>
	<20170908060403.otjgmahfsdfozosn@mcrowe.com>
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
X-List-Received-Date: Fri, 08 Sep 2017 06:53:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-09-08 at 07:04 +0100, Mike Crowe wrote:
> On Thursday 07 September 2017 at 22:28:56 +0100, Richard Purdie
> wrote:
> > 
> > On Thu, 2017-09-07 at 18:00 +0100, Mike Crowe wrote:
> > I suspect a glitch in the inheritance order of the arm tune files
> > in
> > other to make this work. That said, is there much difference in
> > practise between armv7at-neon and cortexa15t?
> Probably not, but I wanted to make sure I was using exactly the same
> options as our vendor when compiling the bootloader. Having said
> that, I
> can always tweak CFLAGS by hand so this isn't really a showstopper.

Fair enough, one issue at a time I guess! :)

> > Glad its at least sort of there. You're actually using the multilib
> > in
> > a different way to the one it'd normally get used as you're trying
> > to
> > put both into one build and its only really designed for one or the
> > other.
> Ah, well that's going to be a problem then. I probably didn't make it
> clear, but this is a single bootloader build that uses both
> compilers. Some
> parts get built with the 32-bit compiler and some with the 64-bit
> compiler,
> and then the whole thing gets combined into a single binary.
> Splitting it
> into three separate recipes would mean making larger changes to the
> vendor
> build system than I'd really like.
> 
> > 
> > What would be "normal" is to build "lib32-bootloader" which is the
> > lib32 BBCLASSEXTEND'd variant of bootloader. If the 64 bit version
> > doesn't make sense you can make that raise SkipRecipe for the
> > nonsense
> > variants.
> I was successfully building a few lib32- recipes in order to test the
> compiler and, as you say, they all consistently use the lib32-named
> work
> directory.
> 
> I can think of two ways round the problem:
> 
> 1. Add a do_prepare_sysroot_append that moves the lib32- sysroot into
> the
> correct work directory.
> 
> 2. The simplest solution is to add a do_clean_append to my bootloader
> recipe that also cleans up the problem sysroot directory.
> 
> The first is probably preferable and I'll have a go at doing that.
> Neither
> is ideal, but anything else looks like it's going to complicate the
> multilib class code greatly and possibly break the intended use of
> the
> secondary toolchain.

I mentioned the issues above so you understand how you're differing
from the "standard" way multilib is used. I'm hoping there is some
simple way you can get it working for you. If I remember rightly, there
are differently named sysroots simply to avoid file conflict issues
with the sysroots overlapping (e.g. sets of header files, the usr/share
data and so on). We allow for that overlapping on the target device, we
don't really deal with that in the sysroots.

Option 3 may be to have the core staging.bbclass clean code iterate
over the sysroots, it sounds like its creating them, just not cleaning
them up, which is kind of a bug. "clean" is a slow path so even a tiny
performance hit there for this likely isn't an issue...

Cheers,

Richard






