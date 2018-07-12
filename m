Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E7AAF7546F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 13:53:33 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w6CDrWam027213
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 12 Jul 2018 14:53:33 +0100
Message-ID: <f7a60084dfdcbe937ad60021adb1fa6bec88eeff.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Thu, 12 Jul 2018 14:53:32 +0100
In-Reply-To: <dee40069-d36a-2b70-56f6-5b52f3c1e7c4@windriver.com>
References: <1531151586-30557-1-git-send-email-bruce.ashfield@windriver.com>
	<8e3f9ec13333061ecb0125e153df668abe8da1b9.camel@linuxfoundation.org>
	<47b99eac-867c-9cca-ac43-4d5a06760ed3@windriver.com>
	<c0baf80e5943135f4f65a93d849ee68419065c45.camel@linuxfoundation.org>
	<dee40069-d36a-2b70-56f6-5b52f3c1e7c4@windriver.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] kernel-devsrc: restructure for out of tree (and on target) module builds
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
X-List-Received-Date: Thu, 12 Jul 2018 13:53:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-07-12 at 09:49 -0400, Bruce Ashfield wrote:
> On 2018-07-10 5:41 PM, Richard Purdie wrote:
> > On Tue, 2018-07-10 at 12:38 -0400, Bruce Ashfield wrote:
> > > On 07/10/2018 06:21 AM, Richard Purdie wrote:
> > > > On Mon, 2018-07-09 at 11:53 -0400, Bruce Ashfield wrote:
> > > 
> > > I'll try the other configs, but clearly I have something
> > > different in
> > > my x86-64 build.
> > > 
> > > I can't run the self tests directly, but am copying the files
> > > onto my
> > > qemu session and running things myself:
> > > 
> > > root@qemux86-64:/lib/modules/4.14.48-yocto-standard/build# make
> > > ARCH=x86
> > > scripts prepare
> > > Makefile:950: "Cannot use CONFIG_STACK_VALIDATION=y, please
> > > install
> > > libelf-dev, libelf-devel or elfutils-libelf-devel"
> > >     CHK     scripts/mod/devicetable-offsets.h
> > >     SYSTBL  arch/x86/include/generated/asm/syscalls_32.h
> > >     SYSHDR  arch/x86/include/generated/asm/unistd_32_ia32.h
> > >     SYSHDR  arch/x86/include/generated/asm/unistd_64_x32.h
> > >     SYSTBL  arch/x86/include/generated/asm/syscalls_64.h
> > >     SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h
> > >     SYSHDR  arch/x86/include/generated/uapi/asm/unistd_64.h
> > >     SYSHDR  arch/x86/include/generated/uapi/asm/unistd_x32.h
> > >     HOSTCC  arch/x86/tools/relocs_32.o
> > >     HOSTCC  arch/x86/tools/relocs_64.o
> > >     HOSTCC  arch/x86/tools/relocs_common.o
> > >     HOSTLD  arch/x86/tools/relocs
> > >     CHK     include/config/kernel.release
> > >     CHK     include/generated/uapi/linux/version.h
> > >     CHK     include/generated/utsrelease.h
> > > Makefile:950: "Cannot use CONFIG_STACK_VALIDATION=y, please
> > > install
> > > libelf-dev, libelf-devel or elfutils-libelf-devel"
> > > 
> > > root@qemux86-64:/tmp# make
> > > make -C /usr/src/kernel M=/tmp modules
> > > make[1]: Entering directory '/lib/modules/4.14.48-yocto-
> > > standard/build'
> > > Makefile:950: "Cannot use CONFIG_STACK_VALIDATION=y, please
> > > install
> > > libelf-dev, libelf-devel or elfutils-libelf-devel"
> > >     Building modules, stage 2.
> > >     MODPOST 1 modules
> > > make[1]: Leaving directory '/lib/modules/4.14.48-yocto-
> > > standard/build'
> > > root@qemux86-64:/tmp# insmod hellomod.ko
> > > [  419.211616] hellomod: loading out-of-tree module taints
> > > kernel.
> > > [  419.212586] Hello world!
> > > 
> > > This is on the core-image-kernel-dev image, which is the one that
> > > I created to test all this.
> > > 
> > > What image is that using ? some sato sdk one ?
> > 
> > We really need to find you a way to run these. The problem is the
> > qemu
> > graphics piece? You can't have a dummy vncserver or something to
> > direct
> > them at?
> > 
> > The image is a core-image-sato-sdk...
> 
> I was able to trigger the objtool issue with this image, looking at
> fixing it and the other arches now.

Since its image related, is it a missing package dependency? Just
curious why its happening with some images but not your test ones...

Cheers,

Richard


