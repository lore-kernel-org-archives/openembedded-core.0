Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.1169.1588030499980524308
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Apr 2020 16:35:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0CB5740ADE;
	Mon, 27 Apr 2020 23:34:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J_3qcnsEnTEL; Mon, 27 Apr 2020 23:34:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B855B409AA;
	Mon, 27 Apr 2020 23:34:56 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 18946172AD6; Mon, 27 Apr 2020 19:34:56 -0400 (EDT)
Date: Mon, 27 Apr 2020 19:34:56 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Steve Sakoman <sakoman@gmail.com>,
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/3] gcc: Configure all gccs with --disable-install-libiberty
Message-ID: <20200427233456.GP11927@denix.org>
References: <20200415231829.4090244-1-raj.khem@gmail.com>
 <CAGDS+n=FfuBzJcrvbb8i=32+9JXd-0C+MskoxLuUDiz0p_RZyg@mail.gmail.com>
 <0f7cef3c-f0f0-30b9-7107-02450738622c@gmail.com>
MIME-Version: 1.0
In-Reply-To: <0f7cef3c-f0f0-30b9-7107-02450738622c@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi, Steve,

Is there a repo/branch available where you collect patches for dunfell-next?

Denys


On Mon, Apr 27, 2020 at 04:27:45PM -0700, Khem Raj wrote:
> Yes Steve, there are good for Dunfell. We should consider them
> 
> On 4/27/20 4:20 PM, Steve Sakoman wrote:
> >Hi Khem,
> >
> >Is this series something I should consider for dunfell LTS?
> >
> >Steve
> >
> >On Wed, Apr 15, 2020 at 1:19 PM Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >>OE uses libiberty from binutils, since its properly compiled as pic
> >>archive and applications and other libraries needing libiberty can
> >>properly link with it.
> >>
> >>With this option applied, explicit delete of libiberty headers and
> >>libraries is not required in install step, since they wont get installed
> >>in first place.
> >>
> >>Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>---
> >>  meta/recipes-devtools/gcc/gcc-configure-common.inc | 1 +
> >>  meta/recipes-devtools/gcc/gcc-cross-canadian.inc   | 6 ------
> >>  meta/recipes-devtools/gcc/gcc-cross.inc            | 4 ----
> >>  meta/recipes-devtools/gcc/gcc-target.inc           | 4 ----
> >>  4 files changed, 1 insertion(+), 14 deletions(-)
> >>
> >>diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> >>index bb4f6923f2..a64c4caf00 100644
> >>--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> >>+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> >>@@ -33,6 +33,7 @@ EXTRA_OECONF = "\
> >>      --enable-libstdcxx-pch \
> >>      --program-prefix=${TARGET_PREFIX} \
> >>      --without-local-prefix \
> >>+    --disable-install-libiberty \
> >>      ${EXTRA_OECONF_BASE} \
> >>      ${EXTRA_OECONF_GCC_FLOAT} \
> >>      ${EXTRA_OECONF_PATHS} \
> >>diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> >>index 4aac345bec..553ef7fe62 100644
> >>--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> >>+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> >>@@ -108,12 +108,6 @@ do_install () {
> >>         # We don't care about the gcc-<version> copies
> >>         rm -f ${D}${bindir}/*gcc-?.?*
> >>
> >>-       # We use libiberty from binutils
> >>-       rm -f ${D}${prefix}/${TARGET_SYS}/lib/libiberty.a
> >>-       # Not sure where the strange paths come from
> >>-       rm -f ${D}${libdir}/../lib/libiberty.a
> >>-       rm -f ${D}${libdir}/libiberty.a
> >>-
> >>         # Cleanup empty directories which are not shipped
> >>         # we use rmdir instead of 'rm -f' to ensure the non empty directories are not deleted
> >>         # ${D}${libdir}/../lib only seems to appear with SDKMACHINE=i686
> >>diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
> >>index c68cdd5dc4..6fa8c274cd 100644
> >>--- a/meta/recipes-devtools/gcc/gcc-cross.inc
> >>+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> >>@@ -117,10 +117,6 @@ do_install () {
> >>         cp ${S}/libquadmath/quadmath.h ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
> >>         cp ${S}/libquadmath/quadmath_weak.h ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/
> >>
> >>-       # We use libiberty from binutils
> >>-       find ${D}${exec_prefix}/lib -name libiberty.a | xargs rm -f
> >>-       find ${D}${exec_prefix}/lib -name libiberty.h | xargs rm -f
> >>-
> >>         find ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include-fixed -type f -not -name "README" -not -name limits.h -not -name syslimits.h | xargs rm -f
> >>  }
> >>
> >>diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
> >>index 34c1b2263b..8cb432780f 100644
> >>--- a/meta/recipes-devtools/gcc/gcc-target.inc
> >>+++ b/meta/recipes-devtools/gcc/gcc-target.inc
> >>@@ -192,10 +192,6 @@ do_install () {
> >>         # We don't care about the gcc-<version> ones for this
> >>         rm -f *gcc-?.?*
> >>
> >>-       # We use libiberty from binutils
> >>-       find ${D}${libdir} -name libiberty.a | xargs rm -f
> >>-       find ${D}${libdir} -name libiberty.h | xargs rm -f
> >>-
> >>         # Not sure why we end up with these but we don't want them...
> >>         rm -f ${TARGET_PREFIX}${TARGET_PREFIX}*
> >>
> >>--
> >>2.26.1
> >>
> >>

> 

