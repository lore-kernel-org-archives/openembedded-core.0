Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1CA8C369BA
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 16:12:09 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web11.24242.1744733518593558742
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 09:12:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=BZ2DKNhJ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20250415161155e1931c136cca6ac11e-ipmzuu@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20250415161155e1931c136cca6ac11e
        for <openembedded-core@lists.openembedded.org>;
        Tue, 15 Apr 2025 18:11:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Ph32QI3OBuz4BKNEw7Rr8AxC8lYbaRGEOXoEJ0IT6gk=;
 b=BZ2DKNhJnIGlONpdLQXK6OvqtTQ+Y4NqZubDpSTXc5OKwb4AIscFqj5TlNc8vo42clx1Nr
 xXYEsFC70r5SkWqBVyZ70b6YK1mpYEkka3XxFpGPtXWstybIsabiaoacV3mcV6pUCFsRYHMa
 Vg2DoVBD7mPzI9LsnIWBLpbFihREqHeBrLjqwkBWgK46XNZf6FC7lvGwC/li2cj6wsiiLzHr
 YZI4KTVkouLTR266MQPRnJD5FtW6Ljx126mDOgNWTQZycy99i78Z7i9axk47OSDz3g4lp1Jc
 TZg50iqLThZawJIFWb9o1oaMdqYIpyRmWj03Nqwhn58Xc+VcvqTcufDQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] libarchive: upgrade 3.7.4 -> 3.7.9
Date: Tue, 15 Apr 2025 18:10:45 +0200
Message-Id: <20250415161045.1598385-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 16:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214954

From: Peter Marko <peter.marko@siemens.com>

These is update with only bug and security releases.
On top of previous CVE patches, also CVE-2024-48615 is handled.
Also many security fixes without CVE assigment are included.

Note that upgrade to 3.7.5 on master required fix of test in
python3-libarchive-c, however that recipe does not yet have ptest in
scarthgap and the fix was in test only, not in productive code, so it is
not necessary in scarthgap.

