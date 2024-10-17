Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A5F1D37495
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 13:32:15 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.48399.1729171928276748430
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Oct 2024 06:32:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ROUePSNE;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20c7edf2872so16356265ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 06:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729171927; x=1729776727; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2F/GdIkHJpcZjk71GmqkotDJnZay8zYX17nuCJvkdD8=;
        b=ROUePSNETnLzULqBh0vG/uVRJfdNvqCAi0NWvmw6PBpQ1l0S2XJliyqPnXZSYR44gR
         vwzrReCXQM4lPEZl+/GTsMyBnl1lAaIfzb49pcjjUt7a4HcOLrNXItFxTh+OeyJbQqMr
         AUZlJvCNn5jFZwiokAel05YG0ct+yPsScrUp7wnBKNUgApGBdIgPGTdX8a0A38Kau5OI
         cIPslxqCVfsfKLf0ZHGBHecupSk22+QUP/RMXkYkmRthkOxJoKdB/r4hJ5g0gvdRWt6e
         RjGUJf1hR4x4MyZoAfsY9dTmcmeHOWrsTvo2vo5EZkt5qoiPcXiqfJJ1Ts/VJmPVvkIT
         0Ghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729171927; x=1729776727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2F/GdIkHJpcZjk71GmqkotDJnZay8zYX17nuCJvkdD8=;
        b=UXhpCqniNS/Cz0e8Bnqspfw+YB214H0ZP0uZDpukcyy7uNdDMetfgEx2pJ5OyPUxQ2
         JCq+frW4vPTn9YBIYFSnr4gHNCDH79uHO+E4WG3vAm0FlWkxcpOVHZrht2tQMq/oVQC0
         UZnuvwJALUbHxMjBX2FbvomXL2gsm17yJWkhyo6uGummic2b1GqU3YnhEg3r/0XismCw
         G+G/Dfkra7eVlGAKuRkTHSWPSegMvkmfgbeD2yqWAxrIB23kDpPd1tWyhp7s8jJURoTp
         8OA7LF77uIlhHa5tIDLLiLHrVtmf8cV+drhcDaYpk0v1xOJ9KV3w4MO1Vp/yR/4dbYCJ
         FCVg==
X-Gm-Message-State: AOJu0Yw0fHCr8eOaQcTvqf8llO34zGgjTXUCaYjI3EOAALtI4/LPgqPH
	ymbMISVM5nFRhcIUSOB3llwXU+1SkXyTHPtUuiIYuMqh0bxlgnixP9kVqUQbVJJtoqgdNzmfIfL
	7
X-Google-Smtp-Source: AGHT+IEfZ8CnqhkBgsrNWcTHpEobFBeKRvVU4eTALGZ/Z4tG0+Xcz0gWafRnLbG6va9l+18aCCCuew==
X-Received: by 2002:a17:902:e5c2:b0:20c:62af:a0f0 with SMTP id d9443c01a7336-20d472116c0mr50700385ad.7.1729171927399;
        Thu, 17 Oct 2024 06:32:07 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d1805b093sm44161595ad.254.2024.10.17.06.32.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 06:32:07 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 2/5] libarchive: Fix CVE-2024-48957 & CVE-2024-48958
Date: Thu, 17 Oct 2024 06:31:54 -0700
Message-Id: <584ce77f3aae332c66e2140497506301200ec9ca.1729170868.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729170868.git.steve@sakoman.com>
References: <cover.1729170868.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Oct 2024 13:32:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206022

From: Ashish Sharma <asharma@mvista.com>

Backport fix:

* CVE-2024-48957 - Upstream-Status: Backport from https://github.com/libarchive/libarchive/commit/3006bc5d02ad3ae3c4f9274f60c1f9d2d834734b
* CVE-2024-48958 - Upstream-Status: Backport from https://github.com/libarchive/libarchive/commit/a1cb648d52f5b6d3f31184d9b6a7cbca628459b7

