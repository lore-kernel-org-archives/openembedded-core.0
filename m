Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E02DCD8C92
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 22:34:26 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6137.1780698863661323686
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 15:34:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kUxdiKfZ;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b3e03939so20525995e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 15:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1780698862; x=1781303662; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h6C72SQXjCUm3gFLuaqrBa8FeoKvznO3Fvblxr1f9C4=;
        b=kUxdiKfZ7BqiZw638WkDGaiC986M2Wg6z4xDfH3mjWOdWz0fcWisDwnqrIa6KKbFLn
         mER/fAJMW78XYdgkJ0ScZoDLMQR+BDN+h/6kKCjoVywHHQEtnuxn9abqKUrE6r3uGKCc
         5tPfumUxj5IeAGUPmyagop35iw9M5634Wgdkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780698862; x=1781303662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h6C72SQXjCUm3gFLuaqrBa8FeoKvznO3Fvblxr1f9C4=;
        b=GFo5MhdTG9Y6Pya6cFVzA1Q0aSE3DseiNy4JLBiBZSFr3Lai134pcoIpELEK+9qNkH
         RaC+Bxyi7V3Yv7gD2uCAenixXRDGCnf30kDGD/NCVnd4lZ2seHI1hMjpTUl+79Ay/hw+
         mZ/ij5VkdWX0kMx1wv1nOkc2hbDaYuUqOhULOrSwuSdsUB1NgZXx8USM+K310AdOhoPJ
         ZdyuqZFFlwFpogmvD/KMZRh0W9l9mKGBYlZGD7wXqZcLLt49BK8fF43MqcElnA/dins1
         pFL6EydCmxBWcx+KoWb06LVG36Rqn6JyZjcpNDKhDms2bwH+bvju9/QFwDe3jAmZyS/A
         iTOQ==
X-Gm-Message-State: AOJu0YwWRyo9i+9U/j6wRXnWUB9Hw7TJ74S8huTMOPSvNikbcVLgmBk7
	0rvolWzC7A+MzOKQCyqQcxoAXcbKqyFHH2TQQy6joG2Ndj9lLDDwc+tHi9VaNCtPS2jzor61cGr
	IHn7X
X-Gm-Gg: Acq92OFD27fi9WDnI8dRMIUc1+l1+1FXxJI+/OSmUznpJbmrY+DJVeINQRqMkHPBCsc
	g3dvIGQG8AmC0HmreYU+udFrTf7nezZ8PIsKuwv9fO5RiVUw/2QUWPG12RjflEc22Od9jOIR6w+
	Nm7xuiAwTP0OUsp2zcHolxXx2JERABimyXWNiUWCFF2iEZBrMKNzKFmCQHltEauBZ/lX1lnezO4
	c2sBo6/t2YJO7nu6LBC7NsZSL6bRvXca3soytvFALpxaNI1ZTReabc/KWeUAlLaC/GmUrBSMwGw
	I7EdKraySfYdds0infLAiqSKlzXF+6lMac12+y1Yjxv2ZTidpb5w8PJZ0k3o9m5zMI3EYvgjWks
	xn1mVXHEuayn8XbRkJQlvCK2QnUWRc7GgPGnmaNDipLhm8muhduR7jORdJKGVMSMYdQ7U9XAqC+
	92su3Ry56Nmpi/1u/ONiq55xXOOYQVN6pWV4if47Z3U4rWKt+r/82gEH1gnpPV3gtHlp99dl4s/
	Aw0i6olTWJEq1C9Nn/S2eVnRFt/hAuoY+sqjRA=
X-Received: by 2002:a05:600c:1986:b0:489:32b:ac0b with SMTP id 5b1f17b1804b1-490c2cc27bdmr72114905e9.6.1780698861954;
        Fri, 05 Jun 2026 15:34:21 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00b3e1ccc1be2b2798.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b3e1:ccc1:be2b:2798])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm22132409f8f.10.2026.06.05.15.34.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:34:21 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/25] libarchive: Fix CVE-2026-4424
Date: Sat,  6 Jun 2026 00:34:01 +0200
Message-ID: <7fa280872275e194152cc2d355ad39c81a477d50.1780698373.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780698373.git.yoann.congal@smile.fr>
References: <cover.1780698373.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 22:34:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238203

From: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>

Pick patches from [1] and [2] as mentioned in Debian report in [3].

[1] https://github.com/libarchive/libarchive/commit/d379dc0b2976b7207d1ad78f5ed3eb99a5b6d375
[2] https://github.com/libarchive/libarchive/commit/e1907c5832b6489c7b4198b0825f857c93a03c10
[3] https://security-tracker.debian.org/tracker/CVE-2026-4424

Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
Reviewed-by: Bruno VERNAY <bruno.vernay@se.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libarchive/CVE-2026-4424-1.patch          | 61 +++++++++++++++++++
 .../libarchive/CVE-2026-4424-2.patch          | 28 +++++++++
 .../libarchive/libarchive_3.7.9.bb            |  2 +
 3 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-4424-1.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2026-4424-2.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2026-4424-1.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4424-1.patch
