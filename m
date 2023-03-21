Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59410C7619A
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 14:20:47 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.14396.1679408446044889184
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 07:20:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=bzkQ70a6;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id c4so9107594pfl.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 07:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679408445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QFmtC6bEUEVDgHg6YVxgDnDCCB2eETC6LW6RvdWZAvw=;
        b=bzkQ70a6eZSUwS3x8en0WGJbFiCvjP1/NM5UJW5Z0hXzoX3UW3YWaqGzhcabiSzbtG
         RoJKs0KUcPS2ngvIQiibQJyauSYbk+N1+3xiP21IAbzcp0RuLd2Z1pSmDFIItGWQUL3Z
         4EC8Nb/Ta5W7/q3YCae7KOogsvXqj2uXirsw4AlIA5cdH2DbNV5OI2Z4RTq/f/oHu92v
         WEZcdSS9nVuAp2mGejVj++z/nAVGukb9tWTaoh4biQUAbsRsBB4hCGOx5iL+FVfknQsm
         617OmJT8wSbaWoNJsAHnjkRy6Ub+pCGOBTDiYmvNZbbcaDdPTULhSrq2WP7QMVx+fHbd
         4YTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679408445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QFmtC6bEUEVDgHg6YVxgDnDCCB2eETC6LW6RvdWZAvw=;
        b=EMasvcCL1msuKEgdIx8UramwJqm3xauBATQ58uVIZaa7NHkR6UABo7MZvwzj9D5acs
         VuEp8z+E3yK3Otl4M7o4tLcj5lz4EQNS3EqZ041Om4gq7qFF2Ko3Jp8hb2v1T0b+PtZV
         fh6tge9jo1knAqzmHQ6d+5TKqvBA6plvC3zsHWB9Pj8xG8339xzrKhrFJxAJ3xxocqGV
         ZXCaCgQLIiuZktoeg165ULcq2aB6wgIoNCbtq+oGA7/2r1VHjiiUnyy0ZXQSQtK/ne32
         hl1GNZCKf6Q9bHebE0r6Cz7tX5vd5JPrx2ZK8lgDKiMGp6u68Iz7ttZ90x6nXIrsNjlp
         f47A==
X-Gm-Message-State: AO0yUKXNEZKIudEAhLDswbr0LgbP9Y46kjcOM7AgggwSVjLyD5QS5u2Z
	6OGk2FmkaabncJ892F5rVzXCzwxQ+dmoYLjQJ9I=
X-Google-Smtp-Source: AK7set8w0ddls/a44q7H+6rc7KkPAWWWBNgmvBqrC+wcjOfaM/BIy6yOgMqCUhJSnQ2nJGb7HpeBxw==
X-Received: by 2002:a62:1bd3:0:b0:626:444:bfa6 with SMTP id b202-20020a621bd3000000b006260444bfa6mr2468350pfb.26.1679408445145;
        Tue, 21 Mar 2023 07:20:45 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id g11-20020aa7818b000000b005892ea4f092sm8551291pfi.95.2023.03.21.07.20.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 07:20:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/14] staging: Separate out different multiconfig manifests
Date: Tue, 21 Mar 2023 04:20:13 -1000
Message-Id: <eb9c6f7ac91431a6296789c23900f2a3016ef619.1679408291.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679408291.git.steve@sakoman.com>
References: <cover.1679408291.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 14:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178879

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
index 78eb914921..4177e6cf05 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -267,6 +267,9 @@ python extend_recipe_sysroot() {
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


