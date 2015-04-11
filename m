Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6915A72D74
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Apr 2015 01:20:40 +0000 (UTC)
Received: by pabtp1 with SMTP id tp1so37738078pab.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 18:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=O9Ct7YikSsbUExGm2S4uy6ZpRiPTYQYzNSvUXLVPWnY=;
	b=zHryr3gu9fwSTjj+tulhTFLGtZVOmkjHLKPw9WKzCscFVIR6VWQom6x06c0xfLpzHp
	srZs7hATB96NAQ1mXvKk3Pj9V50QEm81WGOz4hIlJDPN9x+MpboSjFtnWe6JZWRcuDzl
	1KG6P3cK+Otdiz2AYwxCvnuEksxxxkVWLui7Dx518ZEpgG4E+0BW7h6M3HR7ILu8Qj1I
	YRCMM8iOSlq/Vtjnu5jd0/VJ6sN8zChB9PWOKV8qweBU/c2mn63Wj/bs/5Bb5ZugmfW6
	rlkGCc3jsoTYre7cr/UsQUON5z5NHY6Ftc/mLWBE4DfMXI0rZ2hs9/8+DjIIUyd8D9rj
	fGfw==
X-Received: by 10.69.26.67 with SMTP id iw3mr7079813pbd.151.1428715242084;
	Fri, 10 Apr 2015 18:20:42 -0700 (PDT)
Received: from iMac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169])
	by mx.google.com with ESMTPSA id nw14sm261873pab.39.2015.04.10.18.20.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 10 Apr 2015 18:20:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Apr 2015 18:20:33 -0700
Message-Id: <cover.1428714999.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Cc: Khem Raj <khem_raj@cable.comcast.com>
Subject: [PATCH 00/17] musl fixes to run core-image-sato and core-image-weston
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
X-List-Received-Date: Sat, 11 Apr 2015 01:20:41 -0000

This is further patchset to enable core-image-sato and core-image-weston
to build and boot on qemux86 and qemumips

volatile mount patch is for ro-rfs with systemd

gdb patches are generated against git tree for better upstreamablity

e2fsprogs is general improvement

