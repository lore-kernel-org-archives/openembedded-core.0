Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F98C6FA99
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 17:57:28 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.2237.1678125437929329666
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Mar 2023 09:57:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GyoLACEQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id bx12so9704358wrb.11
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 09:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678125436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wx36Opb8fwowerJy/s2oRNdCQTOUou3kAd2WTYJ+r18=;
        b=GyoLACEQIE2LYSvXJxDn+wp47/+BxGav4XZHp3MiCvuyLVzpaRduIBRZRybPbTwxzv
         29RoGhA8o+FhR4wZfCO8CiVMEkul1r401h4Dx2lemrwqL7yG9hOzWkWcftJCl649krZM
         idjAdPbs7IBZ6e0o5fswwwIxgC285AAzYxhG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678125436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wx36Opb8fwowerJy/s2oRNdCQTOUou3kAd2WTYJ+r18=;
        b=D3iDj6ntOpU3+cjtDfP4EmnJdd5h2w55PSFZr4t1Lzs1PJYsR+vFmvIQYJz41EE2PI
         xh6B9bkUe6wicyQl6FduArnZ4+iqEZuJQE3yc4wvAvLfJEDamDkfDNGIoASmMZXL0bId
         ZXr0FeAgCri2ELaM92x+11LpS9djeNBpQXUBj3NTp/1vzNK2N/VUflppSUvrliSQnBt0
         mLJIyOmg1YO7M2lU0yf8M2PUQW79ti1NG7327rvK0VprjYCwmwlA439tIXN01e/om2B1
         ux0I+tbI+848sB9xlI2MdY3dc2aNIcwSOhJNQR/OgAa0+EUPPSETlzV9vd2InKc0zpET
         H7xw==
X-Gm-Message-State: AO0yUKVoDBO+vdgGr1Bm2twXgbKywReQXrU4CGHdGZCfmpLfIGay58gE
	opdcnjHWlfcNxybw2mR61rCwZkIWDypPvUa5Dpw=
X-Google-Smtp-Source: AK7set8vrjJjBzZ+1MwbGwj+mtK4PSX55We8VUwXtRyVC5QLHQZXErAbKXS/7istnnkDjTTWFALtLg==
X-Received: by 2002:adf:f612:0:b0:2bf:96ae:7cc8 with SMTP id t18-20020adff612000000b002bf96ae7cc8mr7660903wrp.4.1678125436056;
        Mon, 06 Mar 2023 09:57:16 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fd2e:ab1c:fd8:608e])
        by smtp.gmail.com with ESMTPSA id f12-20020a5d58ec000000b002c71b4d476asm10439485wrd.106.2023.03.06.09.57.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 09:57:15 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] staging: Separate out different multiconfig manifests
Date: Mon,  6 Mar 2023 17:57:15 +0000
Message-Id: <20230306175715.2367039-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 17:57:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178082

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
---
 meta/classes-global/staging.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/staging.bbclass
index 5a1f43de780..e6d0d1d55cf 100644
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
2.38.1


