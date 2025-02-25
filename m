Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40717C021BC
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 14:30:32 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.9097.1740493825078015023
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 06:30:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ItOy9TDT;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2210d92292eso18130235ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 06:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1740493824; x=1741098624; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EsPkF8a8xFelTx09oXlhpEnMvto7tUPlzSGXSlG/7K8=;
        b=ItOy9TDTAYCs1E/+q28wAU+AYRjkq4NO63C4Z4VYiabyEeKZgV1/nfVJRXXccgwlST
         +6xBAxE3YEa4WPHl3QJHoi9B6169ms8+v50lgJNMpjZNrnqn/54up4VdCbCLTQuUY4YQ
         5efDyMvbFVMGgZAYx3W2Ru6VRe0rMLNHg6djjj7UfoNX6iRC1Zmewwnu4lPU9Ib6Ddn4
         Q0/zAABbEhPqgPCU6KaAEG8zNQjH6wrbDTvZFZsOQ9fblnYIwmamEjNc0pZzhTQY0LWR
         bOhKAmNen6k3ED6pysOhtLk+sVaLdXP3s0A90F15Qlo0dH2NTo2+QT5QQEdlVtyj9vQb
         G5wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740493824; x=1741098624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EsPkF8a8xFelTx09oXlhpEnMvto7tUPlzSGXSlG/7K8=;
        b=L6NhHz6ByHMeXG6a2P6uVfD2QoVZq/NDKNDvb61MjtHaD+qXc8R8bztDgJ6vQnkkzp
         k0/L66dxDzhXSfygcu0FY5Xb787gvp4Q8EQ4pWxfc34rG3TA1HP9TTmfp36GWsxmS4eM
         Co5PFhxtB5qUlqHhAPkwY+X4BWbvRkbzPC1FQ/juysSTDHP47KJVWJlJLNOiFM9RpGDn
         mDB4bcy56s3p4vmFlyT7w2uLhBOaeIGYyNh+vGBqESXeXBK71W0sZt8skWBChJrEwIvK
         nmHWyCjr+sa0faRz29tPeUktNhf7jNczhd49LUp3b9BPISpg9jqVkAfGNt+mPxP/iHIU
         whZw==
X-Gm-Message-State: AOJu0YxK9WsK7PnHZtC1SdkjMoyVwUBDZ/VxNA2eLDALlip4Nbh1rKHk
	ENsQZtwotBIAm2ZCmnxmomolZ+o76YRaVsiF2PyUmdTQARmlXp8qJ4otsnFDrE2xH1cqFMX/mbS
	m
X-Gm-Gg: ASbGnctJHSlYfdD+dRuqUpHpwrKiN+GYQImsnLmKcXXU5H0xt0uDfEcgEwpeHNcimi0
	TRklM9QbQBms25K3ht1311BY2C49DZxbcfQDS2OUvMlrCCiGAxzqm3qSVvNrkMf6OUxhwaNlF91
	Rd87ZPbicCgKGg9LFktF6MQ+qmlNptOlbpTlmZWv0huWOpikLC1kNULVkF89I5sNxXLv52j0qmM
	EkUGYuIcHOxkRr0PGqqZP0zz7rUYxapJkTxUWdljzc1gOPXSAh7kIrj5Xz/r5hzQPM7AO4ZCGRZ
	FPbpmFUSQd3kQnEzXw==
X-Google-Smtp-Source: AGHT+IGnABjVEL94SUOpLpevBfutLCqYbKwYcAhYqoMH5H3Os2EEBiBsfhZOef480bmJc/rJHtuiZg==
X-Received: by 2002:a05:6a00:982:b0:731:737c:3224 with SMTP id d2e1a72fcca58-73426cab055mr27679469b3a.10.1740493824205;
        Tue, 25 Feb 2025 06:30:24 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:c473:2777:3793:104c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81ed10sm1535650b3a.129.2025.02.25.06.30.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:30:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/22] libxml2: patch CVE-2024-56171
Date: Tue, 25 Feb 2025 06:29:47 -0800
Message-ID: <ab804cd27ecf7ee65a9feea477140502ecbc0d73.1740493685.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740493685.git.steve@sakoman.com>
References: <cover.1740493685.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 14:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211897

From: Peter Marko <peter.marko@siemens.com>

Pick commit from 2.12 branch.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libxml/libxml2/CVE-2024-56171.patch       | 42 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.14.bb    |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2024-56171.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2024-56171.patch b/meta/recipes-core/libxml/libxml2/CVE-2024-56171.patch
new file mode 100644
index 0000000000..6c7b1c11e7
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2024-56171.patch
@@ -0,0 +1,42 @@
+From 245b70d7d2768572ae1b05b3668ca858b9ec4ed4 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Tue, 10 Dec 2024 16:52:05 +0100
+Subject: [PATCH] [CVE-2024-56171] Fix use-after-free after
+ xmlSchemaItemListAdd
+
+xmlSchemaItemListAdd can reallocate the items array. Update local
+variables after adding item in
+
+- xmlSchemaIDCFillNodeTables
+- xmlSchemaBubbleIDCNodeTables
+
+Fixes #828.
+
+CVE: CVE-2024-56171
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/245b70d7d2768572ae1b05b3668ca858b9ec4ed4]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ xmlschemas.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/xmlschemas.c b/xmlschemas.c
+index a089ebc5..18e35e75 100644
+--- a/xmlschemas.c
++++ b/xmlschemas.c
+@@ -23647,6 +23647,7 @@ xmlSchemaIDCFillNodeTables(xmlSchemaValidCtxtPtr vctxt,
+ 			}
+ 			if (xmlSchemaItemListAdd(bind->dupls, bind->nodeTable[j]) == -1)
+ 			    goto internal_error;
++                        dupls = (xmlSchemaPSVIIDCNodePtr *) bind->dupls->items;
+ 			/*
+ 			* Remove the duplicate entry from the IDC node-table.
+ 			*/
+@@ -23863,6 +23864,8 @@ xmlSchemaBubbleIDCNodeTables(xmlSchemaValidCtxtPtr vctxt)
+ 				goto internal_error;
+ 			}
+ 			xmlSchemaItemListAdd(parBind->dupls, parNode);
++		        dupls = (xmlSchemaPSVIIDCNodePtr *)
++                            parBind->dupls->items;
+ 		    } else {
+ 			/*
+ 			* Add the node-table entry (node and key-sequence) of
diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
index 912bcfd0f3..e9578ceb59 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
@@ -35,6 +35,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar;subdir=${BP};name=testt
            file://CVE-2024-34459.patch \
            file://CVE-2022-49043.patch \
            file://0001-pattern-Fix-compilation-of-explicit-child-axis.patch \
+           file://CVE-2024-56171.patch \
            "
 
 SRC_URI[archive.sha256sum] = "60d74a257d1ccec0475e749cba2f21559e48139efba6ff28224357c7c798dfee"
-- 
2.43.0


