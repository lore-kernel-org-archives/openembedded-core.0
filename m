Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from tygrysek.juszkiewicz.com.pl (tygrysek.juszkiewicz.com.pl
	[178.33.81.99])
	by mail.openembedded.org (Postfix) with ESMTP id 5AC1E6A451
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2013 14:41:01 +0000 (UTC)
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 50C94D22B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2013 16:40:32 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 May 2013 16:40:56 +0200
Message-Id: <1369665656-20275-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] gcc 4.8: use /lib/ for AArch64
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
X-List-Received-Date: Mon, 27 May 2013 14:41:01 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/recipes-devtools/gcc/gcc-4.8.inc              |  1 +
 .../gcc/gcc-4.8/use-lib-for-aarch64.patch          | 23 ++++++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/use-lib-for-aarch64.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
index a9786da..5142c0f 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
@@ -66,6 +66,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://0034-Use-the-multilib-config-files-from-B-instead-of-usin.patch \
 	   file://0035-wcast-qual-PR-55383.patch \
 	   file://gcc-4.8-PR56797.patch \
+	   file://use-lib-for-aarch64.patch \
 	  "
 SRC_URI[md5sum] = "e6040024eb9e761c3bea348d1fa5abb0"
 SRC_URI[sha256sum] = "b037fe5132b71ecad2ea7141ec92292b5d32427bf90fd90cde432b1d5abacc2c"
diff --git a/meta/recipes-devtools/gcc/gcc-4.8/use-lib-for-aarch64.patch b/meta/recipes-devtools/gcc/gcc-4.8/use-lib-for-aarch64.patch
new file mode 100644
index 0000000..a647e93
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.8/use-lib-for-aarch64.patch
@@ -0,0 +1,23 @@
+From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
+
+AArch64 is built with /lib/ as prefix but GCC 4.8 tries to use /lib64/
+path so build fails.
+
+It may affect builds when /lib64/ will be used but so far it is not
+default.
+
+Upstream-status: Inappropriate [OE specific]
+---
+ gcc/config/aarch64/t-aarch64-linux |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- gcc-linaro-4.8-2013.04.orig/gcc/config/aarch64/t-aarch64-linux
++++ gcc-linaro-4.8-2013.04/gcc/config/aarch64/t-aarch64-linux
+@@ -20,6 +20,6 @@
+ 
+ LIB1ASMSRC   = aarch64/lib1funcs.asm
+ LIB1ASMFUNCS = _aarch64_sync_cache_range
+ 
+ AARCH_BE = $(if $(findstring TARGET_BIG_ENDIAN_DEFAULT=1, $(tm_defines)),_be)
+-MULTILIB_OSDIRNAMES = .=../lib64$(call if_multiarch,:aarch64$(AARCH_BE)-linux-gnu)
++MULTILIB_OSDIRNAMES = .=../lib$(call if_multiarch,:aarch64$(AARCH_BE)-linux-gnu)
-- 
1.8.1.2


