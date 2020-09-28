Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.36908.1601300294660360548
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 06:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Rn3VEJzn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id q9so1159147wmj.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 06:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/Obfp99RBfzRWJPM0SzlqUntVNh6XgUQqI0UyxG19dQ=;
        b=Rn3VEJznHhpJaBZHTR1RB6IaHBkNt4fJIMKt8fjsNcCioiaL3OCaN2Yu0BqPg5YCb4
         3qpWBk+VRGBVLHtkgOn5AhcD+eWZqSrAEpJirs7r4OYBixAydiM2tAsmcuvSeqoQ2qfo
         HzFHlZrzaDjTO1SZ+Rbo+mAzXHy0lD810w+5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/Obfp99RBfzRWJPM0SzlqUntVNh6XgUQqI0UyxG19dQ=;
        b=ntAXg8XVtSdBXTyo67fSBsWe/er6lllaNUZeY85JSYVBGNbF/pwkrw9AZ+9n7tZxmd
         V9Uaqyxz/CeS5YnhE27mxUrQg/wD1qE8dyzyDnGMh5SeV+oS+s2KPUkdMMDlMdqLAgRR
         LWQNCEhP/VBEjw5ziXFfSiIUVG6OziCFXWL7ATwT0VjVX6l+GHNxcN0rF9PiXJFQiWOX
         QU4yv6FRuHbaOOnJY8ogHyHF8e+29wOu3L/8Fcx+w3sxrIjT7OheHv1mHGRpzd1u2ABJ
         4v7lHQAEU8u1Vougd30npMzpNDHTpEBAolZhBqbrdEP1I2mM6wxXarb/09iNLiAn/0cR
         Vlcw==
X-Gm-Message-State: AOAM530zLQ+GTHGw9S8oMxSgCsZ11SxyTpetuPHeNJNHcmaietd1FH88
	o+kQ6ZACI6P/B4VBBvks/ItMDOzV1ETMvg==
X-Google-Smtp-Source: ABdhPJyQw4Qz0M8row7E7KO9BKrveaV2p3vM4rDZCcjNRBr13nuJIsfowD9EBQVQ/iP0SXP8TH/sdg==
X-Received: by 2002:a1c:59c3:: with SMTP id n186mr1745890wmb.32.1601300292425;
        Mon, 28 Sep 2020 06:38:12 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (1.d.f.d.8.7.4.c.e.3.5.3.c.6.0.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:6c:353e:c478:dfd1])
        by smtp.gmail.com with ESMTPSA id k6sm1314345wmf.30.2020.09.28.06.38.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 06:38:04 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] staging: Ensure cleaned dependencies are added
Date: Mon, 28 Sep 2020 14:38:00 +0100
Message-Id: <20200928133803.2741507-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Most recipe-sysroot dependencies are handled by these prefuncs. "configure"
is special with a decidated task, prepare_recipe_sysroot which runs
beforehand.

do_prepare_recipe_sysroot does not have to be run before/after
fetch/unpack/patch, they're independent tasks. If fetch/unpack/patch
have sysroot dependencies and those tasks rerun, stale items from the
sysroot could be uninstalled and since prepare_recipe_sysroot doesn't
re-run, they could be missing by the time configure runs.

Fix this by adding the prefunc for do_configure which would ensure
the sysroot is in a good state.

This issue can be reproduced by modifying do_unpack and watching
binutils-native and vulkan-headers failing due to missing makeinfo
or ninja.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/staging.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index de3a19815a3..7c9fb38607e 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -614,7 +614,7 @@ python staging_taskhandler() {
     bbtasks = e.tasklist
     for task in bbtasks:
         deps = d.getVarFlag(task, "depends")
-        if deps and "populate_sysroot" in deps:
+        if task == "do_configure" or deps and "populate_sysroot" in deps:
             d.appendVarFlag(task, "prefuncs", " extend_recipe_sysroot")
 }
 staging_taskhandler[eventmask] = "bb.event.RecipeTaskPreProcess"
-- 
2.25.1

