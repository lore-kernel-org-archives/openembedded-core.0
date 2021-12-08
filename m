Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C9DC433F5
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 22:00:06 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.3078.1639000805609143820
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mR3mxfWr;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id d24so6608697wra.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 14:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2tFvX6SJ8zvCY+z1yV01hc5Py7OesQ8YdV9DJZe4DFg=;
        b=mR3mxfWr9qLHV8syQGpCe3cTM+9wfuxrjuuI1Mq3A8GsuBIVWTjLO5tZN8E2D3+zvK
         YFj36lPGWmgxivj0P9xiYi0PegPzDm7MgNYITPnRArJ70PIEhNMc4eRV2EL1mxVy3Hp8
         +TXgpDVC+1nlXkzkduEo8zm4at1kdgWevfQXtJ2Gs82gMbGZyo/AMXCiGg8kNNwtIMmG
         vUdP9KW2rn4ObFW9OZ+ODL0uegBkeN3xJCx2R00tMVRFdNB7rGLFmGhCd1FnsWR6iIUh
         +ox8o85kx3wEgoaeqIePIFzZylZdBUFNNcqx2qBVWpHG4a0ZR7QT4Q7RH2yF0SScU7TY
         +2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2tFvX6SJ8zvCY+z1yV01hc5Py7OesQ8YdV9DJZe4DFg=;
        b=r2Z5awhPJcscxXugX4KDEFggpFqX3an/E0UyIP7xyrAHg9eG/+McT+iT2gg/3LnW7b
         ZgD745IHx5n5RprUV3xXs4Ub61sC7pYfnv4NtNG8ta96Xfup96cWAtduabbGbzh+FRsx
         X/YD0e2CjIJmQ6ddsSjRzlSmbbRnoZgEcp9T+v0Qv61u3cmcMlWvLanNUfG/6/9lYyNi
         aUv7asyZCV0DulJ7BNCynJ7LC29fg7hPcK2/2HIEdFM0A3BvjLqtmbS+qG5x8RyKRhc5
         HHjGIsCreK0Hzg8b9aataaAyJajfkHkPISRMrwnz373ZaaCuijCk/vppG4iaVZ3n9lcA
         M30w==
X-Gm-Message-State: AOAM5312xV0TUM8vUfQo+mVQ2rNkqoKqUH1tclOeiulmZ+WsAMdey2Ni
	oMUgdP7Hfad19mSDZgz0Zl5XLPb8xAKI5g==
X-Google-Smtp-Source: 
 ABdhPJynZYNJTACFcJ6i/XDcvnATYJd3wQL1EE8xH3YFIvyAHXQKxrVS5xQD1GVSaiBqfK0/LSu2OA==
X-Received: by 2002:adf:e84d:: with SMTP id d13mr1658099wrn.72.1639000804232;
        Wed, 08 Dec 2021 14:00:04 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 c6sm9177170wmq.46.2021.12.08.14.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 14:00:03 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 11/29] mmc-utils: upgrade to latest revision
Date: Wed,  8 Dec 2021 22:59:29 +0100
Message-Id: <20211208215947.1979470-11-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211208215947.1979470-1-alex@linutronix.de>
References: <20211208215947.1979470-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 22:00:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159377

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 661db4665f..507d5c4466 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "43282e80e174cc73b09b81a4d17cb3a7b4dc5cfc"
+SRCREV = "a1b233c2a31baa5b77cb67c0c3be4767be86f727"
 
 PV = "0.1+git${SRCPV}"
 
-- 
2.20.1


