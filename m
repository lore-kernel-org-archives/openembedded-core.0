Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9170C4167D
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 18:13:15 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.9.1668103991439411237
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 10:13:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oKtVJ+RE;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id g12so3435429wrs.10
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 10:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzSl/Qk4C5pKgcp05+9zgmAVnVCH9EB/KDD4CJ3c87A=;
        b=oKtVJ+REWjOBJaPl8AVMH/aUddwsfxD0vBhQaTQeLHbpfip1H8pjhb0U/vc/26pKdO
         59b/VyD8/iBGstMPVyrXUUURoZCSTp8dDQFx4mz6AxoOkLRLMROLfhGyq4ATyOHM1l+6
         61ox7VN15NM61uAtoKv12qvXSs234NobIaV5eRSWEBODbxxpj+5g0oxM7e9PylkQCfh7
         9VIiRPBQZZme2sXhFBp4LDMZTNe9YMuJcuteUPGWGeuN9Zn504kU2cG6BrSM5jLNd2D9
         RgnmfeVjuUapoA1TIebQ+D7EfRld9XDxPGZBi6hcW7L1kWI38FbhDMO+RlX1wd0OMovf
         wG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TzSl/Qk4C5pKgcp05+9zgmAVnVCH9EB/KDD4CJ3c87A=;
        b=BWz8a4yUhvSRxq2Dk2ipPp+Wi7A3baJeCOBdINicdTve7jdOnkOrXle6ZD4WOQ31Pl
         sGq8yTUay0BjYu2OFSimJiJn+zh8UpxyHabHD0HQ0t2cfk/t3xwvnm95rAxu2763nK6f
         Jke98EJuE1V4CKHc0uXaNkcJjI2yKzLe/+ep4GYU4KwMwrN4CZx+q/DKzutZRPA+DZ46
         pJ4H7rAcC4LnWr0F26r1A8eUOprYCOMaZFWVIDqKVcOvc2tSWPNJpXzPKtgiBZ6EiSdE
         mrHExRkiBzta9KzELE6Zkvo8f3KDU7tRwUDolIz2EYA3KQxVhsL/nLOgQQcBgvGtvzqe
         L1MQ==
X-Gm-Message-State: ACrzQf1wPE2laOp30tgdvqPpxkOSONZSnHCQ+qD9THrryoDlGG/FexpS
	B4CTaLSvsI/T1vcOKQPv+japB8Y/RjU=
X-Google-Smtp-Source: AMsMyM6Qd9Zy+hxPGxK0zKzrlhnGnirLjsKGs9pjMculXwCets28wgUDCYM76UTp2RFWmNv9n79Atg==
X-Received: by 2002:adf:e84a:0:b0:236:5f2d:9027 with SMTP id d10-20020adfe84a000000b002365f2d9027mr41667835wrn.89.1668103989898;
        Thu, 10 Nov 2022 10:13:09 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m3-20020a05600c3b0300b003b4ff30e566sm8400477wms.3.2022.11.10.10.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 10:13:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/19] libepoxy: convert to git
Date: Thu, 10 Nov 2022 19:12:45 +0100
Message-Id: <20221110181249.1240200-15-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221110181249.1240200-1-alex@linutronix.de>
References: <20221110181249.1240200-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 18:13:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173098

Latest version doesn't come with stable tarballs.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb
index 1210f73a86..b3b26b57fe 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb
@@ -9,11 +9,11 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
 
-SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.xz \
+SRC_URI = "git://github.com/anholt/libepoxy;branch=master;protocol=https \
            file://0001-dispatch_common.h-define-also-EGL_NO_X11.patch \
            "
-SRC_URI[sha256sum] = "d168a19a6edfdd9977fef1308ccf516079856a4275cf876de688fb7927e365e4"
-GITHUB_BASE_URI = "https://github.com/anholt/libepoxy/releases"
+SRCREV = "ecfa8e0f083084181d36966fa084aca9a6c97d53"
+S = "${WORKDIR}/git"
 
 inherit meson pkgconfig features_check github-releases
 
-- 
2.30.2


