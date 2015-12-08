Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 00F0260110
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 08:12:27 +0000 (UTC)
Received: by qgeb1 with SMTP id b1so10083640qge.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Dec 2015 00:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=lTNlICACKaiDGyOb3n5L/iur9UvOrf2LOtWiotWY6yQ=;
	b=ej8yy5dUSqhV0LS3hK3INKApzf4LLZlMhIXUmiWu27PF3fmePBaKziH+u7nZY2reUR
	LRckmZI19iw1CdR3ku4heQ7hdZ8jc8IOHeHu6TsjvOVjGe9Sw3sqaMa+9VIRDzC3Ia7r
	lVM2dZGjJfs0W9YPTVbRIfMDBqppX9SxZHFVdVelxlL7JV2kDlhDhIixKFm3U8sdQY+u
	EcMjVTjF40hz5CwO/JPfDA0gqBn2ZClLry19MiFPPqzve9BopOG1unTyTnhYGdJ8bf1u
	G1arYv/IcVU4nU6IV7595xt5ZFDuvoqCfA/XdLvXnbzWbsmytdndWZerRXjMQujVxk8e
	jDRQ==
X-Received: by 10.140.239.87 with SMTP id k84mr2504455qhc.87.1449562347989;
	Tue, 08 Dec 2015 00:12:27 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id c48sm994814qge.49.2015.12.08.00.12.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Dec 2015 00:12:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Dec 2015 08:12:21 +0000
Message-Id: <cover.1449562195.git.raj.khem@gmail.com>
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
X-List-Received-Date: Tue, 08 Dec 2015 08:12:28 -0000

This is a mimimal set of changes brought in from meta-musl
to OE-Core, with this set one can build core-image-minimal using musl
by setting

TCLIBC=musl

for all supported architectures, eventually we will bring
more changes to other packages which will enable more complex
image builds and eventually world.

v2: Address review feedback

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

 meta/recipes-connectivity/openssl/openssl.inc      |   4 +-
 .../openssl/openssl/configure-musl-target.patch    |  27 +++
 .../recipes-connectivity/openssl/openssl_1.0.2d.bb |   1 +
 ...user-use-POSIX-getpwent-instead-of-getpwe.patch |  71 ++++++
 meta/recipes-core/busybox/busybox/musl.cfg         |  12 +
 meta/recipes-core/busybox/busybox_1.24.1.bb        |   2 +
 meta/recipes-core/gettext/gettext_0.16.1.bb        |   5 +
 meta/recipes-core/gettext/gettext_0.19.4.bb        |   4 +
 meta/recipes-core/musl/musl.inc                    |  26 ++
 meta/recipes-core/musl/musl_git.bb                 |  58 +++++
 meta/recipes-core/sysvinit/sysvinit/realpath.patch |  78 ++++++
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |   1 +
 .../autoconf/autoconf/add_musl_config.patch        |  26 ++
 meta/recipes-devtools/autoconf/autoconf_2.69.bb    |   1 +
 meta/recipes-devtools/gcc/gcc-4.9.inc              |   4 +
 .../gcc/gcc-4.9/0067-gcc-musl-support.patch        | 267 +++++++++++++++++++++
 .../gcc/gcc-4.9/0068-musl-dynamic-linker.patch     | 205 ++++++++++++++++
 .../gcc/gcc-4.9/0069-musl-no-fixincludes.patch     |  21 ++
 .../gcc/gcc-4.9/0070-libstdc-musl.patch            |  32 +++
 meta/recipes-devtools/gcc/gcc-5.2.inc              |   4 +
 .../gcc/gcc-5.2/0043-libstdc-musl.patch            |  32 +++
 .../gcc/gcc-5.2/0044-gcc-musl-support.patch        | 267 +++++++++++++++++++++
 .../gcc/gcc-5.2/0045-musl-dynamic-linker.patch     | 198 +++++++++++++++
 .../gcc/gcc-5.2/0046-musl-no-fixincludes.patch     |  22 ++
 meta/recipes-devtools/gdb/gdb.inc                  |   1 +
 ...0001-Use-exported-definitions-of-SIGRTMIN.patch |  54 +++++
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
 .../attr/files/dont-use-decl-macros.patch          |  56 +++++
 38 files changed, 1815 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/configure-musl-target.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-linedit-deluser-use-POSIX-getpwent-instead-of-getpwe.patch
 create mode 100644 meta/recipes-core/busybox/busybox/musl.cfg
 create mode 100644 meta/recipes-core/musl/musl.inc
 create mode 100644 meta/recipes-core/musl/musl_git.bb
 create mode 100644 meta/recipes-core/sysvinit/sysvinit/realpath.patch
 create mode 100644 meta/recipes-devtools/autoconf/autoconf/add_musl_config.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0067-gcc-musl-support.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0068-musl-dynamic-linker.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0069-musl-no-fixincludes.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0070-libstdc-musl.patch
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


