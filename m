Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A85E9CA0EFA
	for <webhook@archiver.kernel.org>; Sat, 23 Aug 2025 21:52:06 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.5890.1755985919725736159
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Aug 2025 14:52:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=f8+8KJ1K;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20250823215155ab999a6efbf4307040-qeya7s@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20250823215155ab999a6efbf4307040
        for <openembedded-core@lists.openembedded.org>;
        Sat, 23 Aug 2025 23:51:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=AKAuPsQVtS2ZWaGRmGuF4XUaWOuv9MR05V3V7Q/q46o=;
 b=f8+8KJ1K3v1eWQ10tR/G5Mn/ZIiCXYUNb/WXw68cQ6oD4lJN45K5jP8nVuQU7BM7wUZOsb
 kpQ2V1OhzzLPxPkiDFSolx4GdqJY5/kLSmfC4uV4DXeFMtHghGgPaBHwZgxMj05zOy4xhYA4
 BHjZwHBXdRUbxH/pHNfruDgo2XE2YvIion8lDwxQt64n1YGKoYXzQDDxf+aQx3grh9AxRjSw
 ZMO0ccA/WkdPXLuM9uGK8qTC7mWZlbMzQ6uhc6/XJGKmAB4bZQkuWlbVr2kZynBO5nGX6F35
 gcFtPnvQELpQyi/Xer+rtNXdtgNmJrQebaOcEwARqWDiSX6w/K+OMidw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH 1/3] libarchive: patch CVE-2025-5916
Date: Sat, 23 Aug 2025 23:51:04 +0200
Message-Id: <20250823215106.525689-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Aug 2025 21:52:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222357

From: Peter Marko <peter.marko@siemens.com>

Pick commit per [1]

[1] https://security-tracker.debian.org/tracker/CVE-2025-5916

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libarchive/libarchive/CVE-2025-5916.patch | 111 ++++++++++++++++++
 .../libarchive/libarchive_3.7.9.bb            |   1 +
 2 files changed, 112 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5916.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-5916.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5916.patch
