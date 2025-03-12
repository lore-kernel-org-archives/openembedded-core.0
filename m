Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA709C35FF3
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:56:27 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.4564.1741809384959341163
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:56:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=cZbrMrpo;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ff6a98c638so651773a91.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809384; x=1742414184; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UfeTsJ5mdzgTAnl7ddV+3ek1P6VCIp6nUgxzCWtjUW8=;
        b=cZbrMrpoI9JrJ+i/sYiNY+9zqzILht7E51PDGbcLVgxbFndRv+/8JdfPgiK8YFrO0g
         LfN3nlGK+g0tNCJQM8F7MeEDhBgY9ivNTNBsvmtoSZ8rZrjUqiZ5gPFIA6+8IbMvWUcU
         D3WzgQRcVMbdoB8f/OIdNz76OtNR4HPSS1ztZRVA2uXrv3KSExa/38c1X2veIfbvzwNm
         EerB9Qny0W7rg9nqd5qQ/FhoIDanJSXsp0LZSpvxmKVMmxElplLb7RzbrEC5Ju6Y2IMr
         MYiVz9T2rVa/x5nl+QfRmhyK2HQGJ2Xo4ehvfxcZTtBWMWKkuYlcXwUK2VfHhYab4Fe+
         uRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809384; x=1742414184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UfeTsJ5mdzgTAnl7ddV+3ek1P6VCIp6nUgxzCWtjUW8=;
        b=s/ejXeB3wu3oigwSWDx+QOjTnmVhPBDtFQn/7LnycVlhOLv+594NVQ3xhxsFs2lsvE
         09+Y5IDGfCu/quhHIrH5ngTNZu3v/pnkTzzeGa9iO6x6qH35SSLo1Hy4hKK5RjUmQDhj
         6/evge5wNU8Pm6urs3yRF2T3BU/UE9YCY1MsN08Zr/l8RukTgpcE/SpZarwi9WbOK9QZ
         g7b4ThZUxUQOjdxDbTv1k91N0mDJ0jx/bL6ym5el97M8vKCHRzVZJOh0LG9iJCOVg8su
         k/jGQm9/AU5fdURUubMsKMVioSnWMQMvOljiLFcwWlCxnJ4vomjWu1eYi6fIa1tJZ1QB
         VF2g==
X-Gm-Message-State: AOJu0YzzuKwpRd794UUuqYmbWc6TEDYCH5He/U8VAY15U7SDsUuYSSh7
	bHwg+mPRiznESbyvMIMlrAWSC8kiV9YlXO8R41742PDz/4E7C3VbWRPyClZPi2FX4pDC8A0oo1Q
	K
X-Gm-Gg: ASbGncu4TVeDtre8LkIla3ebjw2OC35YgOpV9J0LV7s8DBXFwjwuSze+ogzWAKPi6aU
	M4HbDmspeFGo2E6rA6i0Z35pWbIfZxPSn3rnSw9CXEZFYfMF0oFic67P//QmIFPRsJus/WZCLnw
	GI+t7fY5kOdCBx7ME2HzTbi8y9nrqLkJ/hlezg2jnsz0s02OHHuo5ThjdWFuq3Bmq02TZqVzjJd
	q/cL8zvbaQYLX2apgMr3FlRDaUkoYp6SkqufCiKBwtkQ2HtVn9VmwbaIcKmNeSwB9J7Sx5JcuXP
	ZzHKqlz4eLsixAhQufW9Fde7A3thKpj3Awo=
X-Google-Smtp-Source: AGHT+IFZVM2TAllvu+tgTM286NisU8fUJdRcrRuBWcvRqcwxvzZuGwi3IXT2OElk8b/+XCAqwQknTA==
X-Received: by 2002:a05:6a20:9c92:b0:1f5:92ac:d6b7 with SMTP id adf61e73a8af0-1f592acd7fcmr10490720637.4.1741809384256;
        Wed, 12 Mar 2025 12:56:24 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281287c10sm9830332a12.78.2025.03.12.12.56.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:56:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 18/28] grub: patch CVE-2025-1118
Date: Wed, 12 Mar 2025 12:55:39 -0700
Message-ID: <77abb78b5d4dd0e54b656170c03ac68b919b8784.1741809252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741809252.git.steve@sakoman.com>
References: <cover.1741809252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:56:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212712

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick patch mentioning this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../grub/files/CVE-2025-1118.patch            | 37 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2025-1118.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2025-1118.patch b/meta/recipes-bsp/grub/files/CVE-2025-1118.patch
new file mode 100644
index 0000000000..e6906d909c
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2025-1118.patch
@@ -0,0 +1,37 @@
+From 34824806ac6302f91e8cabaa41308eaced25725f Mon Sep 17 00:00:00 2001
+From: B Horn <b@horn.uk>
+Date: Thu, 18 Apr 2024 20:29:39 +0100
+Subject: [PATCH] commands/minicmd: Block the dump command in lockdown mode
+
+The dump enables a user to read memory which should not be possible
+in lockdown mode.
+
+Fixes: CVE-2025-1118
+
+Reported-by: B Horn <b@horn.uk>
+Reported-by: Jonathan Bar Or <jonathanbaror@gmail.com>
+Signed-off-by: B Horn <b@horn.uk>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2025-1118
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=34824806ac6302f91e8cabaa41308eaced25725f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/commands/minicmd.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/grub-core/commands/minicmd.c b/grub-core/commands/minicmd.c
+index 286290866..8c5ee3e60 100644
+--- a/grub-core/commands/minicmd.c
++++ b/grub-core/commands/minicmd.c
+@@ -203,8 +203,8 @@ GRUB_MOD_INIT(minicmd)
+     grub_register_command ("help", grub_mini_cmd_help,
+ 			   0, N_("Show this message."));
+   cmd_dump =
+-    grub_register_command ("dump", grub_mini_cmd_dump,
+-			   N_("ADDR [SIZE]"), N_("Show memory contents."));
++    grub_register_command_lockdown ("dump", grub_mini_cmd_dump,
++				    N_("ADDR [SIZE]"), N_("Show memory contents."));
+   cmd_rmmod =
+     grub_register_command ("rmmod", grub_mini_cmd_rmmod,
+ 			   N_("MODULE"), N_("Remove a module."));
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index af6f434c5f..dbceaf9931 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -33,6 +33,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2024-45776.patch \
            file://CVE-2024-45777.patch \
            file://CVE-2025-0690.patch \
+           file://CVE-2025-1118.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
-- 
2.43.0


