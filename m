Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65159C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 22:59:05 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.5734.1678402737977066468
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 14:58:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=G+pWw69L;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id ce7so2522524pfb.9
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 14:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678402737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uGXQ6n5kv0NyXcWEHKt48BGjpVQJGz03LuL9KRCPtAs=;
        b=G+pWw69LoCccika2QWN75N4ZgbIVanv0bnhQaSqNgFJAwXjVJQu5bonkYSq9IU97nP
         PlIU+YEP4HGyCb6UBdEYObBLRIb8JYjwUqbHRaupjA0+Y4fT14jgq2CBaBY3sghJfkZE
         ur7FNeb78BejUuwugR7ouco58qFMCZGRnfb7QOtvhLP1DTZMWYPUi9Eliy89b2+wYb7D
         7wHb+mYom59ePFnEWxPEaEwbsFTSn49oDyoe3N1K2rbQJD41JRKzjPdsAuOneGWew4/T
         vrzSBXPy8zU3RUowEPApZstAzEXiwoZChEzQUvnuqsY3bite/31Q2eHgGu2LTlYeOtC6
         itgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678402737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uGXQ6n5kv0NyXcWEHKt48BGjpVQJGz03LuL9KRCPtAs=;
        b=HEaT7kUVTsmQPk9OxBJUB1xEn437XRJc7gwul3Tr9DAhKdQRAWromNGGOt1ELr8pDb
         5vW34QwaezebHrl5L7gpUkHMESASK+Yx/pvND/QFtS7LyuhGoezZjkc1THwSg82wqZ5l
         Hk3GHiRYvc1z0ePqZeTCC+aLm93Fjeh1eNmvSfb3OZVHT0O71g4bd9Ggs6Ug/NhA2YZB
         FMLO5FXhzwaDnCFv9OG7BSZaFqscgI+DlOnNw03zqB66ltEN/69XaoD71umrexIFbqvw
         9a8SfzDEq7lF7v8RFwUWtwtDzIii/T7kQchTfASywT4pvTGfoN2af0g4Kafzyg1RWC1V
         Ia8w==
X-Gm-Message-State: AO0yUKXSZ4rlU5B/YQPJSbXjS3Is2mr8CzMZ/UYziBlg3m9tcpLh9Jkt
	xOGlAQcivsFQTDVUNXvNxWy6TzjX145wub3eITc=
X-Google-Smtp-Source: AK7set/wUuISjgfzP76Oeli9Ixh4eIN/kXujntrOvGPF7IN25ZamwpdN7OVRM4r7o1eI+zoyBTTNhg==
X-Received: by 2002:aa7:948e:0:b0:5a8:b911:a264 with SMTP id z14-20020aa7948e000000b005a8b911a264mr20510011pfk.28.1678402737030;
        Thu, 09 Mar 2023 14:58:57 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id j9-20020aa79289000000b0058db8f8bce8sm89717pfa.166.2023.03.09.14.58.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 14:58:56 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 25/27] staging: Separate out different multiconfig manifests
Date: Thu,  9 Mar 2023 12:58:00 -1000
Message-Id: <08cf44a8c2f524edf1ed353bbf38ef31d9e810e1.1678401759.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678401759.git.steve@sakoman.com>
References: <cover.1678401759.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 22:59:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178298

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
 meta/classes-global/staging.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/staging.bbclass
index 5a1f43de78..e6d0d1d55c 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -275,6 +275,9 @@ python extend_recipe_sysroot() {
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


