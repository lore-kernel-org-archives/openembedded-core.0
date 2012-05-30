Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SZj56-0005dH-Az for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 15:36:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4UDQbvx022333;
	Wed, 30 May 2012 14:26:37 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21779-05; Wed, 30 May 2012 14:26:33 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4UDQRKC022327
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 30 May 2012 14:26:29 +0100
Message-ID: <1338384388.20169.146.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 30 May 2012 14:26:28 +0100
In-Reply-To: <20120530131833.GP3138@jama.jama.net>
References: <20120530110550.04FA710217@opal>
	<20120530120443.GL3138@jama.jama.net>
	<20120530122007.GM3138@jama.jama.net>
	<20120530125307.GO3138@jama.jama.net> <1338383413.20169.141.camel@ted>
	<20120530131833.GP3138@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: debian.bbclass got broken today Was: [oe-commits] Valentin Popa : xz: updated to version 5.1.1alpha
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
X-List-Received-Date: Wed, 30 May 2012 13:36:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-05-30 at 15:18 +0200, Martin Jansa wrote:
> On Wed, May 30, 2012 at 02:10:13PM +0100, Richard Purdie wrote:
> > On Wed, 2012-05-30 at 14:53 +0200, Martin Jansa wrote:
> > > On Wed, May 30, 2012 at 02:20:07PM +0200, Martin Jansa wrote:
> > > > On Wed, May 30, 2012 at 02:04:43PM +0200, Martin Jansa wrote:
> > > > > On Wed, May 30, 2012 at 11:05:49AM +0000, git@git.openembedded.org wrote:
> > > > > > Module: openembedded-core.git
> > > > > > Branch: master
> > > > > > Commit: da98266f3a228cf65f279db9810a5326c8bd5422
> > > > > > URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=da98266f3a228cf65f279db9810a5326c8bd5422
> > > > > > 
> > > > > > Author: Valentin Popa <valentin.popa@intel.com>
> > > > > > Date:   Wed May 23 14:08:58 2012 +0300
> > > > > > 
> > > > > > xz: updated to version 5.1.1alpha
> > > > > 
> > > > > this upgrade is causing liblzma package name change
> > > > > -liblzma5_5.0.3-r1_armv4te.ipk
> > > > > +liblzma_5.1.1alpha-r0_armv4t.ipk
> > > > > 
> > > > > so all packages which rdepends on liblzma should get PR bump, e.g.:
> > > > >  *libsystemd-journal0
> > > > >  *libpoppler18
> > > > >  *libsdl-image-1.2-0
> > > > >  *libpoppler-glib8
> > > > >  *systemd
> > > > >  *ethumb
> > > > >  *libtiff5
> > > > >  *epdf
> > > > > 
> > > > > Cheers,
> > > > 
> > > > Looks like whole debian.bbclass got broken by todays merge in oe-core..
> > > 
> > > looking at buildhistory
> > > http://git.shr-project.org/git/?p=buildhistory.git;a=commitdiff;h=320a9a8a80f0d412cea31a534a8022bacf6545e6#patch330
> > > 
> > > it looks like run.package_do_shlibs also doesn't work (all RDEPENDS
> > > detected from shlibs are gone), can someone confirm this behavior on 
> > > his system?
> > 
> > Yes, its from:
> > 
> > http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=5996b2b58e36864edc077326a942795ca12f48da
> > 
> > I'm still trying to figure out the best course of action to fix this...
> 
> Ah, thanks for info..
> 
> so I have reverted all 3 (to be sure) locally and now trying to find and 
> rebuild everything which was built today to get sane feed again.

Its just the commit above that is broken. I've decided to revert it as
pretty much every change made by it is buggy.

The trouble is the readlines() calls return an array, the replacement
returns one big string and hence bad things start to happen.

In the debian.bbclass case, I did prove that changing it to:

						fp = os.path.join(root, f)
						cmd = (d.getVar('BUILD_PREFIX', True) or "") + "objdump -p " + fp
						try:
							lines = []
							lines = bb.process.run(cmd)[0].split("\n")
						# Some ".so" maybe ascii text, e.g: /usr/lib64/libpthread.so,
						# ingore those errors.
						except Exception:
							sys.exc_clear()

works as intended but I didn't want to try and fix up all the different
calls.

Robert: Fix the patch, test the changes more extensively this time
please and then resubmit.

Cheers,

Richard



