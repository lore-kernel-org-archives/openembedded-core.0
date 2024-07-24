Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2EEBC3DA61
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 19:13:51 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.18959.1721848424455813109
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 12:13:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=YEzz0wAu;
 spf=pass (domain: mvista.com, ip: 209.85.214.176, mailfrom: asharma@mvista.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fb3b7d0d3aso661235ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 12:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1721848423; x=1722453223; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fsC+J7biHznpiIJFpSnbCyKGF9B1Dufk+50A/r8piTM=;
        b=YEzz0wAumTAi8tRW91RUcHw7ZjQIf5iAA+zf1KdziDIDIoQ88mfpUnoSDXy2/OxDoh
         VNOlhE1uRoqcduEWcN51hkOhElfAFEKLzk6jCrfSdvUO7jFBzF8al0YNWqAxawRXMBza
         eTzGYfD/U/xm1tmKLL4L52BhB1PJxwpws7TJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721848423; x=1722453223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fsC+J7biHznpiIJFpSnbCyKGF9B1Dufk+50A/r8piTM=;
        b=pTVdMk4doXWXqXczuhyvK9aYDydxmdbI4HSGShoLu9wY5L+OXkzp1NEv4aqXrRzHd6
         pptpp+/1JtqnmhvVpAYUJFqc0K8zpB218UpaySq8AuvBkwUvH6pMun9nqJlJUUYKncME
         p87S/w34YWGjj0z9f/hXrZvPAIhNurSarjl5h0QsKjPyfWmSnQ3cbLJHeOiY9MuxjnJe
         byka/nWexIHWlDXO6TyMxsFG6uGPCembMa8zd5c/O4h09L2EugHEMrIrUJV106+L37Lf
         6Zk3dXi6eBEjrEa+ks6LkE88x8tMwbnbqpq9iDaNBR+Wc83e+ub5dQv0QDJFZrXrYSqt
         onkA==
X-Gm-Message-State: AOJu0Yyj5DQTFH+gTfsDWiHheCicjLJ0Gbh0jmrCinPyyzx7Lzgim4F7
	vjfBp+Ygd5pytl43+GPeBjAkDdxcLCg3E7ax/XoPP/b2ACS7ib0ei7LlBp93nMMi7/s/qQ49D5m
	5
X-Google-Smtp-Source: AGHT+IHKNC/RrnJyoicb7krRRuZkys37voJBT26jdtrVTgtXKA6WyiAnq5vT13qNDtVYMalV39W2Vg==
X-Received: by 2002:a17:902:e88a:b0:1fc:3daa:52 with SMTP id d9443c01a7336-1fed38386ddmr6146895ad.11.1721848423563;
        Wed, 24 Jul 2024 12:13:43 -0700 (PDT)
Received: from asharma-Latitude-3400 ([223.190.86.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f436c6asm100015465ad.206.2024.07.24.12.13.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jul 2024 12:13:43 -0700 (PDT)
Received: by asharma-Latitude-3400 (sSMTP sendmail emulation); Thu, 25 Jul 2024 00:41:28 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][scarthgap][PATCH] libarchive: backport fix for CVE-2024-26256
Date: Thu, 25 Jul 2024 00:41:26 +0530
Message-ID: <20240724191126.29999-1-asharma@mvista.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 19:13:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202479

This patch fixes an out-of-bound error in rar e8 filter.

Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/eb7939b24a681a04648a59cdebd386b1e9dc9237]
Signed-off-by: Ashish Sharma <asharma@mvista.com>
---
 .../libarchive/CVE-2024-26256.patch           | 27 +++++++++++++++++++
 .../libarchive/libarchive_3.7.4.bb            |  4 ++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2024-26256.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2024-26256.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2024-26256.patch
new file mode 100644
index 00000000000..f9be4fe255d
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2024-26256.patch
@@ -0,0 +1,27 @@
+From eb7939b24a681a04648a59cdebd386b1e9dc9237 Mon Sep 17 00:00:00 2001
+From: Wei-Cheng Pan <legnaleurc@gmail.com>
+Date: Mon, 22 Apr 2024 01:55:41 +0900
+Subject: [PATCH] fix: OOB in rar e8 filter (#2135)
+
+This patch fixes an out-of-bound error in rar e8 filter.
+
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/eb7939b24a681a04648a59cdebd386b1e9dc9237]
+CVE: CVE-2024-26256
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ libarchive/archive_read_support_format_rar.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/archive_read_support_format_rar.c
+index 99a11d1700..266d0ee995 100644
+--- a/libarchive/archive_read_support_format_rar.c
++++ b/libarchive/archive_read_support_format_rar.c
+@@ -3615,7 +3615,7 @@ execute_filter_e8(struct rar_filter *filter, struct rar_virtual_machine *vm, siz
+   uint32_t filesize = 0x1000000;
+   uint32_t i;
+ 
+-  if (length > PROGRAM_WORK_SIZE || length < 4)
++  if (length > PROGRAM_WORK_SIZE || length <= 4)
+     return 0;
+ 
+   for (i = 0; i <= length - 5; i++)
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.4.bb b/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
index da857641168..22e398f5989 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.4.bb
@@ -30,7 +30,9 @@ PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd,"
 EXTRA_OECONF += "--enable-largefile --without-iconv"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
-SRC_URI += "file://configurehack.patch"
+SRC_URI += "file://configurehack.patch \
+            file://CVE-2024-26256.patch \
+"
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
 SRC_URI[sha256sum] = "7875d49596286055b52439ed42f044bd8ad426aa4cc5aabd96bfe7abb971d5e8"
-- 
2.44.0


