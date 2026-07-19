Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C1CFC4450A
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 08:01:29 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1671.1784448082005281763
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jul 2026 01:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JD1A/yqR;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f633e6058so1793523f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 01:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784448080; x=1785052880; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=450r/B9qx7wA9XDXs0TxZJpd01lL5MbzSQT2iUevacU=;
        b=JD1A/yqRG2UfFzKcn7w+R0l/duX55nwTNNOQ9oBzwMXFCQTx7I9KHcvv1L6ieiUv8Z
         YkKh3YO1oTtDM4+fcgsPX+PgHl57sZtB4mj+5xl+kD5h42Nae5HLzPHxGZi17zJSt/0+
         QN146yKDqrt1WImfG1vJMyE4V4rNK+CEttCagEQsUXP4ithVpjXnqhhD0fsMhDBUktCb
         T34LfnEOboTKHGGt5ggbt4vY2R19gO4UaaLHPBXHRb2o6j/8NHLewAKXyk92vQTzrvu7
         pjtrXIgjSfFEYhaujeYzZt8yM3gD3ChUFwnA3ENrzPlK86taMh9b4SMDRTABm2i+DbIf
         qb4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784448080; x=1785052880;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=450r/B9qx7wA9XDXs0TxZJpd01lL5MbzSQT2iUevacU=;
        b=oqOS8PhJLwaovO/5wEjS+r3+nD/tDdFZXhLg1IjaLSyF1WEDH5kzu9Q3N+IwjLPDSn
         /1ksm4UbLg2uBBO44HhDEgvRnPxtUYG/kRGOWYcOkP5tIzdzqLdZVzqh1kBm6tIoceyB
         Z+0pB0kyRYaR0ZCQKuq/j4TntqT6y1vcqvy52R3/7KHLBu5xrifoiH6S4ZH1pdXLU85W
         CZJSgJ6vJc23vVg2T207knJn91Y0dBIrsYX6aXJUY8RMDED28SS6cmQeTjKe3jXxoyJW
         ukzOuZbJCw53BNzEuJFvhgfkguMsLlQXUscmm5AWICL3ypgbNdq318xWjW3sArx9TOqC
         BurQ==
X-Gm-Message-State: AOJu0YweLFuTnmzGNRGJmDPscdjlPBdXgngBeFFV0CMJi6vy/jwGolcD
	dFjhhZQmNQLgfCIzcsyWheAFPA3t5RC/FTco1ATVBqfw1R25ec4FDctdicAkBw==
X-Gm-Gg: AfdE7cklWJ4d0wcdAGUhHGGMxEQKh00Y3nsS0bFcOHVeZfU7ibJN6g1RLWsM0f3X1uO
	Chm0f13iV5y036hjtskywYgt8qE8Ph04Bqb8s/L+es0pHL6vVyNKNY4sgRinVKqc4j7mB9OGXC5
	9F10kweDOxQSnuiPXciJLpFl1PO4Zy1nJeqMe0hUN5pu9raqQ4MPi3gBO33Kb025TS0EEafVYbp
	UJ7qes2r3XwkAgRwISkDkWzho8diIGjsLv82PCyII6GhirDkrfvjN4+58Ctu9gO5msvFKY/a0I0
	xp/QroNssyGcJR67EqAan3ujUma8UFjpckcTKKzMll3ujOGBGceuass9cfyF+umMWCBbiRtHdfn
	Ip7YvaVepPhD87qzO/55XuPHi2Ix8UraHhOlOCJsj5S+8R2hpPjswGU/FlT962S9pD/OjhC/jP/
	XWog==
X-Received: by 2002:a05:6000:38b:b0:47f:6dec:fc04 with SMTP id ffacd0b85a97d-47f6decfc51mr4450170f8f.29.1784448079775;
        Sun, 19 Jul 2026 01:01:19 -0700 (PDT)
Received: from term011.lan (BC24447B.dsl.pool.telekom.hu. [188.36.68.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e49500sm19221644f8f.2.2026.07.19.01.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 01:01:18 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2 1/3] mesa: Upgrade to 26.1.5
Date: Sun, 19 Jul 2026 10:01:06 +0200
Message-ID: <20260719080108.1290998-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jul 2026 08:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241276

See the announcement:
https://lists.freedesktop.org/archives/mesa-dev/2026-July/226671.html

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index bb071e2411..15d56c804d 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -23,8 +23,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch \
            "
 
-SRC_URI[sha256sum] = "072705caa9adf4740f1489194b13e278ad959166863b5271fe423a86353c9ab6"
-PV = "26.1.4"
+SRC_URI[sha256sum] = "79e421c7ce18cd9e790b8375920325779f10798630bf30e0b22f1a21c8617122"
+PV = "26.1.5"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.55.0