Signed-off-by: Ashish Sharma <asharma@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libarchive/CVE-2024-48957.patch           | 33 +++++++++++++++++
 .../libarchive/CVE-2024-48958.patch           | 37 +++++++++++++++++++
 .../libarchive/libarchive_3.6.2.bb            |  2 +
 3 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2024-48957.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2024-48958.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2024-48957.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2024-48957.patch
new file mode 100644
index 0000000000..fa3c8534d9
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2024-48957.patch
@@ -0,0 +1,33 @@
+From 3006bc5d02ad3ae3c4f9274f60c1f9d2d834734b Mon Sep 17 00:00:00 2001
+From: Wei-Cheng Pan <legnaleurc@gmail.com>
+Date: Mon, 29 Apr 2024 06:53:19 +0900
+Subject: [PATCH] fix: OOB in rar audio filter (#2149)
+
+This patch ensures that `src` won't move ahead of `dst`, so `src` will
+not OOB. Similar situation like in a1cb648.
+
+CVE: CVE-2024-48957
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/3006bc5d02ad3ae3c4f9274f60c1f9d2d834734b]
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ libarchive/archive_read_support_format_rar.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/archive_read_support_format_rar.c
+index 619ee81e2..4fc6626ca 100644
+--- a/libarchive/archive_read_support_format_rar.c
++++ b/libarchive/archive_read_support_format_rar.c
+@@ -3722,6 +3722,13 @@ execute_filter_audio(struct rar_filter *filter, struct rar_virtual_machine *vm)
+     memset(&state, 0, sizeof(state));
+     for (j = i; j < length; j += numchannels)
+     {
++      /*
++       * The src block should not overlap with the dst block.
++       * If so it would be better to consider this archive is broken.
++       */
++      if (src >= dst)
++        return 0;
++
+       int8_t delta = (int8_t)*src++;
+       uint8_t predbyte, byte;
+       int prederror;
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2024-48958.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2024-48958.patch
new file mode 100644
index 0000000000..7ab2a96ca8
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2024-48958.patch
@@ -0,0 +1,37 @@
+From a1cb648d52f5b6d3f31184d9b6a7cbca628459b7 Mon Sep 17 00:00:00 2001
+From: Wei-Cheng Pan <legnaleurc@gmail.com>
+Date: Mon, 29 Apr 2024 06:50:22 +0900
+Subject: [PATCH] fix: OOB in rar delta filter (#2148)
+
+Ensure that `src` won't move ahead of `dst`, so `src` will not OOB.
+Since `dst` won't move in this function, and we are only increasing `src`
+position, this check should be enough. It should be safe to early return
+because this function does not allocate resources.
+
+CVE: CVE-2024-48958
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/a1cb648d52f5b6d3f31184d9b6a7cbca628459b7]
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ libarchive/archive_read_support_format_rar.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/archive_read_support_format_rar.c
+index 79669a8f4..619ee81e2 100644
+--- a/libarchive/archive_read_support_format_rar.c
++++ b/libarchive/archive_read_support_format_rar.c
+@@ -3612,7 +3612,15 @@ execute_filter_delta(struct rar_filter *filter, struct rar_virtual_machine *vm)
+   {
+     uint8_t lastbyte = 0;
+     for (idx = i; idx < length; idx += numchannels)
++    {
++      /*
++       * The src block should not overlap with the dst block.
++       * If so it would be better to consider this archive is broken.
++       */
++      if (src >= dst)
++        return 0;
+       lastbyte = dst[idx] = lastbyte - *src++;
++    }
+   }
+ 
+   filter->filteredblockaddress = length;
diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index a7a3e47412..e1eca79004 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -31,6 +31,8 @@ EXTRA_OECONF += "--enable-largefile --without-iconv"
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://0001-pax-writer-fix-multiple-security-vulnerabilities.patch \
            file://CVE-2024-26256.patch \
+           file://CVE-2024-48957.patch \
+           file://CVE-2024-48958.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-- 
2.34.1


