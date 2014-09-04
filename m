Return-Path: <denis@denix.org>
X-Greylist: delayed 3600 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 05 Sep 2014 00:08:56 UTC
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id 1D5F571493
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Sep 2014 00:08:56 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NBE00K99GA2GPE0@vms173021.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Thu, 04 Sep 2014 18:08:41 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 329C420331; Thu,
	04 Sep 2014 19:08:26 -0400 (EDT)
Date: Thu, 04 Sep 2014 19:08:26 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Message-id: <20140904230826.GV2480@denix.org>
References: <20110907175510.GB3215@chargestorm.se>
	<20110908070819.GA3928@chargestorm.se>
MIME-version: 1.0
In-reply-to: <20110908070819.GA3928@chargestorm.se>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Anders Darander <anders@chargestorm.se>
Subject: Re: Race condition when building external kernel modules
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
X-List-Received-Date: Fri, 05 Sep 2014 00:09:00 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Hi,

This report is exactly from 3 years ago. Has this ever been resolved or looked 
at? We have started seeing this a lot lately in our own distro based on Daisy 
with 3.14 kernel when building with 12-24 threads. But it might not be release 
specific or even OE specifig...

All the same symptoms as below - external modules break when building/using 
scripts from the kernel tree ran by do_make_scripts function. Usually the 
failure is due to a race in or around fixdep: error opening depfile, but 
sometimes it's in scripts/dtc or scripts/mod when it can't move a temp file 
from a build. Looks like kernel creates .tmp_<name>.o files for use with ksyms 
utils as well as .<name>.o.d files for fixdep and those are usually the files 
that are not available at the right moment due to some race...

Would appreciate any help or pointers. Thanks.

-- 
Denys


On Thu, Sep 08, 2011 at 09:08:19AM +0200, Anders Darander wrote:
> * Anders Darander <anders@chargestorm.se> [110907 19:55]:
> > I've seen a race condition when building multiple external kernel
> > modules. 
> > 
> > We are running with BB_NUMBER_THREADS set to 8 or 16, depending on the
> > build host, thus multiple external kernel modules can be built
> > simultaneously.
> > 
> > In our layer, we have two small kernel modules, whose recipes inherits
> > module.bbclass. Often when doing either a clean build, or after cleaning
> > the two packages, we get a race issue.
> > 
> > At the end of the mail is a short excerpt of the bitbake output after
> > the failure. The exact failure differs from run to run, but generally it
> > is similar to this:
> 
> At the end is a new failure, one that is much more like the "standard"
> failure that I see when this race occurs. In this case, only one of the
> modules fails, and the other module will succeed. (In the previous mail
> was an unusual case were both modules failed...).
> 
> > i.e. something under scripts in the sysroot gets rebuild in bitbake
> > threads, but one will fail as the depfile has been removed. At least
> > that's my interpretation of the most common failure. (Previously, it has
> > often been the depfile scripts/basic/.fixdeps.d that has been missing).
> 
> This (above) is the most common failure, however like in the failure at
> the end, scripts/basic/fixdep could error with a "Text file busy",
> giving the same symptoms.
>  
> > Do there exist any framework (locks?) to disallow two different recipes
> > to be build simultaneously? 
> > Should the compile stage in the module bbclass be guarded with a
> > lock/mutex?
> > 
> > Any other ideas at how this should be attacked?
> > 
> > For our developers, this is mostly an annoying issue; the real issue will
> > start when we're setting up some autobuilders for our own distro...
> 
> Excerpt from new (more standard-like) failure:
> NOTE: package at91-bootcount-1.0-r3: task do_compile: Started
> NOTE: package ccudrv-1.0-r4: task do_compile: Started
> ERROR: Function 'do_compile' failed (see /home/anders/oe-build/build-ccu/tmp-eglibc/work/ccu-oe-linux-gnueabi/at91-bootcount-1.0-r3/temp/log.do_compile.20860 for further information)
> ERROR: Logfile of failure stored in: /home/anders/oe-build/build-ccu/tmp-eglibc/work/ccu-oe-linux-gnueabi/at91-bootcount-1.0-r3/temp/log.do_compile.20860
> Log data follows:
> | + cd /home/anders/oe-build/build-ccu/tmp-eglibc/work/ccu-oe-linux-gnueabi/at91-bootcount-1.0-r3/git
> | + do_compile
> | + module_do_compile
> | + do_make_scripts
> | + unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> | + oe_runmake 'CC=arm-oe-linux-gnueabi-gcc  -mno-thumb-interwork -mno-thumb' 'LD=arm-oe-linux-gnueabi-ld ' 'AR=arm-oe-linux-gnueabi-ar ' -C /home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel scripts
> | + '[' xmake = x ']'
> | + bbnote make -e MAKEFLAGS= 'CC=arm-oe-linux-gnueabi-gcc  -mno-thumb-interwork -mno-thumb' 'LD=arm-oe-linux-gnueabi-ld ' 'AR=arm-oe-linux-gnueabi-ar ' -C /home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel scripts
> | + echo 'NOTE: make -e MAKEFLAGS= CC=arm-oe-linux-gnueabi-gcc  -mno-thumb-interwork -mno-thumb LD=arm-oe-linux-gnueabi-ld  AR=arm-oe-linux-gnueabi-ar  -C /home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel scripts'
> | NOTE: make -e MAKEFLAGS= CC=arm-oe-linux-gnueabi-gcc  -mno-thumb-interwork -mno-thumb LD=arm-oe-linux-gnueabi-ld  AR=arm-oe-linux-gnueabi-ar  -C /home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel scripts
> | + make -e MAKEFLAGS= 'CC=arm-oe-linux-gnueabi-gcc  -mno-thumb-interwork -mno-thumb' 'LD=arm-oe-linux-gnueabi-ld ' 'AR=arm-oe-linux-gnueabi-ar ' -C /home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel scripts
> | make: Entering directory `/home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel'
> | make[1]: Entering directory `/home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel'
> |   HOSTCC  scripts/basic/fixdep
> | /bin/sh: scripts/basic/fixdep: Text file busy
> | make[1]: *** [scripts/basic/fixdep] Error 1
> | make[1]: Leaving directory `/home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel'
> | make: *** [scripts_basic] Error 2
> | make: Leaving directory `/home/anders/oe-build/build-ccu/tmp-eglibc/sysroots/ccu/kernel'
> | + die 'oe_runmake failed'
> | + bbfatal 'oe_runmake failed'
> | + echo 'ERROR: oe_runmake failed'
> | ERROR: oe_runmake failed
> | + exit 1
> | ERROR: Function 'do_compile' failed (see /home/anders/oe-build/build-ccu/tmp-eglibc/work/ccu-oe-linux-gnueabi/at91-bootcount-1.0-r3/temp/log.do_compile.20860 for further information)
> NOTE: package at91-bootcount-1.0-r3: task do_compile: Failed
> ERROR: Task 19 (/home/anders/oe-build/openembedded-core/../chargestorm/recipes/at91-bootcount/at91-bootcount.bb, do_compile) failed with exit code '1'
> Waiting for 1 active tasks to finish:
> 0: ccudrv-1.0-r4 do_compile (pid 20861)
> NOTE: package ccudrv-1.0-r4: task do_compile: Succeeded
> ERROR: '/home/anders/oe-build/openembedded-core/../chargestorm/recipes/at91-bootcount/at91-bootcount.bb' failed
> 
> -- 
> Anders Darander
> ChargeStorm AB
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

