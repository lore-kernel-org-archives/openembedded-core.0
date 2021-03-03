Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web08.4629.1614764518803845307
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Mar 2021 01:41:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SAH2hHHl;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: aj.bagwell@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id c6so29079445ede.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Mar 2021 01:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Gja9tJmPvdvnotKaSwN2JqIRCCgFjGm4t+L5m/e3QoI=;
        b=SAH2hHHl80gCJVMXsZgJ/8ll83k7eBKrYiTjI0SmYCYQDLSs5Z05mSXKF6hcBlR/nW
         nH4lGR3QSvk/Me+hvZZJ8PR351yICqTdbu83CBl6U5omL5p/gwxaqM7mQVktOJRJNqQ2
         0GkKJgjorv1/JybNZXwuuAt9EtPCNKv0LDPXAiWtRnghrcZGRCDnLkPG6gwzga2fF1b1
         j9JKi29qjUMChLnMgpS4zQ8Cmqq8OaT3L+tz9FXs7ADoodkGqaGi7jJWxQNWZ4gOHN5a
         oIPKTHKCqU6e+U5gXCScITjrcPImWMwlpGOqrlcPzw2fL2/xSWWtZjp16534XQBCWd2D
         MdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Gja9tJmPvdvnotKaSwN2JqIRCCgFjGm4t+L5m/e3QoI=;
        b=tUMOv44os4U43B522fsQz6FzoYNOC5Cw6TYrSPzSf8fOinsKrW1rcQ7rojalnLCG8U
         3TY4hm8AsKjw8kqsEtZySGpt/d6jDDwKHcM4c9/X4gkxkNizK2EaZiUSRHRfm6IP/TrG
         4CQ9fbThi/qzIx5lK0ZzJhC2WtclpKafEEL8a5x4wttWry2QaFXo1g+j11RZXF+GfSSP
         uMeWbaypv+RTfe+khSsrDsN5GK1/gAeISO+9ceNOEaqSKgZ9ZqzRBp0yzsa7XU1FbCDR
         om1l5/6YYl6zaBqEdlQ/kOxBdPIiAlzCcv2x31dwShcvRqNBZ3tf9DlhRjRTKuO/nNiA
         mQcQ==
X-Gm-Message-State: AOAM530kDSbcmkv22V8wcfJH6E9QoWtMl3GEtFjmemyo60H3ftZrWBc4
	EudDcim11WlUk4RwLUHH2nqnoYziO3Bjiw==
X-Google-Smtp-Source: ABdhPJyho4SS8u8X3eEZmQ3XKIMMkoMxt9HR2RnDGJZwBsLqXKt8rEiISV0PTBh4gpLopNKRtF77GA==
X-Received: by 2002:a05:6402:34c8:: with SMTP id w8mr950041edc.235.1614764516914;
        Wed, 03 Mar 2021 01:41:56 -0800 (PST)
Return-Path: <aj.bagwell@gmail.com>
Received: from CMM-C02QQ1FRG8WL.localdomain (cpc159419-cmbg20-2-0-cust164.5-4.cable.virginm.net. [86.29.216.165])
        by smtp.gmail.com with ESMTPSA id i4sm19359285eje.90.2021.03.03.01.41.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Mar 2021 01:41:56 -0800 (PST)
From: "Anthony Bagwell" <aj.bagwell@gmail.com>
X-Google-Original-From: AJ Bagwell <anthony.bagwell@hivehome.com>
To: openembedded-core@lists.openembedded.org
Cc: AJ Bagwell <anthony.bagwell@hivehome.com>
Subject: [OE-core][PATCH] glib-2.0: Fix THISPATH replacement when it has dots in it
Date: Wed,  3 Mar 2021 09:41:28 +0000
Message-Id: <20210303094128.80203-1-anthony.bagwell@hivehome.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The file path is normalised before replacing the THISPATH prefix
so THISPATH needs to be normalised too to match
---
 meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
index 882a89da7a..a2fa5345b4 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
@@ -31,7 +31,7 @@ def find_meson_cross_files(d):
     if bb.data.inherits_class('native', d):
         return ""
 
-    thisdir = d.getVar("THISDIR")
+    thisdir = os.path.normpath(d.getVar("THISDIR"))
     import collections
     sitedata = siteinfo_data(d)
     # filename -> found
-- 
2.24.0

