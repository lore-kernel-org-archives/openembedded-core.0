Received: from lgeamrelo12.lge.com (lgeamrelo12.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9772.1793273914891284375
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 04:38:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
	by 156.147.23.52 with ESMTP; 29 Oct 2026 20:38:32 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.122.207)
	by 156.147.1.151 with ESMTP; 29 Oct 2026 20:38:32 +0900
X-Original-SENDERIP: 10.177.122.207
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [RFC PATCH 0/4] musl multilib: loader path and headers
Date: Thu, 29 Oct 2026 20:38:25 +0900
Message-ID: <20261029113829.2806167-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 11:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248935
Content-Type: text/plain; charset="utf-8"

From: "mark.yang" <mark.yang@lge.com>

This series fixes the loader path and the headers for musl multilib
([YOCTO #13122]). It is not complete, so it keeps the musl multilib
guard (4da308d37a).

What it fixes:
- gcc wrote the 64-bit musl loader as /usr/lib64/ld-musl-*.so.1, but
  musl installs it in nonarch_base_libdir. 64-bit programs could not
  start, and meson's sanity check failed.
- The multilib header wrapper used bits/wordsize.h, which glibc has
  and musl does not, so oe_multilib_header did not support musl.
  On musl the wrapper now checks which of bits/alltypes-32.h and -64.h
  the sysroot has, and uses the pointer size when it has both.

Not done yet:
- ldd: both variants install /usr/bin/ldd.
- SWIG recipes that read wrapped headers need -D__MHWORDSIZE.
  python3-m2crypto (meta-python) is the one I found.

To try it, revert 4da308d37a ("musl: Show error when used with
multilibs"), which added the guard in musl.inc.

With it reverted, qemuarm64 + lib32 armv7ahf and qemux86-64 + lib32
x86 (usrmerge, ipk) build core-image-minimal and the lib32 SDK. The
gcc change was also built without usrmerge, and with
buildtools-extended-tarball testsdk.

I am sending this as an RFC because I am not sure this is the right
way to do musl multilib.

mark.yang (4):
  gcc: point the musl dynamic linker at nonarch_base_libdir
  musl: wrap the bits headers for multilib
  multilib_header_wrapper.h: support musl
  multilib_header: wrap musl headers for multilib builds

 meta/classes-recipe/cross-canadian.bbclass    |  1 +
 meta/classes-recipe/cross.bbclass             |  1 +
 meta/classes-recipe/crosssdk.bbclass          |  1 +
 meta/classes-recipe/multilib_header.bbclass   |  2 +-
 meta/recipes-core/musl/musl_git.bb            |  9 ++++-
 meta/recipes-devtools/gcc/gcc-common.inc      |  1 +
 .../gcc/gcc-configure-common.inc              |  2 +
 .../gcc/gcc-multilib-config.inc               | 20 ++++++----
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 39 ++++++++++---------
 ...s-fix-v4bx-to-linker-to-support-EABI.patch |  2 +-
 scripts/multilib_header_wrapper.h             | 22 +++++++++--
 11 files changed, 67 insertions(+), 33 deletions(-)

