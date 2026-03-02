Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B71CEA4E33
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 16:01:56 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.163898.1772467307676379114
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 08:01:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hSXyD7p8;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso39709535e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 08:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772467305; x=1773072105; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4fTb5rAzR7vAaw4A9FaWA2kBpSJrXC1H+XXCcsr/EI=;
        b=hSXyD7p8jS4wVnLQ/kZ/h7fCyOVXls+qI+psaCkVYdx8zCPOPjuMmxJ5mBSxjsuKqn
         0/sX886oEELa6w9vS30T36tXePXlb5vj7+YLmkt5g3UoqFvnK+CggRKvhFTNeMHHe4P4
         6Aim6JuR5D+/FqXn2/InyJEdHFbiNlJobU2PMwscsTbcqYOgi2wB8iK772sdOZhUrHOc
         FOAUmtgwp3ZV2AQ3NN77iv1ZfpUuSif+ivGDXLlgLqGvvJkh44A5UO0CuLPiOtPEhWfz
         2XJkwSHKxEQhTMPHtLbLAdQB8F5+532kFFY77V9d4bSSGedHJSc2EGbzJxhm3bMQv4a4
         EO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772467305; x=1773072105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D4fTb5rAzR7vAaw4A9FaWA2kBpSJrXC1H+XXCcsr/EI=;
        b=sOm4n1tEBM4eTMjfr1pIAY/KONPzAnn+ERG550+8Vu0OXF+pRJ6/up9YwE6nWy8xSW
         HPssl+2vymhbKPcH8tfMK3NKJ9J+9TMSD1HkXgut731lfpZOOnVLllGorCf7481yyVmJ
         id4rRlHOLl3USoy5hZc7I7CH13ir69LLL923Ee+kHp/S4S6QxLifbD3ZrAOgwRuUkB01
         US+3DBmeD8PQMTTEzSwyqnKSmXjXZMKSOMsIrxpwSCbQmYawveIxFwVFkH6GE4XLkr25
         /M9q1SgxxK4BH9MvK3oMVM3d7SXa3u2CU8ZurDD/wxXk8sduHH3TP53cnmeXI0dcxDYl
         MKqg==
X-Gm-Message-State: AOJu0YzdAv/7gwv+NwbAJQ/YAmryoCN5ePSMStL1c6XLWnEAEsEaP2FK
	WWdaX+mOeQoN8rRZC1rn9twONIGJvIBqcQhPt7TdXs8QVNu1sCJ9DGYS5egYNg==
X-Gm-Gg: ATEYQzzBI5YNckOyyiffMhLWdAbSj03UgneuXoue1r3JRHOla4miF6MqOc2RTYLYWd5
	cNSz9catzxjksdH4kEADoAXR/jh7kkwZIMNZcIjbMMqw1FY03K/+wvvcEveD1cy+cNCn+NadQBt
	KUZzlxu7lYINJ4OXv4FCfBPpjTEZihkCFr7hxW8s/oZjE7NhG9n0kry4rkD08ZIPUr/gm2oj7Hi
	UFBbP/2wGfYXSGTC5mSkmNY6o0rnIvGRvlvgg/vX0yjB+lZrmR0eQY5MKpV2oT0jkmWboiEWGqQ
	OyEdxDHEEIgmGARV/gEUtfRm/KV6TuPQJJUYMgqAhEA0P20mV0deA+zBXAsmW8yhsPBasI941qJ
	HLNODJJkFitztuogG9aHVkWtqC/929DXtQiuaaXUjjY28lXw7ApDsT2QnbVLr7pEI6F2hSNkRLQ
	ePnzzhc4036/NMBhh7+6fyxxDel5OsA3RXxEl86GEs4YYsYJIh6zeUNbvsF0xnGUu5MHh50nmpW
	2oI7ObvUn8/oTjmLBj7
X-Received: by 2002:a05:6000:26ca:b0:439:be3e:52fe with SMTP id ffacd0b85a97d-439be3e53a6mr1761239f8f.26.1772467297367;
        Mon, 02 Mar 2026 08:01:37 -0800 (PST)
Received: from fedora (mob-194-230-144-8.cgn.sunrise.net. [194.230.144.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60e40fsm28390097f8f.7.2026.03.02.08.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 08:01:36 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com
Subject: [PATCH v5 05/10] spdx30: Add SPDX_GIT_PURL_MAPPINGS for Git hosting
Date: Mon,  2 Mar 2026 17:01:09 +0100
Message-ID: <20260302160114.46884-6-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302160114.46884-1-stefano.tondo.ext@siemens.com>
References: <20260302160114.46884-1-stefano.tondo.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 16:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232215

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


