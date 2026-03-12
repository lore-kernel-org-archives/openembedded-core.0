Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B680E1125853
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 15:39:03 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24812.1773329940515790896
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 08:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nH89zOKC;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-482f454be5bso24088765e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 08:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773329938; x=1773934738; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cg3sZ18qawjT8A4dzIzDtBflRtGjsWCVhz/NhFC+NrM=;
        b=nH89zOKCMa06+k+8SLLjYQI1bQShAUABV9CNkmRn41u6NBPn7Arc18+tgIR2pPbUBy
         PaVbpMwKOme3aPI1+StkW6X2jsWj+Uqt8E/LgSwGTW9xunQkVEKqu3XsLSR5xsOcjoIV
         A7UZvwo3/4R40Dt/340OekhcHgnR/IlcTReve28yppZoyNQD596FMJb+5y1vxWRHBEtk
         ET2sFjDsgrUCWd2/SGFFJNFicC++eKygU0O/e5OJOMAk2znJ8BRx4a9g6lxoIEHM8KPV
         wFtTK+muNQM14MDQb1AXJsqSXOMHdm5lRIUAdmWP9lGPkREkl7hWXFxa/JJEJxDuxSdC
         jxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773329938; x=1773934738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cg3sZ18qawjT8A4dzIzDtBflRtGjsWCVhz/NhFC+NrM=;
        b=Y4CT5OVydqLeTtkxw4jcgqOARksnzXKCHlR8+iovBVExJgUNKczTYUZcolb7ds6IKZ
         ZeZkxrUAa4K7xnM9yVtAUoWjvspSoUacoLqPa5UTbJlb+ZJlYx+IG9CId4O/ZDdL+bv/
         gNjs1oJJVcCFbl+5zb3NO3k7RQOJ2xYAVDCvGAK7l/k0Sgn5max7mchSL1e+SlQuHAJW
         b/b167Q2NpsMTH+x3r6JYjvajzJmYtKQkcxfnEw0SlRG/Xv5703x/ITwWG2LdCp3mb0m
         BZklz8aR2XQI251tiYMg06fbOOyaw3NCdzbt4j2bjUSSG8QNwydI49fRnVpyRBvfXeeH
         foAA==
X-Gm-Message-State: AOJu0YyAXNRu17KCC668Dqeak+ZF8QjO9+YeUZq0T+pKuo5AbBygtEnM
	ZiYB7IjrQsnj9ZD4tUJBcFkNu/+QcyPOwjWDk5O57NfxGWE04JQvg+vXElAsvg==
X-Gm-Gg: ATEYQzyxlXCRCyrsl9RwU9i4dXZsKsBDUMeO4OcRtM2li4Vs/nmBXCRAsvvXMyEFl49
	6agSK76T96s//zWR4Ou0nDj9xYv9edceEE+JhvbIIKjJDxpqRT1poMUTqF78UkmG+IJ5U48RHt1
	8FdORigH2nR/GWXltNFMp3jLuW6L406t89scZGif6vQLsHfgbsv4WFzoC3PFX0phfd4r1gswbsS
	GfnnD1C76W73XVOM2jv9EVLGsKFu5Rxk4sOvVe03kxcCUz+04OIoSroeEbuEgG5welePgv9y5M/
	xreWIGOlhtlnsgeL3muYbCksxHC8r865mKnDO5Yk53lWVZMj6ur7GtQbvlR5qb6Tpn/re0tyusk
	j5tinJ65krJvLIkVjHoiH/ol2vrYFTnOfk11ZK/IDBMpsTEwsJN3/DcRGDwuc26EJJpsyG65+ML
	bDx8nZeBnLENNT0X3PPJUZe0g1qIYPosuQq6w=
X-Received: by 2002:a05:600c:1907:b0:485:50ac:b8cf with SMTP id 5b1f17b1804b1-48555a5689amr3179245e9.0.1773329938193;
        Thu, 12 Mar 2026 08:38:58 -0700 (PDT)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0dcf2asm74857385e9.8.2026.03.12.08.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:38:57 -0700 (PDT)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	Stefano Tondo <stefano.tondo.ext@siemens.com>
Subject: [OE-core][PATCH v9 7/7] spdx-common: Add documentation for undocumented SPDX variables
Date: Thu, 12 Mar 2026 16:38:45 +0100
Message-ID: <20260312153845.164369-8-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312153845.164369-1-stondo@gmail.com>
References: <20260309132854.128375-1-stondo@gmail.com>
 <20260312153845.164369-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 15:39:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232980

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
Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/spdx-common.bbclass | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index 5cba52eedc..00438458e0 100644
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
 
 SPDX_FILE_EXCLUDE_PATTERNS ??= ""
 SPDX_FILE_EXCLUDE_PATTERNS[doc] = "Space-separated list of Python regular \
-- 
2.53.0


