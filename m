Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54DC0EA4E2F
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 16:02:06 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.163906.1772467324140080840
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 08:02:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cIWmeu55;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439a7b48df2so1719575f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 08:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772467321; x=1773072121; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APgPt1b3/IjuPqB0PdlFtsUlW+yfBhfmpjSOGki8RFs=;
        b=cIWmeu55Eu3NWHyudPhq9R4QFMdctyAmihEhQvDj4CYYNRHsjt7hLwjS3b/cg11/rX
         5x1CLiglXb0TWzKUubemh9c21WgFigqmt63ovNp71If4S/k7PfQxwQJEhaL9vr3GC74S
         xhlh13A4wB+26hvrxXweLw5/EqzFZBUyHjmxt3INvYx4XO/hpA3Wg5/AUfj4hX+cJ5q8
         hP0hmZCN0ZYDksRKNZtAOEVyW24tU460gp4XodlDcWjwzpqikGN1D3ULdv/EkCFzuN3a
         jN99vsOQb6BN/IKYPdHU87L6w5FTwOVKrNgMrTkWVIfpqaP6K0cS+18DthtBEIaG4yxP
         YNkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772467321; x=1773072121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=APgPt1b3/IjuPqB0PdlFtsUlW+yfBhfmpjSOGki8RFs=;
        b=mErij8S03WdpTdbMLXvJgjjQaHdNYK41rX8zPRieyVTWX6SHVxSCKe2RPGGObOBnaT
         k8Qw5vhD5Mfeb/jN7lh85pA1ST6YOIS7TOOf+V7QAngc+k8Tcur47VpBHGVlEXopoRhj
         BMqO5cnFHvqYInKV7LTxwB/pRi/GSNvvqoSyZMF3s2zNB9CH2Spg58LHscyGgIGovRmM
         uWXTz49NCkMisWAhwaA9MI3xXJfXQqoIKXrKU1ChCPCioJiINbTaTj8ODAVh2iRPqcDk
         CfLN3xVcUeGRzxt91X0eJs+IX91rJEFuvoNNNxaofxUnSB4zxDIYnvKMWPlRWmIrms7J
         wTsg==
X-Gm-Message-State: AOJu0Yw31/8MDvBiwY6UivrbObUHiOAa3lXAfXb3tWffnvzwUfdqiAju
	D+bVLmsgzEjOJsJjXP6rIufCTClQusZFdHh6ugm5cpajXY61kmE2AE/L0+q0Xw==
X-Gm-Gg: ATEYQzy0fe21KdK+n6+tkGCJrTvKlOSQbLRqlap/jzOyh/Cgke+5QikJlYtLaaibdyR
	czQ2KiJdStcMUHcZFjPf9Z+5R46gYktmM+/2d889rpuHxI8U6onhjQ+PsHlKzSdWZlOI7G9jO0B
	Iyevwcs4RohT+/rR7gGRwBHLil0MT6uewbj/Fl9nIq1h/naR6EmcYvjD66J4SzKiKi0P42IV5qa
	J9ZfRuBSa5RkHw4wM6UAWwBXWakXXamxiIg2jKPEmuxOoIo7CAWsFHo2ZS6BdC23dwy+POEEc//
	9WGDTNnDk5jtGSpfbuxI7d7NzXxwyfTz75UeWVqdd54JMbSZNBMJV8WVNVXpOT7d4vJn6+H56Kx
	C087L3/YWLG6bASA+Gn9g3cmeUxYtFiGeFGp9znhEDzE+poP+EDmKoy7qRHzyQEoi8/e0MAUqMs
	WnFvt0WRJKdJMwt6C1fkuI6+9nTsRmncMULvfm2tbInqk2vkqMvKMS8seiY117Ufvg8xN48ho1/
	x+LBy8A9AJoyqXKZVhG
X-Received: by 2002:a05:6000:1acc:b0:439:b114:60c0 with SMTP id ffacd0b85a97d-439b11462f6mr10743191f8f.35.1772467311774;
        Mon, 02 Mar 2026 08:01:51 -0800 (PST)
Received: from fedora (mob-194-230-144-8.cgn.sunrise.net. [194.230.144.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60e40fsm28390097f8f.7.2026.03.02.08.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 08:01:50 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com
Subject: [PATCH v5 10/10] spdx-common: Add documentation for undocumented SPDX variables
Date: Mon,  2 Mar 2026 17:01:14 +0100
Message-ID: <20260302160114.46884-11-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302160114.46884-1-stefano.tondo.ext@siemens.com>
References: <20260302160114.46884-1-stefano.tondo.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 16:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232219

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


