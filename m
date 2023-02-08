Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9005EC677F1
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:04 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.3147.1675840918832980750
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:21:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=peR3TjIs;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id l37-20020a05600c1d2500b003dfe46a9801so761688wms.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2qMxjwriUsr8Y3NQ5uvvXr3dCkCSQ0W1fOTw/ebBI74=;
        b=peR3TjIsn4vF8xzN/jHhVeQGCfDDe6KQ+iZY3ZrIADJ0Kiq3DlOf/Q8uk46Pcwt3mw
         lvUTgzP9lJoCRqzeCobUlk1BSdJP59+HmmrcPiveZExAqrB3EOxAZT+NRbTSGc9rEkx1
         4HClZoQX9sUd13eDxVkKdfEDIZKGItITZZRpKwkQ8L/FqsweOeEAaXYSGRd0SA2/YonU
         7H1D8Ov+jhuOzg0oGrIriRbQnUmQarElK9jVfJDxQC7ic9xNRy9J/Zym5VgoHyh2+bFM
         6+6VwnAIgF7bCyMIPuSVle+p1/ndqvKyW4984yt+Pm7qPiolawcKfK0yox/4MikhrYhy
         ZUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2qMxjwriUsr8Y3NQ5uvvXr3dCkCSQ0W1fOTw/ebBI74=;
        b=2XVYQonBmn+zVyZPrH9poNjJNih828FqKp4PabG0bLSxbH+JTzlF9wyJIfXwkadkE9
         doopee9wTF5SX1xko/K54ZT6G0D5frXhlxm+31mCWudzO2XAM955DYqdwVg6yg22I72D
         +Go4Zk4AazOsEmQOn3mzXsjfIqkGsdcUo2yXzhTZCnWPDpqiq9jFjFcBCQWp8wEsBiRk
         H6jM/SOg0TmAPzYk8FVgT6YF/3Ic5KzAEP+z+StySTL5RRHKh+oVCSrGM0x0m9AljNZB
         34bMW0zQZrGeZuU5luFj8AV+/RsuNi26gjnElBl8HJK/T4bOloT0MI6eaRx08crkj2+R
         wTTA==
X-Gm-Message-State: AO0yUKUMbPBWa/1u2iseA0JZPZi6REj5m51BTOGWjXkELWw65NZAUdf1
	s7mDK33sgnu7nDMAt+PJ3ZF6uqrMpdg=
X-Google-Smtp-Source: AK7set9G9buwiI8/qxn2iZlbSehT0GYhsSoNfdCPnX8KLp7HMKjQgycjli52mQALB3M1HdF6l5glJw==
X-Received: by 2002:a05:600c:43c7:b0:3dc:932f:f7cb with SMTP id f7-20020a05600c43c700b003dc932ff7cbmr5636277wmn.37.1675840917403;
        Tue, 07 Feb 2023 23:21:57 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:21:57 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 17/52] vulkan-headers: upgrade 1.3.236.0 -> 1.3.239.0
Date: Wed,  8 Feb 2023 08:21:08 +0100
Message-Id: <20230208072143.2930292-17-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176858

/usr/share/vulkan/registry/stripAPI.py is a python script,
so add that to RDEPENDS.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...vulkan-headers_1.3.236.0.bb => vulkan-headers_1.3.239.0.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-headers_1.3.236.0.bb => vulkan-headers_1.3.239.0.bb} (90%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb
similarity index 90%
rename from meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb
index 8716376fc0..a6b30fa831 100644
--- a/meta/recipes-graphics/vulkan/vulkan-headers_1.3.236.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.3.239.0.bb
@@ -11,12 +11,13 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=main;protocol=https"
 
-SRCREV = "b75e5a02b6933caf86c5822d019067b335492c85"
+SRCREV = "2bb0a23104ceffd9a28d5b7401f2cee7dae35bb8"
 
 S = "${WORKDIR}/git"
 
 inherit cmake
 
 FILES:${PN} += "${datadir}/vulkan"
+RDEPENDS:${PN} += "python3-core"
 
 UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
-- 
2.30.2


