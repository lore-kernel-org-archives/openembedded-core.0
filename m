Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.472.1588083421541559257
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2020 07:17:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cBvV5Vaz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id v8so2485805wma.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2020 07:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Sz5yyKVf8gUEy+Q6kfZ4nSs6Q/1wdBbmIfaJg2vquU=;
        b=cBvV5VazLDAlRFG9sJ0Mq6Mr62YIV+pvDKKr9CsHZGoCHGOOr4egmdFQSNvDmNoBXm
         ZCGeFZNgf9OeyXzCbNZ4l1ZJ+hSzL5tLLxfD28A6k8BJJDmBycgPYqazhr1hWyqr5tRn
         DbviZfdMRUCP+utCuqC37oPhuOEKy08GUmsmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Sz5yyKVf8gUEy+Q6kfZ4nSs6Q/1wdBbmIfaJg2vquU=;
        b=GxUibYfP5X9T3bYtnyxX7u6Fwi2e1mv7FpMG4NObYKeheSjNM9ryAf3LBZbm2a3ws6
         CSkkj/jrabjtm1G20E70PxsLkSdsaAMLsdiPLnl3Pc00UfJD1jMy2B6yxXe10yOoTWHn
         wy4bMnZqhY/zYDetwCrTpTqhOXi7xF1Uh/2duXK/NPvohVGKHFhSmL1EYF5SfdxYNolt
         XWOS3PU4WV7ae7PGFOhsctNqm7E4NR359BHsXaKQgGdOdtaVGOvOFX8j1fkRVom0PGFS
         IZBRx5HtSYnRWCpULa4WJNQPkjaE6L6kxoby/t0oSTeoKUpTvaTOE9BD78mT0oXwH+iW
         HNAQ==
X-Gm-Message-State: AGi0PubIhCivMb4xIOOERDfF0M6Eb9O+7VneKIzOl6kq8PuaFqlxyDwt
	7uB5gzFuG54kXw8rKPUrVWjQjU5HQSo=
X-Google-Smtp-Source: APiQypIlt4TIwAGaAZPUX/QcQVOGMQu3c0mrjZZHqsOn67fTMotn13UI+6GGAqmmq4SYjbTS3k8dYA==
X-Received: by 2002:a7b:c931:: with SMTP id h17mr5154761wml.105.1588083419516;
        Tue, 28 Apr 2020 07:16:59 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id y18sm3734258wmc.45.2020.04.28.07.16.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 07:16:58 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] image/packagegroup: Remove PACKAGE_GROUP_*, long since deprecated
Date: Tue, 28 Apr 2020 15:16:51 +0100
Message-Id: <20200428141651.1222469-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This was deprecated in 2014 so we can safely remove the old code now.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image.bbclass   | 5 +----
 meta/conf/documentation.conf | 1 -
 meta/lib/oe/packagegroup.py  | 8 +-------
 3 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 07aa1f1fa5b..694b58fc9f4 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -62,10 +62,7 @@ def check_image_features(d):
     valid_features = (d.getVarFlag('IMAGE_FEATURES', 'validitems') or "").split()
     valid_features += d.getVarFlags('COMPLEMENTARY_GLOB').keys()
     for var in d:
-       if var.startswith("PACKAGE_GROUP_"):
-           bb.warn("PACKAGE_GROUP is deprecated, please use FEATURE_PACKAGES instead")
-           valid_features.append(var[14:])
-       elif var.startswith("FEATURE_PACKAGES_"):
+       if var.startswith("FEATURE_PACKAGES_"):
            valid_features.append(var[17:])
     valid_features.sort()
 
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index 44d69197bf2..c6544b96981 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -306,7 +306,6 @@ PACKAGE_BEFORE_PN[doc] = "Enables easily adding packages to PACKAGES before ${PN
 PACKAGE_CLASSES[doc] = "This variable specifies the package manager to use when packaging data. It is set in the conf/local.conf file in the Build Directory."
 PACKAGE_EXCLUDE[doc] = "Packages to exclude from the installation. If a listed package is required, an error is generated."
 PACKAGE_EXTRA_ARCHS[doc] = "Specifies the list of architectures compatible with the device CPU. This variable is useful when you build for several different devices that use miscellaneous processors."
-PACKAGE_GROUP[doc] = "Defines one or more packages to include in an image when a specific item is included in IMAGE_FEATURES."
 PACKAGE_INSTALL[doc] = "List of the packages to be installed into the image. The variable is generally not user-defined and uses IMAGE_INSTALL as part of the list."
 PACKAGE_INSTALL_ATTEMPTONLY[doc] = "List of packages attempted to be installed. If a listed package fails to install, the build system does not generate an error. This variable is generally not user-defined."
 PACKAGECONFIG[doc] = "This variable provides a means of enabling or disabling features of a recipe on a per-recipe basis."
diff --git a/meta/lib/oe/packagegroup.py b/meta/lib/oe/packagegroup.py
index 2419cbb6d34..8fcaecde822 100644
--- a/meta/lib/oe/packagegroup.py
+++ b/meta/lib/oe/packagegroup.py
@@ -5,17 +5,11 @@
 import itertools
 
 def is_optional(feature, d):
-    packages = d.getVar("FEATURE_PACKAGES_%s" % feature)
-    if packages:
-        return bool(d.getVarFlag("FEATURE_PACKAGES_%s" % feature, "optional"))
-    else:
-        return bool(d.getVarFlag("PACKAGE_GROUP_%s" % feature, "optional"))
+    return bool(d.getVarFlag("FEATURE_PACKAGES_%s" % feature, "optional"))
 
 def packages(features, d):
     for feature in features:
         packages = d.getVar("FEATURE_PACKAGES_%s" % feature)
-        if not packages:
-            packages = d.getVar("PACKAGE_GROUP_%s" % feature)
         for pkg in (packages or "").split():
             yield pkg
 
-- 
2.25.1

