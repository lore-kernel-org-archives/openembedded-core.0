Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web12.38010.1591020733174292548
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 07:12:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=PYmB3SbR;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.68, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f68.google.com with SMTP id fs4so5202302pjb.5
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 07:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=zM+UbIl7RBAQDU4i/GlL6UnzgO5CDOQiIV1f2RDvJl4=;
        b=PYmB3SbRzL03ce95R+q/mrTVSfqiP1jW8eIz2eelMjDhoLaOhb3myYpDo4tkkT1LTH
         dvhLaNn0ZMHN2/1r/xz4H7+fhjRc4uEEVNnyVV6UVYKnjAMQ8hhgcji9Xg7J889V9Len
         LPmsMAMUxEWAT8Cccrm2obQ8M9ba673IS+pGxMkKi9TqrwxJzUInzMQBC8Z3iHrfa+F4
         eIS9RqC9H+AICHtN/vX8uGAxjgrm6bzo+9gVLrE2fI5LikGKb9olkQJDy48SoTiD1WcG
         qcFf04io3r1/Y5YX1xPtQ6BvdJaU2r7KJNWUAFSmn2zzlzpMAS0MI48oOnjX5v/vqVUr
         SGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=zM+UbIl7RBAQDU4i/GlL6UnzgO5CDOQiIV1f2RDvJl4=;
        b=ru9eGqyNDe0a10YwAP5CvjPZCHZ9skdaCPM1Hbn1RCxpisfKct9Ed77zkOCuP/AsRD
         O0FO+TYIyMJIPFThYBEaN6cLv5jXSPJCXqN2vKO3Kje1oNXUng1x3V2Ezq79hA410S2J
         f82gTcCH2ppLv8fp3c8lzPZUuhA0x1fmHVYC5/HV+UPdB6Tlguvxy26n+py8rQcoSXju
         Bpb7pAJ+ov4KKcjLDuoh94+YYHHFBsJRDr2pV8RMb3ra4Y6ABaU29qWAT6rA+kuyETiT
         TsaXN0Ns3JwddCXA91i/FDKb6/MdAOZ2ugk2i9Z488rSl+LhC3Z53LNUcTJ+TADo/GPA
         imKw==
X-Gm-Message-State: AOAM5314XLRG1hgpSJNWpvHEbofz0NFSbHwUra2Z8F//+cei6X1Vn/Bx
	CqEPSqIvTuKYJTz7xUh9hlCPIV8fhmY=
X-Google-Smtp-Source: ABdhPJxajJcf4LIaJoppxLJX4WpYM9eJqG76/G9oEgAolf1hSBYMDAjAHNbvvcRFm8cDLyHhv+z5cA==
X-Received: by 2002:a17:902:7897:: with SMTP id q23mr4255016pll.5.1591020732202;
        Mon, 01 Jun 2020 07:12:12 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u19sm5509859pfk.98.2020.06.01.07.12.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 07:12:11 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/16] libexif: fix CVE-2020-13114
Date: Mon,  1 Jun 2020 04:11:18 -1000
Message-Id: <2e497029ee00babbc50f3c1d99580230bc46155c.1591020366.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591020366.git.steve@sakoman.com>
References: <cover.1591020366.git.steve@sakoman.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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

