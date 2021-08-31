Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web12.462.1630378242303597924
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 19:50:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FFLW6LWt;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id w17so3806846qta.9
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Aug 2021 19:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I9rFUwM1DapY6OHPwGzIi9IRLy0TUfCd+ky5/oBQJDI=;
        b=FFLW6LWtEIDMPm+lVQpsI5YRI64/nJgnwbc7zS/bhKsyJPy6cOZCX2dYIcG6TF/7+a
         Xfsos4sv5061SJ0PX01yzdt2XQRJxUAvfSQT/IUn6yMlXSzCkdtunkfrYVnoC0Vswh88
         VzWB12g4QAD+B5jso3Z+nDATLH2CbOis+ajbJowhMqQd6UkSQoMjrAB7EnhIvaN4cKcO
         L35EsLiq9Vz0M3b8yKlP9yw+dDdlEGPF3nChnP6vEuueFqwO+p3r2ltMBeRtlcLVq4wx
         XBgFuuzihLxbfhsFe0CK7CPwG24KuHlWStHreSxjJyX9y3at0tqnnQ3Hf1FeSDf6kCb5
         sTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I9rFUwM1DapY6OHPwGzIi9IRLy0TUfCd+ky5/oBQJDI=;
        b=HH/iuiRh7f3hcRfT7GL+7aLXnoWUBUAYe44OLDHx/TjLaHL5GkKxgAJPe742bOXrgU
         myaFMW7blbnY607YxVAaK5h8YwktgT5ecY+RI/LXS+pCwtl8bLbf5hM3+LhP2RyDqNsS
         0mOFKgF1Wp37YVQGanTMXfQsbAvu/xI/4XUjGbH9AsWoaa6y+rrC+6iKOmPdJCfPNHDR
         clSncwcQgAq9bFY3K0NnC22QtvAQ7zedN2ef4y4lOdBNFQ9BfFJbZjKpMmjeTWk99YWl
         xGdQY06QYeCMm8t8dut30mnYL4sr5ayAeLwLXhpFSEQ9HVhh8SoUsIKDKFvdIrHexRTt
         iy1A==
X-Gm-Message-State: AOAM533SE4XJh0DjC+OONrMSAhrhufN4Quwvg5UoJ0ZDafXzIUQZeJkn
	3eTfL3kntHrHThDl6EGPu3PILrOYhDyxfg==
X-Google-Smtp-Source: ABdhPJxQDKA3hh1BS1f/Hc9I4eU2jAWLDmine4l2LNx62m39zRGbvSRlpWbtrCD7RlSdsIx4Fs/5AQ==
X-Received: by 2002:ac8:410e:: with SMTP id q14mr747068qtl.377.1630378240898;
        Mon, 30 Aug 2021 19:50:40 -0700 (PDT)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id q192sm12800785qka.93.2021.08.30.19.50.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 19:50:40 -0700 (PDT)
From: "Trevor Woerner" <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] distro_features_check: expand with IMAGE_FEATURES
Date: Mon, 30 Aug 2021 22:50:33 -0400
Message-Id: <20210831025033.14721-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.30.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In addition to checking DISTRO_, MACHINE_, and COMBINED_ FEATURES for required
or conflicting features, extend this functionality in order to check
IMAGE_FEATURES in the same way.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v2:
- update in-file documentation
---
 meta/classes/features_check.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/features_check.bbclass b/meta/classes/features_check.bbclass
index b3c8047861..205e1b9cd3 100644
--- a/meta/classes/features_check.bbclass
+++ b/meta/classes/features_check.bbclass
@@ -1,6 +1,6 @@
 # Allow checking of required and conflicting features
 #
-# xxx = [DISTRO,MACHINE,COMBINED]
+# xxx = [DISTRO,MACHINE,COMBINED,IMAGE]
 #
 # ANY_OF_xxx_FEATURES:        ensure at least one item on this list is included
 #                             in xxx_FEATURES.
@@ -18,7 +18,7 @@ python () {
 
     unused = True
 
-    for kind in ['DISTRO', 'MACHINE', 'COMBINED']:
+    for kind in ['DISTRO', 'MACHINE', 'COMBINED', 'IMAGE']:
         if d.getVar('ANY_OF_' + kind + '_FEATURES') is None and \
            d.overridedata.get('ANY_OF_' + kind + '_FEATURES') is None and \
            d.getVar('REQUIRED_' + kind + '_FEATURES') is None and \
-- 
2.30.0.rc0