Khem Raj (17):
  mtd-utils: update to latest and fix static inlining
  var/volatile: Mount it if doing ro-rfs
  libproxy: Include select.h for posix compliance
  ppp: Add extra include dirs
  musl: Enable NLS
  vte: Pass _GNU_SOURCE via CFLAGS
  libfm-extra: Add own nls.m4
  connman: Fix builds to compile on musl
  perl: Fix build for musl
  iptables: Fix build on musl
  xserver-xorg: Use __GLIBC__ instread of __linux__ to denote glibc
    dependent code
  pulseaudio: Fix build with musl
  sudo: Disable hardening for musl
  xserver-xf86-config: Preload graphics driver modules for musl
  kbd: Mark glibc headers under __GLIBC__
  gdb: Refresh patches against git
  e2fsprogs: Delete identical binaries and create symlinks instead

 meta/classes/image.bbclass                         |   1 +
 meta/conf/distro/include/tclibc-musl.inc           |   2 +-
 ...cktrace-API-only-when-compiling-for-glibc.patch |  41 +
 .../connman/connman/0002-musl-header-fixes.patch   | 235 ++++++
 ...resolve-musl-does-not-implement-res_ninit.patch |  77 ++
 ...Fix-duplicate-definitions-issue-with-musl.patch |  43 ++
 meta/recipes-connectivity/connman/connman_1.28.bb  |   4 +
 meta/recipes-connectivity/ppp/ppp_2.4.7.bb         |   6 +-
 meta/recipes-core/base-files/base-files/fstab      |   1 -
 .../initscripts-1.0/read-only-rootfs-hook.sh       |   2 +-
 ...-Only-inluclude-kernel-headers-with-glibc.patch |  29 +
 meta/recipes-core/kbd/kbd_2.0.2.bb                 |   1 +
 .../systemd/systemd/journald-volatile.conf         |   6 +
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb |   8 +
 meta/recipes-devtools/gdb/gdb-cross_7.9.bb         |   2 +-
 meta/recipes-devtools/gdb/gdb.inc                  |   5 +-
 ...0001-make-man-install-relative-to-DESTDIR.patch |  28 +
 ...last.diff => 0002-Change-order-of-CFLAGS.patch} |  23 +-
 ...-support-for-Renesas-SH-sh4-architecture.patch} | 835 +++++----------------
 .../gdb/0004-Change-comment-in-gdb-compile.patch   |  48 ++
 .../recipes-devtools/gdb/gdb/sim-install-6.6.patch |  14 -
 meta/recipes-devtools/gdb/gdb/sim-install.patch    |  36 -
 meta/recipes-devtools/gdb/gdb/uclibc.patch         | 196 -----
 ...emove-duplicate-hashtable_iterator_value-.patch |  64 ++
 meta/recipes-devtools/mtd/mtd-utils_git.bb         |   1 +
 meta/recipes-devtools/perl/perl_5.20.0.bb          |  23 +
 .../iptables/0001-fix-build-with-musl.patch        |  89 +++
 meta/recipes-extended/iptables/iptables_1.4.21.bb  |   1 +
 meta/recipes-extended/sudo/sudo.inc                |   2 +
 .../xserver-xf86-config/10-preload-modules.conf    |   9 +
 .../xorg-xserver/xserver-xf86-config_0.1.bb        |   9 +
 ...e-__GLIBC__-guard-for-glibc-specific-code.patch |  31 +
 .../xorg-xserver/xserver-xorg_1.16.3.bb            |   1 +
 .../0001-padsp-Make-it-compile-on-musl.patch       |  70 ++
 .../pulseaudio/pulseaudio_6.0.bb                   |   1 +
 .../0001-nls.m4-Take-it-from-gettext-0.15.patch    |  54 ++
 meta/recipes-support/libfm/libfm-extra_1.2.3.bb    |   4 +-
 ...0001-test-Include-sys-select.h-for-select.patch |  37 +
 meta/recipes-support/libproxy/libproxy_0.4.11.bb   |   1 +
 meta/recipes-support/vte/vte_0.28.2.bb             |   2 +
 40 files changed, 1136 insertions(+), 906 deletions(-)
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-Enable-backtrace-API-only-when-compiling-for-glibc.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/0002-musl-header-fixes.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/0003-resolve-musl-does-not-implement-res_ninit.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/0004-tethering-Fix-duplicate-definitions-issue-with-musl.patch
 create mode 100644 meta/recipes-core/kbd/kbd/0003-Only-inluclude-kernel-headers-with-glibc.patch
 create mode 100644 meta/recipes-core/systemd/systemd/journald-volatile.conf
 create mode 100644 meta/recipes-devtools/gdb/gdb/0001-make-man-install-relative-to-DESTDIR.patch
 rename meta/recipes-devtools/gdb/gdb/{gdbserver-cflags-last.diff => 0002-Change-order-of-CFLAGS.patch} (55%)
 rename meta/recipes-devtools/gdb/gdb/{renesas-sh-native-support.patch => 0003-Add-support-for-Renesas-SH-sh4-architecture.patch} (60%)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0004-Change-comment-in-gdb-compile.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/sim-install-6.6.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/sim-install.patch
 delete mode 100644 meta/recipes-devtools/gdb/gdb/uclibc.patch
 create mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-hashtable-Remove-duplicate-hashtable_iterator_value-.patch
 create mode 100644 meta/recipes-extended/iptables/iptables/0001-fix-build-with-musl.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/10-preload-modules.conf
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-use-__GLIBC__-guard-for-glibc-specific-code.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-padsp-Make-it-compile-on-musl.patch
 create mode 100644 meta/recipes-support/libfm/libfm-extra/0001-nls.m4-Take-it-from-gettext-0.15.patch
 create mode 100644 meta/recipes-support/libproxy/libproxy/0001-test-Include-sys-select.h-for-select.patch

-- 
2.1.4


