Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 584D5C7619A
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 14:20:57 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.14397.1679408447832312019
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 07:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=RvITiZxa;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id f6-20020a17090ac28600b0023b9bf9eb63so16055486pjt.5
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 07:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679408447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R/au7txvuKSDg9/NGIMjwQPZbjbPYUi2fJqmEOTGSAs=;
        b=RvITiZxabk/PWHX3eU3bZ0te1Zkj5CvKzezLwmWu7jCLSubEQK9YgQabnzJNqkYsYB
         rZ6+i5eAWam34ozTiET9ohDx15ivwAQas5xTbdkBNHPuMAi4ZCJJZS3wYO/vY7uF0fc7
         U81+rfNT+vQazT6cn97Wbvg6AWH/DNvluJ1XKX2TeNHW8E5CDq9x7nmKLc3AJdN2dmck
         RwZsVsvpNY6KXStleZhGt1XIk5Rbm/g1/mzgTYiTo1HSKgNJdOtE+Jgk1dtHpLDWX2N1
         E/0CCSeuGX5l8xltBpcDT6SdOtyyTHzhfJNz8mFEEoJGyalDhBbb0CBCqIc9Y7rUHDU+
         BU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679408447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R/au7txvuKSDg9/NGIMjwQPZbjbPYUi2fJqmEOTGSAs=;
        b=072R//7yGNKJ3dzbhIHUlIa6OR7LcBeYS11g8btDqakS1w3EQfbv77l7vTtsyTBsYu
         DUHQy8e5MVAu+n2VxRVKNS8ExmVjkbpPiGw55ud7zrwMgTgr51XNHKO57msocVW6N7kH
         ngk5j7T4ifMZqB8dfBWBCyVgyH051JpeamYL88PcWuEyVHbL6KblpkYVQ4a2x/m+FChA
         3Mz+VECN9PCzf5XHjcaQUrj2q4Oq9lnZbLFHrud7LlzhDlIW6+iOpQLuKZMXtfWI3Yiq
         xz6pgDrpIizaK42Qs/pQpiqintqe3lAhE8drTzbu/spgGeLEjxTPirQls8NvJtyHVqzU
         QGmw==
X-Gm-Message-State: AO0yUKUoC4HlLsoE9U98i+VHnT2OFTS7dDXkH3wX7JGwyjbTNUTQmDYd
	UM8dFoNbLdFukdeTws53WzDyqDgB1rwzY6A9flY=
X-Google-Smtp-Source: AK7set+oo0yMZSACtXYHQxmh+Nf93ABrv/aIzko8zwag54opovUd9jpy1Dh/WKoevxEsaQdUIOCdoA==
X-Received: by 2002:a05:6a20:9288:b0:d3:c972:9a83 with SMTP id q8-20020a056a20928800b000d3c9729a83mr1915005pzg.56.1679408446884;
        Tue, 21 Mar 2023 07:20:46 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id g11-20020aa7818b000000b005892ea4f092sm8551291pfi.95.2023.03.21.07.20.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 07:20:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/14] staging/multilib: Fix manifest corruption
Date: Tue, 21 Mar 2023 04:20:14 -1000
Message-Id: <271ac31e15d00d636e888a1f3b7d4e22e0b8267a.1679408291.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679408291.git.steve@sakoman.com>
References: <cover.1679408291.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 14:20:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178880

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
index 9a8b02d4f6..b5c59ac593 100644
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
index 4177e6cf05..21523c8f75 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -267,9 +267,10 @@ python extend_recipe_sysroot() {
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


