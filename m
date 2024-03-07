Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDD49C48BF6
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 06:03:37 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.17007.1709791402326390532
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 22:03:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=FvLzUoGQ;
 spf=pass (domain: mvista.com, ip: 209.85.210.170, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6d9f94b9186so520470b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 22:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1709791401; x=1710396201; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IAV/irrqBtT9EvvvxI0c44zWQ25j6e80Ii2uOfEdV+U=;
        b=FvLzUoGQ+F6gEw+p3kJ8jK/B/nXoGB/HA4wMv2pvUfxd+4VR2X9NPacf/Ewegh9xzT
         OM6ws0aRGK0nveNEn7/NIhDgbPsM31YvBQhnYJkNy8Ywje2vTHfguYvJouRpfPCjQ5Jl
         MMrje/OU2FjP/KEOgjik9cQQFK5Ur1LSG1mX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709791401; x=1710396201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IAV/irrqBtT9EvvvxI0c44zWQ25j6e80Ii2uOfEdV+U=;
        b=sNsCBtfCmA++m4bGmS8uZJx4sjOEDQVZ7i85TNUTxgxaLJQLrY+/RCLLIdbiV8cMo4
         K0SCVw8fqb06LxSrIh+VM3ZehsWrj04ysty5E9Lu8zlyfM1mirTmy8Qo+MplltQRWaYk
         n0qsmlr0nVg8d4e1RnJV9UNHi5JsqNIuYtTYHq0Pmv6tT91BgOK+3058uSjd+PnFyZox
         2JlrW7+Gu6q4F65Mms78nG31zgpRQNnJJMjxUPQGzVlJCYJJ0UNv3kfW5ElSzJ64+koc
         O5RwBXfeh9Kqrkrczi4xjSBgwmC7ZY/oC1bLCkVfcCH6q16CQ+h0L9lwYW7ZszPpIhPe
         1cZw==
X-Gm-Message-State: AOJu0YyjUVMBT7DCvO2hgaiIuOwZIz/J/ZxycR3peXGuDLnnn98zHfDr
	a7sJnxLu5wyftTAbpivRy1nRhwFeh7RV43/3vURjVQpPRIZgib1D58U3HxlAp3yOFOR4hgv8tmX
	6
X-Google-Smtp-Source: AGHT+IF0pqYDSKfmjMlCHLtwzsSswts0tlMIY+9YMgJGtKdQTBwTqwnmstTGEZUgHABH70AZvnj08A==
X-Received: by 2002:a05:6a00:929b:b0:6e6:4f67:8440 with SMTP id jw27-20020a056a00929b00b006e64f678440mr3490597pfb.1.1709791400757;
        Wed, 06 Mar 2024 22:03:20 -0800 (PST)
Received: from MVIN00020.mvista.com ([2401:4900:1cb2:fea3:64d7:e2df:84a:6241])
        by smtp.gmail.com with ESMTPSA id x18-20020a056a00271200b006e650049472sm1992751pfv.123.2024.03.06.22.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 22:03:20 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] libxml2: Backport fix for CVE-2024-25062
Date: Thu,  7 Mar 2024 11:33:11 +0530
Message-Id: <20240307060311.10653-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 06:03:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196769

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.gnome.org/GNOME/libxml2/-/commit/31c6ce3b63f8a494ad9e31ca65187a73d8ad3508
&
https://gitlab.gnome.org/GNOME/libxml2/-/commit/2b0aac140d739905c7848a42efc60bfe783a39b7]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../libxml/libxml2/CVE-2024-25062-pre1.patch  | 38 +++++++++++++++++++
 .../libxml/libxml2/CVE-2024-25062.patch       | 33 ++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |  2 +
 3 files changed, 73 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2024-25062-pre1.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2024-25062.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2024-25062-pre1.patch b/meta/recipes-core/libxml/libxml2/CVE-2024-25062-pre1.patch
new file mode 100644
index 0000000000..31183399f8
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2024-25062-pre1.patch
@@ -0,0 +1,38 @@
+From 31c6ce3b63f8a494ad9e31ca65187a73d8ad3508 Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Mon, 9 Nov 2020 17:55:44 +0100
+Subject: [PATCH] Avoid call stack overflow with XML reader and recursive
+ XIncludes
+
+Don't process XIncludes in the result of another inclusion to avoid
+infinite recursion resulting in a call stack overflow.
+
+This is something the XInclude engine shouldn't allow but correct
+handling of intra-document includes would require major changes.
+
+Found by OSS-Fuzz.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/31c6ce3b63f8a494ad9e31ca65187a73d8ad3508]
+CVE: CVE-2024-25062 #Dependency Patch
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ xmlreader.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/xmlreader.c b/xmlreader.c
+index 01adf74f4..72e40b032 100644
+--- a/xmlreader.c
++++ b/xmlreader.c
+@@ -1585,7 +1585,8 @@ node_found:
+     /*
+      * Handle XInclude if asked for
+      */
+-    if ((reader->xinclude) && (reader->node != NULL) &&
++    if ((reader->xinclude) && (reader->in_xinclude == 0) &&
++        (reader->node != NULL) &&
+ 	(reader->node->type == XML_ELEMENT_NODE) &&
+ 	(reader->node->ns != NULL) &&
+ 	((xmlStrEqual(reader->node->ns->href, XINCLUDE_NS)) ||
+-- 
+GitLab
+
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
diff --git a/meta/recipes-core/libxml/libxml2_2.9.10.bb b/meta/recipes-core/libxml/libxml2_2.9.10.bb
index 90d30f1ea7..72f830b6d3 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.10.bb
@@ -44,6 +44,8 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;subdir=${BP};name=te
            file://CVE-2021-3516.patch \
            file://CVE-2023-45322-1.patch \
            file://CVE-2023-45322-2.patch \
+           file://CVE-2024-25062-pre1.patch \
+           file://CVE-2024-25062.patch \
            "
 
 SRC_URI[archive.sha256sum] = "593b7b751dd18c2d6abcd0c4bcb29efc203d0b4373a6df98e3a455ea74ae2813"
-- 
2.25.1


