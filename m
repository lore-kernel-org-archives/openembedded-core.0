Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6380EF901E
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 17:05:57 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23519.1772643955261610600
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 09:05:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=axtXn7Vz;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4833115090dso72671485e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 09:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772643953; x=1773248753; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4fTb5rAzR7vAaw4A9FaWA2kBpSJrXC1H+XXCcsr/EI=;
        b=axtXn7VzhnF3Me5eWnLQGOsEh2fSLsU0Rizj2Q2aTnLdZ2lUqwvZC4Lu5aJzB9KzVo
         BRxkMfMSB/98meBkbTPo96sc9rIGzq8TeY5bGtt5Xua5vXnM8tdorhwXun7ktd6O8BRe
         0LYu3/1qU0ZWsQ962vxYsrEAQP0V7hMIGbX2nrYfxYgaWWf+VbQ7lXTPduLzpXHMh6W4
         9SY4KRmzx9XebMCdHgtKLOlBpzNA57wMRaDGxqupcMcIcuYB2Tzx16ElfYVEPgNdGY9H
         0AZlLAqECmLmPDhr12LPTqqAWOEtdtKg5VaJpVoB7xmAGfiUyOs8DRl8XbTo2AorfcET
         YLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772643953; x=1773248753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D4fTb5rAzR7vAaw4A9FaWA2kBpSJrXC1H+XXCcsr/EI=;
        b=TJAY0bpaQKP2aKxcmtsoGaxUtfvPlakTZlu7htTM/XHycPGXl4DZaXp/HJO9Ud7qMH
         KeLdesqdOQ5p//dzZ/YO2GU0zL2rFN1FoW8RySJw7Af+Q1ysp4sDc2pQBdNCTAeBi1Nf
         amO3Pzsy3u3xlihQKiXXn9055Gx3bRBTQE/+fXiA/2yYmUCHeaKpKR6/wLrkTl6ULbGu
         SpRNMrpv2GlKE6db03/s7L0qu1svboAmkWCjo5P+p1R+pEc5pFRrrQqb6iryd9OSNxn8
         GcNDjcMhPPWnRXRJ88XmjLLsnUsTpI2mFC2Ctben0KqxORbHsN//YzNKzAdlROSRlx/J
         75eA==
X-Gm-Message-State: AOJu0YxvCRWJQqojIf60my08mF+r+CUXQ+PejyENxnPHQ2dlgK2Vsx3t
	jMJ3EqWChO+GenyoDG4yfhWLFaQvmMKQxTLVIUceqOuCxYc8o1JUNf7HXa8njQ==
X-Gm-Gg: ATEYQzwe4Gg5fmHViSIO9sEsJVhyPOsJzIBz6XBz+Dtu/dYbs8IYTjFewuLD+wn31o0
	Eu3bSI5COo3enFB9xpkfV4NHytraoJRxPNFuyxIFBraOG52Alv+U1s79TC718gPImCbXC7hV3JM
	BznPzNkZU7QecWzVmeEuIEtSWo+9PKBAgBeg57/t9L+qiC7yVcC8RYbg/iB8iAUdKgEChRoaq0l
	REMOX1r1lGlqaN4YB4ORyhWLUE6bLvw86cU5Ocwx9CNnM1dOYGLQFw37M3m5PLh3txWL9UNNfke
	gQlkU/53Mo6RHmTdn4syX8vnDQ8v6o1V0+2Lekbw1s6QK8wE+97P/6OKrWqw2QE8tiCDKsyQSG/
	PQVcXg1QqD8h93Yh1WMhcYvFGus6ihU0LCb3CWq4McIiYUh/AvZ03Cafr17GKIZUTEjw63WWmDQ
	k9Thx7d6ZKMVv8bdUzMsknZLg=
X-Received: by 2002:a05:600c:8b53:b0:483:4807:210c with SMTP id 5b1f17b1804b1-48519895593mr44227695e9.24.1772643953116;
        Wed, 04 Mar 2026 09:05:53 -0800 (PST)
Received: from fedora ([165.225.94.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485188914ddsm78557395e9.12.2026.03.04.09.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:05:50 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com,
	jpewhacker@gmail.com,
	mathieu.dubois-briand@bootlin.com
Subject: [PATCH v6 05/10] spdx30: Add SPDX_GIT_PURL_MAPPINGS for Git hosting
Date: Wed,  4 Mar 2026 18:05:36 +0100
Message-ID: <20260304170541.180868-6-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304170541.180868-1-stefano.tondo.ext@siemens.com>
References: <20260302160114.46884-1-stefano.tondo.ext@siemens.com>
 <20260304170541.180868-1-stefano.tondo.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 17:05:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232408

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


