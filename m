Received: from vms173013pub.verizon.net ([206.46.173.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SA24h-0007M6-C2
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 17:38:19 +0100
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M1600E8VWBYIMD0@vms173013.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 10:28:52 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id AA21B201B6; Tue,
	20 Mar 2012 11:28:46 -0400 (EDT)
Date: Tue, 20 Mar 2012 11:28:46 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Darren Hart <dvhart@linux.intel.com>
Message-id: <20120320152846.GA22965@denix.org>
References: <1332202974-27977-1-git-send-email-denis@denix.org>
	<4F689BD8.4040201@linux.intel.com>
MIME-version: 1.0
In-reply-to: <4F689BD8.4040201@linux.intel.com>
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
X-List-Received-Date: Tue, 20 Mar 2012 16:38:19 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Mar 20, 2012 at 08:01:44AM -0700, Darren Hart wrote:
> 
> 
> On 03/19/2012 05:22 PM, Denys Dmytriyenko wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Replace dependency on eglibc with virtual/libc
> > Pass LDFLAGS to TARGET_CC_ARCH, instead of CFLAGS as Makefile overrides it
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> 
> Thanks Denys,
> 
> Looking through the rt-tests sources I don't see TARGET_CC_ARCH
> anywhere. Have you confirmed that changes made there make their way into
> the actual build?

Darren,

TARGET_CC_ARCH is not an rt-tests specific variable, it's used in OE. 
Although, TARGET_LDFLAGS might be more appropriate for this purpose, 
historically TARGET_CC_ARCH was heavily used to pass distro LDFLAGS to the 
app's build process - grepping it would show many such cases in OE-Core and 
especially in meta-oe...

> What was the problem you ran into?

Not a problem per se, but it was not getting all the LDFLAGS being passed, 
more specifically:

-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed

BTW, in Classic OE it was failing on GNU Hash QA check w/o this.

-- 
Denys


> > ---
> >  meta/recipes-rt/rt-tests/rt-tests_0.83.bb |    6 +++---
> >  1 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.83.bb b/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
> > index 6425027..3755c79 100644
> > --- a/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
> > +++ b/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
> > @@ -1,7 +1,7 @@
> >  DESCRIPTION = "Real-Time preemption testcases"
> >  HOMEPAGE = "https://rt.wiki.kernel.org/index.php/Cyclictest"
> >  SECTION = "tests"
> > -DEPENDS = "linux-libc-headers eglibc"
> > +DEPENDS = "linux-libc-headers virtual/libc"
> >  LICENSE = "GPLv2 & GPLv2+"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
> >                      file://src/cyclictest/cyclictest.c;beginline=7;endline=9;md5=ce162fe491d19d2ec67dff6dbc938d50 \
> > @@ -11,13 +11,13 @@ SRCREV = "5f1e84f8b015df3ff950056494134eca3f640d70"
> >  
> >  # git -> 0.83 needs a PE bump
> >  PE = "1"
> > -PR = "r1"
> > +PR = "r2"
> >  
> >  SRC_URI = "git://github.com/clrkwllms/rt-tests.git"
> >  
> >  S = "${WORKDIR}/git"
> >  
> > -CFLAGS += "-I${S}/src/include -D_GNU_SOURCE -Wall -Wno-nonnulli ${LDFLAGS}"
> > +TARGET_CC_ARCH += "${LDFLAGS}"
> >  
> >  # calling 'uname -m' is broken on crossbuilds
> >  EXTRA_OEMAKE = "NUMA=0"
> 
> -- 
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Linux Kernel
> 


