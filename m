Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id 3615E60034;
	Fri,  8 May 2015 21:09:06 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NO100HUWUR79SL0@vms173025.mailsrvcs.net>; Fri,
	08 May 2015 16:09:08 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=ZJdgQs+z c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=jLWw55sr_RoA:10 a=kj9zAlcOel0A:10	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8
	a=-9mUelKeXuEA:10 a=h1PgugrvaO0A:10	a=PP-Z_RJXZjJhBEOPwJkA:9
	a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 44F4420140; Fri,
	8 May 2015 17:09:07 -0400 (EDT)
Date: Fri, 08 May 2015 17:09:07 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Message-id: <20150508210907.GK5885@denix.org>
References: <20150501160602.GA5885@denix.org>
	<CAAQYJAvpGUdZyAzOay+VuDz+tdZF72ny0bgDfkTFomCFbVrMhQ@mail.gmail.com>
	<554A67AB.1000800@dresearch-fe.de> <20150506233137.GH5885@denix.org>
	<20150508192852.GJ5885@denix.org>
MIME-version: 1.0
In-reply-to: <20150508192852.GJ5885@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: opkg_install_pkg: Package <name> md5sum mismatch. Either the opkg or the package index are corrupt.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 May 2015 21:09:07 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, May 08, 2015 at 03:28:52PM -0400, Denys Dmytriyenko wrote:
> On Wed, May 06, 2015 at 07:31:37PM -0400, Denys Dmytriyenko wrote:
> > On Wed, May 06, 2015 at 09:12:43PM +0200, Steffen Sledz wrote:
> > > Am 02.05.2015 um 23:55 schrieb Andrea Adami:
> > > > On Fri, May 1, 2015 at 6:06 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > > >> Has anyone ever seen this message during <image>.do_rootfs task?
> > > >>
> > > >> Collected errors:
> > > >>  * opkg_install_pkg: Package <package> md5sum mismatch. Either the opkg or the package index are corrupt. Try 'opkg update'.
> > > >>  * opkg_install_cmd: Cannot install package <package>.
> > > >>
> > > >> We started seeing it on random packages inside the <image> few weeks ago on
> > > >> different machines. At the time we had switched to bitbake 1.26. But even
> > > >> trying different bitbake versions still occasionally caused the same error, so
> > > >> the culprit is still unknwon. Using oe-core/daisy for now.
> > > >>
> > > >> Any comments or suggestions to where start looking would be appreciated!
> > > > 
> > > > yes, I have seen this during multimachine builds.
> > > > My TMPDIR is on tmpfs in ram so everytime I reboot it is re-populated
> > > > from sstate.
> > > > ...
> > > 
> > > We have the same problem here. Also with packages from the "all" feed in a 
> > > multimachine build environment. But it does not seem related to 
> > > packagegroups.
> > > 
> > > I've a hypothesis but was not able to validate or falsify it till now: Given 
> > > a recipe which does only use file:// type SRC_URI. If i change something in 
> > > these sources and do not update PR the prserv/hashing mechanism detects the 
> > > changes a builds a new package. But this package has the same version info 
> > > as the one before. So for opkg there's no need to update it's "package 
> > > database".
> > 
> > After fixing few of our own goofs in packagegroups, I still saw this issue 
> > with some real packages like weston-init. It went away after it got rebuilt 
> > due to the dependencies, but I'll keep an eye on it and report if it comes 
> > back...
> 
> Ok, so on the second day it failed again on weston-init and couple of our own 
> packages. They are all marked as allarch, but it seems they get re-packaged 
> for some reason for different machines in multi-machine build - the timestamp 
> of the ipk package changed, while nothing else in the recipe or its data has 
> changed. There's nothing obvious in weston-init I can see that would trigger 
> it. And in the logs I see that do_package_write_ipk_setscene being triggered - 
> I'm trying to figure out why... Any pointers?

So, debugging further...

weston-init RDEPENDS on weston and kbd.

$ bitbake-diffsigs 1.0-r0.do_package_write_ipk.sigdata.eb3921bfc9623056f7ffaef4be8549ab 1.0-r0.do_package_write_ipk.sigdata.90c2978497847912cd64f66039927f7d 
Hash for dependent task waylandweston_1.6.0.bb.do_packagedata changed from 551b3b5ac7b3c41bfced58b88db2d824 to f3eb9cd1861c186382e47f90e82e3295
Hash for dependent task kbdkbd_2.0.1.bb.do_packagedata changed from 53a5dc88b80dc5ab559fbecd14277650 to 950fbc7fe3c33564e781743f2c260670

Then, comparing signatures for weston, for exaple, gives all the changes 
caused by different DEFAULTTUNEs, TUNE_FEATURES and ARMPKGARCH - obviously, 
since one machine is cortexa8, while another is cortexa9.

But why would an allarch package even care about machine tunes in dependant 
packages, when it only RDEPENDS on them?

And how should I fix this? Thanks.

-- 
Denys

