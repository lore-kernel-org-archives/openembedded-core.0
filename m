Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39DBBC7618A
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 21:45:54 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.5146.1679003145201429786
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 14:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=NA3qJn5I;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id u3-20020a17090a450300b00239db6d7d47so2994790pjg.4
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 14:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679003144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/Y0Z9tjN6eQ3apOSR4mi3J/WsC6mec3atY6UH738II=;
        b=NA3qJn5IsFO15TZqgRYtRjIF179kXdpaV/EqWAEgaqEiSSXJohhEYtgJUh+4Vm4X/1
         puMUgTe4z1/sR2Y3+jBFd1CMY63ZXjdIc5ZtWsOEF7DkPy244FzpWnVI8xbV9DK+R1EF
         1aEgsK1YSStDaCjQl3/fldR729oL4qKZvcEQDKLhUpr/xA6L2L8caxO17cLMVozXm4SO
         A1f1SGqTcWuGoE66z2iB84zhYxOT7kGTZ3VGDOAfffpkKHyimCgeahy3DoDrvAbkq6RJ
         A4/3DKBPYHMEjRicLTOKhD/KRsX3SsI7ozRv7Uvl4Y4XiQLWlKQKidf/Oc5C/XHMa7Ak
         jL9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679003144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/Y0Z9tjN6eQ3apOSR4mi3J/WsC6mec3atY6UH738II=;
        b=J+JW3CyMGdBkWlBtRBn2scAIx27rtrlz1SQawZ44+j/zROgQ7LRNuywUuVu1h9Qy+7
         fTGETtEqPbKP9v3njxNVf8oRXxAUtEP/dQiSYuRib8FoVVIy7092F4La4DbG6IEGCy+f
         d7YzGu9ZbkItBFVFttALWYV5pi5pdnTUK3vif7HMWk1/S6nx6s2huAeC3czlZSCqX3z+
         h+0Xr8XSJZYfmaNBmYgVS2pLLoaUAB5nGOy/+UVv0rtcaEgeUFEaplrAd0m8rfYqABo+
         T+ajhDYiXUIKCyY24OAs8T2atohdB4UdWWfYijb+98RxKb7Em9TvQTQlYBVYcwmNptkj
         tnKg==
X-Gm-Message-State: AO0yUKWYiTx6q3OkkYFEOhkcfJKLE5/TBSSrBXGIi4+t/pFVIT1dLMuR
	cOYnMPg9e+SnBV/2NBI4q1OLwWm6YwSZz4PWE68=
X-Google-Smtp-Source: AK7set97QK31DUgLg7GWYnKEaAUWytwUl86g1GhWibHQGwbIwqmY1L2t/UYw5WBFLRIz+BTof5HeYw==
X-Received: by 2002:a05:6a20:72a0:b0:cc:f047:afb4 with SMTP id o32-20020a056a2072a000b000ccf047afb4mr6219395pzk.37.1679003144134;
        Thu, 16 Mar 2023 14:45:44 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id bn10-20020a056a00324a00b005a84ef49c63sm137746pfb.214.2023.03.16.14.45.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 14:45:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 09/23] staging/multilib: Fix manifest corruption
Date: Thu, 16 Mar 2023 11:45:06 -1000
Message-Id: <2b2da04c5e88529c74b44569919fdcc136c48cca.1679003014.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679003014.git.steve@sakoman.com>
References: <cover.1679003014.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 21:45:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178720

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The previous fix wasn't enough to address all the possible ways the
manifests might be ordered. Rework the previous fix so it is tied
to the multilib cross-canadian code which is causing the problem.

RECIPE_SYSROOT_MANIFEST_SUBDIR is not documented as I'd hope nobody
ever needs to use this outside the core multilib code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit beab42e00713880cd95a04729c892f8662fbcbed)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/staging.bbclass | 7 ++++---
 meta/classes/multilib.bbclass       | 1 +
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/staging.bbclass
index e6d0d1d55c..a058d344fd 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -275,9 +275,10 @@ python extend_recipe_sysroot() {
     pn = d.getVar("PN")
     stagingdir = d.getVar("STAGING_DIR")
     sharedmanifests = d.getVar("COMPONENTS_DIR") + "/manifests"
-    mlprefix = d.getVar("MLPREFIX")
-    if mlprefix:
-        sharedmanifests = sharedmanifests + "/" + mlprefix
+    # only needed by multilib cross-canadian since it redefines RECIPE_SYSROOT
+    manifestprefix = d.getVar("RECIPE_SYSROOT_MANIFEST_SUBDIR")
+    if manifestprefix:
+        sharedmanifests = sharedmanifests + "/" + manifestprefix
     recipesysroot = d.getVar("RECIPE_SYSROOT")
     recipesysrootnative = d.getVar("RECIPE_SYSROOT_NATIVE")
 
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 10a4ef9c37..8a1a51aaba 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -51,6 +51,7 @@ python multilib_virtclass_handler () {
         e.data.setVar("RECIPE_SYSROOT", "${WORKDIR}/recipe-sysroot")
         e.data.setVar("STAGING_DIR_TARGET", "${WORKDIR}/recipe-sysroot")
         e.data.setVar("STAGING_DIR_HOST", "${WORKDIR}/recipe-sysroot")
+        e.data.setVar("RECIPE_SYSROOT_MANIFEST_SUBDIR", "nativesdk-" + variant)
         e.data.setVar("MLPREFIX", variant + "-")
         override = ":virtclass-multilib-" + variant
         e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + override)
-- 
2.34.1


