Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A846B6013D;
	Mon, 11 May 2015 07:23:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4B7N9fK031262; Mon, 11 May 2015 08:23:09 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vPC5owPmfGQY; Mon, 11 May 2015 08:23:09 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4B7Moio031255
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 11 May 2015 08:23:05 +0100
Message-ID: <1431328970.30971.27.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 11 May 2015 08:22:50 +0100
In-Reply-To: <20150511062222.GD2400@jama>
References: <20150501160602.GA5885@denix.org>
	<CAAQYJAvpGUdZyAzOay+VuDz+tdZF72ny0bgDfkTFomCFbVrMhQ@mail.gmail.com>
	<554A67AB.1000800@dresearch-fe.de> <20150506233137.GH5885@denix.org>
	<20150508192852.GJ5885@denix.org> <20150511062222.GD2400@jama>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] opkg_install_pkg: Package <name> md5sum mismatch. Either the opkg or the package index are corrupt.
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
X-List-Received-Date: Mon, 11 May 2015 07:23:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-05-11 at 08:22 +0200, Martin Jansa wrote:
> On Fri, May 08, 2015 at 03:28:52PM -0400, Denys Dmytriyenko wrote:
> > On Wed, May 06, 2015 at 07:31:37PM -0400, Denys Dmytriyenko wrote:
> > > On Wed, May 06, 2015 at 09:12:43PM +0200, Steffen Sledz wrote:
> > > > Am 02.05.2015 um 23:55 schrieb Andrea Adami:
> > > > > On Fri, May 1, 2015 at 6:06 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > > > >> Has anyone ever seen this message during <image>.do_rootfs task?
> > > > >>
> > > > >> Collected errors:
> > > > >>  * opkg_install_pkg: Package <package> md5sum mismatch. Either the opkg or the package index are corrupt. Try 'opkg update'.
> > > > >>  * opkg_install_cmd: Cannot install package <package>.
> > > > >>
> > > > >> We started seeing it on random packages inside the <image> few weeks ago on
> > > > >> different machines. At the time we had switched to bitbake 1.26. But even
> > > > >> trying different bitbake versions still occasionally caused the same error, so
> > > > >> the culprit is still unknwon. Using oe-core/daisy for now.
> > > > >>
> > > > >> Any comments or suggestions to where start looking would be appreciated!
> > > > > 
> > > > > yes, I have seen this during multimachine builds.
> > > > > My TMPDIR is on tmpfs in ram so everytime I reboot it is re-populated
> > > > > from sstate.
> > > > > ...
> > > > 
> > > > We have the same problem here. Also with packages from the "all" feed in a 
> > > > multimachine build environment. But it does not seem related to 
> > > > packagegroups.
> > > > 
> > > > I've a hypothesis but was not able to validate or falsify it till now: Given 
> > > > a recipe which does only use file:// type SRC_URI. If i change something in 
> > > > these sources and do not update PR the prserv/hashing mechanism detects the 
> > > > changes a builds a new package. But this package has the same version info 
> > > > as the one before. So for opkg there's no need to update it's "package 
> > > > database".
> > > 
> > > After fixing few of our own goofs in packagegroups, I still saw this issue 
> > > with some real packages like weston-init. It went away after it got rebuilt 
> > > due to the dependencies, but I'll keep an eye on it and report if it comes 
> > > back...
> > 
> > Ok, so on the second day it failed again on weston-init and couple of our own 
> > packages. They are all marked as allarch, but it seems they get re-packaged 
> > for some reason for different machines in multi-machine build - the timestamp 
> > of the ipk package changed, while nothing else in the recipe or its data has 
> > changed. There's nothing obvious in weston-init I can see that would trigger 
> > it. And in the logs I see that do_package_write_ipk_setscene being triggered - 
> > I'm trying to figure out why... Any pointers?
> 
> There are many recipes with incorrect PACKAGE_ARCH, see latest report
> from world build:
> http://lists.openembedded.org/pipermail/openembedded-core/2015-January/100734.html
> 
> weston-init is one of recipes where I've sent change to drop allarch
> long time ago:
> http://patchwork.openembedded.org/patch/74133/

One thing we didn't discuss in that thread but which might help would be
whitelisting update-rc.d as a dependency? If that is the cause of many
of the problems, that would help. In this case it does look like the
weston RDEPENDS is the problem and  and the ABISAFE variable is the
better way to fix it though.

Cheers,

Richard



