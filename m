Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59790D597D3
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 03:16:28 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.3415.1731467785942107516
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 19:16:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=q5f+L2jP;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71e49ad46b1so5601793b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 19:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1731467785; x=1732072585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rh6pe1j0f8OfvofHCd+vgTVtZ+eJDOpc7Lmd+aQUIDA=;
        b=q5f+L2jPkoYjPr/OKSrtROmDJLYYHHwDMqtxTcG0vLy184CTa6kOBNbBuJCEI20hzO
         DYG45yNgPUyzVGFW82z/o9IYnp4iPCUn9wRQ7v6u6dbvU4BOzNCGcuZYM65fdmBwpcON
         rWvbkYu9vuGiJkeRoBaiJr6srDFhnGOv8Ot4vkhNT293bD+LdLGkrwf6UlEAtx/EdQFg
         YZRFTroC3KMSLEkTOyBAWqX+m0uFPMssN2vSXyaA0IyQQcUTAacEhU695GA8gnhHLlQv
         YArlOVgY2cJLdqWWOf836IYkfkryMS0rbrwBLQzgVmAGVawzcO7u0LORpHyVGl5SzJCN
         Jnog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731467785; x=1732072585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rh6pe1j0f8OfvofHCd+vgTVtZ+eJDOpc7Lmd+aQUIDA=;
        b=DCuUrxwyyBGI/RFru3LfM7ivyydkyKqRS8/D0VqyaqkBBG48+XqiZeaCW5+WRPwBKv
         hKml6Z38htDZx/A3AQCOU61RzYzHN8fRmUM5jI6zOz/uhCHm8trzZ4mwobyOJxV1/GgE
         9BxhEMUtf2Vtu/kJwH14lpO+ec9oTTK3IL3K9zFPDiCeL4oKZ7AYdAFnR6R/1B9CIIR+
         c/LxuvYkF20BhP45aZIkp/Y0RnbxR1ZP4ifXz0abwUn0AUDdEWTqLNulcmJDYX7EhHgG
         dNiA2QjXbJ4q5mxK8ee/5QkBygCTQZ+mxksFO9PIzh1IVYXxsjZiGxNge2bmkcfo1NI+
         vfAQ==
X-Gm-Message-State: AOJu0YxvD5a1F4wAhQeKK8X0sK8QJp0C9Am0OvVFaPR8c2pHS98WTJc/
	acRczu0QyrzuGMi/FVXU2CaB+HbZU4CyY8PygTBpSQ3upr8UsK5J24E92ZHxbuMQQ0/MvWJYv0J
	K
X-Google-Smtp-Source: AGHT+IEN3oUn39uU69/NLhdGfkWjZZZGL+z6/TttUqeQ8MUJFq5MtrAouoNUfRcmPkDWcIGT8WzhuQ==
X-Received: by 2002:a05:6a21:1690:b0:1d9:2694:44df with SMTP id adf61e73a8af0-1dc22b75a1bmr28742822637.43.1731467785078;
        Tue, 12 Nov 2024 19:16:25 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f64616csm9660213a12.64.2024.11.12.19.16.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 19:16:24 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/19] expat: patch CVE-2024-50602
Date: Tue, 12 Nov 2024 19:15:57 -0800
Message-Id: <2cf8325876aa4d43151f5a327a21834db37bf0cb.1731467662.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1731467662.git.steve@sakoman.com>
References: <cover.1731467662.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 03:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207077

From: Peter Marko <peter.marko@siemens.com>

Pick commits from https://github.com/libexpat/libexpat/pull/915

Not picking test is suboptimal, but test structure was changed meanwhile
so we'd have to invent new code.
Skipping tests was already done in previous expat/kirkstone CVE patches.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../expat/expat/CVE-2024-50602-01.patch       | 56 +++++++++++++++++++
 .../expat/expat/CVE-2024-50602-02.patch       | 38 +++++++++++++
 meta/recipes-core/expat/expat_2.5.0.bb        |  2 +
 3 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2024-50602-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2024-50602-02.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2024-50602-01.patch b/meta/recipes-core/expat/expat/CVE-2024-50602-01.patch
