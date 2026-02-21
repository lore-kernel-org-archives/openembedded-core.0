Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08C9BC5DF7C
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 04:24:33 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14400.1771647869690499754
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 20:24:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SaZ8IrSF;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4836e3288cdso18474415e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 20:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771647868; x=1772252668; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yp86hc/HGSG2WasVGFlOIGFbOLziWU33WtN9PrAf1AI=;
        b=SaZ8IrSFaYMQCt1FxYyFmc9KMZVqF3WKYvOKjshmXvnarpNj1WA2Uqvvh6337xdXLx
         iBUzOq/pSMwI50DFkE7zU+MVeewYChB42Nt+KExMzCJC88SPSp4s9BErmaljAvnoZou+
         4UHVUnTwUGsmvwPkys3m1L/V1uMjiE6jlBgsG+nelEyMU11V9PrMt23nIcqOVJiS5J+8
         OxMHyHuLt20i5NvqgofNlf8u0XvUmxT+zNFTQzbSwdJIZfIxySznvfXoYKh/T6Ob2Lcz
         mMt1/vmP0EHkFo/pF/7caFMTLESGAYLSsZYTC6d3aF0zXeCRzUS//x/BBxeOXtbyl6bP
         rDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771647868; x=1772252668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yp86hc/HGSG2WasVGFlOIGFbOLziWU33WtN9PrAf1AI=;
        b=vmTAXZDDQJLHLdkewoYqotVFLx6cCMmFTrMNOfxRnUz0Hme1sgKPzVBbOxIzZbwlHm
         QwCzmc1OkXHljvUsof0/3Zivno6IAnpmMpZBnbllMxMgMk7gkaXXPO8Qe67fUAVFXN5+
         ElEVyaq64ecH8hvEd9EYqQR7VRGmCBG2AroCmeEIgpKLjaI6MQr9OsElqX7RR1MpN8Jn
         a3v/jim2AZ9Hv05JVMMh34frAXEX007yO57d895+PDcMHKRvrcbxBs4z/95vbMwmVkDq
         uAQlDqzBiwi8c3U46R9oymQoC4U8A//6B7ZHIuy2egxfFXbmUmjnv65mfcNaOBki5M/D
         M4ww==
X-Gm-Message-State: AOJu0Yz0wPQ5+XjOED+tjHWiEylK2rScmhf5fPADqc11nPeCUudzoeSx
	JzyfvaHRFZF7pQNvJfhmVGNkQyAbiObSy69GnDh8DP/0Y8pjq+Ok724D5COjDw==
X-Gm-Gg: AZuq6aL0vLx0LhhSorHHziqyWgSYBVoXjIrM4rmwGQbdMskUQ+bOI2fxKk28mryAtaW
	Gn3PSaTB9FqWKk9TA0m5iFaMGxLKwTZD9DymPDqzVr000lXuWQGPtDScfLK1JC5a0sNH6k0ecfN
	m/HoOx98DYNJGTUPuo5sloKBOUzKrAMkl1KJM1ocEgK0+amSSIDEcu8jPJBxY4w1YwUOFXbqZ1l
	C2wLBP5dyWQLdjxj6xreuXs3HNgLvi8Jt322+rlnJWsgev2jcfpOCvpOQDofK6eyCdDhRgZLSXB
	PXniKx0su702Vda8ENLuO7u3EfjtMHfpwuqVx10tnVfdH2SeFPapkBQ7dDaoP3J181JKJv5775K
	d2Tjg+vOcNEdCvcXSuNE0weR1WxZJ45gIDqJEEPnYCBdt1CQA/TyXEUMHgs+MLEvFDNQMlt2BrN
	td78bZTPdJ+zHDyQEX0gcNpslwRs0o0YxeNPw=
X-Received: by 2002:a05:600c:358c:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-483a94a0b4fmr33912125e9.8.1771647867696;
        Fri, 20 Feb 2026 20:24:27 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31ff4d7sm117340865e9.15.2026.02.20.20.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 20:24:27 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com
Subject: [PATCH 05/14] spdx30: Add SPDX_GIT_PURL_MAPPINGS for Git hosting
Date: Sat, 21 Feb 2026 05:24:09 +0100
Message-ID: <20260221042418.317535-6-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221042418.317535-1-stondo@gmail.com>
References: <20260221042418.317535-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 04:24:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231561

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


