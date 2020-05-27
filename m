Received: from mga04.intel.com (mga04.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.2877.1590572831380485674
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2020 02:47:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: 7itCc52H9Elv7gYNDf054bGxH05qTaTQLGeWeAYlsqXYRPLMKxU0hYYMiyImMszPk9QiieRJNG
 ONvYK+x9qCEQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2020 02:47:11 -0700
IronPort-SDR: 0n/MP7N20d9zXFpj7pNTqgPEikKxyPhrslX/xl5jdp/5FecfM4zQwEqWJAEZZftzF8wlAe6hKE
 3X8jWZW6Vfdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,440,1583222400"; 
   d="scan'208";a="468651405"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga005.fm.intel.com with ESMTP; 27 May 2020 02:47:10 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell 2/2] libexif: fix CVE-2020-13114
Date: Wed, 27 May 2020 17:47:08 +0800
Message-Id: <1590572828-47312-2-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590572828-47312-1-git-send-email-chee.yang.lee@intel.com>
References: <1590572828-47312-1-git-send-email-chee.yang.lee@intel.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../libexif/libexif/CVE-2020-13114.patch           | 73 ++++++++++++++++++++++
 meta/recipes-support/libexif/libexif_0.6.21.bb     |  4 +-
 2 files changed, 76 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libexif/libexif/CVE-2020-13114.patch

diff --git a/meta/recipes-support/libexif/libexif/CVE-2020-13114.patch b/meta/recipes-support/libexif/libexif/CVE-2020-13114.patch
new file mode 100644
index 0000000..06b8b46
--- /dev/null
+++ b/meta/recipes-support/libexif/libexif/CVE-2020-13114.patch
@@ -0,0 +1,73 @@
+From 47f51be021f4dfd800d4ff4630659887378baa3a Mon Sep 17 00:00:00 2001
+From: Dan Fandrich <dan@coneharvesters.com>
+Date: Sat, 16 May 2020 19:32:30 +0200
+Subject: [PATCH] Add a failsafe on the maximum number of Canon MakerNote
+
+ subtags.
+
+A malicious file could be crafted to cause extremely large values in some
+tags without tripping any buffer range checks.  This is bad with the libexif
+representation of Canon MakerNotes because some arrays are turned into
+individual tags that the application must loop around.
+
+The largest value I've seen for failsafe_size in a (very small) sample of valid
+Canon files is <5000.  The limit is set two orders of magnitude larger to avoid
+tripping up falsely in case some models use much larger values.
+
+Patch from Google.
+
+CVE-2020-13114
+
+Upstream-Status: Backport [https://github.com/libexif/libexif/commit/e6a38a1a23ba94d139b1fa2cd4519fdcfe3c9bab]
+CVE: CVE-2020-13114
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+---
+ libexif/canon/exif-mnote-data-canon.c | 21 +++++++++++++++++++++
+ 1 file changed, 21 insertions(+)
+
+diff --git a/libexif/canon/exif-mnote-data-canon.c b/libexif/canon/exif-mnote-data-canon.c
+index eb53598..72fd7a3 100644
+--- a/libexif/canon/exif-mnote-data-canon.c
++++ b/libexif/canon/exif-mnote-data-canon.c
+@@ -32,6 +32,9 @@
+ 
+ #define DEBUG
+ 
++/* Total size limit to prevent abuse by DoS */
++#define FAILSAFE_SIZE_MAX 1000000L
++
+ static void
+ exif_mnote_data_canon_clear (ExifMnoteDataCanon *n)
+ {
+@@ -202,6 +205,7 @@ exif_mnote_data_canon_load (ExifMnoteData *ne,
+ 	ExifMnoteDataCanon *n = (ExifMnoteDataCanon *) ne;
+ 	ExifShort c;
+ 	size_t i, tcount, o, datao;
++	long failsafe_size = 0;
+ 
+ 	if (!n || !buf || !buf_size) {
+ 		exif_log (ne->log, EXIF_LOG_CODE_CORRUPT_DATA,
+@@ -280,6 +284,23 @@ exif_mnote_data_canon_load (ExifMnoteData *ne,
+ 			memcpy (n->entries[tcount].data, buf + dataofs, s);
+ 		}
+ 
++		/* Track the size of decoded tag data. A malicious file could
++		 * be crafted to cause extremely large values here without
++		 * tripping any buffer range checks.  This is especially bad
++		 * with the libexif representation of Canon MakerNotes because
++		 * some arrays are turned into individual tags that the
++		 * application must loop around. */
++		failsafe_size += mnote_canon_entry_count_values(&n->entries[tcount]);
++
++		if (failsafe_size > FAILSAFE_SIZE_MAX) {
++			/* Abort if the total size of the data in the tags extraordinarily large, */
++			exif_mem_free (ne->mem, n->entries[tcount].data);
++			exif_log (ne->log, EXIF_LOG_CODE_CORRUPT_DATA,
++					  "ExifMnoteCanon", "Failsafe tag size overflow (%lu > %ld)",
++					  failsafe_size, FAILSAFE_SIZE_MAX);
++			break;
++		}
++
+ 		/* Tag was successfully parsed */
+ 		++tcount;
+ 	}
diff --git a/meta/recipes-support/libexif/libexif_0.6.21.bb b/meta/recipes-support/libexif/libexif_0.6.21.bb
index d847bea..3f6fa32 100644
--- a/meta/recipes-support/libexif/libexif_0.6.21.bb
+++ b/meta/recipes-support/libexif/libexif_0.6.21.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
 SRC_URI = "${SOURCEFORGE_MIRROR}/libexif/libexif-${PV}.tar.bz2 \
            file://CVE-2017-7544.patch \
            file://CVE-2016-6328.patch \
-           file://CVE-2018-20030.patch"
+           file://CVE-2018-20030.patch \
+           file://CVE-2020-13114.patch \
+"
 
 SRC_URI[md5sum] = "27339b89850f28c8f1c237f233e05b27"
 SRC_URI[sha256sum] = "16cdaeb62eb3e6dfab2435f7d7bccd2f37438d21c5218ec4e58efa9157d4d41a"
-- 
2.7.4

