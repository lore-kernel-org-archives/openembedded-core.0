Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1USq3Z-0004Lv-Eq
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Apr 2013 16:43:27 +0200
Received: from cpebcc8100de718-cmbcc8100de715.cpe.net.cable.rogers.com
	([99.240.144.66]:46967 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1USpmZ-0001VS-Gl; Thu, 18 Apr 2013 10:25:51 -0400
Date: Thu, 18 Apr 2013 10:25:47 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Mark Hatle <mark.hatle@windriver.com>
In-Reply-To: <516FFE5F.7040901@windriver.com>
Message-ID: <alpine.DEB.2.02.1304181018220.21920@oneiric>
References: <alpine.DEB.2.02.1304180833040.10184@oneiric>
	<516FFE5F.7040901@windriver.com>
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
X-List-Received-Date: Thu, 18 Apr 2013 14:43:39 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 18 Apr 2013, Mark Hatle wrote:

> On 4/18/13 7:38 AM, Robert P. J. Day wrote:
> >
> >    students from a class of mine last year are currently playing
> > with a MIPS SEAD-3:
> >
> > http://www.mips.com/products/development-kits/mips-sead-3/
> >
> > and asked for some assistance getting oe/yocto to build for that
> > kit. they started with the routerstation pro content, and just
> > wanted to reproduce the same rootfs to run on the SEAD-3 (they
> > would use the provided u-boot and kernel for now). the biggest
> > issue was changing the endianness of the build.
> >
> >    got an email this morning, they have a working rootfs, i asked
> > for details on everything they had to do, but for now, here's the
> > final issue they dealt with:
> >
> > "Attached rootfs created for RS Pro, but with mips32el (little
> > endian config) and soft floating point. I had to comment out the
> > endianess check Python code from the insane.bbclass file to get
> > the build to work."
>
> I'm interested in what changes are required.  Both mips and mipsel
> are defined in the insane class.  If you define 'mips', but end up
> building little endian, you WILL get errors.  But if the arch is
> defined as mipsel, then no errors should be generated.
>
> If the arch is 'mips32' and 'mips32el' then those are simply not
> defined at this point.  But before defining them, what is the
> difference between mips and mips32?
>
> (I have no experience with this particular board, so I don't know
> what the actual gcc configuration is for building functional
> software.)

  i'm still waiting to hear back ... do you know *theoretically* what
the recipe should have been? i gave them some initial advice but as
this was the first time i had anything to do with MIPS endianness, it
might have been horrifically bad advice.

  i pointed out the oe-core file "tune-mips32.inc", and the following:

DEFAULTTUNE ?= "mips32"

require conf/machine/include/mips/arch-mips.inc

TUNEVALID[mips32] = "Enable mips32 specific processor optimizations"
TUNECONFLICTS[mips32] = "n64 n32"
TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "mips32",
"-march=mips32", "", d)}"

AVAILTUNES += "mips32 mips32el mips32-nf mips32el-nf"

  so, off the top of my head, i suggested adding to local.conf:

DEFAULTTUNE := "mips32el"

since that's listed as one of the "AVAILTUNES", but i was just
guessing. from what i heard, that *partly* solved the problem but the
rest of the solution is what you read above.

  i can easily ask them to try a different recipe, they're all set up
to build and test a rootfs. what *would* have been the right approach?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


