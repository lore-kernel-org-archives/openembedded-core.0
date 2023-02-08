Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3438C678DB
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:04 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.3125.1675840909917555521
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:21:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aVHYIkI7;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso717150wms.5
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6XQmyko/yV/Szj/zps7QufMxi/7XXK5rQGtERUf6pxk=;
        b=aVHYIkI7PROm7HVw+76kgFL34urAHCiQ6y0oX4LhQ9MEWXURW8mYL8vh1Dn9W37r8u
         vK4G3S2Ca4/umSlCfMggCC0snR5mEKqTKccn/1lSAynC6tizkc6HY7dFZUTeTo73HKwG
         WJd5upeax3T+pLISUv+WA+G2GwaduxxpV/FYjopMgULLzwohPJT6Pwc+4np/kMX57QSs
         9UewCw061NT12UW98YHeWc6OjKEuZMdtbwpeo6Nizs0xKk3txYDVNiO9xkQCLrFUnnqG
         cusrHH7UuIXWhd0PNes+e7DCdD0Uh8J+qs5nX9NcJKL6bVbCUwpV7gJtt3h0hkLnea1I
         rJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6XQmyko/yV/Szj/zps7QufMxi/7XXK5rQGtERUf6pxk=;
        b=SKDLG1jVP4n2eCKKJdDa+vrjB87bN4uvm9QNydYnyZIS82DMZEnkKov4P4r6/sfDMB
         5UYRRBAWDrZh1YDtxLbTQlVE7A8wq/KMIis6YfkIQ/+KfURV/R/pJOFwbQHkE2M9Kkmc
         8Hgx9mi2SvxvDpNQemPIoioZDq+ywVfvsacWs618QcYwlMEPHm4/MZL3S9AeA2kyUUl+
         esUgArQfPLUWGETz3vEQJvwmh6DhDznI+B+Nt60Fzi2hvyPxJGqLNDGH9zO1/MuWmhtx
         AEvR/kOKQyM6OgLHjaRIZq0K8Qct6OX1iW7P2f1KSTjE6KE+WvX3MrtVigp42FCHV4yX
         YOvA==
X-Gm-Message-State: AO0yUKXlcaEIzVVKeviwVO9xR/9FLiUOm+aPnYIvg9gb+IyUAfqsFgPp
	PmeiokoHwwlzvJh3q+4Ezar82D9y2F8=
X-Google-Smtp-Source: AK7set+xhYqB7cSAJDeJVo3/L/irZp/IdXop+GyEeFYoFdQBKn33Yw4iqVGYOKNVuTvdThMbPZnU0Q==
X-Received: by 2002:a05:600c:164a:b0:3df:1673:90b6 with SMTP id o10-20020a05600c164a00b003df167390b6mr5319010wmn.39.1675840917964;
        Tue, 07 Feb 2023 23:21:57 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:21:57 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/52] vulkan-loader: upgrade 1.3.236.0 -> 1.3.239.0
Date: Wed,  8 Feb 2023 08:21:09 +0100
Message-Id: <20230208072143.2930292-18-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176857

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...{vulkan-loader_1.3.236.0.bb => vulkan-loader_1.3.239.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/vulkan/{vulkan-loader_1.3.236.0.bb => vulkan-loader_1.3.239.0.bb} (94%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb
similarity index 94%
rename from meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb
index 56f9d765f8..e11f936a0a 100644
--- a/meta/recipes-graphics/vulkan/vulkan-loader_1.3.236.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-loader_1.3.239.0.bb
@@ -9,8 +9,8 @@ SECTION = "libs"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7dbefed23242760aa3475ee42801c5ac"
-SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.3.236;protocol=https"
-SRCREV = "1ee83a25c2c20e2efbfc0ac976c7a3ddb5fc291c"
+SRC_URI = "git://github.com/KhronosGroup/Vulkan-Loader.git;branch=sdk-1.3.239;protocol=https"
+SRCREV = "fa421a02686e7f01c8e4af24650fa04374df8338"
 
 S = "${WORKDIR}/git"
 
-- 
2.30.2


