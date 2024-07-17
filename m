Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2182CC3DA42
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 11:34:44 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.13148.1721216079392800179
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jul 2024 04:34:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Kmnze/YX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4279c10a40eso43957935e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 04:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721216077; x=1721820877; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qYXvrVb1svhjnJecHOTcm5nz+7kf4dGLqO87Miw9Fiw=;
        b=Kmnze/YXqjneCJxJiz5+mJBAuaWj8YpZ/9xp4kfOBFUzgLx9IKlBB3+eu5K28W42pD
         cjzVmhO8fgMp95IC0H9zqS0Bt1wqIibaA2SsdJ0AsUDt9d5kP03hDcpD+aZ0OAQB09cb
         Ixwcldm5oRbAW5GDzrKK1gyc9iTVaJIPUPYnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721216077; x=1721820877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qYXvrVb1svhjnJecHOTcm5nz+7kf4dGLqO87Miw9Fiw=;
        b=t1G++QkFsx1ARDqxk+onvel4UZj12Lsbw3TgkmGPeLJD3jDic+7hBWkNva0d3so430
         GESYeg4IYoq1NYgfRYT50GNC48puR94ZavuOVv/EssG2K9zCiV2mTmqKneZFWFFOLtSG
         R64uXAvbXRexbdZg+vHmU90el5Vy5QZw1nqKJFWPUibqEiUdp9xElnX7nfSYYcs/OpVc
         y4CQWy+gPfH6unuNCiUZLZClJlWkQKexFV0dmj/Expk3Abe7FNTXrIBv58fOCSPp0OZQ
         ugVYiUH0+GEIHM60eAc/JdT+tvJoGf3W4gOZRXMsrmuKRRquBulo3LEVYrsed1eL6X94
         khlA==
X-Gm-Message-State: AOJu0YyCI20A9Rio82HYgi5HrPq3eHk4L57psgtke0MgO18WCT+xCoNs
	Bp45FQ/eGElnP5bvKQg9VbbGF8Jfm30OnnTHDTecwu5cgKng3e0VujqcU/M8v9NWIIIymeeBnet
	X
X-Google-Smtp-Source: AGHT+IFbr/WRwE7phzv1+x+l7vA1WZc3JEYztuWOrlmoLvenfVX/UwhVn9B/X7d6Ots/GlvlPWyBzQ==
X-Received: by 2002:a05:600c:4ec6:b0:426:6876:83bb with SMTP id 5b1f17b1804b1-427c2cb368fmr9898695e9.17.1721216076050;
        Wed, 17 Jul 2024 04:34:36 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:9a16:3e6:efff:89c6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f2397easm203389075e9.6.2024.07.17.04.34.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 04:34:35 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] testimage/core-image-ptest: Move TESTIMAGE_FAILED_QA_ARTIFACTS setting to image recipe
Date: Wed, 17 Jul 2024 12:34:35 +0100
Message-ID: <20240717113435.3561492-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 11:34:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202159

MCNAME isn't defined outside this image so it breaks other images. Move the
code to a better place since wildcards don't yet work in TESTIMAGE_FAILED_QA_ARTIFACTS.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/testimage.bbclass        | 3 ---
 meta/recipes-core/images/core-image-ptest.bb | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 72282ac3624..e06c903a425 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -27,9 +27,6 @@ TESTIMAGE_FAILED_QA_ARTIFACTS = "\
     ${sysconfdir}/version \
     ${sysconfdir}/os-release"
 
-# If some ptests are run and fail, retrieve corresponding directories
-TESTIMAGE_FAILED_QA_ARTIFACTS += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '${libdir}/${MCNAME}/ptest', '', d)}"
-
 # You can set (or append to) TEST_SUITES in local.conf to select the tests
 # which you want to run for your target.
 # The test names are the module names in meta/lib/oeqa/runtime/cases.
diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
index 72081f938de..a2f5b92996b 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -42,3 +42,6 @@ python () {
     if not d.getVar("MCNAME"):
         raise bb.parse.SkipRecipe("No class extension set")
 }
+
+# If some ptests are run and fail, retrieve corresponding directories
+TESTIMAGE_FAILED_QA_ARTIFACTS += "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '${libdir}/${MCNAME}/ptest', '', d)}"

