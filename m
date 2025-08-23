Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A948ACA0EFF
	for <webhook@archiver.kernel.org>; Sat, 23 Aug 2025 21:52:06 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.5896.1755985925586654481
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Aug 2025 14:52:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=HlBWhrpw;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202508232152039f3fc56e8db6a39051-opmubv@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202508232152039f3fc56e8db6a39051
        for <openembedded-core@lists.openembedded.org>;
        Sat, 23 Aug 2025 23:52:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=CBBhh9hZiwZwUHKV7Y8CQ0hXo4kzBVf1tQ2gXJUSH8c=;
 b=HlBWhrpwys83I1KwoAmH1UVjRY2ingd0bqQwNHVEpDBn1RES949Sw3jPeyl8UEGX1i3RB9
 fbFqN25zZd5yRxlPpDokG+hx7gRP+FHLDsGdpWhErxWc0+W/dAb/WUnfcaRbOcfPBdg4L+4R
 TH3e3UoqQsjH0ML6xTVQWdTbJRtqSabRSXm7B5+fN7BN5OzHIYadLsNhPuc+c3p8otVq705+
 b2MlnWwbu8TILgBNw/j4GWWKzSSCzSld/pOBokGkbOhRB9Yo1ozZBHta/YPgGB0/rCH3n/5I
 1irGnK0E2KkxWrUHeVkgP4wpiHPiONEbRBUqRA5KtW3zKhGTow3GSZJg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][walnascar][PATCH 2/3] libarchive: patch CVE-2025-5917
Date: Sat, 23 Aug 2025 23:51:05 +0200
Message-Id: <20250823215106.525689-2-peter.marko@siemens.com>
In-Reply-To: <20250823215106.525689-1-peter.marko@siemens.com>
References: <20250823215106.525689-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Aug 2025 21:52:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222358

From: Peter Marko <peter.marko@siemens.com>

Pick commit per [1]

[1] https://security-tracker.debian.org/tracker/CVE-2025-5917

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libarchive/libarchive/CVE-2025-5917.patch | 49 +++++++++++++++++++
 .../libarchive/libarchive_3.7.9.bb            |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5917.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-5917.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5917.patch
new file mode 100644
index 0000000000..eb3f64d63d
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5917.patch
@@ -0,0 +1,49 @@
+From 7c02cde37a63580cd1859183fbbd2cf04a89be85 Mon Sep 17 00:00:00 2001
+From: Brian Campbell <Brian.Campbell@ed.ac.uk>
+Date: Sat, 26 Apr 2025 05:11:19 +0100
+Subject: [PATCH] Fix overflow in build_ustar_entry (#2588)
+
+The calculations for the suffix and prefix can increment the endpoint
+for a trailing slash. Hence the limits used should be one lower than the
+maximum number of bytes.
+
+Without this patch, when this happens for both the prefix and the
+suffix, we end up with 156 + 100 bytes, and the write of the null at the
+end will overflow the 256 byte buffer. This can be reproduced by running
+```
+mkdir -p foo/bar
+bsdtar cvf test.tar foo////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////bar
+```
+when bsdtar is compiled with Address Sanitiser, although I originally
+noticed this by accident with a genuine filename on a CHERI capability
+system, which faults immediately on the buffer overflow.
+
+CVE: CVE-2025-5917
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/7c02cde37a63580cd1859183fbbd2cf04a89be85]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libarchive/archive_write_set_format_pax.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libarchive/archive_write_set_format_pax.c b/libarchive/archive_write_set_format_pax.c
+index 0db45344..66e6d751 100644
+--- a/libarchive/archive_write_set_format_pax.c
++++ b/libarchive/archive_write_set_format_pax.c
+@@ -1571,7 +1571,7 @@ build_ustar_entry_name(char *dest, const char *src, size_t src_length,
+ 	const char *filename, *filename_end;
+ 	char *p;
+ 	int need_slash = 0; /* Was there a trailing slash? */
+-	size_t suffix_length = 99;
++	size_t suffix_length = 98; /* 99 - 1 for trailing slash */
+ 	size_t insert_length;
+ 
+ 	/* Length of additional dir element to be added. */
+@@ -1623,7 +1623,7 @@ build_ustar_entry_name(char *dest, const char *src, size_t src_length,
+ 	/* Step 2: Locate the "prefix" section of the dirname, including
+ 	 * trailing '/'. */
+ 	prefix = src;
+-	prefix_end = prefix + 155;
++	prefix_end = prefix + 154 /* 155 - 1 for trailing / */;
+ 	if (prefix_end > filename)
+ 		prefix_end = filename;
+ 	while (prefix_end > prefix && *prefix_end != '/')
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
index 1015de3fce..a0f5d67700 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -33,6 +33,7 @@ SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2025-5914.patch \
            file://CVE-2025-5915.patch \
            file://CVE-2025-5916.patch \
+           file://CVE-2025-5917.patch \
            "
 
 UPSTREAM_CHECK_URI = "http://libarchive.org/"

