Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 267AEC71135
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 05:45:38 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.3310.1749793532706482583
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 22:45:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=TNfa1PHT;
 spf=pass (domain: mvista.com, ip: 209.85.210.182, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-74865da80c4so1138338b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 22:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1749793532; x=1750398332; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zG/++mNqO3nnIIV/JGN2rSX9p7RAXfTZC4WUGqNwFwA=;
        b=TNfa1PHTS0L9eOrdHSlV/IplkjtOaleTHpTV7jK2kt3iFZ9cu9jVNWfNX1GgsJ9GWC
         bLTr9SSFpZ2/XoIWCxdDAL9hHGlIilJrv2DxvidFbbp1r2/aTwMx/nn2/b+4uEn3hJPf
         8UWvHF1VybpZJFPl44sayH1PcZ5rF3BObhvrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749793532; x=1750398332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zG/++mNqO3nnIIV/JGN2rSX9p7RAXfTZC4WUGqNwFwA=;
        b=GELKKujXnzD6AMllHKh8m5I6uD0tzUXvu/UWVas1oArvYPjCeIxdRUKiKgJiyoAHCS
         Q1LaxnAmJeA4bjPj7olTMCbXgSmS+iNohPPTrqE4jWZgqkDSEEMrnOBbp1MF0qcGvgZ5
         XNkpl4CQOBdCEXWPPDypXxO3Zokw91Zp2z8wufl0vOrO2uA1Ndp5zqFvJMev3jwIt+4c
         Uy0xj4ZLQ7OrBn0RZygCxpli3yHtSBivdiCQMu4OoYFmUvsfHE0SCgcC0Nyd/5Z0BFva
         5cXOiJbb8g4hzHBrmlwRuPgOs6aYDCofkINgh3yu8+jXM5+gkkg577ydZjqUUlwOGwAG
         mjyA==
X-Gm-Message-State: AOJu0YwHng8rmV9QEUogB24QwxIGfxmijaHhhxsLBLvgWIaqRi/Hfgnn
	92F5qIZSW0eC0QrUhiW1ymu5gi5iSBXh8kaII92IF3WRO6GDBRImsIEeUYEx7rprbqmMzd6IvtV
	yP5kP
X-Gm-Gg: ASbGncsYi8WfUnxruHae6Tn4OD6M8Ixet/3wbN3JUHW2tvUi+cCZ+Wz/N6WAUxzpdyW
	aLepGSM6kz4kgPg71zVJUKwe32Dm1U8oLDxEuWHEpT9FTfkw+oOnOtXFocAUC+6LT+N5+5HoKpi
	qKwgY/i9Y2dy6Qro4Eq9MSmZ4ZuvOEj/Nh7BaeQ/MuV1GykV3Z9IgCLZOU9RTIufXpO2MCGWxg7
	uAHt5yomB+HTWXEkm2kZcLWzmH9OtKjWjChOzesIiFOYQnU6S5byODlirABFL0/h+hGY3cL/vpY
	bhZLM/jOdaapRKxpT20A2SlEv0pIVLggMsy4iFH/DP5Ound18KIq8klhyEBV9TXRboNpyMJO
X-Google-Smtp-Source: AGHT+IGovTJozzU2geslKbrr4TI6bgUqjq9FxYYCzViIyrFPjG4tfv3VwGicRKicPDxXPbD0Ix628A==
X-Received: by 2002:a05:6a00:1746:b0:740:9abe:4d94 with SMTP id d2e1a72fcca58-7488f803098mr2562903b3a.21.1749793531612;
        Thu, 12 Jun 2025 22:45:31 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.197.22])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900ad24csm764910b3a.109.2025.06.12.22.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 22:45:31 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 7/9] libsoup-2.4: Fix CVE-2025-32053
Date: Fri, 13 Jun 2025 11:14:52 +0530
Message-Id: <20250613054454.112590-7-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250613054454.112590-1-vanusuri@mvista.com>
References: <20250613054454.112590-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 05:45:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218582

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.gnome.org/GNOME/libsoup/-/commit/eaed42ca8d40cd9ab63764e3d63641180505f40a]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libsoup/libsoup-2.4/CVE-2025-32053.patch  | 38 +++++++++++++++++++
 .../libsoup/libsoup-2.4_2.74.2.bb             |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch

diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch
new file mode 100644
index 0000000000..139e8936a0
--- /dev/null
+++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-32053.patch
@@ -0,0 +1,38 @@
+From eaed42ca8d40cd9ab63764e3d63641180505f40a Mon Sep 17 00:00:00 2001
+From: Ar Jun <pkillarjun@protonmail.com>
+Date: Mon, 18 Nov 2024 14:59:51 -0600
+Subject: [PATCH] Fix heap buffer overflow in
+ soup-content-sniffer.c:sniff_feed_or_html()
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/commit/eaed42ca8d40cd9ab63764e3d63641180505f40a]
+CVE: CVE-2025-32053
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ libsoup/content-sniffer/soup-content-sniffer.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libsoup/content-sniffer/soup-content-sniffer.c b/libsoup/content-sniffer/soup-content-sniffer.c
+index b62e4888..5a181ff1 100644
+--- a/libsoup/soup-content-sniffer.c
++++ b/libsoup/soup-content-sniffer.c
+@@ -641,7 +641,7 @@ skip_insignificant_space (const char *resource, int *pos, int resource_length)
+ 	       (resource[*pos] == '\x0D')) {
+ 		*pos = *pos + 1;
+ 
+-		if (*pos > resource_length)
++		if (*pos >= resource_length)
+ 			return TRUE;
+ 	}
+ 
+@@ -704,7 +704,7 @@ sniff_feed_or_html (SoupContentSniffer *sniffer, GBytes *buffer)
+ 		do {
+ 			pos++;
+ 
+-			if (pos > resource_length)
++			if ((pos + 1) > resource_length)
+ 				goto text_html;
+ 		} while (resource[pos] != '>');
+ 
+-- 
+GitLab
+
diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
index f9358773e4..61ebebeacd 100644
--- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
+++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.2.bb
@@ -36,6 +36,7 @@ SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
            file://CVE-2025-2784-2.patch \
            file://CVE-2025-32050.patch \
            file://CVE-2025-32052.patch \
+           file://CVE-2025-32053.patch \
           "
 SRC_URI[sha256sum] = "f0a427656e5fe19e1df71c107e88dfa1b2e673c25c547b7823b6018b40d01159"
 
-- 
2.25.1


