Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DCD7C678D4
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 09:11:23 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.29153.1678093878036078289
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Mar 2023 01:11:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TSdgK+sT;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id u9so35594966edd.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 01:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678093876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sUU2xwzmO3okKQktwhDu1Rf36WaFK1Nbv+7OxHRUMgs=;
        b=TSdgK+sT6Tvz+MVTN2bbPkDaDoo/0zOOwlpHi1ZFfDepJLEdbxZW0wDrbSQ3aYBRRe
         zkQuM7YIM26eiuR8XSkQPM8VJ19kWax1HPgKF0uLFdORdETvhZbbkU9jcv8OrsgCIb/K
         1XJylZFm7aXN0gcU/acHtDx5AJejhYE3XpKi+SrQwckbTAFV3le98gr20Rpio4tti8wg
         UYSQYpjnqdtsI1cEoA7931fbm+7wscM6v3SuoApl9B3LBsz6MeUeWs38rdwLKfhwryBa
         q0wI3CyN6MngV6IzhYm6zVtaXs0FYshpPwSmiN31iiH2/Eae6dYNMFhB3200V07zhZXu
         hOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678093876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sUU2xwzmO3okKQktwhDu1Rf36WaFK1Nbv+7OxHRUMgs=;
        b=5wtIaS64tGgQnEWpNDa7HaUZP6ZP4tyFocBLoJvdUXlj0M1kwP6tFZOA1PsXqn6pJH
         zFzOKWbfNRDg7+Yqa7zVD4Gywjuc8US7l6xFy8+Ja/EuLASZchf2VZW0k+8T9ucDMPqh
         ftKzz5jTg0gOYHqkxR5esqVIKzfUlz4/8eoBOqDnU9MLvnJKl06evUps0Yw5L/baaem5
         73ZGkFnP+j7QBG04env3ljBD4BGZIUOJWCr4ckKFSqd4EB7gAt+Dk/QiHksfH4+WFNMV
         +fcN+gQP6ciHNQQcFhM1PfdmucnYqbSgwsXHJApQRtcerO9+N4KfvOpQbg1Q4XAp4GZQ
         SDQQ==
X-Gm-Message-State: AO0yUKW7ocGw7s38Zb9V/KaikgIZvBHVuqaVaitlcNY481cpXb+cipnb
	ycz0EfAC570bMFPDjiOoYYWuTESPKgL5ZA==
X-Google-Smtp-Source: AK7set+gAQJ2oJlqE+IGsg483i+FEk4WINZVTDVHKRzQiy2ueK4MoQLh/T9kfJySNxqlxQpmUTKQPA==
X-Received: by 2002:aa7:cd55:0:b0:4bd:11d3:e86f with SMTP id v21-20020aa7cd55000000b004bd11d3e86fmr9384957edw.6.1678093876174;
        Mon, 06 Mar 2023 01:11:16 -0800 (PST)
Received: from localhost.lan (BC244571.dsl.pool.telekom.hu. [188.36.69.113])
        by smtp.gmail.com with ESMTPSA id q2-20020a50cc82000000b004acbda55f6bsm4760953edi.27.2023.03.06.01.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 01:11:15 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Ross Burton <Ross.Burton@arm.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alex Kiernan <alex.kiernan@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v3 2/3] mesa: Rename PACKAGECONFIG "opencl" to "clover"
Date: Mon,  6 Mar 2023 10:11:07 +0100
Message-Id: <20230306091108.3347363-3-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306091108.3347363-1-zboszor@gmail.com>
References: <17474798FA156F5A.18951@lists.openembedded.org>
 <20230306091108.3347363-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 09:11:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178062

There is another OpenCL frontend called "rusticl" now.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index bbe8ca7875..ff352822a3 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -132,9 +132,9 @@ PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2
 # "egl" requires "opengl"
 PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
 
-# "opencl" requires libclc from meta-clang and spirv-tools from OE-Core
+# "clover" requires libclc from meta-clang and spirv-tools from OE-Core
 OPENCL_NATIVE = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', '-Dopencl-native=true', '', d)}"
-PACKAGECONFIG[opencl] = "-Dgallium-opencl=icd -Dopencl-spirv=true ${OPENCL_NATIVE},-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools"
+PACKAGECONFIG[clover] = "-Dgallium-opencl=icd -Dopencl-spirv=true ${OPENCL_NATIVE},-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools"
 
 PACKAGECONFIG[broadcom] = ""
 PACKAGECONFIG[etnaviv] = ""
@@ -213,7 +213,7 @@ DEV_PKG_DEPENDENCY = ""
 # development package of libgles3.
 RDEPENDS:libgles3-mesa-dev += "libgles2-mesa-dev"
 
-RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'libclc spirv-tools', '', d)}"
+RDEPENDS:libopencl-mesa += "${@bb.utils.contains('PACKAGECONFIG', 'clover', 'libclc spirv-tools', '', d)}"
 
 PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libosmesa libosmesa-dev \
@@ -259,7 +259,7 @@ python __anonymous() {
               ("gles", "libgles1", "libglesv1-cm1"),
               ("gles", "libgles2", "libglesv2-2"),
               ("gles", "libgles3",),
-              ("opencl", "libopencl",)):
+              ("clover", "libopencl",)):
         if not p[0] in pkgconfig:
             continue
         mlprefix = d.getVar("MLPREFIX")
-- 
2.39.2


