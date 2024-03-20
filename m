Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2803C6FD1F
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 16:44:23 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.50463.1710953060492091027
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 09:44:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FIVeRWcg;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6e6adc557b6so98837b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 09:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710953060; x=1711557860; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C5jJx5uk975X4VZREDA0yRed2x3nK2zK02MAB7KPtIM=;
        b=FIVeRWcgeE1lCUpMKDYakWb6v5RUzTea4RyHPZda3ZLzi7w8nKr4OrfGvP075bSAk8
         TMRkzX2H65lc7hvBcWiOg3HY1/YKb858lIw5E6Bs0VuqJAx+KANYcK77byHjR4Q7I9na
         V17CCtJxrw/qqw5d199QP/RyFhsC/qVuzIQT6m4GgA2Ga0wIQYqAUv9fGdE993RvRCYX
         8hdxq0Fa1wxphyYIeHTld5NIJCswU2VhK5lpysTuhY6QDxVZHvC+7A1hRH+bGnU9wy3X
         MtRFbqNKoPw+Eq9vMPUYjQLOZyaVLyfypG9GB7E544W+6X9XwUSncAanAuO8QlmPnDTq
         GUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710953060; x=1711557860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C5jJx5uk975X4VZREDA0yRed2x3nK2zK02MAB7KPtIM=;
        b=a5heKQaLBJ5bjFruLYA0UiEPGaXJsRJNra/mtr5YY6cOIPgBFEbH3Xg/4Ns+ALusbV
         +DQ6+MDlJ/Y4t+k6P/gIGokOvDFBY3WVlThTAXMfhxJjKuxWNuFAGTq4A6h3fvE3cDXZ
         C9UUh3CtyQcqSksYDg648YvX+Jz7HeVSTN6jsngsWCbtqUCCqqk6BdRRX/Nc93qU775n
         QZYlLHmWp62OxvTZdnkwqY6Ca/X1UMrkT4eJtDsriDghPUZacervquE3wapgolZ6zAQ+
         gpkY5k8cQepuzZ8V0U/vlWPqDIkb5uVV0LrCZ+RIogR0SQOKWE0ko4fvMxUu3W7R8lqy
         OD1g==
X-Gm-Message-State: AOJu0YxWS+DuD2i8R/FtqZP6tlY7ejkYPERbR5JymiBnjuxGg+d4RsYS
	a6wdohFINJgQtV8KEh38fjXSQtIcnFP3ozvK9gtorm+wWxnEBu2x9KztMimX7kjGu/gshe3/B8o
	9pLY=
X-Google-Smtp-Source: AGHT+IEi5x/wvNbNunXASdwckM/pXELx19VxSZYZmtPxND8xMhm7k0SM+eJkvnBN3hm20tsyI/pZ0w==
X-Received: by 2002:a05:6a00:170b:b0:6e6:2946:2b6e with SMTP id h11-20020a056a00170b00b006e629462b6emr21205680pfc.32.1710953059752;
        Wed, 20 Mar 2024 09:44:19 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a3-20020a62d403000000b006e6bfff6085sm12725437pfh.143.2024.03.20.09.44.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 09:44:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/12] libxml2: Backport fix for CVE-2024-25062
Date: Wed, 20 Mar 2024 06:43:55 -1000
Message-Id: <e4e621dc42be5dd158393fcadf5200f9eae613cb.1710952928.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710952928.git.steve@sakoman.com>
References: <cover.1710952928.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 16:44:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197388

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-Status: Backport
[https://gitlab.gnome.org/GNOME/libxml2/-/commit/31c6ce3b63f8a494ad9e31ca65187a73d8ad3508
&
https://gitlab.gnome.org/GNOME/libxml2/-/commit/2b0aac140d739905c7848a42efc60bfe783a39b7]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


