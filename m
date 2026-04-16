Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E7DF8E48C
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:38 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28591.1776378813209884137
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OFbEeDlY;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso426435e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378811; x=1776983611; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O69+O4/4Sn4ICRg/ebU8dP4Zne7e0jQcoY58zN/PKgw=;
        b=OFbEeDlYfT51JH3AdoKfwnDo+sO4+1ZXUpVtJmknWFx+/7iAg68ziC3tpi4zMo4Alo
         lkjdWGqcSjSwlKcSQDgLJNE634qI9Tsxk6oDFEZyt9wmGjDvFybBkjpAP7DAwsJnbj4y
         8+UCZX74AmPQr3Xp5RLn+YwzUsmkinQ8z8XsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378811; x=1776983611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O69+O4/4Sn4ICRg/ebU8dP4Zne7e0jQcoY58zN/PKgw=;
        b=rDUcQWnAGFv+S2Y8+ByXu7LBwR1iSHmGST3tO+FGkTWcAJEaVfKdbVoNdNqD+eUGZt
         AB0zntRyEuInPuk4bTF4iQ75bnFWidsnPhjOg51pruZlwmd1S3pGAK14h/eOO//UCiP+
         fKwqWUpaglbue1w6jREgZSRtLlcdYAcEqTePGzQLT8gVvBX1NQbZrx6L/VsnBRvTJgcN
         9H9SrDbrYVhPEVqSmY/LY+pR1aR1K2dnibnLbo3sDBIMlKy8WrSqgoaryB72+6/34e3M
         Zc2HJNsh9jaU/RI/rvDzPe10qG2CT6HS4l8GNQzu0tBeChfgfC/js0ALd62R2+yXGqL7
         /fLg==
X-Gm-Message-State: AOJu0Yz5YqUYsU9Dda4D4il6lkvPaYWvWKm+0ncgSl+W5HnWMwv05M9P
	Z0b99Mpv3DgRNIFrzc8w1ygglx3+nwIqAaIkxw9qQyb17HODv+fuDdIS19oiiZ1veU7o8bpcb95
	Z24eOUw6PT7Wm
X-Gm-Gg: AeBDievDNyi1vQQB6aASW7lEcpHfOyMRKOT+6dx7hYm27G7RdaEAEl5PYCqUJnucKrT
	/limaXyXiP6tqFRt34Ho/txvRiwpl/cs12VA6B6Nux+GdWTlKw/fI8VNABbSlHw3dchYawO/BEY
	O31DshEpDezFUrL9llNrr8RjXDDY+bD1Q94ws8RgQGnBur5+xCNl0ylm1ZqsKPVJ0yPtDrqTyrb
	FoPD2nmZ6NVsc8FtbHyZ8F7NPhLG7laHMJQhJM7Am+jXbpyouW5rdymdCe7mTX2AE1V0izJGwB0
	ZciG9tQBzKi8f8W85MukmP0/2Pv7m4LXSF9C4hpGCW1O/1bFJEViQG7aKSGUVUhcEtaU1oi9u8c
	ciRY6bfDWOAxA51BZzr6+mPNjob5xBqYxJipVfhwlTdcmOBrqQ8t+8Z6xq9AZHRPGBQ6BGKYFOk
	W8y9JNs0c63gB2AjhfB8DH97YDi/Og+4cFcmS6hzVRDU2D5g2ImK8PvydmrRGloseNp3a0NyLuw
	oYmKUHkLthXs0SAKoYMNMZOdAcP6D2TVGYgoM5Mt3WjJrRz
X-Received: by 2002:a05:600c:3513:b0:488:a977:8de with SMTP id 5b1f17b1804b1-488fb77a3a7mr4869265e9.16.1776378811397;
        Thu, 16 Apr 2026 15:33:31 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:30 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 49/51] ptest-runner: Upgrade 2.4.5.1 -> 2.5.0
Date: Fri, 17 Apr 2026 00:30:32 +0200
Message-ID: <31bf35f2ac53dd323ec5da1d38595bcaf3127087.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235477

From: Yoann Congal <yoann.congal@smile.fr>

Changelog:
- utils.c: Fix dirname() handling in run_ptests()
- ptest-runner-collect-system-data: add info to logs
- main.c: Set PYTHONUNBUFFERED in the environment
- utils.c: print a message when a timeout occurs
- main.c: Add print_helptext() for detailed help
- main.print_usage: Remove unused argument list of -l

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 869d70d46c8e31cfc380b5143059cab3713cae26)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../{ptest-runner_2.4.5.1.bb => ptest-runner_2.5.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.4.5.1.bb => ptest-runner_2.5.0.bb} (95%)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.5.0.bb
similarity index 95%
rename from meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb
rename to meta/recipes-support/ptest-runner/ptest-runner_2.5.0.bb
index 89f85e24555..d9ec0baf799 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.5.0.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "c99e8c2737ff802f110612cc2d90c60233c33255"
+SRCREV = "7429fdd52abb5b08a9e8acef14b1bc4604f09c8f"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https \
 "

