Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2180EC2BA1B
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:53:07 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.4465.1741809181924920621
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:53:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=n/M75SPj;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3011737dda0so513751a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809181; x=1742413981; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IE8G3jdfRcp7YPMUCQ50Y5H18RPtrToj6NNneaEWtwk=;
        b=n/M75SPj0dVJ0eGH9aFfN4fySTfypaWBXCLtFblJhNOAXWiyG0Qpg90NM1S4lycU0L
         JmSm/cDxLqEVPxXlEMwC5JjO1HqERFLacleYTE5zGZLEadZw7udxueRQ//gnfS+ZRpaJ
         zGCwaDbGA04ss34+XdwFzgws+WbvhstcrGTdilj8pIL9F6v6Tf4SwA5XI7lJcBNEPMyg
         e+fFh5YWZSLH0kGq2hH3nN9m5rUnyf/GXoluGoP5Ltg3P8bB9ZWwmMBVJFQR4ZBmK4aQ
         wb8igW0XsjmCtLa8XR9SLODsSIpcXCKvHlFrB4HiplWzWG/anicyvcev44B/E5QKqLZQ
         llQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809181; x=1742413981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IE8G3jdfRcp7YPMUCQ50Y5H18RPtrToj6NNneaEWtwk=;
        b=L6nW0KhIwnfJZEK5s/dYRE3nNyUv0yGuO4s+2Y0jBdcfvnIBG8HD4VMccmv22fJbJv
         QhsUK8EVwA8mGxa/qg9yISAen2coiEcv1987R6mDlhJw0+BF0f4lMqxdZ5iNaE4SplBw
         ST6F+Ba85y0hZC0L0y9RIraSfjmViUXHDfOKWjfRFnfZWL4C5Hb/CBUns4tg0Emhf4jr
         xmdPYE3NQD0pqnnRDD3f4ZNOxa1ZYgQy/WH2n6BRf9H1QWPX8DgBHXtHjZj4jZX6PxLD
         5EEqHf8BCnRPF5LjvxHbNavmb9KIJFEXrkC8qiIVqHvP+bLeUPh23dg9bfs3daPqQdKt
         mdVQ==
X-Gm-Message-State: AOJu0YyyenfSCL3u4e7L6yVn35mIzjqw0KKTNEgVfOkbwkdRB8ShUvo0
	S9PzE6wRO9Lz9e1jXRoqWRegQNEf+2xqXj8OC07IcSbfoZqXvEQ3F6082gaLLnmGAvVduGwi4qR
	b
X-Gm-Gg: ASbGnctdxDbaeanCI2Q4+eXvuCL6MxfPTtJ79B/9mRSwFDZjiOelMSJRTJldZEkPwQh
	9Y5sREPX2CYZdyFUp0cx8qvoUVPjSItZTl1fLzc1GwBk+85XppR3rmp3MrjflyIvMUpWWu8I7kC
	onJBeA+jE5pVXQBIqb5r/mVoXFOMbNd22L5x2JlB+ZSpql1jYFf0FvdyIz5fIdE8RK3gCIYeHc0
	TkR17WZ46/TjD4aeSHgFjTO9SXQA6A/98ZFKFmdLhGXIhkbhZXCcGPk42Qyta/te5ZVAUVsRWYD
	X4w7TDd5SjOIrFdDs5qGPJ3RWvPOibUQ4pc=
X-Google-Smtp-Source: AGHT+IHErVXLTFExWF8a78k/nmvK92NxYmDPhDm30kBFmil67S1s8/K8qiKS/SzLbmi4aw5A/N3M4w==
X-Received: by 2002:a05:6a20:b1c:b0:1f5:9f42:cfa0 with SMTP id adf61e73a8af0-1f59f42d64emr4908855637.29.1741809181176;
        Wed, 12 Mar 2025 12:53:01 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56093c2f5sm1389955a12.67.2025.03.12.12.53.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:53:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 14/25] grub: patch CVE-2024-45777
Date: Wed, 12 Mar 2025 12:52:22 -0700
Message-ID: <bfebaeb1705d072eb6b42a6dfe9bff4829a49a33.1741808973.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741808973.git.steve@sakoman.com>
References: <cover.1741808973.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:53:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212681

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
index 581855eb4b..b67b7d2e16 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -30,6 +30,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2025-0622-02.patch \
            file://CVE-2025-0622-03.patch \
            file://CVE-2024-45776.patch \
+           file://CVE-2024-45777.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
-- 
2.43.0


