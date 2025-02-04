Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A53DC02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 13:55:18 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.116791.1738677312589833946
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 05:55:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=SxouLSkk;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso5826503e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 05:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738677311; x=1739282111; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E86CcozagmLsYaKrTI35C23FsWAcVJRx2zN2PM6uAWY=;
        b=SxouLSkkQpEniJZrUb8Y0dnbtDy3fLMFxSZC6mafMUNM57z2D3D6vU1DPt2+aDWI4t
         4dSR8KXFoI2ceZUwAjkyouh9DbS7z19XPwXsnvsI0gS1Xi4JCJerCOEC04dyYTM9V2k4
         nIGUNJ4sAZHc4qd1aaAp0cUOcTrR4MxhBmUQ6AfWjoYr9s5Lrc8WYPRexIG0sjUgn/sc
         VrKk6uYd0SXK4PbnbXa9uqJNYW24oVfyHIOllATsYLn46JxMRUeqdr16+n4MsWpuIxt0
         NeYWo97Odi0l6106uuQZCVo1YUhXW12Ob0VOjOG4gcjvvmFyAaiK3l69o5R4fg6XhRSX
         deUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738677311; x=1739282111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E86CcozagmLsYaKrTI35C23FsWAcVJRx2zN2PM6uAWY=;
        b=R06GemNz+kY7vh/2NHkbTGeTyUJFddY4JrjuBNtVSx87uooBq8Is0qnu8rq7LQykgE
         vE26ImnqMeic8FXNNp9tNJUggvmZvxRudDxOcQyirQfgibXgaPTROKpdnUlWnEGv4gDQ
         hjKSozG0+yimi+qNRAdcI+laXg3+Rkk9S1rzVD509XxiYSw7+Us1/1Nu2hx2C2LCgcN1
         BjjDu2SB1UwIt7u7BuRaoJ4Emr1DwhPkZtKcuIiR+tjJdCUjeLG7XqlRDYnkyG/kPlz9
         8XCGG5kAbLuR0XwV6oP5fcdpNyrwdR58YXn8zdsGwQDFE9CZ3BQQ+Jsp0sf7SReVVLIw
         MLaw==
X-Gm-Message-State: AOJu0Yzn/mVRwEeBBe/m4Rz3SlNhq6/smOH1S3Y3bo/VuEgAd/gVr7xX
	H/+A3/b/MwUprhDOs0ir2cBd5E1A6g+tDfbwQzt5DO3kU7GRA8c9MZl7J8lzLgpXe6bh94R09sl
	+n0Q=
X-Gm-Gg: ASbGncvHxWBo92YhtmNskSyS+iV3WvzOFUJ6SnKf9CwcWIr5wPO+tJ4mkitA3J0YsvV
	z2J3KdQ5dC8Am0w082JNCX9ro1zxt9p0ztt1PW8+oRcSn9VkMh0blCByseEEH7RTXqDq/5R2m/w
	khsjpaz6cjkP+ZDFE3kElpWhEDMCfW/ohD6+ZSXACfsAeEbpSEmEFhEB8YpqloI/1RGZXgHio09
	bitq7wpryefOiO7+nE487DGOQjyoI1HMMJlHJGkqRhzArA0VD5aeH86HZSLWavoLWZPQO3wdsVT
	fyiU5TC2hC/jAUtIYbRx4Vi6PELaY+oSJKorzGK/7rat0PubHcfJW9kadJH9
X-Google-Smtp-Source: AGHT+IGsp2l3Gn/vKPYoTb7fcgHZ7l9EkX6gspYU3u9vblaJaHKgCxWJo6IEG1q4UJi78yGsfRZl9Q==
X-Received: by 2002:a05:6512:4026:b0:540:1f7d:8b9c with SMTP id 2adb3069b0e04-543e4c3fd10mr9323266e87.45.1738677310622;
        Tue, 04 Feb 2025 05:55:10 -0800 (PST)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebeb07a0sm1578017e87.123.2025.02.04.05.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 05:55:10 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 2/3] uki.bbclass: capture ukify command stdout and stderr
Date: Tue,  4 Feb 2025 15:54:56 +0200
Message-ID: <20250204135457.1219477-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204135457.1219477-1-mikko.rapeli@linaro.org>
References: <20250204135457.1219477-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 13:55:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210798

ukify tool can show important warnings and even errors
if it fails so capture the logs.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/uki.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbclass
index 92f690526d..ccda042ab4 100644
--- a/meta/classes-recipe/uki.bbclass
+++ b/meta/classes-recipe/uki.bbclass
@@ -190,6 +190,7 @@ python do_uki() {
 
     # Run the ukify command
     bb.debug(2, "uki: running command: %s" % (ukify_cmd))
-    bb.process.run(ukify_cmd, shell=True)
+    out, err = bb.process.run(ukify_cmd, shell=True)
+    bb.debug(2, "%s\n%s" % (out, err))
 }
 addtask uki after do_rootfs before do_deploy do_image_complete do_image_wic
-- 
2.43.0


