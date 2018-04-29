Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id C3E50601F6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 19:35:47 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id q22so5125507pff.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 12:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=/lp0Pwu6I7yOvHST8/JwfGAUS5E6IV5rr2/s8xlsjlc=;
	b=RgmosKpcTZW7JiwWkbUwhG54GndKb6jEYsavPWoRh1s68ysOZVMlMfOgsdu1q8CVXN
	Afi/zp+2kanbW/co0h73nyHrkAswIfEhqbQ0pbxU3cjMVwu10Y0CLQvc9mTIE+JovrWT
	4vTP023NBcLUjd2LE7H/+iJFWo37jGobMuXkTM444lFFySxTB5Q/xwkitkc/MQR6kEj7
	eQ/9nbwo3emLqNS7WveNwXxe56dJUtyAv3FG5gKM6N/3KpHxVE4BjXxTx7gPBQV2ug18
	NO91DkrjP6v+eCMcMebkMya5hMfLPtEav4IT7EbK5afj9OKdCRH255RMVWv4qu+mQGi2
	gXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/lp0Pwu6I7yOvHST8/JwfGAUS5E6IV5rr2/s8xlsjlc=;
	b=fO4mp01K+DF8D87gXS4R4//yeMT2mYeAbVZfGAVqbt18EHXZV1PnCU/Li5+fVVWr/S
	/vTTeuxsU1YeMhd1Rw0zQGw0fLiOkF8e/LuYPUCClhtpGlRUhySGtETLm14uU5Em/gFO
	qL2fqQxQLCDQZttcOJLY1cSoGnDYx71goJquI1xVSUdcU0IPdNdk4o5gitWD/IjXInoe
	QkxamS/+L57vJ42D1mdCoj2wAvXfVHhBbvj1mPgQUZK9I7i2fY+7nBB1SJ6nbhonUd8e
	qayKs7ujpiVAYKC/+Eqfx7j21ZuY088/rlp4OhCk7K7UEtUd3VtKRUABydFD4LlvQPzx
	cURA==
X-Gm-Message-State: ALQs6tBnvyIs6rdxSKsmdnCSVp638yzVLZcxwNkKO+Wl7thyMzAJbq2j
	E+lROhLZBIIt7ukEk+Ng9cL/Uw==
X-Google-Smtp-Source: AB8JxZodQ92FmwrqwX8pHh/qMs/21rVIv0AqhK8cdGsBFWZW4QMgdU9SOVRyQA1nyprZqshZpNxJVw==
X-Received: by 2002:a17:902:8b82:: with SMTP id
	ay2-v6mr6869389plb.295.1525030548067; 
	Sun, 29 Apr 2018 12:35:48 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::ddd5])
	by smtp.gmail.com with ESMTPSA id
	u86sm12267657pfg.71.2018.04.29.12.35.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Apr 2018 12:35:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Apr 2018 12:35:42 -0700
Message-Id: <cover.1525029885.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH 00/24] ssp rework and glibc drop obsolete nsl/rpc
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
X-List-Received-Date: Sun, 29 Apr 2018 19:35:47 -0000

This patchset is primarily fixing how we generate use and generate ssp support
in system runtime, we use the glibc/musl version consistently and suppliment
musl implementation with libssp_nonshared.a due to gcc needing it.

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


The following changes since commit 1b03cdf290c3c8b7f903aef696b0e1bfe763cbe0:

  build-appliance-image: Update to sumo head revision (2018-04-23 17:54:13 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/pu
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/pu

Khem Raj (24):
  libssp-nonshared: Add recipe
  musl: Depend on libssp-nonshared
  gcc-runtime: Disable gcc version of libssp
  libunwind: Drop adding libssp to linker flags
  musl: Upgrade to latest
  llvm: Fix [compile-host-path] QA issue
  pbzip2: Fix C++11 warnings found with clang
  alsa-tools: Update to 1.1.6
  alsa-lib: Upgrade to 1.1.6
  ruby: Upgrade to 1.5.1
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

 meta/classes/allarch.bbclass                  |   1 +
 meta/classes/libc-common.bbclass              |   4 -
 .../distro/include/default-distrovars.inc     |   2 +-
 meta/conf/distro/include/maintainers.inc      |   2 +
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
 meta/recipes-devtools/gcc/gcc-7.3.inc         |   7 +-
 ...cc-override-TARGET_LIBC_PROVIDES_SSP.patch | 204 ++++
 meta/recipes-devtools/gcc/gcc-runtime.inc     |   4 +-
 ...able-generating-a-native-llvm-config.patch |  41 +
 meta/recipes-devtools/llvm/llvm_git.bb        |   7 +-
 meta/recipes-devtools/perl/perl_5.24.1.bb     |   2 +-
 meta/recipes-devtools/ruby/ruby.inc           |  11 +-
 .../ruby/{ruby_2.5.0.bb => ruby_2.5.1.bb}     |   4 +-
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
 .../{alsa-lib_1.1.5.bb => alsa-lib_1.1.6.bb}  |   9 +-
 ...served-user-defined-literal-warnings.patch |  28 +
 .../alsa/alsa-tools/autotools.patch           |  42 +-
 ...lsa-tools_1.1.5.bb => alsa-tools_1.1.6.bb} |  25 +-
 meta/recipes-support/libunwind/libunwind.inc  |   2 -
 53 files changed, 852 insertions(+), 1403 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0021-eglibc-Install-PIC-archives.patch
 create mode 100644 meta/recipes-core/musl/libssp-nonshared.bb
 create mode 100644 meta/recipes-core/musl/libssp-nonshared/ssp-local.c
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0049-gcc-override-TARGET_LIBC_PROVIDES_SSP.patch
 create mode 100644 meta/recipes-devtools/llvm/llvm/0001-Disable-generating-a-native-llvm-config.patch
 rename meta/recipes-devtools/ruby/{ruby_2.5.0.bb => ruby_2.5.1.bb} (90%)
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

-- 
2.17.0


