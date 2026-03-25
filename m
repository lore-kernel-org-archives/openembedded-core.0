Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 717F8109C03E
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 16:38:49 +0000 (UTC)
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27460.1774456726976229826
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 09:38:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=l22hgFwo;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-128b9b7e3edso94193c88.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 09:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774456726; x=1775061526; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C16EVAT/Q01yvR2hzIALYYdmYEkIPpios5+EcgIlF8c=;
        b=l22hgFwoeUWXB6CohxGKsNdCVVjerWONxA3pCV+q8H9p3bx9DD//UWRni/dPjKd91w
         U8fslwhR/RJdvGGMvu3MflQJHDQr/N5Ik1ZGGigxV7P79UEHzDqXLKmo2nzBbv1W7SVI
         eMiFHOga5zM5inp1V2ZhUjD+TuadjftLLv1LxECQTOZ3Db6Lb8h2PWIXYSDzTG49gNCW
         k18F40bc2Xe2jMtltt4x3cHTmocsrEsa8tl9RmnkkHA7E388nj8bE1tgrPEKOKfotN4+
         /gB5baOOVBHJDyUbc+HWIQ7LCi7t/R8uGMdyvNHXCB+AiWXbTnBw5ZRFPm+4XvKCtDCs
         frug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774456726; x=1775061526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C16EVAT/Q01yvR2hzIALYYdmYEkIPpios5+EcgIlF8c=;
        b=QICjbKBr7i75jdyLKK8kuizEsQA4DzDn4u74sjml/sDSvw2yEwiqzfRiE7kzkyMHCL
         k/BiRRM6i978FZXTb2ArXiVG0FgKlNtCzRymjzOX18P9hJKTDSPuc0v0cy1/7F6TD66Z
         l1vgfrWztdrYssPT3VHNL5H7WmfqV9Xx2aSJuj05WOlC/hymq8cRKoM8koCKVLXDpwlO
         rNoSoR4ImT6BIkBm/bGOsx8uu09c2eE9Kvx4I1ahm7mdIld9UzcPQaA0WrdzaUVmPmr3
         nGyqKpT7PJ9tjGMP8U1K1XVyFKUnMZAfmpOdb66NQHaeNdyYay2ic7SIUIrbBd5G0yYf
         Da6w==
X-Gm-Message-State: AOJu0YzBLXXrLlV93iyEuLsZ/YsDjasAX33mB8VV6eQUFTf4aOT799AK
	F88Zz1Rk3oJKP0UdPkGCKN1Hz96VJcgKvn+CGKO5OvGNrO+UU0nxn5l6GSaebtLt2jw=
X-Gm-Gg: ATEYQzyk/Sl+uD+078NY2OPHxPiUl2pzPDiIG+KlXQRqtyfYZBYbz1xt2wkxpTRH8zr
	SuJCwKjR88kbCC2QAMqCiTN7gXFnxA6j1Jh8BWPwWgsID1dbBmXg5kPLDzBURqd/vUSeFeGuUJ3
	he8bhiNICtsZ1ngWxu4LsJHnjbJrFqaXBuW4J4uwt5Tw1j5LaCg2/xe2e9AQIag8FiMrOy53b0R
	rMpX4/Adtcx6gzSry3Q+gF+UsGCPTkrbWs0/a9AuCFiagxpz4GnniObexlLsLjb4JJJGM/xYVTG
	joAW32+oFAfXGdooxCldGksnLlZDCastVJhJce7T4Dqecr9Ab1dXAIwb89z0lSNXgjdOnCkwTcX
	SU2bz9//8laDkcYgOdWTlV2xGykzcGXWFaTW6z6OYYEAUwr1mFqhAYUojNrlvp88wKG04dncWiD
	Zxg+5+hASdeHfuIqYysXWrMzq44rPYTBm58y8JkAg7Ym6ipsobo08OeBd7esos/j+8V59rvlQt3
	3WTgBgtUfVw1DbDb6d4EzC22D7NNr/MvF1kfpOv84sABnlRxc8o6sCJcik6rnpmnkWTKJY=
X-Received: by 2002:a05:7022:eac2:b0:12a:6ab7:3f73 with SMTP id a92af1059eb24-12a96b89dc3mr2520971c88.0.1774456726008;
        Wed, 25 Mar 2026 09:38:46 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aa762430bsm336300c88.10.2026.03.25.09.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 09:38:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Changqing Li <changqing.li@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: [PATCH v2] mesa-tools-native: Add dependency on libdrm-native for panfront tools
Date: Wed, 25 Mar 2026 09:38:42 -0700
Message-ID: <20260325163842.2672762-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 16:38:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233927

From: Changqing Li <changqing.li@windriver.com>

Fix do_compile failure:
../sources/mesa-26.0.1/src/panfrost/lib/kmod/pan_kmod.c:7:10: fatal error: xf86drm.h: No such file or directory

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index a95adfc960..ecd3b3780e 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -111,7 +111,7 @@ PACKAGECONFIG[imagination] = "-Dimagination-srv=true,-Dimagination-srv=false"
 PACKAGECONFIG[intel] = ""
 PACKAGECONFIG[lima] = ""
 PACKAGECONFIG[nouveau] = ""
-PACKAGECONFIG[panfrost] = ""
+PACKAGECONFIG[panfrost] = ",,libdrm-native"
 PACKAGECONFIG[rocket] = ""
 PACKAGECONFIG[svga] = ""
 PACKAGECONFIG[tegra] = ""

