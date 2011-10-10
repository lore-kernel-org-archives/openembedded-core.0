Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RDGlg-0000ZB-7R for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 16:23:48 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9AEOcR0027669 for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 15:24:38 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ywdhHrp0ERUC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 15:24:38 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9AEOY5K027644
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 15:24:37 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 10 Oct 2011 15:17:51 +0100
In-Reply-To: <20111010114506.GC5065@jama.jama.net>
References: <1317910796.6398.86.camel@ted>
	<37FC7DDC-D175-45B4-AF8A-F4D5AF384750@dominion.thruhere.net>
	<20111009181016.GB3847@jama.jama.net>
	<9CD7A2A3-228F-46AE-AE56-5D73C9372E4A@dominion.thruhere.net>
	<20111010114506.GC5065@jama.jama.net>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318256283.23801.38.camel@ted>
Mime-Version: 1.0
Subject: Re: sstate.bbclass: Ensure machine specific stamps are only wiped for the current task
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
X-List-Received-Date: Mon, 10 Oct 2011 14:23:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-10-10 at 13:45 +0200, Martin Jansa wrote:
> On Sun, Oct 09, 2011 at 08:11:45PM +0200, Koen Kooi wrote:
> > 
> > Op 9 okt. 2011, om 20:10 heeft Martin Jansa het volgende geschreven:
> > 
> > > On Sun, Oct 09, 2011 at 01:25:09PM +0200, Koen Kooi wrote:
> > >> 
> > >> Op 6 okt. 2011, om 16:19 heeft Richard Purdie het volgende geschreven:
> > >> 
> > >>> sstate was being a little too ethusiastic about removing stamp files and
> > >>> was removing stamp files for other machines when it shouldn't have been.
> > >>> 
> > >>> This patch teaches sstate about machine specific stamp extensions and
> > >>> allows it to only remove the current task's stampfiles.
> > >> 
> > >> Not sure if it's related to this problem or not but sstate is still not working as intented for me when switching machines, it keeps rebuilding the toolchain when switching machine. What I did this morning:
> > >> 
> > >> 1) wipe out tmp, sstate-cache, pseudodone
> > >> 2) MACHINE=beagleboard bitbake u-boot
> > >> 3) cp conf/machine/beagleboard.conf conf/machine/brokensstate.conf
> > >> 4) MACHINE=brokensstate bitbake u-boot
> > > 
> > > Same here.. :/ (building 3 armv7 machines.. always "from scratch").
> > 
> > To eliminate varables: Angstrom/shr/aurora/micro/other/all of the above?
> 
> DISTRO=shr
> 
> MACHINE=nokia900 bitbake shr-image -> builds from scratch, finished ok
> MACHINE=palmpre bitbake shr-image -> builds from scratch, finished ok
> MACHINE=palmpre2 bitbake shr-image -> builds from scratch, finished ok
> 
> without wiping anything (same tmp, same sstate-cache, same pseudodone)
> 
> MACHINE=palmpre bitbake shr-image -> builds from scratch, again!, finished ok
> MACHINE=palmpre2 bitbake shr-image -> builds from scratch, again!, finished ok
> MACHINE=nokia900 bitbake shr-image -> builds from scratch, again!, finished ok
> 
> palmpre and palmpre2 are "the same"
> $ cat meta-smartphone/meta-palm/conf/machine/palmpre.conf | grep -v ^#
> require conf/machine/include/palmpre.inc
> 
> $ cat meta-smartphone/meta-palm/conf/machine/palmpre2.conf | grep -v ^#
> require conf/machine/include/palmpre.inc
> 
> nokia900 is also armv7a-vfp-neon (that's why all packages except
> MACHINE_ARCH were always reused without rebuilding in OE-classic).
> 
> I have tried to debug sigdata files to see why and also tried to add
> MACHINEOVERRIDES[vardepsexclude] = "MACHINE"
> as RP suggested, but sofar haven't found solution at least to reuse
> already built sstate packages for armv7a-vfp-neon.

I've posted a patch which at least locally solves the issue with the "cp
MACHINEA MACHINEB". If there are more issues I'd be interested, see my
separate email with some debugging tips.

Cheers,

Richard




