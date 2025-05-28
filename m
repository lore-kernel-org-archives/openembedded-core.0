Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42957C3ABB2
	for <webhook@archiver.kernel.org>; Wed, 28 May 2025 19:42:01 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.4461.1748461314988313686
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 May 2025 12:41:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EEma/P3V;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-742af848148so63691b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 12:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748461314; x=1749066114; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vj3YdqA3V0H2u5sHK4JfW/8LERmY5bogs79HDb16tfg=;
        b=EEma/P3V4vOWb0huFTg+DxcqJ4okXnfj9sE1rbXt8TM6+caLsw2FOlFnvkfwoR6p3Q
         kXHnXmw5WOCkwmqslKD1JOKXJSMCQtPQJ2uV1++5BYDGLMvOG7ahuXOD5UbkXF2fZoUc
         oexEdo5zzG3m+02ssENfTMrO/WREuTmpj8pkz6ZmMZdnwD4Mk66kXfRPEXNJMNurmRnq
         ss6M4cZNzTjMvlrhH629LyX+EFIC2HlAGuMhgId+llGoLKs6X1oxKQ3iinll6fmkWVc/
         Km4fu7pFYN0Vw5nG0oiTF4EyQjjiHcsxyM22H/t8/HtW2FPoirnf3E2893i3dzeE7v7i
         YQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748461314; x=1749066114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vj3YdqA3V0H2u5sHK4JfW/8LERmY5bogs79HDb16tfg=;
        b=PO7RwUqw76DEomoJo6QQajtLfP8YBXRMiscWZDVxTi+sTR1Tt5mCMsBqtsLel1oWcT
         /1S8WUTr0l+2lYJpQy7SCb07OlFgRfQ5eEawBbI4hPK7r5kbs6WFNhUO37OlqO0hagzC
         GWPt6DElkOW3Dtb5UxM3OsKscj2G81GddB5w3x+XiETj5U1PKtHsoCoH0i4TqWXIv34q
         IKwS5d62l/gww0b3zV4hS3TAk5XDtLk4aTYpU1lvXNmK8oUds24MFK6TzPnG5PhXxUwn
         TpTVAsb7VFnrnehDI5cWuCnD5eg3lmveefnDS9dZAhYkBphiTJKwHxOQA6SRXG+9+ePm
         +vbg==
X-Gm-Message-State: AOJu0YyBjRGLgdgvRB6BaVHuO8/DpvtnS0N3PG3dtSxi3BPwxb1poUno
	A8+QtHF3sf+3m0E37q2yNRY7BoJ+gpOVZKphtK7c/XlsYZkUDolO6SohFOCbsBOj
X-Gm-Gg: ASbGncvX3+IdPrI0zYo/LSC9yJ731lojRFCSRDkyMjdOww5EQ8BsJRlnLKWju01O1LV
	cMKZLV4GrIwDVzbTCK3aS8IjxAWfgaT6NgfdHwtrjllTOICzcQc5wih18BKa8qc9r+HZgNwFtiy
	z+qFAwRBi6Cj+fsILIcXAldo1A9Ic7F91ycygR4acNVAOibq6h/CQvRAm6yiFNiIkWeIx1sQE+T
	bu/LZ/Rt573QX4jADQd7Kb11JDfei4xZN0XVyO3BkM99M5qBKD+M8xY6/Xwd96CJXF8PpfF+pmy
	p5HkoU4QtALd1g9S52DvmYKBmrJXfgUDU0MS+krxEkU=
X-Google-Smtp-Source: AGHT+IH+uh5vUzn9Fs6wupTqVRyujmy4FC+6jmfDgUST4MTL/mNhCsEeY4McGyxWly8oKzvXYiFNGA==
X-Received: by 2002:a05:6a00:3e13:b0:742:a77b:8c4 with SMTP id d2e1a72fcca58-745fde79251mr27439922b3a.3.1748461314010;
        Wed, 28 May 2025 12:41:54 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::deb9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-746e3409ebfsm1652487b3a.93.2025.05.28.12.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:41:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Trevor Woerner <twoerner@gmail.com>
Subject: [PATCH v2] mesa-gl: Remove osmesa dependency
Date: Wed, 28 May 2025 12:41:51 -0700
Message-ID: <20250528194151.3223809-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 May 2025 19:42:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217395

osmesa has been removed from recently upgrade mesa recipes
remove it from the fallback for non-x11 systems

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Trevor Woerner <twoerner@gmail.com>
---
v2: Remove obsoleted comment as well

 meta/recipes-graphics/mesa/mesa-gl.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-gl.bb b/meta/recipes-graphics/mesa/mesa-gl.bb
index ca160f1bfce..639a22bb531 100644
--- a/meta/recipes-graphics/mesa/mesa-gl.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl.bb
@@ -8,8 +8,5 @@ S = "${WORKDIR}/mesa-${PV}"
 
 TARGET_CFLAGS = "-I${STAGING_INCDIR}/drm"
 
-# At least one DRI rendering engine is required to build mesa.
-# When no X11 is available, use osmesa for the rendering engine.
-PACKAGECONFIG ??= "opengl gallium ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa', d)}"
-PACKAGECONFIG:class-target = "opengl gallium ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa', d)}"
-
+PACKAGECONFIG ??= "opengl gallium ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG:class-target = "opengl gallium ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"