Also remove CVE_STATUS which was obsolete already before this upgrade.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libarchive/CVE-2024-20696.patch           | 115 ------------------
 .../libarchive/CVE-2024-48957.patch           |  36 ------
 .../libarchive/CVE-2024-48958.patch           |  40 ------
 .../CVE-2025-1632_CVE-2025-25724.patch        |  83 -------------
 .../libarchive/libarchive/configurehack.patch |   4 +-
 ...ibarchive_3.7.4.bb => libarchive_3.7.9.bb} |  12 +-
 6 files changed, 5 insertions(+), 285 deletions(-)
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2024-20696.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2024-48957.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2024-48958.patch
 delete mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-1632_CVE-2025-25724.patch
 rename meta/recipes-extended/libarchive/{libarchive_3.7.4.bb => libarchive_3.7.9.bb} (84%)

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2024-20696.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2024-20696.patch
deleted file mode 100644
index e55d58d37b..0000000000
--- a/meta/recipes-extended/libarchive/libarchive/CVE-2024-20696.patch
+++ /dev/null
@@ -1,115 +0,0 @@
-From eac15e252010c1189a5c0f461364dbe2cd2a68b1 Mon Sep 17 00:00:00 2001
-From: "Dustin L. Howett" <dustin@howett.net>
-Date: Thu, 9 May 2024 18:59:17 -0500
-Subject: [PATCH] rar4 reader: protect copy_from_lzss_window_to_unp() (#2172)
-
-copy_from_lzss_window_to_unp unnecessarily took an `int` parameter where
-both of its callers were holding a `size_t`.
-
-A lzss opcode chain could be constructed that resulted in a negative
-copy length, which when passed into memcpy would result in a very, very
-large positive number.
-
-Switching copy_from_lzss_window_to_unp to take a `size_t` allows it to
-properly bounds-check length.
-
-In addition, this patch also ensures that `length` is not itself larger
-than the destination buffer.
-
-CVE: CVE-2024-20696
-Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/eac15e252010c1189a5c0f461364dbe2cd2a68b1]
-
-Signed-off-by: Nitin Wankhade <nitin.wankhade@kpit.com>
----
-
---- a/libarchive/archive_read_support_format_rar.c	2024-04-26 14:52:59.000000000 +0530
-+++ b/libarchive/archive_read_support_format_rar.c	2024-12-12 07:35:33.287412704 +0530
-@@ -432,7 +432,7 @@ static int make_table_recurse(struct arc
-                               struct huffman_table_entry *, int, int);
- static int expand(struct archive_read *, int64_t *);
- static int copy_from_lzss_window_to_unp(struct archive_read *, const void **,
--                                        int64_t, int);
-+                                        int64_t, size_t);
- static const void *rar_read_ahead(struct archive_read *, size_t, ssize_t *);
- static int parse_filter(struct archive_read *, const uint8_t *, uint16_t,
-                         uint8_t);
-@@ -2060,7 +2060,7 @@ read_data_compressed(struct archive_read
-         bs = rar->unp_buffer_size - rar->unp_offset;
-       else
-         bs = (size_t)rar->bytes_uncopied;
--      ret = copy_from_lzss_window_to_unp(a, buff, rar->offset, (int)bs);
-+      ret = copy_from_lzss_window_to_unp(a, buff, rar->offset, bs);
-       if (ret != ARCHIVE_OK)
-         return (ret);
-       rar->offset += bs;
-@@ -2213,7 +2213,7 @@ read_data_compressed(struct archive_read
-       bs = rar->unp_buffer_size - rar->unp_offset;
-     else
-       bs = (size_t)rar->bytes_uncopied;
--    ret = copy_from_lzss_window_to_unp(a, buff, rar->offset, (int)bs);
-+    ret = copy_from_lzss_window_to_unp(a, buff, rar->offset, bs);
-     if (ret != ARCHIVE_OK)
-       return (ret);
-     rar->offset += bs;
-@@ -3094,11 +3094,16 @@ copy_from_lzss_window(struct archive_rea
- 
- static int
- copy_from_lzss_window_to_unp(struct archive_read *a, const void **buffer,
--                             int64_t startpos, int length)
-+                             int64_t startpos, size_t length)
- {
-   int windowoffs, firstpart;
-   struct rar *rar = (struct rar *)(a->format->data);
- 
-+  if (length > rar->unp_buffer_size)
-+  {
-+    goto fatal;
-+  }
-+
-   if (!rar->unp_buffer)
-   {
-     if ((rar->unp_buffer = malloc(rar->unp_buffer_size)) == NULL)
-@@ -3110,17 +3115,17 @@ copy_from_lzss_window_to_unp(struct arch
-   }
- 
-   windowoffs = lzss_offset_for_position(&rar->lzss, startpos);
--  if(windowoffs + length <= lzss_size(&rar->lzss)) {
-+  if(windowoffs + length <= (size_t)lzss_size(&rar->lzss)) {
-     memcpy(&rar->unp_buffer[rar->unp_offset], &rar->lzss.window[windowoffs],
-            length);
--  } else if (length <= lzss_size(&rar->lzss)) {
-+  } else if (length <= (size_t)lzss_size(&rar->lzss)) {
-     firstpart = lzss_size(&rar->lzss) - windowoffs;
-     if (firstpart < 0) {
-       archive_set_error(&a->archive, ARCHIVE_ERRNO_FILE_FORMAT,
-                         "Bad RAR file data");
-       return (ARCHIVE_FATAL);
-     }
--    if (firstpart < length) {
-+    if ((size_t)firstpart < length) {
-       memcpy(&rar->unp_buffer[rar->unp_offset],
-              &rar->lzss.window[windowoffs], firstpart);
-       memcpy(&rar->unp_buffer[rar->unp_offset + firstpart],
-@@ -3130,9 +3135,7 @@ copy_from_lzss_window_to_unp(struct arch
-              &rar->lzss.window[windowoffs], length);
-     }
-   } else {
--      archive_set_error(&a->archive, ARCHIVE_ERRNO_FILE_FORMAT,
--                        "Bad RAR file data");
--      return (ARCHIVE_FATAL);
-+      goto fatal;
-   }
-   rar->unp_offset += length;
-   if (rar->unp_offset >= rar->unp_buffer_size)
-@@ -3140,6 +3143,11 @@ copy_from_lzss_window_to_unp(struct arch
-   else
-     *buffer = NULL;
-   return (ARCHIVE_OK);
-+
-+fatal:
-+  archive_set_error(&a->archive, ARCHIVE_ERRNO_FILE_FORMAT,
-+                    "Bad RAR file data");
-+  return (ARCHIVE_FATAL);
- }
- 
- static const void *
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2024-48957.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2024-48957.patch
deleted file mode 100644
index 98877cf72c..0000000000
--- a/meta/recipes-extended/libarchive/libarchive/CVE-2024-48957.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 3006bc5d02ad3ae3c4f9274f60c1f9d2d834734b Mon Sep 17 00:00:00 2001
-From: Wei-Cheng Pan <legnaleurc@gmail.com>
-Date: Mon, 29 Apr 2024 06:53:19 +0900
-Subject: [PATCH] fix: OOB in rar audio filter (#2149)
-
-This patch ensures that `src` won't move ahead of `dst`, so `src` will
-not OOB. Similar situation like in a1cb648.
-
-Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/3006bc5d02ad3ae3c4f9274f60c1f9d2d834734b]
-CVE: CVE-2024-48957
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- libarchive/archive_read_support_format_rar.c | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/archive_read_support_format_rar.c
-index 79669a8..95a91dc 100644
---- a/libarchive/archive_read_support_format_rar.c
-+++ b/libarchive/archive_read_support_format_rar.c
-@@ -3714,6 +3714,13 @@ execute_filter_audio(struct rar_filter *filter, struct rar_virtual_machine *vm)
-     memset(&state, 0, sizeof(state));
-     for (j = i; j < length; j += numchannels)
-     {
-+      /*
-+       * The src block should not overlap with the dst block.
-+       * If so it would be better to consider this archive is broken.
-+       */
-+      if (src >= dst)
-+        return 0;
-+
-       int8_t delta = (int8_t)*src++;
-       uint8_t predbyte, byte;
-       int prederror;
--- 
-2.25.1
-
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2024-48958.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2024-48958.patch
deleted file mode 100644
index de266e9d95..0000000000
--- a/meta/recipes-extended/libarchive/libarchive/CVE-2024-48958.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From a1cb648d52f5b6d3f31184d9b6a7cbca628459b7 Mon Sep 17 00:00:00 2001
-From: Wei-Cheng Pan <legnaleurc@gmail.com>
-Date: Mon, 29 Apr 2024 06:50:22 +0900
-Subject: [PATCH] fix: OOB in rar delta filter (#2148)
-
-Ensure that `src` won't move ahead of `dst`, so `src` will not OOB.
-Since `dst` won't move in this function, and we are only increasing `src`
-position, this check should be enough. It should be safe to early return
-because this function does not allocate resources.
-
-Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/a1cb648d52f5b6d3f31184d9b6a7cbca628459b7]
-CVE: CVE-2024-48958
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- libarchive/archive_read_support_format_rar.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/archive_read_support_format_rar.c
-index 95a91dc..4fc6626 100644
---- a/libarchive/archive_read_support_format_rar.c
-+++ b/libarchive/archive_read_support_format_rar.c
-@@ -3612,7 +3612,15 @@ execute_filter_delta(struct rar_filter *filter, struct rar_virtual_machine *vm)
-   {
-     uint8_t lastbyte = 0;
-     for (idx = i; idx < length; idx += numchannels)
-+    {
-+      /*
-+       * The src block should not overlap with the dst block.
-+       * If so it would be better to consider this archive is broken.
-+       */
-+      if (src >= dst)
-+        return 0;
-       lastbyte = dst[idx] = lastbyte - *src++;
-+    }
-   }
- 
-   filter->filteredblockaddress = length;
--- 
-2.25.1
-
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-1632_CVE-2025-25724.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-1632_CVE-2025-25724.patch
deleted file mode 100644
index 459b664180..0000000000
--- a/meta/recipes-extended/libarchive/libarchive/CVE-2025-1632_CVE-2025-25724.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-From c9bc934e7e91d302e0feca6e713ccc38d6d01532 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Peter=20K=C3=A4stle?= <peter@piie.net>
-Date: Mon, 10 Mar 2025 16:43:04 +0100
-Subject: [PATCH] fix CVE-2025-1632 and CVE-2025-25724 (#2532)
-
-Hi,
-
-please find my approach to fix the CVE-2025-1632 and CVE-2025-25724
-vulnerabilities in this pr.
-As both error cases did trigger a NULL pointer deref (and triggered
-hopefully everywhere a coredump), we can safely replace the actual
-information by a predefined invalid string without breaking any
-functionality.
-
-CVE: CVE-2025-1632
-CVE: CVE-2025-25724
-Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/c9bc934e7e91d302e0feca6e713ccc38d6d01532]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----------
-
-Signed-off-by: Peter Kaestle <peter@piie.net>
----
- tar/util.c       |  5 ++++-
- unzip/bsdunzip.c | 10 +++++++---
- 2 files changed, 11 insertions(+), 4 deletions(-)
-
-diff --git a/tar/util.c b/tar/util.c
-index 3b099cb5..f3cbdf0b 100644
---- a/tar/util.c
-+++ b/tar/util.c
-@@ -748,7 +748,10 @@ list_item_verbose(struct bsdtar *bsdtar, FILE *out, struct archive_entry *entry)
- #else
- 	ltime = localtime(&tim);
- #endif
--	strftime(tmp, sizeof(tmp), fmt, ltime);
-+	if (ltime)
-+		strftime(tmp, sizeof(tmp), fmt, ltime);
-+	else
-+		sprintf(tmp, "-- -- ----");
- 	fprintf(out, " %s ", tmp);
- 	safe_fprintf(out, "%s", archive_entry_pathname(entry));
- 
-diff --git a/unzip/bsdunzip.c b/unzip/bsdunzip.c
-index 7c8cafc3..4a9028b7 100644
---- a/unzip/bsdunzip.c
-+++ b/unzip/bsdunzip.c
-@@ -904,6 +904,7 @@ list(struct archive *a, struct archive_entry *e)
- 	char buf[20];
- 	time_t mtime;
- 	struct tm *tm;
-+	const char *pathname;
- 
- 	mtime = archive_entry_mtime(e);
- 	tm = localtime(&mtime);
-@@ -912,22 +913,25 @@ list(struct archive *a, struct archive_entry *e)
- 	else
- 		strftime(buf, sizeof(buf), "%m-%d-%g %R", tm);
- 
-+	pathname = archive_entry_pathname(e);
-+	if (!pathname)
-+		pathname = "";
- 	if (!zipinfo_mode) {
- 		if (v_opt == 1) {
- 			printf(" %8ju  %s   %s\n",
- 			    (uintmax_t)archive_entry_size(e),
--			    buf, archive_entry_pathname(e));
-+			    buf, pathname);
- 		} else if (v_opt == 2) {
- 			printf("%8ju  Stored  %7ju   0%%  %s  %08x  %s\n",
- 			    (uintmax_t)archive_entry_size(e),
- 			    (uintmax_t)archive_entry_size(e),
- 			    buf,
- 			    0U,
--			    archive_entry_pathname(e));
-+			    pathname);
- 		}
- 	} else {
- 		if (Z1_opt)
--			printf("%s\n",archive_entry_pathname(e));
-+			printf("%s\n", pathname);
- 	}
- 	ac(archive_read_data_skip(a));
- }
diff --git a/meta/recipes-extended/libarchive/libarchive/configurehack.patch b/meta/recipes-extended/libarchive/libarchive/configurehack.patch
index 44720fdd53..97e42591cb 100644
--- a/meta/recipes-extended/libarchive/libarchive/configurehack.patch
+++ b/meta/recipes-extended/libarchive/libarchive/configurehack.patch
@@ -10,7 +10,7 @@ diff --git a/configure.ac b/configure.ac
 index 5668d41..7e65e49 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -414,6 +414,19 @@ if test "x$with_bz2lib" != "xno"; then
+@@ -435,6 +435,19 @@ if test "x$with_bz2lib" != "xno"; then
    esac
  fi
  
@@ -30,7 +30,7 @@ index 5668d41..7e65e49 100644
  AC_ARG_WITH([libb2],
    AS_HELP_STRING([--without-libb2], [Don't build support for BLAKE2 through libb2]))
  
-@@ -678,19 +691,6 @@ fi
+@@ -694,19 +707,6 @@ fi
  
  AC_SUBST(DEAD_CODE_REMOVAL)
  
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.4.bb b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
similarity index 84%
rename from meta/recipes-extended/libarchive/libarchive_3.7.4.bb
rename to meta/recipes-extended/libarchive/libarchive_3.7.9.bb
index 156a6bdaae..4dd6794bb1 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -29,18 +29,12 @@ PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd,"
 
 EXTRA_OECONF += "--enable-largefile --without-iconv"
 
-SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
-SRC_URI += "file://configurehack.patch \
-            file://CVE-2024-48957.patch \
-            file://CVE-2024-48958.patch \
-            file://CVE-2024-20696.patch \
-            file://CVE-2025-1632_CVE-2025-25724.patch \
+SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
+           file://configurehack.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-SRC_URI[sha256sum] = "7875d49596286055b52439ed42f044bd8ad426aa4cc5aabd96bfe7abb971d5e8"
-
-CVE_STATUS[CVE-2023-30571] = "upstream-wontfix: upstream has documented that reported function is not thread-safe"
+SRC_URI[sha256sum] = "aa90732c5a6bdda52fda2ad468ac98d75be981c15dde263d7b5cf6af66fd009f"
 
 inherit autotools update-alternatives pkgconfig
 

