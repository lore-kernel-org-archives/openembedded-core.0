Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id C9CCF73179
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 23:52:21 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id o11so4560685qge.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 15:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=crXehA5duumrLr4Mbj/Lahb8Cwx9MyAKZYhH/t/eAeQ=;
	b=Usl/RZHVT+K0qgLYY4vEgscVyyNE6CDngLvY0TImRt9hGBlqdE0f0uGOLDTKNMrlRG
	u784wDsO9hhpEdgZQaxxJ7pST9PjDCKuoTWmHtm+47Q1E7nYCYD2cdNQzrSQCvVaKRIG
	X1xWoLy4RzT9dF6pMvksvrBt/dFVsS0cF5PiGlg3bR/e0hNpthipR+suwqSt026HJ8dj
	EjvNB7m4atJFSHOrmVZ0m9dZlkDD2l7jtsUbtcf/wEnwjZI37kehY0x6ERZ9X/kTvz09
	2apSwOLy4GLldWRgUWfEtoFyQhXEVPovvLiC2WFxyxriFMmSMl7Y4JdpZfygr/wifPch
	fRwA==
X-Received: by 10.140.100.141 with SMTP id s13mr15023057qge.25.1450569141812; 
	Sat, 19 Dec 2015 15:52:21 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id o51sm974009qge.34.2015.12.19.15.52.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 19 Dec 2015 15:52:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Dec 2015 23:52:14 +0000
Message-Id: <cover.1450568936.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH 00/17] musl fixes phase 2
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
X-List-Received-Date: Sat, 19 Dec 2015 23:52:24 -0000

This set of fixes lets core-image-base/core-image-weston/core-image-sato
compile and boot using TCLIBC=musl

The following changes since commit e1a37899da56014693f08d1c39cb6ec0a4ed2bf4:

  buildstats-summary/toaster: Cope with removal of get_bn() (2015-12-18 13:50:54 +0000)

are available in the git repository at:

  git://github.com/kraj/openembedded-core kraj/musl-fixes
  https://github.com/kraj/openembedded-core/tree/kraj/musl-fixes

