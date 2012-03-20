Received: from vms173013pub.verizon.net ([206.46.173.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SA4QO-00022U-DU
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 20:08:52 +0100
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M1700DSD63D2C21@vms173013.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 13:59:39 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8C77D201B6; Tue,
	20 Mar 2012 14:59:37 -0400 (EDT)
Date: Tue, 20 Mar 2012 14:59:37 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Darren Hart <dvhart@linux.intel.com>
Message-id: <20120320185937.GC22965@denix.org>
References: <1332202974-27977-1-git-send-email-denis@denix.org>
	<4F689BD8.4040201@linux.intel.com> <20120320152846.GA22965@denix.org>
	<4F68A33A.7060604@linux.intel.com> <20120320160928.GB22965@denix.org>
	<4F68CEDA.2060101@linux.intel.com>
MIME-version: 1.0
In-reply-to: <4F68CEDA.2060101@linux.intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rt-tests: fix dependency on eglibc, clean LDFLAGS passing
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
X-List-Received-Date: Tue, 20 Mar 2012 19:08:52 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Mar 20, 2012 at 11:39:22AM -0700, Darren Hart wrote:
> On 03/20/2012 09:09 AM, Denys Dmytriyenko wrote:
> > On Tue, Mar 20, 2012 at 08:33:14AM -0700, Darren Hart wrote:
> >>
> >>
> >> On 03/20/2012 08:28 AM, Denys Dmytriyenko wrote:
> >>> On Tue, Mar 20, 2012 at 08:01:44AM -0700, Darren Hart wrote:
> >>>>
> >>>>
> >>>> On 03/19/2012 05:22 PM, Denys Dmytriyenko wrote:
> >>>>> From: Denys Dmytriyenko <denys@ti.com>
> >>>>>
> >>>>> Replace dependency on eglibc with virtual/libc
> >>>>> Pass LDFLAGS to TARGET_CC_ARCH, instead of CFLAGS as Makefile overrides it
> >>>>>
> >>>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >>>>
> >>>> Thanks Denys,
> >>>>
> >>>> Looking through the rt-tests sources I don't see TARGET_CC_ARCH
> >>>> anywhere. Have you confirmed that changes made there make their way into
> >>>> the actual build?
> >>>
> >>> Darren,
> >>>
> >>> TARGET_CC_ARCH is not an rt-tests specific variable, it's used in OE. 
> >>> Although, TARGET_LDFLAGS might be more appropriate for this purpose, 
> >>> historically TARGET_CC_ARCH was heavily used to pass distro LDFLAGS to the 
> >>> app's build process - grepping it would show many such cases in OE-Core and 
> >>> especially in meta-oe...
> >>
> >> OK, thanks for the context. Will you be resubmitting with TARGET_LDFLAGS?
> > 
> > Nope, my bad, it's actually the other way around. From bitbake.conf:
> > 
> > export LDFLAGS = "${TARGET_LDFLAGS}"
> > 
> > So, appending to TARGET_CC_ARCH is the simplest way to pass flags, as that's 
> > embedded into $CC
> > 
> > Another option would have been to call make with -e flag to let environment 
> > variables override the ones in the Makefile, but that's less controlled...
> > 
> 
> How about the follow patch against rt-tests? Clark W. said he's fine taking a
> patch that allows such an override. Does this meet your needs?

It does look good. Especially if it gets upstreamed! :)

If those default CFLAGS should always be there, then you can do something 
like:

CFLAGS ?=
CFLAGS += -D_GNU_SOURCE -Wall -Wno-nonnull -Isrc/include

But that would mean there's no way to override those from outside, only add to 
them...

Thanks for taking time to upstream the fix. I'll need to re-submit my patch to 
only do the eglibc -> virtual/libc change.

-- 
Denys


> From 9f1944b0751ccb398a47fc4c3652c459aab44f38 Mon Sep 17 00:00:00 2001
> Message-Id: <9f1944b0751ccb398a47fc4c3652c459aab44f38.1332268655.git.darren@dvhart.com>
> From: Darren Hart <darren@dvhart.com>
> Date: Tue, 20 Mar 2012 11:34:08 -0700
> Subject: [PATCH] rt-tests: Support user supplied CFLAGS and LDFLAGS
> 
> Accept user supplied CFLAGS and LDFLAGS, overwriting the
> Makefile supplied versions. This can cause the build to
> fail if the user does not provide at least what the Makefile
> defines, but so be it.
> 
> Signed-off-by: Darren Hart <darren@dvhart.com>
> CC: Denys Dmytriyenko <denis@denix.org>
> ---
>  Makefile |   25 +++++++++++++------------
>  1 files changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 4038dcc..e1edf6c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -20,7 +20,8 @@ ifneq ($(filter x86_64 i386 ia64 mips powerpc,$(machinetype)),)
>  NUMA 	:= 1
>  endif
>  
> -CFLAGS = -D_GNU_SOURCE -Wall -Wno-nonnull -Isrc/include
> +CFLAGS ?= -D_GNU_SOURCE -Wall -Wno-nonnull -Isrc/include
> +LDFLAGS ?=
>  
>  PYLIB  := $(shell python -c 'import distutils.sysconfig;  print distutils.sysconfig.get_python_lib()')
>  
> @@ -61,41 +62,41 @@ all: $(TARGETS) hwlatdetect
>  -include $(sources:.c=.d)
>  
>  cyclictest: cyclictest.o rt-utils.o
> -	$(CC) $(CFLAGS) -o $@ $^ $(LIBS) $(NUMA_LIBS)
> +	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS) $(NUMA_LIBS)
>  
>  signaltest: signaltest.o rt-utils.o
> -	$(CC) $(CFLAGS) -o $@ $^ $(LIBS)
> +	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
>  
>  pi_stress: pi_stress.o
> -	$(CC) $(CFLAGS) -o $@ $^ $(LIBS)
> +	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
>  
>  hwlatdetect:  src/hwlatdetect/hwlatdetect.py
>  	chmod +x src/hwlatdetect/hwlatdetect.py
>  	ln -s src/hwlatdetect/hwlatdetect.py hwlatdetect
>  
>  rt-migrate-test: rt-migrate-test.o
> -	$(CC) $(CFLAGS) -o $@ $^ $(LIBS)
> +	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
>  
>  ptsematest: ptsematest.o rt-utils.o rt-get_cpu.o
> -	$(CC) $(CFLAGS) -o $@ $^ $(LIBS) $(EXTRA_LIBS)
> +	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS) $(EXTRA_LIBS)
>  
>  sigwaittest: sigwaittest.o rt-utils.o rt-get_cpu.o
> -	$(CC) $(CFLAGS) -o $@ $^ $(LIBS) $(EXTRA_LIBS)
> +	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS) $(EXTRA_LIBS)
>  
>  svsematest: svsematest.o rt-utils.o rt-get_cpu.o
> -	$(CC) $(CFLAGS) -o $@ $^ $(LIBS) $(EXTRA_LIBS)
> +	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS) $(EXTRA_LIBS)
>  
>  pmqtest: pmqtest.o rt-utils.o rt-get_cpu.o
> -	$(CC) $(CFLAGS) -o $@ $^ $(LIBS) $(EXTRA_LIBS)
> +	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS) $(EXTRA_LIBS)
>  
>  sendme: sendme.o rt-utils.o rt-get_cpu.o
> -	$(CC) $(CFLAGS) -o $@ $^ $(LIBS) $(EXTRA_LIBS)
> +	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS) $(EXTRA_LIBS)
>  
>  pip_stress: pip_stress.o error.o rt-utils.o
> -	$(CC) $(CFLAGS) -o $@ $^ $(LIBS)
> +	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
>  
>  hackbench: hackbench.o
> -	$(CC) $(CFLAGS) -o $@ $^ $(LIBS)
> +	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)
>  
>  CLEANUP  = $(TARGETS) *.o .depend *.*~ *.orig *.rej rt-tests.spec *.d
>  CLEANUP += $(if $(wildcard .git), ChangeLog)
> -- 
> 1.7.6.5
> 
> 
> -- 
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Linux Kernel
> 


