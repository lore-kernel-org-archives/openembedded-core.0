Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SWJZa-0005c2-1K
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 05:46:18 +0200
Received: by dalh21 with SMTP id h21so5415613dal.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 May 2012 20:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ByLlZ3Jj5FhcIkXf9CSEiUMnuROLfGaWPgSiSgy/nPw=;
	b=KUziVEtBLK+edPIv077jeCo9khL528ZBq+WItO7SJzzv8c0zvEDo/crvOuAjtKHr2C
	F9j/yfRAz9f/EPmuwYixEpEwzLF/8sHrMxyAG9x0mM+l3+x+VhQGC0Tps5UhZqulv9W/
	lP4v1sE+v1KFfQhIY8Fk7uhDIF5TnOdycazDiM0shbIbu99mY4Z9J3CmqeSmfRneF+PF
	n4hVnt7bLp1CjfgaCaLWyVjeDNNoZeLBO2cNPw2ucfeq7oOgkkdYFDwQeru4Sq5Rm1EI
	v3h1QO8NR6RUrrVY5rFMN7Q0t9RBGsuUbcoTA3wzS2NCC54DIcsTRtGaKyUrAA1y2ehw
	DLmg==
Received: by 10.68.223.129 with SMTP id qu1mr18034141pbc.165.1337571369880;
	Sun, 20 May 2012 20:36:09 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id gk8sm5719352pbc.16.2012.05.20.20.36.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 20 May 2012 20:36:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 May 2012 20:35:32 -0700
Message-Id: <cover.1337570904.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [RFC][PATCH 00/14] mips64 support and sh4 support
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
X-List-Received-Date: Mon, 21 May 2012 03:46:18 -0000

This patchset adds required bits into metadata for having
mips64/n64 support. I have tested the core-image-sato and core-image-minimal
builds and boots on qemumips64 and runs gcc regression testsuite.
It needs linux-yocto-dev kernel for now which can be obtained from
poky-extra repo. Additionally systemd-image on angstrom-next builds and boots
fine on qemumips64 as well.

Additionally it also adds bits to have SH4 root file systems to be
able to built and again core-image-sato builds for sh4 however qemu
machine support is not yet done but root file sytem boots fine on 
real hardware.

The images are tested on both eglibc and uclibc.

Any help in providing feedback or testing these patches is welcome.

I have tested them enough for over a month now.

The following changes since commit 326563d5a897ae2dba7cfd8d73579d3d979d72c8:

  sstate.bbclass: Make sure we don't have an empty fixmepath file (2012-05-18 15:24:45 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/mips64
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/mips64

Khem Raj (14):
  insane.bbclass: Add mips64{el} to known machines
  site: Add mips64 eglibc and uclibc site files
  gcc-4.6, gcc-4.7: Add support for building mips64 cross compiler
  binutils: Default to n64 when configured for mips64
  kernel-arch.bbclass: Map mips64{el} to mips KARCH
  eglibc-2.15: Support mips64
  libc-package: Add sh4 and mips64 to arch options
  runqemu: Add qemush4 and qemumips64 knowledge
  netbase: Add interface files for qemumips64 and qemush4
  site/sh-common: Add missing caches variables to build glib-2.32
  xserver-xorg: Fix build for mips64
  tune-mips64.inc: Add new tune file for mips64 big-endian
  qemumips64.conf: Add machine configuration for mips64(eb)
  qemush4.conf: Add machine configuration for qemush4

 meta/classes/insane.bbclass                        |    4 +
 meta/classes/kernel-arch.bbclass                   |    2 +-
 meta/classes/libc-package.bbclass                  |    3 +
 meta/conf/machine/include/tune-mips64.inc          |    3 +
 meta/conf/machine/qemumips64.conf                  |   13 +++
 meta/conf/machine/qemush4.conf                     |   13 +++
 meta/recipes-core/eglibc/eglibc-locale.inc         |    2 +-
 meta/recipes-core/eglibc/eglibc_2.15.bb            |    2 +-
 .../netbase/netbase-4.47/qemumips64/interfaces     |    8 ++
 .../netbase/netbase-4.47/qemush4/interfaces        |    8 ++
 meta/recipes-core/netbase/netbase_4.47.bb          |    4 +-
 .../binutils/mips64-default-ld-emulation.patch     |   49 +++++++++
 meta/recipes-devtools/binutils/binutils_2.22.bb    |    3 +-
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    1 +
 .../gcc/gcc-4.6/mips64-default-n64.patch           |   32 ++++++
 meta/recipes-devtools/gcc/gcc-4.7.inc              |    1 +
 .../gcc/gcc-4.7/mips64-default-n64.patch           |   19 ++++
 meta/recipes-devtools/gcc/gcc-configure-common.inc |    4 +
 .../xorg-xserver/xserver-xorg-1.11.2.inc           |    1 +
 .../xserver-xorg-1.11.2/mips64-compiler.patch      |   29 +++++
 meta/site/mips64-linux                             |   82 +++++++++++++++
 meta/site/mips64-linux-uclibc                      |   83 +++++++++++++++
 meta/site/mips64el-linux                           |   82 +++++++++++++++
 meta/site/mips64el-linux-uclibc                    |  108 ++++++++++++++++++++
 meta/site/sh-common                                |    4 +
 scripts/runqemu                                    |   10 ++-
 scripts/runqemu-internal                           |   35 ++++++-
 27 files changed, 594 insertions(+), 11 deletions(-)
 create mode 100644 meta/conf/machine/include/tune-mips64.inc
 create mode 100644 meta/conf/machine/qemumips64.conf
 create mode 100644 meta/conf/machine/qemush4.conf
 create mode 100644 meta/recipes-core/netbase/netbase-4.47/qemumips64/interfaces
 create mode 100644 meta/recipes-core/netbase/netbase-4.47/qemush4/interfaces
 create mode 100644 meta/recipes-devtools/binutils/binutils/mips64-default-ld-emulation.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/mips64-default-n64.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/mips64-default-n64.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2/mips64-compiler.patch
 create mode 100644 meta/site/mips64-linux
 create mode 100644 meta/site/mips64-linux-uclibc
 create mode 100644 meta/site/mips64el-linux
 create mode 100644 meta/site/mips64el-linux-uclibc

-- 
1.7.5.4



