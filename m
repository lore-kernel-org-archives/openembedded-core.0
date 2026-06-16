Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8047ECD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 19:16:38 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5744.1781637396436737610
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 12:16:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=U+al4l3V;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49230a567a9so6505815e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 12:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781637395; x=1782242195; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zOwp5o+IBW/3ncl1Ymul/Fm1sXSRn0O7671YoZHJ87I=;
        b=U+al4l3VOInpuJ3kpG4gqiAquoZk2PknuAM+otWm+qQ0xApHsxkiEPhOKRxF6tW57c
         e9H4qaz01swzId4MFjJIKX/5b/L2QaZfymxquZ6dqDNUHG3exWCt+fyx4HUo3T7xN/iU
         LJFtgqdj5N4ixaOOzpUcHegam3ANpk47/RjigWl7p9mi7O4+NXMHbHIdBGavnNTVde92
         5hBjtyUeNneX8Qszb0mTs9BZOXAWL8vaipi4hJiZCdgM90zXfjP6jga20TScce8kA+X7
         J3wfIwt6EnyW5Dy4G7WCXeYGMBNSvY/Oa0FJ54NKAlCGKxD6i/EGorlYNCBr+2WVJ9x5
         2/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781637395; x=1782242195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zOwp5o+IBW/3ncl1Ymul/Fm1sXSRn0O7671YoZHJ87I=;
        b=arNymzDfqgqSihko6Qdc/A1ovF2WUf1WVpEWCcvIrBJpCHTuHFdAV5qAU+X1zmskgN
         GIN3Ar7a4tsOECkETICmGCytyRFR/RwQrLR4xZpFZLvIhROpMeba+JQQJinLfYJQotOK
         whDov2ehr/UtKcue8wu7vf2yDs0g2iDW3faPCS/It+zio4JWJRAL90D+jDeZOsoVfvmH
         pO4Uvz1K8VpwxpXdfKG/TIfCbmX8JMcrgZyCzPES462xsqpXVvxzdol8jxYcW0muf2nU
         0eIiHIKjareo811/tWLcG4OIymccit8T3oUKWHWK2Uz9P4i6pwaZt0qdqn5vcWYOSKok
         z2mQ==
X-Gm-Message-State: AOJu0YwooM5c2nbwXyZdShq9uiaEtpeOfACf00Weivxq13rxo8MpDv6G
	wRCN16fm3VVN0IWaHrXg6+TdN+xQ0wBcgnX8wpxCxqXEAdWIzqNaPd34Q5S7hr4g
X-Gm-Gg: Acq92OGcS7bzLGsvLUYYZO7DVaWtQz0ivsmcJbEmApIwaIXprdtLLAeW+sYwT/zwg1Y
	x/4K0besM91j9NbQH5odLbxSS69Ux15eyO8Td2wkUoXIqTw7Xfq9N0PlEL0lWLQr6LhrIwxfvY8
	Ee/1aTrHKVODXppilh/awC0DWpFhzgIfqAACRXrIPIfCuHgCnkHci7OdcRjoD3mImmD81tuuCS7
	0GQ5qtm7h/qDnkPSHYGYzzc2HZKpPV0Y6IxzVEqy0Mq2WEN62L30pDcYlK1uqP5cv6aIWzmGNH9
	zWFuHv3EvAq1SM8mK4vTPS+gLc/eHzy10aNJ7LVB53WxTB4LKBjqI1Rm3w6QlPBdFcQ+vSSGx7O
	ckDejrO9OlMnGs6h/gpFrP98fFwhfNkT0JJ5xiQkjzk2ygOp4haIz4/rJVe90+ZuUTI/s4/j0uA
	XF6A912MShQSC+uMhuKHXPnIv63Rz9P8dM6GIS1CDSi/Op8Xhlq1Ly7jk/kiI=
X-Received: by 2002:a05:600c:3b2a:b0:491:a220:6e48 with SMTP id 5b1f17b1804b1-4923342869fmr12492165e9.32.1781637394444;
        Tue, 16 Jun 2026 12:16:34 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4f8d7sm86982035e9.5.2026.06.16.12.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:16:33 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/30] glslang: upgrade 1.4.341.0 -> 1.4.350.0
Date: Tue, 16 Jun 2026 21:15:59 +0200
Message-ID: <20260616191628.2014553-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260616191628.2014553-1-alex.kanavin@gmail.com>
References: <20260616191628.2014553-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 19:16:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238928

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../glslang/glslang/0001-generate-glslang-pkg-config.patch      | 2 +-
 .../glslang/{glslang_1.4.341.0.bb => glslang_1.4.350.0.bb}      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/glslang/{glslang_1.4.341.0.bb => glslang_1.4.350.0.bb} (96%)

diff --git a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
index 150242ce1d..d74f37db91 100644
--- a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
+++ b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
@@ -1,4 +1,4 @@
-From 6a4237802d8a79f65ed74b12865e2ce5b666993d Mon Sep 17 00:00:00 2001
+From ee46f2f608ccbe9617ce41235d047f080d972ff7 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 7 Feb 2021 01:30:39 +0000
 Subject: [PATCH] generate glslang pkg-config
diff --git a/meta/recipes-graphics/glslang/glslang_1.4.341.0.bb b/meta/recipes-graphics/glslang/glslang_1.4.350.0.bb
similarity index 96%
rename from meta/recipes-graphics/glslang/glslang_1.4.341.0.bb
rename to meta/recipes-graphics/glslang/glslang_1.4.350.0.bb
index aa4f48bb9c..bc33931b3c 100644
--- a/meta/recipes-graphics/glslang/glslang_1.4.341.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_1.4.350.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://www.khronos.org/opengles/sdk/tools/Reference-Compiler"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exception"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=50ff9d0fcde2d5b953ebe431c48e34e3"
 
-SRCREV = "f0bd0257c308b9a26562c1a30c4748a0219cc951"
+SRCREV = "275822a6261ee689aadb1da5f09a0ec2f058685c"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https;branch=main;tag=vulkan-sdk-${PV} \
            file://0001-generate-glslang-pkg-config.patch \
            "
-- 
2.47.3


