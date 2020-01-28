Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id A768C7FED8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 18:12:28 +0000 (UTC)
Received: from lons-builder.int.hatle.net ([192.40.192.88])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 00SICSwf015898
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 12:12:29 -0600
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jan 2020 12:12:28 -0600
Message-Id: <20200128181228.149584-1-mark.hatle@kernel.crashing.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] gcc-cross-canadian: A missing space in an append caused an invalid option
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
X-List-Received-Date: Tue, 28 Jan 2020 18:12:28 -0000

When configuring the cross-candian toolchain for a non-linux target system,
the resulting gcc configuration included:

  --enable-initfini-array--without-headers

these should have been two separate options.

Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index f14cbf7152..4aac345bec 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -158,7 +158,7 @@ SYSTEMLIBS1 = "${target_libdir}/"
 EXTRA_OECONF += "--enable-poison-system-directories"
 EXTRA_OECONF_remove_elf = "--with-sysroot=/not/exist"
 EXTRA_OECONF_remove_eabi = "--with-sysroot=/not/exist"
-EXTRA_OECONF_append_elf = "--without-headers --with-newlib"
-EXTRA_OECONF_append_eabi = "--without-headers --with-newlib"
+EXTRA_OECONF_append_elf = " --without-headers --with-newlib"
+EXTRA_OECONF_append_eabi = " --without-headers --with-newlib"
 # gcc 4.7 needs -isystem
 export ARCH_FLAGS_FOR_TARGET = "--sysroot=${STAGING_DIR_TARGET} -isystem=${target_includedir}"
-- 
2.17.1


