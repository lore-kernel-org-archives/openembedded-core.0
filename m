Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD40C4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 06:05:41 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.66351.1701324340117816403
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 22:05:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=gADpZKTR;
 spf=pass (domain: mvista.com, ip: 209.85.214.177, mailfrom: vkumbhar@mvista.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1cf856663a4so5530725ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 22:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1701324338; x=1701929138; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TCVmZSpVnwLK9h1ce/9UBSY0441eiS6mbkAztDysBbo=;
        b=gADpZKTRnRQnvaB9GGITj7VjXhUlBVqRdpYBZsHLhprKDGKHgDRZMm8j7WvR+i7nZA
         hyjof7uxgzcEl3EmsNWfdXuVzaHd8vihbEHfs9lSmjAMCLMIGBwgRJCTlUZRFdKC3m0y
         /i0nC05YjcXhqH9ztImBqwJ9xrV+bBfSaRiZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701324338; x=1701929138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TCVmZSpVnwLK9h1ce/9UBSY0441eiS6mbkAztDysBbo=;
        b=P1b1jySevedxWD3tRJXDJbk+bLa+RkvIuNObU66kUujCGXLPaS6IqTvi9QeT5T0Fnu
         UYyA/p856cwEfEGO02/bVT+nYVTz48SQaf0tebxvQFVgORLvI6e9nlz9LFQEUTXl8aG6
         gjd17IrqoM5zoNEwCN0oXr3kWaORSMDELmN+u5qUCQmVIE9q7Ji0rxYhFtZ/PBbgqgRN
         HS1QYuD3Umt0c7urhLY/jFGH+kyowELc+bOwtTenrzQTWSsgnGD9wkFJayPYtlm0oj+t
         RjH1eCEFDKVobPTwWnZ19frEvTzj5+38J07DR7AxfYKPptRoYab9omfwbjFhEopB/9Iz
         KCag==
X-Gm-Message-State: AOJu0YyvZb/QAti4UdDuALMl4nh0BRwcTgSFkrVJs78BGBFBJEbcxXKB
	EDbl1Mr8E9AK+iIIwGEumnV09Ku1imDoUl+JonU=
X-Google-Smtp-Source: AGHT+IGvRQ53WNVpdn7PZvhw3w+ZOT9mzZYEq9dUwGeVO7L6h/BrQ3brKRYQK98lIr2UNIIWKT1IJg==
X-Received: by 2002:a17:903:2312:b0:1d0:c53:4ec7 with SMTP id d18-20020a170903231200b001d00c534ec7mr7350101plh.15.1701324338355;
        Wed, 29 Nov 2023 22:05:38 -0800 (PST)
Received: from vkumbhar-Latitude-3400.. ([116.74.153.36])
        by smtp.googlemail.com with ESMTPSA id b14-20020a170902b60e00b001cfc00d26c7sm425515pls.11.2023.11.29.22.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 22:05:37 -0800 (PST)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][kirkstone][PATCH] libsndfile: fix CVE-2022-33065 Signed integer overflow in src/mat4.c
Date: Thu, 30 Nov 2023 11:35:21 +0530
Message-Id: <20231130060521.64907-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Nov 2023 06:05:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191475

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../libsndfile1/CVE-2022-33065.patch          | 46 +++++++++++++++++++
 .../libsndfile/libsndfile1_1.0.31.bb          |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065.patch
new file mode 100644
index 0000000000..c5fba4d6b5
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065.patch
@@ -0,0 +1,46 @@
+From 0754562e13d2e63a248a1c82f90b30bc0ffe307c Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Tue, 10 Oct 2023 16:10:34 -0400
+Subject: [PATCH] mat4/mat5: fix int overflow in dataend calculation
+
+The clang sanitizer warns of a possible signed integer overflow when
+calculating the `dataend` value in `mat4_read_header()`.
+
+```
+src/mat4.c:323:41: runtime error: signed integer overflow: 205 * -100663296 cannot be represented in type 'int'
+SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior src/mat4.c:323:41 in
+src/mat4.c:323:48: runtime error: signed integer overflow: 838860800 * 4 cannot be represented in type 'int'
+SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior src/mat4.c:323:48 in
+```
+
+Cast the offending `rows` and `cols` ints to `sf_count_t` (the type of
+`dataend` before performing the calculation, to avoid the issue.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/789
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+
+Upstream-Status: Backport [https://github.com/libsndfile/libsndfile/commit/0754562e13d2e63a248a1c82f90b30bc0ffe307c]
+CVE: CVE-2022-33065
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ src/mat4.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/mat4.c b/src/mat4.c
+index 0b1b414..575683b 100644
+--- a/src/mat4.c
++++ b/src/mat4.c
+@@ -320,7 +320,7 @@ mat4_read_header (SF_PRIVATE *psf)
+				psf->filelength - psf->dataoffset, psf->sf.channels * psf->sf.frames * psf->bytewidth) ;
+		}
+	else if ((psf->filelength - psf->dataoffset) > psf->sf.channels * psf->sf.frames * psf->bytewidth)
+-		psf->dataend = psf->dataoffset + rows * cols * psf->bytewidth ;
++		psf->dataend = psf->dataoffset + (sf_count_t) rows * (sf_count_t) cols * psf->bytewidth ;
+
+	psf->datalength = psf->filelength - psf->dataoffset - psf->dataend ;
+
+--
+2.40.1
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb
index f6ea585e34..0c654fd853 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb
@@ -11,6 +11,7 @@ LICENSE = "LGPL-2.1-only"
 SRC_URI = "https://github.com/libsndfile/libsndfile/releases/download/${PV}/libsndfile-${PV}.tar.bz2 \
            file://noopus.patch \
            file://0001-flac-Fix-improper-buffer-reusing-732.patch \
+           file://CVE-2022-33065.patch \
           "
 UPSTREAM_CHECK_URI = "https://github.com/libsndfile/libsndfile/releases/"
 
-- 
2.40.1


