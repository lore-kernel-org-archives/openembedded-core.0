Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25708C43219
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 13:31:40 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.12308.1668951097009428216
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 05:31:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hVO1MFyZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id d1so4111050wrs.12
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 05:31:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lmEh9yE0uJXLtB24stAWt6LC+Ryy/V6E1GiWdFpx2Ko=;
        b=hVO1MFyZHpgnaAYA8f/fVJYbXZ5xSR7BJIRzW3KgQ3gdkO2Wt87V/Lah+UTYiGFttX
         RCWRjzlgk4WhoDD8YwHf/RJeUfRRHkueCGqMyBRqyUo3w1SeqN8sC1KBk3BmLxim5Ybb
         UXFdgTRjDjX8bsiq07NzeL18xjTVMbRUdbsowlaAZxoPKQpJ3b0FxsU2W4PP7MbsvIYY
         Hx1uNdMK4DwZl46X/38rdaP8RsRA9i+dt64hMouEmybbQHeNTbCxSgqZ8pDkAF377Tnz
         5XcGwLBzPkt99muhbTyH3mXn7ckCQMCTvT00tOvgpkGAkQMhoKecRnCVfmlB4OLZmvDv
         Cpzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lmEh9yE0uJXLtB24stAWt6LC+Ryy/V6E1GiWdFpx2Ko=;
        b=Z0PkdC691q3kmXqkKDivMc/QmJDhF+87noN2TPcrheCNvx7YZtjk3IfqM3OQLc1KM0
         qXPqX8nlV+VL4pdv+Wkf8prUEfXOTfF+alzeV3N9YEEIW+OQYJCA6p99JvWtNW7mvb4P
         bWOszdiPRBBvtEwrTs60dZCs/iZZQTRKqQaCA3lDsB92MGHAz0mVP1hFj+32K6e1g0ev
         MieiI2jOxPvHEIeB8sWa6ujX4HhGvtERhANST0xrnfsO2jsK+HXNDZjVT0FcOrQKEEVJ
         1QpQFvzP8SgSeKZeyARuYXlIXS3QC2LC1rbnKRr2WAL86/CXhYtW4GfoN0GmC7Kpn/K+
         bdxQ==
X-Gm-Message-State: ANoB5pmJWhBCPwAxi2BfOcx4pdKIxpE7OLPAyLpirbtC+Lyf+1vNTBEB
	relWGXWUx0Fc47rmLp3ZGDkTRNvwxGo=
X-Google-Smtp-Source: AA0mqf7OjWi+7MqCQHEjKNKUWMCCKs6Y+J6mIqmuvvOoNJFzBgKHg91xcm8D+058TerGKGeDX4/Q1A==
X-Received: by 2002:adf:d219:0:b0:236:599b:d09c with SMTP id j25-20020adfd219000000b00236599bd09cmr8747206wrh.433.1668951095523;
        Sun, 20 Nov 2022 05:31:35 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k18-20020a05600c1c9200b003b47b80cec3sm16295551wms.42.2022.11.20.05.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 05:31:35 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/17] libhandy: update 1.6.3 -> 1.8.0
Date: Sun, 20 Nov 2022 14:31:15 +0100
Message-Id: <20221120133122.2464634-10-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221120133122.2464634-1-alex@linutronix.de>
References: <20221120133122.2464634-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 13:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173590

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libhandy/{libhandy_1.6.3.bb => libhandy_1.8.0.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/libhandy/{libhandy_1.6.3.bb => libhandy_1.8.0.bb} (93%)

diff --git a/meta/recipes-gnome/libhandy/libhandy_1.6.3.bb b/meta/recipes-gnome/libhandy/libhandy_1.8.0.bb
similarity index 93%
rename from meta/recipes-gnome/libhandy/libhandy_1.6.3.bb
rename to meta/recipes-gnome/libhandy/libhandy_1.8.0.bb
index 01ca699d04..2f7d47290c 100644
--- a/meta/recipes-gnome/libhandy/libhandy_1.6.3.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_1.8.0.bb
@@ -9,8 +9,8 @@ BUGTRACKER = "https://gitlab.gnome.org/GNOME/libhandy/-/issues"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=libhandy-1-6"
-SRCREV = "2885c314c9c84037b6fe55ead6a232e60ebfc9c5"
+SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=main"
+SRCREV = "fce63fcc85621c33dab85e32b349d707bf6d1552"
 S = "${WORKDIR}/git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.(\d*[02468])+(\.\d+))"
-- 
2.30.2


