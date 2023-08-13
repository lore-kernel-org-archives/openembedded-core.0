Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D0FEB64DD
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 21:19:09 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web11.93772.1691961545767022358
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 14:19:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=RsrorvXo;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.45, mailfrom: steve@sakoman.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1c0fcbf7ae4so2467269fac.0
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 14:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1691961545; x=1692566345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LrJJIbB1QnK3GcH/x6fPXDDntI4a1aIF2XuzuztGURE=;
        b=RsrorvXoTUkqXymqmFraT2XY0Id+tLKx72z/ZK50//X+7dixBZ7mBCEfqwg3/1JpKj
         tbO6um6FTdWTJ6VukYYIazv5UQDfCJZ+boBSauTtyBNzbz7Zy1GcwZxugdNSjKjnblsr
         4WPs0Jyi65KHroHSh8RjA0xFZ9ewW1gJPiUSIHYEAfaqC60jsBaO/jHhRf143iHUpVof
         ym2dsTGJnrXP8pQCcPgsM7oHqT6awMrVWWC/DmULEngtVmlpbYWjXfgm9oLx3eIoozeM
         GmkzXedW78iCq6yYkoLwKTFR7ZTVkJ/KT46d4+y77R4+qpHl+oaeMZcv057KNd/oFUos
         dIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691961545; x=1692566345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LrJJIbB1QnK3GcH/x6fPXDDntI4a1aIF2XuzuztGURE=;
        b=e6/+maSFGsRBuxgh3FMKL7kAlwlJ+ROQNq5I+y4hLYrxBdAcAMguwepZbu0aVXqAWG
         cu8BU42TxNWkS6EwLb9dXA7xX8vpMpaMPDMy3YSvq5YJMnFUO4FXILg40S8BsyUdm5/b
         MlSagpb8Q0dmSlhW2pQLFobpVylmUhKyB3j5ZTaN5rjVAsOZCM4oxfbiAQYdfBp415s9
         RBAUotuFkhJVr1SfzBmNXbs+EWJBvcP7ZF6ZjO7aHfKxsvedm27S9U/n7CWEhSrKCsLd
         u+O9lqLR6YJ9GusJxvFa6av31wZinAQO3dkOzbW89yuWCGAtnDLqj8S2qTxgQBgD/ZXw
         EPLg==
X-Gm-Message-State: AOJu0YzhPBOHbi4uzSwCq/Lyl4odkpVoiBNVPGNL9wZXEmG0ihazFXUd
	afRtUAu6Ln6YsBxibdUju7nkRMJi0yyZZcl4c9rCYQ==
X-Google-Smtp-Source: AGHT+IEDuMYCxidgNwmjCTFas6CSWuTvcIbHitFeqMiriBsMN4xoBEyo5JSZvE8OzCOWenLGw2ZTbg==
X-Received: by 2002:a05:6870:4593:b0:1b0:2ded:bd7 with SMTP id y19-20020a056870459300b001b02ded0bd7mr7423940oao.26.1691961544549;
        Sun, 13 Aug 2023 14:19:04 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id qa2-20020a17090b4fc200b00263dfe9b972sm8690578pjb.0.2023.08.13.14.19.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 14:19:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/22] tiff: fix multiple CVEs
Date: Sun, 13 Aug 2023 11:18:14 -1000
Message-Id: <4929d08cefac9ae2ebbdf94ccdc51a0f67f28164.1691961051.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691961051.git.steve@sakoman.com>
References: <cover.1691961051.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 21:19:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185899

From: Hitendra Prajapati <hprajapati@mvista.com>

Backport fixes for:
* CVE-2023-2908 - Upstream-Status: Backport from https://gitlab.com/libtiff/libtiff/-/commit/9bd48f0dbd64fb94dc2b5b05238fde0bfdd4ff3f
* CVE-2023-3316 - Upstream-Status: Backport from https://gitlab.com/libtiff/libtiff/-/commit/d63de61b1ec3385f6383ef9a1f453e4b8b11d536
* CVE-2023-3618 - Upstream-Status: Backport from https://gitlab.com/libtiff/libtiff/-/commit/881a070194783561fd209b7c789a4e75566f7f37 && https://gitlab.com/libtiff/libtiff/-/commit/b5c7d4c4e03333ac16b5cfb11acaaeaa493334f8

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


