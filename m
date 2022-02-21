Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AFA9C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 01:28:25 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web09.5671.1645406904289007387
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:28:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Avsjr2S1;
 spf=pass (domain: gmail.com, ip: 209.85.214.175,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id x11so11610825pll.10
        for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2+jhuDVk42cblSxhdfHN9JEWC7uv4FiBqTZZvGgFJdQ=;
        b=Avsjr2S1aJK6EWjaczjO4JrgRrLvlLrZGFY6DrAheHIIpn5WJ7w1QmJ+ygLn5lC05R
         d2ypspuAqebuxDYBOcXxe70CRMPSV5PkXDWspOlw/ybm5r9RWvUQFkRppHmZtAXl/4ZS
         2pIH1J88VrkXi9lkjd2nOM6b8Vui9/13KPMCf+0QMGvt1P4oqaVESS3yW0XymScNWQu4
         YMqUvQ3py4/XBM1ds3NfKs9EO3LCVQXKonyqnYYKGg4nJNbmuAMX1D8IXzkpKRiwLgas
         fzqpKNsXW7SC4xAqzW1QvLE3Qc7CR/PNWCH8XyqmWoHVi3UXdpr8Ah4KCPm+1vb89Y9w
         rQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2+jhuDVk42cblSxhdfHN9JEWC7uv4FiBqTZZvGgFJdQ=;
        b=4M4/t/XZ0koMsR20YlYRDUv9ZccN6mPV4PhiPS/VDbWihy/mOIfBXnX+C5Qv783vdr
         uCoIBogG4Gi0CjfMnu7PJ9OiDdBMRDunCHPRzbKiRgCELVosYHKa5K30tszViWy6W1R+
         jLuhFvotWNmCvyzGFpG9tIVRtlxUOq3lUKsle2yevHuGB5tcwTQjQSUZxEXVrRSsaoT8
         qFOsFaXfNm73rvfHsO2bh1wtG5kNPEsLPDl9v4RuDB6MGbRKfQDRlyMu+MiB3nYLlYsf
         t5NQXFI8fOSH+bWIdwJVFG8vh2dXfhUHF7uIjY2LG0/jDC/wtkbXlqFO0V+hWy7QnHM4
         J7wA==
X-Gm-Message-State: AOAM531wc56l0/4F/W+Qq+aXYKpIKNpVmMGKO1WnJtlXTqXpKTt1NTsH
	55ZwE+YPLHSX3v2TaCNTEt9OmD3/az02zw==
X-Google-Smtp-Source: 
 ABdhPJx7nEJIwp69vlJEXcr8TWGSSv1tiQqqvYsLciz2HS9lWFFstBRRZHdzVw/9rt24syNCgIowDg==
X-Received: by 2002:a17:903:11cc:b0:14d:a0d5:76f with SMTP id
 q12-20020a17090311cc00b0014da0d5076fmr17108782plh.109.1645406903368;
        Sun, 20 Feb 2022 17:28:23 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:f2b0:3951:ce8:8dfd])
        by smtp.gmail.com with ESMTPSA id
 e20sm10252937pfn.4.2022.02.20.17.28.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 17:28:22 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/19] python3-iniconfig: inherit setuptools_build_meta
Date: Sun, 20 Feb 2022 17:27:43 -0800
Message-Id: 
 <8dfb9fd2cb1a938dc8e8fc27389320da040de8aa.1645405471.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645405471.git.tim.orling@konsulko.com>
References: <cover.1645405471.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 01:28:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162006

Upstream provides a pyproject.toml which decalres the
setuptools.build_meta backend for PEP-517 packaging.

DEPENDS on python3-setuptools-scm-native (as declared in the
pyproject.toml build-system.requires).

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb b/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb
index 6b3359712f5..5338980e699 100644
--- a/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb
+++ b/meta/recipes-devtools/python/python3-iniconfig_1.1.1.bb
@@ -7,4 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
 SRC_URI[md5sum] = "0b7f3be87481211c183eae095bcea6f1"
 SRC_URI[sha256sum] = "bc3af051d7d14b2ee5ef9969666def0cd1a000e121eaea580d4a313df4b37f32"
 
-inherit pypi setuptools3
+DEPENDS += "python3-setuptools-scm-native"
+
+inherit pypi setuptools_build_meta
-- 
2.30.2


