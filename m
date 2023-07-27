Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B60C00528
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 03:51:47 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.260.1690429900960137554
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 20:51:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=A8P+G2Ig;
 spf=pass (domain: mvista.com, ip: 209.85.222.178, mailfrom: hprajapati@mvista.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-76571dae5feso47042285a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 20:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1690429900; x=1691034700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NEgPVdbkY2feHKGrQtZpbHDSpUcfGpEAXA3I7LfYDXI=;
        b=A8P+G2IgOOHlme5DzYHM91LkV9Xaw5QVYlR/YRoJiZ9bqZs8SfcB5jOyTE7QYvuHmq
         B4BRfsoeu9S4zT6gD5zs7twi3cQj+dUTwMsfS1BcNzmsQLMn9R60t93NkyN+BUsg/m8M
         0hSTpj4reSRQb4/vG7qs9HWFSCPcNOcT7pW8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690429900; x=1691034700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEgPVdbkY2feHKGrQtZpbHDSpUcfGpEAXA3I7LfYDXI=;
        b=jmUTYVhQJ2KEMcAzxRkB40oDrN1izFaEfa/5TKLnFdrVjHyPzbqx7ZZ1PLlnD2TsN+
         ZwdKjDsE45Uugc/z4HYKLYl++0MGDll1i/BM+s6tH0/CEDBt2YgsyUtJ2ScUaCOmgMhF
         u+uDbsKYhOy1MDMXJzF9Q9A4o5/CnS2K1Yufd1NgYB4o+auXydVuiojkJYbpn0zaMoVf
         BGdHV/wF3prk2O39+fJWjz5uJejSfNrGF30fXYjAyMJ4w6Oaf5ZwO/hlVoRrALC/3nOP
         Qz+HTLVxYmLxE8lw6nTtdOwsHvrMV2MKpCrTy46p0XVRliNhuTuoPYJs0B20L+9KkLm0
         xKNg==
X-Gm-Message-State: ABy/qLZ9Z2jHSg4Im3svUlJj5YIr9/9LtwZRj6mGVuSnKjWjmCdmbLKo
	xX8NWx5c5BdMJkaC1M7kBsbhpYSnYvTcbh3UpLHSYA==
X-Google-Smtp-Source: APBJJlHNEHrNvlnm+59vsvRMfk3rProTmdyuwUsrmwF300wY6bbB3Gl8YQCRBuP6Ggxmoq2Mqnf3QQ==
X-Received: by 2002:a05:620a:4510:b0:767:1938:93c7 with SMTP id t16-20020a05620a451000b00767193893c7mr5330785qkp.43.1690429899771;
        Wed, 26 Jul 2023 20:51:39 -0700 (PDT)
Received: from MVIN00024 ([150.129.170.229])
        by smtp.gmail.com with ESMTPSA id i9-20020a17090a2ac900b00263e4dc33aasm2057483pjg.11.2023.07.26.20.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 20:51:39 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Thu, 27 Jul 2023 09:21:34 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCHv2] tiff: fix multiple CVEs
Date: Thu, 27 Jul 2023 09:21:31 +0530
Message-Id: <20230727035131.26805-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 03:51:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184906

Backport fixes for:
* CVE-2023-2908 - Upstream-Status: Backport from https://gitlab.com/libtiff/libtiff/-/commit/9bd48f0dbd64fb94dc2b5b05238fde0bfdd4ff3f
* CVE-2023-3316 - Upstream-Status: Backport from https://gitlab.com/libtiff/libtiff/-/commit/d63de61b1ec3385f6383ef9a1f453e4b8b11d536
* CVE-2023-3618 - Upstream-Status: Backport from https://gitlab.com/libtiff/libtiff/-/commit/881a070194783561fd209b7c789a4e75566f7f37 && https://gitlab.com/libtiff/libtiff/-/commit/b5c7d4c4e03333ac16b5cfb11acaaeaa493334f8

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libtiff/tiff/CVE-2023-2908.patch          | 33 +++++++++++
 .../libtiff/tiff/CVE-2023-3316.patch          | 59 +++++++++++++++++++
 .../libtiff/tiff/CVE-2023-3618-1.patch        | 34 +++++++++++
 .../libtiff/tiff/CVE-2023-3618-2.patch        | 47 +++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  4 ++
 5 files changed, 177 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-2908.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-3316.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-3618-1.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-3618-2.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-2908.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-2908.patch
