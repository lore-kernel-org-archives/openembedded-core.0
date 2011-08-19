Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QuQ7K-0004FD-Au for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 16:32:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7JERYV4028325
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 15:27:34 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26885-04 for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 15:27:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7JERNbW028319
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 15:27:26 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <883d56eb74a8f3b1913e7334c9ea70f2f1e562e9.1313700595.git.sgw@linux.intel.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
	<883d56eb74a8f3b1913e7334c9ea70f2f1e562e9.1313700595.git.sgw@linux.intel.com>
Date: Fri, 19 Aug 2011 09:27:21 -0500
Message-ID: <1313764041.13995.101.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 12/32] libxkbcommon: new
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
X-List-Received-Date: Fri, 19 Aug 2011 14:32:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-18 at 13:55 -0700, Saul Wold wrote:
> From: Phil Blundell <philb@gnu.org>
> 
> This is needed by Clutter's egl backend.
> 
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>  .../xorg-lib/libxkbcommon/cross.patch              |   43 ++++++++++++++++++++
>  meta/recipes-graphics/xorg-lib/libxkbcommon_git.bb |   22 ++++++++++
>  2 files changed, 65 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-graphics/xorg-lib/libxkbcommon/cross.patch
>  create mode 100644 meta/recipes-graphics/xorg-lib/libxkbcommon_git.bb
> 
> diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon/cross.patch b/meta/recipes-graphics/xorg-lib/libxkbcommon/cross.patch
> new file mode 100644
> index 0000000..7fd35be
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-lib/libxkbcommon/cross.patch
> @@ -0,0 +1,43 @@
> +Upstream-Status: Inappropriate
> +Signed-off-by: Phil Blundell <philb@gnu.org>
> +
> +Use makekeys from -native package rather than trying to compile it here, and fix up
> +configure logic to find keysymdef.h in the sysroot.
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 2a4d448..214271f 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -1,5 +1,5 @@
> + # Order: makekeys before src
> +-SUBDIRS = include makekeys src test
> ++SUBDIRS = include src test
> + 
> + pkgconfigdir = $(libdir)/pkgconfig
> + pkgconfig_DATA = xkbcommon.pc
> +diff --git a/configure.ac b/configure.ac
> +index e6a8f15..7f2c387 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -74,7 +74,8 @@ PKG_CHECK_MODULES([X11], [xproto kbproto >= 1.0.4])
> + 
> + # Obtain the path to the X Window System Core Protocol
> + AC_MSG_CHECKING([for X11 includedir])
> +-includex11dir="`$PKG_CONFIG --variable=includex11dir xproto`"
> ++m4_pattern_allow([PKG_CONFIG_SYSROOT_DIR])
> ++includex11dir="$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=includex11dir xproto`"
> + AC_MSG_RESULT([$includex11dir])
> + 
> + # Obtain full path for keysymdef header file
> +diff --git a/src/Makefile.am b/src/Makefile.am
> +index b9a12b9..c625b4c 100644
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -26,5 +26,5 @@ libxkbcommon_la_SOURCES = \
> + BUILT_SOURCES = ks_tables.h
> + CLEANFILES = $(BUILT_SOURCES)
> + 
> +-ks_tables.h: $(top_builddir)/makekeys/makekeys$(EXEEXT) $(KEYSYMDEF_H) $(XF86KEYSYM_H)
> +-	$(AM_V_GEN)cat $(KEYSYMDEF_H) $(XF86KEYSYM_H) | $(top_builddir)/makekeys/makekeys$(EXEEXT) > $@
> ++ks_tables.h: $(KEYSYMDEF_H) $(XF86KEYSYM_H)
> ++	$(AM_V_GEN)cat $(KEYSYMDEF_H) $(XF86KEYSYM_H) | libxkbcommon-makekeys$(EXEEXT) > $@
> diff --git a/meta/recipes-graphics/xorg-lib/libxkbcommon_git.bb b/meta/recipes-graphics/xorg-lib/libxkbcommon_git.bb
> new file mode 100644
> index 0000000..1b63b0e
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-lib/libxkbcommon_git.bb
> @@ -0,0 +1,22 @@
> +require xorg-lib-common.inc
> +
> +SUMMARY = "library interface to the XKB compiler"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=469a86f811ec5d6bba592811c3005a2a"
> +PR = "r0"
> +DEPENDS = "xproto kbproto ${@['', '${PN}-native'][oe.utils.inherits(d, 'virtclass-native')]}"
> +
> +S = "${WORKDIR}/git"
> +
> +patches = "file://cross.patch"
> +patches_virtclass-native = ""
> +
> +SRC_URI = "git://anongit.freedesktop.org/xorg/lib/libxkbcommon \
> +	${patches}"
> +SRCREV = "f91afe4f3ebcac3fb65a402c6c85cf1df5e2b52a"
> +
> +BBCLASSEXTEND = "native"
> +
> +do_install_append_virtclass-native() {
> +	install -m 755 "makekeys/makekeys" "${STAGING_BINDIR}/libxkbcommon-makekeys"
> +}

What isthe version getting set to for this recipe?

Cheers,

Richard



