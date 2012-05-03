Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SPrqI-0004oS-4o for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 10:56:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q438l8eC030482
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 May 2012 09:47:08 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30237-02 for <openembedded-core@lists.openembedded.org>;
	Thu,  3 May 2012 09:47:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q438kx8s030454
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 May 2012 09:47:01 +0100
Message-ID: <1336034822.30113.47.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 03 May 2012 09:47:02 +0100
In-Reply-To: <9295EE6F-5FFA-4FB4-B266-D8F45AAB2351@dominion.thruhere.net>
References: <1335968616-2436-1-git-send-email-jason.wessel@windriver.com>
	<CAMKF1soELbeTS=ZnH3bhUbJkcaUz_sdkhRcykntqc=2jNBcUrg@mail.gmail.com>
	<9295EE6F-5FFA-4FB4-B266-D8F45AAB2351@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] qemu-native: depend on unfs-server-native
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
X-List-Received-Date: Thu, 03 May 2012 08:56:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-05-03 at 09:43 +0200, Koen Kooi wrote:
> Op 3 mei 2012, om 09:32 heeft Khem Raj het volgende geschreven:
> 
> > On Wed, May 2, 2012 at 7:23 AM, Jason Wessel <jason.wessel@windriver.com> wrote:
> >> The user mode NFS server does not get built by default when you are
> >> using a purely command line driven development environment without SDK
> >> tools.  In order to accommodate simple test configurations and have
> >> all the tools built for the minimal validation with qemu-native,
> >> simply add the dependency to unfs-server-native.
> >> 
> >> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> >> ---
> >>  meta/conf/machine/include/qemu.inc |    2 +-
> >>  1 files changed, 1 insertions(+), 1 deletions(-)
> >> 
> >> diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
> >> index 421a149..742b629 100644
> >> --- a/meta/conf/machine/include/qemu.inc
> >> +++ b/meta/conf/machine/include/qemu.inc
> >> @@ -14,4 +14,4 @@ RDEPENDS_kernel-base = ""
> >>  # Use a common kernel recipe for all QEMU machines
> >>  PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
> >> 
> >> -EXTRA_IMAGEDEPENDS += "qemu-native qemu-helper-native"
> >> +EXTRA_IMAGEDEPENDS += "qemu-native qemu-helper-native unfs-server-native"
> >> --
> > 
> > how about replacing  EXTRA_IMAGEDEPENDS with
> > MACHINE_ESSENTIAL_EXTRA_RDEPENDS here ?
>
> RDEPENDS end up in the image, IMAGEDEPENDS are needed to build the
> image. Do I need qemu-native, helper-native and unfs to build the
> image? No I don't. Would I need it if I decide to run the runqemu
> scripts, yes. Do these extra dependencies cause pain? Yes, since it
> requires installing tons of extra things on a headless buildserver
> (mesa, sdl) to just build an image.
>
> If I wanted to be an ass I would suggest moving qemu-native,
> qemu-helper-native and unfs-server-native to the HOB, but I won't do
> that.
>
> So I'll stick with my original suggestion: move those dependencies to
> the images you want to run on nfs for qemu, don't pollute the global
> EXTRA_IMAGEDEPENDS with it.

If I wanted to be an ass here I'd just add them to the image class
conditional on qemu. This would be a little pointless and needlessly
complicate things though.

The point of these is to trigger them to build whenever a qemu image is
built. This makes a lot of sense in some use cases, it also does not
make sense in some other cases and it is not possible for the system to
mind read and tell the difference.

I'd suggest we change this to something like:

QEMUIMAGEDEPENDS ??= "qemu-native qemu-helper-native unfs-server-native"
EXTRA_IMAGEDEPENDS += "${QEMUIMAGEDEPENDS}"

and then people can set QEMUIMAGEDEPENDS = "" if they want.

Cheers,

Richard






