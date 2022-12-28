Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A12C4708D
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 15:23:55 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.182560.1672241022601839846
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Dec 2022 07:23:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ai4VzGUI;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id h16so15188577wrz.12
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 07:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jYLIKmkvQJnIg3Sh9/k6yXV52jav2Ydx0BeCZo2skM=;
        b=ai4VzGUI7mHfJmQbEiYyO4Wftj91Pd8CyzZcTy66ZyukX6UpTGVoTTWgkwgOQSuOyl
         QNWZMjbEf02h3wRumDtZukJJhooaBXUXXK0lYOaQMySg1b3FGJadIVl5qD8b4haLLHz8
         icAk3N3LF8XeDEDthfy3bLD7XdCrG8O4wkyyjkvgX4hUVH0OrY8tUKEd2tGwXFqlk0c7
         wpzKXO4+HbtmIYoo4vKuwdS05IYLMpwK5+vyMc9qnHSO9WX1Anel1eZQgukkYY0Idxu3
         8aSjrqrbesVSWrnALx9D2qEbIueoEEjviK+9xw34zqhBhdhn54eNyA0dXdS2Ft24jhFT
         Qf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2jYLIKmkvQJnIg3Sh9/k6yXV52jav2Ydx0BeCZo2skM=;
        b=rL6Edw7jPFKabYyljNF449nvjNKmF3E8CaRlWCnAZdn+1A46P730HOeEClBr1hVSPp
         Lr81CjVO4ljbysMOvPUiyjDvjQQK8uSkjdSIkPlkKNVu1PXXe+ahmjTSGXdI8hL0jOSj
         0dqJRGIRVhXAp/6KEJie+yJkYr364OLpkZznbSwkamcGfwzZ0BPv75vDNnWkDZnN3AzW
         wGErkhkfvtv65jSgL/4A+Rel/ooe1LrdvHeXPuPoNOIG1rYYgBIxalOiiEmClhLnmc4h
         OLRVY+Mkq7UqcmhyiXLWTqiE/GETyFbEpFAuFGOQDHqGr2iJKvWGyWWbX68ViJrYuOx0
         6KMA==
X-Gm-Message-State: AFqh2krUGbQyr4JioAwutxBLnCVHYBMLr1coDk84XBVH23cdfksdDoKj
	FBJMTZMpUoHzWvjynNh/hNVy/rc0kM8=
X-Google-Smtp-Source: AMrXdXuWD6xkFwsL6YEXNtvaA4i1kbNknWQQWaf1RnoXdo4SER37sKgfley00MsBOAz+6oiRICITPA==
X-Received: by 2002:a05:6000:614:b0:242:17a6:8bad with SMTP id bn20-20020a056000061400b0024217a68badmr21197875wrb.60.1672241025212;
        Wed, 28 Dec 2022 07:23:45 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id r17-20020adfdc91000000b0027973315213sm10884893wrj.89.2022.12.28.07.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 07:23:44 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH v5 04/12] packagegroup-core-sdk: Add SDK toolchain language selection support
Date: Wed, 28 Dec 2022 15:23:26 +0000
Message-Id: <20221228152334.25449-5-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221228152334.25449-1-alex.kiernan@gmail.com>
References: <20221228152334.25449-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 15:23:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175073

Use SDK_TOOLCHAIN_LANGS to allow different language support to be
selected within SDKs. Initially supported options are rust and go.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

(no changes since v3)

Changes in v3:
- Switch to packagegroup-core-sdk driven from TARGET_TOOLCHAIN_LANGS
  (which defaults to SDK_TOOLCHAIN_LANGS)

 .../packagegroups/packagegroup-core-sdk.bb             | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index d70aff22c725..104f3549d593 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -11,6 +11,11 @@ inherit packagegroup
 
 #PACKAGEFUNCS =+ 'generate_sdk_pkgs'
 
+TARGET_TOOLCHAIN_LANGS ??= "${SDK_TOOLCHAIN_LANGS}"
+TARGET_TOOLCHAIN_LANGS:remove:sdkmingw32 = "rust"
+# libstd-rs doesn't build for mips n32 with compiler constraint errors
+TARGET_TOOLCHAIN_LANGS:remove:mipsarchn32 = "rust"
+
 RDEPENDS:packagegroup-core-sdk = "\
     packagegroup-core-buildessential \
     coreutils \
@@ -23,7 +28,10 @@ RDEPENDS:packagegroup-core-sdk = "\
     less \
     ldd \
     file \
-    tcl"
+    tcl \
+    ${@bb.utils.contains('TARGET_TOOLCHAIN_LANGS', 'go', 'packagegroup-go-sdk-target', '', d)} \
+    ${@bb.utils.contains('TARGET_TOOLCHAIN_LANGS', 'rust', 'packagegroup-rust-sdk-target', '', d)} \
+"
 
 SANITIZERS = "libasan-dev libubsan-dev"
 SANITIZERS:arc = ""
-- 
2.39.0


