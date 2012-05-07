Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SRKeC-0003hq-Ty for openembedded-core@lists.openembedded.org;
	Mon, 07 May 2012 11:54:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q479ic25002265;
	Mon, 7 May 2012 10:44:38 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01674-04; Mon,  7 May 2012 10:44:34 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q479iSmS002259
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 7 May 2012 10:44:29 +0100
Message-ID: <1336383872.23777.69.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 07 May 2012 10:44:32 +0100
In-Reply-To: <7CF44BA9-7303-42A9-90AD-B9FAE7ADE00B@dominion.thruhere.net>
References: <1336118046-20901-1-git-send-email-koen@dominion.thruhere.net>
	<1336295833.23777.60.camel@ted>
	<7CF44BA9-7303-42A9-90AD-B9FAE7ADE00B@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: enable TI shared transport plugin when wifi or bluetooth are requested
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
X-List-Received-Date: Mon, 07 May 2012 09:54:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-05-06 at 14:32 +0200, Koen Kooi wrote:
> Op 6 mei 2012, om 11:17 heeft Richard Purdie het volgende geschreven:
> 
> > On Fri, 2012-05-04 at 09:54 +0200, Koen Kooi wrote:
> >> This plugin manages the firmware loading for the TI wl12xx series of bluetooth/wifi/fm chips.
> >> 
> >> The double --enable-tist when both bluetooth and wireless are enabled is ugly, but harmless
> >> 
> >> The background on the plugin: https://bugs.meego.com/show_bug.cgi?id=8418
> >> 
> >> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >> ---
> >> 
> >> If accepted into master I'd like to have this in the 'denzil' branch as well.
> >> 
> >> meta/recipes-connectivity/connman/connman.inc     |    4 ++--
> >> meta/recipes-connectivity/connman/connman_0.79.bb |    2 +-
> >> 2 files changed, 3 insertions(+), 3 deletions(-)
> >> 
> >> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
> >> index bfe6620..8b27cfb 100644
> >> --- a/meta/recipes-connectivity/connman/connman.inc
> >> +++ b/meta/recipes-connectivity/connman/connman.inc
> >> @@ -28,8 +28,8 @@ EXTRA_OECONF += "\
> >>     --enable-threads \
> >>     --enable-loopback \
> >>     --enable-ethernet \
> >> -    ${@base_contains('DISTRO_FEATURES', 'wifi','--enable-wifi', '--disable-wifi', d)} \
> >> -    ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth', '--disable-bluetooth', d)} \
> >> +    ${@base_contains('DISTRO_FEATURES', 'wifi','--enable-wifi --enable-tist', '--disable-wifi', d)} \
> >> +    ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth --enable-tist', '--disable-bluetooth', d)} \
> >>     --enable-dnsproxy \
> >>     --enable-ofono \
> >>     --enable-tools \
> >> diff --git a/meta/recipes-connectivity/connman/connman_0.79.bb b/meta/recipes-connectivity/connman/connman_0.79.bb
> >> index 4c57dab..d7f22b9 100644
> >> --- a/meta/recipes-connectivity/connman/connman_0.79.bb
> >> +++ b/meta/recipes-connectivity/connman/connman_0.79.bb
> >> @@ -11,4 +11,4 @@ SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
> >>             file://test-set-ipv6-method-api-fix.patch \
> >>             file://connman"
> >> S = "${WORKDIR}/git"
> >> -PR = "r3"
> >> +PR = "r4"
> > 
> > This appears to have broken the build on qemuppc:
> > 
> > http://autobuilder.yoctoproject.org:8010/builders/nightly-ppc/builds/369/steps/shell_19/logs/stdio
> 
> That is really weird, since that's defined in ioctl.h in asm-generic/
> by the kernel. Does qemuppc have some options for serial ports
> disabled in the kernel headers? Since the wl12xx is a regular wifi
> chip it should work on ppc, like it does on arm and x86.

Its defined in ioctls.h which is a key difference.

ioctls.h is a set of default ioctl options which most architectures use
but architectures have their own custom definitions. PowerPC is one such
architecture, using "t" instead of "T" for tty operations.

It seems the powerpc version never needed a version2 so in theory

#ifndef TCGETS2
#define TCGETS2 TCGETS
#define termios2 termios
#endif

would work but google suggests some potential issues which I don't
really want to dig into/understand.

I'm tempted to disable this plugin on powerpc unless anyone wants to
step up with a patch? Using the libc API for this would probably be more
portable.

Cheers,

Richard









