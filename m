Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA4E1C36002
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 21:42:20 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.7376.1742420540412218211
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 14:42:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SsdAqYdz;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-225df540edcso27065095ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 14:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742420540; x=1743025340; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lchY12C6fw6zOc7qhkRVANDmVX3iJo65Gj8INayNgAQ=;
        b=SsdAqYdzacS1c8Rck4cR9UCi/Yr91KOSFDrNwn/LvhAQsXsikJBOQ2mQQec3zUTdMf
         NbGcdWXu+Q04DLXOzHuaD2XXpLHjNvvpyah22e8KaNyNPw496ComGr9DFaLk2ckKWJ4w
         a9ID5c8tkUTOYfqNLpF3w4qbXHPXLpnqveJ4HWSQSzlwj/Uwxl91Zgu0+MVQ+MZedSQw
         KeMdTchWKNwpw7Ti7aaaRb4sK561BHo/1btRafhFiFHX/G//LPCig6E7iX/5Fb+F8e1R
         2W5BSu+mLRquGwUW0qFIj1z+8AbieOIh+nxmoN0EDv3iVhG1h6DaQP+ycbadv2GhXuZm
         +21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742420540; x=1743025340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lchY12C6fw6zOc7qhkRVANDmVX3iJo65Gj8INayNgAQ=;
        b=FuC7d09759v1Yp4r9eeQ6o2mSa0W6FP6QLvW/Yd0OplkR3Z33cKLHj57TUzwK87Vfx
         hHRhYNEP3kKrsPxc3k9acwAYapqmh70QQDKSVFVJA7WAq5gweuNjqa5ROjJn7udV4YuZ
         oS5v7ZdM9HVXXY2N4foEHrGBWLu0W59x2uXTx1x3XqFlh+0Gq3WK3Knn0Rq9gvA/4+kv
         PHhMjvP9Uca6rDDxSaaJuQ+HNd4KJ3pr5MO5dsGSLbQ738fyQTpVmdjWiOtFts0M7Qwa
         lrusvksq4v23ya2fi9KiRnsuWwe5IPlmmAL/f9qwGNTw7lm3N8YawsAIb8Sy/3CtqDu8
         craw==
X-Gm-Message-State: AOJu0Yyddl21AdaR+lrhjeXdeIGtgcPzA1EeP299qfgaNiVkbS7/OIxr
	6aMSF/V/QBVgDkAkgyVW2AF/YiEESiEXhhpi/29XleATD2VBk2K6wS7a5qsc
X-Gm-Gg: ASbGncsBA/MAlqJHxB4VWGN+FO5CCZJiPfEBZWd4QQMcW0Wkqo0k3hfGNECCyePPItg
	B8HdXaeN4vNIGW39/50MmTS1uw3CJUdhKFBvesHBrT45ganNDtLCkK1/SqfuSRNjRyQcFa3A4jo
	n2TF0WVQYWoF4lEp91TdOmyq8eprON/3efmWZW2TmoOHbO9R7XfUrnkPAVJhosLXaMCDXWcs5R2
	Sf2DhxByhZ/ceCRUB983lh0407T8cyfBQ0IDuU/8dufkjcDMyr49xuQtlW8etOc05oH3UyiDop6
	pXf0JXH8vGriVvQCvRQ+QOgur1UceTgT8MR2cqMQQCx1G5g=
X-Google-Smtp-Source: AGHT+IFdLS56EqQTVUo3eEnqL2jTa1r77qWLkvbYmsZXdivRzwlzp+8AfhGI+KGIiPm/9gcggo/pLw==
X-Received: by 2002:a05:6a00:3a07:b0:736:4e14:8ec5 with SMTP id d2e1a72fcca58-7377a12d2d4mr1530515b3a.11.1742420539449;
        Wed, 19 Mar 2025 14:42:19 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73766322e03sm3604964b3a.99.2025.03.19.14.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 14:42:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v4 3/9] ppp: Fix build when shadow is enabled
Date: Wed, 19 Mar 2025 14:42:06 -0700
Message-ID: <20250319214213.2505249-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319214213.2505249-1-raj.khem@gmail.com>
References: <20250319214213.2505249-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 21:42:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213358

GCC-15 patch is not sufficient when shadow is enabled, therefore fix
the remaining issues.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...d-session-Fixed-building-with-GCC-15.patch | 33 +++++++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.5.2.bb    |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/0001-pppd-session-Fixed-building-with-GCC-15.patch

diff --git a/meta/recipes-connectivity/ppp/ppp/0001-pppd-session-Fixed-building-with-GCC-15.patch b/meta/recipes-connectivity/ppp/ppp/0001-pppd-session-Fixed-building-with-GCC-15.patch
new file mode 100644
index 00000000000..d95c72e96ba
--- /dev/null
+++ b/meta/recipes-connectivity/ppp/ppp/0001-pppd-session-Fixed-building-with-GCC-15.patch
@@ -0,0 +1,33 @@
+From 5edcb01f1d8d521c819d45df1f1bb87697252130 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 17 Mar 2025 14:38:26 -0700
+Subject: [PATCH] pppd/session: Fixed building with GCC 15
+
+Fixed building with GCC 15 which defaults to C23
+and find conflicting declration of getspnam() here
+with the one provided by shadow.h (extern struct spwd *getspnam (const char *__name);)
+
+Fixes
+../../ppp-2.5.2/pppd/session.c: In function 'session_start':
+../../ppp-2.5.2/pppd/session.c:185:18: error: conflicting types for 'getspnam'; have 'struct spwd *(void)'
+  185 |     struct spwd *getspnam();
+      |                  ^~~~~~~~
+
+Upstream-Status: Submitted [https://github.com/ppp-project/ppp/pull/553]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pppd/session.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/pppd/session.c b/pppd/session.c
+index f08d8e1..9cc7538 100644
+--- a/pppd/session.c
++++ b/pppd/session.c
+@@ -182,7 +182,6 @@ session_start(const int flags, const char *user, const char *passwd, const char
+     char *cbuf;
+ #ifdef HAVE_SHADOW_H
+     struct spwd *spwd;
+-    struct spwd *getspnam();
+     long now = 0;
+ #endif /* #ifdef HAVE_SHADOW_H */
+ #endif /* #ifdef PPP_WITH_PAM */
diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb b/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
index aed4a9a7700..607678db8bb 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.5.2.bb
@@ -25,6 +25,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
            file://ppp@.service \
            file://0001-pppdump-Fixed-building-with-GCC-15-548.patch \
            file://0001-pppd-pppdconf.h-remove-erroneous-generated-header.patch \
+           file://0001-pppd-session-Fixed-building-with-GCC-15.patch \
            "
 
 SRC_URI[sha256sum] = "47da358de54a10cb10bf6ff2cf9b1c03c0d3555518f6182e8f701b8e55733cb2"

