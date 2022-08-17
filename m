Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E781BC25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 19:01:36 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web11.32742.1660762894373257899
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 12:01:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112
 header.b=V93W6Oee;
 spf=pass (domain: baylibre.com, ip: 209.85.221.68,
 mailfrom: jstephan@baylibre.com)
Received: by mail-wr1-f68.google.com with SMTP id r16so8022320wrm.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 12:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=FkCBzWrKa8fN4ut9qKTcwA7zDlUtjmEZDwYn1u/vKU4=;
        b=V93W6Oeey7ytWSCESsV8kjsF0bRH/7fDvjgsCGWJE/QYoAZdwdXmUddYF7ghxmUETK
         oNXIZlNytJDeWjLaN4+I/YE24u4hxr+wyagwxFraxmEGzJMvpkqCzEgDQW3HWa0qLsdx
         3wPsdJ795d0cnMceElsn0sfQXC//A8I2XCFRR4HI8O/yp0rrD7o0VkAccrdRbru4/AIX
         jEsImbv/rG2ydfN8kfCNPsDKzoHvxYqQT0TWXGDnaRKPETyYhbBUCfx5aSgQHMkVtBSp
         ptueWgp+HGBnM1ypgW90VOUMfoXDGUeV3ba1ykbZxtB/OULzYXs9gKJiK3hCA5oGE8Io
         +fkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=FkCBzWrKa8fN4ut9qKTcwA7zDlUtjmEZDwYn1u/vKU4=;
        b=MokV+/qHfD+zl3f/u2x/PyEOWj1U88gU5Zvr3GPYqwt2+2OEhgNCk2OD1+q+R8A28C
         O8L8auNCuLcobF56eDFUhsRDRY965RtVMKF7WO1iDJ3wVJOdIOUiaF2bq+j5LWtB/dxv
         e0nr6aCPtpGMQGbBQIppHbpyV7mGy9rm2Js0+biOIEwVnB+2lQmGGqfow2NVGeBTMOdS
         ePdi6Rpkw2778S8wOKSmtaTqZDb8MOgbTsaOojj7bZd7xdV/kz2CCcYn6U3F82Da53gm
         25xZD2gFL9V4ArkzigBaWdqSzLjuZOsqj/Gnf4xzXVpd5bS5+qdKi2HaaDlnnZUxIqn8
         l+mg==
X-Gm-Message-State: ACgBeo29f9O9LQMG/Gh3y1IO0zdiMJULwpGdqTnS1DgjFIML3TO7QExM
	zazg0QGlwhicHFxQ6k7M6hrxNkmiMZkZIHcc
X-Google-Smtp-Source: 
 AA6agR6MktD/1e4udrfvSg+fbTzdmh11JmF5VhuwMFpckPZisQak1yxNpTLBeFAvY3/tdV7+O1FgEQ==
X-Received: by 2002:a05:6000:987:b0:221:7e59:45ec with SMTP id
 by7-20020a056000098700b002217e5945ecmr15109267wrb.64.1660762892169;
        Wed, 17 Aug 2022 12:01:32 -0700 (PDT)
Received: from localhost.localdomain (176-153-27-224.abo.bbox.fr.
 [176.153.27.224])
        by smtp.gmail.com with ESMTPSA id
 a16-20020a056000051000b00223b8168b15sm13447711wrf.66.2022.08.17.12.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 12:01:31 -0700 (PDT)
From: Julien STEPHAN <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien STEPHAN <jstephan@baylibre.com>
Subject: [PATCH] vulkan-samples: enable network during do_unpack
Date: Wed, 17 Aug 2022 21:01:24 +0200
Message-Id: <20220817190124.2126652-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Aug 2022 19:01:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169500

vulkan-samples uses git submodules and one of the submodules uses lfs
objects. During the unpack step, the lfs objects are retrieved leading to
a network failure.

The correct fix is to fetch lfs objects during the fetch step, but let's
workaround this issue for now

Signed-off-by: Julien STEPHAN <jstephan@baylibre.com>
---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index 41cb4a437d..b45ee22a69 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -11,6 +11,11 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=master;prot
            file://0001-framework-core-hpp_vulkan_resource.h-add-header-incl.patch \
            "
 
+# Workaround for network access issue during the do_unpack step
+# this needs to be fixed in the recipes buildsystem to move
+# this such that it can be accomplished during do_fetch task
+do_unpack[network] = "1"
+
 UPSTREAM_CHECK_COMMITS = "1"
 SRCREV = "ee6c1522af8ba9b56f8416c2eedafb440f681085"
 
-- 
2.37.1


