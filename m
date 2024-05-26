Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 858E9C25B75
	for <webhook@archiver.kernel.org>; Sun, 26 May 2024 20:14:08 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.13684.1716754444989556364
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 May 2024 13:14:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=BFx71YAn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B01F4C0002;
	Sun, 26 May 2024 20:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716754443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=be/iaBNytaLTlIHbMV//Ci574vAyLgPNo1Pob/WTFr0=;
	b=BFx71YAn40i6rISscg58Sf5AG98bHDOSLP3zn8FPfE+ng74di1ipFGwTB4iwaS5dNZEryM
	nmMlFyjnS3efNJK5bkjJmEkhoxT0ZWmP9F0M2Hy64BcBPZjxvo5yfNGNDo4USBf2D7CH4g
	ts+7LN/Lvdh9b/D9RV2/c2FDxXYCHqmX6nWy2FuKXLm4bt/69Crk1IwqrZYQXAJaElkQXj
	qBxUWGLdD8KVtWYUHbW8dj6I4DNn2FslHraNneUlHblcopMM/iKFNfNKFeWbCJNNHoTpDD
	IX51G7VvlGzbXMFkVgxyVa+gdym+6q+iJ9kHFbjAOT3nao5hVWlwfiPAO//sRQ==
Date: Sun, 26 May 2024 22:14:02 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 1/2] pciutils: rewrite recipe
Message-ID: <20240526201402dcda0cab@mail.local>
References: <20240523120127.1250257-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240523120127.1250257-1-ross.burton@arm.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 May 2024 20:14:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199887

Hello Ross,

You'll have to rebase as 3.12.0 is already in master.