new file mode 100644
index 00000000000..c8050927465
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4424-1.patch
@@ -0,0 +1,61 @@
+From fa32110f851b121a3e1c19fda347e86396fde2bd Mon Sep 17 00:00:00 2001
+From: elhananhaenel <elhanan.haenel@mail.huji.ac.il>
+Date: Sat, 7 Mar 2026 22:32:09 +0200
+Subject: [PATCH 1/2] rar: fix LZSS window size mismatch after PPMd block
+
+When a PPMd-compressed block updates dictionary_size, the LZSS window
+from a prior block is not reallocated. The allocation guard only checks
+if dictionary_size is zero or the window pointer is NULL, not whether
+the existing window is large enough. This allows copy_from_lzss_window()
+to read past the allocated buffer.
+
+Fix the guard to also check whether the current window is undersized.
+Add bounds checks in copy_from_lzss_window() and parse_filter() as
+defense in depth.
+
+CVE: CVE-2026-4424
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/d379dc0b2976b7207d1ad78f5ed3eb99a5b6d375]
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ libarchive/archive_read_support_format_rar.c | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/archive_read_support_format_rar.c
+index 88eab627..b23be937 100644
+--- a/libarchive/archive_read_support_format_rar.c
++++ b/libarchive/archive_read_support_format_rar.c
+@@ -2503,7 +2503,8 @@ parse_codes(struct archive_read *a)
+       return (r);
+   }
+ 
+-  if (!rar->dictionary_size || !rar->lzss.window)
++  if (!rar->dictionary_size || !rar->lzss.window ||
++      (rar->lzss.mask + 1) < rar->dictionary_size)
+   {
+     /* Seems as though dictionary sizes are not used. Even so, minimize
+      * memory usage as much as possible.
+@@ -3104,6 +3105,11 @@ copy_from_lzss_window(struct archive_read *a, uint8_t *buffer,
+ 
+   windowoffs = lzss_offset_for_position(&rar->lzss, startpos);
+   firstpart = lzss_size(&rar->lzss) - windowoffs;
++  if (length > lzss_size(&rar->lzss)) {
++    archive_set_error(&a->archive, ARCHIVE_ERRNO_FILE_FORMAT,
++                      "Bad RAR file data");
++    return (ARCHIVE_FATAL);
++  }
+   if (firstpart < 0) {
+     archive_set_error(&a->archive, ARCHIVE_ERRNO_FILE_FORMAT,
+                       "Bad RAR file data");
+@@ -3266,7 +3272,8 @@ parse_filter(struct archive_read *a, const uint8_t *bytes, uint16_t length, uint
+   else
+     blocklength = prog ? prog->oldfilterlength : 0;
+ 
+-  if (blocklength > rar->dictionary_size)
++  if (blocklength > rar->dictionary_size ||
++      blocklength > (uint32_t)(rar->lzss.mask + 1))
+     return 0;
+ 
+   registers[3] = PROGRAM_SYSTEM_GLOBAL_ADDRESS;
+-- 
+2.43.0
+
diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2026-4424-2.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4424-2.patch
new file mode 100644
index 00000000000..a5c6ba2d2bf
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2026-4424-2.patch
@@ -0,0 +1,28 @@
+From d696008467844efca026bf198a8814a8647ec2d2 Mon Sep 17 00:00:00 2001
+From: elhananhaenel <elhanan.haenel@mail.huji.ac.il>
+Date: Sun, 8 Mar 2026 15:29:46 +0200
+Subject: [PATCH 2/2] Fix -Wsign-compare: cast mask+1 to unsigned int
+
+CVE: CVE-2026-4424
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/e1907c5832b6489c7b4198b0825f857c93a03c10]
+Signed-off-by: Hugo SIMELIERE (Schneider Electric) <hsimeliere.opensource@witekio.com>
+---
+ libarchive/archive_read_support_format_rar.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/archive_read_support_format_rar.c
+index b23be937..a28a6cba 100644
+--- a/libarchive/archive_read_support_format_rar.c
++++ b/libarchive/archive_read_support_format_rar.c
+@@ -2504,7 +2504,7 @@ parse_codes(struct archive_read *a)
+   }
+ 
+   if (!rar->dictionary_size || !rar->lzss.window ||
+-      (rar->lzss.mask + 1) < rar->dictionary_size)
++      (unsigned int)(rar->lzss.mask + 1) < rar->dictionary_size)
+   {
+     /* Seems as though dictionary sizes are not used. Even so, minimize
+      * memory usage as much as possible.
+-- 
+2.43.0
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
index de9682400a8..c167b164b4b 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.7.9.bb
@@ -47,6 +47,8 @@ SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://CVE-2026-4111-1.patch \
            file://CVE-2026-4111-2.patch \
            file://CVE-2026-4426.patch \
+           file://CVE-2026-4424-1.patch \
+           file://CVE-2026-4424-2.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 

