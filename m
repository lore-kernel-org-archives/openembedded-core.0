Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8106EF0183E
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 14:00:18 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69537.1772805613259163402
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 06:00:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VM5RcdgT;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48378136adcso55723585e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 06:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772805611; x=1773410411; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4fTb5rAzR7vAaw4A9FaWA2kBpSJrXC1H+XXCcsr/EI=;
        b=VM5RcdgTN5rh3k2GuQJ+7y/PbHUPNfzDMLQJnmgsoMLZNfpqszoMuNKMU7/IVEGwYT
         iSj6nqgcOS9qNfHgDmmEvwZCY2fpWq2xlH/WHjmjCQRrHfxSlcOrMZxJX2wpsUxpIU7v
         WCEp5HxTmHLdZOQtxBDiSEmO9D43ohiBTo8+loC2qTDno5/F0nCmdgUz5lX38yvSoodf
         8pErY0+Ij9IgUEXxmY6qV+cDdLXr9BijEIm5a9Z+nfZP/p6PyPc41PNXLf/EOKP5HIaj
         gqI+d/TMvmNowLpE0famTK+HZ7bNpzQfceNfzQOJ7UQq/VRWzthxza6MXM0j+KF/xbRd
         zIpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772805611; x=1773410411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D4fTb5rAzR7vAaw4A9FaWA2kBpSJrXC1H+XXCcsr/EI=;
        b=vTVwTsOCTO5nW/UlqzUEresRYrqSdIeCTZVoEFwqyAoeTiKldxwFK1wWzV7OWF5mSZ
         /mDSrt25x75iObVrLVlHGbB0FQ+dGyzrab+XD4FR3Fduz2Pyi3y80MZFWeQD0ajZ1z4P
         RoTDat+tV6GLvCuD6+lLknBA+PF3lF6r8L0oLt3bh+k9tdBTwwHDSLb2E8T3WzVeAP+7
         hjnBFQR6Dn8qZO7wD3AhXSNr2QW9Knkiz0KawBsyCjJIXQG9z+nFm77RgwpDE1OFhlil
         v8nft0PnmmxUUCm2mjYW18c3nYCcpD1jbyYcn1Is1bseUtp9Zl9xCnxX5yVYOXMaMya4
         iYqQ==
X-Gm-Message-State: AOJu0Yz72S8cmzRY4Kn+FdeBG4JfP3Z1DMM7N8kO7O9GEAuRTJnx7keG
	2Xh0hoV1iKIRjUvxS/h2UN3kuQJLDYKgP4IaDV11LKfdU5UI/8FZKjgHfVkEyQ==
X-Gm-Gg: ATEYQzxrkdsnn22XThhqgghyh0hU68QHQ4fiSTqObpN0hp0nY9VKhqnz13DKhm85eFI
	MUsaQQ6BOQKw4EQg93COtr1w0LsKSgxm4m4GCsdkNhlZ1SRbrcWNT00xPQ/z6yTuGFujR5c+RUK
	b6lpTRPADWnUIogptfze9wljqddjgDBJ5A68IR8d6BqwbO1VG7klxhdaC4jyFD7eS+TjOn0zEMM
	JxLUlASyoCihADJ+cEsiohzFbfiZyJV3TuC7KiFU7lfgFbB1X+GeomXb6HeXrk+0BsiJgH2YM+Q
	hn0efng9FB+QjVsDdLT6t08KHcbROnbkjy57biqKPA/4mHQUaoISq9fQd9KQuw4iRBD4/soKAwK
	UYdS6EIMyjfhFJySX0CxiYr/IrTIzAx1aPvPcSr75T2xm/qxxZQ1nnvvXUC4AnReUqrWBME5mFF
	wxntTmclufL6D7JDMoI/8KICcebgTK79E7J0jqzqlDR0pRDYNXym2Y
X-Received: by 2002:a05:600c:1991:b0:483:7907:ea02 with SMTP id 5b1f17b1804b1-4852696b72emr35211385e9.16.1772805610765;
        Fri, 06 Mar 2026 06:00:10 -0800 (PST)
Received: from fedora ([81.6.40.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb4257csm187098845e9.15.2026.03.06.06.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 06:00:10 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com,
	joshua.watt@garmin.com,
	ross.burton@arm.com,
	adrian.freihofer@siemens.com,
	Peter.Marko@siemens.com,
	Stefano Tondo <stefano.tondo.ext@siemens.com>
Subject: [OE-core][PATCH v7 05/10] spdx30: Add SPDX_GIT_PURL_MAPPINGS for Git hosting
Date: Fri,  6 Mar 2026 14:59:57 +0100
Message-ID: <4ba69a9237637db44628176a35ef2268b0f14682.1772805096.git.stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772805096.git.stefano.tondo.ext@siemens.com>
References: <cover.1772805096.git.stefano.tondo.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 14:00:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232571

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


