Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.18431.1592228664294802913
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 06:44:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=kV8KdmjN;
 spf=pass (domain: burtonini.com, ip: 209.85.221.67, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f67.google.com with SMTP id p5so17170862wrw.9
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 06:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WJpvLrvLby6Jf8zRBGUp4lqDfwU7ivLWAhxH7XZozIM=;
        b=kV8KdmjNRfa8WbNTE23bpIhtNZrnRUMj8SfUENM7TXiMx/sGohNae+oMQc8DX430o1
         W3RS4ytjg+J7Jh+6GucpJGXUU9eUQ5F5WKbH+NL50Gn9SQA4GwVnT0wlfzemm2x6T8BQ
         rcciFxk7vfg7r0Oi/lIUtYaWibzR4h+B8jgwHEvZDVkZyzXxi43pYzqf0fcwsbIOYs3x
         khbBzOzmkQwH8Ln+pa/8HxhsMkVSipUD8yn5i5eR56czjC0uSL5k8NUg70+37WAH0pmR
         kcxJqdo3I9Cje42AGqjg1Tof1i3OjyaR7ay7GW8xHQeQ+mW50qTsjEK0oheKfPeoElUN
         jcOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WJpvLrvLby6Jf8zRBGUp4lqDfwU7ivLWAhxH7XZozIM=;
        b=IS+Tg3AUZMBvTj3mx7VHKpIKpj/FB4D9ueDIOfQau34RYGjXiL8kzhMR6lVmdb6UKt
         lnEIznsP00nv5dUNl7LjoOJO9BXKkwRp/1htzkIIjY1jZcr+mNYJoebXx4CghK5DgIiz
         pMTAc7q9sirOptlT9WG6dzn7tJAIjmn0IUrE5dTH1XoZl2+rW/iJayyYOP/1F64BbLDv
         OfkFTjOPFDh+0d2dPM9PVR8HxLU00R9CyhoZCr49OhafV/++YDiWmBrRD9a7/qXjEiZN
         dwSod6QS5sFOpgmSm1H6pyqqdAAuWwinuzKkWPMt6tgoE0ItLJ8L9FNOiQVeH3ahs+Zh
         H/Lg==
X-Gm-Message-State: AOAM532c6chJdBg/CmvfyKUP/4hw9EQjxWzx7kJD/6VvV5CNAdMK0wr0
	tkOMWrzmH/FmbcvdP1SgBYbMvzgAnF2SvLwe
X-Google-Smtp-Source: ABdhPJxoq2O0VRnfTsEUM2cKVGLpvXjWNH5VaQcc/u5DJ3AIZawBf+RGhviw1bthDcmmygkw9Pis6A==
X-Received: by 2002:adf:f183:: with SMTP id h3mr31141808wro.403.1592228662296;
        Mon, 15 Jun 2020 06:44:22 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id y6sm11572038wmy.0.2020.06.15.06.44.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 06:44:21 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] install-buildtools: remove hardcoded x86-64 architecture
Date: Mon, 15 Jun 2020 14:44:13 +0100
Message-Id: <20200615134414.1043782-2-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200615134414.1043782-1-ross@burtonini.com>
References: <20200615134414.1043782-1-ross@burtonini.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

Remove all instances of the hardcoded 'x86_64' and replace with the current
host platform.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 scripts/install-buildtools | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index d722519f0f..a9173fa096 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -35,6 +35,7 @@
 import argparse
 import logging
 import os
+import platform
 import re
 import shutil
 import shlex
@@ -112,6 +113,7 @@ def main():
     release = ""
     buildtools_url = ""
     install_dir = ""
+    arch = platform.machine()
 
     parser = argparse.ArgumentParser(
         description="Buildtools installation helper",
@@ -194,19 +196,19 @@ def main():
                     logger.error("Milestone installers require --build-date")
                 else:
                     if args.with_extended_buildtools:
-                        filename = "x86_64-buildtools-extended-nativesdk-standalone-%s-%s.sh" % (
-                            args.installer_version, args.build_date)
+                        filename = "%s-buildtools-extended-nativesdk-standalone-%s-%s.sh" % (
+                            arch, args.installer_version, args.build_date)
                     else:
-                        filename = "x86_64-buildtools-nativesdk-standalone-%s-%s.sh" % (
-                            args.installer_version, args.build_date)
+                        filename = "%s-buildtools-nativesdk-standalone-%s-%s.sh" % (
+                            arch, args.installer_version, args.build_date)
                     safe_filename = quote(filename)
                     buildtools_url = "%s/milestones/%s/buildtools/%s" % (base_url, args.release, safe_filename)
             # regular release SDK
             else:
                 if args.with_extended_buildtools:
-                    filename = "x86_64-buildtools-extended-nativesdk-standalone-%s.sh" % args.installer_version
+                    filename = "%s-buildtools-extended-nativesdk-standalone-%s.sh" % (arch, args.installer_version)
                 else:
-                    filename = "x86_64-buildtools-nativesdk-standalone-%s.sh" % args.installer_version
+                    filename = "%s-buildtools-nativesdk-standalone-%s.sh" % (arch, args.installer_version)
                 safe_filename = quote(filename)
                 buildtools_url = "%s/%s/buildtools/%s" % (base_url, args.release, safe_filename)
 
@@ -279,8 +281,8 @@ def main():
         # Setup the environment
         logger.info("Setting up the environment")
         regex = re.compile(r'^(?P<export>export )?(?P<env_var>[A-Z_]+)=(?P<env_val>.+)$')
-        with open("%s/environment-setup-x86_64-pokysdk-linux" %
-                  install_dir, 'rb') as f:
+        with open("%s/environment-setup-%s-pokysdk-linux" %
+                  (install_dir, arch), 'rb') as f:
             for line in f:
                 match = regex.search(line.decode('utf-8'))
                 logger.debug("export regex: %s" % match)
-- 
2.26.2

