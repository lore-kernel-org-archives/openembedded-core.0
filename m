Received: from mail-px0-f178.google.com ([209.85.212.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QEQy1-0003ks-HG
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2011 20:57:05 +0200
Received: by pxi1 with SMTP id 1so1933578pxi.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2011 11:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=9Bcz8JKo5d4WKETcD/b88ptysKilUtIPlJZ5FxxhwwQ=;
	b=is9hkFfcOvllDydkEHxF9dgBW9RyjFF2vxHCNZW3uTUxCdDvBa9/8Ro0M9xppvkzoj
	BjlDL3abWTLR2wMx9vM6grQllPM089MJ4nO4wJPPf3Z87YaeDG63jJuUIhozySKtg2LM
	TXGdNcRnImv37p6mfI2KLflwm1Jj00FkTCQlw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=MFy3Cv+YYMxkGuEbNR8i48ryN6TwR+dLCaYQpMVCiSHxA7kAMfGSx3R5f1UnBC5fK6
	ewicOgK4Hecu5noo60upd+W18AAjvnS9uLf626RcvLVxVX7/OgIbyVwQ0stCPGQ8iQb5
	R6evHwNNPsDZY1wObLtvvGxJTgFLY6gbf7lQ0=
Received: by 10.142.218.8 with SMTP id q8mr2827530wfg.118.1303757664653;
	Mon, 25 Apr 2011 11:54:24 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id k7sm4607797wfa.2.2011.04.25.11.54.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Apr 2011 11:54:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: OE core <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Apr 2011 11:54:16 -0700
Message-Id: <cover.1303757256.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 00/17] uclibc support in oe-core v2
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
X-List-Received-Date: Mon, 25 Apr 2011 18:57:06 -0000

Here are patches needed on top of oe-core to get uclibc based images
building. It incorporates the feedback from last set of patches. On
top there is a new virtual package virtual/gettext introduced which
is preferred to be gettext but can be overridden e.g. for uclibc it
can be set to proxy-libintl and thereby getting rid of gettext in images

libintl comes from three sources glibc/eglibc, gettext, proxy-libintl
when using eglibc/glibc we chose glibc/eglibc to provide it and not gettext

but when using uclibc one could use gettext to provide it or one could choose
proxy-libintl which stubs out gettext functionality and reduces the image
size.

Virtual/gettext can be provided by gettext or proxy-libintl, when we build
uclibc systems with out NLS then we can get rid of gettext fully by selecting
proxy-libintl to provide both virtual/libintl as well as virtual/gettext

Thanks
-Khem

Pull URL: git://git.openembedded.org/openembedded-core-contrib
  Branch: kraj/uclibc
  Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/uclibc

Thanks,
    Khem Raj <raj.khem@gmail.com>
---


Khem Raj (17):
  gettext.bbclass: Use _append instead of =+
  insane.bbclass: Move code to add function to tasks toward the end
  insane.bbclass: Checking for NLS too when checking gettext dependency
  autotools.bbclass: Copy gettext files only if --disable-nls is not
    set
  sstate.bbclass: Reduce SSTATE_MANIFESTS assignment to be weak
  gettext: Divide packaging into gettext-runtime and rest
  gettext_0.17.bb: PROVIDE virtual/gettext and RCONFLICT with
    proxy-libintl
  poky-default.inc: Weakly assign gettext to provide virtual/gettext
  libiconv: update from 1.9.2 -> 1.11.1
  glib-2.0: Inherit gettext should provide right libintl so remove from
    DEPENDS
  util-linux.inc: remove virtual/libintl from DEPENDS
  elfutils_0.148.bb: Fix compilation issues on uclibc
  perl_5.12.2.bb: Undefine features not found in uclibc
  xorg-lib: inherit gettext class instead of adding gettext to DEPENDS
    directly
  attr: Fix compilation on uclibc
  linux-tools.inc: Dummify do_compile_perf and do_install_perf for
    uclibc
  alsa-utils_1.0.23.bb: Fix compilation for uclibc targets

 meta/classes/autotools.bbclass                     |   19 ++--
 meta/classes/gettext.bbclass                       |   31 ++++---
 meta/classes/insane.bbclass                        |   24 +++--
 meta/classes/sstate.bbclass                        |    2 +-
 meta/conf/distro/include/poky-default.inc          |    1 +
 meta/recipes-core/gettext/gettext_0.17.bb          |   39 ++++++-
 meta/recipes-core/glib-2.0/glib-2.0/no-iconv.patch |  104 ++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.26.1.bb      |    4 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.27.5.bb      |    5 +-
 meta/recipes-core/glib-2.0/glib.inc                |    2 +-
 meta/recipes-core/util-linux/util-linux.inc        |    6 +-
 .../elfutils/elfutils-0.148/mempcpy.patch          |   23 +++++
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |    6 +-
 .../perl/perl-5.12.2/native-ssp.patch              |   16 ---
 meta/recipes-devtools/perl/perl_5.12.2.bb          |   16 +++
 meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb     |    4 +-
 meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb   |    4 +-
 meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb     |    3 +-
 meta/recipes-kernel/linux/linux-tools.inc          |   17 +++-
 meta/recipes-multimedia/alsa/alsa-utils_1.0.23.bb  |    9 +-
 meta/recipes-support/attr/attr.inc                 |    4 +
 meta/recipes-support/attr/ea-acl.inc               |    4 +-
 .../libiconv/libiconv-1.11.1/autoconf.patch        |   48 +++++++++
 .../shared_preloadable_libiconv_linux.patch        |   24 +++++
 meta/recipes-support/libiconv/libiconv_1.11.1.bb   |   30 ++++++
 meta/recipes-support/libiconv/libiconv_1.9.2.bb    |   21 ----
 26 files changed, 366 insertions(+), 100 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/no-iconv.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.148/mempcpy.patch
 delete mode 100644 meta/recipes-devtools/perl/perl-5.12.2/native-ssp.patch
 create mode 100644 meta/recipes-support/libiconv/libiconv-1.11.1/autoconf.patch
 create mode 100644 meta/recipes-support/libiconv/libiconv-1.11.1/shared_preloadable_libiconv_linux.patch
 create mode 100644 meta/recipes-support/libiconv/libiconv_1.11.1.bb
 delete mode 100644 meta/recipes-support/libiconv/libiconv_1.9.2.bb

-- 
1.7.4.1



