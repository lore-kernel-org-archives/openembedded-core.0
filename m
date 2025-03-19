Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E8D8C35FFB
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 12:42:01 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.6846.1742388118136887329
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 05:41:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dpAaStzo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-391342fc0b5so5580092f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 05:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742388116; x=1742992916; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wb6FtLyYrj0nIyC/rsxLt1WlaLx7ukxdSm5Dh9y9Yjg=;
        b=dpAaStzowJzpnOxHJhhBEcNlfAXSZyENfxTcW1/NS5ymXWzJF54FpV6z9iEspjvRrU
         +BtFL3Cj1h+fuKFxCuaIzflJBB/0/752Kr9fj2zBVHjft1ZDAwDzG0LUvAn6EbzOi6mb
         7TviyVv8XOD8sJYumhh2fZQ/12M8b27PnizNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742388116; x=1742992916;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wb6FtLyYrj0nIyC/rsxLt1WlaLx7ukxdSm5Dh9y9Yjg=;
        b=vhFFw8kk+Fa6/5r6jAr7EmpaknW2GinnujRnpdLXcnryIV2YWZQ36VKfUCrSZuiSW1
         u7Vnke1W037kqezuOciHaUSy+7gyjnAZWl8gFMlrtaYsD2GBZVfcznbkXM2SrqL1WoTn
         /q2UASuxplYR6yP8HEbX+N/Luy4v8rOWqjP5cWFZE22BXldErP7N75kMYLDLbR3089zx
         mFSKGvTn5BJEJP0y4C/Jk/zZtTSR6TDuyd1tqqXb0eRc0dzc3pJWB1Lz/a0N07Iy9TRt
         a3zlwtlm72D89zKhzUEMHMkLQNGlYyTMpr4dPYNzndvXOJ/hPlQOwnGyjeCh+B3sYgAa
         /Clg==
X-Gm-Message-State: AOJu0Yw2amk1sWCsr81wYi2VH2JgrU05chjvOnCxVdSUaIUqxv77CFha
	GDOwFHdf5hYF/UCrUGaP2lNwdtJbZw8div2qw1q3cL+dQdbVR3nscasu01c+ynG0E4aQwNISpzs
	i
X-Gm-Gg: ASbGncuvXQiJX6eOeOQv4uIJkuj0D9/mgfExM7Cyn6cRcogB0p1u+p0szUvywmLOm7F
	SPAvbkK60cJmn294vxncoWLfZPegrxRVh9c+k+81Y+1iRcVIuKKFZ/v9gX4o8FWTlM4anGGLddQ
	eu8HkSrJ+U3oDuq5ubxdW2Sann6hlvUfngooMJjapfaF9gDnL0M7+s97HlxXgP/enJhdRNbTA/y
	LZOFolOV30Dh1zNGvlpLstN5PEbmxCRZ0D3TO53cVt7z2r3AZag8G/KojIcyihjsJQ86HF4/YkQ
	SDJkCY0dKfCuXSzCY/Ew/Ay7SQMf8s8pUtzZkIQYxRrrEyotxsTYLscA2jusGfI/Ms7QkBsR
X-Google-Smtp-Source: AGHT+IH0hObpNRY7xqYAs228+ulo4R6qOQEyJ4M9/JUCrR/HAfWyHK4UxBuix0tmewXoQ2FZLjrtwA==
X-Received: by 2002:a5d:64a7:0:b0:392:bf8:fc96 with SMTP id ffacd0b85a97d-399739b885dmr2193244f8f.4.1742388115729;
        Wed, 19 Mar 2025 05:41:55 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:dad:b471:9c34:4577])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c82c258bsm20455070f8f.24.2025.03.19.05.41.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 05:41:55 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libmatchbox: Upgrade 1.12 -> 1.13
Date: Wed, 19 Mar 2025 12:41:54 +0000
Message-ID: <20250319124154.642912-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 12:42:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213327

This includes fixes for gcc 15.

License fixes were also made in the repository. The license being referred to
as MIT was in fact HPND. The code is also LGPL-2.0 only, not or later. Fix
the LICENSE on the recipe accordingly.

Use the new bitbake tag functionality to verify the commit matches the tagged
version.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{libmatchbox_1.12.bb => libmatchbox_1.13.bb}           | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/libmatchbox/{libmatchbox_1.12.bb => libmatchbox_1.13.bb} (91%)

diff --git a/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb b/meta/recipes-graphics/libmatchbox/libmatchbox_1.13.bb
similarity index 91%
rename from meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
rename to meta/recipes-graphics/libmatchbox/libmatchbox_1.13.bb
index bf3f5c005d9..990e50d8455 100644
--- a/meta/recipes-graphics/libmatchbox/libmatchbox_1.12.bb
+++ b/meta/recipes-graphics/libmatchbox/libmatchbox_1.13.bb
@@ -7,7 +7,7 @@ SECTION = "x11/libs"
 HOMEPAGE = "http://matchbox-project.org/"
 BUGTRACKER = "http://bugzilla.yoctoproject.com/"
 
-LICENSE = "LGPL-2.0-or-later & MIT"
+LICENSE = "LGPL-2.0-only & HPND"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
                     file://COPYING.MIT;md5=f45ed9332b4f50a35adf2065adde4ca7 \
                     file://libmb/mbexp.c;endline=20;md5=28c0aef3b23e308464f5dae6a11b0d2f \
@@ -15,9 +15,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
 
 DEPENDS = "virtual/libx11 libxext"
 
-#SRCREV for 1.12
-SRCREV = "e846ee434f8e23d9db38af13c523f791495e0e87"
-SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https"
+SRCREV = "85420fd2d9e26291f6e87e0c406fe8cc55474527"
+SRC_URI = "git://git.yoctoproject.org/${BPN};branch=master;protocol=https;tag=${PV}"
 
 S = "${WORKDIR}/git"
 

