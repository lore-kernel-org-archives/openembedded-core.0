Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 887EBC98307
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:12:05 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2934.1790154723365992868
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Sep 2026 02:12:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wRKcnGfu;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so3115755e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 02:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790154722; x=1790759522; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mX2jC0E9/FOn9xm+GEH6q1vkYb9/MdRRNQuZEZJ7pnY=;
        b=wRKcnGfu/nZ40olIYMl3a5Kmzd1vfQhdwkl/U6nuZgv+w7lGkJWLckmYMoRiS4Ifhw
         tocTf7MMMFut/vdA3qXxj0tFb7hiSme6Vw9MNEfVcdUg9KsVLuxiE4X8uRjSxZMPaC/9
         eMeFi9VCi59O3KUm+5O36zj+5I6tTdn9JNJJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154722; x=1790759522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mX2jC0E9/FOn9xm+GEH6q1vkYb9/MdRRNQuZEZJ7pnY=;
        b=EcViMvhgfEWlvFlkMBTFgHAeocQNeGGHoQG1tvLfCunsyTc9EleGaOHwLya7BliKy5
         k4wkMTMXGpDoj7ePdETDvkIZ5JmnDHuapVj77IEC3S1PQloZoPWJcwxnjTglhvEI0Je5
         sD9im7TrykNbwO8Fhhy7XelM6NQWzQQahQsivd8JKUixG0NJLNqBfrwGy86viuKBl9S8
         U+8HhoZk0akbERmGsgsvClOiJV4OQIZACnQpURvaEdpA4A6zLgWb1iYOn6jevrXiTGv2
         kC6+b9sQnOiyhpeZ60bM9E0BDzTlI9TCIypxSxpEVmFS5aNQUW2RKJX8ptORfVmHyo6m
         fuVg==
X-Gm-Message-State: AFuF++kK5lp3fXDwrkr+7p3MDt7vri4rKLp2+K7PaiVwPTORFlYoLS6e
	qoEWfKsGUeN/1LahRwaa5Du51rm6rZrIx0bQkukqWuodU8DMaSpn4Nm1QZfavGXyBX6ZPPARF8V
	1wUjpmes=
X-Gm-Gg: AYBFou39QMlGqvG/F1jPYMS7VDGGdfjugk7TeUoeg6L1k+Oz1U8SpwGsXgu/VTQRlua
	N6S6iIPXC0w8II0xCGPuOwdsPa62KkaA2nmS3sAT4kQakP71zu7zMqxIQf9OI3w7A6ei1G0IXi8
	IqfVgCyCCxFEzTSnJdS8IgQ8ftC4v3GtCEjqiDyFimrqBJ+Qi7PgjJhETfhKGOxDrX6VVLGTuhQ
	a2m0dCl3hmBgos9v9aw0iMTx3RUu18ijLnlqU4csQKBXL2DP4cnwD9nVX3IV0m49CtFEN8g4Z5A
	Dhm/aUQB14di6O3+ZqS2cErFQBXaRsTJQ6Hq68N7KxOsl3grjPtv3z/mCFEoOg95Ds4750nu8WC
	060tntVe33ngoEpnvRdVOi73RjQh/wBvosHG2bDdSXNppnj1/KL4A+GdQ8qlHcQtWwttP+TQJE/
	rfymxPY1ATHfcb/RufNRy1E+qF0E8BFfcLZ2idwZos+u7Q92eB62ReRLe6cL4kk/r8lFvy9Q5kU
	cbtv6aQI/0aTF9wbFMJ9GcGA5OlLQu3NpfXSRzzgVo0OUFcCfD/4lJr7Hn+G/nI7eYUg+TvmUaR
	81G53L9L
X-Received: by 2002:a05:600c:4745:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-49fde3601bdmr30100875e9.2.1790154721727;
        Wed, 23 Sep 2026 02:12:01 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a02-8440-b519-f416-8bed-8817-19fd-ccf7.rev.sfr.net. [2a02:8440:b519:f416:8bed:8817:19fd:ccf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe2730da9sm14251525e9.4.2026.09.23.02.12.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:12:01 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 34/48] ptest-runner: upgrade 2.4.5 -> 2.4.5.1
Date: Wed, 23 Sep 2026 11:10:36 +0200
Message-ID: <6688fc0df342dfb75061647462e36590dc5175ca.1790154074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790154074.git.yoann.congal@smile.fr>
References: <cover.1790154074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 09:12:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246496

From: Wang Mingyu <wangmy@fujitsu.com>

This is 2 commits squashed:

| ptest-runner: upgrade 2.4.5 -> 2.5.1
|
| Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
| Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
| Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
| (cherry picked from commit d4497ba3fed93807f59c00925056aa21e72c2189)

|ptest-runner: correct PV from 2.5.1 to 2.4.5.1
|
|2.4.5.1 is an actual version, 2.5.1 was a typo mistake.
|That merged less than an hour ago, so no one should
|trip over version going backwards hopefully.
|
|Signed-off-by: Alexander Kanavin <alex@linutronix.de>
|Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
|(cherry picked from commit d5e0f51bccae7410b10c98a93fa5853155c2f59e)

Changelog: https://git.yoctoproject.org/ptest-runner2/log/?h=v2.4.5.1
* Makefile: use pkg-config to obtain libcheck flags
* Makefile: remove redundant rule
* README.md: Add my cc to be aware of patches
* README: Update mailing list address for patches + add git command

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../{ptest-runner_2.4.5.bb => ptest-runner_2.4.5.1.bb}         | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.4.5.bb => ptest-runner_2.4.5.1.bb} (94%)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb
similarity index 94%
rename from meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb
rename to meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb
index d28ae7ca91b..9f6bb399b40 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb
@@ -7,8 +7,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "aea9f42f87f2a78a973ae22cade8e45259f754e1"
-PV .= "+git"
+SRCREV = "c99e8c2737ff802f110612cc2d90c60233c33255"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https \
 "

