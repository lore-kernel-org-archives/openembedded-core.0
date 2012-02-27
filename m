Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S207I-0000J9-1d for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 13:55:49 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1RClLvw027333
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 12:47:21 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26721-08 for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 12:47:17 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1RClBKE027326
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2012 12:47:12 GMT
Message-ID: <1330346833.4593.22.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 27 Feb 2012 12:47:13 +0000
In-Reply-To: <20120227123641.GH3859@jama.jama.net>
References: <20120222221309.69BFD10336@opal>
	<20120227103306.GG3859@jama.jama.net>
	<06A495EB-6F73-4325-A055-EEEBC01D93A4@dominion.thruhere.net>
	<1330344828.4593.14.camel@ted> <20120227123641.GH3859@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [oe-commits] Joshua Lock : netbase: remove redundant assignments
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
X-List-Received-Date: Mon, 27 Feb 2012 12:55:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-02-27 at 13:36 +0100, Martin Jansa wrote:
> On Mon, Feb 27, 2012 at 12:13:48PM +0000, Richard Purdie wrote:
> > On Mon, 2012-02-27 at 12:31 +0100, Koen Kooi wrote:
> > > Op 27 feb. 2012, om 11:33 heeft Martin Jansa het volgende geschreven:
> > > 
> > > > On Wed, Feb 22, 2012 at 10:13:09PM +0000, git@git.openembedded.org wrote:
> > > >> Module: openembedded-core.git
> > > >> Branch: master
> > > >> Commit: c3d5800d2850a186f91b5a0db642aa5d1c20156b
> > > >> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=c3d5800d2850a186f91b5a0db642aa5d1c20156b
> > > >> 
> > > >> Author: Joshua Lock <josh@linux.intel.com>
> > > >> Date:   Tue Feb 21 17:46:44 2012 -0800
> > > >> 
> > > >> netbase: remove redundant assignments
> > > >> 
> > > >> There's no need to explicitly set PACKAGE_ARCH = MACHINE_ARCH, base.bbclass
> > > >> takes care of setting this value for us based on the interfaces for those
> > > >> machines being an OVERRIDE.
> > > > 
> > > > do_install () {
> > > > ...
> > > >        # Disable network manager on machines that commonly do NFS booting
> > > >        case "${MACHINE}" in
> > > >                "qemuarm" | "qemux86" | "qemux86-64" | "qemumips" | "qemuppc" )
> > > > 
> > > > This causes do_install hash to depend on MACHINE variable for all MACHINEs, 
> > > > so making whole recipe MACHINE_ARCH would be more effective then rebuilding 
> > > > TARGET_ARCH package after every MACHINE switch.
> > > 
> > > That whole bit needs to go into the specific nfs image recipe, not
> > > into the recipe. Unless we decide nfs is the one and only way to boot
> > > qemu machines.
> > 
> > Clearly the qemu machines boot on non-nfs setups just fine and the
> > comment is just a bit stale here.
> > 
> > For qemu we expect the IP address to be stable and consistent so we know
> > where to find it and we don't expect it to disappear. The problem was
> > that if network manager starts poking around the main ethernet
> > interface, anything can go wrong (e.g. random QA test failures if
> > networkmanager decided to change the interface at the wrong moment). We
> > therefore really do know better than network manager when it comes to
> > ethernet connectivity into our qemu images.
> > 
> > There are a few options here:
> > 
> > a) Whitelist the MACHINE variable in hashes apart from the qemu machines
> > 
> > b) Change the code to a do_install_append_qemu* which would mean the
> > hashes become stable.
> 
> I'm fine with this but maybe then return PACKAGE_ARCH setting for them
> as we would be assuming that every machine with such append also have
> own interfaces file in SRC_URI (this is now true better to see it
> explicitly set above do_install_append_qemu* statement IMHO).

Agreed.

> > c) Shove the information into a qemu specific package. 
> > 
> > The trouble with c) before everyone decides its the best is how/when do
> > you include that package. It really needs to be present whenever network
> > manager is present. I don't want to end up with someone installing it
> > from feeds and getting different behaviour as it would be a nightmare to
> > debug.
> 
> Bit of off-topic, but do we really need
> EXTRA_IMAGEDEPENDS += "qemu-native qemu-helper-native"
> in meta/conf/machine/include/qemu.inc?
> 
> My guess is that in many cases host running builds isn't the same box
> where someone is using native qemu to test those images. (e.g. in my
> case I'm running builds in minimal chroot, while using distribution qemu
> to test resulting images).

We have a lot of manuals and user expectation that:

bitbake some-image
runqemu some-image

'just works'. That dependency is the only way we can ensure it :/

Cheers,

Richard



