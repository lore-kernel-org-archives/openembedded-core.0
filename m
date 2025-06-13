Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BD5EC71148
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 20:59:48 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.7489.1749848380034227301
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 13:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iuhSK6YU;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad8a6c202ffso472366266b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 13:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749848378; x=1750453178; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3V2jFp5oUv1DCd0z3On6R+J4XpuUBSsyUFkW5NXC6fQ=;
        b=iuhSK6YUwhOY3doDlxTPF40R+RMUv22/g6zlyMFs/T+Hf/mz/QGZIy+LoEfOGaQXOL
         IKMJiLKuk5v+xw+GPX09+CB5FalfaQ9J/MDzXsjtuKyIM1n6BSDDRHz4oiOeRsEThHmy
         8T35IcHd475ZjGS0l9opOrwfnoXeVUpLmnMfZoUgBSbJhM3TX/jyCZkC3GDSRCHaMV03
         qQBOg7dzq4k1JpOebvzyt6hOIRFSmik2MMWAxVlE8i0DxQn9Gq6g+5w0ZjWXaC2Q4bpQ
         ACSxQyq/jW5DoLoD258QScepNnye8xLDJ+z8h43kWCXhmWrA0cnhrI3Q9vZdMXNdIQZG
         qULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749848378; x=1750453178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3V2jFp5oUv1DCd0z3On6R+J4XpuUBSsyUFkW5NXC6fQ=;
        b=vnFWp+NxPp/ub4OOUWbvY6TisLNkSaFd0Zq/8j19ua/4AdBdEmEvcpTop5qXYaQpiB
         /BCT6Jz8c2fN8KfpXLVwMWztgOdx7njaxYzeHawqcCXhsbsfJTkVXO7EVdsanukwvX7s
         1J/MhKRSfJSfQX0zFwvDlLSAoByO7ROcOCB8m2SGUmfzG9UQ+rPqir6nhnnB+FtLvC+d
         urNV+UuU4r5xiX9FK+CFofdOUah7PCuOkq0pJIYeJ3yHXP+nlydKIH6MC59tW/37N6QM
         +t59kFk0ZYLX5KWSMcyaVxKNabZ5iLviZOeiiYUVnr3L6GqhLanPKhoOdjyWfpcGJqm4
         1jow==
X-Gm-Message-State: AOJu0Yy2ZXl/Vkv0CAjeyWuznEmScCmMqb1lW0s3k4PDCVvd4y9IGu0R
	M9c05YVLP5a67+pA2piXBty08OOZzSRSLabzEXt5JXXTbWtmyYjR+c4PbOyK5A==
X-Gm-Gg: ASbGncvweVeKULIJCrt8XmEsscv04PzrelIOokB9qxbZ2xzQfrWegttA+x0RUPofuI5
	VXsBbB1QXoq2KlsvJv6GHpxvaWi0g63B3zhqKc3g/iNvSw3jJXhsRKnDREYFP3DJ13gRaiACpX5
	nTcvZ0TyfPYWU0lmd+CYFEq1ZttONkI/P3GlRASJcoO+NeCFj0L0xapVq1/ogCZjN87fcY+wh9y
	eU6v+ouViPz+lKmKQlfN1Pgg7h2if/6/QV4QkCIvkatM3XWxpcwI8DKGXVbmESWgfbZGSkC2QyW
	xql6pCPqVOxjkqfHXr7k0PQ5XHFK8WFrWsGJZkwA9kpG1X+Fy5fTNuQSg+fPSg==
X-Google-Smtp-Source: AGHT+IHbIUX87GkF3vI3hd7dkojvToHip3WQ5fpAIrpS1cSPP3MyAKDY5hKH6aLpNwJYUihs35lHdQ==
X-Received: by 2002:a17:907:3d88:b0:adb:229a:f8bd with SMTP id a640c23a62f3a-adfad40c25bmr62616766b.29.1749848378099;
        Fri, 13 Jun 2025 13:59:38 -0700 (PDT)
Received: from acert-swift3.. ([2a02:810d:61c:a000:5c5e:8cd0:a3f7:8c84])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8159377sm185097566b.9.2025.06.13.13.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 13:59:37 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <an010@live.com>
To: openembedded-core@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
Subject: [kirkstone][PATCH] scripts/install-buildtools: Update to 4.0.27
Date: Fri, 13 Jun 2025 22:59:31 +0200
Message-ID: <20250613205934.332435-1-an010@live.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 20:59:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218626

From: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>

Update to the 4.0.27 release of the 4.0.27 series for buildtools

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic@zeiss.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 8e55bd69c8..cf75d84630 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-4.0.26'
-DEFAULT_INSTALLER_VERSION = '4.0.26'
+DEFAULT_RELEASE = 'yocto-4.0.27'
+DEFAULT_INSTALLER_VERSION = '4.0.27'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check
-- 
2.25.1


