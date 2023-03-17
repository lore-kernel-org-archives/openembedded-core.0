Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 238A1C76195
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 22:43:09 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.442.1679092979918327429
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 15:42:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=0Pe7Ax6M;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id iw3so6821574plb.6
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 15:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679092979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6/e7goVCBZe5tAOisoEyuC9KNBcsdphy1izUkJXytxw=;
        b=0Pe7Ax6M8Hb6VskSfm+rsWCcZ9iYrpUk8p/q6nyFD/XrrVvvrzwh0eSMLvz+udKiLu
         RVF9wYhUqhTciA8sXrvP/ZyuBDEPe/yPQfun6DPSmUtOmqGnfY8HbF9jkWINL3v3P8fe
         whfZHwVUFoAGpI2KttaZIeiVuc9OGuxig4hWdd1YzAO8JZP9gcEAJ9ICi497esS/G2nu
         tH2xFyTbySK1ZH+rB+cKF3lZF8FsSO9vi6awCuvFUuHWhFmcv5zd2L4qr4Vaw4Gut9bY
         yx+ly37dqLvtSQuxHFNyTj9XFpxPJiDzTItygeJu0TglHlGp3Vn8PR9ZHkbCgikQvrUN
         ki8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679092979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6/e7goVCBZe5tAOisoEyuC9KNBcsdphy1izUkJXytxw=;
        b=P9MDEY/QVWGcAlDC9xG9h3Q5+QfXpe5XuEXzEU9q28lmzG4QxCWB3TmhRyzAyMmvX5
         gln0oCfljHX0bXZDoOlOdjhtRtpfk4TPVuMdaq/PbqPZxbmrdB+Mxk6Ydz24hAvBzSAC
         ERPPo+wkqAsMpt7GA5wUnw3yZXlzELKaq3Rfqkcp2VbVXQoD1Zc7lU6K3FKcIFjiFuX2
         MCpKXNmw5q3+r1kOjQHvkSWLzOuT8n7doeqRwnXWGba3SppKwZ5OtWJq1OHqlpdrVOly
         Brk4TmLgn9i5gJjdfKAZzA4iSemkxhSkuvJXYfiFan2qK1c4LWEq1WmO9bZWpld24OUc
         UsXg==
X-Gm-Message-State: AO0yUKXbhTy5VVzM2eI6aG76B2kDsR6eU8LXlL2poUmOfMKeESU1958S
	wllsYQp6rUMu95e8GVOEhThndq/ebh2b1XHR520=
X-Google-Smtp-Source: AK7set8bAoNmQ80vN4j+BwyeBMvCN/Ec4cQpocFEZi/POWF0HNl7soOe7Az1/Mmpx0NtRIui3yauyg==
X-Received: by 2002:a17:902:e5cf:b0:1a0:69e6:bb43 with SMTP id u15-20020a170902e5cf00b001a069e6bb43mr11369147plf.52.1679092979049;
        Fri, 17 Mar 2023 15:42:59 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id jb13-20020a170903258d00b001a19040435bsm2027152plb.100.2023.03.17.15.42.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 15:42:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/21] staging: Separate out different multiconfig manifests
Date: Fri, 17 Mar 2023 12:42:23 -1000
Message-Id: <29f7390add28d3a6fb6854bc750d1db3d969f027.1679092796.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679092796.git.steve@sakoman.com>
References: <cover.1679092796.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 22:43:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178770

From: Richard Purdie <richard.purdie@linuxfoundation.org>

"""
require conf/multilib.conf
MACHINE = "qemuarm64"
MULTILIBS = "multilib:lib32"
DEFAULTTUNE:virtclass-multilib-lib32 = "armv7athf-neon"

bitbake gcc-cross-canadian-arm
"""

and then inspecting the lib32* manifest files under recipe-sysroot-native shows
them referencing lib32-recipe-sysroot instead of recipe-sysroot as used by
gcc-cross-canadian recipes.

To fix this separate out the manifest by multilib. It is caching mechanism to
optimise disk usage so this doesn't break anything, just separated out some files.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 891d3faa3ed3d1cc231da58e5fa1325f05d5ade5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/staging.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index bf8ca58b0b..885bd347e0 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -269,6 +269,9 @@ python extend_recipe_sysroot() {
     pn = d.getVar("PN")
     stagingdir = d.getVar("STAGING_DIR")
     sharedmanifests = d.getVar("COMPONENTS_DIR") + "/manifests"
+    mlprefix = d.getVar("MLPREFIX")
+    if mlprefix:
+        sharedmanifests = sharedmanifests + "/" + mlprefix
     recipesysroot = d.getVar("RECIPE_SYSROOT")
     recipesysrootnative = d.getVar("RECIPE_SYSROOT_NATIVE")
 
-- 
2.34.1


