Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by mail.openembedded.org (Postfix) with ESMTP id 0EF2965C85
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Nov 2014 07:51:52 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NER00AR0HUG8240@vms173017.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Sun, 09 Nov 2014 01:51:52 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=LdSLMYbn c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=jLWw55sr_RoA:10 a=kj9zAlcOel0A:10	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8
	a=-9mUelKeXuEA:10 a=sozttTNsAAAA:8	a=NEAV23lmAAAA:8 a=alK4_DS-AAAA:8
	a=15B_HMIkjcaa3Y_hSiQA:9	a=CjuIK1q_8ugA:10 a=jxC1yY7ND0kA:10
	a=LklqTVxV3E0A:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id F165C200F4; Sun,
	9 Nov 2014 02:51:51 -0500 (EST)
Date: Sun, 09 Nov 2014 02:51:51 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-id: <20141109075151.GH9512@denix.org>
References: <1415399089-27578-1-git-send-email-denis@denix.org>
	<CAP9ODKoa60CMUEc1+w=4OqPZNQ7b9hFCBNzo8+fB=-kdK=VDZQ@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAP9ODKoa60CMUEc1+w=4OqPZNQ7b9hFCBNzo8+fB=-kdK=VDZQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] u-boot-mkimage: allow building target version of the tool
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
X-List-Received-Date: Sun, 09 Nov 2014 07:51:57 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sat, Nov 08, 2014 at 05:12:36PM -0200, Otavio Salvador wrote:
> On Fri, Nov 7, 2014 at 8:24 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> >
> > u-boot doesn't really support building its tools for the target, as they are
> > built with HOSTCC compiler, which is also used to compile fixdep utility
> > that gets executed during the build. Since it might be beneficial to have a
> > target version of mkimage, let's hack it to build fixdep in a separate step.
> >
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ...
> > +       make HOSTCC="${BUILD_CC}" HOSTLD="${BUILD_LD}" HOSTLDFLAGS="${BUILD_LDFLAGS}" HOSTSTRIP=true dot-config=0 scripts_basic
> ...
> 
> We do it in meta-fsl-arm as below:

That still doesn't work when building tools for the target:
/bin/sh: scripts/basic/fixdep: cannot execute binary file: Exec format error

I guess you are missing the point of this patch, as sandbox_defconfig will 
only eliminate dot-config=0 parameter, but not the need to build fixdep 
separately with a different host compiler...

On the other hand - is it a real requirement to build mkimage for the target?


> ESCRIPTION = "U-boot bootloader mxsboot tool"
> LICENSE = "GPLv2+"
> LIC_FILES_CHKSUM = "file://Licenses/README;md5=c7383a594871c03da76b3707929d2919"
> SECTION = "bootloader"
> DEPENDS = "openssl"
> PROVIDES = "u-boot-mxsboot"
> 
> PV = "v2014.10+git${SRCPV}"
> 
> SRCREV = "75ce95e627609c9b9e537e935e69c4ecef26c8f7"
> SRCBRANCH = "patches-2014.10"
> SRC_URI = "git://github.com/Freescale/u-boot-imx.git;branch=${SRCBRANCH}"
> 
> S = "${WORKDIR}/git"
> 
> inherit fsl-u-boot-localversion
> 
> EXTRA_OEMAKE = 'HOSTCC="${CC} ${CPPFLAGS}" HOSTLDFLAGS="-L${libdir}
> -L${base_libdir}" HOSTSTRIP=true CONFIG_MX28=y'
> 
> do_configure () {
>     oe_runmake sandbox_defconfig
> }
> 
> do_compile () {
>     oe_runmake tools-only
> }
> 
> do_install () {
>     install -d ${D}${bindir}
>     install -m 0755 tools/mxsboot ${D}${bindir}/uboot-mxsboot
>     ln -sf uboot-mxsboot ${D}${bindir}/mxsboot
> }
> 
> BBCLASSEXTEND = "native nativesdk"
> 
> 
> -- 
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> 

