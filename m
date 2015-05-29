Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id AC0B360167
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 17:31:55 +0000 (UTC)
Received: by iesa3 with SMTP id a3so68255520ies.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 10:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=gJFdcqZYqameIfrtdyZBtPGIFYB5U1viKkguoG0ftnQ=;
	b=BighR8ZWShXwtEcIQDMn3uIDwP8RpTYNABQjxzAwU2NZhwC7/gc1u8xRQrzXK7VFj1
	8nuRRxsHaxSKFFT9w5y4F3DIkn/eag2DSn2KnxSY19ODDTfl+BgHxO5QA3Jra7dJfthH
	TZf7KKUs58KLW6N/zTevM+56bNy9aw0KaDuaVMsRJyYYZIp8dUS1+74PpOnNCm5wbGEe
	Q1XSDLypPXmRRbGWz6D4Hgs45q4SdkxNbOmSW8851oOutcgwP56tCr/0evlGXg9XpZTf
	ZpuE56p6e6X8fdXiNM1NCstN5DJMjN8kYJtIB8AL1nTD7VBwQ521Jn+uFFfXhweCqDcT
	6I7Q==
X-Received: by 10.107.31.134 with SMTP id f128mr11674469iof.19.1432920717097; 
	Fri, 29 May 2015 10:31:57 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id u38sm4627570ioi.0.2015.05.29.10.31.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 May 2015 10:31:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 May 2015 10:31:51 -0700
Message-Id: <cover.1432920208.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/6] gdb/binutils minor upgrades and misc
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
X-List-Received-Date: Fri, 29 May 2015 17:32:00 -0000

This patchset has following

gdb minor upgrade to 7.9.1

binutils move to latest tip on 2.25 stable branch, it gets
the issue where copy relocations against protected symbols don't work
with bfd ld and gcc 5.0 on x86/x86-64 it could help with remaining build problem
with gcc5 seen on x86/x86-64  this also helps musl based systems
which suffer from same issue with gcc-5. This patch needs some runtime
testing with gcc 4.9 though

glibc patch is needed for non glibc libcs to be able to build in OE-core
currently its broken for uclibc and musl

Runqemu patch is required for newer versions of wayland/weston to work
after switching to libinput. I have tested it on weston/wayaland and on
x11/gnome image it worked ok.

alsa-plugins is a build break fix

openssl is a refresh of the last patch as a upstream backport no functional change

Khem Raj (6):
  glibc: ignore for musl/uclibc but only for target recipes
  runqemu-internal: Replace wacom-tablet with tablet for usbdevice
  openssl: Backport upstreamed version of patch to fix build on mips64
  alsa-plugins: Install 99-pulseaudio-default.conf when pulseaudio is
    enabled
  gdb: Minor upgrade to 7.9.1
  binutils: Update to tip of 2.25 branch

 ...ine-GCC_VERSION-macro-to-cover-upto-gcc-5.patch | 53 ----------------------
 ...lcl.h-fix-MIPS-specific-gcc-version-check.patch | 30 ++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2a.bb |  2 +-
 meta/recipes-core/glibc/glibc-collateral.inc       |  3 ++
 meta/recipes-core/glibc/glibc_2.21.bb              |  9 ++--
 meta/recipes-devtools/binutils/binutils-2.25.inc   |  4 +-
 ...-gold-arm-Skip-pic-check-for-R_ARM_REL32.patch} |  0
 .../gdb/{gdb-7.9.inc => gdb-7.9.1.inc}             |  4 +-
 ...canadian_7.9.bb => gdb-cross-canadian_7.9.1.bb} |  0
 .../gdb/{gdb-cross_7.9.bb => gdb-cross_7.9.1.bb}   |  0
 meta/recipes-devtools/gdb/gdb.inc                  |  1 -
 ...0001-make-man-install-relative-to-DESTDIR.patch |  2 +-
 .../gdb/gdb/0002-Change-order-of-CFLAGS.patch      |  2 +-
 ...d-support-for-Renesas-SH-sh4-architecture.patch |  2 +-
 .../gdb/0004-Change-comment-in-gdb-compile.patch   | 48 --------------------
 .../gdb/{gdb_7.9.bb => gdb_7.9.1.bb}               |  0
 .../recipes-multimedia/alsa/alsa-plugins_1.0.29.bb |  4 +-
 scripts/runqemu-internal                           |  4 +-
 18 files changed, 49 insertions(+), 119 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Define-GCC_VERSION-macro-to-cover-upto-gcc-5.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0001-bn-bn_lcl.h-fix-MIPS-specific-gcc-version-check.patch
 rename meta/recipes-devtools/binutils/binutils/{0001-gold-arm-Skip-pic-check-for-R_ARM_REL32.patch => 0014-gold-arm-Skip-pic-check-for-R_ARM_REL32.patch} (100%)
 rename meta/recipes-devtools/gdb/{gdb-7.9.inc => gdb-7.9.1.inc} (68%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_7.9.bb => gdb-cross-canadian_7.9.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_7.9.bb => gdb-cross_7.9.1.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0004-Change-comment-in-gdb-compile.patch
 rename meta/recipes-devtools/gdb/{gdb_7.9.bb => gdb_7.9.1.bb} (100%)

-- 
2.1.4


