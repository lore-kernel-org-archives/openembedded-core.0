Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91771C35FF1
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:56:27 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.4561.1741809381904640800
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:56:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=JxtYgTnS;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22401f4d35aso4633845ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809381; x=1742414181; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=01BfnFctnzUzL7xhjNoXRVdzWijj1LaOv/5VT1VEaRU=;
        b=JxtYgTnSMnJZs3c+iGH57undmVQCcK/QDUcLIMko8E+Jp2B4ZhjcQQALsXvUozRoUH
         A8bjWlDL2SBVod7EsvZM0geeNPEb2M1YYOzGwkau5Hn5t7iJq2Xn6q2HZwee8pEBeN+3
         uqNf9mLqCHO3fYErhS9wd4LWWY8lEPe9bxYzNmDN75QBVzusU0ZrNHZHlR28w1/7zGsU
         Os7hLCH/xxUxVCHvu6ot/s/LYt1YqCyIU+s76lQVrUo+i/piKAvazeGpZviZOZoPq2jJ
         2Y94TZ2ZW+9HIqOj/DTeZwMkujldXs/WrNH86LAiXbSoTDQarwvTZhTgIQPEizAhsTiS
         8XbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809381; x=1742414181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=01BfnFctnzUzL7xhjNoXRVdzWijj1LaOv/5VT1VEaRU=;
        b=Y2vcrAzgFsHvzXZObqjsxgzG+MS9NV/6jzYa/4KZWAiuXx+E8KnCYYT5KE8LTrHVrp
         ulSlpJ63TyQ8P87QmLHv2zRhbxEuo4YI6OD+hMuXB3FuU7pmO8sz8WOTW38jvsup84vH
         ax6idoC1ZGgQQZh/E1+rT55b+/04AQmHCU4YLRJY+qX0FFYLMP1MmZc4A/CZYWSMYc/D
         SYVfwjwoK9oNoGxv2n/G05pU7S7/kdlNFFbWNP/4euqQU4Hb3zpCBwRbM0y3Yc6GrZUE
         ZJvwpnL5LBwl/U+1JaArLd7LsHR3ZR5SXoVVXd7fvcU6eyTgqbNX7os9MOGi60c0NQKQ
         /WFg==
X-Gm-Message-State: AOJu0Yw7arb5xR4u94gvtpXVz3mx91WW7cjg0wrvkLrlehRXfrKW/6qS
	WRTRXZddtb9uotrWsPXHbSz+R5OhjHhXNZW+ed2pSIetODyZDITSOVvBG3/CI6Zry6NI9TknGM0
	/
X-Gm-Gg: ASbGncubAD9qDPHvFAINRDisHnQTWE/Urb6Z75iLhzNp9h6mTnhDMCokuGMXyUHK7tP
	JLuyDDFfSnG6nlyVc3gvuvf3mVtlCCoIAf4955zCMCq86195VAdC0V6Q50X/6gY1BHrDXfeRM+w
	ucYvExzzkU7/spHpcyU6ocwMFj2/ccjKQHfsAEMVj0ulouGE05kqywf8tTQCRhwH4WB0k6cixl5
	cTl+MXMNndBVNAO6aW7MHebjOR12pZRdTLEhAY8LXOS0HCZAVUABpnLUWxOH1tqPprWLmnkyCSc
	oatDwrSD7OZqd31IDE8l69+HVn5dNq7CDa8=
X-Google-Smtp-Source: AGHT+IGpHVTxRXHwcCDSE2HcYLdKoKWwvEWIfc03Zl8t604fInwQBErlxFbz0fhP7Vn1MkyT5dh0cA==
X-Received: by 2002:a05:6a20:ce4b:b0:1ee:e96a:d9ed with SMTP id adf61e73a8af0-1f58cad4a5dmr14187775637.7.1741809379744;
        Wed, 12 Mar 2025 12:56:19 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281287c10sm9830332a12.78.2025.03.12.12.56.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:56:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/28] grub: patch CVE-2024-45776
Date: Wed, 12 Mar 2025 12:55:36 -0700
Message-ID: <e1e13086f38b021a8aabfe8d044b5755d62ee846.1741809252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741809252.git.steve@sakoman.com>
References: <cover.1741809252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:56:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212709

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick patch mentioning this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../grub/files/CVE-2024-45776.patch           | 39 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45776.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45776.patch b/meta/recipes-bsp/grub/files/CVE-2024-45776.patch
new file mode 100644
index 0000000000..8deea958b8
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2024-45776.patch
@@ -0,0 +1,39 @@
+From 09bd6eb58b0f71ec273916070fa1e2de16897a91 Mon Sep 17 00:00:00 2001
+From: Lidong Chen <lidong.chen@oracle.com>
+Date: Fri, 22 Nov 2024 06:27:56 +0000
+Subject: [PATCH] gettext: Integer overflow leads to heap OOB write or read
+
+Calculation of ctx->grub_gettext_msg_list size in grub_mofile_open() may
+overflow leading to subsequent OOB write or read. This patch fixes the
+issue by replacing grub_zalloc() and explicit multiplication with
+grub_calloc() which does the same thing in safe manner.
+
+Fixes: CVE-2024-45776
+
+Reported-by: Nils Langius <nils@langius.de>
+Signed-off-by: Lidong Chen <lidong.chen@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+Reviewed-by: Alec Brown <alec.r.brown@oracle.com>
+
+CVE: CVE-2024-45776
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=09bd6eb58b0f71ec273916070fa1e2de16897a91]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/gettext/gettext.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/grub-core/gettext/gettext.c b/grub-core/gettext/gettext.c
+index e4f4f8ee6..63bb1ab73 100644
+--- a/grub-core/gettext/gettext.c
++++ b/grub-core/gettext/gettext.c
+@@ -323,8 +323,8 @@ grub_mofile_open (struct grub_gettext_context *ctx,
+   for (ctx->grub_gettext_max_log = 0; ctx->grub_gettext_max >> ctx->grub_gettext_max_log;
+        ctx->grub_gettext_max_log++);
+ 
+-  ctx->grub_gettext_msg_list = grub_zalloc (ctx->grub_gettext_max
+-					    * sizeof (ctx->grub_gettext_msg_list[0]));
++  ctx->grub_gettext_msg_list = grub_calloc (ctx->grub_gettext_max,
++					    sizeof (ctx->grub_gettext_msg_list[0]));
+   if (!ctx->grub_gettext_msg_list)
+     {
+       grub_file_close (fd);
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 3c8860948c..e4dca6613c 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -30,6 +30,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2025-0622-01.patch \
            file://CVE-2025-0622-02.patch \
            file://CVE-2025-0622-03.patch \
+           file://CVE-2024-45776.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
-- 
2.43.0


