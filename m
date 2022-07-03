Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Steve Sakoman" <steve@sakoman.com>
Subject: [OE-core][kirkstone 12/30] libffi: fix native build being not portable
Date: Sun,  3 Jul 2022 09:35:47 -1000
Message-Id: <58804e0051e3b77e0378aa4accbd26b2588b68e7.1656876825.git.steve@sakoman.com>
In-Reply-To: <cover.1656876825.git.steve@sakoman.com>
References: <cover.1656876825.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>

Without `--with-gcc-arch=generic` libffi looks up the cpuid to automatically determine
which mtune/march to use. This makes the native sstate-cache unuseable since it's
possible to have a newer cpu building the recipe and the library being pulled from
another older cpu which doesn't have the instruction.

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cddaecac1fdd4d033c2ff8ccaf1d60e1c598d5b7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1

