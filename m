Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0DD466E26B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 16:31:23 +0000 (UTC)
Received: by qgt47 with SMTP id 47so119392486qgt.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 09:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=j/MVB3to/p8BDKZbc7sMV/IPY8UW9BYHKUH7FBRcrFw=;
	b=uL2E03wNx2hb6FVxqw4xu7P+4/UlxlBr3ObDloqI06/gzFYk8wYDfPqyuxFz8YV47W
	Fa0sOMRda0U7/I/HvFiVh9+7EVj5r3Wqgc9aGhoLdSdDU8XuIOjmx3hW3UXBBaorNlql
	PTO3ROarI1BUrgD0aZgyB99XpUr6nnV30pMUyIvI1dOE7aLoF7C0U7MUkGgEJhdGa+xV
	xQAgW71sLrGxceIFn+NaTNbihKrwf6CJ3vVKJLIWVwHSFX1WxoE6JZXG6vopyUd6cIq6
	YDi0H4GRfasl0FH7V6F1iqzXw1FaJXubqnzVugjkk9iwScYgRyKqPIx8/2yWqAuAA6p5
	VbdQ==
X-Received: by 10.140.21.139 with SMTP id 11mr23843024qgl.96.1442248283446;
	Mon, 14 Sep 2015 09:31:23 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	n68sm6158474qge.46.2015.09.14.09.31.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Sep 2015 09:31:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Sep 2015 16:31:18 +0000
Message-Id: <cover.1442248108.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.2
Subject: [PATCH 00/12] Fixes with clang
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
X-List-Received-Date: Mon, 14 Sep 2015 16:31:24 -0000

These fixes generic in nature helps improve the portability of patches and make them work
on non GNU toolchain components

The following changes since commit 2c8c3d9c4b65d2a5c7976d530138ebcaac2b1447:

  gcc: reformat 0063-nativesdk-gcc-support.patch (2015-09-12 23:01:31 +0100)

are available in the git repository at:

  git://github.com/kraj/openembedded-core kraj/misc-fixes
  https://github.com//tree/kraj/misc-fixes

Khem Raj (12):
  xz: Correctly specify GPL-3.0 with autoconf exception
  hostap-utils: Use C99 stddefs in defining local typedefs
  xorg-driver: Fix logical && with bitwise and operation
  qt4: Fix kmap2qmap build with clang
  gummiboot: Fix build warnings seen with gcc5
  gnu-efi, syslinux: Support gcc < 4.7
  syslinux: Dont bypass gcc driver for dependency generation options
  opkg: Include stdio.h for FILE definition
  quota: Replace using -I= with STAGING_INCDIR
  connman: Fix build with musl
  waffle: upgrade waffle_1.5.1.bb -> waffle_1.5.2.bb
  sysstat: Include needed headers explicitly

 .../gnu-efi/gnu-efi/gcc46-compatibility.patch      | 21 ++++++
 meta/recipes-bsp/gnu-efi/gnu-efi_3.0.3.bb          |  1 +
 ...-C-syntax-errors-for-function-declaration.patch | 74 +++++++++++++++++++
 meta/recipes-bsp/gummiboot/gummiboot_git.bb        |  3 +
 ...-__s32-__u16-__s16-__u8-in-terms-of-c99-t.patch | 36 +++++++++
 meta/recipes-bsp/hostap/hostap-utils.inc           |  4 +-
 meta/recipes-connectivity/connman/connman.inc      |  1 +
 ...acktrace-API-availability-before-using-it.patch | 55 ++++++++++++++
 ...resolve-musl-does-not-implement-res_ninit.patch | 77 ++++++++++++++++++++
 .../0003-Fix-header-inclusions-for-musl.patch      | 85 ++++++++++++++++++++++
 meta/recipes-connectivity/connman/connman_1.30.bb  |  3 +
 ...-include-stdio.h-for-getting-FILE-defined.patch | 45 ++++++++++++
 meta/recipes-devtools/opkg/opkg_0.3.0.bb           |  1 +
 .../syslinux/0010-gcc46-compatibility.patch        | 37 ++++++++++
 .../0011-mk-MMD-does-not-take-any-arguments.patch  | 33 +++++++++
 meta/recipes-devtools/syslinux/syslinux_6.03.bb    |  2 +
 .../quota/quota/remove_non_posix_types.patch       | 13 ++++
 meta/recipes-extended/quota/quota_4.02.bb          |  2 +-
 .../0001-Include-needed-headers-explicitly.patch   | 62 ++++++++++++++++
 meta/recipes-extended/sysstat/sysstat_11.1.5.bb    |  2 +
 meta/recipes-extended/xz/xz_5.2.1.bb               |  2 +-
 ...-threads-Use-PTHREAD_MUTEX_RECURSIVE-by-d.patch | 54 ++++++++++++++
 .../waffle/{waffle_1.5.1.bb => waffle_1.5.2.bb}    |  8 +-
 ...put_dpms-Replace-logical-with-bitwise-ope.patch | 31 ++++++++
 .../xorg-driver/xf86-video-omap_0.4.3.bb           |  2 +
 meta/recipes-qt/qt4/qt4-4.8.7.inc                  |  1 +
 .../0034-Fix-kmap2qmap-build-with-clang.patch      | 34 +++++++++
 27 files changed, 683 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/gcc46-compatibility.patch
 create mode 100644 meta/recipes-bsp/gummiboot/gummiboot/0001-console-Fix-C-syntax-errors-for-function-declaration.patch
 create mode 100644 meta/recipes-bsp/hostap/hostap-utils-0.4.7/0001-Define-_u32-__s32-__u16-__s16-__u8-in-terms-of-c99-t.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/0001-Detect-backtrace-API-availability-before-using-it.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/0003-Fix-header-inclusions-for-musl.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/0001-libopkg-include-stdio.h-for-getting-FILE-defined.patch
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/0010-gcc46-compatibility.patch
 create mode 100644 meta/recipes-devtools/syslinux/syslinux/0011-mk-MMD-does-not-take-any-arguments.patch
 create mode 100644 meta/recipes-extended/sysstat/sysstat/0001-Include-needed-headers-explicitly.patch
 create mode 100644 meta/recipes-graphics/waffle/waffle/0001-third_party-threads-Use-PTHREAD_MUTEX_RECURSIVE-by-d.patch
 rename meta/recipes-graphics/waffle/{waffle_1.5.1.bb => waffle_1.5.2.bb} (84%)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omap/0001-drmmode_output_dpms-Replace-logical-with-bitwise-ope.patch
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0034-Fix-kmap2qmap-build-with-clang.patch

-- 
2.5.2


