Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id DE4B26B0CB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 11:19:53 +0000 (UTC)
Received: by wicmx19 with SMTP id mx19so37558129wic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 04:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=HWBDwCDJnuNOL/QXnzUNj4Ur3G8CozxInc92FQvaLnE=;
	b=V1nnbenEo2qZtEnvw7+KgOEVSXRA8rCEyZPKzxv0XhMr2Han2w74WO+N9pdIl/JcNJ
	aRden0IvGT2Zg7xBzxTXTvVqtWi/vENGN7Rmyqa/JLRmZjqJJseoyQQqS/4iWxb9qSaz
	LasQHcTc765zL1I9XcdPW/i5gQolXJV8iQ3noDaVdq2GD582qiosOI0WHG3epG+g62tw
	lOpkkGhhsc7s3DUvdRki0s4Sj8DV2A0WopgeYx0DsH/hXdB9UO6B6ctsrulm/XpsH+2H
	Y2Q4tkAE5zM+hNJbosr5KXmf/u97Ja/YZnZtFA84yEhQu/EBFCermV4NU7RzijF3nC1o
	nWvw==
X-Received: by 10.180.82.6 with SMTP id e6mr6674104wiy.84.1432293594320;
	Fri, 22 May 2015 04:19:54 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id xy5sm2683358wjc.35.2015.05.22.04.19.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 May 2015 04:19:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 22 May 2015 13:20:16 +0200
To: Kevin Hao <kexin.hao@windriver.com>
Message-ID: <20150522112016.GB2376@jama>
References: <1432281469-21784-1-git-send-email-kexin.hao@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1432281469-21784-1-git-send-email-kexin.hao@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] PCMCIA: remove the support for PCMCIA
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
X-List-Received-Date: Fri, 22 May 2015 11:19:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2015 at 03:57:49PM +0800, Kevin Hao wrote:
> PCMCIA is so uncommon in now days and was also removed by other distro
> such as Debian [1]. So remove it from oe-core. Will move it to
> meta-openembedded/meta-oe.
>=20
> [1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D698105
>=20
> Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
> ---
>  meta/conf/bitbake.conf                             |   1 -
>  meta/conf/distro/include/default-distrovars.inc    |   2 +-
>  meta/conf/local.conf.sample.extended               |   4 +-
>  .../0001-fix-a-parallel-building-issue.patch       |  45 ---------
>  .../pcmciautils/pcmciautils-018/makefile_fix.patch | 101 ---------------=
------
>  meta/recipes-bsp/pcmciautils/pcmciautils.inc       |  32 -------
>  meta/recipes-bsp/pcmciautils/pcmciautils_018.bb    |  13 ---
>  .../packagegroups/packagegroup-base.bb             |  31 +------
>  8 files changed, 7 insertions(+), 222 deletions(-)
>  delete mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils-018/0001-fix=
-a-parallel-building-issue.patch
>  delete mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils-018/makefile=
_fix.patch
>  delete mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils.inc
>  delete mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 8653a7f3a943..8194a475015b 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -741,7 +741,6 @@ COMBINED_FEATURES =3D "\
>      ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "ext2", =
d)} \
>      ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "vfat", =
d)} \
>      ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "irda", =
d)} \
> -    ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "pcmcia"=
, d)} \

Is it worth removing here? this wasn't moved to meta-oe.

>      ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "pci", d=
)} \
>      ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "usbgadg=
et", d)} \
>      ${@base_both_contain("DISTRO_FEATURES", "MACHINE_FEATURES", "usbhost=
", d)} \
> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/=
distro/include/default-distrovars.inc
> index 29b762b22733..2ad27a74c1c4 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -8,7 +8,7 @@ IMAGE_LINGUAS ?=3D "en-us en-gb"
>  ENABLE_BINARY_LOCALE_GENERATION ?=3D "1"
>  LOCALE_UTF8_ONLY ?=3D "0"
> =20
> -DISTRO_FEATURES_DEFAULT ?=3D "alsa argp bluetooth ext2 irda largefile pc=
mcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11"
> +DISTRO_FEATURES_DEFAULT ?=3D "alsa argp bluetooth ext2 irda largefile us=
bgadget usbhost wifi xattr nfs zeroconf pci 3g nfc x11"
>  DISTRO_FEATURES_LIBC_DEFAULT ?=3D "ipv4 ipv6 libc-backtrace libc-big-mac=
ros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt \
>  					libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg libc=
-fstab libc-ftraverse \
>  					libc-getlogin libc-idn libc-inet-anl libc-libm libc-locales libc-lo=
cale-code \
> diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.=
sample.extended
> index ccdd32682723..5e3521a9629f 100644
> --- a/meta/conf/local.conf.sample.extended
> +++ b/meta/conf/local.conf.sample.extended
> @@ -36,10 +36,10 @@
>  #               libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar=
 libc-posix-regexp libc-posix-regexp-glibc \
