Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.3706.1610079500392423505
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 20:18:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: ajF4VhA0Li7OKQkO1nl+b4d9DIPJcYoNO+ExJKZU3cN073TC0tEpywjnbdXDGlYs6Z75g3mGoj
 foAiU8VC3CMg==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="164613642"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="164613642"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:26 -0800
IronPort-SDR: JI0qno6KcZLE919GZhetz9CQ0whKoZH9VRoTt4UeqiUY90LXwSOmEfynf3iCbumyQNvWzPkkbS
 VqrzGcisa0sw==
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="362209361"
Received: from nshamsan-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.135.192])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:25 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 06/30] libexif: fix CVE-2020-0198; CVE-2020-0452
Date: Fri,  8 Jan 2021 12:17:48 +0800
Message-Id: <debcb0c39876e97e819e454b1524c2f8b94b0ce3.1610079279.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610079278.git.anuj.mittal@intel.com>
References: <cover.1610079278.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 46d837442ab216941df2d02f60c69155463e02d8)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libexif/files/CVE-2020-0198.patch         | 66 +++++++++++++++++++
 .../libexif/files/CVE-2020-0452.patch         | 39 +++++++++++
 .../recipes-support/libexif/libexif_0.6.22.bb |  2 +
 3 files changed, 107 insertions(+)
 create mode 100644 meta/recipes-support/libexif/files/CVE-2020-0198.patch
 create mode 100644 meta/recipes-support/libexif/files/CVE-2020-0452.patch

