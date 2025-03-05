Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DACDBC28B24
	for <webhook@archiver.kernel.org>; Wed,  5 Mar 2025 15:59:14 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.16567.1741190354200242147
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Mar 2025 07:59:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=K0N/59Kv;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-223f4c06e9fso16592675ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 07:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741190353; x=1741795153; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aKD92fB3Cs8Abur7hwa4BRzlqJMoIffaKIKGxwKQlAU=;
        b=K0N/59KvtD2ePMiMDNyMOcAQvf+kfSSCV/Ej4+dHoN7O2yYoXi9ECeeI0dT5wkkLwO
         AjEzVwuBWzqVZUoGAxZ1ZmFu4DN+GaCK4ze7w4IyraVrh6NlJbWI3vwcM/T65cVK3aqW
         3N2om/Yx698McOoQECKEvA16nUfy3o5mjPawSZIHzyJnBJSJgecnetdxeopO1K1jcpYy
         VT7kMzjLrxc9Tv7xbPDUyo60mTS5MdDDa8uDDsy0klB2bH6ekqoDpeAsqo3jan+IA+RP
         gaUVBPzYEi/Puhoy/MIs1Y+MggQLGMXYD1BID+5V0ElDIXZk22oFIPtWoLVCa3k1D3tA
         imUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741190353; x=1741795153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aKD92fB3Cs8Abur7hwa4BRzlqJMoIffaKIKGxwKQlAU=;
        b=szGQ10wfhsg6FHWbjQ7rQ+oilHeMzIVX7r92uWFPFT3GM8KTRoomGeaQSfRoJfbpax
         qA3z8Ks//xQyW6hY4KQ+J2Q3PpJpsprxd2WMKHpU780ie5FLCSg9MSN0Kcx12O1Akz8R
         XBIahmF05LzSWRmoKYlMSfdcNH7Hg5YQxqC+AVyctbv1UVFxZNSRAJd0lFU5mSF3yaG5
         sgS/jXg6xHCKnOo0ppTkzQypWWcvrlChKs9ZWVde2mgMXs0rRna/GNnMMw/Tap/it16E
         SIzjim4cRRPZQUkwzTfp7vyqIMgRXJYerWokahxq7ItXlBRIJ39YfkXWMPPUJR5cTq0F
         KgEw==
X-Gm-Message-State: AOJu0Yya10t+4QHFTDqtApi2fezTQ/MUPqm+uZRxkt7/JRt9mfSV+JlD
	G8eoWre1n1HSjEtf+8zahbpAlPJy46ePEokjLKjVu7Y7u5llQKHJMiAFy8+pnY9xvWh9D+gPsiz
	b
X-Gm-Gg: ASbGncuY0bq7DcV20qN6p2b1unQ0yE41cHomUIPJw88++z6dpp97Gzxfrh2qb5NgMOL
	ph55BSGj4wMcY8pBUVIWqCykPLXhXngOf8fgHvb6RllhHE/qHoBdjVhkrMM791fKMYAs/cQ5B8t
	5OqV1+kbTM9mYdaJzL9cHeA7j01sODqCcDWVPHdef5BMNikYL5sw6sTA2+1WCqZe7rdka9BFE76
	IVxAU8gxbpCCtsm7FU58XGj/cd7iQA6qce1mAMQA9QkFvvYzt8faQphzzBFVRc4RqFTEux643LQ
	HbLvxE3H7SxyuBorrGAwQWd9o6ARwrs3oxE=
X-Google-Smtp-Source: AGHT+IEU/G1AM5SwemQRH/MSYdOQNDZCsPSbYVQyOJNaQTIiGZ/vaFIyFzvGm1toU/9xjrdqOLT9hw==
X-Received: by 2002:a17:903:188:b0:221:751f:cfbe with SMTP id d9443c01a7336-223f1de4c76mr62471915ad.19.1741190352830;
        Wed, 05 Mar 2025 07:59:12 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:2308:d28:2350:a5eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501f97bfsm115411025ad.85.2025.03.05.07.59.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 07:59:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/16] xwayland: Fix CVE-2025-26597
Date: Wed,  5 Mar 2025 07:58:40 -0800
Message-ID: <a7f4c6b1946e7215d8df561340d7a1cd0b2d5c27.1741190221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741190221.git.steve@sakoman.com>
References: <cover.1741190221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Mar 2025 15:59:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212333

From: Vijay Anusuri <vanusuri@mvista.com>

Patch copied from xserver-xorg recipe.
CVE reported for both and patch apply on both.

Upstream-Commit: https://gitlab.freedesktop.org/xorg/xserver/-/commit/0e4ed949

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xwayland/xwayland/CVE-2025-26597.patch    | 46 +++++++++++++++++++
 .../xwayland/xwayland_22.1.8.bb               |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-26597.patch

diff --git a/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26597.patch b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26597.patch
new file mode 100644
index 0000000000..b0735d0b46
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland/CVE-2025-26597.patch
@@ -0,0 +1,46 @@
+From 0e4ed94952b255c04fe910f6a1d9c852878dcd64 Mon Sep 17 00:00:00 2001
+From: Olivier Fourdan <ofourdan@redhat.com>
+Date: Thu, 28 Nov 2024 14:09:04 +0100
+Subject: [PATCH] xkb: Fix buffer overflow in XkbChangeTypesOfKey()
+
+If XkbChangeTypesOfKey() is called with nGroups == 0, it will resize the
+key syms to 0 but leave the key actions unchanged.
+
+If later, the same function is called with a non-zero value for nGroups,
+this will cause a buffer overflow because the key actions are of the wrong
+size.
+
+To avoid the issue, make sure to resize both the key syms and key actions
+when nGroups is 0.
+
+CVE-2025-26597, ZDI-CAN-25683
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+Signed-off-by: Olivier Fourdan <ofourdan@redhat.com>
+Reviewed-by: Peter Hutterer <peter.hutterer@who-t.net>
+Part-of: <https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/1828>
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/0e4ed949]
+CVE: CVE-2025-26597
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ xkb/XKBMisc.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/xkb/XKBMisc.c b/xkb/XKBMisc.c
+index abbfed90eb..fd180fad2c 100644
+--- a/xkb/XKBMisc.c
++++ b/xkb/XKBMisc.c
+@@ -553,6 +553,7 @@ XkbChangeTypesOfKey(XkbDescPtr xkb,
+         i = XkbSetNumGroups(i, 0);
+         xkb->map->key_sym_map[key].group_info = i;
+         XkbResizeKeySyms(xkb, key, 0);
++        XkbResizeKeyActions(xkb, key, 0);
+         return Success;
+     }
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
index 18fe2dbc98..0303e39de4 100644
--- a/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_22.1.8.bb
@@ -33,6 +33,7 @@ SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz \
            file://CVE-2025-26594-2.patch \
            file://CVE-2025-26595.patch \
            file://CVE-2025-26596.patch \
+           file://CVE-2025-26597.patch \
 "
 SRC_URI[sha256sum] = "d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73"
 
-- 
2.43.0


