Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F140D7843C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 06:19:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7H6JnDE006617
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 23:19:50 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 16 Aug 2017 23:19:49 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Aug 2017 02:19:46 -0400
Message-ID: <b3f313bcb7176738ce1ca281e9d442d7477510f8.1502950742.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1502950742.git.dengke.du@windriver.com>
References: <cover.1502950742.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] cairo: Fix CVE-2017-9814
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
X-List-Received-Date: Thu, 17 Aug 2017 06:19:49 -0000
Content-Type: text/plain

Backport patch from the following link to fix CVE-2017-9814:

    https://bugs.freedesktop.org/show_bug.cgi?id=101547

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 .../cairo/cairo/0001-cairo-Fix-CVE-2017-9814.patch | 45 ++++++++++++++++++++++
 meta/recipes-graphics/cairo/cairo_1.14.10.bb       |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-graphics/cairo/cairo/0001-cairo-Fix-CVE-2017-9814.patch

diff --git a/meta/recipes-graphics/cairo/cairo/0001-cairo-Fix-CVE-2017-9814.patch b/meta/recipes-graphics/cairo/cairo/0001-cairo-Fix-CVE-2017-9814.patch
new file mode 100644
index 0000000..7d02ab9
--- /dev/null
+++ b/meta/recipes-graphics/cairo/cairo/0001-cairo-Fix-CVE-2017-9814.patch
@@ -0,0 +1,45 @@
+From 042421e9e3d266ad0bb7805132041ef51ad3234d Mon Sep 17 00:00:00 2001
+From: Adrian Johnson <ajohnson@redneon.com>
+Date: Wed, 16 Aug 2017 22:52:35 -0400
+Subject: [PATCH] cairo: Fix CVE-2017-9814
+
+The bug happens because in some scenarios the variable size can
+have a value of 0 at line 1288. And malloc(0) is not returning
+NULL as some people could expect:
+
+    https://stackoverflow.com/questions/1073157/zero-size-malloc
+
+malloc(0) returns the smallest chunk possible. So the line 1290
+with the return is not execute. And the execution continues with
+an invalid map.
+
+Since the size is 0 the variable map is not initialized correctly
+at load_trutype_table. So, later when the variable map is accessed
+previous values from a freed chunk are used. This could allows an
+attacker to control the variable map.
+
+This patch have not merge in upstream now.
+
+Upstream-Status: Backport [https://bugs.freedesktop.org/show_bug.cgi?id=101547]
+CVE: CVE-2017-9814
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
+---
+ src/cairo-truetype-subset.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/cairo-truetype-subset.c b/src/cairo-truetype-subset.c
+index e3449a0..f77d11c 100644
+--- a/src/cairo-truetype-subset.c
++++ b/src/cairo-truetype-subset.c
+@@ -1285,7 +1285,7 @@ _cairo_truetype_reverse_cmap (cairo_scaled_font_t *scaled_font,
+ 	return CAIRO_INT_STATUS_UNSUPPORTED;
+ 
+     size = be16_to_cpu (map->length);
+-    map = malloc (size);
++    map = _cairo_malloc (size);
+     if (unlikely (map == NULL))
+ 	return _cairo_error (CAIRO_STATUS_NO_MEMORY);
+ 
+-- 
+2.8.1
+
diff --git a/meta/recipes-graphics/cairo/cairo_1.14.10.bb b/meta/recipes-graphics/cairo/cairo_1.14.10.bb
index ba38c34..fcdddc6 100644
--- a/meta/recipes-graphics/cairo/cairo_1.14.10.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.14.10.bb
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
 
 SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz \
            file://cairo-get_bitmap_surface-bsc1036789-CVE-2017-7475.diff \ 
+           file://0001-cairo-Fix-CVE-2017-9814.patch \
           "
 
 SRC_URI[md5sum] = "146f5f4d0b4439fc3792fd3452b7b12a"
-- 
2.8.1


