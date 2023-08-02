Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6883C001DE
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 05:36:06 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.8113.1690954559327454415
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 22:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=HbPXTlv2;
 spf=pass (domain: mvista.com, ip: 209.85.214.170, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1bbc87ded50so40143355ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 22:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1690954558; x=1691559358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fJ1CvGct/9/UdOGvjSmba9/E9HByarg7/oO/lwf+AdQ=;
        b=HbPXTlv20XT9hqjO1tmsqdF9uwmiLGael4X/P/QiaZ1Z2Gew5N0Yxo5B/9sW9OyLRK
         nkI6YzU1ckY/vVeWdHOiv9ZOE+hAkx4M3VoYvSRt709GGy9kW3L7aJ6yJoV4dZ1JxjQG
         +3MyJmNx5gMOjKa3AL3TMRSi599x+y0O4CjY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690954558; x=1691559358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJ1CvGct/9/UdOGvjSmba9/E9HByarg7/oO/lwf+AdQ=;
        b=YXgGLb+hmd+2pmE0h/VM1CAvMP2p0hkdQYV9UfON+fqaoQJSAQyyoK37RPH81ZC/d0
         T050uwPddcwBLvvBXYRDJUacH+roDNv1pMGKKGXLA+ghzlub2oovqYHCMU8FUgSpHl3g
         T/ZDTGkyI1MmFXThlMHdG7D+eZOSlK1Bsr6/t1fUMhfOgfQoZlmNEB5vQWAN7yc/JgHS
         iJNAgkm+mPRKOjDC2EdakMEQyTn+kTHmkTj53tlJiIyry5BNvg+PBH0dztbWZnj9vHCB
         SxheIGjeNsPh5/Y1PA7evjHmPnJkyyxwXrvMQd8CL5SuqU4L9LbvLehU4LeXlOxuuKXH
         JZZg==
X-Gm-Message-State: ABy/qLbH4egDdWRm8tjWOdMJxrzjZ2S1Ok44kUsliKtrU6leHnuxTGlv
	x2LHyGl8TVXvIy36ECcovwi4anlOMSoAnshIvG8=
X-Google-Smtp-Source: APBJJlEPIU+AwQd2vTLu/nSMkqy3cX2H2jt+0l6T9YYCzSE3MqQNeXGVlyyx/7S345SUuIYVv9sXgQ==
X-Received: by 2002:a17:902:eb4d:b0:1bc:98c:b1c5 with SMTP id i13-20020a170902eb4d00b001bc098cb1c5mr7725238pli.35.1690954558502;
        Tue, 01 Aug 2023 22:35:58 -0700 (PDT)
Received: from MVIN00024 ([43.249.234.255])
        by smtp.gmail.com with ESMTPSA id c10-20020a170902c1ca00b001bc18e579aesm4336851plc.101.2023.08.01.22.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 22:35:58 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Wed, 02 Aug 2023 11:05:53 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] tiff: fix multiple CVEs
Date: Wed,  2 Aug 2023 11:05:52 +0530
Message-Id: <20230802053552.20162-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 05:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185375

Backport fixes for:
* CVE-2023-2908 - Upstream-Status: Backport from https://gitlab.com/libtiff/libtiff/-/commit/9bd48f0dbd64fb94dc2b5b05238fde0bfdd4ff3f
* CVE-2023-3316 - Upstream-Status: Backport from https://gitlab.com/libtiff/libtiff/-/commit/d63de61b1ec3385f6383ef9a1f453e4b8b11d536
* CVE-2023-3618 - Upstream-Status: Backport from https://gitlab.com/libtiff/libtiff/-/commit/881a070194783561fd209b7c789a4e75566f7f37 && https://gitlab.com/libtiff/libtiff/-/commit/b5c7d4c4e03333ac16b5cfb11acaaeaa493334f8

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libtiff/files/CVE-2023-2908.patch         | 33 +++++++++++
 .../libtiff/files/CVE-2023-3316.patch         | 59 +++++++++++++++++++
 .../libtiff/files/CVE-2023-3618-1.patch       | 34 +++++++++++
 .../libtiff/files/CVE-2023-3618-2.patch       | 47 +++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |  4 ++
 5 files changed, 177 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-2908.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-3316.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-3618-1.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-3618-2.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-2908.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-2908.patch
new file mode 100644
index 0000000000..62a5e1831c
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2023-2908.patch
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
+index 9d8267a..6389b40 100644
+--- a/libtiff/tif_dir.c
++++ b/libtiff/tif_dir.c
+@@ -145,10 +145,10 @@ static uint16
+ countInkNamesString(TIFF *tif, uint32 slen, const char *s)
+ {
+ 	uint16 i = 0;
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
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-3316.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-3316.patch
new file mode 100644
index 0000000000..8db24fc714
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2023-3316.patch
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
+index e4228df..335e80f 100644
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
+index a533089..f14bb0c 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -2526,7 +2526,10 @@ main(int argc, char* argv[])
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
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-3618-1.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-3618-1.patch
new file mode 100644
index 0000000000..35ed852519
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2023-3618-1.patch
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
+index f14bb0c..7121c7c 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -7746,8 +7746,13 @@ createCroppedImage(struct image_data *image, struct crop_mask *crop,
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
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2023-3618-2.patch b/meta/recipes-multimedia/libtiff/files/CVE-2023-3618-2.patch
new file mode 100644
index 0000000000..fd67305c0b
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2023-3618-2.patch
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
+index 7121c7c..93b7f96 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -2437,9 +2437,15 @@ main(int argc, char* argv[])
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
+@@ -7749,7 +7755,7 @@ createCroppedImage(struct image_data *image, struct crop_mask *crop,
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
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
index fcb2ce1ae4..e3daaf1007 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
@@ -40,6 +40,10 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2023-25434-CVE-2023-25435.patch \
            file://CVE-2023-26965.patch \
            file://CVE-2023-26966.patch \
+           file://CVE-2023-2908.patch \
+           file://CVE-2023-3316.patch \
+           file://CVE-2023-3618-1.patch \
+           file://CVE-2023-3618-2.patch \
           "
 SRC_URI[md5sum] = "2165e7aba557463acc0664e71a3ed424"
 SRC_URI[sha256sum] = "5d29f32517dadb6dbcd1255ea5bbc93a2b54b94fbf83653b4d65c7d6775b8634"
-- 
2.25.1


