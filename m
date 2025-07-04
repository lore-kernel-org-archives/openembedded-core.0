Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84AB5C83F09
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 15:10:58 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.14491.1751641849072603487
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 08:10:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JFHmIG1V;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-74b56b1d301so686556b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 08:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751641848; x=1752246648; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=feCF0EKDFluTJOxE8/vdasHeWqV7bZ0rtN0hkvbl848=;
        b=JFHmIG1VACQcpzHfxhQVNpqZssH/KQwFdsLNnq0L0miE0Zeue+2WCffVBZ6H+C32O8
         RwboLs6MT80XS3/9HbzxL3nvfW1nA4yj0q0i68YcOlTOav4qfLOFcT1nSs2mCmKKS4yO
         LPjY83ApFrR7VucnFRBob8YVvWY/h+buLWE0Y4ECT0dWXk8BYaJYxGEHYKwKFP3EiJrx
         Aa/ddbkS1pLUUIoDEYsXtFxkm4pmV+P7e05t99P2u+7yVmm6jSw0kYKUOWu4Al9MKO38
         8yvL8YrCrdZsvisnfzF5odLwZV5OfEWJjGZzgW54Dg0x4ZxFIJWSGcapSHtlEX5sVAB5
         7TkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751641848; x=1752246648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=feCF0EKDFluTJOxE8/vdasHeWqV7bZ0rtN0hkvbl848=;
        b=QG4lDmlUHXgRpRH9l4yyVKoSRZn8OHQCbNvcu8TIqGud8EgQOIfGRqbuAV40YO/fXY
         ySBgYCpSv6s+9OuO4KYiol5Dm31W5JLsQdbkXHAIs0J227ooJB8n/JYjYDuu4b5iBSiV
         fvIUc5j55xJunqZ5NRh/VQSXm9iFY4xyH55atnJfOHCbcJLnxvjE4HHfncLZwg2GhHrL
         BIPASUygpYI77r7avt4zcVIs/iRwuihQ8BRMo0173oYMV+0XYfNu/buUjZeu7A6r/CG0
         BLdPy5YNCCHKnvIVoDYD4UKNTQQv3zv6JhKqDf8BfT808CcXg+qSr8fhhVMXFDksEbbR
         VBGQ==
X-Gm-Message-State: AOJu0YxgRuihjJ93lWIrQ/FeFJbnxevbM/37xlPgAIHl0bQbSdTDRsuO
	bWj+4GFDyMuoEc+QSE9wIzW+hl1/wAmvuWla7B4LW4/rDh/44K9SwTjwxQgWl9OKRk9d0DiuYi0
	EpVFF
X-Gm-Gg: ASbGnctBC6ML9GKYYYxu4+UPBUuudwYnnStGikmnAB4dXRtH/T5VAXzRh90itX6Kodx
	HWaLDwK5FJQAW29pGZTgJoqjGAER5i0J6k339qdZq9j3k7WZIKdu2MHwWcRUKLeG3I7aUos50od
	iUP6i2yWPL4QlgZssXSCmYbBXYh9djuVWtAYNilhyreAXlwYEkF9rrP3Nr53ANbeOlwSfxQc2Iz
	6oojSGZY+zFByZb1WnB73iuciBHa2NjVQH6MP6Xvx8UDZ3OfuJ/I+c5rXcr2dZIoOzapsVFKB8r
	+TxSibZlw6nMDwxFVAzbNGGvpbnw4iUU2bzv4sSNl4mGyeqXOUUo9Q==
X-Google-Smtp-Source: AGHT+IG9sM5iaNg9sEk8NjZ5wjCpRXrsgJ9J5gb0tDT0M0OAlsqlLxvTmf0kiB6hs1c9qaCX9K2BWg==
X-Received: by 2002:aa7:88c7:0:b0:742:a91d:b2f6 with SMTP id d2e1a72fcca58-74ce8aa58bfmr3498725b3a.13.1751641848082;
        Fri, 04 Jul 2025 08:10:48 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d985:cb7d:ae84:68cc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417e869sm2159592b3a.82.2025.07.04.08.10.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:10:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/11] libarchive: fix CVE-2025-5917
Date: Fri,  4 Jul 2025 08:10:27 -0700
Message-ID: <2b6832b05bab414df1da7c74a0c6a5e5a9d75b29.1751641631.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751641631.git.steve@sakoman.com>
References: <cover.1751641631.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 15:10:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219930

From: Divya Chellam <divya.chellam@windriver.com>

A vulnerability has been identified in the libarchive library. This flaw involves an 'off-by-
one' miscalculation when handling prefixes and suffixes for file names. This can lead to a 1-
byte write overflow. While seemingly small, such an overflow can corrupt adjacent memory, lea
ding to unpredictable program behavior, crashes, or in specific circumstances, could be lever
aged as a building block for more sophisticated exploitation.

Reference:
https://security-tracker.debian.org/tracker/CVE-2025-5917

Upstream-patch:
https://github.com/libarchive/libarchive/commit/7c02cde37a63580cd1859183fbbd2cf04a89be85

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libarchive/libarchive/CVE-2025-5917.patch | 54 +++++++++++++++++++
 .../libarchive/libarchive_3.7.9.bb            |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5917.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-5917.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5917.patch
new file mode 100644
index 0000000000..28f7b6023a
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5917.patch
@@ -0,0 +1,54 @@
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
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/7c02cde37a63580cd1859183fbbd2cf04a89be85]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ libarchive/archive_write_set_format_pax.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libarchive/archive_write_set_format_pax.c b/libarchive/archive_write_set_format_pax.c
+index 6e35f70..b2ba959 100644
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
+-- 
+2.40.0
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
index 250a3c016f..bb8609dd09 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -34,6 +34,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2025-5914.patch \
            file://CVE-2025-5915.patch \
            file://CVE-2025-5916.patch \
+           file://CVE-2025-5917.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-- 
2.43.0


