Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B949C74A5B
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 21:45:44 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.5145.1679003143375791807
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 14:45:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=0CVmkTZc;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id s8so1882748pfk.5
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 14:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679003142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uGXQ6n5kv0NyXcWEHKt48BGjpVQJGz03LuL9KRCPtAs=;
        b=0CVmkTZc4Jt87NutKnWyHkixNVefqJP2pdDNVdqEpEjm7x+2r25/IjIovIA6ZFSF1e
         n/1UbaZzJqP6/FODJPaogPMLF6bjeAUB8QeWckb78RbazUqOGN6aM3qcsovqwH5EkXLV
         uCrnHZtO8eJqwNK9Eb8DZ0BwcKdaro1kRKUoCbCMHbZx5t4huAgXbk6oEYDbz7oX5mzu
         C4N7T0VoqWRSh3T5APYzDx8vm9tLB9t/+d/Tkk/k6Xk2IhdS3px40/ErfKfD/5L9hONb
         nbT/w0ExD29FmXkJghQ3vhQIzjHTfxhpmK9ZrwGoW3WNzWPNrzcSCBAkSSFuAHUC3xH+
         9+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679003142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uGXQ6n5kv0NyXcWEHKt48BGjpVQJGz03LuL9KRCPtAs=;
        b=Q7OuxFN+jHY7E9iHTSwjuz2xD8niG8EflGb2JgnIQhx2nBn4yLLSIanrA/5yMCK05+
         RnbevI19f7w1oViQmuCxaGDmoU4eWJea/hfLLDwyohXSf03pHusGFM786WhM2fp/s9vi
         Oj2VCHyPGRcR/X86UuBYR1/pWzcd/ZTaFAAQvANzDNZUAPeTAzMErJoQEWbuLT7zvG9z
         WVp3n/7Q8NfQuE+WphOXmW1EtWapIkmC1JvLQvSfTTjtdWAxuSXhzClVaHHlqIx9w1mM
         7fIPPTSjMzaa62Oz7oHsjoUTEVGahfBAbbD8PxFPHCYxpTfW4OkpgXasWLIiVqpczQx3
         Ycvg==
X-Gm-Message-State: AO0yUKUYOYD7oz5Y9xrPel7mrrYfDFjFlGlLYRgY2rlqvS3kXJBk2yDH
	RvbLc5Fv42qD1UjhLdyP03dVnaK8qy764gDzKo0=
X-Google-Smtp-Source: AK7set++SagkB8aPCLxtEZqHyRe/Unk+ffzcfvv7C1LXw6AiXjpoWyoeyE5ztHJ19xsENKUoWwT6mA==
X-Received: by 2002:aa7:983d:0:b0:625:ca90:754d with SMTP id q29-20020aa7983d000000b00625ca90754dmr992582pfl.3.1679003142375;
        Thu, 16 Mar 2023 14:45:42 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id bn10-20020a056a00324a00b005a84ef49c63sm137746pfb.214.2023.03.16.14.45.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 14:45:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 08/23] staging: Separate out different multiconfig manifests
Date: Thu, 16 Mar 2023 11:45:05 -1000
Message-Id: <f586498fbaff190d48e4fc927e324c5371df4b17.1679003014.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679003014.git.steve@sakoman.com>
References: <cover.1679003014.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 21:45:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178719

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


