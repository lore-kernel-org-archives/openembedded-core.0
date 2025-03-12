Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A989BC2BA1B
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:56:27 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.4563.1741809383605079613
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:56:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=H6CS6iKl;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-224191d92e4so4663115ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809383; x=1742414183; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qqOaiilGoEFE7Rfbl+anfrPqnTYE6HjeRpWvb9c9JY0=;
        b=H6CS6iKl7xmJCGWq9ubNg//cFzz8EUpb34Txy6Bf8XbxMNh+Ow/U6FGm7a8JMtX0iF
         2LSmpFkTAgDNCVBw5liuKAvykFlE6ElrW2mVrrhb1F3bpUq4UKi+6al+YIGCBdG+gJz/
         87evXPyZBZmQgHuIvVjSQpv5iSy3RIYKyP32PoILB8iPFTKQbitl7cO+VOmC4lBYH7n3
         P1K1AP1UvMCRevGThJDtPhTU2bIEF5RrVfWWsbRb4XPkMJzXhB6JDoCGDY4JTfaiLgwi
         +R20WGGTkjZtVXE3k3Io8BRHDfYc9PhlnTmSDznOZJ/yEol5p9Bv+MuK3beBj/3mouOo
         VH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809383; x=1742414183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qqOaiilGoEFE7Rfbl+anfrPqnTYE6HjeRpWvb9c9JY0=;
        b=L/8P/tjlL7wWwv7WZQ5TUe5Dm4ZSZw3pNCaikyMRa+Cv4qEBD9tZJ4FQ0rLwTgC1Ge
         RAjBoICV2RpBhmrShLm80PNUcvV/YIWHmjwcCZQhm2FL0JPEUKhTST++oClAnuEvIUAy
         VOFCxxNUuPC7IkyFUfnjpFirXZXfrPUaInWTAiZlDQtU1yKWFvQneUrQUkNXed4LXRCb
         6VkAvOQdMvlw4uOrtkqT2+DsGVSZNfEkW1Q2X5EfYos9bQDXNoq2XGB8FlXuL9rqsv4G
         e7x9qtP1H8Hj40S3tC9iUufolM02TW4bGlvfANRK4X2q7NQOnTV1O/vRMGAuP0stH6zR
         F7Ew==
X-Gm-Message-State: AOJu0YyOjGySyZtfskh7K+6DXaeSNtu/T0OyXqNiHASRBr26YLrJVwH4
	5ZyvY4bD7sPoY/o3gt3bVKU1QgH1FYClDXqepdyH7aqWhhaq9Gc6nKoqrUqbkVrBpZbOypCxh+e
	F
X-Gm-Gg: ASbGncvPCvoMXAM8bhD8vUU6+egUiTskQIiC26G9hFovKwGLr6VUHWknRSRPNgxiMfh
	4yKXzoAgum7+nh9fX6rFA6tB7zoXY/xZ/GFA6wVWetuV9X1EcQYPFNRSPkJu/d1DNrK4TPooGt0
	OOeluS/w3trcTAWU7mkVe5oc6pbHop84p4HL7FuBK5PzvX/MVOY9+YM1W7jC1E+I1ho/dcD6ExB
	5sxvx/wu/Cc9gGAXsVYAmMMt7eYSCMQEgzw7xJKWrK0SlqXr5is9EPOTS5kwuXDEmQHkKWHx6Qn
	Fs04aHs8tuUkZPPkNBrmjQIONCbqEpnfHVA=
X-Google-Smtp-Source: AGHT+IGNDl+8wROx01l2De/pevBgokN5tTaZTyIe/4CGB0dqujSRWxGO+6qqxDfS5Ky8uZ9/WBrh1w==
X-Received: by 2002:a05:6a21:6011:b0:1f5:8714:8147 with SMTP id adf61e73a8af0-1f587149dbemr16938009637.23.1741809382843;
        Wed, 12 Mar 2025 12:56:22 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281287c10sm9830332a12.78.2025.03.12.12.56.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:56:22 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/28] grub: patch CVE-2025-0690
Date: Wed, 12 Mar 2025 12:55:38 -0700
Message-ID: <d9fb00f71380ad39ea5b61e60c4f458371460862.1741809252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741809252.git.steve@sakoman.com>
References: <cover.1741809252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:56:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212711

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick patch mentioning this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../grub/files/CVE-2025-0690.patch            | 73 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-0690.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2025-0690.patch b/meta/recipes-bsp/grub/files/CVE-2025-0690.patch
new file mode 100644
index 0000000000..be585c96ad
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-0690.patch
@@ -0,0 +1,73 @@
+From dad8f502974ed9ad0a70ae6820d17b4b142558fc Mon Sep 17 00:00:00 2001
+From: Jonathan Bar Or <jonathanbaror@gmail.com>
+Date: Thu, 23 Jan 2025 19:17:05 +0100
+Subject: [PATCH] commands/read: Fix an integer overflow when supplying more
+ than 2^31 characters
+
+The grub_getline() function currently has a signed integer variable "i"
+that can be overflown when user supplies more than 2^31 characters.
+It results in a memory corruption of the allocated line buffer as well
+as supplying large negative values to grub_realloc().
+
+Fixes: CVE-2025-0690
+
+Reported-by: Jonathan Bar Or <jonathanbaror@gmail.com>
+Signed-off-by: Jonathan Bar Or <jonathanbaror@gmail.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2025-0690
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=dad8f502974ed9ad0a70ae6820d17b4b142558fc]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/commands/read.c | 19 +++++++++++++++----
+ 1 file changed, 15 insertions(+), 4 deletions(-)
+
+diff --git a/grub-core/commands/read.c b/grub-core/commands/read.c
+index 597c90706..8d72e45c9 100644
+--- a/grub-core/commands/read.c
++++ b/grub-core/commands/read.c
+@@ -25,6 +25,7 @@
+ #include <grub/types.h>
+ #include <grub/extcmd.h>
+ #include <grub/i18n.h>
++#include <grub/safemath.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -37,13 +38,14 @@ static const struct grub_arg_option options[] =
+ static char *
+ grub_getline (int silent)
+ {
+-  int i;
++  grub_size_t i;
+   char *line;
+   char *tmp;
+   int c;
++  grub_size_t alloc_size;
+ 
+   i = 0;
+-  line = grub_malloc (1 + i + sizeof('\0'));
++  line = grub_malloc (1 + sizeof('\0'));
+   if (! line)
+     return NULL;
+ 
+@@ -59,8 +61,17 @@ grub_getline (int silent)
+       line[i] = (char) c;
+       if (!silent)
+ 	grub_printf ("%c", c);
+-      i++;
+-      tmp = grub_realloc (line, 1 + i + sizeof('\0'));
++      if (grub_add (i, 1, &i))
++        {
++          grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is detected"));
++          return NULL;
++        }
++      if (grub_add (i, 1 + sizeof('\0'), &alloc_size))
++        {
++          grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is detected"));
++          return NULL;
++        }
++      tmp = grub_realloc (line, alloc_size);
+       if (! tmp)
+ 	{
+ 	  grub_free (line);
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index fb33c2bd98..af6f434c5f 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -32,6 +32,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2025-0622-03.patch \
            file://CVE-2024-45776.patch \
            file://CVE-2024-45777.patch \
+           file://CVE-2025-0690.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
-- 
2.43.0