diff --git a/meta/recipes-support/libexif/files/CVE-2020-0198.patch b/meta/recipes-support/libexif/files/CVE-2020-0198.patch
new file mode 100644
index 0000000000..2a48844cb2
--- /dev/null
+++ b/meta/recipes-support/libexif/files/CVE-2020-0198.patch
@@ -0,0 +1,66 @@
+From ca71eda33fe8421f98fbe20eb4392473357c1c43 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 30 Dec 2020 10:22:47 +0800
+Subject: [PATCH] fixed another unsigned integer overflow
+
+first fixed by google in android fork,
+https://android.googlesource.com/platform/external/libexif/+/1e187b62682ffab5003c702657d6d725b4278f16%5E%21/#F0
+
+(use a more generic overflow check method, also check second overflow instance.)
+
+https://security-tracker.debian.org/tracker/CVE-2020-0198
+
+Upstream-Status: Backport[https://github.com/libexif/libexif/commit/ce03ad7ef4e8aeefce79192bf5b6f69fae396f0c]
+CVE: CVE-2020-0198
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libexif/exif-data.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/libexif/exif-data.c b/libexif/exif-data.c
+index 8b280d3..34d58fc 100644
+--- a/libexif/exif-data.c
++++ b/libexif/exif-data.c
+@@ -47,6 +47,8 @@
+ #undef JPEG_MARKER_APP1
+ #define JPEG_MARKER_APP1 0xe1
+ 
++#define CHECKOVERFLOW(offset,datasize,structsize) (( offset >= datasize) || (structsize > datasize) || (offset > datasize - structsize ))
++
+ static const unsigned char ExifHeader[] = {0x45, 0x78, 0x69, 0x66, 0x00, 0x00};
+ 
+ struct _ExifDataPrivate
+@@ -327,7 +329,7 @@ exif_data_load_data_thumbnail (ExifData *data, const unsigned char *d,
+ 		exif_log (data->priv->log, EXIF_LOG_CODE_DEBUG, "ExifData", "Bogus thumbnail offset (%u).", o);
+ 		return;
+ 	}
+-	if (s > ds - o) {
++	if (CHECKOVERFLOW(o,ds,s)) {
+ 		exif_log (data->priv->log, EXIF_LOG_CODE_DEBUG, "ExifData", "Bogus thumbnail size (%u), max would be %u.", s, ds-o);
+ 		return;
+ 	}
+@@ -420,9 +422,9 @@ exif_data_load_data_content (ExifData *data, ExifIfd ifd,
+ 	}
+ 
+ 	/* Read the number of entries */
+-	if ((offset + 2 < offset) || (offset + 2 < 2) || (offset + 2 > ds)) {
++	if (CHECKOVERFLOW(offset, ds, 2)) {
+ 		exif_log (data->priv->log, EXIF_LOG_CODE_CORRUPT_DATA, "ExifData",
+-			  "Tag data past end of buffer (%u > %u)", offset+2, ds);
++			  "Tag data past end of buffer (%u+2 > %u)", offset, ds);
+ 		return;
+ 	}
+ 	n = exif_get_short (d + offset, data->priv->order);
+@@ -431,7 +433,7 @@ exif_data_load_data_content (ExifData *data, ExifIfd ifd,
+ 	offset += 2;
+ 
+ 	/* Check if we have enough data. */
+-	if (offset + 12 * n > ds) {
++	if (CHECKOVERFLOW(offset, ds, 12*n)) {
+ 		n = (ds - offset) / 12;
+ 		exif_log (data->priv->log, EXIF_LOG_CODE_DEBUG, "ExifData",
+ 				  "Short data; only loading %hu entries...", n);
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/libexif/files/CVE-2020-0452.patch b/meta/recipes-support/libexif/files/CVE-2020-0452.patch
new file mode 100644
index 0000000000..a117b8b369
--- /dev/null
+++ b/meta/recipes-support/libexif/files/CVE-2020-0452.patch
@@ -0,0 +1,39 @@
+From 302acd49eba0a125b0f20692df6abc6f7f7ca53e Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 30 Dec 2020 10:18:51 +0800
+Subject: [PATCH] fixed a incorrect overflow check that could be optimized
+ away.
+
+inspired by:
+https://android.googlesource.com/platform/external/libexif/+/8e7345f3bc0bad06ac369d6cbc1124c8ceaf7d4b
+
+https://source.android.com/security/bulletin/2020-11-01
+
+CVE-2020-0452
+
+Upsteam-Status: Backport[https://github.com/libexif/libexif/commit/9266d14b5ca4e29b970fa03272318e5f99386e06]
+CVE: CVE-2020-0452
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libexif/exif-entry.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libexif/exif-entry.c b/libexif/exif-entry.c
+index 5de215f..3a6ce84 100644
+--- a/libexif/exif-entry.c
++++ b/libexif/exif-entry.c
+@@ -1371,8 +1371,8 @@ exif_entry_get_value (ExifEntry *e, char *val, unsigned int maxlen)
+ 	{
+ 		unsigned char *utf16;
+ 
+-		/* Sanity check the size to prevent overflow */
+-		if (e->size+sizeof(uint16_t)+1 < e->size) break;
++		/* Sanity check the size to prevent overflow. Note EXIF files are 64kb at most. */
++		if (e->size >= 65536 - sizeof(uint16_t)*2) break;
+ 
+ 		/* The tag may not be U+0000-terminated , so make a local
+ 		   U+0000-terminated copy before converting it */
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/libexif/libexif_0.6.22.bb b/meta/recipes-support/libexif/libexif_0.6.22.bb
index 2478ba07d8..dc30926c59 100644
--- a/meta/recipes-support/libexif/libexif_0.6.22.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.22.bb
@@ -8,6 +8,8 @@ def version_underscore(v):
     return "_".join(v.split("."))
 
 SRC_URI = "https://github.com/libexif/libexif/releases/download/libexif-${@version_underscore("${PV}")}-release/libexif-${PV}.tar.xz \
+           file://CVE-2020-0198.patch \
+           file://CVE-2020-0452.patch \
            "
 
 SRC_URI[sha256sum] = "5048f1c8fc509cc636c2f97f4b40c293338b6041a5652082d5ee2cf54b530c56"
-- 
2.29.2

