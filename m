Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.4716.1594242489589314929
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 14:08:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=rsLsIPKT;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=z9mr=at=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4B2BjL1V83z7s
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2020 23:08:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1594242486;
	bh=9KafT5iIvqhFO69c62EMALdb8ccxihyxZRspyVlcYKQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rsLsIPKTJXxe+MTsjdko/8oqh3HMeSkIWeO2aVPGvAx4nXNdvcPXkV01TGA0d1Xw1
	 W7uTPU2FB2J1Kvac/Gap2JgT4+MbYwPY9n3Lma6QaHTmE+hQGapMU9UVsjZkg6xUJ9
	 BviLBXdl/B8PtwZ0hfbtPGqMyNvaMJqeiREpnO79d/iLRqkYRkeNvUY3AQgMKHeyFf
	 6avPnK9FX5BDY8eLefE99YgqVupYBAkFSHhHwaSjhxS8KutDcLrSkK72PHBPNtcqdX
	 ifbs4eHHyICH49IwXMrSKjGi2GN6227uDCVPUwPKLhXSodInrj9tixbNHBz/L8OUku
	 wdVUWeJtJOVo0sRyXHKAwbrcgVxGHHqS68WNkY8TWVQDec9WtALQDVPyiK0vt5UxCf
	 I744J7wgPgfR9t/mc5eZ5RQFgt05jrojuz0qRwT3hz1jdiD1IEg5JXkw0SrvIpH0r/
	 QHm1wIUbmXoLirmRd/uVzoxZ3676RFDTojLv7UdDC5o/lCWUhrL5kbDRHgsI8CYGv7
	 iZAZCKbcRYMzjtSyXVcqXAF1ZrKJYFIt7cjkzewPAGRtPGmAyzkjjK7it/0dSKa8TH
	 L9QBXiD+NMcy+T8MsdWQX742NH7SvFdk6hciDa7Di9eR+08qFbPuaInOTQpvYEZssb
	 4pXY/vERAIDw/GygClWdJKBc=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][zeus][PATCH 07/19] libexif: fix CVE-2020-13114
Date: Thu,  9 Jul 2020 00:07:49 +0300
Message-Id: <20200708210801.5553-7-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200708210801.5553-1-bunk@stusta.de>
References: <20200708210801.5553-1-bunk@stusta.de>

From: Lee Chee Yang <chee.yang.lee@intel.com>

(From OE-Core rev: 2e497029ee00babbc50f3c1d99580230bc46155c)

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
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
2.17.1

