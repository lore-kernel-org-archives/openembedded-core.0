Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4309674D40
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 May 2018 00:14:10 +0000 (UTC)
Received: by mail-pg0-f41.google.com with SMTP id g20-v6so9770949pgv.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 17:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=HI+niJHM9f2yWGHtcLi/KIAkfHDIkXFe/HuFobzOuMM=;
	b=bZB0mDA6IG2DlKc95CXUO0BJlR2pXV62E+1Gl5orBs6IwVstzwk6cdQ47nWr2WMBiL
	SKzn32sj/W1yBeRprDvSmhdiQjJzjDl61NnTgfSPW8z0+wGbz5rLiJQxEWTMM0Z0aXdi
	gPQa5iJSU0g94H5p3psWyh5uWcQFeXelG4XJiodLAZfrPb5hQhhqsH6SfUzQiRPeqbGL
	ZwWJz0pqhb2QB9Nsdy2hdHS6orQITf1kvdQlFm0FAkHAOM4J9IC3C/dBXjDl0qpmx9A6
	vw0iM9PPomqVM8d4pI2RIMuHkHGxHcIh51r7oftsxyBp7KOM7K3VBAAJDLz5ElG/GdAo
	JLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HI+niJHM9f2yWGHtcLi/KIAkfHDIkXFe/HuFobzOuMM=;
	b=Zy3c4A8VK0Rudi9H8xLM2loIz0+u5eD5nTDNTpXxvJZnvEA/IvVwuo56c78iqNUTZ1
	dVMev0Wv/tBJYDHl6LxkvoVCKH0Sm52ZxH+bxhJN3fWYOdeZxZiDMK+gbEqtHDqIwizX
	OTqqMRJUKCn/8ttTRppr4O33VEFI6+i6frpb4aJp3/Xu6bpaz2wCgTgHPIkPSRPH9o9v
	TGl4Sb7vvR/B6+7+xjdQSo7xM92+EJWGtaJes5/iaL2sRgOol+eVZw5gQVZAakpagaGo
	CwKWpcMXumygaQ2F++WHwIQro1dVAZMApXzC/5FAcWZIERwpDojWWZon9WfP1TA/rgGU
	dwPg==
X-Gm-Message-State: ALQs6tCUw60wJXsys39qDoqSdXKtE+PeqZoRFN4phR5PQQ9PML/bnaXg
	8PKCNeEzNAyr4XSdRYLXaHxWDQ==
X-Google-Smtp-Source: AB8JxZqFulZ2uUbtqP2clQcZousMK/noTLQN4dx7qXQg+GnpP6Wp1/wEt90ESMAiLiek2HTfZMwqTg==
X-Received: by 10.98.91.2 with SMTP id p2mr20527702pfb.96.1525479250895;
	Fri, 04 May 2018 17:14:10 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	j14sm11487860pfn.151.2018.05.04.17.14.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 May 2018 17:14:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 17:14:06 -0700
Message-Id: <cover.1525478935.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH V2 00/27] ssp rework and glibc drop obsolete nsl/rpc
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
X-List-Received-Date: Sat, 05 May 2018 00:14:10 -0000

This patchset is primarily fixing how we use ssp support
in system runtime, Now we use the glibc/musl version consistently and suppliment
musl implementation with libssp_nonshared.a due to gcc needing it. mingw will
use the gcc implementation of libssp

Second major change is to drop the obsoleted features of glibc
we have been carrying them for some releases now and its time to
drop the ball on rpc/nsl eventually in a followup when we upgrade to glibc
2.28 we should drop crypt as well, this also means that the changes we did
for musl for rpc/nsl can now we applied generally and thats evident from
few commits in the series

Added libnss-nis and rpcsvc-proto for stubborn recipes until they migrate
to use libtirpc

Few upgrades are generally helping gcc8 upgrade which I will post separately
once this patchset is baked and applied.

This series have been tested with poky-lsb/core-image-sato on all qemu
machines with both musl/glibc combinations

