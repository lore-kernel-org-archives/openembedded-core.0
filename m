Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 710F37FD97
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 22:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 688F140BF7;
	Thu, 23 Jan 2020 22:05:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id s0h_5laUCjdQ; Thu, 23 Jan 2020 22:05:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 25C92400E8;
	Thu, 23 Jan 2020 22:05:37 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id DCC151743AB; Thu, 23 Jan 2020 17:05:36 -0500 (EST)
Date: Thu, 23 Jan 2020 17:05:36 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20200123220536.GE4735@denix.org>
References: <1579813185-1950-1-git-send-email-denis@denix.org>
	<CADkTA4OUcmx2wFVf9NAR8D7c_3n+303YFR3gwAWv08KgT_o+ww@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4OUcmx2wFVf9NAR8D7c_3n+303YFR3gwAWv08KgT_o+ww@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Jon Mason <jdmason@gmail.com>, Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] arm-trusted-firmware: add upstream version 2.2
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
X-List-Received-Date: Thu, 23 Jan 2020 22:05:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 23, 2020 at 04:43:23PM -0500, Bruce Ashfield wrote:
> On Thu, Jan 23, 2020 at 4:00 PM Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > Many BSPs require ARM Trusted Firmware (also known as Trusted Firmware-A).
> > To avoid duplicating efforts of adding very similar recipes to BSP layers,
> > add an upstream reference implementation to openembedded-core, which can be
> > customized by BSPs, if needed.
> 
> Isn't this one of the things that Jon Mason is trying to
> standardize/support in meta-arm ?
> 
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/tree/meta-arm/recipes-bsp/trusted-firmware-a

Ah, interesting, somehow I totally missed that one! :)

What triggered this submission is that we have our own variant in meta-ti and 
Joshua Watt was adding a very similar one to meta-rockchip:
https://lists.yoctoproject.org/g/yocto/topic/70054501#48116


> What's the delta between the two ?

Hmm, that one uses older 2.1 version. Other than that, I'll need to test to 
see if it's as adaptable and expandable as our more simplistic variants...

-- 
Denys


> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > Cc: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  .../arm-trusted-firmware_2.2.bb                    | 55 ++++++++++++++++++++++
> >  1 file changed, 55 insertions(+)
> >  create mode 100644 meta/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.bb
> >
> > diff --git a/meta/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.bb b/meta/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.bb
> > new file mode 100644
> > index 0000000..3079a70
> > --- /dev/null
> > +++ b/meta/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_2.2.bb
> > @@ -0,0 +1,55 @@
> > +SUMMARY = "ARM Trusted Firmware"
> > +DESCRIPTION = "ARM Trusted Firmware provides a reference implementation of \
> > +Secure World software for ARMv8-A, including Exception Level 3 (EL3) software. \
> > +It provides implementations of various ARM interface standards such as the \
> > +Power State Coordination Interface (PSCI), Trusted Board Boot Requirements \
> > +(TBBR) and Secure monitor code."
> > +HOMEPAGE = "http://infocenter.arm.com/help/topic/com.arm.doc.dui0928e/CJHIDGJF.html"
> > +
> > +LICENSE = "BSD-3-Clause"
> > +LIC_FILES_CHKSUM = "file://docs/license.rst;md5=189505435dbcdcc8caa63c46fe93fa89"
> > +
> > +inherit deploy
> > +
> > +DEPENDS = "dtc-native openssl-native"
> > +
> > +PACKAGE_ARCH = "${MACHINE_ARCH}"
> > +
> > +S = "${WORKDIR}/git"
> > +B = "${WORKDIR}/build"
> > +
> > +BRANCH = "master"
> > +SRC_URI = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=http;branch=${BRANCH}"
> > +SRCREV = "a04808c16cfc126d9fe572ae7c4b5a3d39de5796"
> > +
> > +ATF_BINARY ??= "bl31"
> > +ATF_SUFFIX ??= "bin"
> > +ATF_TARGET ??= "all"
> > +
> > +CFLAGS[unexport] = "1"
> > +LDFLAGS[unexport] = "1"
> > +AS[unexport] = "1"
> > +LD[unexport] = "1"
> > +
> > +do_configure[noexec] = "1"
> > +
> > +EXTRA_OEMAKE = '-C ${S} BUILD_BASE=${B} DEBUG=0 CROSS_COMPILE="${TARGET_PREFIX}" \
> > +               PLAT="${ATF_PLATFORM}" TARGET_BOARD="${ATF_BOARD}" ${PACKAGECONFIG_CONFARGS}'
> > +
> > +do_compile() {
> > +       oe_runmake ${ATF_TARGET}
> > +}
> > +
> > +do_install() {
> > +       install -d ${D}/boot
> > +       install -m 0644 ${B}/${ATF_PLATFORM}/${ATF_BOARD}/release/${ATF_BINARY}.${ATF_SUFFIX} ${D}/boot/
> > +}
> > +
> > +do_deploy() {
> > +       install -d ${DEPLOYDIR}
> > +       install -m 0644 ${B}/${ATF_PLATFORM}/${ATF_BOARD}/release/${ATF_BINARY}.${ATF_SUFFIX} ${DEPLOYDIR}/
> > +}
> > +addtask deploy before do_build after do_compile
> > +
> > +FILES_${PN} = "/boot"
> > +SYSROOT_DIRS += "/boot"
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 
> 
> -- 
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> 

