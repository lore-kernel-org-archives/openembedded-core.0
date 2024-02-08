Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E428C4828F
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 02:51:33 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.9595.1707360683983724750
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Feb 2024 18:51:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=UgV/yetf;
 spf=pass (domain: mvista.com, ip: 209.85.210.169, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e07532ff1aso157532b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Feb 2024 18:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1707360682; x=1707965482; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YzCgCVen+BD8Xil7Nx8iU61tt7HuYHx3pRH0vJWaVRs=;
        b=UgV/yetfW/PqxfT/a9Czv+PgIngPdE70xrU7c1mDaI/yKcMWch7NQCjbyLWz41vLS6
         4K+M9zCXuI6eC7E+0a2eVxS6lzd1Ko+if84O+pYV2wqTb4rfSHtQ39TMLYcdlIz4y7pQ
         nsifZAW5XUFG9KBy01zJephDa1y7BUuKnYS+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707360682; x=1707965482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YzCgCVen+BD8Xil7Nx8iU61tt7HuYHx3pRH0vJWaVRs=;
        b=CHXzRpNrjx3bpDmAPTHqcx1AquvkKNdE9MgJx/lnklyC2PfYSXRVVi80h2P648qdpH
         U3VlPjF50swESeqVswNEPsaLUOCco+Rljb55pbJWNsJNJpo8sW9ZHkoaNTFdzDKjq1J1
         CwjmK61jft5rUfxr8ZG/vh1OP98SKZAbYz0QCp62rhFqKDUO9MBRnqRO8wj0kwAXmOL4
         6IVTdeoiUBC52GuJiBqjRQkJFses5c+M0yM4rRjb4ULOB83FOFtmKAxPOVVfPIFJofun
         IvsNQPemj1LEvgCdxEK6HROqBhlXXjKdD4+/S4nSbdHEBkO4xfTU5+sugwZutMhZl2wZ
         Tg6Q==
X-Gm-Message-State: AOJu0YyaXRd4EOnGzzU9ycxcB8LNljFJgzFbPVbXeyYyoZVvW46tMtnb
	8VFGnLaKatlNm3X5eX1YeiPzqmZkhfSlOfD1mMCqIV2MHuosoDc2iv/gX3PoKXoZcUxdRU64Qmg
	g
X-Google-Smtp-Source: AGHT+IHd7HeFZPGrw2mrnBWLkiWRtYn7ALF2Wt4jQpvNKuArMn6cuLsUAv/ZVw2S8cjm7C/bIF0hpQ==
X-Received: by 2002:a05:6a21:670d:b0:19e:a25e:744a with SMTP id wh13-20020a056a21670d00b0019ea25e744amr5039613pzb.34.1707360682409;
        Wed, 07 Feb 2024 18:51:22 -0800 (PST)
Received: from MVIN00020.mvista.com ([106.212.230.13])
        by smtp.gmail.com with ESMTPSA id st3-20020a17090b1fc300b00296885dcef7sm196269pjb.16.2024.02.07.18.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 18:51:21 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] libxml2: Fix for CVE-2024-25062
Date: Thu,  8 Feb 2024 08:19:11 +0530
Message-Id: <20240208024911.6595-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 02:51:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195097

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/2b0aac140d739905c7848a42efc60bfe783a39b7]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libxml/libxml2/CVE-2024-25062.patch       | 33 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2024-25062.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2024-25062.patch b/meta/recipes-core/libxml/libxml2/CVE-2024-25062.patch
new file mode 100644
index 0000000000..5365d5546a
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2024-25062.patch
@@ -0,0 +1,33 @@
+From 2b0aac140d739905c7848a42efc60bfe783a39b7 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Sat, 14 Oct 2023 22:45:54 +0200
+Subject: [PATCH] [CVE-2024-25062] xmlreader: Don't expand XIncludes when
+ backtracking
+
+Fixes a use-after-free if XML Reader if used with DTD validation and
+XInclude expansion.
+
+Fixes #604.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/2b0aac140d739905c7848a42efc60bfe783a39b7]
+CVE: CVE-2024-25062
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ xmlreader.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/xmlreader.c b/xmlreader.c
+index 979385a13..fefd68e0b 100644
+--- a/xmlreader.c
++++ b/xmlreader.c
+@@ -1443,6 +1443,7 @@ node_found:
+      * Handle XInclude if asked for
+      */
+     if ((reader->xinclude) && (reader->in_xinclude == 0) &&
++        (reader->state != XML_TEXTREADER_BACKTRACK) &&
+         (reader->node != NULL) &&
+ 	(reader->node->type == XML_ELEMENT_NODE) &&
+ 	(reader->node->ns != NULL) &&
+-- 
+GitLab
+
diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
index 533a6dae01..2b7e9999d9 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -31,6 +31,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar;subdir=${BP};name=testt
            file://CVE-2023-39615-0002.patch \
            file://CVE-2023-45322-1.patch \
            file://CVE-2023-45322-2.patch \
+           file://CVE-2024-25062.patch \
            "
 
 SRC_URI[archive.sha256sum] = "60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee"
-- 
2.25.1