new file mode 100644
index 0000000000..0ea2278cb6
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5916.patch
@@ -0,0 +1,111 @@
+From ef093729521fcf73fa4007d5ae77adfe4df42403 Mon Sep 17 00:00:00 2001
+From: Tobias Stoeckmann <stoeckmann@users.noreply.github.com>
+Date: Mon, 7 Apr 2025 00:24:13 +0200
+Subject: [PATCH] warc: Prevent signed integer overflow (#2568)
+
+If a warc archive claims to have more than INT64_MAX - 4 content bytes,
+the inevitable failure to skip all these bytes could lead to parsing
+data which should be ignored instead.
+
+The test case contains a conversation entry with that many bytes and if
+the entry is not properly skipped, the warc implementation would read
+the conversation data as a new file entry.
+
+Signed-off-by: Tobias Stoeckmann <tobias@stoeckmann.org>
+
+CVE: CVE-2025-5916
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/ef093729521fcf73fa4007d5ae77adfe4df42403]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ Makefile.am                                   |  1 +
+ libarchive/archive_read_support_format_warc.c |  7 ++++--
+ libarchive/test/test_read_format_warc.c       | 24 +++++++++++++++++++
+ .../test_read_format_warc_incomplete.warc.uu  | 10 ++++++++
+ 4 files changed, 40 insertions(+), 2 deletions(-)
+ create mode 100644 libarchive/test/test_read_format_warc_incomplete.warc.uu
+
+diff --git a/Makefile.am b/Makefile.am
+index efc49180..f372cbcb 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -964,6 +964,7 @@ libarchive_test_EXTRA_DIST=\
+ 	libarchive/test/test_read_format_ustar_filename_eucjp.tar.Z.uu \
+ 	libarchive/test/test_read_format_ustar_filename_koi8r.tar.Z.uu \
+ 	libarchive/test/test_read_format_warc.warc.uu \
++	libarchive/test/test_read_format_warc_incomplete.warc.uu \
+ 	libarchive/test/test_read_format_xar_doublelink.xar.uu \
+ 	libarchive/test/test_read_format_xar_duplicate_filename_node.xar.uu \
+ 	libarchive/test/test_read_format_zip.zip.uu \
+diff --git a/libarchive/archive_read_support_format_warc.c b/libarchive/archive_read_support_format_warc.c
+index fcec5bc4..696f959c 100644
+--- a/libarchive/archive_read_support_format_warc.c
++++ b/libarchive/archive_read_support_format_warc.c
+@@ -386,7 +386,8 @@ start_over:
+ 	case LAST_WT:
+ 	default:
+ 		/* consume the content and start over */
+-		_warc_skip(a);
++		if (_warc_skip(a) < 0)
++			return (ARCHIVE_FATAL);
+ 		goto start_over;
+ 	}
+ 	return (ARCHIVE_OK);
+@@ -439,7 +440,9 @@ _warc_skip(struct archive_read *a)
+ {
+ 	struct warc_s *w = a->format->data;
+ 
+-	__archive_read_consume(a, w->cntlen + 4U/*\r\n\r\n separator*/);
++	if (__archive_read_consume(a, w->cntlen) < 0 ||
++	    __archive_read_consume(a, 4U/*\r\n\r\n separator*/) < 0)
++		return (ARCHIVE_FATAL);
+ 	w->cntlen = 0U;
+ 	w->cntoff = 0U;
+ 	return (ARCHIVE_OK);
+diff --git a/libarchive/test/test_read_format_warc.c b/libarchive/test/test_read_format_warc.c
+index 91e6dc67..745aabff 100644
+--- a/libarchive/test/test_read_format_warc.c
++++ b/libarchive/test/test_read_format_warc.c
+@@ -78,3 +78,27 @@ DEFINE_TEST(test_read_format_warc)
+ 	assertEqualIntA(a, ARCHIVE_OK, archive_read_close(a));
+ 	assertEqualInt(ARCHIVE_OK, archive_read_free(a));
+ }
++
++DEFINE_TEST(test_read_format_warc_incomplete)
++{
++	const char reffile[] = "test_read_format_warc_incomplete.warc";
++	struct archive_entry *ae;
++	struct archive *a;
++
++	extract_reference_file(reffile);
++	assert((a = archive_read_new()) != NULL);
++	assertEqualIntA(a, ARCHIVE_OK, archive_read_support_filter_all(a));
++	assertEqualIntA(a, ARCHIVE_OK, archive_read_support_format_all(a));
++	assertEqualIntA(a, ARCHIVE_OK,
++	    archive_read_open_filename(a, reffile, 10240));
++
++	/* Entry cannot be parsed */
++	assertEqualIntA(a, ARCHIVE_FATAL, archive_read_next_header(a, &ae));
++
++	/* Verify archive format. */
++	assertEqualIntA(a, ARCHIVE_FILTER_NONE, archive_filter_code(a, 0));
++
++	/* Verify closing and resource freeing */
++	assertEqualIntA(a, ARCHIVE_OK, archive_read_close(a));
++	assertEqualInt(ARCHIVE_OK, archive_read_free(a));
++}
+diff --git a/libarchive/test/test_read_format_warc_incomplete.warc.uu b/libarchive/test/test_read_format_warc_incomplete.warc.uu
+new file mode 100644
+index 00000000..b91b97ef
+--- /dev/null
++++ b/libarchive/test/test_read_format_warc_incomplete.warc.uu
+@@ -0,0 +1,10 @@
++begin 644 test_read_format_warc_incomplete.warc
++M5T%20R\Q+C`-"E=!4D,M5'EP93H@8V]N=F5R<VEO;@T*5T%20RU$871E.B`R
++M,#(U+3`S+3,P5#$U.C`P.C0P6@T*0V]N=&5N="U,96YG=&@Z(#DR,C,S-S(P
++M,S8X-30W-S4X,#<-"@T*5T%20R\Q+C`-"E=!4D,M5'EP93H@<F5S;W5R8V4-
++M"E=!4D,M5&%R9V5T+55223H@9FEL93HO+W)E861M92YT>'0-"E=!4D,M1&%T
++M93H@,C`R-2TP,RTS,%0Q-3HP,#HT,%H-"D-O;G1E;G0M5'EP93H@=&5X="]P
++M;&%I;@T*0V]N=&5N="U,96YG=&@Z(#,X#0H-"E1H92!R96%D;64N='AT('-H
++4;W5L9"!N;W0@8F4@=FES:6)L90H`
++`
++end
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
index c091508799..1015de3fce 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -32,6 +32,7 @@ EXTRA_OECONF += "--enable-largefile --without-iconv"
 SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2025-5914.patch \
            file://CVE-2025-5915.patch \
+           file://CVE-2025-5916.patch \
            "
 
 UPSTREAM_CHECK_URI = "http://libarchive.org/"

