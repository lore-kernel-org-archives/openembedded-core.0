Return-Path: <maxime.roussinbelanger@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: =?UTF-8?B?TWF4aW1lIFJvdXNzaW4tQsOpbGFuZ2Vy?= <maxime.roussinbelanger@gmail.com>
Subject: [PATCH v3] libffi: fix native build being not portable
Date: Tue, 21 Jun 2022 10:26:19 -0400
Message-Id: <20220621142618.957722-1-maxime.roussinbelanger@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?= <maxime.roussinbelanger@gmail.com>

From: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>

Without `--with-gcc-arch=generic` libffi looks up the cpuid to automatically determine
which mtune/march to use. This makes the native sstate-cache unuseable since it's
possible to have a newer cpu building the recipe and the library being pulled from
another older cpu which doesn't have the instruction.

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
---
 meta/recipes-support/libffi/libffi_3.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libffi/libffi_3.4.2.bb b/meta/recipes-support/libffi/libffi_3.4.2.bb
index 733fcc5e6c..71d9518baf 100644
--- a/meta/recipes-support/libffi/libffi_3.4.2.bb
+++ b/meta/recipes-support/libffi/libffi_3.4.2.bb
@@ -19,6 +19,7 @@ UPSTREAM_CHECK_URI = "https://github.com/libffi/libffi/releases/"
 UPSTREAM_CHECK_REGEX = "libffi-(?P<pver>\d+(\.\d+)+)\.tar"
 
 EXTRA_OECONF += "--disable-builddir --disable-exec-static-tramp"
+EXTRA_OECONF:class-native += "--with-gcc-arch=generic"
 EXTRA_OEMAKE:class-target = "LIBTOOLFLAGS='--tag=CC'"
 inherit autotools texinfo multilib_header
 
@@ -33,4 +34,3 @@ FILES:${PN}-dev += "${libdir}/libffi-${PV}"
 MIPS_INSTRUCTION_SET = "mips"
 
 BBCLASSEXTEND = "native nativesdk"
-
-- 
2.36.0

