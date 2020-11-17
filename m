Received: from mga18.intel.com (mga18.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.9634.1605627379456851254
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 07:36:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: bUyOgEq1tx/9jH7WFBATWytaryYjG3ndLRF0r/soCOZvI7WOlAhs3CTrhPFe1B80E96HPxaAjr
 qvKvoXA0muFg==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="158720051"
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="158720051"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:38 -0800
IronPort-SDR: C2aNXk5cXHcRLFofnADl41O3uaKEg+K8x/FRHpCgdO4pYhN19xlcQOI/d5kipx0QLSTUjK0liO
 BbOisifezIfg==
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="400803024"
Received: from sbinisma-mobl2.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.40.254])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:37 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 18/19] gstreamer1.0: warn the user when something is wrong with GstBufferPool
Date: Tue, 17 Nov 2020 23:36:07 +0800
Message-Id: <9ad81029e382b10bba6c7244aada30ce362ab1d4.1605626675.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1605626675.git.anuj.mittal@intel.com>
References: <cover.1605626675.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jose Quaresma <quaresma.jose@gmail.com>

This is not a critical bug fix but it can be usefull in some BSP
with exotic drivers like on nvidia tegra bsp.

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...size-in-reset-when-maxsize-is-larger.patch | 49 +++++++++++++++++++
 .../gstreamer/gstreamer1.0_1.16.3.bb          |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-bufferpool-only-resize-in-reset-when-maxsize-is-larger.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-bufferpool-only-resize-in-reset-when-maxsize-is-larger.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-bufferpool-only-resize-in-reset-when-maxsize-is-larger.patch
new file mode 100644
index 0000000000..dacc399d28
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0005-bufferpool-only-resize-in-reset-when-maxsize-is-larger.patch
@@ -0,0 +1,49 @@
+From a1b41b2b2493069365a8274c6a544e6799a5a8df Mon Sep 17 00:00:00 2001
+From: Matthew Waters <matthew@centricular.com>
+Date: Mon, 20 Jul 2020 17:08:32 +1000
+Subject: [PATCH] gst/bufferpool: only resize in reset when maxsize is larger
+
+Only resize the buffer if the maxsize is larger then the configued pool
+size.
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/570>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/a1b41b2b2493069365a8274c6a544e6799a5a8df]
+
+Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+---
+ gst/gstbufferpool.c | 18 +++++++++++++++---
+ 1 file changed, 15 insertions(+), 3 deletions(-)
+
+diff --git a/gst/gstbufferpool.c b/gst/gstbufferpool.c
+index 8ae868cf2c7..a8167d017d6 100644
+--- a/gst/gstbufferpool.c
++++ b/gst/gstbufferpool.c
+@@ -1223,9 +1223,21 @@ default_reset_buffer (GstBufferPool * pool, GstBuffer * buffer)
+ 
+   /* if the memory is intact reset the size to the full size */
+   if (!GST_BUFFER_FLAG_IS_SET (buffer, GST_BUFFER_FLAG_TAG_MEMORY)) {
+-    gsize offset;
+-    gst_buffer_get_sizes (buffer, &offset, NULL);
+-    gst_buffer_resize (buffer, -offset, pool->priv->size);
++    gsize offset, maxsize;
++    gst_buffer_get_sizes (buffer, &offset, &maxsize);
++    /* check if we can resize to at least the pool configured size.  If not,
++     * then this will fail internally in gst_buffer_resize().
++     * default_release_buffer() will drop the buffer from the pool if the
++     * sizes don't match */
++    if (maxsize >= pool->priv->size) {
++      gst_buffer_resize (buffer, -offset, pool->priv->size);
++    } else {
++      GST_WARNING_OBJECT (pool, "Buffer %p without the memory tag has "
++          "maxsize (%" G_GSIZE_FORMAT ") that is smaller than the "
++          "configured buffer pool size (%u). The buffer will be not be "
++          "reused. This is most likely a bug in this GstBufferPool subclass",
++          buffer, maxsize, pool->priv->size);
++    }
+   }
+ 
+   /* remove all metadata without the POOLED flag */
+-- 
+GitLab
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb
index 66ad3e3381..7afe56cd7b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.16.3.bb
@@ -21,6 +21,7 @@ SRC_URI = " \
     file://0002-meson-build-gir-even-when-cross-compiling-if-introsp.patch \
     file://0003-meson-Add-valgrind-feature.patch \
     file://0004-meson-Add-option-for-installed-tests.patch \
+    file://0005-bufferpool-only-resize-in-reset-when-maxsize-is-larger.patch \
 "
 SRC_URI[md5sum] = "beecf6965a17fb17fa3b262fd36df70a"
 SRC_URI[sha256sum] = "692f037968e454e508b0f71d9674e2e26c78475021407fcf8193b1c7e59543c7"
-- 
2.28.0