new file mode 100644
index 0000000000..6abaa85261
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2024-50602-01.patch
@@ -0,0 +1,56 @@
+From 51c7019069b862e88d94ed228659e70bddd5de09 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 21 Oct 2024 01:42:54 +0200
+Subject: [PATCH 1/2] lib: Make XML_StopParser refuse to stop/suspend an
+ unstarted parser
+
+CVE: CVE-2024-50602
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/51c7019069b862e88d94ed228659e70bddd5de09]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ expat/lib/expat.h    | 4 +++-
+ expat/lib/xmlparse.c | 6 ++++++
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/lib/expat.h b/lib/expat.h
+index d0d6015a..3ba61304 100644
+--- a/lib/expat.h
++++ b/lib/expat.h
+@@ -127,7 +127,9 @@ enum XML_Error {
+   /* Added in 2.3.0. */
+   XML_ERROR_NO_BUFFER,
+   /* Added in 2.4.0. */
+-  XML_ERROR_AMPLIFICATION_LIMIT_BREACH
++  XML_ERROR_AMPLIFICATION_LIMIT_BREACH,
++  /* Added in 2.6.4. */
++  XML_ERROR_NOT_STARTED,
+ };
+ 
+ enum XML_Content_Type {
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index d9285b21..fa02537f 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -2189,6 +2189,9 @@ XML_StopParser(XML_Parser parser, XML_Bool resumable) {
+   if (parser == NULL)
+     return XML_STATUS_ERROR;
+   switch (parser->m_parsingStatus.parsing) {
++  case XML_INITIALIZED:
++    parser->m_errorCode = XML_ERROR_NOT_STARTED;
++    return XML_STATUS_ERROR;
+   case XML_SUSPENDED:
+     if (resumable) {
+       parser->m_errorCode = XML_ERROR_SUSPENDED;
+@@ -2474,6 +2477,9 @@ XML_ErrorString(enum XML_Error code) {
+   case XML_ERROR_AMPLIFICATION_LIMIT_BREACH:
+     return XML_L(
+         "limit on input amplification factor (from DTD and entities) breached");
++  /* Added in 2.6.4. */
++  case XML_ERROR_NOT_STARTED:
++    return XML_L("parser not started");
+   }
+   return NULL;
+ }
+-- 
+2.30.2
+
diff --git a/meta/recipes-core/expat/expat/CVE-2024-50602-02.patch b/meta/recipes-core/expat/expat/CVE-2024-50602-02.patch
new file mode 100644
index 0000000000..4d99eb738c
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2024-50602-02.patch
@@ -0,0 +1,38 @@
+From 5fb89e7b3afa1c314b34834fe729cd063f65a4d4 Mon Sep 17 00:00:00 2001
+From: Sebastian Pipping <sebastian@pipping.org>
+Date: Mon, 21 Oct 2024 01:46:11 +0200
+Subject: [PATCH 2/2] lib: Be explicit about XML_PARSING in XML_StopParser
+
+CVE: CVE-2024-50602
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/5fb89e7b3afa1c314b34834fe729cd063f65a4d4]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ expat/lib/xmlparse.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index fa02537f..983f6df0 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -2202,7 +2202,7 @@ XML_StopParser(XML_Parser parser, XML_Bool resumable) {
+   case XML_FINISHED:
+     parser->m_errorCode = XML_ERROR_FINISHED;
+     return XML_STATUS_ERROR;
+-  default:
++  case XML_PARSING:
+     if (resumable) {
+ #ifdef XML_DTD
+       if (parser->m_isParamEntity) {
+@@ -2213,6 +2213,9 @@ XML_StopParser(XML_Parser parser, XML_Bool resumable) {
+       parser->m_parsingStatus.parsing = XML_SUSPENDED;
+     } else
+       parser->m_parsingStatus.parsing = XML_FINISHED;
++    break;
++  default:
++    assert(0);
+   }
+   return XML_STATUS_OK;
+ }
+-- 
+2.30.2
+
diff --git a/meta/recipes-core/expat/expat_2.5.0.bb b/meta/recipes-core/expat/expat_2.5.0.bb
index 26190383e3..33207ff0da 100644
--- a/meta/recipes-core/expat/expat_2.5.0.bb
+++ b/meta/recipes-core/expat/expat_2.5.0.bb
@@ -28,6 +28,8 @@ SRC_URI = "https://github.com/libexpat/libexpat/releases/download/R_${VERSION_TA
 	   file://CVE-2024-45490-0004.patch \
 	   file://CVE-2024-45491.patch \
 	   file://CVE-2024-45492.patch \
+	   file://CVE-2024-50602-01.patch \
+	   file://CVE-2024-50602-02.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://github.com/libexpat/libexpat/releases/"
-- 
2.34.1


