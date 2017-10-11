Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 731FD78202
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Oct 2017 15:39:06 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Oct 2017 08:39:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,361,1503385200"; d="scan'208";a="1180945890"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 11 Oct 2017 08:39:04 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Oct 2017 18:34:32 +0300
Message-Id: <261aa33b5555f5cf73eb5e69dfdd758a1fea8513.1507735448.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 40/50] fontconfig: update to 2.12.6
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
X-List-Received-Date: Wed, 11 Oct 2017 15:39:07 -0000

Add a patch to avoid crashing under qemu.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...src-fcxml.c-avoid-double-free-of-filename.patch | 28 ++++++++++++++++++++++
 .../{fontconfig_2.12.4.bb => fontconfig_2.12.6.bb} |  7 ++++--
 2 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/fontconfig/fontconfig/0001-src-fcxml.c-avoid-double-free-of-filename.patch
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.12.4.bb => fontconfig_2.12.6.bb} (90%)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig/0001-src-fcxml.c-avoid-double-free-of-filename.patch b/meta/recipes-graphics/fontconfig/fontconfig/0001-src-fcxml.c-avoid-double-free-of-filename.patch
new file mode 100644
index 00000000000..3ca9fde9670
--- /dev/null
+++ b/meta/recipes-graphics/fontconfig/fontconfig/0001-src-fcxml.c-avoid-double-free-of-filename.patch
@@ -0,0 +1,28 @@
+From a163c81ac430cdc292add200f3e6a0c048be4d7e Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 11 Oct 2017 17:40:09 +0300
+Subject: [PATCH] src/fcxml.c: avoid double free() of filename
+
+It's also freed after bail1, so no need to do it here.
+
+Upstream-Status: Submitted [https://bugs.freedesktop.org/show_bug.cgi?id=103221]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ src/fcxml.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/fcxml.c b/src/fcxml.c
+index 19ce96a..edb6054 100644
+--- a/src/fcxml.c
++++ b/src/fcxml.c
+@@ -3398,7 +3398,6 @@ FcConfigParseAndLoad (FcConfig	    *config,
+ 
+     fd = FcOpen ((char *) filename, O_RDONLY);
+     if (fd == -1) {
+-	FcStrFree (filename);
+ 	goto bail1;
+     }
+ 
+-- 
+2.14.1
+
diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.12.4.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
similarity index 90%
rename from meta/recipes-graphics/fontconfig/fontconfig_2.12.4.bb
rename to meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
index a058b359848..fa5f0eecc20 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.12.4.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.12.6.bb
@@ -22,9 +22,12 @@ DEPENDS = "expat freetype zlib gperf-native"
 
 SRC_URI = "http://fontconfig.org/release/fontconfig-${PV}.tar.gz \
            file://revert-static-pkgconfig.patch \
+           file://0001-src-fcxml.c-avoid-double-free-of-filename.patch \
            "
-SRC_URI[md5sum] = "4fb01fc3f41760c41c69e37cc784b658"
-SRC_URI[sha256sum] = "fd5a6a663f4c4a00e196523902626654dd0c4a78686cbc6e472f338e50fdf806"
+
+SRC_URI[md5sum] = "00e748c67fad11e7057a71ed385e8bdb"
+SRC_URI[sha256sum] = "064b9ebf060c9e77011733ac9dc0e2ce92870b574cca2405e11f5353a683c334"
+
 
 do_configure_prepend() {
     # work around https://bugs.freedesktop.org/show_bug.cgi?id=101280
-- 
2.14.1


