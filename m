Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0908BC6FA8E
	for <webhook@archiver.kernel.org>; Sun, 26 Feb 2023 05:08:33 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.60748.1677388109746945942
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Feb 2023 21:08:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qPNiK2Vy;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id ec43so13039481edb.8
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Feb 2023 21:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCAWX/3B/8NSjUR8wfmFB9vywFzRSxQriHb7PXYxd1c=;
        b=qPNiK2Vy6GUMNy27z8mpoY3jPxmuJCBnh6ngWs9ZfOu7WfAtUqPZx0ryduyg18fkkL
         wnL06nJ7Mefzl00iLX6mKvxyQKWxwVEMpp9KCFWJVi1MMytL9TGXUi8BfCva7fBsYCA8
         tzvmVREUthnX6VjLXBRrFY4cG/repMJv14/bNisvcz9j+qoQjsf8Y+pjq13hjV2QGphI
         mFYG+m7qp2guZLhwKTOxRpPmV6eTDz2aIIJwWY3fMUW4glC3sJlXsK+tTK2RwBF1H4Jw
         cO8zfQoxpgdDCFpOCQHWAFjKQYRmURb7MHLQCnx7H9Weq8c3grZbzq9ohdRftwIzUNcx
         ikmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RCAWX/3B/8NSjUR8wfmFB9vywFzRSxQriHb7PXYxd1c=;
        b=AzsV3mkXbxfwC4aXI8ydO+uhCJLlkQT2D/Ru7ZgaQ6iqf8J0NcOglVtfixoo+rKeMW
         Eu/yOgcq31fHt6n0tbN9vejy0czszBHeE2oT3CVCLUZpxGTPxmRhe7F3wcEhdqOtAbOJ
         RzOnsY8AQqYjME2excBn+a9rgEnTT0+1F0v0nKSqCFSx1w4g67Mc+IckObzstm9hSRL9
         dxVPIRqquqh+6rpKwlZ4zxzr5UzOiHZeUoouaUmNJ/XdnGkkcvPfnhk1QoNWYbORT0mI
         yIW0Zr4xX7Cz+s/i0VjCTWMIAqDd0b5Gj5agAEW7DPcErrKeR2WE71s6g+KrYygdql8U
         NxOA==
X-Gm-Message-State: AO0yUKUBz++ww+HTKruMy6sxddZT5588MAG3LRct1aOiIBDYmkjX7oo+
	yag8O491V6ooTr4GiRaiB7Z2CD3o4WTM6giF
X-Google-Smtp-Source: AK7set9dI6Sq8wCfEq1I113Iz1B7X8T1PlVt/Gs8Z4CnEXEsFO3aboexLwM4adlrFesKxhaGvtYB4Q==
X-Received: by 2002:a17:906:8056:b0:872:27cb:9436 with SMTP id x22-20020a170906805600b0087227cb9436mr26094922ejw.43.1677388107787;
        Sat, 25 Feb 2023 21:08:27 -0800 (PST)
Received: from localhost.localdomain (BC24436C.dsl.pool.telekom.hu. [188.36.67.108])
        by smtp.gmail.com with ESMTPSA id b27-20020a50ccdb000000b004aef48a8af7sm1546262edj.50.2023.02.25.21.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Feb 2023 21:08:27 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Ross Burton <Ross.Burton@arm.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alex Kiernan <alex.kiernan@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2 2/3] mesa: Rename PACKAGECONFIG "opencl" to "clover"
Date: Sun, 26 Feb 2023 06:08:13 +0100
Message-Id: <20230226050814.929055-3-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230226050814.929055-1-zboszor@gmail.com>
References: <20230224093850.3393567-1-zboszor@gmail.com>
 <20230226050814.929055-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Feb 2023 05:08:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177727

There is another OpenCL frontend called "rusticl" now.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 70f9b6fc17..89e2dc6e90 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -115,9 +115,9 @@ PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2
 # "egl" requires "opengl"
 PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
 
-# "opencl" requires libclc from meta-clang and spirv-tools from OE-Core
+# "clover" requires libclc from meta-clang and spirv-tools from OE-Core
 OPENCL_NATIVE = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', '-Dopencl-native=true', '', d)}"
-PACKAGECONFIG[opencl] = "-Dgallium-opencl=icd -Dopencl-spirv=true ${OPENCL_NATIVE},-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools"
+PACKAGECONFIG[clover] = "-Dgallium-opencl=icd -Dopencl-spirv=true ${OPENCL_NATIVE},-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools"
 
 PACKAGECONFIG[broadcom] = ""
 PACKAGECONFIG[etnaviv] = ""
@@ -196,7 +196,7 @@ DEV_PKG_DEPENDENCY = ""
 # development package of libgles3.
 RDEPENDS:libgles3-mesa-dev += "libgles2-mesa-dev"
 
-RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'libclc spirv-tools', '', d)}"
+RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'clover', 'libclc spirv-tools', '', d)}"
 
 PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libosmesa libosmesa-dev \
@@ -233,6 +233,8 @@ do_install:append () {
 # RPROVIDEs/RCONFLICTs on the generic libgl name.
 python __anonymous() {
     pkgconfig = (d.getVar('PACKAGECONFIG') or "").split()
+    if "clover" in pkgconfig:
+        pkgconfig.append("opencl")
     suffix = ""
     if "-native" in d.getVar("PN"):
         suffix = "-native"
-- 
2.39.2


