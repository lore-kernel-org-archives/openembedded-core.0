Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B8CFCA0FF6
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 13:41:16 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.64941.1756215671045722883
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Aug 2025 06:41:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UjR8tVq7;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-323266cdf64so4147052a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 06:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1756215670; x=1756820470; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UyL8EGLr3WGNTyJrd1taOf59WkrENEu74N9ENAg7f1o=;
        b=UjR8tVq7UwCUWv53ien7/5ItuWw0Ut03FtVmhmVXv56NGQ3uyB4h5rnWXIHbzdx7uF
         2L2wwd8l8mPMJnJNI+jfK4OkGU6ZXcaxn2Yl7mhYnJONC5wOuhmuxRh9Fw0ctMXA5nyr
         8h9xPYGd54gt1uMA9QBvTqogLHyblLJkcSzTFEWT/t44o6MlugSbUP8K4ih4iB/2gQA4
         R3iLuuo7M93Nw8xTRIuVen9j+T0OE6ncCoyw+1QC6fWjOuhZrNauKSMJ7p5lKDz1BFZF
         vc38uJIJta8BmuphbJahXzLpR0ua6ErON10oRLKYxNyOAqUrAOAXhBP4Ic60Np95H1GO
         1wVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215670; x=1756820470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UyL8EGLr3WGNTyJrd1taOf59WkrENEu74N9ENAg7f1o=;
        b=R/CHxUFgp60VFGwiVo0wutMazt+CdOf7VUzkLHUNV11PIT7RBhTnVU5Pbm8TRAFgd7
         GBE6FMr7ppAufzCbYJoO/WuK+ZlD5Vh/F0X414qqzP+ja72IQk0TNCafw+CKd+gjCuaX
         UAYVReim4Gksvzl2YA5dAe4dhA8h0uPJ1ERBHpCD0UYnpZxwduYXt0cyFc0b0ioChLN1
         Lc4mAgxdYr8U4mjBxlv9p6WjUS1+1xeqPjBpbSw6AZjgKEJVNdXsxMDjVUPQzUe0hCBW
         vs5nlL94vHnrbmyxcyManBT5YmNzhL6kWnh+4jAe1JPh7wq9O+uz0DlTS4BN+v2vk6Af
         RBnQ==
X-Gm-Message-State: AOJu0YxLrTlVshBg92FWfBKO4swnA/Qf4GUP5lnUimlrw9rK3+nSyIAQ
	2QQkoWrKUuRoTEfbgsAZZeZFgNSBm97IOJIBexgJBhceHo5UnsjJe0ygOa8sCAtck38LMP4kff6
	x9PTQ
X-Gm-Gg: ASbGncvZGHrvekgUZm6rXuD3mD63qaaPL/YFVKeV8s7rVmcHsLJlDiLNiQzWHK8dcs/
	rs3Iugh37kKPgdrfxqcRw2GULfZ/968qEXBSnLhHU6eKGNZHVyoHcAGZyNODBLIygqHHo63ZNrK
	b+lFqv4QrQ01vS2tOO9dV0V86yMMZhDMtAotXxB0kLKIxL9PAvj6MFoRODhw1x5E1ulZVlvIx13
	GkIceYXr57/zG+eGpKMyQyF/Ue6UjQiE3FZcGuksyaR6+DDMh95u3TUigt7zhDTKEV1a06Nh86z
	/7uA1erFLDSa3sSVYZGaroH/6djWb/rk0qQsAbeMQfsgvsYfseU5wpyyHP/vv2JhDh8Xj3wKQmH
	1g5GuFFhw4TKi3Q==
X-Google-Smtp-Source: AGHT+IGt4uIaF7b4tV/3L5JloIZttEavensk59y0n7YjutiH7+NU+pmd5DElKwNeytj8eZW9NvPR7w==
X-Received: by 2002:a17:90b:1d0f:b0:327:4d3b:fc46 with SMTP id 98e67ed59e1d1-3274d3bfcfamr2851002a91.17.1756215669811;
        Tue, 26 Aug 2025 06:41:09 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1687:ddce:d4c7:f578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3274191c389sm1007414a91.4.2025.08.26.06.41.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 06:41:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 03/19] libarchive: patch CVE-2025-5917
Date: Tue, 26 Aug 2025 06:40:37 -0700
Message-ID: <59b3c2f9dcf523a441bdaeac52c590d469b0b8ac.1756215509.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756215509.git.steve@sakoman.com>
References: <cover.1756215509.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 13:41:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222443

From: Peter Marko <peter.marko@siemens.com>

Pick commit per [1]

[1] https://security-tracker.debian.org/tracker/CVE-2025-5917

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
-- 
2.43.0


