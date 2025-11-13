Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D989BCD98E7
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 21:40:53 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.912.1763058313381980298
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 10:25:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GzBhTVy5;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: stondo@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-640d0ec9651so1974385a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 10:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763058311; x=1763663111; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nmg0jT7025vW2pfAf/42CCu4Xif24Tpkfcd6f1rnSas=;
        b=GzBhTVy5u/CAbIioDeigoTy6Ww3ti5NIcx8glXcHmi7KM+Xrwmeb7d+nX4V3pkEkaw
         IzItCIxoqu167Y4E1SMq57YcBhW28ob8aM3lpiwiDGmmfqs0ngkH6KNm1DwPcbmArAcT
         GMTzNy2WCFiUuyqIH7L2RdoLNi0mU998vaL8yJXMz0sA2zzm7UyoVn1MGzBIs1YI1zyU
         d/vRV74m37RV290M8rW5x9NoxufQBaFT+yuLa+200y2g+AE3kAwCtv7N0SqmHL8lA/0J
         auxhiYNXYCA1+p710WXWTehH2NgRs6hhYr8HV2JpabrJyLAnyI7E4T5qN+Z3TmMz1Vcq
         o5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763058311; x=1763663111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nmg0jT7025vW2pfAf/42CCu4Xif24Tpkfcd6f1rnSas=;
        b=SXW+1qwBDlReDBGKHPaaXgPu+qRC/FcpTE4S1JDYVpMC5BR/TaZmfvGgENg3nyKo+G
         lm+duGUwFEzuar9Xwyn1Rm19I9Sz1DZu7C8PwZglgkXJanAmHH3sBLlrKh/kNhbz03D5
         JR+O6HIyhbRlwvld/sVv4Tppye8dcMxR77FbMguJXmedUF+6Wcv8IXTxsBQfkoEKi0k8
         IapcDjJzcrh/PvFxEmhgrM8/7I+dFLVR3Cgtcyi7hRfodNLkTbO20KRTQmc3Bk4ffQ9j
         M3DtXs9xd9lbAR8NdMf5FuydC/rKGeLGYTcCBwD8GDtPkuF3lWOIFLB3n1Nsh/WraEOk
         odWQ==
X-Gm-Message-State: AOJu0YwMVzIi7Hs1G24ifemejXRT0ObZgPcU5GkZy2FaALVU/Tn7sSO9
	BRWm0JCnGkqPwQUTIXwX0IwAnS8VmEsoa28e5KQeqBG4MW/j5+NbTuddopIKiA==
X-Gm-Gg: ASbGncss03MjzNWSPlmejh/cHoTLG/ravF2PORhoslCEgJ8LVE3ziIAKxiQXPN7hwuc
	h2e+z+ymcxeptKpk5ezeQjrEZngg4GO9Sm0JhKlKifZNgKi21Bm849/MlJIf7TIBENdpYShUImF
	+FPZhZaIsz40AD2PwXeZkpoSqKVJZqnEbZwsNpJMd+I3M8eixuY5IBnOwX1giLfY770wIBpIk/K
	guaUAKPAuwpGznko2M69ZmH0r7suxAAUowOeuq8pKYytldHdhx1G9T2+XYE1tTTk4Uv/umnI3Yu
	59MQ4nhrY4GDJVw14BpkRKBI37AGCwL6TNOTjPcbXIAoBDLtqVccSRv00iRttYohTozFsra6LNO
	25LysVJw9Pk9CxJtya9rEuUACgdUQRGZfgPr9kjCfg0DUVaxxcde5Q+9lHag0B75Gd9O708ffNK
	EEXsAIDxoZKZQIbYWMViWxBoo=
X-Google-Smtp-Source: AGHT+IGj/it8xncuj1iQffV/j/SK61ABVLI8ThJwLmtZxz86eQgzw3s9D+uxOSL7C2ZD3LC5Fm65EA==
X-Received: by 2002:a17:907:3fa0:b0:b73:1756:3718 with SMTP id a640c23a62f3a-b7367869dcfmr27110266b.4.1763057924809;
        Thu, 13 Nov 2025 10:18:44 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b7359bfb238sm118784966b.14.2025.11.13.10.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 10:18:44 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Stefano Tondo <stefano.tondo.ext@siemens.com>,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com
Subject: [OE-core 2/2] spdx-common: Add documentation for undocumented SPDX variables
Date: Thu, 13 Nov 2025 19:18:23 +0100
Message-ID: <20251113181828.508075-3-stondo@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251113181828.508075-1-stondo@gmail.com>
References: <20251113181828.508075-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 21:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226271

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


