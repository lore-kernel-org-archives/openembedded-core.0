Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E52AEF0183A
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 14:00:28 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.69778.1772805619243247078
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 06:00:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xpt2FvpT;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439c6fc2910so2252986f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 06:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772805617; x=1773410417; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APgPt1b3/IjuPqB0PdlFtsUlW+yfBhfmpjSOGki8RFs=;
        b=Xpt2FvpTjclaW1gDY8RzVTvkqs+mit9Fk42ywTvZmPy89aQXN593gOyyJgx+4Q5K48
         xWfYmDZhsvB+5gQLOiLYvpt/09T1bZD/uLE+hn4SoT5rSiFyaPlJv6UhhWHHvaW8Hujj
         HrgRWzHXjLnjB+9R+GNhugEEz0NjZ47iQIspWrcziHvBAORW4EiDYXY5VbwNCN3skBhg
         ZQk4j31Lw7iqvLvKkfJQlLJivt0Mnks6FA8SCXCVXYQsnkb9dIPZk93qqi8FDGuPfXv5
         gCo52X/56z2nDWLKOU8nSz1U9T5wSyLiYl4ieWSueNIc80X6Zs066qIzQ46TshiVSALN
         LPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805617; x=1773410417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=APgPt1b3/IjuPqB0PdlFtsUlW+yfBhfmpjSOGki8RFs=;
        b=GU1kewS4bpKF2XkKIY+50AXVU3f2XPtsSyzb+jjD6/v/tLcN7MD/vuxpA1MHmtQXRd
         M7H4f8Fn4Q3xP32c2tqoMLiH5WnBirYK4xYkyvHejnnCK4tEJtiIF00Iv3IlvVI/qMCC
         1OyqZ6VJv0tpGx1ZM0eMGX7LUy1J456R8ffP4nBomYPXjOmypotTR3OYc6qxQ0+NaN3K
         I36y7rRVfaAXUi7hhx9eHTO9yoONfe3WxJOwm9nXHOWazKIRvjEhW3U3CZj6yfhTf/en
         iRqKoUdly7AuNBzFk1LVpV9fUR9AqtRy6Tk2iTZqO12FGfd9PAfhSuc2uZNIr5qfwOg5
         YuTQ==
X-Gm-Message-State: AOJu0YyZKvWIemfVfahBy53jQ6ldUw34Fxnc5Evch1REHAsfSkdEAjfZ
	iL2WE2EU7z3smWludSN9BBr51cWwGfSWqL/k812gyDwNAeGv/tH15Qk1OkNF+w==
X-Gm-Gg: ATEYQzwGgSbYr5veGzxrYjv4NuagRK+pFmq9WN0zN/0AQoKibtWY0AgI/dHt+uitnZd
	0TOLR4YDFtFTuBQ6GnnbWcNf1HhgLJzSFL6oMjjtvHWm1lbxlcyK3VfeFbiz1wVI6b2+clKWmcf
	AwosX//JvUVvLMOy1dHKZbDjt0lRbTrJdI3moFmgxmKXzlCdDiiZ6ncLVYvS/N4dpG5qGGlwT/G
	0KKAIf5Hwg0aEhFwH8A7KPbgqjZn+IqVQ7TRWAN0ViIDp2k5KbAwTJpSCQd3NKaZXafw8dsOFfF
	wtV9AgQd8dRpnJPjHTYdBQbWdgitbT9TaUxLZEDvj2//HqSTmU/TRED4S4cbTJbe8/8d9svKbl1
	7bhSoc9LLaqUbdAXgBcjdlHa1TUws+Wquypkh+XsnoVM2Mh62xMc3W0pk5QbgB6UgygV1sxRKBl
	eTWlynkw9/06vwlnmN93EFuhwwdRQFXS/Gi+yQ7UkxMWweSLXy40f6
X-Received: by 2002:a05:600c:8b5b:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-48526927a4dmr36463665e9.15.1772805616553;
        Fri, 06 Mar 2026 06:00:16 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb4257csm187098845e9.15.2026.03.06.06.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:00:16 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com,
	joshua.watt@garmin.com,
	ross.burton@arm.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	Stefano Tondo <stefano.tondo.ext@siemens.com>
Subject: [OE-core][PATCH v7 10/10] spdx-common: Add documentation for undocumented SPDX variables
Date: Fri,  6 Mar 2026 15:00:02 +0100
Message-ID: <8680e7608282fe04610400f0042c9cf747d350dc.1772805096.git.stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772805096.git.stefano.tondo.ext@siemens.com>
References: <cover.1772805096.git.stefano.tondo.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 14:00:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232576

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


