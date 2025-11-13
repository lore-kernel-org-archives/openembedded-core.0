Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C047ECD98D0
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 18:42:02 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.88.1763059319492611429
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 10:41:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZJi2X+nw;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: stondo@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b7359b03878so119155366b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 10:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763059317; x=1763664117; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nmg0jT7025vW2pfAf/42CCu4Xif24Tpkfcd6f1rnSas=;
        b=ZJi2X+nw5/bKG023YuZMV9Ul1TYvLnyq0+qrDZmpmnyLdc8kKYdMRUkXV0H+/Hs2pJ
         3yyRyw+XlVgF8LCB0gbNF5CpFCu2cOt0dpaizE4v2FA8o43JfNilPZEuZusvzKJNdBX+
         zXBNv7fvB1+WkcAWgKLFxtWjMl07ehLyarRuKJV2JZ7FXEkexBxgRijo8PHD7wlYu1EL
         8xcmtF9LtB8QW0jRXnzEh7VX64GQXG6ErNY5lGBK4y1LY5c92PQGwwVh+XgaibzsmJCG
         VTH/DGtPIrYI3ksmyQaSsz4I7izMNA76up7SS5RPfo4KOQ8Y9sNYq+Sqe4gvqil3/NFR
         49MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763059318; x=1763664118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nmg0jT7025vW2pfAf/42CCu4Xif24Tpkfcd6f1rnSas=;
        b=RtIS9Jp6JEeqGjEQLSeHOlz+BVADktKMMFIxSdm9FAtg485Kw7vPUHwpojGOyv59eS
         7OgSYDpnr9xiB1173n423eYk99wdjcXkBVqW3q0tUFcB+t4XrVRRfFKguKlAIzupb03A
         PCJ/IKC9JI8vlJVPqe0tFTW7bFJUO5LpvpiI8wsTTGppTDTBL/DxSKy5ltxbG2k9xK/w
         quTE3Q39Waf4Myxu6GxjiRmaVQXYslzsW2o8i0JwowRLbPCFVtRqLP7ZKxrOX/R7DH/A
         bVjdUQ7p8BCa47tip0uSFcTKyWrIV7RsO3mNPj5I90PtuYnyDJyfMfbN3kl7+BcZZfOE
         a5hQ==
X-Gm-Message-State: AOJu0YzYvLF0jb3+0KXe2itUEn3BD6Vars9rMeSi5usR0PJvFRqefHZa
	j41JEjEbYG0oDjVRTbwrMoYXkgtZBt8BoyHlfGbq+OUGyZpg7IvIye5cscyDDw==
X-Gm-Gg: ASbGncs0PBAfV8eRmyg3KOkeZkPkGpcC+ncO+WadHNWzddtE0q0qtvcs83c3Vz40Sof
	CAoVTbxXxuKghSn0eaWXGPwuq+LEOneYIKVCxtBXY5llO7lybkjfk0dNgAbTXFJ+BhMGRUXoFfj
	90UhjSqj5JLSN+ndjvxkZS+jBkipm76efmTYp5GzPHB0XoMKetofAgtRggrttf+IfjrEXEDNH6o
	ZNSdhl23nrHPl/0nqpPJBVTACbEngZMCZmMASG52m8NR0kxlPfr4n21fMAQ27VRvslFYHzRqIHl
	OB8OUCEw5+Nk139uyt11y3CsTMrHKjlIuCZl+FIs93s4kRtxA2C2d4fnlDX6fd3y6UD6/IJiq2U
	pH8+lxJMGovce/CeD54/18r/BOUEQj5tUIXbEAHBebmOMHvmekKdiD6ftitXx2N4sqOcdbMilGa
	3zhmrpc7VYTSd7OABJMQWCBm4=
X-Google-Smtp-Source: AGHT+IEq4bMXI9s4dMQarGNNoZe+NMwOThUXS0V3XfDyObBMkummu5saANojzFH0KTWgM5tFriWaSQ==
X-Received: by 2002:a17:906:6a1c:b0:afa:1d2c:bbd1 with SMTP id a640c23a62f3a-b7365b188admr72628966b.30.1763059317458;
        Thu, 13 Nov 2025 10:41:57 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b734fad48dcsm215301766b.25.2025.11.13.10.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 10:41:56 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Stefano Tondo <stefano.tondo.ext@siemens.com>,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com
Subject: [OE-core 2/2] spdx-common: Add documentation for undocumented SPDX variables
Date: Thu, 13 Nov 2025 19:41:47 +0100
Message-ID: <20251113184151.511039-3-stondo@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251113184151.511039-1-stondo@gmail.com>
References: <20251113184151.511039-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 18:42:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226260

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Add missing [doc] strings for seven SPDX-related BitBake variables
that were previously undocumented in the spdx-common bbclass.

Variables documented:
- SPDX_INCLUDE_SOURCES: Control source file inclusion in SBOM
- SPDX_INCLUDE_COMPILED_SOURCES: Control compiled source inclusion
- SPDX_UUID_NAMESPACE: Namespace for UUID generation
- SPDX_NAMESPACE_PREFIX: URI prefix for SPDX documents
- SPDX_PRETTY: JSON output formatting control
- SPDX_LICENSES: Path to SPDX license mapping file
- SPDX_CUSTOM_ANNOTATION_VARS: Custom annotation variables
- SPDX_MULTILIB_SSTATE_ARCHS: Multilib sstate architecture list

This improves discoverability of these configuration options and
helps users understand how to customize SPDX/SBOM generation.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/classes/spdx-common.bbclass | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index ca0416d1c7..6bd1b56d96 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -26,17 +26,43 @@ SPDX_TOOL_VERSION ??= "1.0"
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
 
 SPDX_MULTILIB_SSTATE_ARCHS ??= "${SSTATE_ARCHS}"
+SPDX_MULTILIB_SSTATE_ARCHS[doc] = "The list of sstate architectures to consider \
+    when collecting SPDX dependencies. This includes multilib architectures when \
+    multilib is enabled. Defaults to SSTATE_ARCHS."
 
 python () {
     from oe.cve_check import extend_cve_status
-- 
2.51.1


