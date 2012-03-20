Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1SA1ld-00072a-0I
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 17:18:37 +0100
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M1600KK9Y7TVJU0@vms173019.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 11:09:30 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 14EAA201B6; Tue,
	20 Mar 2012 12:09:28 -0400 (EDT)
Date: Tue, 20 Mar 2012 12:09:28 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Darren Hart <dvhart@linux.intel.com>
Message-id: <20120320160928.GB22965@denix.org>
References: <1332202974-27977-1-git-send-email-denis@denix.org>
	<4F689BD8.4040201@linux.intel.com> <20120320152846.GA22965@denix.org>
	<4F68A33A.7060604@linux.intel.com>
MIME-version: 1.0
In-reply-to: <4F68A33A.7060604@linux.intel.com>
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
X-List-Received-Date: Tue, 20 Mar 2012 16:18:37 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Mar 20, 2012 at 08:33:14AM -0700, Darren Hart wrote:
> 
> 
> On 03/20/2012 08:28 AM, Denys Dmytriyenko wrote:
> > On Tue, Mar 20, 2012 at 08:01:44AM -0700, Darren Hart wrote:
> >>
> >>
> >> On 03/19/2012 05:22 PM, Denys Dmytriyenko wrote:
> >>> From: Denys Dmytriyenko <denys@ti.com>
> >>>
> >>> Replace dependency on eglibc with virtual/libc
> >>> Pass LDFLAGS to TARGET_CC_ARCH, instead of CFLAGS as Makefile overrides it
> >>>
> >>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >>
> >> Thanks Denys,
> >>
> >> Looking through the rt-tests sources I don't see TARGET_CC_ARCH
> >> anywhere. Have you confirmed that changes made there make their way into
> >> the actual build?
> > 
> > Darren,
> > 
> > TARGET_CC_ARCH is not an rt-tests specific variable, it's used in OE. 
> > Although, TARGET_LDFLAGS might be more appropriate for this purpose, 
> > historically TARGET_CC_ARCH was heavily used to pass distro LDFLAGS to the 
> > app's build process - grepping it would show many such cases in OE-Core and 
> > especially in meta-oe...
> 
> OK, thanks for the context. Will you be resubmitting with TARGET_LDFLAGS?

Nope, my bad, it's actually the other way around. From bitbake.conf:

export LDFLAGS = "${TARGET_LDFLAGS}"

So, appending to TARGET_CC_ARCH is the simplest way to pass flags, as that's 
embedded into $CC

Another option would have been to call make with -e flag to let environment 
variables override the ones in the Makefile, but that's less controlled...

-- 
Denys


> >> What was the problem you ran into?
> > 
> > Not a problem per se, but it was not getting all the LDFLAGS being passed, 
> > more specifically:
> > 
> > -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
> > 
> > BTW, in Classic OE it was failing on GNU Hash QA check w/o this.
> > 
> 
> -- 
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Linux Kernel
> 


