Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E3AC76196
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 22:43:09 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.444.1679092981863320864
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 15:43:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=7K+EoLW5;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id o6-20020a17090a9f8600b0023f32869993so6787165pjp.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 15:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679092981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hcfKNmS9JWM+wKixkJbBMy2YQCe7XU7YiJePK5jKoBg=;
        b=7K+EoLW5/NqzGSgbTYcoHc+wefN0DkJ6DeXk0w9WM27dXpPGutnRkp7YV2UPbB6E1V
         9IJRsDO7t5eNYeY0AYIJuV3Mpeyt7m38T5iqzr5f0d2gqmNTSsoyhcOXnrSIJkBP/ERy
         z+vVFRy31+TXuLKhpcb6bJGgZZ5qG4RDqdrgZsfxd5piGDpJmyfgMhlQs3zoQU/Fq7F8
         85wpkRmPOrac/UFPVeGUopmaEdqS0MsmSEJZAhjKT9IFZwie1i00XAS2hdPPqYvQxiY1
         b6GT6zUi+pX9y6NoMCMfKkcw+mK45jfhXJT5sJHA31TCAD11nrWfYZSyIGjDQzEQOZ2D
         sBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679092981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hcfKNmS9JWM+wKixkJbBMy2YQCe7XU7YiJePK5jKoBg=;
        b=KyWvN2jRxtFlZpFE8YLM+3UHkx412VXAwAJACha22TUyyKBOK4e4YegUVQtOCnOD74
         krhMQ9yMrOzVrzdMwmaMKJoQT0o6+OYeIaWgSXKmUMvvQ3DkG1PoUB0cR+9mGx6/Gnoa
         scYEddygom7jkdFb5PrVynTaHH9/DSQ0WV371eYcsa/siHiWa3z7qn+yjUxqDzTBbSs1
         565M52Bb6VNP/1mCcayYx68yJ+MMO9yuFJ1vn/sK+kdfbtSv85G3dPVgr6FbVfnzN6l7
         LsRGWtrDDK0ZWcKMi5+uiB5nIv9PXlzCvrkPv8uuSy5mCZ3B3VEY+Yekbi3DMbsznCfp
         KY3A==
X-Gm-Message-State: AO0yUKWYwO0uooj9PwLB36qCrA423pba+0vPNePJi3IVNHHQpNxrbLy1
	EeGUbZNAHILw8jxXkZCcib4TMh22AX/v92TCOm8=
X-Google-Smtp-Source: AK7set9A85vvDjLhxdOPyHFcss6lVrGW9OpIDcMOyE4m22moFfvMAlyyUcv8PgF9hmVNGeNlS+BMKw==
X-Received: by 2002:a17:902:ce8e:b0:19c:f698:8564 with SMTP id f14-20020a170902ce8e00b0019cf6988564mr10413140plg.17.1679092980846;
        Fri, 17 Mar 2023 15:43:00 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id jb13-20020a170903258d00b001a19040435bsm2027152plb.100.2023.03.17.15.43.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 15:43:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/21] staging/multilib: Fix manifest corruption
Date: Fri, 17 Mar 2023 12:42:24 -1000
Message-Id: <0aa703c06bf101114836ac701bbb524302c0753a.1679092796.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679092796.git.steve@sakoman.com>
References: <cover.1679092796.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 22:43:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178771

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
 meta/classes/multilib.bbclass | 1 +
 meta/classes/staging.bbclass  | 7 ++++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 5859ca8d21..a0be559970 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -45,6 +45,7 @@ python multilib_virtclass_handler () {
         e.data.setVar("RECIPE_SYSROOT", "${WORKDIR}/recipe-sysroot")
         e.data.setVar("STAGING_DIR_TARGET", "${WORKDIR}/recipe-sysroot")
         e.data.setVar("STAGING_DIR_HOST", "${WORKDIR}/recipe-sysroot")
+        e.data.setVar("RECIPE_SYSROOT_MANIFEST_SUBDIR", "nativesdk-" + variant)
         e.data.setVar("MLPREFIX", variant + "-")
         override = ":virtclass-multilib-" + variant
         e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + override)
diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index 885bd347e0..044873c9ae 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -269,9 +269,10 @@ python extend_recipe_sysroot() {
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
 
-- 
2.34.1


