Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A42510987A9
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 16:50:05 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17797.1774025402803068079
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 09:50:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QuYODkwL;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48702d51cd0so3390525e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 09:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774025401; x=1774630201; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cg3sZ18qawjT8A4dzIzDtBflRtGjsWCVhz/NhFC+NrM=;
        b=QuYODkwLOMBMPraE1CNm0d4kK0tJdiV2T/y9ADee0rQd/OkgOW3ijQ5nJWzgbjPzXh
         luGFAU9/7JfgxRhvbXeyYuTzGNOeyNo/pajdNdNyg6SqTi03XlsB1HZ/YEaWCYVhW82z
         UTNNW3Udffd07wtNghyezKO4UvavQDIgHrQFvDM+j3HStazySy0Sgz2sJL34eJitbQw3
         q/qctvhqzqudXC2DJE0XYbFUhpbs1nKMkXaMguEhFvg+J6KTnRngOQZXpySwLhb2SfQr
         t/foMbUrA60mhj/bcFbviWMvjymv3uODlkXtbxQ12VhqbFqilESduw2dRJl8kEhAKxLy
         YiSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774025401; x=1774630201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cg3sZ18qawjT8A4dzIzDtBflRtGjsWCVhz/NhFC+NrM=;
        b=f27zsf+dHCuGpQJ7gywZ9+LNHrTZK/nPjUNFtmfFP+1gfZCmFQb75DkzuqEbUDG+z8
         JPK1U0bAD8K/dRpci+zFjKRoViyHxvLQVs6Kr3IbfH/RnR1Oni+G8q6FbHbGe8+qJwlb
         G9ki1VUzioLT5qGdyF6mlwFIjpBWp2FdTMKQIPkptTWkYDmx1OQauJkxGhhNJslMz6KZ
         74UJ3gEIQFPapc4sELiGVa36u+YgFDoDoYdPaWeeC0zKWTqPLjkxl0FPbXeEqblrmQao
         KLezXx1u157G9+E9tIgm2M/f+yxfgOUcXNQiv+NdLygvkdh3aBOJswD18EBR6WVk8fwH
         yN3w==
X-Gm-Message-State: AOJu0Yw2tZwKioZfosMrKOIwQPSL72Ja4kd+0aRjVlJ4musr2MhvOqvu
	PIQYQeQtY6QjCLpuaqKUrmfsjQVc6yyBSvlamqILTm+EMYL1AYSVihuZ9LxigFer
X-Gm-Gg: ATEYQzzHcgNZdDMLLhY+eg+GjP0n30n/YvZodgoGWa55yjJwEyEsYfF7eZzc9cELvei
	zpavo6+bEOda1VqX9pO7zoJBMzdhpMT3MTo9K+T9Wp9gWIF71RSZJpzIfbrTjPsoVP5txvTulV5
	4SlR1vD3mqwA38gKxcWBE14CMkyipWycV0+MgvpQHkNMQ49v6EjXtGgy7u56K14Vlad/u7ob/Wd
	sHSz3ra97wQ9+eqTWoCyRlTkc3PNeyb/tfWHRekcPAxc4qKGuJQGK9YdnmH9yGldu0eLhJGnfV2
	bjwwNPQ/8+ASNBAKHVvmSH3k37q+9eN9jMJzlQEYqVSXsGjdxYV7mIPRV4nb7yQA+7DwkhyTP/m
	CxGGO9REiUUlLjqjA6yUZa5gAN+CRgudx9NFb73wxI5cKdDRr8wwgor0EbAC9r4k9fjzQbeolyx
	6R3KIz7+MWIg/dy9eqvkJr/z3C4+CyRehetz0=
X-Received: by 2002:a05:600c:3212:b0:487:1c2:6a4c with SMTP id 5b1f17b1804b1-48701c26b76mr21008975e9.4.1774025400756;
        Fri, 20 Mar 2026 09:50:00 -0700 (PDT)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe6d91fbsm73018905e9.3.2026.03.20.09.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 09:49:59 -0700 (PDT)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	richard.purdie@linuxfoundation.org,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com
Subject: [OE-core][PATCH v10 7/7] spdx-common: Add documentation for undocumented SPDX variables
Date: Fri, 20 Mar 2026 17:49:51 +0100
Message-ID: <20260320164951.128572-8-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320164951.128572-1-stondo@gmail.com>
References: <20260312153845.164369-1-stondo@gmail.com>
 <20260320164951.128572-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 16:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233627

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


