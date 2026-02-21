Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5BAAC61CE2
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 05:10:43 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14932.1771650640849912534
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 21:10:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KbUE/lhT;
 spf=pass (domain: gmail.com, ip: 209.85.221.68, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-43622089851so2689049f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 21:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771650639; x=1772255439; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zx5rmQ5fTfGnac+a9YRTv7cUjnqdXyFSZPZ2VVQ5hxs=;
        b=KbUE/lhTT4mHzibJS8FRv+fmEdIrlOEVlT86fiiz8GtKkBxHYc51K27SQk6ADFybQ1
         HP08gJ4LrwkH8XxvrMQWybFJrrjCyWqwZYgteSy4FdEi3rdCEA9gBanLzkiDgq5oIGbQ
         lRjGbhONRE9SNbvI3DzCoUN+JssRMLIaV7kSF1887f/k4gRlxHFRSOBHlZTfn+PTHv2W
         kTyuZT3UcHi6gVt5xdY+p3NbDx4RYAReqJYhrfCDvvkOZa2PSod+83Z88YErUQ2gFdtT
         NBRny+8kfE+4e3PKwLP4EzxulqVJz1eL2LpV3BNkQp2yhcd3giWnIncrHXbv8r6eXYsw
         MLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771650639; x=1772255439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zx5rmQ5fTfGnac+a9YRTv7cUjnqdXyFSZPZ2VVQ5hxs=;
        b=Tr7Vfe8IM07kA7K/cP9v2PYZI/9RPU02hz+kg7VCsPtO2c7Zk9AGGgjNg/Sw3FGCS7
         Ih9iQ8+dU2E5gjyX1tOOYIk0AxyH4w+kYqsefJArH/7Q9XEZVdcm5zsAqPuTGZWW9HQV
         8i4l+1yYCcPrhIYfUMB7ddBv5z49Hm6V9/rrKBkwWe7Hf5hle2X6PJbG3ua4AOYFqzPo
         4iIMc93ZINkeAxJy1aEiingNFvWj79M+PFoZAolXNQOwZ0pvM6xc3oS5qDa26v/uFwDp
         ODIE4dtLyHz+6fcf6ccdoGYWjigiYR72riaaWsrA+MXPohaXMq8kNLDmQDshgCuCFWI6
         rrDg==
X-Gm-Message-State: AOJu0YyQuOt3Efx9MiQ2lH0eNb5fuUM/030Vb8qlJsBALEpewmM5IYWj
	uVpen7QZy6jQYc2R+7qAWVc//YklyaAfElGVWru3D7B682ThHv1GPgTyVFuNcKlB
X-Gm-Gg: AZuq6aIdeBPd3/l0p3NjAvfwBOuTV/UxCe5IGfcv/s6tfHYfvfoyfWybtNtZr1j0hiw
	KYqupYZcY9YrxflEeZxLyv/JGf0rzlOkZvV9oVC5PAQwVlmJFQNb1wNWestCQN6gbPDe9k1eEa4
	nVjmYAvIrZMOqqwOROGg7W4i93bdq6zqmg/KnuQoDkeru1jboHzCWIMm2RQ1vKWE8Wicn5tInFH
	0JtE4pCbDEwHhgE46LF66Sw6XuEiTbCjb8+FqADIq0NyGTCu5vI4YcydoZV4DKqd+GudLYX1m1g
	2+D3m5RJGNNx/RuyUlCvHlhhhAN6+nJPKKLvtRoBHcDfcv7iJTttCj75TwGpvX/NjTMYTZsGz4r
	U2fjePwcbU1O4NaI4Uu3R0PLtTGf9BWUcYALQnFMzliXZlLeEJcNm8untrkzr5oTiWVh5IyBtmP
	YyvXcWfjbIJr1tuvD7MNU2cUVUSbAcn4jtdiw=
X-Received: by 2002:a05:6000:3109:b0:436:d9b:cd02 with SMTP id ffacd0b85a97d-4396f113220mr3636955f8f.0.1771650638840;
        Fri, 20 Feb 2026 21:10:38 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bfa1bdsm2455901f8f.3.2026.02.20.21.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 21:10:38 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com
Subject: [PATCH v2 17/18] spdx-common: Add documentation for undocumented SPDX variables
Date: Sat, 21 Feb 2026 06:10:05 +0100
Message-ID: <20260221051006.335141-18-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221051006.335141-1-stondo@gmail.com>
References: <20260221051006.335141-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 05:10:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231597

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
index 99f0704caf..3d13650962 100644
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
@@ -66,6 +89,9 @@ SPDX_FORCE_RUNTIME_SCOPE[doc] = "Space-separated list of recipe names to force \
     into runtime scope, overriding automatic dependency classification."
 
 SPDX_MULTILIB_SSTATE_ARCHS ??= "${SSTATE_ARCHS}"
+SPDX_MULTILIB_SSTATE_ARCHS[doc] = "The list of sstate architectures to consider \
+    when collecting SPDX dependencies. This includes multilib architectures when \
+    multilib is enabled. Defaults to SSTATE_ARCHS."
 
 SPDX_FILES_INCLUDED ??= "all"
 SPDX_FILES_INCLUDED[doc] = "Controls which files are included in SPDX output. \
-- 
2.53.0


