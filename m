Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6C19C433EF
	for <webhook@archiver.kernel.org>; Sun,  9 Jan 2022 22:04:51 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web09.23866.1641765891212491831
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:04:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Jk8y0K/d;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id
 l16-20020a17090a409000b001b2e9628c9cso13973854pjg.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 14:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jmvGlCt+wgbuiDk0KXHutaZG/0KYl4csD2PUxA6kZQY=;
        b=Jk8y0K/dKlmeC4M8FV9x6Dbh1Aj1bD2d6l4h0IUbAf2fgReRWIiXOvbJRiAHGOKY9C
         RXuE9ZJWiJQ0dTh1D9ogBS4w8PI4k1dfONCTBPm37xhLBDnFVVrpASGXfqMbx8qM/ItX
         BpcCdPXLVoWrLWhspBOuQf8z1tEwLD3TFauv1VsWJe9R1KsZcwdxjCpc9o/FgYmwBZK1
         81oO35g+vjPvhBThYoVXRvpSfQpA5D327GOOvorn8pY9i8xLBJMe/GXUoynBJMJ6+jMv
         pni/ypQ8wLXMX+KPO+L3Ffym+yJBrdTSv6VIh2KNItFqCOBC9DRDYXsmeHAOYvAmfFY9
         sfkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jmvGlCt+wgbuiDk0KXHutaZG/0KYl4csD2PUxA6kZQY=;
        b=23iPSM36eDdIE/KgYwq4OJ41rswXm1zue+5+Ded3JWMsN2/1c+/BRXAPfAXAzgB1YH
         cOFz+V4k0FUIBt5A6gtsZXikiIJi93+jDcXakStZYkPm2HhU2lKnlYrHvo6NoByFMgw9
         Xgjx24rwvCu5Oi5zq/jPhaPtwNQoKMWfrfWeo1Vy/d6lG/sgUaOVAvu2Ij++so/vPV/j
         ugHAhVhOyaadBltNoam3lwCQwr1nGP3Mbu8ll5RDnhx4Swt2z0eqyMrUj3+iJZlYfmPe
         4Si6OgsXlMAmuYwpZlKL1wL9qbf8moI7oBpqf3i9cNfwQYiINUiN/Qfg1aCdEqjf0nWj
         sS5w==
X-Gm-Message-State: AOAM532B6LpZrK8UQGdHi4VMge1eWa3wz8LvX5Ya+YfdfA00AEPbosgV
	JEZQyF/TFvJ3ERrmQ4vUMP3zVTmLRCtV9ExZkhY=
X-Google-Smtp-Source: 
 ABdhPJz8Snd61OIWjWO/1qOBR4yKl9i+zYknXYgz5ynjQIUi/YTAzlHBxz67zSGGRZMJ/YSTKGsD7Q==
X-Received: by 2002:a17:90b:a0f:: with SMTP id
 gg15mr27340583pjb.8.1641765890276;
        Sun, 09 Jan 2022 14:04:50 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 k10sm4426150pfi.52.2022.01.09.14.04.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 14:04:49 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/12] scripts/buildhistory-diff: drop use of
 distutils
Date: Sun,  9 Jan 2022 12:04:12 -1000
Message-Id: 
 <15b1a82b4cdfadeaf89489929e10aaf9a0edd13d.1641765639.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1641765639.git.steve@sakoman.com>
References: <cover.1641765639.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jan 2022 22:04:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160299

From: Tim Orling <timothy.t.orling@intel.com>

The use of distutils.version.LooseVersion to check for GitPython > 0.3.1
is not really needed anymore since any supported distribution has at least
1.0.0 (centos-7 via epel7, debian-9, ubuntu-16.04)

If we want to reinstate this check, alternatives would be to require
python3-packaging on all hosts and use packaging.version.Version or
use an imported LooseVersion in bb.version.

[YOCTO #14610]

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bc90dcae9f53ddc246942f4d9b8ae8943e3b9754)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/buildhistory-diff | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/scripts/buildhistory-diff b/scripts/buildhistory-diff
index 833f7c33a5..02eedafd6e 100755
--- a/scripts/buildhistory-diff
+++ b/scripts/buildhistory-diff
@@ -11,7 +11,6 @@
 import sys
 import os
 import argparse
-from distutils.version import LooseVersion
 
 # Ensure PythonGit is installed (buildhistory_analysis needs it)
 try:
@@ -71,10 +70,6 @@ def main():
     parser = get_args_parser()
     args = parser.parse_args()
 
-    if LooseVersion(git.__version__) < '0.3.1':
-        sys.stderr.write("Version of GitPython is too old, please install GitPython (python-git) 0.3.1 or later in order to use this script\n")
-        sys.exit(1)
-
     if len(args.revisions) > 2:
         sys.stderr.write('Invalid argument(s) specified: %s\n\n' % ' '.join(args.revisions[2:]))
         parser.print_help()
-- 
2.25.1


