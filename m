Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 99DE66AC1E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 20:03:27 +0000 (UTC)
Received: by iodt126 with SMTP id t126so162637140iod.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 13:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=zJEjJEp4javeqH8tGyVyLqRcSNjI+0MY5HvRhqvCiIQ=;
	b=RGjdQ6O41itQynl/rMdPn2RGd2F5r1wzkCBklaScyZJ8Ke81gSJC/nXogo4Ud8dRcX
	+b7YeXsM4uIUzR/TYU9wX9XP92m4k89zY6dfBeyEXM1QNuZHtCD0XlQqtQj/iHXigUPn
	F5ej3ucSL3Cw5qVNf+6PDKEAWCTciBoV01WG6ToHbPuDJ9La9d92j0B0iIljor1Tz1MV
	67foOhwGKyfVV23p5/vgqTB0Q49MUmRg8f892wbRumEi7MBl6NmtHElb5kvLvxd43fZm
	aIB/OzODnxXaKHyrY4WCz4zSgWacZYR01TnbH5Hjv33k9Y7wrrQZ1BzxiDQ5gMr/vLzZ
	X+cQ==
X-Received: by 10.107.40.200 with SMTP id o191mr1528229ioo.83.1440446607354;
	Mon, 24 Aug 2015 13:03:27 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by smtp.gmail.com with ESMTPSA id z5sm9533313igl.21.2015.08.24.13.03.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 13:03:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 13:03:21 -0700
Message-Id: <cover.1440446289.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 00/17] systemd upgrade, distribute->setuptools and clang fixes
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
X-List-Received-Date: Mon, 24 Aug 2015 20:03:28 -0000

This is a cumulative series containing

first three and then patch 11 and 12  patches are for systemd upgrade to 224
last two patches deal with distribute to setuptools change
Rest of them improve the recipes in way so they work with clang compiler


