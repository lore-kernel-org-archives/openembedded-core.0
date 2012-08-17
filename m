Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T2Jyv-00015h-JQ for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 12:40:46 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7HASad7007801;
	Fri, 17 Aug 2012 11:28:36 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07637-02; Fri, 17 Aug 2012 11:28:31 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7HASRXB007794
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 17 Aug 2012 11:28:28 +0100
Message-ID: <1345199307.26132.13.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 17 Aug 2012 11:28:27 +0100
In-Reply-To: <502D314F.5010302@windriver.com>
References: <1345070782-4518-1-git-send-email-andy.ross@windriver.com>
	<1345070782-4518-2-git-send-email-andy.ross@windriver.com>
	<1345106385.7750.76.camel@x121e.pbcl.net>
	<502D314F.5010302@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [PATCH] insane.bbclass: Fix RPATH warning in the face of funny path strings
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
X-List-Received-Date: Fri, 17 Aug 2012 10:40:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-08-16 at 10:43 -0700, Andy Ross wrote:
> On 08/16/2012 01:39 AM, Phil Blundell wrote:
> > If these RPATHs are causing host pollution then that sounds like there
> > is another bug elsewhere.  They ought to be resolved relative to the
> > sysroot during link edit.
> 
> Indeed, this is turning out to be a deeper issue than I wanted it to
> be.  What seems to be is happening is this: an RPATH in the ELF header
> is interpreted relative to sysroot normally.  But when linking, a
> -rpath argument to the ld is interpreted relative to the *host*
> filesystem even when there is a --sysroot argument.  See the quick
> test script below.
> 
> As it happens, both of those are ultimately produced by libtool, and
> it's only the second one that is fatal.  The RPATH itself is probably
> still a warning condition, but it's not a build breaker.  But neither
> is needed, they are happening in the case I'm looking at only because
> libtool (I think) is confused by the "/../" syntax in the link path
> into trying to add an RPATH where one isn't needed.
> 
> The specific case I'm looking at (with our internal tree, I'm working
> on reproducing vs. poky right now) is with a pulseaudio build, where
> an x86-64 build on an x86_64 host hits a RPATH in libgdk-x11-2.0 that
> pulls in the host libXranr and fails due to version skew.  I was just
> pointed at a discussion from last week on owl_video which looks all
> but identical.
> 
> At least for the moment I'm going to try to track down the libtool
> issue (maybe sanify the path before it sees if if possible) instead of
> trying to fix a linker bug.

I suspect you need to look somewhere around:

http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/recipes-devtools/libtool/libtool/fix-rpath.patch

and normalise the rpaths being used by libtool. I think it has some kind
of path normalisation function somewhere...

Cheers,

Richard



