Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6116C6FA8E
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 02:57:19 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.82007.1677466636163774988
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Feb 2023 18:57:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=E+Hm+oq+;
 spf=pass (domain: mvista.com, ip: 209.85.215.170, mailfrom: vkumbhar@mvista.com)
Received: by mail-pg1-f170.google.com with SMTP id s18so2721762pgq.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 18:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lvdftW54BNV5WF1MuvJGabqUoLVHx+ubs8SYrENq7R4=;
        b=E+Hm+oq+SJLv76OMATrEWCWKwLQpwNoCLhM8hj48p52BMmnTXGUJfKNVmz7vfcryqC
         QAlAMMPUImosnh7S3Jz8ziozvUmRYEMMWcQTI/LNGLyXZF6rjs+032GbIvIO84lXjueF
         54qa3Mb3Jwvlj7KOuM6nvuGZm0CWOCZ5vQ8ic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lvdftW54BNV5WF1MuvJGabqUoLVHx+ubs8SYrENq7R4=;
        b=ue7EUNCraGEpmOAlbdeJr1r8IdeKYMRfcEFFcJFQMGonCt0DiPFMS53eBeGeibL7/5
         IqqJvZQUvvHF7LbbdMvJ1sJy+15bffHvmDiUHwv19ooTExh/NoUzeW3wg62rfVgZlpOA
         XyvMoGPphuXu8qWiE/6BJrWy+I/BcyGTvSbnuWLOo6jCN7+jWUDIS0eYipMYU3GbQrSk
         wnWX1mAjugj1p8XJb6yfmN51MIr0SQw1ogAQcov9zcrVOzAeAUoNA+JHvE9iXCv/EIEW
         a8jrpbFNBGhCIAD9CpDc8ot7Yt6+OiQHCZ5FZSF87p/mAOmyHRxfDJND56PF1cXmsR//
         KPVA==
X-Gm-Message-State: AO0yUKWqvloXENQLIkex3xOK37zb+jY2IFuRjCAvxADfseDEDzD6Gyev
	c7rK/Kyz3ikOk2bPWXgJl3L7e1D1osj8L7TQ
X-Google-Smtp-Source: AK7set+QTvjaqJo/mzOaOg9on0GFGSDkHRmQqpLUhA6UbY5IpFRNypuFdeftWZ2es8perSnZLLG2dg==
X-Received: by 2002:aa7:96ee:0:b0:591:3d20:3827 with SMTP id i14-20020aa796ee000000b005913d203827mr19408988pfq.21.1677466635151;
        Sun, 26 Feb 2023 18:57:15 -0800 (PST)
Received: from vkumbhar-Latitude-3400.mvista.com ([116.75.163.148])
        by smtp.gmail.com with ESMTPSA id d7-20020aa78147000000b005ac419804d3sm3062408pfn.186.2023.02.26.18.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 18:57:14 -0800 (PST)
From: Vivek Kumbhar <vkumbhar@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vivek Kumbhar <vkumbhar@mvista.com>
Subject: [OE-core][dunfell][PATCH] harfbuzz: fix CVE-2023-25193 allows attackers to trigger O(n^2) growth via consecutive marks
Date: Mon, 27 Feb 2023 08:27:03 +0530
Message-Id: <20230227025703.4986-1-vkumbhar@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 02:57:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177768