Khem Raj (17):
  systemd: Upgrade 219 -> 224
  core-image-minimal: Add 4M extra space when using systemd
  systemd: Cache/define tool paths for target
  kernel-arch: Force BFD kernel when using gcc for linking
  sysvinit: Fix makefile bug found with clang
  alsa-lib: Lift the limitation to use gcc only cross compiler
  json-c: Include math_compat.c for NAN/INF values
  libvorbis: Update libvorbis_1.3.4.bb -> libvorbis_1.3.5.bb
  psplash: Turn psplash_fb_plot_pixel() into static inline
  mdadm: Upgrade mdadm_3.3.2.bb -> mdadm_3.3.4.bb
  bitbake.conf: Define fallback DISTRO_NAME
  systemd: Remove exporting special CPP
  diffstat: Add TOOLCHAIN_OPTIONS to Linker calls
  liburcu: Fix atomic function parameter types in calls
  busybox: Use CC instead of bare LD to be the Linker
  python-distribute,python-setuptools: Migrate to good old
    python-setuptools
  classes,conf: Remove python-distribute refrences

 meta/classes/kernel-arch.bbclass                   |   2 +-
 meta/classes/setuptools.bbclass                    |   2 +-
 meta/conf/bitbake.conf                             |  20 +--
 meta/conf/distro/include/distro_alias.inc          |   2 -
 meta/conf/distro/include/package_regex.inc         |   4 -
 ...-linking-instead-of-LD-and-use-CFLAGS-and.patch | 121 ++++++++++++++
 .../busybox/0002-Passthrough-r-to-linker.patch     |  32 ++++
 meta/recipes-core/busybox/busybox_1.23.2.bb        |   2 +
 meta/recipes-core/images/core-image-minimal.bb     |   2 +-
 ...Convert-psplash_fb_plot_pixel-to-a-static.patch |  53 ++++++
 meta/recipes-core/psplash/psplash_git.bb           |   1 +
 ...-mount-add-dependencies-to-dynamically-mo.patch |  36 ----
 ...ed-missing.h-fall-back-to-insecure-getenv.patch |  25 ---
 ...t-install-dependency-links-at-install-tim.patch |  35 ++--
 ...heck-for-additional-features-that-uclibc-.patch |  23 ++-
 ...wn-Use-execvpe-only-when-libc-supports-it.patch |  37 ++---
 ...til-Use-mkostemp-only-if-libc-supports-it.patch |   8 +-
 ...-unimplemented-_SC_PHYS_PAGES-system-conf.patch |   8 +-
 ...0-Make-root-s-home-directory-configurable.patch | 136 ++++++++-------
 ...files.c-Honor-ordering-within-files-as-th.patch | 185 ---------------------
 ...-remove-userspace-firmware-loading-suppor.patch |  99 ++++++-----
 .../systemd/systemd/tmpfiles-pam.patch             |  30 ----
 .../systemd/{systemd_219.bb => systemd_224.bb}     |  38 +++--
 ...an-issue-that-clang-reports-about-mutlipl.patch |  52 ++++++
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |   1 +
 meta/recipes-devtools/diffstat/diffstat_1.60.bb    |   2 +
 .../0001-json_tokener-requires-INF-and-NAN.patch   |  37 +++++
 meta/recipes-devtools/json-c/json-c_0.12.bb        |   6 +-
 .../python/python-distribute_0.6.32.bb             |  63 -------
 .../python/python-setuptools_18.2.bb               |  46 +++++
 ...tuptools_15.2.bb => python3-setuptools_18.2.bb} |   0
 meta/recipes-extended/mdadm/files/inline.patch     |  39 -----
 .../mdadm/files/mdadm-3.3.2_x32_abi_time_t.patch   |  23 ++-
 .../mdadm/{mdadm_3.3.2.bb => mdadm_3.3.4.bb}       |   6 +-
 ...build-Do-not-try-to-detect-cross-compiler.patch |  45 +++++
 meta/recipes-multimedia/alsa/alsa-lib_1.0.29.bb    |   1 +
 .../{libvorbis_1.3.4.bb => libvorbis_1.3.5.bb}     |   7 +-
 ...cify-complete-types-for-atomic-function-c.patch | 158 ++++++++++++++++++
 meta/recipes-support/liburcu/liburcu_0.8.7.bb      |   1 +
 39 files changed, 769 insertions(+), 619 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-Use-CC-when-linking-instead-of-LD-and-use-CFLAGS-and.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0002-Passthrough-r-to-linker.patch
 create mode 100644 meta/recipes-core/psplash/files/0001-psplash-fb-Convert-psplash_fb_plot_pixel-to-a-static.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0001-Revert-core-mount-add-dependencies-to-dynamically-mo.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0002-shared-missing.h-fall-back-to-insecure-getenv.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/0012-systemd-tmpfiles.c-Honor-ordering-within-files-as-th.patch
 delete mode 100644 meta/recipes-core/systemd/systemd/tmpfiles-pam.patch
 rename meta/recipes-core/systemd/{systemd_219.bb => systemd_224.bb} (94%)
 create mode 100644 meta/recipes-core/sysvinit/sysvinit/0001-This-fixes-an-issue-that-clang-reports-about-mutlipl.patch
 create mode 100644 meta/recipes-devtools/json-c/json-c/0001-json_tokener-requires-INF-and-NAN.patch
 delete mode 100644 meta/recipes-devtools/python/python-distribute_0.6.32.bb
 create mode 100644 meta/recipes-devtools/python/python-setuptools_18.2.bb
 rename meta/recipes-devtools/python/{python3-setuptools_15.2.bb => python3-setuptools_18.2.bb} (100%)
 delete mode 100644 meta/recipes-extended/mdadm/files/inline.patch
 rename meta/recipes-extended/mdadm/{mdadm_3.3.2.bb => mdadm_3.3.4.bb} (92%)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0001-build-Do-not-try-to-detect-cross-compiler.patch
 rename meta/recipes-multimedia/libvorbis/{libvorbis_1.3.4.bb => libvorbis_1.3.5.bb} (78%)
 create mode 100644 meta/recipes-support/liburcu/liburcu/0001-uatomic-Specify-complete-types-for-atomic-function-c.patch

-- 
2.1.4


