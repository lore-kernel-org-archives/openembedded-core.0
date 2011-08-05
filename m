Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QpFFb-0005kd-86
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 09:55:23 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QpFBN-0005DX-0Q
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 09:51:01 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94DE85F4F7@orsmsx504.amr.corp.intel.com>
References: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
	<2c351319afd13acfca1283104172729925cfb696.1312469790.git.nitin.a.kamble@intel.com>
	<1312495032.3169.6.camel@lenovo.internal.reciva.com>
	<9DA5872FEF993D41B7173F58FCF6BE94DE85F4F7@orsmsx504.amr.corp.intel.com>
Date: Fri, 05 Aug 2011 08:50:54 +0100
Message-ID: <1312530654.3169.12.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 09/10] x86 tune inc files: add x32 abi tune parameters
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
X-List-Received-Date: Fri, 05 Aug 2011 07:55:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-04 at 15:18 -0700, Kamble, Nitin A wrote:
> 
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > Phil Blundell
> > Sent: Thursday, August 04, 2011 2:57 PM
> > To: Patches and discussions about the oe-core layer
> > Subject: Re: [OE-core] [PATCH 09/10] x86 tune inc files: add x32 abi
> > tune parameters
> > 
> > On Thu, 2011-08-04 at 08:01 -0700, nitin.a.kamble@intel.com wrote:
> > >  # ELF32 ABI
> > >  TUNEVALID[m32] = "IA32 ELF32 standard ABI"
> > > -TUNECONFLICTS[m32] = "m64"
> > > +TUNECONFLICTS[m32] = "m64 mx32"
> > >  TUNE_ARCH .= "${@bb.utils.contains("TUNE_FEATURES", "m32",
> > "${X86ARCH32}", "" ,d)}"
> > > +ABIEXTENSION .= "${@bb.utils.contains("TUNE_FEATURES", "m32", "32",
> > "" ,d)}"
> > >  TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "m32", "-m32",
> > "", d)}"
> > 
> > This is going to cause TARGET_OS to change for everyone using the i586
> > ABI, right?  That doesn't seem like it is either necessary or
> > desirable,
> > and it isn't mentioned in the checkin comment either.
> 
> Correct, this will change the TARGET_OS from linux_gnu to linux_gnu32. And it is also applicable for x86-64 machine set with x86 tune. This change is be needed if multiple tunes are built from the same build directory. If such situation is not important then the ABIEXTENSION part can be dropped.

Well, if you build i686 and x32 in the same tree they will already be
disambiguated through TARGET_ARCH.  Likewise i686 and x86-64 already
works for the same reason.  So, the only possible conflict is between
x86-64 and x32, and setting ABIEXTENSION for x32 (only) would be
sufficient to avoid that.

Though, I do wonder whether x32 ought to just have its own TARGET_ARCH
value rather than trying to disambiguate it through TARGET_OS hackery.

p.



