Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Samuli Piippo" <samuli.piippo@gmail.com>
Subject: [PATCH 2/2] gcc-cross-canadian: add default plugin linker
Date: Fri, 16 Sep 2022 07:41:05 +0000
Message-Id: <20220916074105.215147-2-samuli.piippo@qt.io>
In-Reply-To: <20220916074105.215147-1-samuli.piippo@qt.io>
References: <20220916074105.215147-1-samuli.piippo@qt.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

Fix multilib sdk issue where gcc is unable to find linker. Previous
fix was in cdd86896c8d29135f937968e9aa07f919cf543d3 using real-ld
symlink, but that prevented switching between bfd and gold linkers.

Running compiler with debug arguments shows that collect2 tries and
fails to find linker using the multilib triples:

  $ $CC -v -Wl,-debug
  ...
  Looking for 'real-ld'
  Looking for 'collect-ld'
  Looking for 'mips-oemllib32-linux-ld'
  Looking for 'mips-oe-linux-mips-oemllib32-linux-ld'
  ...
  collect2 version 12.2.0
  ld_file_name        = not found
  ...
  collect2: fatal error: cannot find ‘ld’

Using --with-plugin-ld=ld in gcc-cross-canadian builds to set default
linker name for collect2, lets it find the linker correctly:

  Looking for 'real-ld'
  Looking for 'collect-ld'
  Looking for 'ld'
  ...
  collect2 version 12.2.0
  ld_file_name        = /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/libexec/mips-oe-linux/gcc/mips-oe-linux/12.2.0/ld

Swith between bfd and gold linker works as expected now:

  $ $CC -v -Wl,-debug -fuse-ld=gold
  ...
  Looking for 'real-ld'
  Looking for 'collect-ld'
  Looking for 'ld.gold'
  ...
  collect2 version 12.2.0
  ld_file_name        = /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/libexec/i686-oe-linux/gcc/i686-oe-linux/12.2.0/ld.gold

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 meta/recipes-devtools/gcc/gcc-cross-canadian.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index 38c972aa7c..c36e4cba81 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -9,6 +9,7 @@ GCCMULTILIB = "--enable-multilib"
 
 require gcc-configure-common.inc
 
+EXTRA_OECONF += "--with-plugin-ld=ld"
 EXTRA_OECONF_PATHS = "\
     --with-gxx-include-dir=/not/exist${target_includedir}/c++/${BINV} \
     --with-build-time-tools=${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin \
-- 
2.25.1

