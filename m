Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web09.2352.1631646967882048831
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Sep 2021 12:16:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=BySEfX2m;
 spf=pass (domain: linaro.org, ip: 209.85.219.46, mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qv1-f46.google.com with SMTP id a13so349582qvo.9
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Sep 2021 12:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1TrO90qWJ8ZF4RAn7wRYO7DuOrZi+06wIOrb/ZF8H/E=;
        b=BySEfX2mVTy1z4iG3VZq8F77WE4LpCOIpk9rBwmMagx8je2P+8dilJmgYWCHwYcBhe
         aC0r0cfwzvCgErfRcp3jQCPB2yfYmWBuHro+Xj4/y79/gJRUC8QKQLu3LbBEwTcObrZ4
         x9RaLF4QRQ8vchPrgsCrkpiAG5+3PP7r9LH3TrAc4n1bvee50QaxrHIB8XIP52zXhZ8P
         sb8Lsm2+hXTxDW0d73pnJavifH5X1fh2KzdSBJdQbPc+KF53vgFJpi//MYXbQT3ENU9z
         dIRwF7Y/S9oC71QRG71O13jZosqONwzE9Q/R3gQXlJxK9iJcAeyEIZUaH3WVO1i8Ybx9
         A8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1TrO90qWJ8ZF4RAn7wRYO7DuOrZi+06wIOrb/ZF8H/E=;
        b=vTDqmiGSnhplJb+axHQ/KB9lKb2Rb9CkRXVOv1B+m611VbPbalq48oYEAwKWoTGdvb
         Hc+yEeWFrmArzBwJK2i0kh9R8cyFkfVbXnrsdDA1mSaVBA7bwQfi08F1Kz75rnYjpUeW
         5Qx9T70BdRVm9n8ZMbK3ETz+wJyL8pccGpmygUvS+DKqIOPaT3XcaFKpZR8bia/21V32
         oBMz4rAZKyCOUqgNIFb5IKXJwKjD09N+uEh24IK7XP3ylc93bxqiE1gCWG6T9zpQXu+j
         3e68cDJj0JbkOJCLBM3K0k2+W2vpVbaTaILaCv9kvDGuwL5L2z1tG8qEHGJWP6N2D+4s
         +xog==
X-Gm-Message-State: AOAM533T7pqo1CD2ZFDtLqoX7q12T+EcuG+RcvdOPTKkQzOPEFs6ShQu
	t0fkXgQcBcUdq1wu5adowZ02kboXtAko3w==
X-Google-Smtp-Source: ABdhPJwpgDrYQJhM6l2Qopn3OTMWK5hbScv6OzsxqgbfPWsV/5rM5Ub4ySrMjHJB4CWDr5Ud6Rg2lQ==
X-Received: by 2002:ad4:554e:: with SMTP id v14mr7211243qvy.26.1631646967057;
        Tue, 14 Sep 2021 12:16:07 -0700 (PDT)
Return-Path: <ralph.siemsen@linaro.org>
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id c7sm6626953qtv.9.2021.09.14.12.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 12:16:06 -0700 (PDT)
From: "Ralph Siemsen" <ralph.siemsen@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [PATCH] tar: filter CVEs using vendor name
Date: Tue, 14 Sep 2021 15:15:47 -0400
Message-Id: <20210914191547.3535803-1-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Recently a number of CVEs have been logged against a nodejs project
called "node-tar". These appear as false positives against the GNU tar
being built by Yocto. Some of these have been manually excluded using
CVE_CHECK_WHITELIST.

To avoid this problem, use the vendor name (in addition to package name)
for filtering CVEs. The syntax for this is:
  CVE_PRODUCT = "vendor:package"
When not specified, the vendor defaults to "%" which matches anything.

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 meta/recipes-extended/tar/tar_1.34.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/tar/tar_1.34.bb b/meta/recipes-extended/tar/tar_1.34.bb
index 98755a11cc..3728b5090d 100644
--- a/meta/recipes-extended/tar/tar_1.34.bb
+++ b/meta/recipes-extended/tar/tar_1.34.bb
@@ -62,5 +62,6 @@ NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
 
 BBCLASSEXTEND = "native nativesdk"
 
-# These are both specific to the NPM package node-tar
-CVE_CHECK_WHITELIST += "CVE-2021-32803 CVE-2021-32804"
+# Avoid false positives from CVEs in node-tar package
+# For example CVE-2021-{32803,32804,37701,37712,37713}
+CVE_PRODUCT = "gnu:tar"
-- 
2.25.1

