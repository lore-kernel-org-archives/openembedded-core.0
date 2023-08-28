Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D79C83F11
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 06:17:47 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.7894.1693203460593996316
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Aug 2023 23:17:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=HQ98lN22;
 spf=pass (domain: mvista.com, ip: 209.85.215.174, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so1617404a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Aug 2023 23:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1693203459; x=1693808259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NEgPVdbkY2feHKGrQtZpbHDSpUcfGpEAXA3I7LfYDXI=;
        b=HQ98lN221De0gGMFjCLKxXrCW79jfjRsahj8ZDMxEonyPNo2h67o0Xyvml/S8QFvMF
         SHW6sQwSy0eKEqkeA2d5M/pmljNIJOXJ+ygEaOPCo6aD2e2iZFu1YQJliVjynpQGaURx
         BjNp+lEYIr/eji9UoAAMOw1/OZOG88lV92wFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693203459; x=1693808259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEgPVdbkY2feHKGrQtZpbHDSpUcfGpEAXA3I7LfYDXI=;
        b=Jtrf1KAM1fGyaF96bt+wDo8Zf2Me5aSB47hPn3sMoQZdA6iTLBBO//aUd6rG/IW3qo
         FHyx7YqRxtbiur64ig1oqSlg2vtC3rK19ymZaUaS8RvTazh+OPmjTd/U8qeN6RKroabB
         RhzAMxGZe8cNRqHR3lWSDpGv+bvC70BdGC1lD7/08bsWumGZiDG+CtL3fPJmC5OTGcTt
         RDaNghPrxkQMIea8SVqSYL/U86LW4Lob6ax6PQTj+XaLXLjf3zMxlGdmDRiSjT6MDk9Q
         gaAgfc0YmCkYGhnokPvsa5l9+02/heR6UKCKuaPiVT1Y6nIboxYIoVNkC4ftmZGp4eTP
         32dA==
X-Gm-Message-State: AOJu0YwDY56DgxW9A9A+bQPzvt8Di9BW/6KEatW+Izw9mW5t2YGqZSGJ
	DNEdXQascZw5yQgUdQtj/cUf73R/9d0/6k+4Lswuvw==
X-Google-Smtp-Source: AGHT+IE2JJtDfcWsJYrzFuFGa6fEBAGEU9mj2cw2AZrINTzd7xnGhqmMt72mxSHm3WzRMQaTWfU/eA==
X-Received: by 2002:a05:6a20:938d:b0:137:23a2:2b3c with SMTP id x13-20020a056a20938d00b0013723a22b3cmr31435193pzh.49.1693203459642;
        Sun, 27 Aug 2023 23:17:39 -0700 (PDT)
Received: from MVIN00016.mvista.com ([103.250.136.232])
        by smtp.gmail.com with ESMTPSA id x2-20020a170902b40200b001bba3650448sm6342944plr.258.2023.08.27.23.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 23:17:39 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [kirkstone][PATCH] tiff: fix CVE-2023-2908,CVE-2023-3316,CVE-2023-3618
Date: Mon, 28 Aug 2023 11:47:17 +0530
Message-Id: <20230828061717.14634-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 06:17:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186815

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


