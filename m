Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9408DF3C9B6
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 16:30:24 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24473.1771950620529432413
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 08:30:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iVtBdol9;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4836d4c26d3so49998245e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 08:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771950619; x=1772555419; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKHnuZ49tVVht4esQfhuXG6gOxPyM6as+0vzKLgNlsg=;
        b=iVtBdol9pwkw2Dlacxs6CJI59vLRBql6ZPxVDi5ImYCAvVOL++Nj/3h216fThOpcpF
         jJJKfFy7KG+Sl88r+ooImPv5zHKmuwaY0LK18Re8R2+yBFLhSqO7u99Ux6zkBNPDm3wP
         ZhlsvJKGa3JgVVREjTjT3i74Z4ROzeX/QfTxCaDzAPlIzuuOGo/Khr10c1WZ8xkJFDTE
         m8+pZQ+VqHHmCz74RF3+A5we5crHJuB2WhK1Ze3CvETILd3ycdbNGzQY2kXNO5JshtY8
         06Z6weKpj1rOtCkQM0n3J3BPKyJuMWNnHGWKpkxZRI1bXrrOwB0mpKJkb5jMVQ3vma49
         vVWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771950619; x=1772555419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iKHnuZ49tVVht4esQfhuXG6gOxPyM6as+0vzKLgNlsg=;
        b=mCRr6Z/8v21wtjKVMyouBmpFHd8XlTZs62AEBYwDEdmxzavZEU/SQbX7LpHOfJI9Py
         Tg76MrepObUxwf+dv4j91JFh7GIm8E2koH9RaxMj9MOwxpKpIKvdGG2uJBt5AzQ+cRVx
         FI8ammSf0n8wzGZvLMChZm9Y16KhONmj5uCbtKAHUCgjpkls4Fj3u80tAiIjMjBhcahu
         taWR2pkUFaxEszNu8stfJkCWMYlVdMCj//87gE8BixdrvIUSKJ0EWZv5pDdfS21nTJ+e
         MpmckSvc0Tom3ihu3fVZ/SFnPUmpsG2k39wLAp/T35lx2I43NjVyQxWDFWoJvA9Rkl6v
         xXCA==
X-Gm-Message-State: AOJu0Yy0mCYpW1mDbg7Z40DmvSWPHQXZZ58YnJGTxU2hfI5tp9q2unJG
	0Nm6hkPFmPtTYdS4kIQfPBMFLjBpv5O0w/XWMql9u5sW8o+AFma6mgUPt3P2lm8Q
X-Gm-Gg: AZuq6aJt0Tcqb4hIrvdp3fwbsMgj2f6IBX5ExZ0i9ZHSXZPYbLocKfXfct8zSxV8FZz
	wJmnu3raMQ2wYWfWJ3d9qQ4dHPhT/+IEC9oXeansVcS/SliCD058HG84y8qDjDLQ9sMAdmEndGX
	w97E8RKGU134uTKnStJ6H5Wv2aAqS9ROV4oGaa0ZCu4KzBFjaRAm3HHuF5REIX76twUwIHVAPx4
	8P6jib5XymT4XQ6iRycGDzDTVbRuF6NMu2CkD+/9LIUjt7yajDIAEzj/ks22yWoaoufhPH2g3ET
	93HprUAire2GEHXToVP0dSrvi43/ZROiLjZ+4WNlZk0gGQfSTz9b0GKO84Kr6HFpSJMjaFmrpz2
	r43MO74Xi+C9xS66My6LDr8CublmtpPbUvoHa8Ed+atHt2FdrmZDLaH7j1IB6Tbn3QgXe3VBtYf
	osGizsvF+uDlssSVgeOai7sEsc563iJxiYUBi90IACAS/V5dVQEsIF4YpmaZObZI0rF3cojOJ5C
	vFLbEj2
X-Received: by 2002:a05:600c:6305:b0:483:8062:b43 with SMTP id 5b1f17b1804b1-483a95e1eb4mr203092495e9.19.1771950618133;
        Tue, 24 Feb 2026 08:30:18 -0800 (PST)
Received: from fedora (mob-194-230-144-218.cgn.sunrise.net. [194.230.144.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd6f3124sm9716355e9.1.2026.02.24.08.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 08:30:17 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com,
	mathieu.dubois-briand@bootlin.com
Subject: [PATCH v3 11/11] spdx-common: Add documentation for undocumented SPDX variables
Date: Tue, 24 Feb 2026 17:29:46 +0100
Message-ID: <20260224162946.4000445-12-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224162946.4000445-1-stondo@gmail.com>
References: <20260224162946.4000445-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 16:30:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231888

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


