Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CDD3C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:53:57 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.4490.1741809231298318061
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:53:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=HTU+Dovo;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202503121953481b39af8bb0de372bff-x_sgti@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202503121953481b39af8bb0de372bff
        for <openembedded-core@lists.openembedded.org>;
        Wed, 12 Mar 2025 20:53:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=V0lRLsIC+GrQ/+5XaF8OniK4uq9vxMai2FGJbO42CAk=;
 b=HTU+Dovol6uAeQQkrEEoyYIDEancbqlDBJZVpHurXI7ZR/Y3iXpSBVvE4r6vyHpZyyBFMd
 RbcF8VgjLD3oxk8MjgR7lLFNTfL3baktDjzI9uvGogLFPxafp7/7im3iz/NEnkeNRX0Aarf+
 KC0ReaQBVfCwzYkugGslX4MxEwIxYTmpyrmjMN9bWV/YXyzCQcHs3u8yeoGxegMOdi3a/Qc0
 YCWdyvlIMKikF5H5+by5HtYeCO5HiVdqD90VXg+COcoMRdCiluLUdmK8GJFXzi5HYdcUjd3U
 UJk+P6Sta0oqvX7hvkFGwXcE2nLhJuRC0CDwst6CAGwL2Ipa5mS2ED0w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] libarchive: patch CVE-2025-1632 and CVE-2025-25724
Date: Wed, 12 Mar 2025 20:52:59 +0100
Message-Id: <20250312195259.2198140-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:53:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212693

From: Peter Marko <peter.marko@siemens.com>

Pick commit referencing this MR which was merged to master.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../CVE-2025-1632_CVE-2025-25724.patch        | 83 +++++++++++++++++++
 .../libarchive/libarchive_3.7.4.bb            |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-1632_CVE-2025-25724.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-1632_CVE-2025-25724.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-1632_CVE-2025-25724.patch
new file mode 100644
index 0000000000..459b664180
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2025-1632_CVE-2025-25724.patch
@@ -0,0 +1,83 @@
+From c9bc934e7e91d302e0feca6e713ccc38d6d01532 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Peter=20K=C3=A4stle?= <peter@piie.net>
+Date: Mon, 10 Mar 2025 16:43:04 +0100
+Subject: [PATCH] fix CVE-2025-1632 and CVE-2025-25724 (#2532)
+
+Hi,
+
+please find my approach to fix the CVE-2025-1632 and CVE-2025-25724
+vulnerabilities in this pr.
+As both error cases did trigger a NULL pointer deref (and triggered
+hopefully everywhere a coredump), we can safely replace the actual
+information by a predefined invalid string without breaking any
+functionality.
+
+CVE: CVE-2025-1632
+CVE: CVE-2025-25724
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/c9bc934e7e91d302e0feca6e713ccc38d6d01532]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---------
+
+Signed-off-by: Peter Kaestle <peter@piie.net>
+---
+ tar/util.c       |  5 ++++-
+ unzip/bsdunzip.c | 10 +++++++---
+ 2 files changed, 11 insertions(+), 4 deletions(-)
+
+diff --git a/tar/util.c b/tar/util.c
+index 3b099cb5..f3cbdf0b 100644
+--- a/tar/util.c
++++ b/tar/util.c
+@@ -748,7 +748,10 @@ list_item_verbose(struct bsdtar *bsdtar, FILE *out, struct archive_entry *entry)
+ #else
+ 	ltime = localtime(&tim);
+ #endif
+-	strftime(tmp, sizeof(tmp), fmt, ltime);
++	if (ltime)
++		strftime(tmp, sizeof(tmp), fmt, ltime);
++	else
++		sprintf(tmp, "-- -- ----");
+ 	fprintf(out, " %s ", tmp);
+ 	safe_fprintf(out, "%s", archive_entry_pathname(entry));
+ 
+diff --git a/unzip/bsdunzip.c b/unzip/bsdunzip.c
+index 7c8cafc3..4a9028b7 100644
+--- a/unzip/bsdunzip.c
++++ b/unzip/bsdunzip.c
+@@ -904,6 +904,7 @@ list(struct archive *a, struct archive_entry *e)
+ 	char buf[20];
+ 	time_t mtime;
+ 	struct tm *tm;
++	const char *pathname;
+ 
+ 	mtime = archive_entry_mtime(e);
+ 	tm = localtime(&mtime);
+@@ -912,22 +913,25 @@ list(struct archive *a, struct archive_entry *e)
+ 	else
+ 		strftime(buf, sizeof(buf), "%m-%d-%g %R", tm);
+ 
++	pathname = archive_entry_pathname(e);
++	if (!pathname)
++		pathname = "";
+ 	if (!zipinfo_mode) {
+ 		if (v_opt == 1) {
+ 			printf(" %8ju  %s   %s\n",
+ 			    (uintmax_t)archive_entry_size(e),
+-			    buf, archive_entry_pathname(e));
++			    buf, pathname);
+ 		} else if (v_opt == 2) {
+ 			printf("%8ju  Stored  %7ju   0%%  %s  %08x  %s\n",
+ 			    (uintmax_t)archive_entry_size(e),
+ 			    (uintmax_t)archive_entry_size(e),
+ 			    buf,
+ 			    0U,
+-			    archive_entry_pathname(e));
++			    pathname);
+ 		}
+ 	} else {
+ 		if (Z1_opt)
+-			printf("%s\n",archive_entry_pathname(e));
++			printf("%s\n", pathname);
+ 	}
+ 	ac(archive_read_data_skip(a));
+ }
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.4.bb b/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
index 80b2e49eac..156a6bdaae 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
@@ -34,6 +34,7 @@ SRC_URI += "file://configurehack.patch \
             file://CVE-2024-48957.patch \
             file://CVE-2024-48958.patch \
             file://CVE-2024-20696.patch \
+            file://CVE-2025-1632_CVE-2025-25724.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 

