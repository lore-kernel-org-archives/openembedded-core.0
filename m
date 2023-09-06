Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3246AEB8FBF
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 12:48:42 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.7458.1694004512583096555
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 05:48:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=HCdQjCje;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-56a8794b5adso2496940a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 05:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1694004511; x=1694609311; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2gg+WgO+PNx7UeO+acZbzLUHXdPc1wr0evDRSPh+YXU=;
        b=HCdQjCje1didQVlVVpA5UnC1O29DJJpdAv1SwhotEkDJ9Dd6O4pjsK0shngltFpYNP
         ohddNXqf9U6Frqz6FDoifkP1bsByff0zSo6Ae+C8VoRklirjQbaHcHjAK3ehCnLqSHcS
         GCQ3LxhDxo82cRONONO5XWieU7Dkh/0cdRTjHUghjpslqyBTit4B8osi9Ntgu+5H16+m
         taaPrlQ/qn2RJYJtVcdnyFIcmJXghUxCVHuOF84ybF4moquf+fOmJdSLqwkTVRvHr48G
         CMJaGcWZ33GYTL/45FwtuI8D49Sla9gpCX1e5SqXeJRg240SOPw/kcakdqZrJhvM0OUz
         oF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694004511; x=1694609311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2gg+WgO+PNx7UeO+acZbzLUHXdPc1wr0evDRSPh+YXU=;
        b=JL/22kbdtmCfyVsPKOewYZHdzKPu/0iGg8vyYVsjzRIEbgVO3g/K05VbkFCRdfty21
         l1pD7EppfIaYcz6DAEtZsi0JcCn7PXFyKwj9zO5Kt19e0dBoVMWo3bMTetgbuCVpDtOY
         wceRhw6dM2irzA4wGOPNKlnsRMyztfxQVaPvbvS8KAXBtHe/N8MtjUHHv4NiFOEd0y5u
         Z9PDwig5KL5BUQLVUEdxtrhwFcqn7tmpMZdueMBXl+sm4MyYq8vage6qmI1SIFnQdX/r
         p5Y/RbanljJsQ3SuGcioWhEufm635dwlLNSKOmYIKUXtofBad3PTP40oOnBDHYN0OyTp
         /tRg==
X-Gm-Message-State: AOJu0YwGpRAPo8OKN8J+ID/EkktxRfXpRs89bB3GiJOJxWrHk4h7skXh
	mP4XpZjfpLJAHjwRpRCRj+4uR2cpUToRVi50ryw=
X-Google-Smtp-Source: AGHT+IH0XhOvRdH4MTM4VG2Rjslz36WMq+8adzx7U79HGUvJ+knm3jENl00FtHVarjSOIFjEOxrtTQ==
X-Received: by 2002:a17:90a:3e85:b0:271:9e59:df28 with SMTP id k5-20020a17090a3e8500b002719e59df28mr14547177pjc.29.1694004511401;
        Wed, 06 Sep 2023 05:48:31 -0700 (PDT)
Received: from xps13.. ([65.154.164.134])
        by smtp.gmail.com with ESMTPSA id n10-20020a17090a928a00b00267d9f4d340sm12495009pjo.44.2023.09.06.05.48.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 05:48:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/14] tiff: fix CVE-2023-2908,CVE-2023-3316,CVE-2023-3618
Date: Wed,  6 Sep 2023 02:48:08 -1000
Message-Id: <d37cf315135c6778774a1bee458e61480f808aa5.1694004064.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1694004064.git.steve@sakoman.com>
References: <cover.1694004064.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 12:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187297

From: Hitendra Prajapati <hprajapati@mvista.com>

Backport fixes for:
* CVE-2023-2908 - Upstream-Status: Backport from https://gitlab.com/libtiff/libtiff/-/commit/9bd48f0dbd64fb94dc2b5b05238fde0bfdd4ff3f
* CVE-2023-3316 - Upstream-Status: Backport from https://gitlab.com/libtiff/libtiff/-/commit/d63de61b1ec3385f6383ef9a1f453e4b8b11d536
* CVE-2023-3618 - Upstream-Status: Backport from https://gitlab.com/libtiff/libtiff/-/commit/881a070194783561fd209b7c789a4e75566f7f37 && https://gitlab.com/libtiff/libtiff/-/commit/b5c7d4c4e03333ac16b5cfb11acaaeaa493334f8

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


