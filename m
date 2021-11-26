Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E8D6C4332F
	for <webhook@archiver.kernel.org>; Fri, 26 Nov 2021 04:36:27 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.20379.1637901386826707186
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KMhLW0AH;
 spf=pass (domain: gmail.com, ip: 209.85.210.169,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id n85so7678767pfd.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 20:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VQvywFlX+LtKiUlcMzaPreT1buA/bfbMF38v6jck6+U=;
        b=KMhLW0AHfk99gRn23DuR2Jn/aNaQzH3llOdZKuvlW6rp2ne8OXPiUiZvjrXrRtbD6K
         M/D6iH84lSRnQW1rJRhC148yV+8Sr2J58SP++6aXV0i+fBxK9FlxMvaObWOCcn3eouir
         HMt3xZJ0IOnfEaGbGnhfZfAWY7KiE1U8U3Hv93HkKo4FbzGN761Z1BMPsWOzUGmCARq9
         5O3DRtJYGreQDuqPRXlOOFEBeO+IgHG7okdU+8eUIIAtztGX//vnDzAsI8ulFvpHgwq8
         UD8e5rY5NOFFEx4AhJnQesDEHrcvItnP1vQGePYrfYp7rBI/+s6ofs6DMNzUgk/XjCwC
         HbSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VQvywFlX+LtKiUlcMzaPreT1buA/bfbMF38v6jck6+U=;
        b=TovDQ1RlaXyW5BJFmVRlLjnXNpZYQXyTA9fRuz9dcAUZ6kiWbPM8ee7hs5zbrZOrFD
         Vz9M2Ez2u0qp03CiTLiGSEHyNJVR4KgDJZY8KT5cjdZBdDU6yybJKQk1uJhiRlpMeRpo
         UgPJxPVgoOpZjBmJGV3gJgZ2qRLq9F9acWuYrT/itd8cA9f894e7J7bzy2UfQDC/xHwe
         EQuKDuYxIKnmaescbqaiD/DT2MRSZR5eRdxOq1ZpwgTWaXEvpJz2cZ/6c8V6Y9pBSVEJ
         nu8PkVWqr40gDyDB3dfxwbvBWH5KsYsIQX//QpW7E4hhDlSwLPSUid7rTsdD4Vn9n9BK
         uZkA==
X-Gm-Message-State: AOAM533USmQeDRLHiD9dFGX+r7SXTKrCX7LSddX0y0JZazKJLksemzQd
	ohKcToRu7GB49UwujroUCjRigOomnHU=
X-Google-Smtp-Source: 
 ABdhPJyHXONzVZQO5vNI14xjMzP6xY5DxSQ5eDcpYVcuSN0UevcOykkwl7ziwGZGbQY/KZaG1Gl1WQ==
X-Received: by 2002:a63:db18:: with SMTP id
 e24mr17770469pgg.285.1637901386129;
        Thu, 25 Nov 2021 20:36:26 -0800 (PST)
Received: from nereus.local ([2601:1c0:6000:1830:2111:e66e:a58a:6736])
        by smtp.gmail.com with ESMTPSA id
 fw21sm8909282pjb.25.2021.11.25.20.36.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 20:36:25 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 14/26] scripts/buildhistory-diff: drop use of distutils
Date: Thu, 25 Nov 2021 20:35:53 -0800
Message-Id: 
 <acefecd6bcea10cdfe366f32260fa6f0d7f9009a.1637900380.git.timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1637900380.git.timothy.t.orling@intel.com>
References: <cover.1637900380.git.timothy.t.orling@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Nov 2021 04:36:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158810

The use of distutils.version.LooseVersion to check for GitPython > 0.3.1
is not really needed anymore since any supported distribution has at least
1.0.0 (centos-7 via epel7, debian-9, ubuntu-16.04)

If we want to reinstate this check, alternatives would be to require
python3-packaging on all hosts and use packaging.version.Version or
use an imported LooseVersion in bb.version.

[YOCTO #14610]

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 scripts/buildhistory-diff | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/scripts/buildhistory-diff b/scripts/buildhistory-diff
index 3bd40a2a1ea..a6e785aa238 100755
--- a/scripts/buildhistory-diff
+++ b/scripts/buildhistory-diff
@@ -11,7 +11,6 @@
 import sys
 import os
 import argparse
-from distutils.version import LooseVersion
 
 # Ensure PythonGit is installed (buildhistory_analysis needs it)
 try:
@@ -73,10 +72,6 @@ def main():
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
2.30.2


