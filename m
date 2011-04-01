Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5Vzy-0004q3-BZ
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Apr 2011 06:30:14 +0200
Received: by pvc30 with SMTP id 30so571564pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2011 21:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=9NLmzkgIwYHgnFzQXm+HJWaxy9YpuPJIsNo0zFDLkog=;
	b=XW7ONGZeuL26a8n4+kZ/Co2sgaTcgpJ3dOxiEUutMokdGbZoGJciPGJe1BV0B+CAsS
	RQqQ32lJj3Sh2+QIFno9spfj5+FAlSEngfDJ/Msok9+uxvN/u/VRdXIm+chBqDfIep58
	Eakkdf6vs/HDzMXbTVDlhGpxXEDYMSbwUQrnM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=oOsm2iWla8+FBHQxQ9zSHe92LTYna3CCLF/pmKhy/MLpzbAPUn0liaOJVqJhe2FOd8
	T/qcmCztzW2RFFUcXKiLL/Yo5gkRqi+T1wxnHlpDogU7ezcJdawTAGAGYG0NsqRQ0i4e
	5ZhhYjnyUsW8DVuaSqRED4TYE+D7oY8HCQroU=
Received: by 10.142.195.6 with SMTP id s6mr2848722wff.171.1301632091741;
	Thu, 31 Mar 2011 21:28:11 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id s41sm2384513wfc.15.2011.03.31.21.28.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Mar 2011 21:28:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Thu, 31 Mar 2011 21:28:02 -0700
Message-Id: <cover.1301631488.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 00/46] Enhance uclibc support
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
X-List-Received-Date: Fri, 01 Apr 2011 04:30:14 -0000

This patchset enables uclibc based image generation on oe-core
It changes usage of inheriting gettext and removing gettext from
depends so that it can use virtual/libintl to specify depends for
libintl Most of patches are for this change. 

I have changed the target triplet from -uclibcgnueabi to -uclibceabi
thats been same in OE too.


I have not proposed uclibc recipes itself which I have proposed for
meta-openembedded eventually it should be in oe-core I thought 
it would be better to do that after 0.9.32 releases.

I am able to build console-image/angstrom for arm mips ppc
x86 and x86-64 and boot them on QEMU

I have also made sure that it does not cause any regression
for eglibc based systems.

Please review and apply

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: kraj/uclibc
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/uclibc

Thanks,
    Khem Raj <raj.khem@gmail.com>
---


