Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F96FC678D5
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 10:15:30 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.3553.1678270523761310688
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 02:15:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ftgi4qc1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id j2so14790533wrh.9
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 02:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678270522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LXx0VRXhTjC6hnJKJnv5HlRlJ9sSgV8FpyYlrKWh3sM=;
        b=ftgi4qc195eWUoK56xFJ2C3GyFvimZPLduesZO05ExkcaJB3forvy4vtB4chPC2x6a
         lWkP3pqcJEyjDdPMlXtEbWzMTx7ZX9MVoSBp0lnFNnbeRwuppm/7GIW9lJSGcwmTtLmf
         bdGhJ2u+UcoWnbcdTtd9UT9gourXbBNjcV6+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678270522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LXx0VRXhTjC6hnJKJnv5HlRlJ9sSgV8FpyYlrKWh3sM=;
        b=yFoA+xCXRTnv7HOAXmodCnsMD8qjO9b7WURIEaFmcpZvOpan2w9/wDbgg50hKKlj3q
         16BVLJZeRlYgpwM10i5H4lFs34uCCDggpRjblwPJgouHMNZG1akLUhNqLPlGravpSG0T
         h7fW2n5TWksDe0NAwQmpj7kStWoz8OnqMOU28EQbMFD48UtRZhMcLgYKIIQpm1yKbY1Z
         hSoApwwBng89Bqvjtcnu+ZbfgVjfPOIYwn1PnKlbdTMNcVtibo9pPr5FKTvfS0h5/Ln1
         T6dUoVRg8TIPXjWKtPF9mDm/6o44OVzbzQ7RiNvN20kkXjNOziEdGWpn3HN5StVsoGKA
         o/jA==
X-Gm-Message-State: AO0yUKVppouKntAyduqYXfSdbICwlb0pZHm6kCBde2ilK+fq/80Ymifa
	sxnio5Glhj5WhU+rRYMEFj++14sVn//POvBwT24=
X-Google-Smtp-Source: AK7set9jhPw+09sMxTZ687owAak6dtJh/fIO2rIQn4UEtUZXI/8mHISig/Cc/ScIYRzSAWoJaDECvQ==
X-Received: by 2002:a5d:4c4c:0:b0:2c5:4f06:5fe with SMTP id n12-20020a5d4c4c000000b002c54f0605femr11946984wrt.57.1678270521711;
        Wed, 08 Mar 2023 02:15:21 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1eb8:fdef:c144:ef0b])
        by smtp.gmail.com with ESMTPSA id a17-20020a056000101100b002c553e061fdsm14924249wrx.112.2023.03.08.02.15.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 02:15:21 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] staging/multilib: Fix manifest corruption
Date: Wed,  8 Mar 2023 10:15:20 +0000
Message-Id: <20230308101520.2722365-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 10:15:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178162

The previous fix wasn't enough to address all the possible ways the
manifests might be ordered. Rework the previous fix so it is tied
to the multilib cross-canadian code which is causing the problem.

RECIPE_SYSROOT_MANIFEST_SUBDIR is not documented as I'd hope nobody
ever needs to use this outside the core multilib code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/staging.bbclass | 7 ++++---
 meta/classes/multilib.bbclass       | 1 +
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/staging.bbclass
index e6d0d1d55cf..a058d344fde 100644
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
index 10a4ef9c37a..8a1a51aabad 100644
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
2.38.1