Khem Raj (17):
  powertop: Include right headers for timval struct
  dhcp: Include sys/types.h for u_int* defs
  blktrace: Include <sys/types.h for dev_t
  ppp: Fix build with musl
  tcp-wrappers: Fix build with musl
  tcmode-default: Use glibc for nativesdk version even on uclibc and
    musl
  libtirpc: Fix build for musl
  fts: Add recipe
  valgrind: Define __UCLIBC__ for uclibc based systems
  connman: include config.h for HAVE_STRUCT_IN6_PKTINFO_IPI6_ADDR
  libcgroup: Add dependency on fts when building on musl
  linux-libc-headers: Port patches for linux-headers for musl
  xserver-xorg: Fix build with musl
  gdk-pixbuf: Fix latent build  issue exposed by musl
  argp-standalone: Add recipe
  gnutls: Link with libargp on musl and depend on argp-standalone
  util-linux: Fix ptest builds on musl

 meta/conf/distro/include/tcmode-default.inc        |    4 +-
 .../0003-Fix-header-inclusions-for-musl.patch      |   79 +-
 .../dhcp/0001-include-missing-sys-types.h.patch    |   56 +
 meta/recipes-connectivity/dhcp/dhcp_4.3.2.bb       |    1 +
 .../ppp/ppp/0001-Fix-build-with-musl.patch         |  163 ++
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb         |    3 +
 meta/recipes-core/fts/fts.bb                       |   38 +
 .../fts/fts/fts-header-correctness.patch           |   20 +
 meta/recipes-core/fts/fts/fts-uclibc.patch         |   45 +
 meta/recipes-core/fts/fts/gcc5.patch               | 1363 +++++++++++++++
 meta/recipes-core/fts/fts/remove_cdefs.patch       |   64 +
 meta/recipes-core/fts/fts/stdint.patch             |   10 +
 .../libcgroup/libcgroup/musl-decls-compat.patch    |  235 +++
 meta/recipes-core/libcgroup/libcgroup_0.41.bb      |    4 +
 .../util-linux/uuid-test-error-api.patch           |   92 +
 meta/recipes-core/util-linux/util-linux_2.27.1.bb  |    1 +
 meta/recipes-devtools/valgrind/valgrind_3.10.1.bb  |    2 +
 ...rpcbynumber-and-getrpcbyname-if-those-are.patch |   89 +
 ...-use-of-internal-glibc-sys-cdefs.h-header.patch | 1754 ++++++++++++++++++++
 ...gure-option-to-disable-DES-authentication.patch |   99 ++
 ...-compile-error-IPPORT_RESERVED-undeclared.patch |   35 +
 ...0006-Define-struct-rpcent-on-non-GNU-libc.patch |   50 +
 .../libtirpc/libtirpc/0007-use-bsd-queue.patch     |  561 +++++++
 meta/recipes-extended/libtirpc/libtirpc/nis.h      |  545 ++++++
 meta/recipes-extended/libtirpc/libtirpc_0.2.5.bb   |   14 +
 .../tcp-wrappers/tcp-wrappers-7.6/musl-decls.patch |   31 +
 .../tcp-wrappers/tcp-wrappers_7.6.bb               |    4 +
 .../gdk-pixbuf/gdk-pixbuf/libc_memfuncs.patch      |   25 +
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.1.bb |    1 +
 .../xserver-xorg/musl-arm-inb-outb.patch           |   18 +
 .../xorg-xserver/xserver-xorg_1.18.0.bb            |    4 +-
 ...-include-sys-types.h-for-dev_t-definition.patch |   30 +
 meta/recipes-kernel/blktrace/blktrace_git.bb       |    4 +-
 ...mpat.h-fix-some-issues-arising-from-in6.h.patch |   81 +
 ...t.h-prevent-redefinition-of-struct-ethhdr.patch |   58 +
 ...remove-inclusion-of-sysinfo.h-in-kernel.h.patch |   31 +
 .../linux-libc-headers/linux-libc-headers_4.1.bb   |    5 +
 ...0001-include-rquired-headers-for-typedefs.patch |   45 +
 meta/recipes-kernel/powertop/powertop_2.8.bb       |    4 +-
 .../argp-standalone/argp-standalone_1.3.bb         |   28 +
 .../files/0001-throw-in-funcdef.patch              |   84 +
 .../argp-standalone/files/0002-isprint.patch       |   51 +
 meta/recipes-support/gnutls/gnutls.inc             |    2 +
 43 files changed, 5805 insertions(+), 28 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcp/dhcp/0001-include-missing-sys-types.h.patch
 create mode 100644 meta/recipes-connectivity/ppp/ppp/0001-Fix-build-with-musl.patch
 create mode 100644 meta/recipes-core/fts/fts.bb
 create mode 100644 meta/recipes-core/fts/fts/fts-header-correctness.patch
 create mode 100644 meta/recipes-core/fts/fts/fts-uclibc.patch
 create mode 100644 meta/recipes-core/fts/fts/gcc5.patch
 create mode 100644 meta/recipes-core/fts/fts/remove_cdefs.patch
 create mode 100644 meta/recipes-core/fts/fts/stdint.patch
 create mode 100644 meta/recipes-core/libcgroup/libcgroup/musl-decls-compat.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/uuid-test-error-api.patch
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0002-Provide-getrpcbynumber-and-getrpcbyname-if-those-are.patch
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0003-Avoid-use-of-internal-glibc-sys-cdefs.h-header.patch
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0004-Add-configure-option-to-disable-DES-authentication.patch
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0005-Fix-compile-error-IPPORT_RESERVED-undeclared.patch
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0006-Define-struct-rpcent-on-non-GNU-libc.patch
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/0007-use-bsd-queue.patch
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/nis.h
 create mode 100644 meta/recipes-extended/tcp-wrappers/tcp-wrappers-7.6/musl-decls.patch
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/libc_memfuncs.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/musl-arm-inb-outb.patch
 create mode 100644 meta/recipes-kernel/blktrace/blktrace/0001-include-sys-types.h-for-dev_t-definition.patch
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0001-libc-compat.h-fix-some-issues-arising-from-in6.h.patch
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0002-libc-compat.h-prevent-redefinition-of-struct-ethhdr.patch
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers/0003-remove-inclusion-of-sysinfo.h-in-kernel.h.patch
 create mode 100644 meta/recipes-kernel/powertop/powertop/0001-include-rquired-headers-for-typedefs.patch
 create mode 100644 meta/recipes-support/argp-standalone/argp-standalone_1.3.bb
 create mode 100644 meta/recipes-support/argp-standalone/files/0001-throw-in-funcdef.patch
 create mode 100644 meta/recipes-support/argp-standalone/files/0002-isprint.patch

-- 
2.6.4


