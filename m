Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0194EC5479D
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:32 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.9372.1672830363665812039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IdFriFwQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so26126199wms.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qSVNfkG4CauYc1rI3OvYSOpwBeoEImql7OzKvmQRgdM=;
        b=IdFriFwQamsCW9V7BLN0Hb2cJMrUIJL5xuVa6XvzY/LZJpmhShzIUzM4S2dJNkLxSC
         6JDnVX7iYyaxljhYxlfaFV9EW04IQA8P+kasM3OZRmpm0k++b/UUCy74XP/rLchBsGG9
         8dqxQFlORLOLpEokpeUldCVCvPFjstdFGYhNl+zdm8OUXXuHp7C1NN5K/m8DxtK10LrU
         PFIzBlzTrM18w/+/QFFkheUPhnNdO+petfu142BILyFjtb9qCSMx6dkTaF61mxC71qnx
         UanSUPctdGCBK7rN+1TPPsVLcucq87R9fXVeYx5JsEqBxyOX3OjEiMvMJGLjd82xIHN0
         cMJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qSVNfkG4CauYc1rI3OvYSOpwBeoEImql7OzKvmQRgdM=;
        b=XIk7pWhU+MDgLkRja4c2QbJ0GNv4gcLBHTGfZ21vq3xp/ZMNJifiCrN1Yew+btzVMh
         lbeHAwOT2cfA8xEFGOkLa2EMzh3TLJyD0d5HDngeLlW8D7guGNxrR+QXsGTsfcNpSeYg
         u7zS7eVqnxOsnD+Dqq2i2uJygmVas/Iro7TEdDcbSnZxvhDrSBI03Fre3vezt6SANnGy
         Aa+xu5+AOpzxGpjKeo7/pbDpVpUtos7Hhwow+E1Qf9rJYSBBta5AXkNluuBCSzrTxoVh
         R5mZgIGdVdYE40HhEQi/Euo1LYWwsGsmOqnX1rCg+bgKG/VKi5gNhw/b7viaZ2EDdsdk
         uHwA==
X-Gm-Message-State: AFqh2koyXQzGAZwzxygquNAM1tjq0gz/w8JSbNDM5lKNthakg76LxGeY
	wN2V5HcQUdNC+qyK4QnOIHfYl7kbHAk=
X-Google-Smtp-Source: AMrXdXubPiXsJU8VVULPUm4+S8Tn6IWXXxPLYr8PZnEkfB+SBmR6jNs4b+8LIYMgXJ4iflVQ/YG1Yw==
X-Received: by 2002:a05:600c:4f83:b0:3d3:49db:d95 with SMTP id n3-20020a05600c4f8300b003d349db0d95mr33291963wmq.37.1672830382942;
        Wed, 04 Jan 2023 03:06:22 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 40/77] libtest-fatal-perl: upgrade 0.016 -> 0.017
Date: Wed,  4 Jan 2023 12:05:11 +0100
Message-Id: <20230104110548.2537259-40-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175424

License-Update: formatting

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ibtest-fatal-perl_0.016.bb => libtest-fatal-perl_0.017.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/perl/{libtest-fatal-perl_0.016.bb => libtest-fatal-perl_0.017.bb} (85%)

diff --git a/meta/recipes-devtools/perl/libtest-fatal-perl_0.016.bb b/meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb
similarity index 85%
rename from meta/recipes-devtools/perl/libtest-fatal-perl_0.016.bb
rename to meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb
index 6d36c94eeb..1c3a7e5136 100644
--- a/meta/recipes-devtools/perl/libtest-fatal-perl_0.016.bb
+++ b/meta/recipes-devtools/perl/libtest-fatal-perl_0.017.bb
@@ -7,11 +7,11 @@ BUGTRACKER = "https://github.com/rjbs/Test-Fatal/issues"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f7c73bf24be1bc7759bde9c15000db6c"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b5c851290cab1dda12fcfb0e9ec43639"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/R/RJ/RJBS/Test-Fatal-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "7283d430f2ba2030b8cd979ae3039d3f1b2ec3dde1a11ca6ae09f992a66f788f"
+SRC_URI[sha256sum] = "37dfffdafb84b762efe96b02fb2aa41f37026c73e6b83590db76229697f3c4a6"
 
 S = "${WORKDIR}/Test-Fatal-${PV}"
 
-- 
2.30.2


