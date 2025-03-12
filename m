Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A142C35FF2
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:56:27 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.4562.1741809382102474856
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:56:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=n0QTno5s;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ff6ae7667dso632843a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809381; x=1742414181; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jDZZDwW1eMZ3z1M58WPbv0FrrbMdrP6OXFRNwKq4tSY=;
        b=n0QTno5s0l70I62rcONok3n9132kd8AA5hSsiLiADs8ia1r74L6gKZa68aKnn9OH8w
         2UhwjKOOVXevKQUGaFBXtwohxWZwL/Fu3GKPEorhkDMvS9fxZg7N6eLDydHBhOYJMIrj
         Z2E7IHqXPCUQ6yptkGhuB2QSn9d1/Wqx1Sm2yy2ifYW7Z3z8c1F0rqJ7d0YEvrivlnaY
         M1C7AsyYWI0c+rMi/ryRO7FAS/sYWLP9PuZ86dwozjjxlQKSs8wr1AISTlr4bwqftR4s
         Uh43nwMm4YnEF6ts0juzXG3EGVef+EI22OvgD08GcvXuykV/l76cf9q4Z1aqH3cooJwD
         2pWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809381; x=1742414181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jDZZDwW1eMZ3z1M58WPbv0FrrbMdrP6OXFRNwKq4tSY=;
        b=DkKB/YfaMyMwOlvoR1/3yxJ7OFThUpdyT2e25fMt4TJ4A8Jve8lc1qDp3zSxBS8Il7
         g32BkAIWUBGsT8zJgIc2L0hLprqG8G7bQhSrP88jy+iyX/qjcR6p1m3z1MrxTczZJZSq
         3yrxw8a2tsPSWVyjC3ojdxM6qHMcXgsdkkljiUNEuNOLf/pTvxa/Y++2BmD54GA4hOUk
         9BI9lFAXucsOExdXnhC3RiuHjGwbJLcoWdGp/GUVuly4elSJTCor96ueGjueYPIhcelT
         6bG37sz3FkGkjL6xe7zBNDnvatQTSNqA7qsyu3r6ZV+Mo5JjGzw2TIeySvjECME0iRYl
         KJnA==
X-Gm-Message-State: AOJu0YwXKoBlYGJCis0GBfdXhKXHqDhGe6Gk5ZcYYz7JcXh9maMHz44o
	VOgt0SH2GUOS9+VBXUmNGA8yPhFb2kYMdZvM4nnFJIvyzKIWWBfW2tcL5eKvGbXtm9IIEOF+n4m
	/
X-Gm-Gg: ASbGncsD/3af8KtPG0TYTQtJy4c24wnKITWDMwA0AxUo5OH3Qo/uNaq5RtN5GJcXqHb
	PRgTd07oOkeqouE2Hfyjwex4TH9VGJ5uFiHy3uNG/x9LrnCZlvzeCkLCVx4096cvEv5Ntcb+LiZ
	zk0Qa0zipa/xFgD3WxTEZBtCA/vvWebGdh+HNXp0TdzcU6VmSDHv/2uLUhxwRaZoQRZqczNvWmM
	fnrZNWZSXhGoBDYL3ng00uAWDM45i7+JqNeUpUefSkAxPrNvoslCPvSmmtTrrwJQT+MlhclU8xo
	QPUtj4hGkbUA0Y+kCHDZs3jiD1jpywDqe3Q=
X-Google-Smtp-Source: AGHT+IGqXfmk+eqtJZtUbsoGYd8xboGTWMnObLWI7JFmE4T/laWui+Jv3d9pYQdry+kfTCGKgfX+vA==
X-Received: by 2002:a05:6a20:6f88:b0:1f3:2c55:8d8a with SMTP id adf61e73a8af0-1f544aedaebmr33823842637.12.1741809381353;
        Wed, 12 Mar 2025 12:56:21 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281287c10sm9830332a12.78.2025.03.12.12.56.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:56:21 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/28] grub: patch CVE-2024-45777
Date: Wed, 12 Mar 2025 12:55:37 -0700
Message-ID: <2ec4bcda16b92cabf7cf5cb7c68cbe45da269364.1741809252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741809252.git.steve@sakoman.com>
References: <cover.1741809252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:56:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212710

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick patch mentioning this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../grub/files/CVE-2024-45777.patch           | 57 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45777.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45777.patch b/meta/recipes-bsp/grub/files/CVE-2024-45777.patch
new file mode 100644
index 0000000000..0305a95fd5
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2024-45777.patch
@@ -0,0 +1,57 @@
+From b970a5ed967816bbca8225994cd0ee2557bad515 Mon Sep 17 00:00:00 2001
+From: Lidong Chen <lidong.chen@oracle.com>
+Date: Fri, 22 Nov 2024 06:27:57 +0000
+Subject: [PATCH] gettext: Integer overflow leads to heap OOB write
+
+The size calculation of the translation buffer in
+grub_gettext_getstr_from_position() may overflow
+to 0 leading to heap OOB write. This patch fixes
+the issue by using grub_add() and checking for
+an overflow.
+
+Fixes: CVE-2024-45777
+
+Reported-by: Nils Langius <nils@langius.de>
+Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+Reviewed-by: Alec Brown <alec.r.brown@oracle.com>
+
+CVE: CVE-2024-45777
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=b970a5ed967816bbca8225994cd0ee2557bad515]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/gettext/gettext.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/grub-core/gettext/gettext.c b/grub-core/gettext/gettext.c
+index 63bb1ab73..9ffc73428 100644
+--- a/grub-core/gettext/gettext.c
++++ b/grub-core/gettext/gettext.c
+@@ -26,6 +26,7 @@
+ #include <grub/file.h>
+ #include <grub/kernel.h>
+ #include <grub/i18n.h>
++#include <grub/safemath.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -99,6 +100,7 @@ grub_gettext_getstr_from_position (struct grub_gettext_context *ctx,
+   char *translation;
+   struct string_descriptor desc;
+   grub_err_t err;
++  grub_size_t alloc_sz;
+ 
+   internal_position = (off + position * sizeof (desc));
+ 
+@@ -109,7 +111,10 @@ grub_gettext_getstr_from_position (struct grub_gettext_context *ctx,
+   length = grub_cpu_to_le32 (desc.length);
+   offset = grub_cpu_to_le32 (desc.offset);
+ 
+-  translation = grub_malloc (length + 1);
++  if (grub_add (length, 1, &alloc_sz))
++    return NULL;
++
++  translation = grub_malloc (alloc_sz);
+   if (!translation)
+     return NULL;
+ 
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index e4dca6613c..fb33c2bd98 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -31,6 +31,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2025-0622-02.patch \
            file://CVE-2025-0622-03.patch \
            file://CVE-2024-45776.patch \
+           file://CVE-2024-45777.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
-- 
2.43.0


