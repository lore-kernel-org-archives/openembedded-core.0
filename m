Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UWpba-0006vc-Fl
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Apr 2013 17:03:14 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Apr 2013 07:43:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,574,1363158000"; d="scan'208";a="328242081"
Received: from unknown (HELO helios.localnet) ([10.255.12.140])
	by orsmga002.jf.intel.com with ESMTP; 29 Apr 2013 07:45:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Apr 2013 15:45:01 +0100
Message-ID: <2359996.YCG7Bud1Ca@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-19-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <1367053734.29677.91.camel@ted>
References: <1366975838.14512.99.camel@phil-desktop.brightsign>
	<6907890.oTRpLvAECS@helios> <1367053734.29677.91.camel@ted>
MIME-Version: 1.0
Subject: Re: [PATCH] image.bbclass: Don't mark do_rootfs and do_build as nostamp
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
X-List-Received-Date: Mon, 29 Apr 2013 15:03:20 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 27 April 2013 10:08:54 Richard Purdie wrote:
> On Sat, 2013-04-27 at 09:34 +0100, Paul Eggleton wrote:
> > On Friday 26 April 2013 12:30:38 Phil Blundell wrote:
> > > There doesn't appear to be any compelling reason for these tasks to be
> > > nostamp and having them re-run on every build can be irritating (for
> > > example, when the image is an initramfs which your kernel image depends
> > > on).
> > > 
> > > Signed-off-by: Phil Blundell <philb@gnu.org>
> > > ---
> > > 
> > >  meta/classes/image.bbclass |    2 --
> > >  1 file changed, 2 deletions(-)
> > > 
> > > diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> > > index ffb372a..667d03d 100644
> > > --- a/meta/classes/image.bbclass
> > > +++ b/meta/classes/image.bbclass
> > > @@ -168,11 +168,9 @@ LINGUAS_INSTALL ?= "${@" ".join(map(lambda s:
> > > "locale-base-%s" % s, d.getVar('IM
> > > 
> > >  PSEUDO_PASSWD = "${IMAGE_ROOTFS}"
> > > 
> > > -do_rootfs[nostamp] = "1"
> > > 
> > >  do_rootfs[dirs] = "${TOPDIR} ${WORKDIR}/intercept_scripts"
> > >  do_rootfs[lockfiles] += "${IMAGE_ROOTFS}.lock"
> > >  do_rootfs[cleandirs] += "${S} ${WORKDIR}/intercept_scripts"
> > > 
> > > -do_build[nostamp] = "1"
> > > 
> > >  # Must call real_do_rootfs() from inside here, rather than as a
> > >  separate
> > >  # task, so that we have a single fakeroot context for the whole
> > >  process.
> > 
> > I have to say I'm not in favour of this. AFAIK these tasks have always
> > been
> > nostamp, and I'm not sure making do_build is going to help for the case
> > you
> > cite because the dependency on INITRD_IMAGE is on do_rootfs.
> > 
> > If you're concerned about your initramfs image rebuilding when building
> > the
> > main image, what happens if you specify do_rootfs[nostamp] = "0" ?
> 
> I think this deserves some further thought. It is a pretty major change
> however it is something I've wondered about for a while independently of
> Phil, I've just never proposed a patch.
> 
> It might help to think about this in an alternative way. Before we has
> the sstate checksums, it was near impossible to know when the inputs to
> an image had changed and when they had not. Now with the sstate
> checksums, we can know when any given input has changed and if it has
> changed, the sstate checksum changes and the task re-runs.
> 
> You can therefore make the case that these "nostamp" tasks are a legacy
> of the former world and that now, there is no compelling reason to have
> them as nostamp. If you particularly want to force them to run, we do
> have the -f option and its tainting works here just as well as it does
> anywhere else.
> 
> If the rootfs nostamp is removed, there is no reason to have build as a
> nostamp either, they were there as a pair.

So upon further reflection, I'm guessing my objections were only really about 
changing the status quo, as well as a lot of my own testing involving re-
running the image creation step without really changing anything other than 
the code that contributes to do_rootfs; it could be argued that my use case 
would be equally served by me setting nostamp locally or using -f, and 
everyone else having the benefit of not rebuilding the image when not needed.

Given that this is a departure from previously established behaviour, I do 
think we need to give a more of an explanation in the commit message than the 
proposed patch however; something that summarises Richard's explanation above 
would be informative.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


