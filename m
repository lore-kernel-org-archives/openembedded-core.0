Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C349EC6FA9D
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:04 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.3138.1675840912340393705
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:21:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bB41t44g;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id l21-20020a05600c1d1500b003dfe462b7e4so2134492wms.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odeSn+r3d7oLtWsv89Bp9qyEFz0D1huQRHxCJ8kSyDA=;
        b=bB41t44g/XB/fi7v+FjrB3cSn8vpfAdKZazMjBKqKss7gdnRb6E41G1wu+weoqrJfO
         yCQxx8NaFugg5/z7PuKvoh5Db54LO9775kmM5+IZjCfEvq6JtDyTZyiThmFlNRcdmnmR
         8i3tEPNQf8ns+2AxPzZQgZmaVP0a0/EpFOWI1KYmaxLsMlIURinarm6qkDSCuun3A+Pv
         SN1fuGpjZ8xZo5MlzM5KyCqk4YUtO6hl8uy4wpMOjfZdgcRr53nTDlZf1bTzVzlX+QxQ
         Uc2HNWotmNBTcZG/iGv14fZqqBQ3yDBDkfmi5f+0BkDlhdLnMrHl2y14V0HAUaasuEvx
         JViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=odeSn+r3d7oLtWsv89Bp9qyEFz0D1huQRHxCJ8kSyDA=;
        b=41SAP0uNyIT1U+vQryREnYUuYyL31sMhLdDE3Ubls0LUAfv+lYDjUvpszE3rTk48qH
         tks3WMULQ7f6qlFkVQ943Alh93AJmc/5rEZ621WK4Ioi2L71eRFyIDNdTRNKblMjXiNt
         3TFsA4amjhqsNornLIoH6LDX6ImgYfKNZmDMmPTCFRzD1bc8d4WJ6N/fw/uMNmVuHf6x
         kD+vtce5/8N6JmXYZ4Zx9sNs/Qi042u9vWQO/dvv/aNmf25Jfl9/yr1iLWMmgKNZ/cQr
         v0SBWhuUMeCSmgO8oeqtcZJefEUWqqzSCb+/Yx00U5ZEw8QYMtCNbruUZRVFRDHttUjp
         8yRA==
X-Gm-Message-State: AO0yUKV5RCeLNRbGZJ03Bezi6v/6V+5z3klHyS9qxoJ/8rfrcLSRYD7n
	Go2gCrDTofzfuHxMccLdLyvwyq5N2qM=
X-Google-Smtp-Source: AK7set+1+gpuhR0oz/PyRD6Z+Fpg/sobuRk5whJJT0eF6q6PfE/RdsJNk4Thmwz8LFw6j7jeosBWUA==
X-Received: by 2002:a05:600c:16c8:b0:3e0:185:e935 with SMTP id l8-20020a05600c16c800b003e00185e935mr5479534wmn.36.1675840918587;
        Tue, 07 Feb 2023 23:21:58 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:21:58 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/52] vulkan-tools: upgrade 1.3.236.0 -> 1.3.239.0
Date: Wed,  8 Feb 2023 08:21:10 +0100
Message-Id: <20230208072143.2930292-19-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176859

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...{vulkan-tools_1.3.236.0.bb => vulkan-tools_1.3.239.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-tools_1.3.236.0.bb => vulkan-tools_1.3.239.0.bb} (90%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.236.0.bb b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.239.0.bb
similarity index 90%
rename from meta/recipes-graphics/vulkan/vulkan-tools_1.3.236.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-tools_1.3.239.0.bb
index a3561bbb5c..934bd53ee1 100644
--- a/meta/recipes-graphics/vulkan/vulkan-tools_1.3.236.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-tools_1.3.239.0.bb
@@ -6,12 +6,12 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=master;protocol=https"
-SRCREV = "ce45337c51ed53e6f1b337aa746a5a96c5018f86"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Tools.git;branch=sdk-1.3.239;protocol=https"
+SRCREV = "84c61c463aecdda385de33b0149c7368119c23f6"
 
 S = "${WORKDIR}/git"
 
-inherit cmake features_check
+inherit cmake features_check pkgconfig
 ANY_OF_DISTRO_FEATURES = "x11 wayland"
 REQUIRED_DISTRO_FEATURES = "vulkan"
 
-- 
2.30.2


