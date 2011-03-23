Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q2QPw-0007Ia-Qv for openembedded-core@lists.openembedded.org;
	Wed, 23 Mar 2011 16:56:17 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2NFfUq2000334;
	Wed, 23 Mar 2011 15:41:30 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31466-09; Wed, 23 Mar 2011 15:41:26 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p2NFfM1O000326
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 23 Mar 2011 15:41:22 GMT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <AANLkTimhEBgbMP8OrgVavchhHgjKrtpS2CKzFzC8wuUW@mail.gmail.com>
References: <20110322181037.GA26336@sakrah.homelinux.org>
	<8E4968F0-D069-4BB2-89C3-FD93167597E9@dominion.thruhere.net>
	<20110322184459.GE26336@sakrah.homelinux.org>
	<32F16A96-947C-4EDD-A36A-2584660440DA@dominion.thruhere.net>
	<20110322221814.GA13076@sakrah.homelinux.org>
	<B073FF3E-7CE1-4FAF-99B4-3ED5832954CD@dominion.thruhere.net>
	<AANLkTimhEBgbMP8OrgVavchhHgjKrtpS2CKzFzC8wuUW@mail.gmail.com>
Date: Wed, 23 Mar 2011 15:41:20 +0000
Message-ID: <1300894880.3018.8.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: MIPS rootfs creation failure
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
X-List-Received-Date: Wed, 23 Mar 2011 15:56:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-03-23 at 08:17 -0700, Khem Raj wrote:
> On Wed, Mar 23, 2011 at 12:16 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> >
> > Op 22 mrt 2011, om 23:18 heeft Khem Raj het volgende geschreven:
> >
> >> On (22/03/11 19:54), Koen Kooi wrote:
> >>>
> >>> Op 22 mrt 2011, om 19:44 heeft Khem Raj het volgende geschreven:
> >>>
> >>>> On (22/03/11 19:42), Koen Kooi wrote:
> >>>>>
> >>>>> Op 22 mrt 2011, om 19:10 heeft Khem Raj het volgende geschreven:
> >>>>>
> >>>>>> Hi
> >>>>>>
> >>>>>> I did an update of oe-core yesterday and now mips is failing with this
> >>>>>> error. It was not there 2 days back.
> >>>>>>
> >>>>>> | Configuring sysvinit.
> >>>>>> | Collected errors:
> >>>>>> |  * satisfy_dependencies_for: Cannot satisfy the following dependencies
> >>>>>> for task-base:
> >>>>>> |  *    kernel-misc *
> >>>>>> |  * opkg_install_cmd: Cannot install package task-base.
> >>>>>> NOTE: package console-image-1.0-r0: task do_rootfs: Failed
> >>>>>>
> >>>>>> I have not bisected but if anyone else is seeing it I would like to know
> >>>>>
> >>>>> I think thats fallout from the kernel.bbclass change:
> >>>>>
> >>>>> meta/classes/kernel.bbclass:FILES_kernel-misc = "/kernel/include/config /kernel/scripts /kernel/drivers/crypto /kernel
> >>>>>
> >>>>> I don't know what purpose that package has, but try rebuilding the kernel and see what happens. We might need to blacklist it from being included in the kernel-modules meta-package.
> >>>>>
> >>>>
> >>>> I have already build everything from scratch even deleted sstate cache
> >>>
> >>> Can you give this a try?
> >>>
> >>> koen@dominion:/OE/tentacle/sources/openembedded-core/meta/classes$ git diff kernel.bbclass
> >>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> >>> index 3eb6659..9f014d4 100644
> >>> --- a/meta/classes/kernel.bbclass
> >>> +++ b/meta/classes/kernel.bbclass
> >>> @@ -429,7 +429,7 @@ python populate_packages_prepend () {
> >>>        metapkg = "kernel-modules"
> >>>        bb.data.setVar('ALLOW_EMPTY_' + metapkg, "1", d)
> >>>        bb.data.setVar('FILES_' + metapkg, "", d)
> >>> -       blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux', 'perf' ]
> >>> +       blacklist = [ 'kernel-dev', 'kernel-image', 'kernel-base', 'kernel-vmlinux', 'perf', 'kernel-misc' ]
> >>>        for l in module_deps.values():
> >>>                for i in l:
> >>>                        pkg = module_pattern % legitimize_package_name(re.match(module_regex, os.path.basename(i)).gro
> >>>
> >>> I think that should go in regardless, but I'm curious if it fixes your problem. The meta-pkg should only pickup kernel-module-* and kernel-firmware-*, so a whitelist would be even bettter.
> >>>
> >>
> >> It did not fix the problem. I tried bitbake -c cleanall virtual/kernel
> >> bitbake console-image
> >
> > To which class did you appy it? There's a copy of kernel.bbclass in meta-oe with some change we need to merge into oe-core (initramfs handling, better uImage handling, etc).
> 
> thanks I was thinking I applied it to meta-oe but when I revisited I
> applied it to oe-core
> :)

If that fixes it can someone share a proper patch please (for
oe-core) :)

Cheers,

Richard



