Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51927FCE068
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 12:19:10 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68806.1772108343187133353
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 04:19:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KUYWKfuS;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso7211105e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 04:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772108341; x=1772713141; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKHnuZ49tVVht4esQfhuXG6gOxPyM6as+0vzKLgNlsg=;
        b=KUYWKfuSOlnafoqWL5Ca5hK3uhMVwF4g6xWOb4x3Tz0tnBkQtGcqdzqQCJJwVxeNv1
         QD4DDnnTLO+yBeHEUjqvA43OcJWkc5UqiBp7JgC3bQ4XdGOyP2NRGKELJmPH6iSbxdOP
         M7dVVc2ftU3GO9JCIfVopXfupSNhf+ZhVLNG7WN3pWO+SFUD+NDnhXBa5mSVRPLbVTYh
         KnDGWBKQue0e5oSIHnzhjZicpFPgFY+aH2maJzjAP2uqkBYjH+7b/BAweI5UnTBeOYs+
         iHQDu/SCBOLm0RzBM3NWsowrnXayCeNIbXr77GpdFDuDTslS4ev3Tu/D0BWZlaL1Dy2t
         Nrmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772108341; x=1772713141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iKHnuZ49tVVht4esQfhuXG6gOxPyM6as+0vzKLgNlsg=;
        b=aJJL2FhKcS0sU6Benb0KFo/4TmdAkhDUpbShGuMlK3cfWgkjqIp6MffhS4coTIGFvT
         jZdFmgmMQswtJFFXOLdo5mNnvZ4tUUehqBbEG39lE3WF05Yw+0VpjL8H1GqU5mKqjQqJ
         yp4SsLyoM/xAGvIZ2y6su//hjjZwDgtfw94PR0j+nBO4XpGEPVZMczshRu1ZzBomv+Ac
         774jJT/hPadcyOAdKbcDxzv/Id+knagl56FzFqR52gAfZttGSBxff64X0BPV/8SehP+U
         Eo9FgJwUWPNYL9QTMOZEVmV6LLAevhFvQuG6V27XHKfK6Mm1t8eTxfsUSKXZBpncGprz
         z8Sg==
X-Gm-Message-State: AOJu0YxoVXFy7F0ig0DCI+9NAeZ/E1Cgikq/Zxt2XpB2cexM/KAFKeJZ
	kLTjEZuICgAyFF/asRoY9Cvd9n8bMhndRvakFyd70B1Jht147eWvAHNMszs+2+lW
X-Gm-Gg: ATEYQzy4IPqZgy17+wyHeZtGN5L5q+ahqEhk38j2eUXxHoL6uv+szGjdz0i92vgi0Rz
	9xGY1zpCBEpMqnS1/6kOJ2UdYbx0jrybPNFjQJMca9EmjMAEgq+UCbAzqj774zcJGipHlhBuUiV
	i49W4Zcrii96AmbfO6h2amllHTHQR4yOZNm26ZvI5hXB/p23heNaj/eapo8nQlkXu8ScT6aG/gB
	b3IYElPjmsEnh+eifCF61Hg5x8Jvyrw1HqueROWq6UoGns5zUhTN9sulXu2ubYc8vxnSXyBIbbw
	xr+I0mEC9X1lQic6clFF05zODUi6ajhoashziD8tRHYsTQ2UQnH+PVwEv7WrP0TRjnZOLJ2Fony
	195XMECOGI01+1+MADE8XkokBtqIYHmQR7i8KTGuyfELYFXFn5M33OYDbyW/Oax8Mt4W+wY1qyj
	2HOaCyvg==
X-Received: by 2002:a05:600c:154b:b0:477:afc5:fb02 with SMTP id 5b1f17b1804b1-483a962e38bmr310890045e9.21.1772108340463;
        Thu, 26 Feb 2026 04:19:00 -0800 (PST)
Received: from fedora ([165.225.94.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb77466sm48483955e9.5.2026.02.26.04.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 04:18:59 -0800 (PST)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	jpewhacker@gmail.com,
	mathieu@bootlin.com,
	Ross.Burton@arm.com
Subject: [PATCH v4 11/11] spdx-common: Add documentation for undocumented SPDX variables
Date: Thu, 26 Feb 2026 13:18:23 +0100
Message-ID: <20260226121823.149327-12-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226121823.149327-1-stondo@gmail.com>
References: <20260226121823.149327-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 12:19:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232016

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

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


