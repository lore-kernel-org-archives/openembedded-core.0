Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC0BFCCA473
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 19:38:15 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web12.64414.1656877087850248894
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:38:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=g5VnzI+1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id l6so6818259plg.11
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ayLMnFdQG4RuHN0kHLXm71HYUHZvN/ARIakzWcUbqTY=;
        b=g5VnzI+1h7ZRFkOcbhbbJ9SbRQT4SvoAcuyMvLUUEttQArpg+rJ9k1si7VxkXYPjCc
         yMEyfcI2jKpmrJ6YB5AR5mhWGTa2zaFszPGOFazj45eMlNRXM5RPS/gtMl5uSFw8BT5F
         VdH8IPr/WQ1hPUnGsxT0pvewsQGsCTmWhPC1RVL9j5nLaEYSjvojPpvivPiLH8V/K3JJ
         9FdA7wOsjpVAt0COiBezWWxrB3svgrspH/hYTvwXzX9vqkFEsY4xEEJBQ9vYEtbuNSF/
         MYCM94ar4bIQYxA4DTEWmeohHEJW1OMlnzJWfKZIOW8+S3l45ynxtHdDrru8nDGO6r36
         Nl4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ayLMnFdQG4RuHN0kHLXm71HYUHZvN/ARIakzWcUbqTY=;
        b=HVW/aSr5J1MoryWFoIjnWwWVRxJ/PrGAbWZl1uXJKjwaAELUJWA027yYMwUUMsvRI3
         hWMpEo7MNmPjGxU4nKCVVozCra37du6+DZOEIH0jcpyY/32uQZSQVbZ2wLmvu8XLvO3u
         M43B73d/62Gm+uGjthCTOz32CCIcjeB+ip/CYkPnepHbPjsbACJp8cvCmzVKwmejyPu3
         SR57yQiQLREwdI1o8OauSw+2AvQhOXxtLBO5kKJrJIdVQ7/YMkPVJOrr0/pNzYGV0Is4
         lgcHKnrv0zT3UtIJCBAM01wT7gHaWPsyzowNZ3SS3OZodzqAAz6KtrtFkque0DNL80ny
         xhRA==
X-Gm-Message-State: AJIora/QVs7C7mWEnNx6Yp8gAAVM+w/vCN+wOyVKykHU3rMNxdgwAHRB
	I21WrXzsqPtV8SmEy4WqqHCq+3ahTI8xbR07
X-Google-Smtp-Source: 
 AGRyM1uhCfw6X9cKLC7gpyBLqUTGgKwiO8F1nI1/T5E6LUj8/YMudb25nkZ2MQWs6tsGVKpyA4mqYw==
X-Received: by 2002:a17:90b:508a:b0:1ec:73d9:a143 with SMTP id
 rt10-20020a17090b508a00b001ec73d9a143mr30564316pjb.71.1656877086832;
        Sun, 03 Jul 2022 12:38:06 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 d4-20020a170902654400b00168aed83c63sm19441739pln.237.2022.07.03.12.38.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 12:38:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/30] rust: fix issue building cross-canadian
 tools for aarch64 on x86_64
Date: Sun,  3 Jul 2022 09:35:57 -1000
Message-Id: 
 <dc179854b7ac9e19c9fcdb45ac74c6fdeefbe289.1656876825.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656876825.git.steve@sakoman.com>
References: <cover.1656876825.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 19:38:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167582

From: Peter Bergin <peter@berginkonsult.se>

Commit bd36593ba3db758b3eacc974e48468a665967961 did introduce a
regression when building package rust-cross-canadian-aarch64
on a x86_64 host. This commit will fix that configuration.

Suggested-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ef566af964e9f9d2c440a3b5771ed801216f30f9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/rust/rust-common.inc | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devtools/rust/rust-common.inc
index 621cd4ad57..ef70c48d0f 100644
--- a/meta/recipes-devtools/rust/rust-common.inc
+++ b/meta/recipes-devtools/rust/rust-common.inc
@@ -309,10 +309,7 @@ def rust_gen_target(d, thing, wd, features, cpu, arch, abi=""):
 
     # build tspec
     tspec = {}
-    if bb.data.inherits_class('cross-canadian', d):
-        tspec['llvm-target'] = d.getVar('RUST_HOST_SYS', arch_abi)
-    else:
-        tspec['llvm-target'] = d.getVar('RUST_TARGET_SYS', arch_abi)
+    tspec['llvm-target'] = d.getVar('RUST_TARGET_SYS', arch_abi)
     tspec['data-layout'] = d.getVarFlag('DATA_LAYOUT', arch_abi)
     tspec['max-atomic-width'] = int(d.getVarFlag('MAX_ATOMIC_WIDTH', arch_abi))
     tspec['target-pointer-width'] = d.getVarFlag('TARGET_POINTER_WIDTH', arch_abi)
-- 
2.25.1


