Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 78DA36010B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 17:10:55 +0000 (UTC)
Received: by qkda6 with SMTP id a6so27801909qkd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 09:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=AwNfBDKy+7ZcxjHUTV52a3ebLH4UhET3u10OLyxkPfw=;
	b=hZseGHA0v194oV89x9vjokGGU81X225BDEGS3+fpUIA/gYgiH5+SMToPgKdE9dcvFW
	1EU/v4o7QJQEe6uNQgrj3B+hiqds2QKVC6FYs+VTcdRTWp0hEr+nm2P6loLWySBJDDKM
	OAMkzyxDzGQe9P80KHQcFAtqlDmaIsUkFaaQODygA0OQKSgwCZkhFae9LeQCZbbtsRsw
	Vyi00JZ72lLMW5oBdlPdTxMOULABgwZPXQdmPamkWWl6GC4QxuuC4ZkzsvvMsviFHVcC
	hiw6E9MMvUosPzIy32sZy6Cm/L/Degk/hVeDFoPiteb0YdAqNwbTmvNyhIhsgJaD7kNk
	HoMA==
X-Received: by 10.55.25.31 with SMTP id k31mr8207853qkh.75.1447953055749;
	Thu, 19 Nov 2015 09:10:55 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	r67sm2583963qki.17.2015.11.19.09.10.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Nov 2015 09:10:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Nov 2015 17:10:48 +0000
Message-Id: <cover.1447952784.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.3
Subject: [PATCH 00/13] Add musl to OE-Core
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
X-List-Received-Date: Thu, 19 Nov 2015 17:10:55 -0000

This is a mimimal set of changes brought in from meta-musl
to OE-Core, with this set one can build core-image-minimal using musl
by setting

TCLIBC=musl

for all supported architectures, eventually we will bring
more changes to other packages which will enable more complex
image builds and eventually world.


Khem Raj (13):
  gcc: Add support for building musl configuration
  autoconf: Add musl support
  gdb: Fix build with musl
  mtd-utils: Backport and create patches to support musl
  squashfs-tools: Define FNM_EXTMATCH if not defined
  mtools: Use proper glibc override to add glibc packages to
    recommendations
  musl: Add recipe
  sysvinit: Fix build with musl
  gettext: Delete libintl.h and charset.alias
  busybox: Add config for musl
  openssl: Add musl configuration support
  libpam: Fix build with musl
  attr: Add patch to account for use of internal glibc header

 .../openssl/openssl/configure-musl-target.patch    |  27 +++
 .../openssl/openssl/linux-musl-libc-termios.patch  |  19 ++
 .../recipes-connectivity/openssl/openssl_1.0.2d.bb |   2 +
 ...user-use-POSIX-getpwent-instead-of-getpwe.patch |  71 ++++++
 meta/recipes-core/busybox/busybox/musl.cfg         |  12 +
 meta/recipes-core/busybox/busybox_1.23.2.bb        |   2 +
 meta/recipes-core/gettext/gettext_0.16.1.bb        |   5 +
 meta/recipes-core/gettext/gettext_0.19.4.bb        |   4 +
 meta/recipes-core/musl/musl.inc                    |  26 ++
 meta/recipes-core/musl/musl_git.bb                 |  58 +++++
 meta/recipes-core/sysvinit/sysvinit/musl.patch     |  74 ++++++
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |   1 +
 .../autoconf/autoconf/add_musl_config.patch        |  26 ++
 meta/recipes-devtools/autoconf/autoconf_2.69.bb    |   1 +
 meta/recipes-devtools/gcc/gcc-4.9.inc              |   4 +
 .../gcc/gcc-4.9/0066-libstdc-musl.patch            |  32 +++
 .../gcc/gcc-4.9/0067-gcc-musl-support.patch        | 267 +++++++++++++++++++++
 .../gcc/gcc-4.9/0068-musl-dynamic-linker.patch     | 205 ++++++++++++++++
 .../gcc/gcc-4.9/0069-musl-no-fixincludes.patch     |  21 ++
 meta/recipes-devtools/gcc/gcc-5.2.inc              |   4 +
 .../gcc/gcc-5.2/0043-libstdc-musl.patch            |  32 +++
 .../gcc/gcc-5.2/0044-gcc-musl-support.patch        | 267 +++++++++++++++++++++
 .../gcc/gcc-5.2/0045-musl-dynamic-linker.patch     | 198 +++++++++++++++
 .../gcc/gcc-5.2/0046-musl-no-fixincludes.patch     |  22 ++
 meta/recipes-devtools/gdb/gdb.inc                  |   1 +
 ...0001-Use-exported-definitions-of-SIGRTMIN.patch |  52 ++++
 .../mtd/mtd-utils/0001-Fix-build-with-musl.patch   |  53 ++++
 ...ibfec-use-standard-C-type-instead-of-u_lo.patch |  56 +++++
 .../mtd/mtd-utils/010-fix-rpmatch.patch            |  24 ++
 meta/recipes-devtools/mtd/mtd-utils_git.bb         |   4 +
 meta/recipes-devtools/mtools/mtools_4.0.18.bb      |   4 +-
 .../squashfs-tools/squashfs-tools/fix-compat.patch |  63 +++++
 .../squashfs-tools/squashfs-tools_git.bb           |   1 +
 ...upport-for-defining-missing-funcitonality.patch |  68 ++++++
 .../pam/libpam/include_paths_header.patch          |  59 +++++
 meta/recipes-extended/pam/libpam_1.2.1.bb          |   5 +-
 meta/recipes-support/attr/attr_2.4.47.bb           |   4 +-
 .../attr/files/dont-use-decl-macros.patch          |  44 ++++
 38 files changed, 1814 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/configure-musl-target.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/linux-musl-libc-termios.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-linedit-deluser-use-POSIX-getpwent-instead-of-getpwe.patch
 create mode 100644 meta/recipes-core/busybox/busybox/musl.cfg
 create mode 100644 meta/recipes-core/musl/musl.inc
 create mode 100644 meta/recipes-core/musl/musl_git.bb
 create mode 100644 meta/recipes-core/sysvinit/sysvinit/musl.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/add_musl_config.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0066-libstdc-musl.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0067-gcc-musl-support.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0068-musl-dynamic-linker.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0069-musl-no-fixincludes.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0043-libstdc-musl.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0044-gcc-musl-support.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0045-musl-dynamic-linker.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.2/0046-musl-no-fixincludes.patch
 create mode 100644 meta/recipes-devtools/gdb/gdb/0001-Use-exported-definitions-of-SIGRTMIN.patch
 create mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-Fix-build-with-musl.patch
 create mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-mtd-utils-libfec-use-standard-C-type-instead-of-u_lo.patch
 create mode 100644 meta/recipes-devtools/mtd/mtd-utils/010-fix-rpmatch.patch
 create mode 100644 meta/recipes-devtools/squashfs-tools/squashfs-tools/fix-compat.patch
 create mode 100644 meta/recipes-extended/pam/libpam/0001-Add-support-for-defining-missing-funcitonality.patch
 create mode 100644 meta/recipes-extended/pam/libpam/include_paths_header.patch
 create mode 100644 meta/recipes-support/attr/files/dont-use-decl-macros.patch

-- 
2.6.3


