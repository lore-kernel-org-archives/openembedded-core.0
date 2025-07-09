Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 562ECC83F0F
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 15:19:45 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.18429.1752074377319600320
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jul 2025 08:19:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TLh2mHKM;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b3226307787so81092a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 08:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1752074376; x=1752679176; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QooaHR9Uf9LtrD+Z2HjV/rMswvfY/cx5T3KLK6xdxoo=;
        b=TLh2mHKMEKc1mmSKFyxIDVzcbHZlIykqln/rcWcwKewuh20eWr+PMhAPJHB6WNJv5J
         5BqHraGYrRpLo7y0+q47JhFSO0XZ+QaSA9cuZnU9ngneP+zR2X6ljbP86cKjhKGqiKA0
         AJZMnirHS+lLMNxp2avrsKphNqPtArOa0/MJyEUAWr1n7IF2vX+oEztKhhXLZBRlr1tO
         pnOr13V2lE6FQ/dAk5pQPS3p+rwbwcOi+0r9XZrzcJv0Ncx1f8zSc4vzTyei+HpzhF0m
         IS7cJnTSmWsMJvM7LfXSKLgcyTieWDio5y+rNaQ9EDgZTyoaHaCs/HqQy1jS7auOtubw
         ZWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752074376; x=1752679176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QooaHR9Uf9LtrD+Z2HjV/rMswvfY/cx5T3KLK6xdxoo=;
        b=OZKjRaZdaeN83y3hm30IYy693c8mNzB0xSEcdZlB/4ytQJs4CsBGJ6V8E1eJI4VmZx
         oiKLUPP72hMKjq6kGX5TgzRJBCGy4CPc1YK6Ta4t7Vh+TND6NsaHD5X0oCczgJ3R8yDJ
         rMtz3EXlU35dehLBNaFuV7kpWoI5kZH+aI0ITAYddB1n0Hrj39FMUpQwB5Wmfhy4rrkG
         JSTUxllAI7XVgQ3duxc5VfhUnL56V0QlPHocTYPRKeHkDyjVuIKlUV/FQTcaA+KunVyD
         2M4vEAmYa0i9M0t2GxEMrWGhPRKtEvfX1X1FBR1Sh8lFygTnyfwWsizk6llYaPK7Sa65
         jS2w==
X-Gm-Message-State: AOJu0YzztHzabJ+AfV3qv5izL0MMjbKWlChK9u14gezqv9iIM+L9SRf9
	Xl81MmIZ7E37UK10kYYrF2w3EOlGHv89rlzW2rMyJKiND1Gi3bA+RWzTDA27t1DuqJ9awsIFD+t
	YAWcq
X-Gm-Gg: ASbGnctFPOrDPRJtPfV2HvpOripkS6Ba+3zJUzNcmyrSr+x2r89f01CL8SPD0HkU4QL
	uKm/2G5wUObM+9VEPnLe5XJGtZDzUfZjyz5BsAjQTFFUMtXcXjGQfE0wpr7NHVzyHr6APoQ/5No
	pDWVVZr1p9gT3oSoCdZd0628GXjKpzMHEaEbT5WnRGXVmsXEMvLaF9iQz+yD9Gr5QM1DSZ49KkM
	+q8kW8uypHuGqhlnA3JpYG7Zp5r9Ge3hyn/c0zKX7Ts7IfSUKz8Wlk9aMZNd+roftyD5q+Oowpn
	A8nUtNK73V/pqHhcZbV+LLOEYZRQHXgEc5NT1zTc/e1qZcBb/cEgow==
X-Google-Smtp-Source: AGHT+IHkA//32UWflxmdYPMY79SkCKxx0G7rSQra7mxBVJF3kaOOqdAeiwfymU7dg7p+gLHV1yWxRw==
X-Received: by 2002:a17:90b:2fc6:b0:311:c1ec:7cfb with SMTP id 98e67ed59e1d1-31c2fe00208mr4274279a91.21.1752074376278;
        Wed, 09 Jul 2025 08:19:36 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:a6e1:d218:3fcc:fd7d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3019e934sm2340536a91.33.2025.07.09.08.19.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 08:19:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/11] libarchive: fix CVE-2025-5917
Date: Wed,  9 Jul 2025 08:19:13 -0700
Message-ID: <2b2a2fce345c9bfcad44cc8ef3419f43dd07b022.1752073806.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752073806.git.steve@sakoman.com>
References: <cover.1752073806.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 15:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220101

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
 .../libarchive/libarchive_3.6.2.bb            |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5917.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2025-5917.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2025-5917.patch
new file mode 100644
index 0000000000..9c2003e574
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
+index cf1f477..8e6aade 100644
+--- a/libarchive/archive_write_set_format_pax.c
++++ b/libarchive/archive_write_set_format_pax.c
+@@ -1546,7 +1546,7 @@ build_ustar_entry_name(char *dest, const char *src, size_t src_length,
+ 	const char *filename, *filename_end;
+ 	char *p;
+ 	int need_slash = 0; /* Was there a trailing slash? */
+-	size_t suffix_length = 99;
++	size_t suffix_length = 98; /* 99 - 1 for trailing slash */
+ 	size_t insert_length;
+ 
+ 	/* Length of additional dir element to be added. */
+@@ -1598,7 +1598,7 @@ build_ustar_entry_name(char *dest, const char *src, size_t src_length,
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
diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index f90063ba3a..3937bfb82d 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -38,6 +38,7 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2025-5914.patch \
            file://CVE-2025-5915.patch \
            file://CVE-2025-5916.patch \
+           file://CVE-2025-5917.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-- 
2.43.0


