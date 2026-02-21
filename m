Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98ACBC5DF99
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 05:10:23 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14922.1771650620428709587
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 21:10:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hd+sIBVt;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4376acce52eso1668776f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 21:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771650618; x=1772255418; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yp86hc/HGSG2WasVGFlOIGFbOLziWU33WtN9PrAf1AI=;
        b=hd+sIBVt2UtTCsajn86x1RQZLL3XwyEvM1NoK+2TihlHD2N3EItvMx7NMCpmiYhSfB
         YhcG9EXcbpoeu4s5FXL+FA+sN/cBcxeAI8gI/KgZqXfc3xr8BD5dtAuYuwScEGSqeSba
         V2RlOV4iblxwQWIIEQy+gpkMEaBlA2WvgWSzXc1ZGITMdzOB1YUp3GiN/vbeCQ4d87ZJ
         DcpjUAOR4+6m3scgy6HVMJs8hCrlTgbXes96wh+2BTKE/0OurGrCs0AH0X3VbXHdt8ti
         lSY2n+D20KRxiH3A6Xgfk5UEEKiW+oje0rPqGOBsTf+wjOHjidaleMns3CKlByMBf4zy
         099Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771650618; x=1772255418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yp86hc/HGSG2WasVGFlOIGFbOLziWU33WtN9PrAf1AI=;
        b=tKkd/zy5LZcXhjyRPsVQjqth8YEhw3owrbvSLOkIM/owuaKiPEsJtBuqonpIojb+UH
         tcz7p7BL3zyBqHrXw9+yjCwt2IVDO06OHQmIHqDLdjKaWwPAAWn97bfrwUfO8HU8MpGT
         ztEWVW2Ca8XoUKgRGiRHa9Jhmxvr8guioqNgy4i5l0ID2zjD4i3bKJcdGObbbnOj5yOI
         0E5QVi8OPuU0cJk5GNIOpfEnYMbipI2fTZX6ky6WxxwCuTCw8mZJ1QFTqHaT2PlwBGqV
         qp90971Q9aGs4fdmeE4XFLjnwfVPaX2cZTIZ5f2B+aj5FsC1Jw7Tu7VtwYOvEbVh9g7J
         5PVA==
X-Gm-Message-State: AOJu0YwYPk3LZd70bJ/O3rrN2AEvZ2nBsSpcoiXAhvmZCFWky/qCH3a9
	MucuuKnN6WcbjlpKOfe3L1/gLv98P2tEpmS3qowmUczAo2n7a6//v2VWuWSmyQ==
X-Gm-Gg: AZuq6aLPp79ik1jBuC7znYI0kKTFVxcQxegmXha+Mke15nkwh6pOqNVlu5U9pUF8fHC
	vnDXxYpegeaHp1P2c0LjJFeNqDs/uUnYnJoefsd6mshob8YYIhhRb2HL520/vEhD2HDMHLI+zRg
	IslKpNuicaWgMbpKsSlN69DSZfkPADD1IFAlCN4+cvpygx0LOz9faeLU6elwsp5tEa5F63q5lgq
	2T0d39wD6RHJR728p925gmdGdcJzw5n1o1C9mzKfZVfhqFNOQvvH268ggWur7iBxSoRW7c4xavL
	ZFpe8UzfU7WTKWpQz6QsEU7Lgr/Oj/zWVbRCWuCI7VzWOhlJUzMb5yoJtO2uexEAE7W7IHPRNFT
	bbi2Xfrf6QOzM9kYvms+Wz//ZWDTCZMaUuWFAHKL/aBPwZwStblkwD/2o3MHhcr29BZQr/t+pXz
	oaeFdRq3E+32PSDVBipYS7XvtCb9y0+wrNEM0=
X-Received: by 2002:a05:6000:184b:b0:431:8f8:7f1e with SMTP id ffacd0b85a97d-4396f180e8emr3923870f8f.48.1771650618323;
        Fri, 20 Feb 2026 21:10:18 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bfa1bdsm2455901f8f.3.2026.02.20.21.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 21:10:16 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: stefano.tondo.ext@siemens.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	jpewhacker@gmail.com,
	Ross.Burton@arm.com
Subject: [PATCH v2 05/18] spdx30: Add SPDX_GIT_PURL_MAPPINGS for Git hosting
Date: Sat, 21 Feb 2026 06:09:53 +0100
Message-ID: <20260221051006.335141-6-stondo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260221051006.335141-1-stondo@gmail.com>
References: <20260221051006.335141-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 05:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231585

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


