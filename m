Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id ADA347F7DF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 12:41:48 +0000 (UTC)
Received: from localhost.localdomain (31-10-206-124.static.upc.ch
	[31.10.206.124])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 329945C1EF6;
	Wed, 20 Nov 2019 13:41:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1574253709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:content-type:content-transfer-encoding:
	in-reply-to:references; bh=GT6Jc+GUqBzZGXpfoMPuI5tEdBL96/PqFf353Xokw2c=;
	b=VGOK2uxsraR0gCw8GwHYNkUfvULYJVkCX38atP4BRjio9oYvEJWKq3/ff2jeOVlmetaFsR
	iWx9Yq6ajuSSOv9Pw5H6oZopOqJCTy0oJ5qNbfEfNzCbX2L+nanZsBA24aWtlKtb2umwRW
	5/RIIJDAgjdqrkgllCisIvWldjflW+E=
From: Stefan Agner <stefan@agner.ch>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Nov 2019 12:41:45 +0000
Message-Id: <20191120124146.21245-1-stefan@agner.ch>
X-Mailer: git-send-email 2.17.1
Cc: Stefan Agner <stefan.agner@toradex.com>
Subject: [PATCH v5 1/2] zstd: move recipe to oe-core from meta-oe
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
X-List-Received-Date: Wed, 20 Nov 2019 12:41:48 -0000

From: Stefan Agner <stefan.agner@toradex.com>

Zstd is a very fast compression algorithm and has gained quite some
popularity recently. An upcoming patch allows to compress rootfs
using Zstd. Moving Zstd to oe-core allows this new conversion formats
to be automatically tested by the oe-selftest
imagefeatures.ImageFeatures.test_image_fstypes test.

Furthermore there are three packages in oe-core which allow to enable
Zstd support through packageconfig currently.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
---
 meta/conf/distro/include/maintainers.inc |  1 +
 meta/recipes-extended/zstd/zstd_1.4.4.bb | 35 ++++++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-extended/zstd/zstd_1.4.4.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index d85e5b697f..dff7ce28f8 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -774,3 +774,4 @@ RECIPE_MAINTAINER_pn-xwininfo = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-xz = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-zip = "Denys Dmytriyenko <denys@ti.com>"
 RECIPE_MAINTAINER_pn-zlib = "Denys Dmytriyenko <denys@ti.com>"
+RECIPE_MAINTAINER_pn-zstd = "Alex Kiernan <alex.kiernan@gmail.com>"
diff --git a/meta/recipes-extended/zstd/zstd_1.4.4.bb b/meta/recipes-extended/zstd/zstd_1.4.4.bb
new file mode 100644
index 0000000000..eb201f4139
--- /dev/null
+++ b/meta/recipes-extended/zstd/zstd_1.4.4.bb
@@ -0,0 +1,35 @@
+SUMMARY = "Zstandard - Fast real-time compression algorithm"
+DESCRIPTION = "Zstandard is a fast lossless compression algorithm, targeting \
+real-time compression scenarios at zlib-level and better compression ratios. \
+It's backed by a very fast entropy stage, provided by Huff0 and FSE library."
+HOMEPAGE = "http://www.zstd.net/"
+SECTION = "console/utils"
+
+LICENSE = "BSD-3-Clause & GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c7f0b161edbe52f5f345a3d1311d0b32 \
+                    file://COPYING;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0"
+
+SRC_URI = "git://github.com/facebook/zstd.git;nobranch=1"
+
+SRCREV = "10f0e6993f9d2f682da6d04aa2385b7d53cbb4ee"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
+
+S = "${WORKDIR}/git"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[lz4] = "HAVE_LZ4=1,HAVE_LZ4=0,lz4"
+PACKAGECONFIG[lzma] = "HAVE_LZMA=1,HAVE_LZMA=0,xz"
+PACKAGECONFIG[zlib] = "HAVE_ZLIB=1,HAVE_ZLIB=0,zlib"
+
+# See programs/README.md for how to use this
+ZSTD_LEGACY_SUPPORT ??= "4"
+
+do_compile () {
+    oe_runmake ${PACKAGECONFIG_CONFARGS} ZSTD_LEGACY_SUPPORT=${ZSTD_LEGACY_SUPPORT}
+}
+
+do_install () {
+    oe_runmake install 'DESTDIR=${D}'
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


