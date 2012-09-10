Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TB3wU-0007yo-2v
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 15:22:22 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 Sep 2012 06:09:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,398,1344236400"; d="scan'208";a="200758529"
Received: from unknown (HELO helios.localnet) ([10.252.121.193])
	by orsmga002.jf.intel.com with ESMTP; 10 Sep 2012 06:09:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Jason Wessel <jason.wessel@windriver.com>
Date: Mon, 10 Sep 2012 14:09:43 +0100
Message-ID: <2077324.RhOGre5BZ7@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-30-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <50490D24.6020306@windriver.com>
References: <1346957634-22312-1-git-send-email-jason.wessel@windriver.com>
	<2236591.qU5F3vlEoV@helios> <50490D24.6020306@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] packageinfo.bbclass: Fix crash in hob
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
X-List-Received-Date: Mon, 10 Sep 2012 13:22:22 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 06 September 2012 15:52:52 Jason Wessel wrote:
> On 09/06/2012 03:36 PM, Paul Eggleton wrote:
> > On Thursday 06 September 2012 13:53:54 Jason Wessel wrote:
> >> The hob internally fails after executing a build and invoking
> >> the hob a second time when it tries to use the values found in
> >> BUILDDIR/tmp/pkgdata/*/runtime/*
> >> 
> >> The internal failure of the hob will manifest itself as
> >> stating "Populated recipes 99%" forever after selecting
> >> a machine just after starting the hob interface.
> >> 
> >> The internal trace looks like:
> >> 
> >> Traceback (most recent call last):
> >> File "packageinfo_handler(e)", line 24, in packageinfo_handler
> >> KeyError: 'PKGV'
> >> 
> >> It is a result of using an override for a package version for
> >> pieces of the toolchain, in the bb file e.g.
> >> PKGV_gdb-dbg = "1234.5678"
> >> 
> >> The work around for now is to populate the sdata PKGV value
> >> and to assign the pkgv variable with the correct value
> >> from the values found in the pkgdata store.
> >> 
> >> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> >> ---
> >> meta/classes/packageinfo.bbclass | 7 ++++++-
> >> 1 files changed, 6 insertions(+), 1 deletions(-)
> >> 
> >> diff --git a/meta/classes/packageinfo.bbclass
> >> b/meta/classes/packageinfo.bbclass index 26cce60..53965e4 100644
> >> --- a/meta/classes/packageinfo.bbclass
> >> +++ b/meta/classes/packageinfo.bbclass
> >> @@ -18,7 +18,12 @@ python packageinfo_handler () {
> >> sdata = oe.packagedata.read_pkgdatafile(root +
> >> pkgname) sdata['PKG'] = pkgname
> >> pkgrename = sdata['PKG_%s' % pkgname]
> >> - pkgv = sdata['PKGV'].replace('-', '+')
> >> + try:
> >> + pkgv = sdata['PKGV']
> >> + except:
> >> + sdata['PKGV'] = sdata['PKGV_%s' % pkgname]
> >> + pkgv = sdata['PKGV']
> >> + pkgv = pkgv.replace('-', '+')
> >> pkgr = sdata['PKGR']
> >> # We found there are some renaming issue with
> >> certain architecture. # For example, armv7a-vfp-neon, it will use armv7a
> >> in
> >> the rpm file. This is the workaround for it.
> > 
> > Rather than a blanket try...except which could catch other errors I would
> > suggest using .get() to which you can supply a default value if no such
> > key
> > exists in the dict.
> > 
> > I'm afraid I didn't get around to determining whether we should be
> > recording these package name overrides in the pkgdata files today, I will
> > check into that tomorrow.
> 
> Honestly I don't care how we fix it, and I believe the fix I proposed
> should be changed over to the writer side.  If nothing else this patch
> is meant to illustrate or call out the problem.
> 
> You'll note I had to actually set the sdata['PKGV'] because it turns
> out it is used directly elsewhere in the hob and things started
> falling over without fixing it.  This leads us to the possibility that
> the writer of the data store is probably wrong, at least for PKGV
> anyway.

I've looked closely at how this file is used and it seems to me that the way it 
is being written out is intentional. Some of the code in this function is 
broken in other ways however so I have replaced it in a patch I just sent out. 
I'll also send a patch to correctly handle the data within hob. With these two 
patches, at least several underlying issues will be fixed; the error handling 
still needs to be addressed however.

> What I find odd is that this does work when the pkgdata store is not
> there which leads me to believe it was never written out properly in
> the first place or the data isn't always needed.  The hob, to me looks
> like a piece of spaghetti, so without further investigation I cannot
> make a concise claim about the correct fix.  I am hoping someone else
> might take a further look at it who knows more about the hob
> interface.

The pkgdata store is not necessary for Hob to function, no, but if it's not 
there you will get no packages listed during the individual package selection 
- that's what this data is used for.

Note that this issue is triggered by the overriding of PKGV on a per-package 
basis - which is the correct way to do it - however this is not something that 
gets done very often, hence it not being something well-tested. That's no 
excuse of course, but it is an explanation.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


