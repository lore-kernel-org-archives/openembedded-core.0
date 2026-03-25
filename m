Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03CEAFEA82F
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 07:40:03 +0000 (UTC)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17370.1774424399900279762
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 00:39:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Go9YtCew;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2c15849aa2cso1287633eec.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 00:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774424399; x=1775029199; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xl+1jFVG/OPo1MwHeOO3i8lKdr4ltR4W3U2v/pOKjcs=;
        b=Go9YtCewNbu25/kDHepo3OzU3CtBafsbZZ31c9Kl828OZ9lWbF4q54zhnj2YlUUR8k
         GnXnVYA3kNyQIMYhuP45eqK9Yle8cT1hWi0n2sd7mVAMhNij07DotaUROrcUmzYkO1oA
         olx2Yl6FC1GtI+4+QCqsWWu912egSQZ1WpgGimUONg0+qAN7QjxSWDeSSmant3mRpp0g
         5YQa6H7szC4MMqNgvlvW3oo4a7VoNw2TQbuTrCXkZNtz5jlT1KmYjBIgFfwWTfffR05c
         4u6SaF5wrs0vPoElwPrQpEfDi1K8yrAX0okEaAhUVVU1IT4PWtoACqKggTWuruglx5NE
         alXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774424399; x=1775029199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xl+1jFVG/OPo1MwHeOO3i8lKdr4ltR4W3U2v/pOKjcs=;
        b=KgCRhJKOHrMqApo0Myfdtl+KnTsy2UeC1AKQ+B1DVFUV+WOvoFPm9MQwSuN4uV2dZF
         zA13tODHNlZk/azAscCWkGkYArS1eJ9K6XJsGQ+S0ZZUkpDTNqQyhOBfVGeQF3SeiLMA
         KgTev7nhfqQubemdTEnVJ1q1px7pS28fOuVmuOktHqX4ppQ7uH0M7KHYQFvH0HmoQA7W
         UEIzikjAlOD7Sau7ol4O55cQxnmQCeTbczpYHkxTBNybKeiBQMKl5bg+RzermeaN0G6C
         eisXUDpIYyfROsQEOw9t3G5Uc1aG/yz9WKo9IQwgcc8osxMBg9dL4RCUz9z2RhHKzHee
         R5eQ==
X-Gm-Message-State: AOJu0Yzn45AdF2Mmt0EJ02LiKZ+qbK2iZFP/+NCvYs4JxnAUBJIaj9Wb
	CeORttAK14NbGHka6bjpMBrKA6NWOODL4vm3dDiy0iU1SWac82F3zHxo08c4ItZ8gAs=
X-Gm-Gg: ATEYQzyV4OceiCG12T6ogl93IFmsd9SXN7PIfLs7d01DYFpfTDW5vK9KI1GKzlMVGUt
	mcMKgFvhTYpAYndkT8VnJYk32SXZZfv/9BDeWpm48RajY5Z/Hw9QZ4dmHkgF/ZmM2sp5zJPBdWX
	9T17k6IcljLWU21ssG/5nMP0sL920DGlJyaClwcf6ujjN2MHc1aNIu1R6+kPjiLMfZvLDxLCTeQ
	CTpeJUue2BCcNDPRnhrIgxUjFzsBLYdItxFyVBrLvZgxD427qy+rHRXQzKmVX0dx/o3py9TNem0
	mgOkKiVNcHnSFq31TknKNOI1TXclJ19XzAm2xwYo07eeaY2O63R2h23/GIRJJAFknQEwjnGRc7h
	CC0N6o09U+fX5QNvtaXU5FGRZVsHgQSjr09xWZtgPxqqn0XSkv6cm2hnEMQWNpDawwHCqx78xpA
	QYdpxBU+I6sG+z/Ir6F4ZSKnW+fX/jv2ZHjgNT1FDWhMP1fnxfb/VBT2IUP2wW6OhVl6VO4jmgi
	8l8cfmvztZWpdlT1V51xvy1+gyuboF7dG+SzhmimneVH81xRnXydqnxW60J
X-Received: by 2002:a05:7300:3c21:b0:2bd:fe5a:b861 with SMTP id 5a478bee46e88-2c15d18ceb7mr1244517eec.0.1774424398747;
        Wed, 25 Mar 2026 00:39:58 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c1536aa870sm4932077eec.2.2026.03.25.00.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:39:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Changqing Li <changqing.li@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] mesa-tools-native: fix do_compile failure
Date: Wed, 25 Mar 2026 00:39:54 -0700
Message-ID: <20260325073954.1176537-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 07:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233863

From: Changqing Li <changqing.li@windriver.com>

Fix do_compile failure:
../sources/mesa-26.0.1/src/panfrost/lib/kmod/pan_kmod.c:7:10: fatal error: xf86drm.h: No such file or directory

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-tools-native.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa-tools-native.bb b/meta/recipes-graphics/mesa/mesa-tools-native.bb
index 50d2f5cbb0..743e3391e9 100644
--- a/meta/recipes-graphics/mesa/mesa-tools-native.bb
+++ b/meta/recipes-graphics/mesa/mesa-tools-native.bb
@@ -11,7 +11,7 @@ PACKAGECONFIG += "gallium-llvm"
 # to PACKAGECONFIG like in mesa.inc
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d)}"
 
-DEPENDS += "libclc-native spirv-tools-native spirv-llvm-translator-native"
+DEPENDS += "libclc-native spirv-tools-native spirv-llvm-translator-native libdrm-native"
 
 EXTRA_OEMESON += " \
     -Dmesa-clc=enabled -Dinstall-mesa-clc=true -Dmesa-clc-bundle-headers=enabled \

