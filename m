Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A464F8E499
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:38 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28291.1776378814174011316
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MlUf+6rB;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4887f49ec5aso622765e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378812; x=1776983612; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MJjAfvq/mXOl+wN8dJQo6cp9ud8dBu1/csvJV8B5oIk=;
        b=MlUf+6rBeTa9/opkzcOumjHyzXfKXfkXpyu0QXuHI0Xp8uoDp3VCcogSGOs4ufwcd3
         xLoYtVN07DIdMTwwHAy+3BCID5MqMHYoh83CzIztu2c164tEcvNr9OX+xW1mMopNZ3v7
         dUqP7NGAonRBcdnpTGwnbggw7wP0WvCUxx9z8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378812; x=1776983612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MJjAfvq/mXOl+wN8dJQo6cp9ud8dBu1/csvJV8B5oIk=;
        b=CwfuIUlfDkSR8y9PTJSQzD9lNb/2CGF/Gb6DX0H10QfFIbFVOIxKPELmpoNXsk0rsW
         DX8k+2DH9MUXXo1LuZFKxNhjRiq8LlaDpcD3qgA4JWs7eXuDrwNugUSsfT8bifZm9s+D
         Bxe2XISjyFKdHBFG9tt+Jfgi3oawnPQg1bj/o28AhEWu9hxRORqJbSf+KKDX1gVaCSpH
         0oItWPVidNRl62+9JiAjOd6CvTAkDVuEC6XvkqbskLME3FgpUgVvWmHMENNI36d4uX3Z
         xkBJA3/0pXROmzLH59jXJSv2TPRwP/uUBuxYL8W21opLcKKIHHMkQXNpcsgGOPTqZeUB
         onXg==
X-Gm-Message-State: AOJu0YwGpRTDmPGJCyvlhG0FLdJ0zwPjkhNUnR8GD2wjXwN0Opsn5RVy
	/QlwwYK2y04rk+CAnkCYlkUmejNLoS1BmDKZTbIiPiTGnRISAr3fy9z+WImA4+1gSiT95lhuVpH
	spZAek+BZ7bhk
X-Gm-Gg: AeBDievjXvzgbNM/hnCs6HFEFk/6X+gw8sqLCXdprlu/sz7HDFGATQIHFKKDgWMoVla
	ItLPzL//oNNo+DikP0Pi4BnSb6DA4CRmzGvYRTagLoWEDEAdd0rrjOuYWNXakiuQoufDKtWUJiY
	jWl4wS+ecDm8FkEptzmqWZxgrQ4kfFY1VkFaKmTWLTbK/jPdrLXXEZRPHeRA8Zr1y/A8dnJsYJ6
	77Jczp3vl4DskrARHPdyLYn5ZD3Q+MU3ai52v8oorS5Um/a0Hbe1sRKuDyV0duHOeyC39qPQxNV
	Tiy1owt1EnrnxM/uGPzhR9yL1yaUBsjRzy0LYuWgKD3twT/+tNNNIokussAGtoOD1N5rJ2OD4hR
	clqbWcfOZEsTXLqid8ZNS7epWT3ehPFKBSxT/mhfSMzrU4cV9oAMfiEsoTFAkBNtlF4HE62qkdY
	iALhlR0jG7WDtSeW1YIDTAV5WLVZbM/QOCNnMSTIl6VfPVzyuf/nSCi50yV9+QlvU/vcjkZjCUC
	WbM3VBNwYp1YI/ZKjqMF46JjMNxbAIHuky3eJ4TiSGnOJtY
X-Received: by 2002:a05:600c:4746:b0:488:9439:881a with SMTP id 5b1f17b1804b1-488fb738412mr5015185e9.2.1776378812327;
        Thu, 16 Apr 2026 15:33:32 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:32 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 51/51] ptest-runner: Upgrade 2.5.0 -> 2.5.1
Date: Fri, 17 Apr 2026 00:30:34 +0200
Message-ID: <e0de7f715cc1db6c3c5a86fd7105fb0614c26bf3.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235479

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pull in buffering fix:

"""
When running slow ptests, we can see an issue where the tests are writing output
but it doesn't make it to the process (e.g. ssh connection) running ptest-runner.

The issue is that the standard buffering for non-interactive terminals is 8kb and
some ptests don't output enough data to trigger a write. This can lead to
the controlling connection timing out.

This change forces the output streams to be line buffered in all cases. Most
ptest output would contain newlines so this should work well. stderr can be
unbuffered by default but making it consistent here seems the best approach.

Testing with this change on slow ptest runs (e.g. qemu emulated) showed much
more consistent data with this change.
"""

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b57105311f1c5fd879dd58fa1de8862ebad989c1)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../{ptest-runner_2.5.0.bb => ptest-runner_2.5.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.5.0.bb => ptest-runner_2.5.1.bb} (95%)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.5.0.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb
similarity index 95%
rename from meta/recipes-support/ptest-runner/ptest-runner_2.5.0.bb
rename to meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb
index 607fe4b5ff2..f5628d6e468 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.5.0.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "7429fdd52abb5b08a9e8acef14b1bc4604f09c8f"
+SRCREV = "afe64efbb3f028e898fa9a5efcdc3010ebdf283c"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https;tag=v${PV}"
 

