Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3039FC35FF2
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:53:07 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.4468.1741809183411162366
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:53:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=C9bl20ps;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ff69365e1dso447182a91.3
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809183; x=1742413983; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QLRpJ8PMmpuIhK1x03WAtvUwxD83soOYsme51nHzPM4=;
        b=C9bl20pseMzOTY96kZqEMSqdgFSBpenAicdKBxAK5Puhcy0vydZJNgf4y5YdSA1E59
         jjVLUQZTLZhXcl77tgWgXQN1RxL+F0uzG47UJD2D6V0xyn+JcrKtvjsPsjGorI2E3tgP
         jBn3hkVjVwEbC18lK5u0bGvCVEfJQ4HhOhiL0MgP/tvpgkEn/D5rOQBj89MtT+k5CAbu
         GufclHVeCdewCzvtANatMry9BnQykxPEDMl/fN/Cabd+DCMlYI4yBjKgSXzN7yKTwal7
         A7R+caExa7iLR0NfYteC2fBn40XGwAqAPT1EqpBFT32q795d8slxtgDN9tf6ufhdW6pH
         q1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809183; x=1742413983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QLRpJ8PMmpuIhK1x03WAtvUwxD83soOYsme51nHzPM4=;
        b=BW5nzpHk5yxFihkyFbbju9dXRNYyme1U4e4JHsQ2YGHZO1miaqAPhiiwBtY5YsMxbq
         ieqhNR9ZKsEQ7sTXWSy3UF12r5ppZFZTyc/dCSRVKagNGov/uG9+sf6iNNUW7ZFfEAPJ
         A2lFRu92osDHdKXYxzelnNYflUUmfXeWtmQFSdS0vObH3v/OvZHSM155/YiRzrHpINDI
         XpEQxu+33ud5KrszYMC1vO96EVrDUI8YqIl6/zkC47AiNmVOaY0+01LlVfgAxp4ncEM5
         lRbMIxxzOcfjqDItAsliVDqHSnu1dG6LmdkQGFvEwFSj5pPsx+PWW7vGBfkoRPPbiVKU
         HiGQ==
X-Gm-Message-State: AOJu0YyuBCW8jGTQfRpzOgkmtr06xjS/NsJ074XqaiUX6dIwLqjcHuAJ
	xNUPrUTbJwu9SmZspovdhlQpzrXBGSB+NyLbs/yUK4YLr3a5gQogJahTY3HGbMZdxVEMlm4+yex
	f
X-Gm-Gg: ASbGncs1Dk43JIMHS3HQVdETm/QzYCfrmmJIUjhhNI0Zg1963txhpY5rZYR7Fj0Mw+4
	e+g1VtPVArGCXMri+5ranuwm04U2RrN53MLKERPgM4yFWt2j0JZ2bcaNHLAMJelyMJxAeUOJ/iD
	ZlASZ73fwdv4I9dj/N8W/Rc7SDaZZJpE1b7L+IH8qAgR5GP02XMVdmauVNpCtHweuyAzrICTLun
	grDuza5TFLFGCkXF/1y5x5naqA9lnUJlnNjySrid1Z3HZeA7SjfZBvvHbIhmFNkr33Nbp8tR3bA
	E49H6/uyVOUfb6Jdc01ms+PPpTKk/9GUSMU=
X-Google-Smtp-Source: AGHT+IG8s0gApqL0tg5vfqCuknmL5m3KMiOLa7Q2XkJPvBEsmIKiBD4GWNpGcBWgG3ffFUcggzMHAw==
X-Received: by 2002:a05:6a20:d805:b0:1f5:8622:5ecd with SMTP id adf61e73a8af0-1f5862260c1mr20146481637.32.1741809182598;
        Wed, 12 Mar 2025 12:53:02 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56093c2f5sm1389955a12.67.2025.03.12.12.53.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:53:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 15/25] grub: patch CVE-2025-0690
Date: Wed, 12 Mar 2025 12:52:23 -0700
Message-ID: <ab56d0eb79b40f5e60af20dadcda1b0239fe020e.1741808973.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741808973.git.steve@sakoman.com>
References: <cover.1741808973.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:53:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212682

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
index b67b7d2e16..6f0c8a133f 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -31,6 +31,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2025-0622-03.patch \
            file://CVE-2024-45776.patch \
            file://CVE-2024-45777.patch \
+           file://CVE-2025-0690.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
-- 
2.43.0


