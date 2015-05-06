Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id BA4B273755;
	Wed,  6 May 2015 23:31:37 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NNY00IUXC0P2KB0@vms173021.mailsrvcs.net>; Wed,
	06 May 2015 18:31:38 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=XqdN4uAV c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=jLWw55sr_RoA:10 a=kj9zAlcOel0A:10	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8
	a=-9mUelKeXuEA:10 a=h1PgugrvaO0A:10	a=9vyuS5XHqrACNZIUJTwA:9
	a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id BA383200EF; Wed,
	6 May 2015 19:31:37 -0400 (EDT)
Date: Wed, 06 May 2015 19:31:37 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Steffen Sledz <sledz@dresearch-fe.de>
Message-id: <20150506233137.GH5885@denix.org>
References: <20150501160602.GA5885@denix.org>
	<CAAQYJAvpGUdZyAzOay+VuDz+tdZF72ny0bgDfkTFomCFbVrMhQ@mail.gmail.com>
	<554A67AB.1000800@dresearch-fe.de>
MIME-version: 1.0
In-reply-to: <554A67AB.1000800@dresearch-fe.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 06 May 2015 23:31:39 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, May 06, 2015 at 09:12:43PM +0200, Steffen Sledz wrote:
> Am 02.05.2015 um 23:55 schrieb Andrea Adami:
> > On Fri, May 1, 2015 at 6:06 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> >> Has anyone ever seen this message during <image>.do_rootfs task?
> >>
> >> Collected errors:
> >>  * opkg_install_pkg: Package <package> md5sum mismatch. Either the opkg or the package index are corrupt. Try 'opkg update'.
> >>  * opkg_install_cmd: Cannot install package <package>.
> >>
> >> We started seeing it on random packages inside the <image> few weeks ago on
> >> different machines. At the time we had switched to bitbake 1.26. But even
> >> trying different bitbake versions still occasionally caused the same error, so
> >> the culprit is still unknwon. Using oe-core/daisy for now.
> >>
> >> Any comments or suggestions to where start looking would be appreciated!
> > 
> > yes, I have seen this during multimachine builds.
> > My TMPDIR is on tmpfs in ram so everytime I reboot it is re-populated
> > from sstate.
> > ...
> 
> We have the same problem here. Also with packages from the "all" feed in a 
> multimachine build environment. But it does not seem related to 
> packagegroups.
> 
> I've a hypothesis but was not able to validate or falsify it till now: Given 
> a recipe which does only use file:// type SRC_URI. If i change something in 
> these sources and do not update PR the prserv/hashing mechanism detects the 
> changes a builds a new package. But this package has the same version info 
> as the one before. So for opkg there's no need to update it's "package 
> database".

After fixing few of our own goofs in packagegroups, I still saw this issue 
with some real packages like weston-init. It went away after it got rebuilt 
due to the dependencies, but I'll keep an eye on it and report if it comes 
back...

-- 
Denys

