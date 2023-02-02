Return-Path: <arnout@mind.be>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4EDFC05027
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 12:50:25 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.13614.1675342217673450058
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Feb 2023 04:50:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mind.be header.s=google header.b=MUCZteZu;
 spf=pass (domain: essensium.com, ip: 209.85.208.44, mailfrom: arnout.vandecappelle@essensium.com)
Received: by mail-ed1-f44.google.com with SMTP id q19so1893460edd.2
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 04:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ky6U7/YSol/oSn8+xlGWJvUKVKBF/DVl1C+swOUvnbw=;
        b=MUCZteZup8lu9LLHFV25VgRy6zwXZOGddWQpeECxGCXQqdKWM4fvQGs0Z+pQYs3PT3
         Hprkm4de3GfEsTBYCS1ZXyj16gn2IR1G85sK5638McleXH5CbYgT5bNaVzr/VtlpAB8u
         LfPQUSalmC29zOBUKaaMtYkehW3a/BUD0S8VKbVEIiyAKsedq1zphSsp+SRblSi44lBz
         Wgb3CfrFSO+cjzAx3Kabt785U1C+sRbzBXlrhs0pMRDSecYJXdcJiQO2UKCicR+YVjdB
         8sU18XQcbj8lZXc0971Rj+QHwV8mYA8Z0Rhpw7B9//xeTU40A9fs0ZfD6Qlfiy0t9BKw
         TraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ky6U7/YSol/oSn8+xlGWJvUKVKBF/DVl1C+swOUvnbw=;
        b=zWjpzXqF7Vz+Lwj7cvuICJ1Yhla9XZilZBF3b/GqaxjFvrt9F0aRjYiAfmhfXHGdmg
         bFFtxp1+GsSkMHxFQPwU+HvkxQTOfiSw/mv129UmHrfJJ4iE9ZbjtnojaRb+WrMFQgiD
         L3NFSybgTGPVSsW6oaGsBwlco2Z+zBpzyYLrJYLbyEdbsdIx29KINYCaGJl9YymmnCno
         c0RSaxXb67uc2k+S+/E+HsfNt18u4aUa8IKtiRxWYo+WUmYH60/OH0ww3o82L8xEAKL0
         k4L0lx6oBfahNJ0R37/01K8PPZHmaYP3hqT+Ehb3ih29O4OuPDiLOnY6RTpINPPCXE3F
         k7uw==
X-Gm-Message-State: AO0yUKVkfyzxw9i2y9G2C6GPjR+9zFlULxdsC4xvcfhEpB8E3NqAXey+
	EwWFB+3Suhg8c0dnNvfs+HZqS3IciX8baAP7
X-Google-Smtp-Source: AK7set8Rr5lHa5HUrNH7brvEYuDmGyrUDj8gpSj2EQDZBEXIHDB5vz+xMS+sZIbMBjCWQzeXuKrdaQ==
X-Received: by 2002:a05:6402:2206:b0:492:bf3d:1a16 with SMTP id cq6-20020a056402220600b00492bf3d1a16mr5515434edb.4.1675342216184;
        Thu, 02 Feb 2023 04:50:16 -0800 (PST)
Received: from localhost.localdomain (ptr-9fplejqcmbwz6qb22hk.18120a2.ip6.access.telenet.be. [2a02:1811:3a7e:7b00:e7c3:8953:3ab9:2c18])
        by smtp.gmail.com with ESMTPSA id p11-20020a05640243cb00b004a2666397casm3888513edc.63.2023.02.02.04.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 04:50:15 -0800 (PST)
From: Arnout Vandecappelle <arnout@mind.be>
To: openembedded-core@lists.openembedded.org
Cc: Arnout Vandecappelle <arnout@mind.be>
Subject: [PATCH-kirkstone/langdale] python3-pytest: depend on python3-tomli instead of python3-toml
Date: Thu,  2 Feb 2023 13:49:53 +0100
Message-Id: <20230202124953.3402225-1-arnout@mind.be>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 12:50:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176696

Since version 7.0.0 [1], pytest switched from the toml package to the
tomli package for parsing pyproject.toml configuration files [2].

This change is not immediately noticable during tests, because the
toml/tomli module is only important if a pyproject.toml is actually
present in a project.

[1] https://docs.pytest.org/en/latest/changelog.html#pytest-7-0-0rc1-2021-12-06
[2] https://github.com/pytest-dev/pytest/issues/8789

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
This patch only applies to kirkstone and langdale branches. On master,
Python 3.11 is used which no longer needs tomli at all. On dunfell,
pytest is still on 5.3.5.
---
 meta/recipes-devtools/python/python3-pytest_7.1.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pytest_7.1.1.bb b/meta/recipes-devtools/python/python3-pytest_7.1.1.bb
index 1cb2fb01c0..90a4787c17 100644
--- a/meta/recipes-devtools/python/python3-pytest_7.1.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest_7.1.1.bb
@@ -26,7 +26,7 @@ RDEPENDS:${PN}:class-target += " \
     ${PYTHON_PN}-py \
     ${PYTHON_PN}-setuptools \
     ${PYTHON_PN}-six \
-    ${PYTHON_PN}-toml \
+    ${PYTHON_PN}-tomli \
     ${PYTHON_PN}-wcwidth \
 "
 
-- 
2.39.1


