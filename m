Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3B8BC982E0
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:39 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1610.1789682914491559144
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=2uNtvF9v;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso875905e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682913; x=1790287713; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SGJ1OSHGjpz7DTzH5AI4hCtSiKynSQ08s8HNonUOr3E=;
        b=2uNtvF9vg4GcdY5IerodjzwXBnqDAjF6xsu2G/lqLhzOK6J4PHxGmqwk55pYDHfG3+
         uffSI69Aqd0SsI2Anw5qemYfWd+1+P3rzdcepJ/u8ekg3RI9zYMvRrODdbBm8eqALLcJ
         ChGgtqEmJTCh7MCaRPv+6ML8OVQwhSlW8sn/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682913; x=1790287713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SGJ1OSHGjpz7DTzH5AI4hCtSiKynSQ08s8HNonUOr3E=;
        b=Tnf8tEowDnFA84AhxzNRUBIRrvCm5shvMwk0+wJQw9aFj6TM8wp2E8EcMIN+BK7KYj
         uCIfxdT0CuhkKpJIEk+U2R8YpX5ScIrbUy1SYLZdS2xm4eMEEqUTSTT9frKrgt4nfLkA
         9oO6kf5FlbVpCciM+H0ajdRwgsT5U9U4xQbW2eBt6xRH2ky+/2KATpO5cY8evFfnSl9S
         c6UiwRSaeMDHgYDKgY24+NZkJxELxqGgI3wJNgKzKXx+PlyEAclaIjsT3VSWRwcHtK3c
         +BVvXOOqt99I5HsbqTpBygZ9FKZXkWn0TM8zjaTSLT1GS7G8zmdNZ0cHqSg01zSwiYxt
         mibA==
X-Gm-Message-State: AFuF++mJqXbi2F0e4YQQvidDUxTKvr08pphcTSv8CHLWo7p4IIseF9cQ
	GOuK8gH6zVOdZsELoTCB/9wYrBzycgUIWXUQLFrH+agZyegfY8XKbPOj5LhSHimYH9PYmDpAkrt
	RzhWYtpo=
X-Gm-Gg: AYBFou0EfLBu6UXFx9xk2nrYsFz5cA3msZ0m4LtcG6IPYhHug+qIoHxgWDltOnrlBN2
	gCzIq9htPEzhF+0CiIOAHljF/hYhp1F++KflWdP8i2rGP4VWZhF0h6J38ALXvvUQzZJ0qxGB6Sw
	6TtBV/ixvGFw/T+tCsy1kzsiMjmM8XrQOwYyqtH5Yu0sjqNNQ+PKDTUEZmgsrArDPfhpyEtxEwk
	p2Op9TaxHya9KwueqY0aee72so3sT/oY8Yzcsxhm9W3gsp9eN1+RDUwndIKd/zBtayPtEkyEbPz
	2jZMWyVujFYhl6e2hPeBEDr6LUX/+NPc8kHwm8PddNg+kWgl8wQoNdVXAa88ERL4CRhvrzSjC8r
	KBpznP32ZQKJgFBoSeMT8ZVjTg6F0gJTnOnpclrM8goAljj2t5M5A47mGtpYqp1qzF7TXhbSXfj
	gL0xTEZknpPqluxpkkDwuy1qPAlfilfSl61qKgZt2OMduP/AqfGUU8Np2dRow0i4J4t3jkqtqKn
	tw2kcWGRJiLhKQxPqilYt2Uwmx5aL2VdArFpMFc6kWZMtpi8Ydrt6ZlU/ndbWXExyOBFc2MuAY=
X-Received: by 2002:a05:600c:5251:b0:49c:fa20:cc00 with SMTP id 5b1f17b1804b1-49fc5736898mr2841055e9.23.1789682912728;
        Thu, 17 Sep 2026 15:08:32 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:32 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 79/79] mesa: align x86 mesa config with LLVM graphics
Date: Fri, 18 Sep 2026 00:07:04 +0200
Message-ID: <b73335d791d8bf349080704699742435e6a22eb8.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246174

From: AshishKumar Mishra <emailaddress.ashish@gmail.com>

This change makes the x86 and native mesa PACKAGECONFIG appends conditional
on the same DISTRO_FEATURES check used by LLVM.

As a result, graphics-related Mesa and LLVM options are only added when the
distro explicitly enables a graphics stack, while leaving non-graphics
minimal images unchanged.

(cherry picked from commit 2cf81caa69474c5ec2397ca37622c86519791d44)

Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-graphics/mesa/mesa.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.bb b/meta/recipes-graphics/mesa/mesa.bb
index 66c8f9c3720..a646c16af75 100644
--- a/meta/recipes-graphics/mesa/mesa.bb
+++ b/meta/recipes-graphics/mesa/mesa.bb
@@ -13,10 +13,10 @@ PACKAGECONFIG = " \
 	zlib \
 "
 
-PACKAGECONFIG:append:x86 = " libclc gallium-llvm intel amd nouveau svga"
-PACKAGECONFIG:append:x86-64 = " libclc gallium-llvm intel amd nouveau svga"
-PACKAGECONFIG:append:i686 = " libclc gallium-llvm intel amd nouveau svga"
-PACKAGECONFIG:append:class-native = " libclc gallium-llvm amd nouveau svga"
+PACKAGECONFIG:append:x86 = "${@bb.utils.contains_any('DISTRO_FEATURES', 'opengl opencl vulkan', ' libclc gallium-llvm intel amd nouveau svga', '', d)}"
+PACKAGECONFIG:append:x86-64 = "${@bb.utils.contains_any('DISTRO_FEATURES', 'opengl opencl vulkan', ' libclc gallium-llvm intel amd nouveau svga', '', d)}"
+PACKAGECONFIG:append:i686 = "${@bb.utils.contains_any('DISTRO_FEATURES', 'opengl opencl vulkan', ' libclc gallium-llvm intel amd nouveau svga', '', d)}"
+PACKAGECONFIG:append:class-native = "${@bb.utils.contains_any('DISTRO_FEATURES', 'opengl opencl vulkan', ' libclc gallium-llvm amd nouveau svga', '', d)}"
 
 GLPROVIDES = " \
     ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '', d)} \