The following changes since commit ae8b78f2ef5df4b24f8e2294c5e2760367b8bf8d:

  settings-daemon: Drop pointless apply=yes in SRC_URI (2018-05-04 09:55:00 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/pu
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/pu

Khem Raj (27):
  libssp-nonshared: Add recipe
  musl: Depend on libssp-nonshared
  gcc-runtime: Disable gcc version of libssp
  libunwind: Drop adding libssp to linker flags
  musl: Upgrade to latest
  pbzip2: Fix C++11 warnings found with clang
  alsa-tools: Update to 1.1.6
  alsa-lib: Upgrade to 1.1.6
  glibc: Drop obsolete rpc and libnsl
  rpcsvc-proto: Add recipe
  libnss-nis: Add recipe
  libtirpc: Upgrade to 1.0.4-tc1
  libnsl: Upgrade to tip beyond 1.2.0 release
  ltp: Fix build after removing rpc and libnsl in glibc
  xinetd: Use libtirpc even on glibc
  tcp-wrapper: Use external libnsl
  Use libtirpc even on glibc
  perl: Account for libnsl being dropped from glibc
  mdadm: Fix build with gcc8
  libnsl2: Install into /usr/include and /usr/lib
  ppp: Install net/ppp_defs.h on musl
  allarch.bbclass: Exclude package_do_shlibs from do_package signature
  packagegroup: Do not add libssp to SDK
  Disable using GST_GL if gst does not enable it
  mesa: Define PYTHON2
  strace: Upgrade to 4.22
  gdb: Upgrade to 8.1 release

 meta/classes/allarch.bbclass                  |   1 +
 meta/classes/libc-common.bbclass              |   4 -
 .../distro/include/default-distrovars.inc     |   2 +-
 meta/conf/distro/include/maintainers.inc      |   2 +
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 meta/conf/local.conf.sample.extended          |   2 +-
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb    |   4 +
 .../glibc/cross-localedef-native_2.27.bb      |   1 -
 meta/recipes-core/glibc/glibc-initial.inc     |   4 +-
 meta/recipes-core/glibc/glibc-package.inc     |   5 +-
 meta/recipes-core/glibc/glibc.inc             |   4 -
 .../0021-eglibc-Install-PIC-archives.patch    | 123 ---
 meta/recipes-core/glibc/glibc_2.27.bb         |  18 +-
 meta/recipes-core/musl/libssp-nonshared.bb    |  39 +
 .../musl/libssp-nonshared/ssp-local.c         |  45 +
 meta/recipes-core/musl/musl_git.bb            |   5 +-
 ...packagegroup-core-standalone-sdk-target.bb |   2 +-
 .../packagegroups/packagegroup-self-hosted.bb |  11 +-
 meta/recipes-devtools/gcc/gcc-7.3.inc         |   7 +-
 ...cc-override-TARGET_LIBC_PROVIDES_SSP.patch | 204 ++++
 meta/recipes-devtools/gcc/gcc-runtime.inc     |   4 +-
 .../gdb/{gdb-8.0.1.inc => gdb-8.1.inc}        |   5 +-
 ...ian_8.0.1.bb => gdb-cross-canadian_8.1.bb} |   0
 .../{gdb-cross_8.0.1.bb => gdb-cross_8.1.bb}  |   0
 .../0001-include-sys-types.h-for-mode_t.patch |  12 +-
 ...port-for-Renesas-SH-sh4-architecture.patch | 153 ++-
 ...0012-Unbreak-GDBserver-build-for-x32.patch | 101 --
 .../gdb/{gdb_8.0.1.bb => gdb_8.1.bb}          |   0
 meta/recipes-devtools/perl/perl_5.24.1.bb     |   2 +-
 .../strace/disable-git-version-gen.patch      |  12 +-
 ...st-test-for-m32-mx32-compile-support.patch |  22 +-
 .../strace/{strace_4.20.bb => strace_4.22.bb} |  11 +-
 .../0001-include-sys-cdefs.h-explicitly.patch |  68 --
 ...de-stdint.h-for-uintptr_t-definition.patch |  27 -
 .../0002-Define-glibc-specific-macros.patch   |  57 --
 meta/recipes-extended/libnsl/libnsl2_git.bb   |  19 +-
 .../recipes-extended/libnss-nis/libnss-nis.bb |  36 +
 .../0001-include-stdint.h-for-uintptr_t.patch |  29 -
 ...0001-replace-__bzero-with-memset-API.patch |  64 --
 .../libtirpc/Use-netbsd-queue.h.patch         | 878 ------------------
 .../export_key_secretkey_is_set.patch         |  31 -
 .../libtirpc/libtirpc-1.0.4-rc1.patch         | 103 ++
 .../libtirpc/libtirpc/musl.patch              |  18 +
 .../{libtirpc_1.0.2.bb => libtirpc_1.0.3.bb}  |  13 +-
 ...0001-Disable-rpc01-on-glibc-and-musl.patch |  29 +
 ...option-to-select-libc-implementation.patch |  14 -
 meta/recipes-extended/ltp/ltp_20180118.bb     |   1 +
 ...able-errors-due-to-new-gcc8-warnings.patch |  30 +
 ...tead-of-memcpy-on-overlapping-region.patch |  31 +
 meta/recipes-extended/mdadm/mdadm_4.0.bb      |   2 +
 ...valid-suffix-on-literal-C-11-warning.patch |  73 ++
 meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb |   4 +-
 .../rpcsvc-proto/rpcsvc-proto.bb              |  37 +
 .../0001-Use-cross-compiled-rpcgen.patch      |  26 +
 .../tcp-wrappers/tcp-wrappers_7.6.bb          |   2 +-
 .../watchdog/watchdog_5.15.bb                 |  11 +-
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb |   7 +-
 meta/recipes-graphics/mesa/mesa.inc           |   1 +
 .../{alsa-lib_1.1.5.bb => alsa-lib_1.1.6.bb}  |   9 +-
 ...served-user-defined-literal-warnings.patch |  28 +
 .../alsa/alsa-tools/autotools.patch           |  42 +-
 ...lsa-tools_1.1.5.bb => alsa-tools_1.1.6.bb} |  25 +-
 .../webkitgtk/detect-gstreamer-gl.patch       |  20 +
 meta/recipes-sato/webkit/webkitgtk_2.20.0.bb  |   1 +
 meta/recipes-support/libunwind/libunwind.inc  |   2 -
 65 files changed, 933 insertions(+), 1612 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0021-eglibc-Install-PIC-archives.patch
 create mode 100644 meta/recipes-core/musl/libssp-nonshared.bb
 create mode 100644 meta/recipes-core/musl/libssp-nonshared/ssp-local.c
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0049-gcc-override-TARGET_LIBC_PROVIDES_SSP.patch
 rename meta/recipes-devtools/gdb/{gdb-8.0.1.inc => gdb-8.1.inc} (85%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_8.0.1.bb => gdb-cross-canadian_8.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_8.0.1.bb => gdb-cross_8.1.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0012-Unbreak-GDBserver-build-for-x32.patch
 rename meta/recipes-devtools/gdb/{gdb_8.0.1.bb => gdb_8.1.bb} (100%)
 rename meta/recipes-devtools/strace/{strace_4.20.bb => strace_4.22.bb} (85%)
 delete mode 100644 meta/recipes-extended/libnsl/libnsl2/0001-include-sys-cdefs.h-explicitly.patch
 delete mode 100644 meta/recipes-extended/libnsl/libnsl2/0001-nis_call.c-Include-stdint.h-for-uintptr_t-definition.patch
 delete mode 100644 meta/recipes-extended/libnsl/libnsl2/0002-Define-glibc-specific-macros.patch
 create mode 100644 meta/recipes-extended/libnss-nis/libnss-nis.bb
 delete mode 100644 meta/recipes-extended/libtirpc/libtirpc/0001-include-stdint.h-for-uintptr_t.patch
 delete mode 100644 meta/recipes-extended/libtirpc/libtirpc/0001-replace-__bzero-with-memset-API.patch
 delete mode 100644 meta/recipes-extended/libtirpc/libtirpc/Use-netbsd-queue.h.patch
 delete mode 100644 meta/recipes-extended/libtirpc/libtirpc/export_key_secretkey_is_set.patch
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/libtirpc-1.0.4-rc1.patch
 create mode 100644 meta/recipes-extended/libtirpc/libtirpc/musl.patch
 rename meta/recipes-extended/libtirpc/{libtirpc_1.0.2.bb => libtirpc_1.0.3.bb} (63%)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-Disable-rpc01-on-glibc-and-musl.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-Disable-errors-due-to-new-gcc8-warnings.patch
 create mode 100644 meta/recipes-extended/mdadm/files/0001-use-memmove-instead-of-memcpy-on-overlapping-region.patch
 create mode 100644 meta/recipes-extended/pbzip2/pbzip2/0001-pbzip2-Fix-invalid-suffix-on-literal-C-11-warning.patch
 create mode 100644 meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
 create mode 100644 meta/recipes-extended/rpcsvc-proto/rpcsvc-proto/0001-Use-cross-compiled-rpcgen.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.1.5.bb => alsa-lib_1.1.6.bb} (75%)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-tools/0002-Fix-clang-Wreserved-user-defined-literal-warnings.patch
 rename meta/recipes-multimedia/alsa/{alsa-tools_1.1.5.bb => alsa-tools_1.1.6.bb} (62%)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/detect-gstreamer-gl.patch

-- 
2.17.0


