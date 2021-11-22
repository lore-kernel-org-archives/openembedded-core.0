Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D88C433EF
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 22:28:03 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web08.3252.1637620082482845576
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 14:28:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d5C79K4b;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id
 w33-20020a17090a6ba400b001a722a06212so785042pjj.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 14:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3In/5C3e6jUWDjpc9LUPf/ibEHoyKgV2lj0yjQX7ORQ=;
        b=d5C79K4binT7GRTztiIVsih+yQ/+1PYhm5/LLo/G2LM8fzcJulBcj98uP7iUMQZEiR
         jZDZlRlHZS4TvUNVSX2IRkGWj0lDshJgt3EyT8JuaHFWAUKPiR5gRoaeKCDyczuhVtMW
         vIx7HA+5Vf/3LkfZTk7fF4Z4hVTIyJI/5KamOAt07LWQ/OEhAzeMm2lIqtlovZr0diNQ
         gpER4GItVvg4swbEQ/0GVHeIddL9rmWKWhuRUmiQ1Q8faZ8VX+I/1q2lvyN3wLRX2a5t
         jPifElyZxnAbQr2LIcZJzFcb17970Ywf/l7hynlpLko/X1Wi+8zYRs2r2VQAohEXXKD3
         JUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3In/5C3e6jUWDjpc9LUPf/ibEHoyKgV2lj0yjQX7ORQ=;
        b=h5e9t4GEIlBqBNLuNcaI6aDfN6rrXK5wcn/vxjA9VOEhYur/ePXGBqsCtvx3UwxruJ
         jMBfzkhMV9Ud1jXxJEN5IefC8dLEybhLTNemFP5NfPCQJoszYBspoCwxrbWTLzMqtGIm
         kQtXSf0WWwuYEBDjr/i0uuuDxlCr3lO+rQ+2G1u5ktNb1zbAMA2HNOI341bsju4D0EZ0
         9a2X5iG9I1BJmNZ4TQYlfzVryq6l50SrF7XSweWbHsW+0+V7aMNt5i7M6gXsbIdaLXCN
         QOnQP57SxNJewF3oeLbATHq1IjuXmz2W6zj4a7XVAua67nBwmYilxcNVXwoSMOxZOuTf
         7Klw==
X-Gm-Message-State: AOAM531TR/GCuuldIO34njYpkGq11+O5BNW7I8F70QBmxm1ZOgAa/SqO
	BKsC/SAbobdf3Ru1pk6nMTuiGF++zglQ5A==
X-Google-Smtp-Source: 
 ABdhPJyZliL1Po504kVRD+jPaItGNYalIMZyBlw9q8pFkZSFtoTvkon+pN/gZ09N8ZLWAVpjteWk0w==
X-Received: by 2002:a17:902:9047:b0:143:6e5f:a480 with SMTP id
 w7-20020a170902904700b001436e5fa480mr767343plz.66.1637620081601;
        Mon, 22 Nov 2021 14:28:01 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::7905])
        by smtp.gmail.com with ESMTPSA id
 x18sm10170656pfh.210.2021.11.22.14.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Nov 2021 14:28:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/2] core-image-ptest-all,core-image-ptest-fast: Depend on
 core-image class
Date: Mon, 22 Nov 2021 14:27:58 -0800
Message-Id: <20211122222759.783294-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 22:28:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158590

Use the default packages as mentioned in core-image-base without splash
since many machines ( e.g. raspberrypi ) add packages to enable wifi/bt
via MACHINE_EXTRA_RRECOMMENDS which are essential to boot the system
without errors, otherwise there are errors about BT firmware not being
found etc. which is then marked as failure and also services like btuart
fail to start and it marked as failure in system logs

Using default base package groups addresses this issue amicably

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/images/core-image-ptest-all.bb  | 3 +--
 meta/recipes-core/images/core-image-ptest-fast.bb | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/images/core-image-ptest-all.bb b/meta/recipes-core/images/core-image-ptest-all.bb
index 1472451675e..8edd9a2b886 100644
--- a/meta/recipes-core/images/core-image-ptest-all.bb
+++ b/meta/recipes-core/images/core-image-ptest-all.bb
@@ -1,7 +1,6 @@
-inherit features_check
+inherit core-image features_check
 REQUIRED_DISTRO_FEATURES = "ptest"
 
-require core-image-minimal.bb
 require conf/distro/include/ptest-packagelists.inc
 
 DESCRIPTION += "Also includes ptest packages."
diff --git a/meta/recipes-core/images/core-image-ptest-fast.bb b/meta/recipes-core/images/core-image-ptest-fast.bb
index 40df274c4c1..286f20e547c 100644
--- a/meta/recipes-core/images/core-image-ptest-fast.bb
+++ b/meta/recipes-core/images/core-image-ptest-fast.bb
@@ -1,7 +1,6 @@
-inherit features_check
+inherit core-image features_check
 REQUIRED_DISTRO_FEATURES = "ptest"
 
-require core-image-minimal.bb
 require conf/distro/include/ptest-packagelists.inc
 
 # Include only fast (< 30 sec) ptests
-- 
2.34.0


