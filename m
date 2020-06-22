Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.390.1592848841997745556
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 11:00:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=P9HtnqnR;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.41, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f41.google.com with SMTP id g7so13767904oti.13
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 11:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=9bMcUzI/B+RWOXEciXTPKcFjX1W/rlU5Ig4jIjl0Wnc=;
        b=P9HtnqnRd6NXRyt4XherGw/ElYNl0PBeNNvPc4crHLAfbM8coRg77Fc9wG4VBAD1Lt
         DkbUsIAfQwmcMdvBSa3z7bVVJ3VwWvvpkpCPjMk777uxp2yuM6XixSnzren+URMWOH9D
         S1wiQMTs11VP7iU5oG0+vyJ9qo5auX4pDCXR34D+JtfLiyW87RD68/stGCfQRUaRRVJY
         lufeBQ9lb0MTgNs3l1gZtQPPoLbUMabYr5XrniZijUdctlgsPqRwRbipY564F3y5LnAc
         8UcedAyx4F6LNZsa0zHt2AiZiqW0WtUvgAZO4o25DEruHF1cHrqDI0kkeUOPMz9xzONA
         P9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=9bMcUzI/B+RWOXEciXTPKcFjX1W/rlU5Ig4jIjl0Wnc=;
        b=dQvCosbGhhzucgSBdTQ3/m4P7PJZa4r8m4dMQwuIJ1oNS3yrpxywVRd0pRirzwRnzK
         D/Jduf9fr5OfPYClLt+TSdz2Cs2jNPgyAjGu2bxTehrKxjAAXeB/PQBZisULJkscJTzK
         FAZOQDfFogsZmg8icl3XYtrFIHwDvwrQ3TCIwIu/alQBI+7/IIXxTh6Kv1hLyXHwNmv5
         VnoPbulrmgFZCEAJ3HnX3tKPpi+h1oGRyAaB+eJb+JCq+SpiLPfPAJ15TlnkfHydLL9l
         SbzQkSE6W6Dowpr54m77UF5mRW8TMyi++Osl5nMPGy424TbYffZEfmZQbGmr0AAT2+Pe
         4z5g==
X-Gm-Message-State: AOAM531liWX9yitOjnMkE6oS8mNdN2P4HMDTBWD62E9ANCbhgJfKgxoi
	gylabMkbyUvvRpunydqgsiji2S/gPIJH7g==
X-Google-Smtp-Source: ABdhPJw0taklD17yV9wDNimA+2hVF5QI0EULxidiEYBsSF+5yJRcI1VbOXuBIk0/7FB2nNgWF0nfTw==
X-Received: by 2002:a05:6830:817:: with SMTP id r23mr369466ots.29.1592848840894;
        Mon, 22 Jun 2020 11:00:40 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id n60sm3422659otn.75.2020.06.22.11.00.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 11:00:40 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/33] install-buildtools: remove hardcoded x86-64 architecture
Date: Mon, 22 Jun 2020 07:58:10 -1000
Message-Id: <cd2c54d8ab545f39f23c5167ba5ca50f732f7cfa.1592848337.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592848337.git.steve@sakoman.com>
References: <cover.1592848337.git.steve@sakoman.com>

From: Ross Burton <ross.burton@arm.com>

Remove all instances of the hardcoded 'x86_64' and replace with the current
host platform.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 52dc6f671ff67a1149be7ef4c65126ea3c907a3d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.17.1