[layout] Limit how far we skip when looking back

Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
---
 .../harfbuzz/harfbuzz/CVE-2023-25193.patch    | 71 +++++++++++++++++++
 .../harfbuzz/harfbuzz_2.6.4.bb                |  5 +-
 2 files changed, 75 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193.patch

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193.patch b/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193.patch
new file mode 100644
index 0000000000..1ae80c29c3
--- /dev/null
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz/CVE-2023-25193.patch
@@ -0,0 +1,71 @@
+From 85be877925ddbf34f74a1229f3ca1716bb6170dc Mon Sep 17 00:00:00 2001
+From: Behdad Esfahbod <behdad@behdad.org>
+Date: Wed, 1 Feb 2023 20:00:43 -0700
+Subject: [PATCH] [layout] Limit how far we skip when looking back
+
+Upstream-Status: Backport [https://github.com/harfbuzz/harfbuzz/commit/85be877925ddbf34f74a1229f3ca1716bb6170dc]
+CVE: CVE-2023-25193
+Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
+---
+ src/hb-ot-layout-common.hh   |  7 +++++++
+ src/hb-ot-layout-gsubgpos.hh | 19 ++++++++++++++++---
+ 2 files changed, 23 insertions(+), 3 deletions(-)
+
+diff --git a/src/hb-ot-layout-common.hh b/src/hb-ot-layout-common.hh
+index fa08140..833be06 100644
+--- a/src/hb-ot-layout-common.hh
++++ b/src/hb-ot-layout-common.hh
+@@ -60,6 +60,13 @@
+ #define HB_MAX_LANGSYS	2000
+ #endif
+ 
++#ifndef HB_MAX_NESTING_LEVEL
++#define HB_MAX_NESTING_LEVEL	6
++#endif
++#ifndef HB_MAX_CONTEXT_LENGTH
++#define HB_MAX_CONTEXT_LENGTH	64
++#endif
++
+ 
+ namespace OT {
+ 
+diff --git a/src/hb-ot-layout-gsubgpos.hh b/src/hb-ot-layout-gsubgpos.hh
+index 579d178..357c2bb 100644
+--- a/src/hb-ot-layout-gsubgpos.hh
++++ b/src/hb-ot-layout-gsubgpos.hh
+@@ -372,7 +372,10 @@ struct hb_ot_apply_context_t :
+     bool next ()
+     {
+       assert (num_items > 0);
+-      while (idx + num_items < end)
++      unsigned stop = end - num_items;
++      if (c->buffer->flags & HB_BUFFER_FLAG_PRODUCE_UNSAFE_TO_CONCAT)
++      	stop = end - 1;
++      while (idx < stop)
+       {
+ 	idx++;
+ 	const hb_glyph_info_t &info = c->buffer->info[idx];
+@@ -398,8 +401,18 @@ struct hb_ot_apply_context_t :
+     }
+     bool prev ()
+     {
+-      assert (num_items > 0);
+-      while (idx > num_items - 1)
++      assert (num_items > 0);      
++      unsigned stop = 1 - num_items;
++      if (c->buffer->flags & HB_BUFFER_FLAG_PRODUCE_UNSAFE_TO_CONCAT)        
++      	stop = 1 - 1;
++      	
++      /* When looking back, limit how far we search; this function is mostly
++       * used for looking back for base glyphs when attaching marks. If we
++       * don't limit, we can get O(n^2) behavior where n is the number of
++       * consecutive marks. */
++      stop = (unsigned) hb_max ((int) stop, (int) idx - HB_MAX_CONTEXT_LENGTH);
++
++      while (idx > stop)
+       {
+ 	idx--;
+ 	const hb_glyph_info_t &info = c->buffer->out_info[idx];
+-- 
+2.25.1
+
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.4.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.4.bb
index ee08c12bee..a488dbee35 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.4.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_2.6.4.bb
@@ -7,7 +7,10 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e11f5c3149cdec4bb309babb020b32b9 \
                     file://src/hb-ucd.cc;beginline=1;endline=15;md5=29d4dcb6410429195df67efe3382d8bc"
 
-SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.xz"
+SRC_URI = "http://www.freedesktop.org/software/harfbuzz/release/${BP}.tar.xz \
+           file://CVE-2023-25193.patch \
+           "
+           
 SRC_URI[md5sum] = "2b3a4dfdb3e5e50055f941978944da9f"
 SRC_URI[sha256sum] = "9413b8d96132d699687ef914ebb8c50440efc87b3f775d25856d7ec347c03c12"
 
-- 
2.25.1


