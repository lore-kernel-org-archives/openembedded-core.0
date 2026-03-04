Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 070AFEF9018
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 17:06:08 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23394.1772643965688864346
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 09:06:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mtRvAOnT;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4834826e5a0so80745625e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 09:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772643964; x=1773248764; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APgPt1b3/IjuPqB0PdlFtsUlW+yfBhfmpjSOGki8RFs=;
        b=mtRvAOnTDUpu6iKuwOk/pOCnVKPaFbit+uA5Y8MrKMDGGHVocra7+N7at2Fi99xoBA
         YVU5BlEDHJCoptwKsFtnai0ikXHn4nlona7nuejgn5S+B6HLnKpxk+ZJTjbNTrvHjCRb
         0pMVYruBp/AwMxxgq0BsMqkd8RVsV3RipXYQFe3ou0Ce9JvxBODtuxuQDM0G7lQMf0Yp
         AAWCqLq0XxCiRUf+ETdPE9/0LyhjVjSnzH0GwJTxvHFQ6+TX6Elf0JIYKnMl5lrdTRDP
         r3TTuNdeC4NAbnkNUlUoP3t5cp0pu+lGmEOHRBoV9N19WlsuhdVZoPg7/oiLFF6KkRH/
         g+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772643964; x=1773248764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=APgPt1b3/IjuPqB0PdlFtsUlW+yfBhfmpjSOGki8RFs=;
        b=Ar9CjeKZG+1LWUdrK6+iKhp20Uu37gGRYdybK8xTL5JXvQXS7gkAb0lkqFG4OrrZ8C
         aCpsOH0/wIdGSMN3LQRcFaxGXdSSZIP7YjeNf5zRTSjSXQO4+DqP597fl7Se1phypqWp
         LYD0wkWdVrygourqOhXjgsA+O8rI5XzTjt7ysp9j6ign2H9aoolbtpHqEWijroz7HZ9h
         hqTgWzqv0yAb0YCKc447pj5iiDOCehB5vhxqbmCJChZ6wHPCZ8DrCgXyK1Jsb6ZeTMSW
         FNEAXAWK381WDjRexxypIXy+mjm6T/lal+KyOW6Qch244oDQc5RObguD/awbSD9yEVCB
         +Suw==
X-Gm-Message-State: AOJu0Yy4TuqxWcSUBzs8zwJJkK8DVGmRN2AH9MfOu/VFXpCRMswqg3Sd
	XYlt9Bb2r1HNsSF6YD7++zcdAqoNp1k2PJjREMw0wLpD3WNySEG5sxUAf0CcHw==
X-Gm-Gg: ATEYQzxEBsV00fT7/LF1L6IOUlpG1zUlgO9h/R0Qyf8k+O1i5wc4dXhIfatMWiE//da
	TEBYhfP4ojI8z+BAc8sEkdY5vSsrzuV2seSHJaK3ihB65sCSDMYzdtC4PScEnHe5tX/kmPBJ6D7
	2v5G8a+wMYtkC6tbN6NM/CcsIFWzKbhBIiBF6ZaSF6vFYHPCuz2Q/CDBfAVEqPW4RmsR94xc2DN
	7QEI9fyWbXjE1sOMxcQBz3IxSU88HQOYCs35svQYJIzfjzb7UJazjpvXb21KaMXBPpERe0zGsUs
	pSnIN5H+dyzn0H9dz3u6ZVNaNJ/mrnIIT84MW/EiflqSIWk8CH43RVpBAFCX39Y3Url8XFrZXbG
	nqrh6lnwEPrIcI5XOp8hvTkEyqEAn0QpGY+d1LzRq0bFr89+u+g/HDynzEkM4/XtMX6JQb/z6u8
	Mm5aPLmfa1peOhm2pz+I4YjwY=
X-Received: by 2002:a05:600c:4f95:b0:483:79a6:e7e1 with SMTP id 5b1f17b1804b1-48519848054mr45290595e9.7.1772643963660;
        Wed, 04 Mar 2026 09:06:03 -0800 (PST)
