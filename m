Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C0F3C35FF3
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:52:57 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.4460.1741809176094411299
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:52:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BJCNEsIw;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-223fb0f619dso4683325ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809175; x=1742413975; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rInZxaS/q0MtVSmadAYl+msPXqlcfGrvbDMkx6+OXoQ=;
        b=BJCNEsIwgjRF3K7f+jGCA/Ak+nCFaBwKEWX4VAICn/gFrBaZ4R/E6P+vwDbskmeOXi
         vHajUQDFuIlTEcuuswiwljUBXnwC6tkGmP8FdC2myVFClEYjfvdwb/L9z9hoZdvVCDgT
         ori2id0+gzI4ZV260qwwIGVyUkxn7dk6P7zdnuHy76/bxd141Ts4CDaykTFpMoDmlIUy
         At+HUssMrl4xowwiQptIriooIy7CFjI8hJf6HBQnEtzHelaycBWGVsNgGW8p015uoDtF
         gSy3cDHvk/ZSFRF59RNr5MFZaJSBVumCl6lZ9eyRUFJnKAYi/hUKkTRre2wON+WuYNF9
         c61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809175; x=1742413975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rInZxaS/q0MtVSmadAYl+msPXqlcfGrvbDMkx6+OXoQ=;
        b=O50ULNgI1jVBZRtdmqsSAnBi6woGkAlQ73AZ7wuoBqb+s5sNaDLQRDceiZu/zpkqtc
         vX054k+YrmyAFJiToBNUvRP7sYVcTePWXvjeJr0GsUDJoeLtmaSmbLM6AF0qUxMMR5zq
         GJLAk/2Q6t+1Jo0V44cv1KoxBDLumV/FfSydJgcaK6BTxV1mfgIhUiVAQUQOfw1iLZAm
         bYLcXHnO0D4Vj6io9Ec/LQxwm22gy4zISpE+j+Jcc3kKs1WP4za+4y7gozbJBXfhEMxf
         bgQjLkEiD57SxXeuiTpT2Y+vkxaZh9FzSTEVOoLAUUXkbnGchKbkz2su+oQVExfem4ou
         BqAA==
X-Gm-Message-State: AOJu0Yyh6rDaPLhMQVVf92x3AtUMhU44X238qpWCiLbr2QH6ptGuHeLQ
	91bREuFxDYhQVV1o0hpR144OosdzCK4s4iUBOYu7KWVeZiyjt8ePCRjUaR0mnh1GCuchO96EhzP
	2
X-Gm-Gg: ASbGncuDrN4FBrpcm+O5Wj4x+xwpUg0RVkHri88df0fhqhsKNixAifO03shB8Eg3OG1
	7ldxEiAgC8p1oOhlAikwK3RPLwOUFscpRDkW721DsumWLQ6i5oNJEboHNjjuNdQNffnSbJg78tB
	o24b6/K/ojHxjcKUjRGJ6xq6ad8mfYpgCBu4fZUkbVhAIV/5a5JSZ6lL95cjn0y9p7yrOA/DDh6
	BElYCDLn+y1fSMBqi9GToQpT6EkJSGeJz3BPk4xoDC2a1eqioJzwaENMPCDRfec5bEdCj5aTqrK
	DcYDb1qt63LpZsOJ3UV28nPFKRGprDtifh8=
X-Google-Smtp-Source: AGHT+IHxjcqbPTc3DtbviLqC/CcRe/bFjaxrZw7Pr7bRCDjO/JGn/R0vqzP23CMyEdt1royTV7sGEw==
X-Received: by 2002:a05:6a21:3997:b0:1f5:6c94:2cce with SMTP id adf61e73a8af0-1f58cbc549amr15525356637.30.1741809175314;
        Wed, 12 Mar 2025 12:52:55 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56093c2f5sm1389955a12.67.2025.03.12.12.52.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:52:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 10/25] grub: patch CVE-2024-45774
Date: Wed, 12 Mar 2025 12:52:18 -0700
Message-ID: <e956e7437aa95e006547c3a92271b64c25252a50.1741808973.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741808973.git.steve@sakoman.com>
References: <cover.1741808973.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212677

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick patch mentioning this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../grub/files/CVE-2024-45774.patch           | 37 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45774.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45774.patch b/meta/recipes-bsp/grub/files/CVE-2024-45774.patch
new file mode 100644
index 0000000000..55aecc17d7
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2024-45774.patch
@@ -0,0 +1,37 @@
+From 2c34af908ebf4856051ed29e46d88abd2b20387f Mon Sep 17 00:00:00 2001
+From: Daniel Axtens <dja@axtens.net>
+Date: Fri, 8 Mar 2024 22:47:20 +1100
+Subject: [PATCH] video/readers/jpeg: Do not permit duplicate SOF0 markers in
+ JPEG
+
+Otherwise a subsequent header could change the height and width
+allowing future OOB writes.
+
+Fixes: CVE-2024-45774
+
+Reported-by: Nils Langius <nils@langius.de>
+Signed-off-by: Daniel Axtens <dja@axtens.net>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2024-45774
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=2c34af908ebf4856051ed29e46d88abd2b20387f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/video/readers/jpeg.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/grub-core/video/readers/jpeg.c b/grub-core/video/readers/jpeg.c
+index ae634fd41..631a89356 100644
+--- a/grub-core/video/readers/jpeg.c
++++ b/grub-core/video/readers/jpeg.c
+@@ -339,6 +339,10 @@ grub_jpeg_decode_sof (struct grub_jpeg_data *data)
+   if (grub_errno != GRUB_ERR_NONE)
+     return grub_errno;
+ 
++  if (data->image_height != 0 || data->image_width != 0)
++    return grub_error (GRUB_ERR_BAD_FILE_TYPE,
++		       "jpeg: cannot have duplicate SOF0 markers");
++
+   if (grub_jpeg_get_byte (data) != 8)
+     return grub_error (GRUB_ERR_BAD_FILE_TYPE,
+ 		       "jpeg: only 8-bit precision is supported");
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 3526c43835..ea6e19072e 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -24,6 +24,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2024-45780.patch \
            file://CVE-2024-45783.patch \
            file://CVE-2025-0624.patch \
+           file://CVE-2024-45774.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
-- 
2.43.0


