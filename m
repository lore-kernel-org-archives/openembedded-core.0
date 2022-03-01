Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7548DC433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 23:42:24 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.1878.1646178137168789279
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 15:42:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=H+nt0TMA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id u1so61576wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 15:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VWg0HYehTvvRmh5Bvcfnu4tYMZjkc2Lc5LvwCxMua3Q=;
        b=H+nt0TMARG9ytyIkM7LpflqZFF68Hrl1Nbe2acdndrX5VJ9YTnXBWHVkgidRObhup3
         gDy5+pJkOM6C320OW3pZ44Mo1hPbmJyw4o+d0ulEx5REX9k7s8G1OJL1lO3Io6a606bG
         ytZyFAPMjnbqMmrFcMLrXByAa8xLJTCQJP/qE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VWg0HYehTvvRmh5Bvcfnu4tYMZjkc2Lc5LvwCxMua3Q=;
        b=jHJLMrMPiMvCVFPf9CCNxyovuy54k33EOFRs4ifi1i9h9GIBWaj/nSlodPUWiNXMHV
         KXVc/IcPelO/Z4kPfMSyXpNnZUlhP1XsFEHJITycu45Ajz2O67K78529JnEWr4l7Hw4+
         k+aUTWt7lPMsoYushPnmwHuMr7L3/vEaahaTxnBG7cJmjzOAxdXdmiZqmpx9OHAe2Xc0
         8OaZRugnWbgoA+cYoXtS/qiMiS0Jv0m4Hz4dwhqlcrtdx9wKiKoBiR7dHq6t5LzdOi8K
         Sv45yD4r3wInaIugxOCk+6FAug2FSfk1DOT7oItHdn6w80dK1mqTgODFEO8nBTZE5fFK
         jbVw==
X-Gm-Message-State: AOAM5307HUjRq94rioz0UQTVqlGGJDxwnms2q1dQe+X7eKuiHDi53+9X
	MhGKHnxHSj66Rj9SkImDifG0zjr9MUsIcw/w
X-Google-Smtp-Source: 
 ABdhPJyZYeJwrODKOfTqXYte29ijOTQO3b4YtdEh2A6hYY4mMg1XeHa5ckzle3O1enIJZJNeZENxJg==
X-Received: by 2002:adf:9141:0:b0:1e3:1379:4cc6 with SMTP id
 j59-20020adf9141000000b001e313794cc6mr21985106wrj.249.1646178135257;
        Tue, 01 Mar 2022 15:42:15 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:8c1b:f0a1:b483:4e17])
        by smtp.gmail.com with ESMTPSA id
 s16-20020adfecd0000000b001e7be443a17sm21491351wro.27.2022.03.01.15.42.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 15:42:14 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] mutlilib: Handle WHITELIST_GPL-3.0 being unset
Date: Tue,  1 Mar 2022 23:42:11 +0000
Message-Id: <20220301234214.247172-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 23:42:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162577

The code doesn't work if the variable is unset, fix that.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/multilib.bbclass | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index ec2013198ce..1ad654f546d 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -77,9 +77,10 @@ python multilib_virtclass_handler () {
 
     # Expand WHITELIST_GPL-3.0 with multilib prefix
     pkgs = e.data.getVar("WHITELIST_GPL-3.0")
-    for pkg in pkgs.split():
-        pkgs += " " + variant + "-" + pkg
-    e.data.setVar("WHITELIST_GPL-3.0", pkgs)
+    if pkgs:
+        for pkg in pkgs.split():
+            pkgs += " " + variant + "-" + pkg
+        e.data.setVar("WHITELIST_GPL-3.0", pkgs)
 
     # DEFAULTTUNE can change TARGET_ARCH override so expand this now before update_data
     newtune = e.data.getVar("DEFAULTTUNE:" + "virtclass-multilib-" + variant, False)
-- 
2.32.0


