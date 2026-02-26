Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2497EFC5915
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 12:18:50 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68800.1772108327274062205
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 04:18:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J3dbB6cI;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-483487335c2so7370005e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 04:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772108325; x=1772713125; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yp86hc/HGSG2WasVGFlOIGFbOLziWU33WtN9PrAf1AI=;
        b=J3dbB6cIWMQ8Bo8qK/SGqacddG0ZYffunsdNAx3w+j/Duanrdmx+q1f6sbsqyJ3c12
         Vy/JOvE4BDcv0REgMSfu76LKRcNrceIrpIOPP1t6K0BRYAFyxcyhL4JEOP5bT72zBduQ
         wKQIZz2xfby1cRlTmWLDDu1G9V6Ah7QrBPVDhlIMiUuD4wGNrGaD8wpuH28Wev4iNYIZ
         VOTkYWebb3ZVu4fF06q40e2TWMYkODKUzqp0trQ20IWqa3LIWNrMlTo36DTwq6SjK4yz
         1tBQzfuW4/6QDdlsZIsUwSJPjcT7o8F9URAatFPn9Cj+oMDd+DItZMnDA/JSIqfMebqZ
         6uow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772108325; x=1772713125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yp86hc/HGSG2WasVGFlOIGFbOLziWU33WtN9PrAf1AI=;
        b=CIdzd3tLFzXfMEHGeDJy/deQ0jLfLAvKrnuOxC38zoFJMj6GJPDOeXbjY+7aquW4Ec
         VSuXJcEsi027VbrxKkOShypWDWrZ2DE6B7ascon5KMoWzZtcTSRdI/0GATABpdab3dx1
         PKorl+0vCCDIoU1Zf+fbWJBA7eV0pubvW0z3JNwgsDmS5i7tAnwQYgHBmUJxan+fFBli
         5tLrtp0GKwX+Sg60Oogrr/JKtcoLDckTR7/cbl5PdJ0KmTXgAjXGpH/CUTtVuCUc5ioh
         Pd1pqJ9eFGq+v0OAN4M4LC6s+90NsLlV5m2FMHjcSR8UXbtnXwRXEaXwRzB0jBx0PANR
         hOYA==
X-Gm-Message-State: AOJu0Yya00GWrwWnCTFIwSZ5Eq06RycZmC9q5Nw5Go5x9hx6PgmEadEy
	nYxd3IoRgzNiyGgjNtJ3Tt38JiCPZgtpLeh4mgM3edJKif8SGqjW6wwM46cQwg==
X-Gm-Gg: ATEYQzzEnKYsXDOCxW5Cme3Sf7vWReUZ8uqRWYkVCwfOG6bxebemSJMECB5ZZcHmZNV
	ntjwH0iTWmZYoojWxtcOJd0vasite6vgCFo+Z1xavjmuVOFaum/WQwMc/HCGzcudCVs1ysk/ZJk
	m8IZpU2vyJtva6P9THXxwMqeqy2vmbG0SwAyhAfrlr8tT3raZWLXG6A0WYaAv6BHEM3y8nQ+JU+
	BhvmyelvGF5RjuAQxTBz6cW4uWzwZPKp7Bm4DOXKgM+UQynQ0Ib26gljLBqVya8BmHZDDIpZlWH
	R3C8At4uheTNsPYDthe3xam/BA17BJt37jpNoqmSsqa+wPqzawfkokM9lE+Ff7tA5xKlOZEDmd3
	vWxPS4+THpk36L0hFYM/H/9NqWurCJ5HYLuSnsGTahJNQC7rhGAx8+v0+qs0M9D1CwsQFIpMIlM
	wN7fL0GA==
X-Received: by 2002:a05:600c:4f93:b0:477:df7:b020 with SMTP id 5b1f17b1804b1-483aaa15e35mr351948115e9.18.1772108324542;
        Thu, 26 Feb 2026 04:18:44 -0800 (PST)
Received: from fedora ([165.225.94.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb77466sm48483955e9.5.2026.02.26.04.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 04:18:42 -0800 (PST)
From: stondo@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	jpewhacker@gmail.com,
	mathieu@bootlin.com,
	Ross.Burton@arm.com
Subject: [PATCH v4 05/11] spdx30: Add SPDX_GIT_PURL_MAPPINGS for Git hosting
Date: Thu, 26 Feb 2026 13:18:17 +0100
Message-ID: <20260226121823.149327-6-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260226121823.149327-1-stondo@gmail.com>
References: <20260226121823.149327-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 12:18:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232010

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Initialize SPDX_GIT_PURL_MAPPINGS with proper default value and
documentation following the established pattern for SPDX variables.

This variable allows downstream layers to extend Git PURL generation
to additional hosting services beyond the built-in GitHub support:

  SPDX_GIT_PURL_MAPPINGS = "gitlab.com:pkg:gitlab code.example.com:pkg:generic"

The variable is:
1. Initialized with ??= operator (overrideable by layers)
2. Documented with [doc] attribute for bitbake help system
3. Consistent with other SPDX variable documentation style

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/classes/create-spdx-3.0.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index def2dacbc3..9afe02dcd6 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -152,6 +152,16 @@ SPDX_PACKAGE_URLS[doc] = "A space separated list of Package URLs (purls) for \
     Override this variable to replace the default, otherwise append or prepend \
     to add additional purls."
 
+SPDX_GIT_PURL_MAPPINGS ??= ""
+SPDX_GIT_PURL_MAPPINGS[doc] = "Space-separated list of Git hosting service domain \
+to PURL type mappings for generating Package URLs from Git repositories. Format: \
+'domain1:purl_type1 domain2:purl_type2'. By default, only GitHub is supported \
+(pkg:github). This variable allows layers to add support for GitLab, internal Git \
+servers, or other hosting platforms. Example: 'gitlab.com:pkg:gitlab \
+code.example.com:pkg:generic'. The domain is matched against the Git URL, and the \
+corresponding PURL type is used when generating software_packageUrl for Git source \
+components. Invalid entries are ignored with a warning."
+
 IMAGE_CLASSES:append = " create-spdx-image-3.0"
 SDK_CLASSES += "create-spdx-sdk-3.0"
 
-- 
2.53.0