Khem Raj (46):
  sanity.bbclass: Use SSTATE_MANIFESTS instead of hard coding
    sstate-control
  classes: Use virtual/libintl instead of gettext
  classes: Use linux-uclibceabi instead of linux-uclibgnuceabi for os
    portion of triplet
  site: Add mips-linux-uclibc site file and add to x86_64-linux-uclibc
  conf/distro/poky.conf: Use -uclibceabi instead of -uclibgnuceabi
  recipes: Use -uclibceabi instead of -uclibcgnueabi
  libiconv: update from 1.9.2 -> 1.11.1
  avahi.inc: Conditionalize RECOMMENDS by using overrides
  galago: inherit gettext class instead of adding gettext to DEPENDS
    directly
  telepathy-glib_0.13.6.bb: inherit gettext class instead of adding
    gettext to DEPENDS directly
  console-tools_0.3.2.bb: inherit gettext
  coreutils_6.9.bb: Remove gettext from DEPENDS
  gettext_0.17.bb: Use linux-uclibceabi instead of linux-uclibcgnueabi
  glib-2.0: Inherit gettext should provide right libintl so remove from
    DEPENDS
  util-linux.inc: remove virtual/libintl from DEPENDS
  binutils: Use arm*-*-linux-uclibceabi instead of
    arm*-*-linux-uclibcgnueabi
  bison: Make compilable on uclibc
  diffstat_1.54.bb: inherit gettext class instead of adding gettext to
    DEPENDS directly
  libpam_1.1.3.bb: Fix compilation on uclibc when innetgr is absent
  alsa-utils_1.0.23.bb: Remove xmlto requirement
  liboil_0.3.17.bb: Enable x86_64 unaligned memory access
  e2fsprogs.inc: inherit gettext class instead of adding gettext to
    DEPENDS directly
  flex.inc: inherit gettext class instead of adding gettext to DEPENDS
    directly
  elfutils_0.148.bb: Fix compilation issues on uclibc
  gcc-runtime_4.5.1.bb: Do not filter out -feliminate-dwarf2-dups
  perl_5.12.2.bb: By defualt undefine features not found in uclibc
  xorg-proto: inherit gettext class instead of adding gettext to
    DEPENDS directly
  xorg-lib: inherit gettext class instead of adding gettext to DEPENDS
    directly
  attr: Fix compilation on uclibc
  sed: inherit gettext class instead of adding gettext to DEPENDS
    directly
  chkconfig_1.3.49.bb: inherit gettext class instead of adding gettext
    to DEPENDS directly
  libuser_0.57.1.bb: inherit gettext class instead of adding gettext to
    DEPENDS directly
  libzypp_git.bb: inherit gettext class instead of adding gettext to
    DEPENDS directly
  xz_5.0.0.bb: inherit gettext class instead of adding gettext to
    DEPENDS directly
  gdk-pixbuf_2.22.1.bb: inherit gettext class instead of adding gettext
    to DEPENDS directly
  libgdata_0.7.1.bb: inherit gettext class instead of adding gettext to
    DEPENDS directly
  popt_1.16.bb: inherit gettext class instead of adding gettext to
    DEPENDS directly
  libgpg-error: inherit gettext class instead of adding gettext to
    DEPENDS directly
  clutter.inc: inherit gettext class instead of adding gettext to
    DEPENDS directly
  libxcb.inc: Replace XCBPROTO_XCBPYTHONDIR to point to staging area
  util-macros_1.11.0.bb: inherit gettext class instead of adding
    gettext to DEPENDS directly
  gstreamer_0.10.31.bb: inherit gettext class instead of adding gettext
    to DEPENDS directly
  gnutls.inc: inherit gettext class instead of adding gettext to
    DEPENDS directly
  libcap.inc: Pass SYSTEM_HEADERS to make
  libexif_0.6.16.bb: inherit gettext class instead of adding gettext to
    DEPENDS directly
  linux-tools.inc: Dummify do_compile_perf and do_install_perf for
    uclibc

 meta/classes/autotools.bbclass                     |    8 +-
 meta/classes/gettext.bbclass                       |    8 +-
 meta/classes/insane.bbclass                        |   25 ++--
 meta/classes/sanity.bbclass                        |    2 +-
 meta/classes/siteinfo.bbclass                      |    4 +-
 meta/conf/distro/poky.conf                         |    2 +-
 .../pciutils/pciutils-3.1.7/configure.patch        |    2 +-
 .../pciutils/pciutils-3.1.7/guess-fix.patch        |    2 +-
 meta/recipes-connectivity/avahi/avahi.inc          |   10 +-
 .../galago/galago-daemon_0.5.1.bb                  |    4 +-
 .../recipes-connectivity/galago/libgalago_0.5.2.bb |    4 +-
 .../openssl/openssl-0.9.8p/configure-targets.patch |    4 +-
 .../telepathy/telepathy-glib_0.13.6.bb             |    4 +-
 .../console-tools/console-tools_0.3.2.bb           |    3 +-
 meta/recipes-core/coreutils/coreutils_6.9.bb       |    2 +-
 meta/recipes-core/gettext/gettext_0.17.bb          |    2 +-
 meta/recipes-core/glib-2.0/glib-2.0/no-iconv.patch |  104 ++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.26.1.bb      |    4 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb      |    3 +-
 meta/recipes-core/glib-2.0/glib.inc                |    2 +-
 meta/recipes-core/util-linux/util-linux.inc        |    6 +-
 .../binutils/binutils-2.21/110-arm-eabi-conf.patch |    4 +-
 .../bison/bison/uclibc-sched_param-def.patch       |   19 +++
 meta/recipes-devtools/bison/bison_2.3.bb           |    4 +-
 meta/recipes-devtools/bison/bison_2.4.3.bb         |   10 +-
 meta/recipes-devtools/diffstat/diffstat_1.54.bb    |    3 +-
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc      |    4 +-
 .../elfutils/elfutils-0.148/mempcpy.patch          |   14 ++
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |    8 +-
 meta/recipes-devtools/flex/flex.inc                |    3 +-
 .../gcc/gcc-4.3.3/110-arm-eabi.patch               |    2 +-
 meta/recipes-devtools/gcc/gcc-configure-common.inc |    2 +-
 meta/recipes-devtools/gcc/gcc-configure-sdk.inc    |    2 +-
 meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb     |    5 -
 meta/recipes-devtools/perl/perl-5.12.2/config.sh   |   14 +-
 meta/recipes-devtools/perl/perl_5.12.2.bb          |   10 ++
 .../recipes-extended/chkconfig/chkconfig_1.3.49.bb |    4 +-
 meta/recipes-extended/libuser/libuser_0.57.1.bb    |    4 +-
 meta/recipes-extended/libzypp/libzypp_git.bb       |    4 +-
 .../pam/libpam/pam-no-innetgr.patch                |   92 ++++++++++++++
 meta/recipes-extended/pam/libpam_1.1.3.bb          |    2 +
 meta/recipes-extended/sed/sed_4.1.2.bb             |    4 +-
 meta/recipes-extended/sed/sed_4.2.1.bb             |    4 +-
 meta/recipes-extended/xz/xz_5.0.0.bb               |    4 +-
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb |    4 +-
 meta/recipes-gnome/gnome/libgdata_0.7.1.bb         |    4 +-
 meta/recipes-graphics/clutter/clutter.inc          |    4 +-
 meta/recipes-graphics/xcb/libxcb.inc               |    2 +
 meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb     |    2 +-
 meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb   |    2 -
 meta/recipes-graphics/xorg-lib/xorg-lib-common.inc |    2 +-
 meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb     |    1 -
 .../xorg-proto/bigreqsproto_1.1.1.bb               |    2 -
 meta/recipes-graphics/xorg-proto/kbproto_1.0.5.bb  |    2 -
 .../xorg-proto/xcmiscproto_1.2.1.bb                |    2 -
 .../xorg-proto/xf86bigfontproto_1.2.0.bb           |    2 -
 .../xorg-util/util-macros_1.11.0.bb                |    2 +-
 meta/recipes-kernel/linux/linux-tools.inc          |   12 ++-
 .../alsa-utils-remove-xmlto.patch                  |   18 +++
 meta/recipes-multimedia/alsa/alsa-utils_1.0.23.bb  |   12 +-
 .../gstreamer/gstreamer_0.10.31.bb                 |    4 +-
 meta/recipes-support/attr/attr.inc                 |    8 ++
 meta/recipes-support/attr/ea-acl.inc               |    4 +-
 meta/recipes-support/gnutls/gnutls.inc             |    4 +-
 meta/recipes-support/libcap/libcap.inc             |    2 +-
 meta/recipes-support/libexif/libexif_0.6.16.bb     |    3 +-
 .../libgpg-error/libgpg-error_1.9.bb               |    3 +-
 .../libiconv/libiconv-1.11.1/autoconf.patch        |   42 +++++++
 .../shared_preloadable_libiconv_linux.patch        |   16 +++
 meta/recipes-support/libiconv/libiconv_1.11.1.bb   |   30 +++++
 meta/recipes-support/libiconv/libiconv_1.9.2.bb    |   21 ----
 .../liboil-0.3.17/fix-unaligned-whitelist.patch    |   17 +++
 meta/recipes-support/liboil/liboil_0.3.17.bb       |    6 +-
 meta/recipes-support/popt/popt_1.16.bb             |    3 +-
 meta/site/mips-linux-uclibc                        |  126 ++++++++++++++++++++
 meta/site/x86_64-linux-uclibc                      |   26 ++++
 76 files changed, 657 insertions(+), 158 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/no-iconv.patch
 create mode 100644 meta/recipes-devtools/bison/bison/uclibc-sched_param-def.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.148/mempcpy.patch
 create mode 100644 meta/recipes-extended/pam/libpam/pam-no-innetgr.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-utils-1.0.23/alsa-utils-remove-xmlto.patch
 create mode 100644 meta/recipes-support/libiconv/libiconv-1.11.1/autoconf.patch
 create mode 100644 meta/recipes-support/libiconv/libiconv-1.11.1/shared_preloadable_libiconv_linux.patch
 create mode 100644 meta/recipes-support/libiconv/libiconv_1.11.1.bb
 delete mode 100644 meta/recipes-support/libiconv/libiconv_1.9.2.bb
 create mode 100644 meta/recipes-support/liboil/liboil-0.3.17/fix-unaligned-whitelist.patch
 create mode 100644 meta/site/mips-linux-uclibc

-- 
1.7.4.1



