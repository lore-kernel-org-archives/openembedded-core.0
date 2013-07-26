Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 022086B3D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 13:56:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Jul 2013 06:56:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,751,1367996400"; d="scan'208";a="352197195"
Received: from lpalcu-linux.rb.intel.com (HELO lpalcu-linux) ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 26 Jul 2013 06:56:19 -0700
Date: Fri, 26 Jul 2013 16:56:17 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
Message-ID: <20130726135617.GA17824@lpalcu-linux>
References: <CALaXJ9nQCTk==sDA2UySBBwRd_g_gqvO0F=_r7gK14gQE-rKwQ@mail.gmail.com>
	<loom.20130726T142233-407@post.gmane.org>
MIME-Version: 1.0
In-Reply-To: <loom.20130726T142233-407@post.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Issue of Yocto multilib sdk
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
X-List-Received-Date: Fri, 26 Jul 2013 13:56:47 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Jul 26, 2013 at 12:36:21PM +0000, Alexandru-Cezar Sardan wrote:
>  
> > Hi experts, 
> > 
> > I use Yocto to generate multilib sdk, I append following content in my 
> local.conf. 
> > 
> >     require conf/multilib.conf
> >     MULTILIBS = "multilib:lib64"
> >     DEFAULTTUNE_virtclass-multilib-lib64 = "x86-64"
> > 
> >     IMAGE_INSTALL_append = " \
> >         ${ <at> multilib_pkg_extend(d, "binutils")} \
> > 
> > 
> >         ${ <at> multilib_pkg_extend(d, "eglibc")} \
> > 
> >         ${ <at> multilib_pkg_extend(d, "eglibc-dev")} \
> >         ${ <at> multilib_pkg_extend(d, "eglibc-staticdev")} \
> > 
> >         ${ <at> multilib_pkg_extend(d, "gcc")} \
> > 
> >         ${ <at> multilib_pkg_extend(d, "glib-2.0")} \
> >         ${ <at> multilib_pkg_extend(d, "glib-2.0-dev")} \
> > 
> >         ${ <at> multilib_pkg_extend(d, "libgcc-dev")} \
> >         ${ <at> multilib_pkg_extend(d, "libstdc++")} \
> > 
> >         ${ <at> multilib_pkg_extend(d, "libstdc++-dev")} \
> >         ${ <at> multilib_pkg_extend(d, "libstdc++-staticdev")} \
> >     "
> > 
> > 
> > 
> > The sdk is generated successfully, I installed poky-eglibc-x86_64-i586-
> toolchain-gmae-1.4+snapshot-20130619.sh in the default 
> path(/opt/poky/1.4+snapshot/). 
> > 
> > 1. 32bit build for my test C program, it passed,
> >     $ source /opt/poky/1.4+snapshot/environment-setup-i586-poky-linux
> >     $ $CC mytest.c -o mytest.c
> > 2. 64bit build for the same test C program, it failed.
> >     $ source /opt/poky/1.4+snapshot/environment-setup-x86_64-pokymllib64-
> linux
> >     $ $CC mytest.c -o mytest
> > /opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-
> pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: cannot find 
> crtbegin.o: No such file or directory
> > /opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-
> pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: cannot find -lgcc
> > /opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-
> pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: skipping 
> incompatible /opt/poky/1.4+snapshot/sysroots/i586-poky-linux/lib/libgcc_s.so 
> when searching for -lgcc_s
> > /opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-
> pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: skipping 
> incompatible /opt/poky/1.4+snapshot/sysroots/i586-poky-linux/lib/libgcc_s.so 
> when searching for -lgcc_s
> > /opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-
> pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: cannot find -lgcc_s
> > /opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-
> pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: skipping 
> incompatible /opt/poky/1.4+snapshot/sysroots/i586-poky-linux/usr/lib/libc.so 
> when searching for -lc
> > /opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-
> pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: skipping 
> incompatible /opt/poky/1.4+snapshot/sysroots/i586-poky-linux/usr/lib/libc.so 
> when searching for -lc
> > /opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-
> pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: cannot find -lc
> > /opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-
> pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: cannot find -lgcc
> > /opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-
> pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: skipping 
> incompatible /opt/poky/1.4+snapshot/sysroots/i586-poky-linux/lib/libgcc_s.so 
> when searching for -lgcc_s
> > /opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-
> pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: skipping 
> incompatible /opt/poky/1.4+snapshot/sysroots/i586-poky-linux/lib/libgcc_s.so 
> when searching for -lgcc_s
> > /opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-
> pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: cannot find -lgcc_s
> > /opt/poky/1.4+snapshot/sysroots/x86_64-pokysdk-linux/usr/libexec/x86_64-
> pokymllib64-linux/gcc/x86_64-pokymllib64-linux/4.7.2/ld: cannot find 
> crtend.o: No such file or directory
> > collect2: error: ld returned 1 exit status
> > 
> > Am I missing something?

There could be several issues here:
1. default library path for 64bit is wrong... You can inspect it by
looking at SEARCH_DIR in the linker script. Just run:

$CC -o mytest -Wl,-verbose mytest.c

Then you can try to set the library path explicitly with -L. See if it
works.

2. you don't have the 64bit libraries and it falls back to looking into
/lib or /usr/lib which contain the 32bit libraries...

Do you have any lib64/ usr/lib64/ in your target sysroot?

Thanks,
Laurentiu
 
> > 
> > 
> > Cheers, 
> > 
> > Bruce
> > 
> > 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@...
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > 
> 
> I am experiencing the same issue with poky-dylan-9.0.0.
> Can someone please help with this problem?
> 
> Kind regards,
> Alex
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

