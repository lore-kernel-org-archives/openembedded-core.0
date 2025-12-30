Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3592AEE4999
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 20:12:15 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71727.1767125532132882667
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 12:12:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nJ57aYTu;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29f102b013fso127799985ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 12:12:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1767125531; x=1767730331; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rec4WPGnoo4jGmF4FVOJFacBw46GhBQpm7BORxIhgwo=;
        b=nJ57aYTuCgmEcGNS5yAG17bVbCEvl/jFMrW/bdxPv+uB2sjKiOFukbGWvYjuQgJ6Lo
         yuv8qP9v43JWbMqy9huUDIwI/IGdeFrDBijItvXUMMWdEq4nsmSoZDvUlpjmxgmeNBFC
         1W7l//aFF97NossMh25qpEKbsmJfOeN8S1C4BqNfxuj6tMmvTwDI9Y0yFFe2ki6L+G8i
         6n1+YEubxwbVW0JBGIa/P22ERf+DvIq3+rsnzAGEPT9hREzyfje7pnlFdmz1H+5AlsoD
         5O0Tns5MJvMFX9dZygXQ4TNLI2wzg5UZhQhV8wIBeH/C+WUkvcMmX5HbkZX/z0YHb4st
         ZYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767125531; x=1767730331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rec4WPGnoo4jGmF4FVOJFacBw46GhBQpm7BORxIhgwo=;
        b=VkzJkYqzXKyjMaPgzhqnJSJv/ktvHnbW2i2b/vQr1uIRi8v/c28CxRRXFtG/vi9Orq
         ubOschwr+1tvI3KFcSYguGCFRN24BLI/QKIKNUjcxk7zSepq8Sj5d8DuBOLE7PXEiKIX
         0LuhCVE/hB82Lp1f2ARbIMZ9I0aW7owAmS3ovFJgUdEwkJzhSzXSgRGMChdoU1K1b28i
         REGQ7fcPC4gsQwuEPr49fP0PTdVB1vkzvCw8a9CapskgicqYYv49RhgwAGEhkKJpsHlW
         r9y+dA0pWS73JIQB7MymOAEWHM+fhS9zkDb0lQDPBprot1rC3NuN7pbnYHPNnlPUx51e
         2lzw==
X-Gm-Message-State: AOJu0YzpzyTsgEtLEscvNQmeIMatCDQG8HRJQ6f0ucs5kKGPeVmUqXxy
	HTmukTrkC8iPcClK+bnK31lGDaZotRBkv2hhmZfaLOas4Ig7JSqC0kmRdwvTRRXHRX2VFzeqFju
	HhPZ/
X-Gm-Gg: AY/fxX7xijShwUVyJAiAUDFEdX1b8Rza8+bW5zVuLsGFLzriA+jpnQ8RW+4f+GYuckt
	hioRLvBEKcinHhcJPTCkxUynEFT7qa7ykTlomrUQqAjY9a4LjdiQ9ZQjhszFPPcPJg7ut60TRCN
	aFcbksLNVGF9S1X/yzM5v4OCvVku0n1B0+ZY+NTn9ZK24UFz9fBC53Irx5/YiQ3HX8JxLE3D/1S
	Sg1XgyGE7mPoAkfxN28zma9iQ83F/LzHVsH3hX53AMj/dGTOrrU964oup+qb8KKpCU0Q//7By0c
	lNxnrKSQHAnC2qzWGcZqIM/F8S3rvd0Eie00H/M3k43zYgguX7hnMIBOHocLZT99eOgNUnsSZFc
	l+nGrOHwFDbQHO1HeCXpokiZpN0sISkUU+W7PSX8exI9m6ZvX19eWjww7WMAAObSTrohKjWt89h
	y4b83CSnR4bS/4
X-Google-Smtp-Source: AGHT+IG1RIj6leqskXLwwdUV4m5xo5+7V2c2Nf3vU/auUh94vnl7lWkVh/jP3RTC9HzLykteLbRt5w==
X-Received: by 2002:a17:902:ce87:b0:24b:24dc:91a7 with SMTP id d9443c01a7336-2a2f2a34f6amr313477295ad.45.1767125531305;
        Tue, 30 Dec 2025 12:12:11 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:501f:80a7:5971:3e87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83325sm310391365ad.34.2025.12.30.12.12.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 12:12:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 01/29] binutils: fix CVE-2025-11839
Date: Tue, 30 Dec 2025 12:11:31 -0800
Message-ID: <ecc391d6b73545d45a9c5b8004c2ecbdb7d939dc.1767106395.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767106395.git.steve@sakoman.com>
References: <cover.1767106395.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 20:12:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228693

From: Yash Shinde <Yash.Shinde@windriver.com>

CVE-2025-11839

PR 33448
[BUG] Aborted in tg_tag_type at prdbg.c:2452
Remove call to abort in the DGB debug format printing code, thus allowing
the display of a fuzzed input file to complete without triggering an abort.

https://sourceware.org/bugzilla/show_bug.cgi?id=33448

Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=12ef7d5b7b02d0023db645d86eb9d0797bc747fe]

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../binutils/binutils-2.45.inc                |  1 +
 .../binutils/0019-CVE-2025-11839.patch        | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0019-CVE-2025-11839.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/recipes-devtools/binutils/binutils-2.45.inc
index 58964a6cfb..9ae0e72e60 100644
--- a/meta/recipes-devtools/binutils/binutils-2.45.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
@@ -44,4 +44,5 @@ SRC_URI = "\
      file://CVE-2025-11413.patch \
      file://CVE-2025-11495.patch \
      file://0018-CVE-2025-11494.patch \
+     file://0019-CVE-2025-11839.patch \
 "
diff --git a/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-11839.patch b/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-11839.patch
new file mode 100644
index 0000000000..7f2f6d553d
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-11839.patch
@@ -0,0 +1,32 @@
+From 12ef7d5b7b02d0023db645d86eb9d0797bc747fe Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Mon, 3 Nov 2025 11:49:02 +0000
+Subject: [PATCH] Remove call to abort in the DGB debug format printing code,
+ thus allowing the display of a fuzzed input file to complete without
+ triggering an abort.
+
+PR 33448
+---
+ binutils/prdbg.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=12ef7d5b7b02d0023db645d86eb9d0797bc747fe]
+CVE: CVE-2025-11839
+
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+
+diff --git a/binutils/prdbg.c b/binutils/prdbg.c
+index c239aeb1a79..5d405c48e3d 100644
+--- a/binutils/prdbg.c
++++ b/binutils/prdbg.c
+@@ -2449,7 +2449,6 @@ tg_tag_type (void *p, const char *name, unsigned int id,
+       t = "union class ";
+       break;
+     default:
+-      abort ();
+       return false;
+     }
+ 
+-- 
+2.43.7
+
-- 
2.43.0