On 23/05/2024 12:01:26+0000, Ross Burton wrote:
> The upstream Makefiles are bespoke so need to be handheld, but this
> recipe has workarounds for code removed a decade ago.
> 
> Add more PACKAGECONFIGs for the other configuration options (zlib, kmod),
> and use hwdb by default (non-systemd builds also have hwdb, as it's part
> of eudev too).
> 
> Instead of using 'make -e', pass the variables that we want the Makefile
> to respect explicitly (CC, CFLAGS, etc).
> 
> Construct an appropriate HOST so that lib/configure does the right thing
> without needing patches.
> 
> This now results in text relocations (apparently from the versioned
> symbols in libpci), so add an INSANE_SKIP for that.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../pciutils/pciutils/configure.patch         | 90 -------------------
>  meta/recipes-bsp/pciutils/pciutils_3.11.1.bb  | 50 +++++------
>  2 files changed, 20 insertions(+), 120 deletions(-)
>  delete mode 100644 meta/recipes-bsp/pciutils/pciutils/configure.patch
> 
> diff --git a/meta/recipes-bsp/pciutils/pciutils/configure.patch b/meta/recipes-bsp/pciutils/pciutils/configure.patch
> deleted file mode 100644
> index 5015cf48844..00000000000
> --- a/meta/recipes-bsp/pciutils/pciutils/configure.patch
> +++ /dev/null
> @@ -1,90 +0,0 @@
> -From 561216c8cbc280aaa9aecf30cb11835a4a0a78ed Mon Sep 17 00:00:00 2001
> -From: Richard Purdie <rpurdie@linux.intel.com>
> -Date: Wed, 31 Dec 2008 17:20:38 +0000
> -Subject: [PATCH] pciutils: Upgarde 2.2.4 -> 3.0.3
> -
> -This patch:
> -* ensures we link correctly
> -* allows us to optionally pass target information to configure rather than using uname
> -* select linux as the platform in most cases we care about
> -
> -This is a merge of various tweaks to allow us to build pciutils including
> -work from:
> -
> -7/30/2010 - Qing He <qing.he@intel.com>
> -1/22/2012 - Shane Wang <shane.wang@intel.com>
> -Ionut Radu <ionutx.radu@intel.com>
> -2017/6/15 - RP - Cleanups and merging patches
> -
> -Upstream-Status: Inappropriate [embedded specific]
> ----
> - Makefile      |  2 +-
> - lib/configure | 14 ++++++++++----
> - 2 files changed, 11 insertions(+), 5 deletions(-)
> -
> -diff --git a/Makefile b/Makefile
> -index aaec04e..9c1dab0 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -123,7 +123,7 @@ pcilmr$(EXEEXT): pcilmr.o $(LMROBJS) $(COMMON) lib/$(PCIIMPLIB)
> - pcilmr.o: pcilmr.c $(LMRINC)
> - 
> - %$(EXEEXT): %.o
> --	$(CC) $(LDFLAGS) $(TARGET_ARCH) $^ $(LDLIBS) -o $@
> -+	$(CC) $(LDFLAGS) $(TARGET_ARCH) $^ $(LIB_LDLIBS) $(LDLIBS) -o $@
> - 
> - ifdef PCI_OS_WINDOWS
> - comma := ,
> -diff --git a/lib/configure b/lib/configure
> -index 3df057a..c87e71c 100755
> ---- a/lib/configure
> -+++ b/lib/configure
> -@@ -9,6 +9,10 @@ echo_n() {
> - 	printf '%s' "$*"
> - }
> - 
> -+VERSION=$1
> -+IDSDIR=$2
> -+DNS=yes
> -+
> - if [ -z "$VERSION" ] ; then
> - 	echo >&2 "Please run the configure script from the top-level Makefile"
> - 	exit 1
> -@@ -16,8 +20,8 @@ fi
> - 
> - echo_n "Configuring libpci for your system..."
> - if [ -z "$HOST" ] ; then
> --	sys=`uname -s`
> --	rel=`uname -r`
> -+	sys=${3:-`uname -s`}
> -+	rel=
> - 	realsys="$sys"
> - 	if [ "$sys" = "AIX" -a -x /usr/bin/oslevel -a -x /usr/sbin/lsattr ]
> - 	then
> -@@ -25,7 +29,7 @@ if [ -z "$HOST" ] ; then
> - 		proc=`/usr/sbin/lsdev -C -c processor -S available -F name | head -1`
> - 		cpu=`/usr/sbin/lsattr -F value -l $proc -a type | sed 's/_.*//'`
> - 	else
> --		cpu=`uname -m | sed 's/^i.86-AT386/i386/;s/^i.86$/i386/;s/^sun4u$/sparc64/;s/^i86pc$/i386/;s/^BePC$/i386/;s/^BeMac$/powerpc/;s/^BeBox$/powerpc/'`
> -+		cpu=${4:-`uname -m | sed 's/^i.86-AT386/i386/;s/^i.86$/i386/;s/^sun4u$/sparc64/;s/^i86pc$/i386/;s/^BePC$/i386/;s/^BeMac$/powerpc/;s/^BeBox$/powerpc/'`}
> - 	fi
> - 	if [ "$sys" = "DragonFly" ]
> - 	then
> -@@ -43,7 +47,7 @@ if [ -z "$HOST" ] ; then
> - 	then
> - 		sys=cygwin
> - 	fi
> --	HOST=${3:-$cpu-$sys}
> -+	HOST=$cpu-$sys
> - fi
> - [ -n "$RELEASE" ] && rel="${RELEASE}"
> - # CAVEAT: tr on Solaris is a bit weird and the extra [] is otherwise harmless.
> -@@ -52,6 +56,8 @@ cpu=`echo $host | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\1/'`
> - sys=`echo $host | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\3/'`
> - echo " $host $rel $cpu $sys"
> - 
> -+{ echo "$host" | grep linux; } && sys=linux
> -+
> - c=config.h
> - m=config.mk
> - echo >$c '#define PCI_CONFIG_H'
> diff --git a/meta/recipes-bsp/pciutils/pciutils_3.11.1.bb b/meta/recipes-bsp/pciutils/pciutils_3.11.1.bb
> index 044074ccc3a..d5a2601dbcd 100644
> --- a/meta/recipes-bsp/pciutils/pciutils_3.11.1.bb
> +++ b/meta/recipes-bsp/pciutils/pciutils_3.11.1.bb
> @@ -9,41 +9,27 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>  # Can drop make-native when all systems have make 4.3
>  # https://git.savannah.gnu.org/cgit/make.git/commit/?id=b90fabc8d6f34fb37d428dc0fb1b8b1951a9fbed
>  # causes space issues in lib/libpci.pc
> -DEPENDS = "zlib kmod make-native"
> -
> -SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.xz \
> -           file://configure.patch"
> +DEPENDS = "make-native"
>  
> +SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.xz"
>  SRC_URI[sha256sum] = "3f472ad864473de5ba17f765cc96ef5f33e1b730918d3adda6f945a2a9290df4"
>  
>  inherit multilib_header pkgconfig update-alternatives
>  
> -PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'hwdb', '', d)}"
> +PACKAGECONFIG ??= "hwdb kmod zlib"
>  PACKAGECONFIG[hwdb] = "HWDB=yes,HWDB=no,udev"
> -
> -PCI_CONF_FLAG = "ZLIB=yes DNS=yes SHARED=yes STRIP= LIBDIR=${libdir}"
> -
> -# see configure.patch
> -do_configure () {
> -	(
> -	  cd lib && \
> -	  # PACKAGECONFIG_CONFARGS for this recipe could only possibly contain 'HWDB=yes/no',
> -	  # so we put it before ./configure
> -	  ${PCI_CONF_FLAG} ${PACKAGECONFIG_CONFARGS} ./configure ${PV} ${datadir} ${TARGET_OS} ${TARGET_ARCH}
> -	)
> -}
> -
> -export PREFIX = "${prefix}"
> -export SBINDIR = "${sbindir}"
> -export SHAREDIR = "${datadir}"
> -export MANDIR = "${mandir}"
> -
> -EXTRA_OEMAKE = "-e MAKEFLAGS= ${PCI_CONF_FLAG}"
> -
> -ASNEEDED = ""
> -
> -# The configure script breaks if the HOST variable is set
> -HOST[unexport] = "1"
> +PACKAGECONFIG[kmod] = "LIBKMOD=yes,LIBKMOD=no,kmod"
> +PACKAGECONFIG[zlib] = "ZLIB=yes,ZLIB=no,zlib"
> +
> +# Configuration options
> +EXTRA_OEMAKE += "${PACKAGECONFIG_CONFARGS} DNS=yes SHARED=yes"
> +# Construct a HOST that matches what lib/configure expects
> +EXTRA_OEMAKE += "HOST="${HOST_ARCH}-${HOST_OS}""
> +# Toolchain. We need to pass CFLAGS via LDFLAGS as this is the only variable
> +# # available to the caller without clobbering assignments (notably, -fPIC)
> +EXTRA_OEMAKE += "CC="${CC}" AR="${AR}" STRIP= LDFLAGS="${CFLAGS} ${LDFLAGS}""
> +# Paths
> +EXTRA_OEMAKE += "PREFIX=${prefix} LIBDIR=${libdir} SBINDIR=${sbindir} SHAREDIR=${datadir} MANDIR=${mandir}"
>  
>  do_install () {
>  	oe_runmake DESTDIR=${D} install install-lib
> @@ -54,11 +40,15 @@ do_install () {
>  }
>  
>  PACKAGES =+ "${PN}-ids libpci"
> +
>  FILES:${PN}-ids = "${datadir}/pci.ids*"
> -FILES:libpci = "${libdir}/libpci.so.*"
>  SUMMARY:${PN}-ids = "PCI utilities - device ID database"
>  DESCRIPTION:${PN}-ids = "Package providing the PCI device ID database for pciutils."
>  RDEPENDS:${PN} += "${PN}-ids"
>  
> +FILES:libpci = "${libdir}/libpci.so.*"
> +# The versioned symbols in libpci appear to be causing relocations
> +INSANE_SKIP:libpci += "textrel"
> +
>  ALTERNATIVE:${PN} = "lspci"
>  ALTERNATIVE_PRIORITY = "100"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199787): https://lists.openembedded.org/g/openembedded-core/message/199787
> Mute This Topic: https://lists.openembedded.org/mt/106260811/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

