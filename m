Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.8237.1595926357616374658
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 01:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: zaBt/Fz/V4sFI3tzklSLicT3X5kNaX4AhGfDw5OrgpEzYMwr5pGgN+CiwSnN1QO4DLRfOrSkUx
 O8y1OwD8xQRw==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="215699668"
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="215699668"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:52:47 -0700
IronPort-SDR: 39gm9P3P/TdI4oMrcMtafeycLPICxMig+AVe00l66Ni70o1XkeG+0doGn0FF0xiTMUQfyQwh3t
 WSRZ+HTyLOIg==
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="434245727"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.137.161])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:52:46 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 06/32] libexif: fix CVE-2020-13114
Date: Tue, 28 Jul 2020 16:51:07 +0800
Message-Id: <221e42c20148bb57986dfa862b352b9264694003.1595924916.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1595924916.git.anuj.mittal@intel.com>
References: <cover.1595924916.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

(From OE-Core rev: 2e497029ee00babbc50f3c1d99580230bc46155c)

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libexif/libexif/CVE-2020-13114.patch      | 73 +++++++++++++++++++
 .../recipes-support/libexif/libexif_0.6.21.bb |  4 +-
 2 files changed, 76 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libexif/libexif/CVE-2020-13114.patch

diff --git a/meta/recipes-support/libexif/libexif/CVE-2020-13114.patch b/meta/recipes-support/libexif/libexif/CVE-2020-13114.patch
new file mode 100644
index 0000000000..06b8b46c21
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
index d847beab18..3f6fa32b25 100644
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
2.25.4

