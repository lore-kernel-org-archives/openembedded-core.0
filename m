Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12511FF8849
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:14 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31992.1777064228005852715
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:57:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=UVSH2n67;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4891c00e7aeso57644265e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064226; x=1777669026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5i81bJDp2N43KbVtKv7D3sb6SA4rsgbzUhIXcqB57pY=;
        b=UVSH2n67uJADRFQUsz//+nTULzOhwv+1jVA0eFQSRA8j5hnSePRlr0QbWJKKgVAY1r
         ojEAd40ILzHxk0fwnDZlmp81B4O1RmbIySM9pPIdMJ2y/vlHpvDwV8YOSXjZisGAObZ3
         5gZ/gbEXCsdnojJVVIH1gxcoacXhClN99L+XM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064226; x=1777669026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5i81bJDp2N43KbVtKv7D3sb6SA4rsgbzUhIXcqB57pY=;
        b=VZx2329+m8DvfkkluaaGK8SdsYHrFm/FqcED7HylOifw+uDhSnJQ6iebz4FTS+loWi
         +SJNuGTqQGoQY3WY8Bd4ZkVzT8MY3iedy7yKjtIZ3FIiF+c/JeWzYwQIWjJrGF8WUEP4
         FCw1y7BheuwaQTVqWMjz6uN9Oug/be63sc387QiC/aTHh12G0cDovSL9YFxGTcBxBb9m
         wHRqmIVxJ3QvgRKf8p3ezKSrO8hKa1RuSJJ3InRfJQsunsrsikpIA4wjiw3ST3xZOosz
         G8oyepvSraT0yFO7IYHr/0Z2zVmaZ/hWF/Zoysy4SoiIMY/zX95pJ2ddBDHSSGYcTWLY
         5yFQ==
X-Gm-Message-State: AOJu0YzjPjV4ZpddE90/rJc0q+XcCC8hnisTGfzIw4vUCm+fKOly2L0R
	LtsWNSrlvOKlr28Aur/C5UDRh2vFd5feCxCP1yrRaMaYnNPOAKBV7dztBGiybRw9ha7nn4yDMWg
	2MkEr5NuAQZZd
X-Gm-Gg: AeBDiev6pmw0tYb1sSsuxEHgNma1mYtOfWABMloxMksoelNh5D6iUlXEzm/0b3MbJbk
	8E1RlZ6PtWKy+7Dyic3JbT1xYCoAg8rxR4Ylj+Ww431mDkdBVZU6I195trGdxScvkt1ja9Azqcf
	VxDVxL455Y1n92Gimfk/pddyjyEBXJkMaCnucdIDRLekj7VM09QyLbn9lqsmtmGr135yRxgETvJ
	rZ56AkP/AvUn1j0Qc/28Uz4+BlOt3NioloK+WPcjaGzpmdivF1jaHbpnN4Jh1KUufVSEK3Zkhjb
	9dS8mASZCnDtuWbp19bEBofuTgP3MXdb8sLugKD9zSWGfOlQ2weG8Lj/Jg8zX9xbcRBcoeahj3J
	jGOLcK7IrEHzv+8BLyRQgMdT3bkl2X9z+jEHSkMVu5ARrippU/53QPM3xfMcZ140LOOGEdStQoD
	stq6ZqJQYBv8ay7PHin1lFeQofFTYOY/8+dyou2VDEOc/wCcX0zysDyopyIo5E6fpe5+NJ+Xs1q
	tU55CVVt0EnLBRBGAaJQNPT9DQM2ncj2U/i5Q==
X-Received: by 2002:a05:600d:14:b0:488:9e43:9690 with SMTP id 5b1f17b1804b1-488fb7451f1mr364676395e9.10.1777064226141;
        Fri, 24 Apr 2026 13:57:06 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.57.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:57:05 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 50/66] yocto-uninative: Update to 5.0 for needed patchelf updates
Date: Fri, 24 Apr 2026 22:55:49 +0200
Message-ID: <756f29ce4dcd0dad05e3f5bfccbcfe1ca3a0b112.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235923

From: Michael Halstead <mhalstead@linuxfoundation.org>

Solves some segfaults on relocated qemu-img binaries.

[YOCTO #16003]

Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[YC: removed extra line from commit message
upstream commit b322bc5387f3 ("meta/conf/distro/include/yocto-uninative.inc")]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/conf/distro/include/yocto-uninative.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-uninative.inc b/meta/conf/distro/include/yocto-uninative.inc
index 3ced03d4771..e9dc6c86408 100644
--- a/meta/conf/distro/include/yocto-uninative.inc
+++ b/meta/conf/distro/include/yocto-uninative.inc
@@ -7,9 +7,9 @@
 #
 
 UNINATIVE_MAXGLIBCVERSION = "2.42"
-UNINATIVE_VERSION = "4.9"
+UNINATIVE_VERSION = "5.0"
 
 UNINATIVE_URL ?= "http://downloads.yoctoproject.org/releases/uninative/${UNINATIVE_VERSION}/"
-UNINATIVE_CHECKSUM[aarch64] ?= "812045d826b7fda88944055e8526b95a5a9440bfef608d5b53fd52faab49bf85"
-UNINATIVE_CHECKSUM[i686] ?= "5cc28efd0c15a75de4bcb147c6cce65f1c1c9d442173a220f08427f40a3ffa09"
-UNINATIVE_CHECKSUM[x86_64] ?= "4c03d1ed2b7b4e823aca4a1a23d8f2e322f1770fc10e859adcede5777aff4f3a"
+UNINATIVE_CHECKSUM[aarch64] ?= "a25f2174d0cefcb22af005e9bc72ac01ae83b011c5b6d6d5bf00dac979877f76"
+UNINATIVE_CHECKSUM[i686] ?= "959cc2539b692f9b9862825c7324a0fe4d061fca742f6c259f67f581c59af956"
+UNINATIVE_CHECKSUM[x86_64] ?= "96045e8b1e242c8a849426a8506c7043f354b39f2bc0035192780e8205e23e9d"