>  #               libc-posix-wchar-io"
> =20
> -#DISTRO_FEATURES =3D "alsa bluetooth ext2 irda pcmcia usbgadget usbhost =
wifi nfs zeroconf pci ${DISTRO_FEATURES_LIBC}"
> +#DISTRO_FEATURES =3D "alsa bluetooth ext2 irda usbgadget usbhost wifi nf=
s zeroconf pci ${DISTRO_FEATURES_LIBC}"
> =20
>  # If you want to get an image based on directfb without x11, Please copy=
 this variable to build/conf/local.conf
> -#DISTRO_FEATURES =3D "alsa argp bluetooth ext2 irda largefile pcmcia usb=
gadget usbhost wifi xattr nfs zeroconf pci 3g directfb ${DISTRO_FEATURES_LI=
BC}"
> +#DISTRO_FEATURES =3D "alsa argp bluetooth ext2 irda largefile usbgadget =
usbhost wifi xattr nfs zeroconf pci 3g directfb ${DISTRO_FEATURES_LIBC}"
> =20
>  # ENABLE_BINARY_LOCALE_GENERATION controls the generation of binary loca=
le
>  # packages at build time using qemu-native. Disabling it (by setting it =
to 0)
> diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils-018/0001-fix-a-para=
llel-building-issue.patch b/meta/recipes-bsp/pcmciautils/pcmciautils-018/00=
01-fix-a-parallel-building-issue.patch
> deleted file mode 100644
> index 7b010400f792..000000000000
> --- a/meta/recipes-bsp/pcmciautils/pcmciautils-018/0001-fix-a-parallel-bu=
ilding-issue.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -From 5a793a1a9fb3477719aabf7e27ff22ed1acdf559 Mon Sep 17 00:00:00 2001
> -From: Roy Li <rongqing.li@windriver.com>
> -Date: Tue, 19 May 2015 15:54:24 +0800
> -Subject: [PATCH] fix a parallel building issue
> -
> -Fixed:
> -|   src/lex_config.c:34:25: fatal error: yacc_config.h: No such file or =
directory
> -|
> -|    #include "yacc_config.h"
> -|                            ^
> -|   compilation terminated.
> -
> -And:
> -Compiling lex_config.c.
> -  src/lex_config.l:34:25: fatal error: yacc_config.h: No such file or di=
rectory
> -
> -Upstream-Status: Pending
> -
> -there are two Makefile rules to generate lex_config.o, one is to generate
> -lex_config.o other is to generate src/lex_config.o, so we can remove one.
> -and add the needed dependence for lex_config.o
> -
> -
> -Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ----
> - Makefile | 3 +--
> - 1 file changed, 1 insertion(+), 2 deletions(-)
> -
> -diff --git a/Makefile b/Makefile
> -index d45fdc3..4c53bc2 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -246,8 +246,7 @@ $(PCMCIA_SOCKET_STARTUP): $(LIBC) src/startup.o src/=
yacc_config.o src/lex_config
> - 	$(QUIET) $(LD) $(LDFLAGS) -o $@ $(CRT0) src/startup.o src/yacc_config.=
o src/lex_config.o $(LIB_OBJS) $(ARCH_LIB_OBJS)
> - 	$(QUIET) $(STRIPCMD) $@
> -=20
> --yacc_config.o lex_config.o: %.o: %.c
> --	$(CC) -c -MD -O -pipe $(CPPFLAGS) $<
> -+src/lex_config.o:src/yacc_config.h
> -=20
> - debugtools: ccdv $(CBDUMP) $(CISDUMP)
> -=20
> ---=20
> -1.9.1
> -
> diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils-018/makefile_fix.pa=
tch b/meta/recipes-bsp/pcmciautils/pcmciautils-018/makefile_fix.patch
> deleted file mode 100644
> index 7b0ce21194c1..000000000000
> --- a/meta/recipes-bsp/pcmciautils/pcmciautils-018/makefile_fix.patch
> +++ /dev/null
> @@ -1,101 +0,0 @@
> -Upstream-Status: Inappropriate [configuration]
> -
> -Hardcoded paths are bad...
> -This lets us use the install from OE's native sysroot
> -rebase the patch to 018, removing hardcoded path for true
> -as well. Removing of -D in install invocation is a little
> -questionable, is it some GNU extention?
> -
> --Khem Raj <raj.khem@gmail.com>
> -
> -Index: pcmciautils-018/Makefile
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- pcmciautils-018.orig/Makefile
> -+++ pcmciautils-018/Makefile
> -@@ -76,7 +76,7 @@ sbindir =3D	${exec_prefix}/sbin
> - mandir =3D	${prefix}/usr/share/man
> - udevdir =3D	${prefix}/lib/udev
> -=20
> --INSTALL =3D /usr/bin/install -c
> -+INSTALL =3D install -c
> - INSTALL_PROGRAM =3D ${INSTALL}
> - INSTALL_DATA  =3D ${INSTALL} -m 644
> - INSTALL_SCRIPT =3D ${INSTALL_PROGRAM}
> -@@ -180,7 +180,7 @@ endif
> - # if DEBUG is enabled, then we do not strip or optimize
> - ifeq ($(strip $(DEBUG)),true)
> - 	CFLAGS  +=3D -O1 -g -DDEBUG -D_GNU_SOURCE
> --	STRIPCMD =3D /bin/true -Since_we_are_debugging
> -+	STRIPCMD =3D true -Since_we_are_debugging
> - else
> - 	CFLAGS  +=3D $(OPTIMIZATION) -fomit-frame-pointer -D_GNU_SOURCE
> - 	STRIPCMD =3D $(STRIP) -s --remove-section=3D.note --remove-section=3D.=
comment
> -@@ -273,30 +273,32 @@ clean:
> -=20
> - install-hotplug:
> - 	$(INSTALL) -d $(DESTDIR)$(hotplugdir)
> --	$(INSTALL_PROGRAM) -D hotplug/pcmcia.agent $(DESTDIR)$(hotplugdir)/pcm=
cia.agent
> --	$(INSTALL_PROGRAM) -D hotplug/pcmcia.rc $(DESTDIR)$(hotplugdir)/pcmcia=
=2Erc
> -+	$(INSTALL_PROGRAM) hotplug/pcmcia.agent $(DESTDIR)$(hotplugdir)/pcmcia=
=2Eagent
> -+	$(INSTALL_PROGRAM) hotplug/pcmcia.rc $(DESTDIR)$(hotplugdir)/pcmcia.rc
> -=20
> - uninstall-hotplug:
> - 	- rm -f $(DESTDIR)$(hotplugdir)/pcmcia.agent $(DESTDIR)$(hotplugdir)/p=
cmcia.rc
> -=20
> - install-socket-hotplug:
> --	$(INSTALL_PROGRAM) -D hotplug/pcmcia_socket.agent $(DESTDIR)$(hotplugd=
ir)/pcmcia_socket.agent
> --	$(INSTALL_PROGRAM) -D hotplug/pcmcia_socket.rc $(DESTDIR)$(hotplugdir)=
/pcmcia_socket.rc
> -+	$(INSTALL_PROGRAM) hotplug/pcmcia_socket.agent $(DESTDIR)$(hotplugdir)=
/pcmcia_socket.agent
> -+	$(INSTALL_PROGRAM) hotplug/pcmcia_socket.rc $(DESTDIR)$(hotplugdir)/pc=
mcia_socket.rc
> -=20
> - uninstall-socket-hotplug:
> - 	- rm -f $(DESTDIR)$(hotplugdir)/pcmcia_socket.agent $(DESTDIR)$(hotplu=
gdir)/pcmcia_socket.rc
> -=20
> - install-socket-tools:
> --	$(INSTALL_PROGRAM) -D $(PCMCIA_SOCKET_STARTUP) $(DESTDIR)$(udevhelperd=
ir)/$(PCMCIA_SOCKET_STARTUP)
> -+	$(INSTALL) -d $(DESTDIR)$(udevhelperdir)
> -+	$(INSTALL_PROGRAM) $(PCMCIA_SOCKET_STARTUP) $(DESTDIR)$(udevhelperdir)=
/$(PCMCIA_SOCKET_STARTUP)
> -=20
> - uninstall-socket-tools:
> - 	- rm -f $(DESTDIR)$(udevhelperdir)/$(PCMCIA_SOCKET_STARTUP)
> -=20
> - install-tools:
> - 	$(INSTALL) -d $(DESTDIR)$(sbindir)
> --	$(INSTALL_PROGRAM) -D $(PCCARDCTL) $(DESTDIR)$(sbindir)/$(PCCARDCTL)
> -+	$(INSTALL) -d $(DESTDIR)$(udevhelperdir)
> -+	$(INSTALL_PROGRAM) $(PCCARDCTL) $(DESTDIR)$(sbindir)/$(PCCARDCTL)
> - 	$(SYMLINK) $(PCCARDCTL) $(DESTDIR)$(sbindir)/$(LSPCMCIA)
> --	$(INSTALL_PROGRAM) -D $(PCMCIA_CHECK_BROKEN_CIS) $(DESTDIR)$(udevhelpe=
rdir)/$(PCMCIA_CHECK_BROKEN_CIS)
> -+	$(INSTALL_PROGRAM) $(PCMCIA_CHECK_BROKEN_CIS) $(DESTDIR)$(udevhelperdi=
r)/$(PCMCIA_CHECK_BROKEN_CIS)
> -=20
> - uninstall-tools:
> - 	- rm -f $(DESTDIR)$(sbindir)/$(PCCARDCTL)
> -@@ -305,22 +307,24 @@ uninstall-tools:
> -=20
> - install-config:
> - 	$(INSTALL) -d $(DESTDIR)$(pcmciaconfdir)
> --	$(INSTALL_DATA)  -D config/config.opts $(DESTDIR)$(pcmciaconfdir)/conf=
ig.opts
> -+	$(INSTALL_DATA)  config/config.opts $(DESTDIR)$(pcmciaconfdir)/config.=
opts
> - 	if [ -f config/config.opts.$(ARCH) ]; then \
> --		$(INSTALL_DATA) -D config/config.opts.$(ARCH) $(DESTDIR)$(pcmciaconfd=
ir)/config.opts; \
> -+		$(INSTALL_DATA) config/config.opts.$(ARCH) $(DESTDIR)$(pcmciaconfdir)=
/config.opts; \
> - 	fi
> -=20
> - uninstall-config:
> - #	- rm -f $(DESTDIR)$(pcmciaconfdir)/config.opts
> -=20
> - install-udev:
> --	$(INSTALL_DATA) -D $(UDEV_RULES_FILE) $(DESTDIR)$(udevrulesdir)/60-pcm=
cia.rules
> -+	$(INSTALL) -d $(DESTDIR)$(udevrulesdir)
> -+	$(INSTALL_DATA) $(UDEV_RULES_FILE) $(DESTDIR)$(udevrulesdir)/60-pcmcia=
=2Erules
> -=20
> - uninstall-udev:
> - 	- rm -f $(DESTDIR)$(udevrulesdir)/60-pcmcia.rules
> -=20
> - install-man:
> --	$(INSTALL_DATA) -D man/man8/pccardctl.8 $(DESTDIR)$(mandir)/man8/pccar=
dctl.8
> -+	$(INSTALL) -d $(DESTDIR)$(mandir)/man8
> -+	$(INSTALL_DATA) man/man8/pccardctl.8 $(DESTDIR)$(mandir)/man8/pccardct=
l.8
> - 	$(SYMLINK) pccardctl.8 $(DESTDIR)$(mandir)/man8/lspcmcia.8
> -=20
> - uninstall-man:
> diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils.inc b/meta/recipes-=
bsp/pcmciautils/pcmciautils.inc
> deleted file mode 100644
> index 9d1c55bbad9a..000000000000
> --- a/meta/recipes-bsp/pcmciautils/pcmciautils.inc
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -SUMMARY =3D "Linux kernel userland utilities for the PCMCIA subsystem"
> -HOMEPAGE =3D "https://www.kernel.org/pub/linux/utils/kernel/pcmcia/"
> -SECTION =3D "kernel/userland"
> -
> -LICENSE =3D "GPLv2"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> -
> -DEPENDS =3D "udev sysfsutils flex-native"
> -RDEPENDS_${PN} =3D "udev module-init-tools"
> -
> -SRC_URI =3D "http://mirror.linux.org.au/linux/utils/kernel/pcmcia/${BP}.=
tar.bz2"
> -
> -S =3D "${WORKDIR}/pcmciautils-${PV}"
> -
> -export HOSTCC =3D "${BUILD_CC}"
> -export etcdir =3D "${sysconfdir}"
> -export sbindir =3D "${base_sbindir}"
> -export pcmciaconfdir =3D "${sysconfdir}/pcmcia"
> -export udevdir =3D "`pkg-config --variable=3Dudevdir udev`"
> -export udevrulesdir =3D "`pkg-config --variable=3Dudevdir udev`/rules.d"
> -export UDEV =3D "1"
> -LD =3D "${CC}"
> -CFLAGS =3D+ "-I${S}/src"
> -CFLAGS =3D+ "-DPCMCIAUTILS_VERSION=3D\\"${PV}\\""
> -
> -EXTRA_OEMAKE =3D "-e 'STRIP=3Decho' 'LIB_OBJS=3D-lc -lsysfs' 'LEX=3Dflex=
'"
> -
> -do_install () {
> -	oe_runmake 'DESTDIR=3D${D}' install
> -}
> -
> -CONFFILES_${PN} +=3D "${sysconfdir}/pcmcia/config.opts"
> diff --git a/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb b/meta/recip=
es-bsp/pcmciautils/pcmciautils_018.bb
> deleted file mode 100644
> index 24ceed87a930..000000000000
> --- a/meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -require pcmciautils.inc
> -
> -SRC_URI +=3D "file://makefile_fix.patch \
> -            file://0001-fix-a-parallel-building-issue.patch \
> -"
> -
> -SRC_URI[md5sum] =3D "5d85669b3440baa4532363da6caaf1b4"
> -SRC_URI[sha256sum] =3D "79e6ae441278e178c07501d492394ed2c0326fdb66894f6d=
040ec811b0dc8ed5"
> -
> -PR =3D "r1"
> -
> -FILES_${PN}-dbg +=3D "*/udev/.debug"
> -FILES_${PN} +=3D "*/udev"
> diff --git a/meta/recipes-core/packagegroups/packagegroup-base.bb b/meta/=
recipes-core/packagegroups/packagegroup-base.bb
> index 262d65f5dc0c..e2b85b4af56b 100644
> --- a/meta/recipes-core/packagegroups/packagegroup-base.bb
> +++ b/meta/recipes-core/packagegroups/packagegroup-base.bb
> @@ -25,7 +25,6 @@ PACKAGES =3D ' \
>              ${@bb.utils.contains("MACHINE_FEATURES", "irda", "packagegro=
up-base-irda", "",d)} \
>              ${@bb.utils.contains("MACHINE_FEATURES", "keyboard", "packag=
egroup-base-keyboard", "", d)} \
>              ${@bb.utils.contains("MACHINE_FEATURES", "pci", "packagegrou=
p-base-pci", "",d)} \
> -            ${@bb.utils.contains("MACHINE_FEATURES", "pcmcia", "packageg=
roup-base-pcmcia", "", d)} \
>              ${@bb.utils.contains("MACHINE_FEATURES", "phone", "packagegr=
oup-base-phone", "", d)} \
>              ${@bb.utils.contains("MACHINE_FEATURES", "serial", "packageg=
roup-base-serial", "", d)} \
>              ${@bb.utils.contains("MACHINE_FEATURES", "usbgadget", "packa=
gegroup-base-usbgadget", "", d)} \
> @@ -67,7 +66,6 @@ RDEPENDS_packagegroup-base =3D "\
>      ${@bb.utils.contains('COMBINED_FEATURES', 'vfat', 'packagegroup-base=
-vfat', '',d)} \
>      ${@bb.utils.contains('COMBINED_FEATURES', 'irda', 'packagegroup-base=
-irda', '',d)} \
>      ${@bb.utils.contains('COMBINED_FEATURES', 'pci', 'packagegroup-base-=
pci', '',d)} \
> -    ${@bb.utils.contains('COMBINED_FEATURES', 'pcmcia', 'packagegroup-ba=
se-pcmcia', '',d)} \
>      ${@bb.utils.contains('COMBINED_FEATURES', 'usbgadget', 'packagegroup=
-base-usbgadget', '',d)} \
>      ${@bb.utils.contains('COMBINED_FEATURES', 'usbhost', 'packagegroup-b=
ase-usbhost', '',d)} \
>      ${@bb.utils.contains('COMBINED_FEATURES', 'bluetooth', 'packagegroup=
-base-bluetooth', '',d)} \
> @@ -108,19 +106,19 @@ ADD_3G =3D ""
>  ADD_NFC =3D ""
> =20
>  python __anonymous () {
> -    # If Distro want wifi and machine feature wifi/pci/pcmcia/usbhost (o=
ne of them)
> +    # If Distro want wifi and machine feature wifi/pci/usbhost (one of t=
hem)
>      # then include packagegroup-base-wifi in packagegroup-base
> =20
>      distro_features =3D set(d.getVar("DISTRO_FEATURES", True).split())
>      machine_features=3D set(d.getVar("MACHINE_FEATURES", True).split())
> =20
> -    if "bluetooth" in distro_features and not "bluetooth" in machine_fea=
tures and ("pcmcia" in machine_features or "pci" in machine_features or "us=
bhost" in machine_features):
> +    if "bluetooth" in distro_features and not "bluetooth" in machine_fea=
tures and ("pci" in machine_features or "usbhost" in machine_features):
>          d.setVar("ADD_BT", "packagegroup-base-bluetooth")
> =20
> -    if "wifi" in distro_features and not "wifi" in machine_features and =
("pcmcia" in machine_features or "pci" in machine_features or "usbhost" in =
machine_features):
> +    if "wifi" in distro_features and not "wifi" in machine_features and =
("pci" in machine_features or "usbhost" in machine_features):
>          d.setVar("ADD_WIFI", "packagegroup-base-wifi")
> =20
> -    if "3g" in distro_features and not "3g" in machine_features and ("pc=
mcia" in machine_features or "pci" in machine_features or "usbhost" in mach=
ine_features):
> +    if "3g" in distro_features and not "3g" in machine_features and ("pc=
i" in machine_features or "usbhost" in machine_features):
>          d.setVar("ADD_3G", "packagegroup-base-3g")
> =20
>      if "nfc" in distro_features and not "nfc" in machine_features and ("=
usbhost" in machine_features):
> @@ -186,22 +184,6 @@ RRECOMMENDS_packagegroup-base-alsa =3D "\
>      kernel-module-snd-mixer-oss \
>      kernel-module-snd-pcm-oss"
> =20
> -SUMMARY_packagegroup-base-pcmcia =3D "PC card slot support"
> -RDEPENDS_packagegroup-base-pcmcia =3D "\
> -    pcmciautils \
> -    "
> -
> -RRECOMMENDS_packagegroup-base-pcmcia =3D "\
> -    kernel-module-pcmcia \
> -    kernel-module-airo-cs \
> -    kernel-module-pcnet-cs \
> -    kernel-module-serial-cs \
> -    kernel-module-ide-cs \
> -    kernel-module-ide-disk \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'kernel-module-hosta=
p-cs', '',d)} \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'kernel-module-orino=
co-cs', '',d)} \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'kernel-module-spect=
rum-cs', '',d)}"
> -
>  SUMMARY_packagegroup-base-bluetooth =3D "Bluetooth support"
>  RDEPENDS_packagegroup-base-bluetooth =3D "\
>      ${BLUEZ} \
> @@ -218,10 +200,6 @@ RRECOMMENDS_packagegroup-base-bluetooth =3D "\
>      kernel-module-hci-uart \
>      kernel-module-sco \
>      ${@bb.utils.contains('COMBINED_FEATURES', 'usbhost', 'kernel-module-=
hci-usb', '',d)} \
> -    ${@bb.utils.contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-b=
luetooth3c-cs', '',d)} \
> -    ${@bb.utils.contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-b=
luecard-cs', '',d)} \
> -    ${@bb.utils.contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-b=
luetoothuart-cs', '',d)} \
> -    ${@bb.utils.contains('COMBINED_FEATURES', 'pcmcia', 'kernel-module-d=
tl1-cs', '',d)} \
>      "
> =20
>  SUMMARY_packagegroup-base-irda =3D "IrDA support"
> @@ -293,7 +271,6 @@ RRECOMMENDS_packagegroup-base-ipsec =3D "\
>  SUMMARY_packagegroup-base-wifi =3D "WiFi support"
>  RDEPENDS_packagegroup-base-wifi =3D "\
>      wireless-tools \
> -    ${@bb.utils.contains('COMBINED_FEATURES', 'pcmcia', 'hostap-utils', =
'',d)} \
>      ${@bb.utils.contains('COMBINED_FEATURES', 'pci', 'hostap-utils', '',=
d)} \
>      wpa-supplicant"
> =20
> --=20
> 2.1.0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

