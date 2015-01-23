Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id 20E6E721E2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 20:52:44 +0000 (UTC)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NIN00BG7DZRQXA0@vms173025.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Fri, 23 Jan 2015 14:52:44 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=b6gFOWC0 c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=jLWw55sr_RoA:10 a=kj9zAlcOel0A:10	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8
	a=-9mUelKeXuEA:10 a=YNv0rlydsVwA:10	a=alK4_DS-AAAA:8 a=Q4-j1AaZAAAA:8
	a=wa_I1rZXh9tm-wQCF8AA:9	a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7C8EE20150; Fri,
	23 Jan 2015 15:52:38 -0500 (EST)
Date: Fri, 23 Jan 2015 15:52:38 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-id: <20150123205238.GB28747@denix.org>
References: <1421975907-11814-1-git-send-email-otavio@ossystems.com.br>
	<20150123035507.GW20639@denix.org>
MIME-version: 1.0
In-reply-to: <20150123035507.GW20639@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] u-boot-fw-utils: Fix the cross build
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
X-List-Received-Date: Fri, 23 Jan 2015 20:52:45 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jan 22, 2015 at 10:55:07PM -0500, Denys Dmytriyenko wrote:
> On Thu, Jan 22, 2015 at 11:18:27PM -0200, Otavio Salvador wrote:
> > This merges the u-boot-fw-utils-cross into the main u-boot-fw-utils
> > recipe and fixes the build failure seen since 2014.07 update.
> 
> So, the actual fix is to drop unnecessary EXTRA_OEMAKE that you had there from 
> the beginning of time... Combining it with target recipe is icing on the cake.

Well, that worked for 2014.07, but breaks now for 2015.01 :(
Looking at it now...


> > The cross package now is handled using an extended class instead of a
> > duplicated recipe.
> > 
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > ---
> >  .../u-boot/u-boot-fw-utils-cross_2014.07.bb        | 38 ----------------------
> >  meta/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bb | 12 +++++++
> >  2 files changed, 12 insertions(+), 38 deletions(-)
> >  delete mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2014.07.bb
> > 
> > diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2014.07.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2014.07.bb
> > deleted file mode 100644
> > index d1f1f9a..0000000
> > --- a/meta/recipes-bsp/u-boot/u-boot-fw-utils-cross_2014.07.bb
> > +++ /dev/null
> > @@ -1,38 +0,0 @@
> > -SUMMARY = "U-Boot bootloader fw_printenv/setenv utilities"
> > -LICENSE = "GPLv2+"
> > -LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
> > -SECTION = "bootloader"
> > -DEPENDS = "mtd-utils"
> > -
> > -# This revision corresponds to the tag "v2014.07"
> > -# We use the revision in order to avoid having to fetch it from the
> > -# repo during parse
> > -SRCREV = "524123a70761110c5cf3ccc5f52f6d4da071b959"
> > -
> > -PV = "v2014.07+git${SRCPV}"
> > -
> > -SRC_URI = "git://git.denx.de/u-boot.git;branch=master;protocol=git"
> > -
> > -S = "${WORKDIR}/git"
> > -
> > -inherit uboot-config cross
> > -
> > -EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} ${TOOLCHAIN_OPTIONS}"'
> > -
> > -do_compile () {
> > -	oe_runmake ${UBOOT_MACHINE}
> > -	oe_runmake env
> > -}
> > -
> > -do_install () {
> > -	install -d ${D}${bindir_cross}
> > -	install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_printenv
> > -	install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_setenv
> > -}
> > -
> > -SYSROOT_PREPROCESS_FUNCS = "uboot_fw_utils_cross"
> > -uboot_fw_utils_cross() {
> > -	sysroot_stage_dir ${D}${bindir_cross} ${SYSROOT_DESTDIR}${bindir_cross}
> > -}
> > -
> > -PACKAGE_ARCH = "${MACHINE_ARCH}"
> > diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bb
> > index a626c95..9a304c8 100644
> > --- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bb
> > +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2014.07.bb
> > @@ -32,4 +32,16 @@ do_install () {
> >  	install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env.config
> >  }
> >  
> > +do_install_class-cross () {
> > +    install -d ${D}${bindir_cross}
> > +    install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_printenv
> > +    install -m 755 ${S}/tools/env/fw_printenv ${D}${bindir_cross}/fw_setenv
> > +}
> > +
> > +SYSROOT_PREPROCESS_FUNCS_class-cross = "uboot_fw_utils_cross"
> > +uboot_fw_utils_cross() {
> > +    sysroot_stage_dir ${D}${bindir_cross} ${SYSROOT_DESTDIR}${bindir_cross}
> > +}
> > +
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> > +BBCLASSEXTEND = "cross"
> > -- 
> > 2.1.4
> > 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

