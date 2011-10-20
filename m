Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RH0sR-0002JW-Jy for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 00:14:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9KM8N1Q024244
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 23:08:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24077-02 for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 23:08:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9KM8FsV024237
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 23:08:16 +0100
Message-ID: <1319148494.2410.100.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 20 Oct 2011 23:08:14 +0100
In-Reply-To: <CA+M6bXm9zigRMzMQSdwntHAUYD+vBAmuLbAdNA7RPkBM=wwFNA@mail.gmail.com>
References: <840A81C1B782724A8EB52725BD519EFF1A8633@MBX20.4emm.local>
	<1319129657.2410.57.camel@ted>
	<CA+M6bXm9zigRMzMQSdwntHAUYD+vBAmuLbAdNA7RPkBM=wwFNA@mail.gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: sdk path problem
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
X-List-Received-Date: Thu, 20 Oct 2011 22:14:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-10-20 at 13:24 -0700, Tom Rini wrote:
> On Thu, Oct 20, 2011 at 9:54 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Thu, 2011-10-20 at 08:22 +0000, James Limbouris wrote:
> >> Hi,
> >>
> >> I have been using meta-toolchain-qte in the past to cross compile a Qt app, and the Linux kernel.
> >> Recently I replaced my old SDK image with a fresh one, and found that I could not link vmlinux anymore.
> >>
> >> When building the kernel, I use the following ('rica' is the distribution name):
> >> export PATH=$PATH:/usr/local/rica-eglibc-i686-armv5te/sysroots/i686-ricasdk-linux/usr/bin/armv5te-rica-linux-gnueabi/
> >> make ARCH=arm CROSS_COMPILE=arm-rica-linux-gnueabi- zImage
> >>
> >> The new error message is:
> >>
> >> Kernel: arch/arm/boot/Image is ready
> >>   AS      arch/arm/boot/compressed/head.o
> >>   GZIP    arch/arm/boot/compressed/piggy.gz
> >>   CC      arch/arm/boot/compressed/misc.o
> >>   AS      arch/arm/boot/compressed/piggy.o
> >>   LD      arch/arm/boot/compressed/vmlinux
> >> arm-rica-linux-gnueabi-ld: cannot find libgcc.a: No such file or directory
> >>
> >> Comparing the build with the old sdk to the build with the new one, I find that the command line for linking has changed from:
> >>
> >> arm-rica-linux-gnueabi-ld -EL --defsym zreladdr=0x80008000 --defsym initrd_phys=0x80800000 --defsym params_phys=0x80000100 -p --no-undefined -X /usr/local/rica-eglibc-i686-armv5te/sysroots/arm-rica-linux-gnueabi/usr/lib/arm-rica-linux-gnueabi/4.5.4/libgcc.a -T arch/arm/boot/compressed/vmlinux.lds arch/arm/boot/compressed/head.o arch/arm/boot/compressed/piggy.o arch/arm/boot/compressed/misc.o -o arch/arm/boot/compressed/vmlinux
> >>
> >> to:
> >>
> >> arm-rica-linux-gnueabi-ld -EL --defsym zreladdr=0x80008000 --defsym initrd_phys=0x80800000 --defsym params_phys=0x80000100 -p --no-undefined -X libgcc.a -T arch/arm/boot/compressed/vmlinux.lds arch/arm/boot/compressed/head.o arch/arm/boot/compressed/piggy.o arch/arm/boot/compressed/misc.o -o arch/arm/boot/compressed/vmlinux
> >>
> >> So libgcc.a has lost its path qualification.
> >> I also straced the two linker commands, and found that they differed in one sequence.
> >>
> >> Old:
> >> lstat64("/usr/local/rica-eglibc-i686-armv5te", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
> >> lstat64("/usr/local/rica-eglibc-i686-armv5te/sysroots", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
> >> lstat64("/usr/local/rica-eglibc-i686-armv5te/sysroots/arm-rica-linux-gnueabi", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
> >>
> >> New:
> >> lstat64("/usr/local/rica-eglibc-i686-armv5te", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
> >> lstat64("/usr/local/rica-eglibc-i686-armv5te/sysroots", {st_mode=S_IFDIR|0755, st_size=4096, ...}) = 0
> >> lstat64("/usr/local/rica-eglibc-i686-armv5te/sysroots/arm-rica-linux-gnueabi", 0xbffe67cc) = -1 ENOENT (No such file or directory)
> >>
> >> Both toolchains are looking for a sysroot at 'arm-rica-linux-gnueabi', but the new toolchain should be looking at 'armv5te-rica-linux-gnueabi', as the names have changed.
> >> I'm not yet acquainted with the darker arts of toolchain generation. Can anyone help with this?
> >
> > There should be a --sysroot option being passed to the compiler/linker
> > to tell which sysroot to look at. We did recently change the sysroot
> > location to reflect the target architecture it was optimized for but
> > this does mean the compiler and other tools need the correct sysroot
> > path to be specified. The environment script that ships with the
> > toolchain should do this?
> 
> At least not for things like u-boot and the kernel, no, this isn't
> enough.  Just re-confirmed.

The place I'd start looking is how to ensure the tools get called with
the right flags.

The end result may be we need to create separate cross bin directories
for each target sysroot with wrapper scripts for the tools to ensure the
right flags get passed. Rather nasty and I'd prefer not to but I don't
see easy alternatives if getting the flags to the tools is a problem.

Cheers,

Richard





