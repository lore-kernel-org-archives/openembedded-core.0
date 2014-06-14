Return-Path: <armccurdy@gmail.com>
Received: from mail-pb0-f48.google.com (mail-pb0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id 068916FD12
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Jun 2014 10:32:53 +0000 (UTC)
Received: by mail-pb0-f48.google.com with SMTP id rq2so850199pbb.21
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Jun 2014 03:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=tQww1Hapzou3jLrXNWKA8m5rVtjDJQEm9prEqkBAKp8=;
	b=MimJ3OzC8mp0Gc7+bw2oIjFM2ls0knSkSMBo9AwE5mMovFRAJK627Ojr+C+2dhBSyw
	SK+jrpw1n6YHKLIQ1RRuuiHHhwKybPIasndHmNoAjArlvzGlPLrmym4k5wA4SxbitiM4
	xk86PmKvWOld99aJJAZVAVzcviENlzwBKn58ZgsALfuE+Nn1dt+7Zi8Pj0Ae1e1eaiKH
	kvb7JMjP0ll0WQ+ogn3tX4EVwX1IoSMlGoG7lD5p1Zb7EyxGT+j2qAWYW7STGII2XUcr
	quJOlLN1kKAaVDQqfhmqpqN1NfKVq9KjNT7JQ4UgO1846KfpHOIImQVKxoUAQ5el/o2r
	xcVQ==
X-Received: by 10.66.242.171 with SMTP id wr11mr9653297pac.111.1402741974052; 
	Sat, 14 Jun 2014 03:32:54 -0700 (PDT)
Received: from t420s.gateway.sonic.net (173-228-90-200.dsl.dynamic.sonic.net.
	[173.228.90.200]) by mx.google.com with ESMTPSA id
	i10sm35376977pat.36.2014.06.14.03.32.53 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 14 Jun 2014 03:32:53 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Jun 2014 03:32:04 -0700
Message-Id: <1402741924-15665-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] directfb: fix-compilation-with-zlib.patch merged upstream
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
X-List-Received-Date: Sat, 14 Jun 2014 10:32:55 -0000

Compilation with zlib is fixed in DirectFB 1.7.1.

Upstream commit:

  commit 40779160de4d57bad973af9674df51ad281fdb8f
  Author: Denis Oliver Kropp <dok@directfb.org>
  Date:   Tue Sep 18 21:10:25 2012 +0200

    Core: Include zlib.h where it was missing.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../directfb/fix-compilation-with-zlib.patch       | 29 ----------------------
 meta/recipes-graphics/directfb/directfb_1.7.1.bb   |  3 +--
 2 files changed, 1 insertion(+), 31 deletions(-)
 delete mode 100644 meta/recipes-graphics/directfb/directfb/fix-compilation-with-zlib.patch

diff --git a/meta/recipes-graphics/directfb/directfb/fix-compilation-with-zlib.patch b/meta/recipes-graphics/directfb/directfb/fix-compilation-with-zlib.patch
deleted file mode 100644
index 8b99b4e..0000000
--- a/meta/recipes-graphics/directfb/directfb/fix-compilation-with-zlib.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Upstream-Status: Pending
-
-From 1d6d597050fc24769e9df2693f754bdc824a8b78 Mon Sep 17 00:00:00 2001
-From: Laurentiu Palcu <laurentiu.palcu@intel.com>
-Date: Tue, 3 Jul 2012 16:06:10 +0300
-Subject: [PATCH] fix compilation with zlib
-
-Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
----
- src/core/surface.c |    3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/core/surface.c b/src/core/surface.c
-index 50434a2..52f50ab 100644
---- a/src/core/surface.c
-+++ b/src/core/surface.c
-@@ -49,6 +49,9 @@
- #include <gfx/convert.h>
- #include <gfx/util.h>
- 
-+#ifdef USE_ZLIB
-+#include <zlib.h>
-+#endif
- 
- D_DEBUG_DOMAIN( Core_Surface, "Core/Surface", "DirectFB Core Surface" );
- 
--- 
-1.7.9.5
-
diff --git a/meta/recipes-graphics/directfb/directfb_1.7.1.bb b/meta/recipes-graphics/directfb/directfb_1.7.1.bb
index 15f38ac..aff9633 100644
--- a/meta/recipes-graphics/directfb/directfb_1.7.1.bb
+++ b/meta/recipes-graphics/directfb/directfb_1.7.1.bb
@@ -4,8 +4,7 @@ RV = "1.7-1"
 
 DEPENDS += "sysfsutils"
 
-SRC_URI += "file://fix-compilation-with-zlib.patch \
-            file://fixsepbuild.patch"
+SRC_URI += "file://fixsepbuild.patch"
 
 EXTRA_OECONF = "\
   --enable-freetype=yes \
-- 
1.8.1.2