Received: from fedora ([165.225.94.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485188914ddsm78557395e9.12.2026.03.04.09.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:06:02 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	jpewhacker@gmail.com,
	mathieu.dubois-briand@bootlin.com
Subject: [PATCH v6 10/10] spdx-common: Add documentation for undocumented SPDX variables
Date: Wed,  4 Mar 2026 18:05:41 +0100
Message-ID: <20260304170541.180868-11-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304170541.180868-1-stefano.tondo.ext@siemens.com>
References: <20260302160114.46884-1-stefano.tondo.ext@siemens.com>
 <20260304170541.180868-1-stefano.tondo.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 17:06:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232413

Add [doc] strings for eight undocumented SPDX-related BitBake
variables in spdx-common.bbclass.

Variables documented:
- SPDX_INCLUDE_SOURCES
- SPDX_INCLUDE_COMPILED_SOURCES
- SPDX_UUID_NAMESPACE
- SPDX_NAMESPACE_PREFIX
- SPDX_PRETTY
- SPDX_LICENSES
- SPDX_CUSTOM_ANNOTATION_VARS
- SPDX_MULTILIB_SSTATE_ARCHS

This makes variables discoverable via bitbake-getvar and IDE
completion, improving usability for SBOM generation.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/classes/spdx-common.bbclass | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index 81c61e10dc..d45c152ba8 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -26,15 +26,38 @@ SPDX_TOOL_VERSION ??= "1.0"
 SPDXRUNTIMEDEPLOY = "${SPDXDIR}/runtime-deploy"
 
 SPDX_INCLUDE_SOURCES ??= "0"
+SPDX_INCLUDE_SOURCES[doc] = "If set to '1', include source code files in the \
+    SPDX output. This will create File objects for all source files used during \
+    the build. Note: This significantly increases SBOM size and generation time."
+
 SPDX_INCLUDE_COMPILED_SOURCES ??= "0"
+SPDX_INCLUDE_COMPILED_SOURCES[doc] = "If set to '1', include compiled source \
+    files (object files, etc.) in the SPDX output. This automatically enables \
+    SPDX_INCLUDE_SOURCES. Note: This significantly increases SBOM size."
 
 SPDX_UUID_NAMESPACE ??= "sbom.openembedded.org"
+SPDX_UUID_NAMESPACE[doc] = "The namespace used for generating UUIDs in SPDX \
+    documents. This should be a domain name or unique identifier for your \
+    organization to ensure globally unique SPDX IDs."
+
 SPDX_NAMESPACE_PREFIX ??= "http://spdx.org/spdxdocs"
+SPDX_NAMESPACE_PREFIX[doc] = "The URI prefix used for SPDX document namespaces. \
+    Combined with other identifiers to create unique document URIs."
+
 SPDX_PRETTY ??= "0"
+SPDX_PRETTY[doc] = "If set to '1', generate human-readable formatted JSON output \
+    with indentation and line breaks. If '0', generate compact JSON output. \
+    Pretty formatting makes files larger but easier to read."
 
 SPDX_LICENSES ??= "${COREBASE}/meta/files/spdx-licenses.json"
+SPDX_LICENSES[doc] = "Path to the JSON file containing SPDX license identifier \
+    mappings. This file maps common license names to official SPDX license \
+    identifiers."
 
 SPDX_CUSTOM_ANNOTATION_VARS ??= ""
+SPDX_CUSTOM_ANNOTATION_VARS[doc] = "Space-separated list of variable names whose \
+    values will be added as custom annotations to SPDX documents. Each variable's \
+    name and value will be recorded as an annotation for traceability."
 
 SPDX_CONCLUDED_LICENSE ??= ""
 SPDX_CONCLUDED_LICENSE[doc] = "The license concluded by manual or external \
@@ -53,6 +76,9 @@ SPDX_CONCLUDED_LICENSE[doc] = "The license concluded by manual or external \
     SPDX_CONCLUDED_LICENSE:${PN} = 'MIT & Apache-2.0'"
 
 SPDX_MULTILIB_SSTATE_ARCHS ??= "${SSTATE_ARCHS}"
+SPDX_MULTILIB_SSTATE_ARCHS[doc] = "The list of sstate architectures to consider \
+    when collecting SPDX dependencies. This includes multilib architectures when \
+    multilib is enabled. Defaults to SSTATE_ARCHS."
 
 SPDX_FILES_INCLUDED ??= "all"
 SPDX_FILES_INCLUDED[doc] = "Controls which files are included in SPDX output. \
-- 
2.53.0


