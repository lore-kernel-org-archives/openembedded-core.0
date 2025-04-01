Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C313C3601B
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 19:59:35 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.3270.1743537572339922364
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 12:59:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=uSdJrpHm;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-227d6b530d8so109515455ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1743537571; x=1744142371; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NOR6O2PETuwaRvAAsFwwlVya0nS6q0LKyJxiyMYG4Ik=;
        b=uSdJrpHm3e2b+W9cbmptjP+pqOrO0oUwrGhWQfpa8k9RitRTmEeasparW/DdYOOhzQ
         td3G76vCMNfB7o6EGiElI2o/dxz4T/HuAo1F0Pca+z+oQg9QtVII4tTpfi/M3eqtKW1M
         NyOw5Xuqu1nKSWqPvhNStx5X7sho3i+msAIuIrMphNUh55Zt3ZYZZ9Ju44G+YwpTNIRM
         +ZLkAWyfi51f716InABukvMZAf8BtymOr67pmQK+nkjWbyq7moRabf9t3vm+eaenUm5b
         8z6Qd8fopFP4F54AMH25qNq9dYSW/PnVbAgq1wO87wCk9WbhbxTKaaxaQT6+ZhepuQUN
         rg4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743537571; x=1744142371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NOR6O2PETuwaRvAAsFwwlVya0nS6q0LKyJxiyMYG4Ik=;
        b=OTnjqIQeWSCjIqE5hm822KWBQp0E90M+2fNZ+dNouBCSY5vS1v4X7LNPyQh52Abf6z
         CX2Hah82Ie58tvz0AJQ8g/mmZYjfbw9ELJXfcJug+OcmcjEWwlqsV4LOTOV1PCn6lPg7
         45rIwYDL+xgvAp8FQJZLW3shIHmtXoPEsoEKsdw7Fs1kC0OEpPj90yzmT5U9Ogr6Qpw1
         YBeT+77u/q84vf55L8tBZH4t7mQ0CUm4ZfXiPQRab1HtFrmrRLVvlObevCZKS9xwEzUZ
         TYxeWfoiS5KmGfXSvHwCgs9Nh1+nVL6t3YBpJoKh6VbnH9Jq1wdIqfSBl3qQTfQUgmGV
         LHEQ==
X-Gm-Message-State: AOJu0YzaVIRBbE8oo61OwxufVyXdS7vKlXqKLCrD5wQiBEcwFOFZ/t5L
	YGS09RkQtUziINs4Nd8rhGRzXeNXHs3Mm2G5VEA3TSLQ5P/x31hBVbOebouIZMtcH4mRT8x3dPE
	R
X-Gm-Gg: ASbGncuy1lwMDFo8YILXzqmVTrXICP0t5nZNOTF9sYMuFdYWw7oKwEZaDD3mYIS3D3o
	e3yXkuZLAljbzX1LAE9Xn5+l+sZ1IbC2LwgsvyR/meq5RWlGyeVupAgz5TcG/IyAboCHh503pFq
	m6/FYePDIZPKpXNg0EDmxD1U0dhULCSr2/e/qwgymgZuJtqurto0ym7U8HzZ+emIJ7BLXU0x5zy
	ygINcSKQ8/Cmo/NaDG4lU4IHBk/QblL7DPZ2q2Kq5APVZ7nEQ8bDV9SWjyRP4K89XnVBVNNgyy3
	m6XaXWEcCJ/VKUrynBjffV4k33K1Evix6IYZ
X-Google-Smtp-Source: AGHT+IHs/sE1jCmhiohqYjXjCgg95k2j6mCcWgA0l5YVYQcw+q9yM7UiTWplq9YloTwRaWg9nsbaHg==
X-Received: by 2002:a05:6a20:9f8e:b0:1f5:6a1a:329b with SMTP id adf61e73a8af0-200d155f306mr9093154637.32.1743537571555;
        Tue, 01 Apr 2025 12:59:31 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:6021:5333:bc00:e45b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af93b52ea6bsm7234369a12.0.2025.04.01.12.59.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 12:59:31 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 2/5] freetype: follow-up patch for CVE-2025-27363
