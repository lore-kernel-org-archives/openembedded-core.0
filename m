Return-Path: <alexandre.truong@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C49C41513
	for <webhook@archiver.kernel.org>; Fri, 26 Apr 2024 08:31:24 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.8976.1714120276392315275
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Apr 2024 01:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=K17BPqhJ;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: alexandre.truong@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4196c62bb4eso14219265e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Apr 2024 01:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1714120274; x=1714725074; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dGqGJtaqIblRi8yVkhtbVK5U/VR+p+93zhYpy5JpvmU=;
        b=K17BPqhJtm+dRUN1amjZary1EUT5Of9tMFOAvgWrSCm4mIEUJC+KqqLglMH4wkN3Gy
         WYk78G8lG/6Tyf+DdhMZ5t405S9f3DaHE7DDP4a5p4hEA7U4tuUnVwyUQsECKAkIzITn
         wMupUS86UoycxjROnhSOSqkpGwXOyS6EVGCSryLvYb0pOGPEi6TW7WV91PaE6s9UUgla
         /x8MrJJlPxTzhlSo3oTbp17SoS3CR7eZ7STJlJv4PFJ6vSGm91+Lbg94b/Ec335OzSAk
         QXuQ3AMZvd6zob6P0XRH4v/D8P8rXVVXr8aO9PGJCMjeWmyGQLeId0jCcogw4l+bN/du
         /jAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714120274; x=1714725074;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dGqGJtaqIblRi8yVkhtbVK5U/VR+p+93zhYpy5JpvmU=;
        b=Ci/4HdnA1guwuzA4YDLFtPzjpPRkjTF99WnuzDhAE6wgMswVHkFsg8TePMEei7jhRW
         RNVC8VBWMyLmHQ7m1wTvEPweTbgUBYq93twjfLaO9I8tivliXgK1YJLQQHlw9dZRjqVx
         hGnX8pDaI2azcxkzTy6LL3bcy004Wzo5hdTZ67q5lq+7FcYAl7c69boy/7nXpo8hzkDp
         +EM6GDG6sogp/7D1b/cwsFRKSDQvhf26QOmTp5zhJc9wtlSCMhe8+JKyYgPQkS9J4MLv
         PorxyviqFkdlQSTN+plaQDzVSXW/f9gvoYLBt2Wi/Y/jZGKoBnOr2ffxcSAeg/TrW1zJ
         4/RA==
X-Gm-Message-State: AOJu0YzgqqX09jeeio7TDBhcE3IFOTBSGr8Gf3dtylO/AeE9f94EMDwN
	JTvZ7vFoBRTcZtqd+MiG/hJqQxpoKOeFFheTZyODNjqBMdouBhfPAHigUCPhXfWNch2jRSM/k+K
	p
X-Google-Smtp-Source: AGHT+IET9nUAjHMF81K0U3P15U/2urANDQF44xGGEl8rwswt0MSH55DJ2IVQ/W4ipM7bOnPbJRfciw==
X-Received: by 2002:a05:600c:470f:b0:41a:8374:7eae with SMTP id v15-20020a05600c470f00b0041a83747eaemr1492889wmo.31.1714120274263;
        Fri, 26 Apr 2024 01:31:14 -0700 (PDT)
Received: from P-ASN-MOON.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id n4-20020a5d4844000000b00349f098f4a6sm21685496wrs.53.2024.04.26.01.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 01:31:14 -0700 (PDT)
From: Alexandre Truong <alexandre.truong@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Truong <alexandre.truong@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 1/2] Revert "oeqa/selftest/devtool: fix test_devtool_add_git_style2"
Date: Fri, 26 Apr 2024 10:30:37 +0200
Message-Id: <20240426083038.8555-1-alexandre.truong@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Apr 2024 08:31:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198715

This reverts commit ab6d3e3d645ffc343f434bf731339fa237df027a
from poky repository.

Signed-off-by: Alexandre Truong <alexandre.truong@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 51949e3c93..1f8781a28b 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -482,7 +482,7 @@ class DevtoolAddTests(DevtoolBase):
         pn = 'mbedtls'
         # this will trigger reformat_git_uri with branch parameter in url
         git_url = "'git://git@github.com/ARMmbed/mbedtls.git;protocol=https'"
-        resulting_src_uri = "gitsm://git@github.com/ARMmbed/mbedtls.git;protocol=https;branch=master"
+        resulting_src_uri = "git://git@github.com/ARMmbed/mbedtls.git;protocol=https;branch=master"
         self._test_devtool_add_git_url(git_url, version, pn, resulting_src_uri)
 
     def test_devtool_add_library(self):
-- 
2.34.1


