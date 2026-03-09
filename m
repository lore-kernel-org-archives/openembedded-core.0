Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBF1AF3C260
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 13:29:26 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14257.1773062965363943566
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 06:29:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KBZwUZOI;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: stondo@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79628fb5c05so95037497b3.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 06:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773062964; x=1773667764; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ahdnh+TpwH/Ap6B1OLeHI87lyehbS9YnnywWOR0hym8=;
        b=KBZwUZOIVSNgYMLZ8g/xXbybQIle9iW2l8tMtXz/NcudabVuP4CTpXBwGssLwfEOAZ
         5uC7sb7f5NoSEnOSOkbH6LMDatHzIFcRidnrx8YfUazTs2COQw6niijrsRIKbMeDN1Bh
         D/2X6hq0PNavxH1KSQvBABJMXHxbx0ABIEchzdTdlF2vOE7mZdEGrQEJN9mOtELEtlxf
         vLXc1Eud07FbGksLeOaYepiZvtMVb6nnzqS2KiSvv1HYjgGcRcN2uN1Kzl2XSBeidJZW
         c6RimDU0qJBb8Mt0oYMCHo3/4XiyFmWEgxoyHfC1l8NUAvMr1ha47s9loGWI4q7vuJVF
         PkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773062964; x=1773667764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ahdnh+TpwH/Ap6B1OLeHI87lyehbS9YnnywWOR0hym8=;
        b=vcopog4wI+kKSv+tdECu20mNSgMsmeofwQw9o7ZStqWNzqdY/aqO/zINBFTFV3CtHs
         NLaoQedB41BnmZfiuGIn3ffwZyfZndIo9wHvVPgGVaN5eDvFzUQdYzNPgujtu5PRMXlS
         DTSlbdpRgFa6FW0XpXQDnKK4l495f2rK+T21vZe8ZWAuw4ZAzlHBHlKpywSv04b4d9XI
         5SSp31Mr6NFdZ7eEZ9NmeZWb0PhR+T4ApTuG//Oj7LoawvUZLfaz3yOmPnRt3WM6fM4D
         +QeW1dsgcUbJZfz1pZE6FISsueE8QlbptiyYnwrGfsmfe0d0jBuMQSTN3zwdgVmB5pQs
         cbzQ==
X-Gm-Message-State: AOJu0YzWo/MiitZ2aFpGDhPeKPk/cL4tZTG7YyW0+ABXDEuAIMPOQsR3
	NCyUN90BDbdqGuIxowHxjsSOBeRhWtpu4PetFJDeaj366l+cTF2fjWN6m7oflg==
X-Gm-Gg: ATEYQzx1znASIdIFP5P7PFwELMenMKdWhyQo1nsQsF2+5N3ARl6V7437KymZp+umMfQ
	AQobLt9DAonO7fdANpFC5JjrqWKiF8x59LNTp7Jw4HsP/1kzSKRXzL0xW75XyoXnx9PP5tj/w2v
	dvieeyw+gmBleDcDy/PJzaWZp3Z/ZPjbES4awiAo00orQg8pY4D2tgq0WJo5qd6znTItuPIhyLl
	griMiM0J5eUGeDD3gkfJxODdXHK36UjWB3Ddp9qXqpdriVaGlK4BFaqP0p5gsw8dHdaIzZ6uhRS
	RYBb70FZky8by1J1wEks6n02lmjTtcME4cbU8Cf/LacQM+a3ZF3dtkyWIpHczG8vGV8IPgj4ot7
	LylT3NYnTqpQ0BGgI/OWuUeyaKzBRjtzf0EqLSDPlQBUt/u7bafnSjlJ/dReu33R/J/iuU3ncVH
	kSEZFpBNQegoD1Ga6KvGTfQ+QlG2NkEg9UsXD1aaUypy36lEaK85enj4kjes+lVlKsnV8nFNhV4
	CMuoZ7+xSg5ojaXOhs=
X-Received: by 2002:a05:690c:46c4:b0:797:d386:44e3 with SMTP id 00721157ae682-798dd6b633fmr110440117b3.25.1773062964291;
        Mon, 09 Mar 2026 06:29:24 -0700 (PDT)
Received: from fedora (mob-194-230-161-149.cgn.sunrise.net. [194.230.161.149])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-798dee6afd5sm44299437b3.45.2026.03.09.06.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 06:29:23 -0700 (PDT)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	mathieu.dubois-briand@bootlin.com
Subject: [OE-core][PATCH v8 7/7] spdx-common: Add documentation for undocumented SPDX variables
Date: Mon,  9 Mar 2026 14:28:54 +0100
Message-ID: <20260309132854.128375-8-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309132854.128375-1-stondo@gmail.com>
References: <cover.1772805096.git.stefano.tondo.ext@siemens.com>
 <20260309132854.128375-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 13:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232716

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
index f54459d3b4..be6e7b5bd6 100644
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
 SPDX_FILE_EXCLUDE_PATTERNS[doc] = "Space-separated list of patterns to exclude \
-- 
2.53.0