new file mode 100644
index 0000000000..cf94fd23d8
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-2908.patch
@@ -0,0 +1,33 @@
+From 8c0859a80444c90b8dfb862a9f16de74e16f0a9e Mon Sep 17 00:00:00 2001
+From: xiaoxiaoafeifei <lliangliang2007@163.com>
+Date: Fri, 21 Apr 2023 13:01:34 +0000
+Subject: [PATCH] countInkNamesString(): fix `UndefinedBehaviorSanitizer`:
+ applying zero offset to null pointer
+
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/9bd48f0dbd64fb94dc2b5b05238fde0bfdd4ff3f]
+CVE: CVE-2023-2908
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ libtiff/tif_dir.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libtiff/tif_dir.c b/libtiff/tif_dir.c
+index 349dfe4..1402c8e 100644
+--- a/libtiff/tif_dir.c
++++ b/libtiff/tif_dir.c
+@@ -145,10 +145,10 @@ static uint16_t
+ countInkNamesString(TIFF *tif, uint32_t slen, const char *s)
+ {
+ 	uint16_t i = 0;
+-	const char *ep = s + slen;
+-	const char *cp = s;
+ 
+ 	if (slen > 0) {
++		const char *ep = s + slen;
++	        const char *cp = s;
+ 		do {
+ 			for (; cp < ep && *cp != '\0'; cp++) {}
+ 			if (cp >= ep)
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-3316.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-3316.patch
new file mode 100644
index 0000000000..1aa4ba45ac
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-3316.patch
@@ -0,0 +1,59 @@
+From d63de61b1ec3385f6383ef9a1f453e4b8b11d536 Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Fri, 3 Feb 2023 17:38:55 +0100
+Subject: [PATCH] TIFFClose() avoid NULL pointer dereferencing. fix#515
+
+Closes #515
+
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/d63de61b1ec3385f6383ef9a1f453e4b8b11d536]
+CVE: CVE-2023-3316
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ libtiff/tif_close.c | 11 +++++++----
+ tools/tiffcrop.c    |  5 ++++-
+ 2 files changed, 11 insertions(+), 5 deletions(-)
+
+diff --git a/libtiff/tif_close.c b/libtiff/tif_close.c
+index 674518a..0fe7af4 100644
+--- a/libtiff/tif_close.c
++++ b/libtiff/tif_close.c
+@@ -118,13 +118,16 @@ TIFFCleanup(TIFF* tif)
+  */
+ 
+ void
+-TIFFClose(TIFF* tif)
++TIFFClose(TIFF *tif)
+ {
+-	TIFFCloseProc closeproc = tif->tif_closeproc;
+-	thandle_t fd = tif->tif_clientdata;
++    if (tif != NULL)
++    {
++        TIFFCloseProc closeproc = tif->tif_closeproc;
++        thandle_t fd = tif->tif_clientdata;
+ 
+ 	TIFFCleanup(tif);
+-	(void) (*closeproc)(fd);
++        (void)(*closeproc)(fd);
++    }
+ }
+ 
+ /* vim: set ts=8 sts=8 sw=8 noet: */
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index ce77c74..cd49660 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -2548,7 +2548,10 @@ main(int argc, char* argv[])
+       }
+     }
+ 
+-  TIFFClose(out);
++    if (out != NULL)
++    {
++        TIFFClose(out);
++    }
+ 
+   return (0);
+   } /* end main */
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-3618-1.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-3618-1.patch
new file mode 100644
index 0000000000..8f55d2b496
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-3618-1.patch
@@ -0,0 +1,34 @@
+From 881a070194783561fd209b7c789a4e75566f7f37 Mon Sep 17 00:00:00 2001
+From: zhailiangliang <zhailiangliang@loongson.cn>
+Date: Tue, 7 Mar 2023 15:02:08 +0800
+Subject: [PATCH] Fix memory leak in tiffcrop.c
+
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/881a070194783561fd209b7c789a4e75566f7f37]
+CVE: CVE-2023-3618
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ tools/tiffcrop.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index cd49660..0d02f56 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -7839,8 +7839,13 @@ createCroppedImage(struct image_data *image, struct crop_mask *crop,
+ 
+   read_buff = *read_buff_ptr;
+ 
++  /* Memory is freed before crop_buff_ptr is overwritten */
++    if (*crop_buff_ptr != NULL)
++    {
++	_TIFFfree(*crop_buff_ptr);
++    }
++
+   /* process full image, no crop buffer needed */
+-  crop_buff = read_buff;
+   *crop_buff_ptr = read_buff;
+   crop->combined_width = image->width;
+   crop->combined_length = image->length;
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-3618-2.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-3618-2.patch
new file mode 100644
index 0000000000..4179145722
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-3618-2.patch
@@ -0,0 +1,47 @@
+From b5c7d4c4e03333ac16b5cfb11acaaeaa493334f8 Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Fri, 5 May 2023 19:43:46 +0200
+Subject: [PATCH] Consider error return of writeSelections(). Fixes #553
+
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/b5c7d4c4e03333ac16b5cfb11acaaeaa493334f8]
+CVE: CVE-2023-3618
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ tools/tiffcrop.c | 14 ++++++++++----
+ 1 file changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index 0d02f56..8cbeb68 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -2459,9 +2459,15 @@ main(int argc, char* argv[])
+         {  /* Whole image or sections not based on output page size */
+         if (crop.selections > 0)
+           {
+-	  writeSelections(in, &out, &crop, &image, &dump, seg_buffs,
+-                          mp, argv[argc - 1], &next_page, total_pages);
+-          }
++             if (writeSelections(in, &out, &crop, &image, &dump,
++                                 seg_buffs, mp, argv[argc - 1],
++                                 &next_page, total_pages))
++              {
++                TIFFError("main",
++                          "Unable to write new image selections");
++                exit(EXIT_FAILURE);
++              }
++	  }
+ 	else  /* One file all images and sections */
+           {
+ 	  if (update_output_file (&out, mp, crop.exp_mode, argv[argc - 1],
+@@ -7842,7 +7848,7 @@ createCroppedImage(struct image_data *image, struct crop_mask *crop,
+   /* Memory is freed before crop_buff_ptr is overwritten */
+     if (*crop_buff_ptr != NULL)
+     {
+-	_TIFFfree(*crop_buff_ptr);
++       _TIFFfree(*crop_buff_ptr);
+     }
+ 
+   /* process full image, no crop buffer needed */
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 4796dfde24..8e69621afb 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -38,6 +38,10 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2023-25433.patch \
            file://CVE-2023-25434-CVE-2023-25435.patch \
            file://CVE-2023-26965.patch \
+           file://CVE-2023-2908.patch \
+           file://CVE-2023-3316.patch \
+           file://CVE-2023-3618-1.patch \
+           file://CVE-2023-3618-2.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
-- 
2.25.1


