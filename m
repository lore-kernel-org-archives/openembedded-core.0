Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1USrHU-0004Cr-5H
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 18:01:59 +0200
Received: from cpebcc8100de718-cmbcc8100de715.cpe.net.cable.rogers.com
	([99.240.144.66]:49352 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1USr0T-0000Kv-IS; Thu, 18 Apr 2013 11:44:17 -0400
Date: Thu, 18 Apr 2013 11:44:13 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Mark Hatle <mark.hatle@windriver.com>
In-Reply-To: <51700C7C.3050100@windriver.com>
Message-ID: <alpine.DEB.2.02.1304181136120.22645@oneiric>
References: <alpine.DEB.2.02.1304180833040.10184@oneiric>
	<516FFE5F.7040901@windriver.com>
	<alpine.DEB.2.02.1304181018220.21920@oneiric>
	<51700C7C.3050100@windriver.com>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: openembedded-core@lists.openembedded.org
Subject: Re: tweaking insane.bbclass to handle MIPS SEAD-3?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Apr 2013 16:02:04 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 18 Apr 2013, Mark Hatle wrote:

> On 4/18/13 9:25 AM, Robert P. J. Day wrote:

... snip ...

> > DEFAULTTUNE ?= "mips32"
> >
> > require conf/machine/include/mips/arch-mips.inc
> >
> > TUNEVALID[mips32] = "Enable mips32 specific processor optimizations"
> > TUNECONFLICTS[mips32] = "n64 n32"
> > TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "mips32",
> > "-march=mips32", "", d)}"
> >
> > AVAILTUNES += "mips32 mips32el mips32-nf mips32el-nf"
> >
> >    so, off the top of my head, i suggested adding to local.conf:
> >
> > DEFAULTTUNE := "mips32el"
>
> A quick look at master says that that should be fine.  It will result in:
>
> TUNE_FEATURES = "o32 fpu-hard mips32"
> BASE_LIB = "lib"
> TUNE_ARCH = "mipsel"
> TUNE_PKGARCH = "mips32el"
> PACKAGE_EXTRA_ARCHS = "mipsel mips32el"
>
> Changing the tune to "mips32el-nf", will result in a mips32 little
> endian, soft-float system.  And there should be no sanity or other
> failures.
>
> (Note, the difference between 'mips' and 'mips32' is use of -march=mips32.)
>
> > since that's listed as one of the "AVAILTUNES", but i was just
> > guessing. from what i heard, that *partly* solved the problem but
> > the rest of the solution is what you read above.
> >
> >    i can easily ask them to try a different recipe, they're all
> > set up to build and test a rootfs. what *would* have been the
> > right approach?
>
> If the tuning is set right, then everything else should "just work".
> They can do the DEFAULTTUNE setting in their local.conf, but it's
> better to do it in their machine.conf file.  (Style vs required.)
>
> They can verify the settings using 'bitbake -e' and looking for the
> CC flags, and other related items to make sure they are right for
> this system.

  so if i read you correctly, all i need to do is copy the existing
routerstationpro.conf to, say, sead3.conf, and add the single line:

DEFAULTTUNE := "mips32el-nf"         <--- add that
require conf/machine/include/tune-mips32.inc

  that about right? i'll give that a shot right away just to see if it
builds.  can't test it without the kit but building will still be a
useful exercise.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


