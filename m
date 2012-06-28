Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SkMXU-0005k7-5s
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 23:46:12 +0200
Received: by pbbrq2 with SMTP id rq2so3492275pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2012 14:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ZIH+lo0JaYkKV/690l4qiJ3cLg9REokL+s2+q4u7cUU=;
	b=t6yyTmzn1yedavTs+41vX3VVIvWOJGXU+/2bL/BMW1FNw+5vFTLJ01UHDZKcir6UDc
	6RHPIihmgk6BblGudn0HkGKzgINalepjS+zHPp2n8sVcTj2i3q1rN2S1X5GgQ/zQ/BoV
	XNAycfzx5ofvVcQtA+ElKFnXlzTM4O+RKwlBecqm+4HHkMdxY+dVGXYtGWhpRRKjSF52
	1Cz3gnH5uIe6RRNqn04UcdiAUv0delOaWwiojpkxvyxHH5n1i4WNvN/7Ba0K502Y5FSp
	62+HeXIIaC7gyxSdJ75COtBuqf69xAB06GpN/Vj3oqGp5ThXfNT6c3aU70T574aCa2B6
	Kx2A==
Received: by 10.66.73.98 with SMTP id k2mr345035pav.73.1340919316142;
	Thu, 28 Jun 2012 14:35:16 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id os9sm3212821pbb.62.2012.06.28.14.35.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jun 2012 14:35:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jun 2012 14:34:59 -0700
Message-Id: <cover.1340919157.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 00/11] toolchain updates
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
X-List-Received-Date: Thu, 28 Jun 2012 21:46:12 -0000

This combines my two previous pull requests in Addition RP's
feedback on USE_NLS definition


The following changes since commit b26dda2d1e839ea461485236028e1af53b839d34:

  local.conf.sample.extended: Add accidentally missed features (2012-06-28 16:30:32 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/misc-updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/misc-updates

Dennis Lan (1):
  eglibc: support mipsel little endian, filter out -march=mips32

Khem Raj (10):
  bitbake.conf: Add weak definition for USE_NLS
  libgcc: Remove unpackage unwind.h
  gcc-configure-sdk,gcc-configure-cross: Dont recompute USE_NLS
  eglibc-2.15: Update to latest on 2.15 branch
  kconfig-frontends: New recipe
  uclibc: Separate the bits between uclibc and uclibc-initial
  uclibc-git: Update for building systemd
  uclibc-0.9.33: add posix_fallocate implementation
  bison: link in librt on uclibc
  glib-2.0: Add missing dependency on virtual/libiconv

 meta/conf/bitbake.conf                             |    1 +
 meta/conf/distro/include/tclibc-eglibc.inc         |    2 +
 meta/recipes-core/eglibc/eglibc_2.15.bb            |    3 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.32.3.bb      |    2 +-
 meta/recipes-core/glib-2.0/glib.inc                |    2 +-
 meta/recipes-core/uclibc/uclibc-0.9.33.inc         |   22 ++
 .../uclibc/uclibc-0.9.33/posix_fallocate.patch     |  408 ++++++++++++++++++++
 meta/recipes-core/uclibc/uclibc-git.inc            |   29 ++
 ...1-atexit_old-Do-not-add-it-to-shared-libc.patch |   44 +++
 ...brt-Use-nodefaultlibs-instead-of-nostdlib.patch |   33 ++
 ...-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch |   31 ++
 ...rk-Hide-pthread_atfork-in-shared-versions.patch |   74 ++++
 .../uclibc-git/define-MSG_CMSG_CLOEXEC.patch       |   25 ++
 meta/recipes-core/uclibc/uclibc-git/dup3.patch     |   37 ++
 .../uclibc/uclibc-git/posix_fallocate.patch        |  408 ++++++++++++++++++++
 meta/recipes-core/uclibc/uclibc-initial_0.9.33.bb  |    3 +-
 meta/recipes-core/uclibc/uclibc-initial_git.bb     |    3 +-
 meta/recipes-core/uclibc/uclibc-package.inc        |   37 ++
 meta/recipes-core/uclibc/uclibc.inc                |   59 +--
 meta/recipes-core/uclibc/uclibc_0.9.33.bb          |   33 +-
 meta/recipes-core/uclibc/uclibc_git.bb             |   33 +-
 meta/recipes-devtools/bison/bison_2.5.bb           |    1 +
 meta/recipes-devtools/gcc/gcc-configure-cross.inc  |    2 -
 meta/recipes-devtools/gcc/gcc-configure-sdk.inc    |    4 -
 meta/recipes-devtools/gcc/libgcc_4.7.bb            |    4 +
 .../kconfig-frontends/kconfig-frontends_3.4.bb     |   34 ++
 26 files changed, 1228 insertions(+), 106 deletions(-)
 create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33.inc
 create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.33/posix_fallocate.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git.inc
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-atexit_old-Do-not-add-it-to-shared-libc.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-librt-Use-nodefaultlibs-instead-of-nostdlib.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-nptl-arm-Move-aeabi_read_tp-to-uclibc_nonshared.a.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/0001-nptl-atfork-Hide-pthread_atfork-in-shared-versions.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/define-MSG_CMSG_CLOEXEC.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/dup3.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-git/posix_fallocate.patch
 create mode 100644 meta/recipes-core/uclibc/uclibc-package.inc
 create mode 100644 meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb

-- 
1.7.9.5



