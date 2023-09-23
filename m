Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D6FCE7A89
	for <webhook@archiver.kernel.org>; Sat, 23 Sep 2023 20:45:14 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.28656.1695501910489409810
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Sep 2023 13:45:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rd/W4tji;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-57790939a2bso2528689a12.3
        for <openembedded-core@lists.openembedded.org>; Sat, 23 Sep 2023 13:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695501909; x=1696106709; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UUOCmC4236VX2pnR06nj5ekiXueII1FQvjT/dcZfytc=;
        b=Rd/W4tji+6DSmA8H9VkpYv8k0JYEcmuZ9gisrLewvOF6go7DcOo/JxRXaMI4iITDfL
         NNpsbfOlw3ErUWrswWW5Yj6RZ7vXCtH7mn0v5dZrl2Qzma2b972mW5FClKKB1Ufcu6rR
         8dTKS6K+o5fNX15f8Dy4eVHLMEjte5PissJmlzxbhAodUPHCTRViDmwQuEQa8SyVsHMB
         nz/UGrw8Z2TTuzctTRFP01LkguPxDMHekorUp9MY/qYPVAQqdMPheFYoRHQYgw3f6flU
         SOQrF0YmUMdqJq/z085Ruu/rhBodN5M36pWCTIFW82EfHhn4XODxhT8PljyO16mgJcqz
         oFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695501909; x=1696106709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UUOCmC4236VX2pnR06nj5ekiXueII1FQvjT/dcZfytc=;
        b=q5UdttifWfK49O2E50xej9rQRUsqPTonMaGUiaI95g8XMMGrANqfEXCjl4e81rEHYM
         E42IQ0Nxol5GgO5JOSD/I7h9arCnjjGCzwRcIHMZrMcB9hW18dkmDx23KP0Zz4cUjQ/I
         RNO54XwpD/kcaCaZYMB4rdntXQGlTlcpL1Hsyqscb/DIwoo5VG7INkuSdBYS/BI/0twY
         c9CxnnzEbBzqr96CKZpMjFudeoj5XWEphu1XODcgBEklw5Ev+/SS8/w+1asIYoKikTIH
         Kq2NvDpVrrVFKLMuchsHUin7iUkCNZAXbAY1uIcnGp4fGQ8GfaqfSbUvzWbZnM7SUO7n
         DgnQ==
X-Gm-Message-State: AOJu0Yym3vDdedQcA856hlirmmNSut8I54wqTNwRS1JPUy2oRmWZ2Fgl
	CwhKl+mqUqfxaUiVCFP5IVTBRzhcKbZBXQ==
X-Google-Smtp-Source: AGHT+IHgp/VpvKt9tvm1pOAP4BN3mIGm64rfgSl0UqDnPNC46l2Ee2ie5TT7E7+Rv6mbht1+YR18lw==
X-Received: by 2002:a05:6a21:a584:b0:15e:556:bc26 with SMTP id gd4-20020a056a21a58400b0015e0556bc26mr2800191pzc.62.1695501909476;
        Sat, 23 Sep 2023 13:45:09 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::d373])
        by smtp.gmail.com with ESMTPSA id q11-20020a17090311cb00b001c3721897fcsm5760450plh.277.2023.09.23.13.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Sep 2023 13:45:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] glib-2.0: Enable possible locales with musl for ptests
Date: Sat, 23 Sep 2023 13:45:06 -0700
Message-ID: <20230923204507.882395-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Sep 2023 20:45:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188153

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index c314594d493..5183f37a6ef 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -171,6 +171,12 @@ RDEPENDS:${PN}-ptest += "\
             python3-modules \
             ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'python3-dbusmock', '', d)} \
             ${PN}-codegen \
+            locale-base-de-de \
+            locale-base-es-es \
+            locale-base-en-gb \
+            locale-base-en-us \
+            locale-base-fr-fr \
+            locale-base-ru-ru \
            "
 
 RDEPENDS:${PN}-ptest:append:libc-glibc = "\
@@ -185,18 +191,12 @@ RDEPENDS:${PN}-ptest:append:libc-glibc = "\
             glibc-gconv-iso8859-15 \
             glibc-charmap-invariant \
             glibc-localedata-translit-cjk-variants \
-            locale-base-tr-tr \
             locale-base-lt-lt \
             locale-base-ja-jp.euc-jp \
             locale-base-fa-ir \
-            locale-base-ru-ru \
-            locale-base-de-de \
             locale-base-hr-hr \
             locale-base-el-gr \
-            locale-base-fr-fr \
-            locale-base-es-es \
-            locale-base-en-gb \
-            locale-base-en-us \
             locale-base-pl-pl \
             locale-base-pl-pl.iso-8859-2 \
+            locale-base-tr-tr \
            "
-- 
2.42.0


