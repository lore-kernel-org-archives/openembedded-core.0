Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6120FC982ED
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 07:07:21 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43674.1789974436121513488
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 00:07:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SELnCwJe;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccff31419so21922765e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 00:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789974434; x=1790579234; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+Fws4ZF+850ZApOhGgYBXIzIkVOyNzx2UoRsewFmR0w=;
        b=SELnCwJeaLN20wDgFGhPaZfyP2Y6JxNVtPsIkqzUBVhuO08+qte3fRv1lkigIUu/Vj
         HxTAjJte2WdsY8m0gFz3Z/qgwRqSSoKp2qGJIJ/bBF1Jsy6Ic9vOxcviSfFhDGGLp8Bn
         jD9N9+cduxpfPQVWS0YiIOQ44rDH3UoHtHTJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789974434; x=1790579234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+Fws4ZF+850ZApOhGgYBXIzIkVOyNzx2UoRsewFmR0w=;
        b=xUgVv6Ze3Su22hpYl65SL7SiIelADfchzSx/6ilxtw1nN0Gm6E8iIS6nGSnD/iant/
         r0JhC9uxkDkMe7PTMjL4owvVvLb5ICJmNff580cEzKssd/BWZ7KvARpvR86gvjZ+jf1w
         62UXu1t5ux3nujAN9v/cRr+IX5EiSVyTQSsRuia6atmgKcpdANvEmobOe73k7ZKAf3IG
         WetuRY9wa2uhp1Ptlm5nrBdmv1n1ePvthIJ1FD7JTkMEDIfE7KqlXAcmUk6s0lWvrR6t
         8eFx8dX8VfSlbEBc4XYd/WXVBixFU+dAeZohDGNb4JF6o9+u2BtqpFn8QbmQpsMGrWZ0
         IT8w==
X-Gm-Message-State: AFuF++l1PUvt9PNSo5xKfc14E2BxiqOvaj4TrDgsQJAoZ4eChWD35Zap
	0gZ3wJS7aFA6U2dj/wjp5Y40efPjXR3pyBwSd75/qadm6ocDEIiLgJPl3O/3WMIbJRptKMadXm8
	eXq6C0kg=
X-Gm-Gg: AYBFou0M/7m3zh164rn4ZG3/3WNJBT/wHTn8CVV/ZqL2TVEDwPbIH2ktXHbUY/06pq2
	PyOgdOdzFr1Hjo4rzxSBRhshgxmaYvfl4eTjZvX/kRLLdoTBKpZR/ClHnp5z1U4xYjrCZ4KyW6q
	IYi40tvY0NUnJsHdXvPJ76qPFu6dr2ZtBAp1mlMEoclc4zCWg5Uetec+5HDgmequkp9q0XB7OPg
	RmNIfBopIc4K24SBj+bk6kwLQM2HjhaU+UgL4/pdNmsoV2J+1TMNu6qCQMov8VBt7TxNAu1kS38
	xTbLunkyrcA/Clyi0DSWJ2eYq2Ge1ds1Sl4Gjh0GLoDO9LmOo7q92dWHMUM+zjA46soByoGkS3W
	nJOBU0jD8+3/SXB+jC+1kMznd+WxJUz8ATgYDqC94RMAlm0/pV38XwXKYMT9loKq9yC5zfm2zir
	YzBWg/n56/CvF+4JIycITL8xlL8gUbxc32kusF4WxFgoPoxpoXwsNbHm54cGYwztS3tkhNKPHE3
	vPIxRIFDlIs3WrDjz6CzT9UK7lH8D0xkpjR+Q==
X-Received: by 2002:a05:600c:3b05:b0:49f:c196:47b9 with SMTP id 5b1f17b1804b1-49fc567318bmr128992795e9.4.1789974434186;
        Mon, 21 Sep 2026 00:07:14 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:481d:998f:15fb:95da])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm276492915e9.3.2026.09.21.00.07.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 00:07:12 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/20] mesa: upgrade 26.2.2 -> 26.2.3
