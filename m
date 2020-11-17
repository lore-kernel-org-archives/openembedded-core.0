Received: from mga18.intel.com (mga18.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.9458.1605627377733567004
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 07:36:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: bccJlIFkZ8qGOogusKkcgqYKVuIK2zPKCsEcW7zWMApjHgHfwVZhQt5qkO12u8KxwOURB0oIac
 Vy9yRtwd6TUg==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="158719947"
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="158719947"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:17 -0800
IronPort-SDR: CUj91ZSvUOQh+jDT2JWaPsy+VOscU5lDDuzmmLxvLcf66mFlvsleTyyD4ZA3H3vhJhcLm20Xda
 MbGqINyDIzpQ==
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="400802932"
Received: from sbinisma-mobl2.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.40.254])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:16 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 01/19] freetype: fix CVE-2020-15999, backport from 2.10.4
Date: Tue, 17 Nov 2020 23:35:50 +0800
Message-Id: <95b928e68325218508cff8def10e72bbe0051c83.1605626675.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1605626675.git.anuj.mittal@intel.com>
References: <cover.1605626675.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Diego Santa Cruz <diego.santacruz@spinetix.com>

Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...-sfnt-Fix-heap-buffer-overflow-59308.patch | 51 +++++++++++++++++++
 .../freetype/freetype_2.10.2.bb               |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-graphics/freetype/freetype/0001-sfnt-Fix-heap-buffer-overflow-59308.patch

diff --git a/meta/recipes-graphics/freetype/freetype/0001-sfnt-Fix-heap-buffer-overflow-59308.patch b/meta/recipes-graphics/freetype/freetype/0001-sfnt-Fix-heap-buffer-overflow-59308.patch
new file mode 100644
index 0000000000..fa8a29b798
--- /dev/null
+++ b/meta/recipes-graphics/freetype/freetype/0001-sfnt-Fix-heap-buffer-overflow-59308.patch
@@ -0,0 +1,51 @@
+From a3bab162b2ae616074c8877a04556932998aeacd Mon Sep 17 00:00:00 2001
+From: Werner Lemberg <wl@gnu.org>
+Date: Mon, 19 Oct 2020 23:45:28 +0200
+Subject: [PATCH] [sfnt] Fix heap buffer overflow (#59308).
+
+This is CVE-2020-15999.
+
+* src/sfnt/pngshim.c (Load_SBit_Png): Test bitmap size earlier.
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/freetype/freetype2.git/commit/?id=a3bab162b2ae616074c8877a04556932998aeacd]
+
+Signed-off-by: Diego Santa Cruz <Diego.SantaCruz@spinetix.com>
+---
+ src/sfnt/pngshim.c | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/src/sfnt/pngshim.c b/src/sfnt/pngshim.c
+index 2e64e5846..f55016122 100644
+--- a/src/sfnt/pngshim.c
++++ b/src/sfnt/pngshim.c
+@@ -332,6 +332,13 @@
+ 
+     if ( populate_map_and_metrics )
+     {
++      /* reject too large bitmaps similarly to the rasterizer */
++      if ( imgHeight > 0x7FFF || imgWidth > 0x7FFF )
++      {
++        error = FT_THROW( Array_Too_Large );
++        goto DestroyExit;
++      }
++
+       metrics->width  = (FT_UShort)imgWidth;
+       metrics->height = (FT_UShort)imgHeight;
+ 
+@@ -340,13 +347,6 @@
+       map->pixel_mode = FT_PIXEL_MODE_BGRA;
+       map->pitch      = (int)( map->width * 4 );
+       map->num_grays  = 256;
+-
+-      /* reject too large bitmaps similarly to the rasterizer */
+-      if ( map->rows > 0x7FFF || map->width > 0x7FFF )
+-      {
+-        error = FT_THROW( Array_Too_Large );
+-        goto DestroyExit;
+-      }
+     }
+ 
+     /* convert palette/gray image to rgb */
+-- 
+2.18.4
+
diff --git a/meta/recipes-graphics/freetype/freetype_2.10.2.bb b/meta/recipes-graphics/freetype/freetype_2.10.2.bb
index 1034ddc0d7..cb0006b23e 100644
--- a/meta/recipes-graphics/freetype/freetype_2.10.2.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.10.2.bb
@@ -14,6 +14,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=4af6221506f202774ef74f64932878a1
 
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz \
            file://use-right-libtool.patch \
+           file://0001-sfnt-Fix-heap-buffer-overflow-59308.patch \
           "
 SRC_URI[md5sum] = "7c0d5a39f232d7eb9f9d7da76bf08074"
 SRC_URI[sha256sum] = "1543d61025d2e6312e0a1c563652555f17378a204a61e99928c9fcef030a2d8b"
-- 
2.28.0