Date: Tue,  1 Apr 2025 12:59:19 -0700
Message-ID: <41f855ea5a2018d08e0e9457d710032e96fe669b.1743537463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743537463.git.steve@sakoman.com>
References: <cover.1743537463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 19:59:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214147

From: Peter Marko <peter.marko@siemens.com>

Per [1] there are two patches needed - [2] which is already included in
3.13.1 and [3] which is only in 2.13.3.
Backport the second patch.

[1] https://gitlab.freedesktop.org/freetype/freetype/-/issues/1322
[2] https://gitlab.freedesktop.org/freetype/freetype/-/commit/ef636696524b081f1b8819eb0c6a0b932d35757d
[3] https://gitlab.freedesktop.org/freetype/freetype/-/commit/73720c7c9958e87b3d134a7574d1720ad2d24442

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../freetype/freetype/CVE-2025-27363.patch    | 33 +++++++++++++++++++
 .../freetype/freetype_2.13.2.bb               |  4 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/freetype/freetype/CVE-2025-27363.patch

diff --git a/meta/recipes-graphics/freetype/freetype/CVE-2025-27363.patch b/meta/recipes-graphics/freetype/freetype/CVE-2025-27363.patch
new file mode 100644
index 0000000000..0882b01498
--- /dev/null
+++ b/meta/recipes-graphics/freetype/freetype/CVE-2025-27363.patch
@@ -0,0 +1,33 @@
+From 73720c7c9958e87b3d134a7574d1720ad2d24442 Mon Sep 17 00:00:00 2001
+From: Alexei Podtelezhnikov <apodtele@gmail.com>
+Date: Sun, 23 Jun 2024 10:58:00 -0400
+Subject: [PATCH] * src/truetype/ttgload.c (load_truetype_glyph): Unsigned fix.
+
+CVE: CVE-2025-27363
+Upstream-Status: Backport [https://gitlab.freedesktop.org/freetype/freetype/-/commit/73720c7c9958e87b3d134a7574d1720ad2d24442]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/truetype/ttgload.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/truetype/ttgload.c b/src/truetype/ttgload.c
+index 8cddc394c..b656ccf04 100644
+--- a/src/truetype/ttgload.c
++++ b/src/truetype/ttgload.c
+@@ -1741,14 +1741,14 @@
+       if ( FT_IS_NAMED_INSTANCE( FT_FACE( face ) ) ||
+            FT_IS_VARIATION( FT_FACE( face ) )      )
+       {
+-        short        i, limit;
++        FT_UShort    i, limit;
+         FT_SubGlyph  subglyph;
+ 
+         FT_Outline  outline = { 0, 0, NULL, NULL, NULL, 0 };
+         FT_Vector*  unrounded = NULL;
+ 
+ 
+-        limit = (short)gloader->current.num_subglyphs;
++        limit = (FT_UShort)gloader->current.num_subglyphs;
+ 
+         /* construct an outline structure for              */
+         /* communication with `TT_Vary_Apply_Glyph_Deltas' */
diff --git a/meta/recipes-graphics/freetype/freetype_2.13.2.bb b/meta/recipes-graphics/freetype/freetype_2.13.2.bb
index 4e7a0ad160..ce7a615a3c 100644
--- a/meta/recipes-graphics/freetype/freetype_2.13.2.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.13.2.bb
@@ -13,7 +13,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=843b6efc16f6b1652ec97f89d5a516c0 \
                     file://docs/GPLv2.TXT;md5=8ef380476f642c20ebf40fecb0add2ec \
                     "
 
-SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz"
+SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz \
+           file://CVE-2025-27363.patch \
+"
 SRC_URI[sha256sum] = "12991c4e55c506dd7f9b765933e62fd2be2e06d421505d7950a132e4f1bb484d"
 
 UPSTREAM_CHECK_REGEX = "freetype-(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