Date: Mon, 21 Sep 2026 08:06:48 +0100
Message-ID: <20260921070656.521680-12-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921070656.521680-1-richard.purdie@linuxfoundation.org>
References: <20260921070656.521680-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 07:07:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246299

Bug fixes
---------

- 26.2.x build fails with armhf
- Confidential issue #15052
- GL stencil reference query does not update immediately
- Mesa 26.2.1: radeonsi no longer loads for GCN1 / Pitcairn when using radeon driver.
- Textures got swapped/glitched on Wuthering Waves game.
- [Navi10][RadeonSI/RADV] NGG culling causes nondeterministic GPU hangs; nonggc fixes both OpenGL and Vulkan
- [radv][bisected][regression] Broken rendering in Persona 3 Reload menu on RDNA2 in gamescope
- radv ignores count of 0 in vkCmdDrawIndirect

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch | 2 +-
 ...0001-freedreno-don-t-encode-build-path-into-binaries.patch | 2 +-
 .../0001-meson-misdetects-64bit-atomics-on-mips-clang.patch   | 2 +-
 ...src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch | 2 +-
 ...src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch | 2 +-
 meta/recipes-graphics/mesa/mesa.inc                           | 4 ++--
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch b/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch
index ac88417081a..12002a2c037 100644
--- a/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch
+++ b/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch
@@ -1,4 +1,4 @@
-From 229a8815750765d7125f0c7efe9c8d6216678bef Mon Sep 17 00:00:00 2001
+From 52293e90484f07b5186f2f1fa7de63da0f120122 Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Thu, 13 Aug 2026 00:00:00 +0000
 Subject: [PATCH] addrlib: avoid __builtin_cpu_supports for avx2 detection
diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
index 087930245f5..7a00acbed38 100644
--- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
+++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
@@ -1,4 +1,4 @@
-From 44f9c60f2ca4ce212c8cc3ba19e5adc357ebdad4 Mon Sep 17 00:00:00 2001
+From fd5571e22fd18b855199f23731f035927067a2a2 Mon Sep 17 00:00:00 2001
 From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
 Date: Wed, 10 Dec 2025 02:27:16 +0200
 Subject: [PATCH] freedreno: don't encode build path into binaries
diff --git a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
index 39ebd01e232..dc0957d8e2d 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
@@ -1,4 +1,4 @@
-From d0c3c71a0eebe72b822277e46ee2698bcc428d44 Mon Sep 17 00:00:00 2001
+From c1a89a08629f9e576e136dc044c0ed8a2b67d92f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 13 Jan 2020 15:23:47 -0800
 Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
diff --git a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
index 1cee7ad4e0e..36456cc3b15 100644
--- a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
+++ b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
@@ -1,4 +1,4 @@
-From 35ba9a2f6f5ffccca93aa430ef94cb174dd68ea5 Mon Sep 17 00:00:00 2001
+From f0c1b4e5480bb4118326a339a3a7084df1a6b0b7 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 14 Jun 2026 17:42:19 +0200
 Subject: [PATCH] src/intel/compiler/jay/jay_ir.h: do not used typed enum
diff --git a/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch b/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch
index a697b4c774f..aac42083c46 100644
--- a/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch
+++ b/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch
@@ -1,4 +1,4 @@
-From 80a8cc93b8a4dca53ed11f9fd9b8065a55845bc3 Mon Sep 17 00:00:00 2001
+From 56dbc838e42d920506f0f119a65a1faf0cf7b3cc Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 1 Jul 2026 22:48:15 +0200
 Subject: [PATCH] src/util/u_math.c: do not use arm fpu instructions if fpu is
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 9927d80b227..1154d511d97 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,8 +22,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch \
            "
 
-SRC_URI[sha256sum] = "eeb29ca7e56cfaa8e8a79538dcf834e3b18e501c31bef5145e959ea437cc4216"
-PV = "26.2.2"
+SRC_URI[sha256sum] = "1628058a8d2c0615975de5a15ab7bbb9638c50000b5bed9456ff423ea034a81f"
+PV = "26.2.3"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 

