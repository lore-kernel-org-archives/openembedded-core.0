Received: from lgeamrelo12.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2706.1793747773097124924
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 15:16:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.52 with ESMTP; 4 Nov 2026 08:16:10 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.122.207)
	by 156.147.1.127 with ESMTP; 4 Nov 2026 08:16:10 +0900
X-Original-SENDERIP: 10.177.122.207
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	"mark.yang" <mark.yang@lge.com>
Subject: [PATCH 0/6] musl: support multilib
Date: Wed,  4 Nov 2026 08:16:01 +0900
Message-ID: <20261103231607.4021851-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2026 23:16:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249305
Content-Type: text/plain; charset="utf-8"

From: "mark.yang" <mark.yang@lge.com>

This series makes musl work with multilib ([YOCTO #13122]) and
reverts the multilib guard in musl.inc (4da308d37a).

What it fixes:
- gcc wrote the 64-bit musl loader as /usr/lib64/ld-musl-*.so.1, but
  musl installs it in nonarch_base_libdir. 64-bit programs could not
  start, and meson's sanity check failed.
- The multilib header wrapper used bits/wordsize.h, which glibc has
  and musl does not, so oe_multilib_header did not support musl.
  On musl the wrapper now checks which of bits/alltypes-32.h and -64.h
  the sysroot has, and uses the pointer size when it has both.
- Both variants installed /usr/bin/ldd as a link to their own libc.so,
  and rpm rejected them as a file conflict. ldd is now a script in an
  ldd package, as in glibc. It runs the loader with the same ELF class
  as the file.

Tested on qemuarm64 + lib32 armv7ahf and qemux86-64 + lib32 x86, with
usrmerge:
- ipk: core-image-minimal with lib32 packages, and
  lib32-core-image-minimal, on both machines
- rpm: core-image-minimal with lib32 packages on qemuarm64
- ipk: core-image-minimal on qemuarm64 without multilib

In qemu, 64-bit and 32-bit programs ran side by side, and ldd picked
the right loader for each. I also ran the commands from the oeqa ldd
test by hand, and they passed in every image.

Still open: SWIG recipes that read wrapped headers need
-D__MHWORDSIZE. python3-m2crypto (meta-python) is the one I found. I
will send that fix to meta-python.

mark.yang (6):
  gcc: point the musl dynamic linker at nonarch_base_libdir
  musl: wrap the bits headers for multilib
  multilib_header_wrapper.h: support musl
  multilib_header: wrap musl headers for multilib builds
  musl: make ldd work with multilib
  Revert "musl: Show error when used with multilibs"

 meta/classes-recipe/cross-canadian.bbclass    |  1 +
 meta/classes-recipe/cross.bbclass             |  1 +
 meta/classes-recipe/crosssdk.bbclass          |  1 +
 meta/classes-recipe/multilib_header.bbclass   |  2 +-
 meta/recipes-core/musl/musl.inc               |  6 ---
 meta/recipes-core/musl/musl/ldd               | 18 +++++++++
 meta/recipes-core/musl/musl_git.bb            | 21 ++++++++--
 meta/recipes-devtools/gcc/gcc-common.inc      |  1 +
 .../gcc/gcc-configure-common.inc              |  2 +
 .../gcc/gcc-multilib-config.inc               | 20 ++++++----
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 39 ++++++++++---------
 ...s-fix-v4bx-to-linker-to-support-EABI.patch |  2 +-
 scripts/multilib_header_wrapper.h             | 22 +++++++++--
 13 files changed, 95 insertions(+), 41 deletions(-)
 create mode 100644 meta/recipes-core/musl/musl/ldd

