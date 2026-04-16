Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66885F8E497
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:38 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28289.1776378813713726747
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BMr7pfBe;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso294555e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378812; x=1776983612; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=93pRZvB+6NlRXsqjP6IlnZS+yTZCKGuRN2fXK5NK9rI=;
        b=BMr7pfBeEv8XtAY1sTtXontMH0cD3aDeCDSjtjyzR9uQyyPYMuNhM7xP4a+o6/6PSk
         Jg3ER9yxn+ZQmKWnkfJkiMlHxLapBP8DhnTzNL94I9BNy81sfmWDFQ+PhpIRfhWRwCxc
         JPPYo1Q9CvmD0VX1ITTYQ0/FejRcor8k0xVEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378812; x=1776983612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=93pRZvB+6NlRXsqjP6IlnZS+yTZCKGuRN2fXK5NK9rI=;
        b=UfokrKl3pKGzFi2OVZpK6gJuw5hOed4hEQT0qC55CRfZONoU7kcHJ4WLKwlma3HkqI
         Gd1FN09Ql/PkYWOuojdsir8Qfvi2N++SEvp9PlYd1cCBqRhhXebfooBOkxI12+XcUaUg
         03yoCVU+DNlDelYdCHqeDYqDYjqMrVZ+RT9rRewbx/FKFTByC9eT3lq5cGrlkQe77+C0
         Nd1Lce+9KcJ+w+Z98m9UxOPgb1BdIa0gr/3f8Y4cS64nmy/28lFo84Dn4Tw9GDmSdkpu
         qS6o/0cGERJdU6hA7JUotA0co0F2+cZjmtm0Bwl7XWmeQjL/cvkY/xOVajhX1+etTW2O
         2NGw==
X-Gm-Message-State: AOJu0YzmuOOV8YBL7T5oooWAXoe6av+4DBW7r9nwfACB1szDf1ZeC297
	Iu5VxAV4AcVoEHJCXkn6kseT3hJbpSJWx3lR6K0cz6j7oeoaFn0hx1AOxEZoHWKw5EzimUbmsMF
	47tpQrJNzxRkx
X-Gm-Gg: AeBDiesqHKqal3WIbhpLpi7p2LSVfowh7x2muuFSrCXdQzAKxIBAB8w/l88N3gmbRRT
	Yn+E0YCXzNvGaSXaX/2xVpv/e6wDvFMDhoS37GwMTs8nVSqLRncnCAdIibwyqqS1OhZCeEhobEu
	T0fScPZpF5wGBvIxYSeRCOTsGhmiA+gpBcknELn85/BASQmmoqqTROt0C7fvaNQ/W4P0xhO6mXA
	n4vw9GAuJH6LEJ8S0Eo9VPOfCJTKDbqkMdfm8qXkiY3PTnBVzgHev62yFERrSc3RqG0T4Z4NZlR
	gGOJ4q2115CDzNXCjos3NcL3HIZd3L0Y36OEr6fWi9xXUMjFe02KWYkH+VNUMKBxZSaPtbVNZzx
	7CiSMZogG7pRCvQqKL3TN+HqJeODT+XchQ9P7x9uJjQxcDW9Gr9NaGcO6d6JP0ICZ+KEn6MZNks
	A/ko9cl5quwIXuv3sEN9NJhHcfLffLJPI66JACNky5wcIC9CScYh2Gvpl7qhYuSh/swja9pw8Zs
	zhqNnOeKKJFDgMJ2W7qAzl7DjTOJL8CipmbEQ==
X-Received: by 2002:a05:600c:4f0e:b0:488:945a:ed63 with SMTP id 5b1f17b1804b1-488fb6e8491mr6665395e9.0.1776378811784;
        Thu, 16 Apr 2026 15:33:31 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 50/51] ptest-runner: Use git tag in SRC_URI
Date: Fri, 17 Apr 2026 00:30:33 +0200
Message-ID: <723ef34c5869cdaec1ce51baa89979e7a43439ee.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235478

From: Yoann Congal <yoann.congal@smile.fr>

Also, remove an extra line split.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1f87b57c8223e01e909a6e71e39aa152a80d8287)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/ptest-runner/ptest-runner_2.5.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.5.0.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.5.0.bb
index d9ec0baf799..607fe4b5ff2 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.5.0.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.5.0.bb
@@ -9,8 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
 SRCREV = "7429fdd52abb5b08a9e8acef14b1bc4604f09c8f"
 
-SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https \
-"
+SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https;tag=v${PV}"
 
 FILES:${PN} = "${bindir}/ptest-runner ${bindir}/ptest-runner-collect-system-data"
 

