Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3369A71951
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 13:34:56 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 18 Jul 2016 06:34:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,384,1464678000"; d="scan'208";a="848345535"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga003.jf.intel.com with ESMTP; 18 Jul 2016 06:34:39 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2016 16:34:27 +0300
Message-Id: <0e616ba852870c7aa52927c3c3a2e5cfa4c1120b.1468848064.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <c67de06959dd87fa6ce214da11cd431c44da056f.1468848064.git.jussi.kukkonen@intel.com>
References: <c67de06959dd87fa6ce214da11cd431c44da056f.1468848064.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1468848064.git.jussi.kukkonen@intel.com>
References: <cover.1468848064.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 4/9] wayland: Upgrade 1.10.0 -> 1.11.0
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
X-List-Received-Date: Mon, 18 Jul 2016 13:34:57 -0000

Add a musl build fix patch.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 ...0001-scanner-Use-unit32_t-instead-of-uint.patch | 30 ++++++++++++++++++++++
 .../{wayland_1.10.0.bb => wayland_1.11.0.bb}       |  8 +++---
 2 files changed, 35 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-graphics/wayland/wayland/0001-scanner-Use-unit32_t-instead-of-uint.patch
 rename meta/recipes-graphics/wayland/{wayland_1.10.0.bb => wayland_1.11.0.bb} (87%)

diff --git a/meta/recipes-graphics/wayland/wayland/0001-scanner-Use-unit32_t-instead-of-uint.patch b/meta/recipes-graphics/wayland/wayland/0001-scanner-Use-unit32_t-instead-of-uint.patch
new file mode 100644
index 0000000..dece95c
--- /dev/null
+++ b/meta/recipes-graphics/wayland/wayland/0001-scanner-Use-unit32_t-instead-of-uint.patch
@@ -0,0 +1,30 @@
+From 5516d32e694badca35b6c71b02a3f08f650308bf Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 15 Jul 2016 16:23:48 -0700
+Subject: [PATCH] scanner: Use unit32_t instead of uint
+
+uint32_t is C99 defined stdint type
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Upstream-Status: Submitted
+---
+ src/scanner.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/scanner.c b/src/scanner.c
+index 5f06e8e..10a4023 100644
+--- a/src/scanner.c
++++ b/src/scanner.c
+@@ -808,7 +808,7 @@ find_enumeration(struct protocol *protocol,
+ 	struct interface *i;
+ 	struct enumeration *e;
+ 	char *enum_name;
+-	uint idx = 0, j;
++	uint32_t idx = 0, j;
+ 
+ 	for (j = 0; j + 1 < strlen(enum_attribute); j++) {
+ 		if (enum_attribute[j] == '.') {
+-- 
+2.1.4
+
diff --git a/meta/recipes-graphics/wayland/wayland_1.10.0.bb b/meta/recipes-graphics/wayland/wayland_1.11.0.bb
similarity index 87%
rename from meta/recipes-graphics/wayland/wayland_1.10.0.bb
rename to meta/recipes-graphics/wayland/wayland_1.11.0.bb
index 41d08b7..3413406 100644
--- a/meta/recipes-graphics/wayland/wayland_1.10.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.11.0.bb
@@ -10,9 +10,11 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b31d8f53b6aaf2b4985d7dd7810a70d1 \
                     file://src/wayland-server.c;endline=24;md5=b8e046164a766bb1ede8ba38e9dcd7ce"
 
-SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "e7751c38807c231afaba9d6b68f2a2b7"
-SRC_URI[sha256sum] = "4bf6e790aa6f50ab3825676282ecd75850ec9c4767af96ecb7127b1f3c3d60dc"
+SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
+           file://0001-scanner-Use-unit32_t-instead-of-uint.patch \
+           "
+SRC_URI[md5sum] = "fccf680be066e234729d5b69e0bd0fa9"
+SRC_URI[sha256sum] = "9540925f7928becfdf5e3b84c70757f6589bf1ceef09bea78784d8e4772c0db0"
 
 EXTRA_OECONF_class-native = "--disable-documentation --disable-libraries"
 
-- 
2.1.4


