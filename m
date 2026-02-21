Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57932C5DF8B
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 04:25:43 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14432.1771647935856102695
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 20:25:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BelOJp8S;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso20264755e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 20:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771647934; x=1772252734; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ogStFkucAnsrf1uoZdRMakcDyphspXS20QOKqA9GgRs=;
        b=BelOJp8SFsEcA/lAp9WWMBXJEokhljx/KtFSQe9kmF5IdhQQCq8uNDHynWdwuM5/BA
         mJMiKpGjJ6WgGhxcCMtPIuOykhPoLXyUsJaxKGQKq7YwfiMeLPTcP/M66iyz7hMBDUJa
         nuFCdrx+s33MKQHfIQbZ0X0r1qdK0wWF/Xfs6jdezasKLOP+ZDopYNWjqjwmt2xTNYhg
         Lv4wA8+LsPPOGySPh9kQIU3uTbEHHFV2YN0chH3N3zgw4mMW9viaWqVRW41KVllF8UrI
         RhFsQLDRyRyb7iUOHdOzVgtokCeCrS9ISKLYNjn3H68pObj98JWGH5njtrXZnp812+lX
         qZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771647934; x=1772252734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ogStFkucAnsrf1uoZdRMakcDyphspXS20QOKqA9GgRs=;
        b=rv/qbJ8Rt9P6T70vCxzaM0+uNwXLLiykApj5/NlhBjOeMGKYEzWzF0X3BwJY7jzqk6
         QCw0n5L6AlBs35Wr0Z6QrK0db63QwyUrXLnu/qf9rBlb5zXuhi4Pepvc+ud1rC/UPemy
         4GiS9FSYpgf/ous7PQLen/a0U4V1KF0M2kPUmatjF01ppORoeKMCcxliHkPB30AOFRl9
         onbHDpoSseArvJGWwgFapBLm4Ufh/EgumEuQNcQliu0qBfZPC+rHz9oGPQty0sGr8EVY
         H/Ao16onnfjbVNaJcc2ePLJUt7GYTVNvUdwJ6gQmx1PGIFK8BiObX2MuwrEoicv1E94x
         ckeQ==
X-Gm-Message-State: AOJu0YyWMTTn9cAMZB8ecI4fjW51XuWZaxZp/CcSeCnOpLII74RVF13o
	7MKNl54TAw8VVKfRzQrlEsEY2DQ/Ayf6vou/Wr8Vg9FAqjloLH9wT2L900dhfOD2
X-Gm-Gg: AZuq6aLzNYJTda3dZ/GaFLwFPetuh5kRHDPdeAtHb87MU++GJAifTP9fvLKDOLY8zS5
	48kALFko6IJS2f8PoQLzRg1hJukztApYJ2S3/4lVZG50CKqWUhsehwtpgBMpuZSvTtq9YeMjwFC
	QFRAji+ad4t9I1mjBQYfFKCpQ/U5qb2FmZyoWKmkQxLniTYiWKSm73sWX4fRcPL67X3TaXSxEYg
	hS8X3c/n1NvYacXXJPqIIwHU6ZhG+wy+U9lc5wWpEu8fbWGCSuY6zI0OqNGzVKlsiIytIVkBuk+
	b8dIXYQHez7tfDTjdjLn+wTsj+e4BswaGR8Pif1IvgDzsp+zqUBpazEAqwUuW+jz1En5HvbYNI/
	mMAKzirNMSCFLIDvk5pLGO3Cn5FxLVrZYCS2RzEETNweze65jIe6RHF1H6ZKt7iiqmnUcF4SnR+
	TDmNMNFFiohNCYAO9PKHzruEQfTwXKQWgwDhs=
X-Received: by 2002:a05:600c:6305:b0:480:4a90:1b00 with SMTP id 5b1f17b1804b1-483a95dd927mr31915555e9.20.1771647933874;
        Fri, 20 Feb 2026 20:25:33 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a9cb3f31sm26800745e9.13.2026.02.20.20.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 20:25:33 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com
Subject: [PATCH 1/2] spdx-common: Add documentation for undocumented SPDX variables
Date: Sat, 21 Feb 2026 05:25:29 +0100
Message-ID: <20260221042530.318125-2-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221042530.318125-1-stondo@gmail.com>
References: <20260221042530.318125-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 04:25:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231574

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
Cc: "Ross Burton" <Ross.Burton@arm.com>
---
 meta/classes/spdx-common.bbclass | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index 3110230c9e..b8961262f9 100644
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
 
 python () {
     from oe.cve_check import extend_cve_status
-- 
2.53.0


