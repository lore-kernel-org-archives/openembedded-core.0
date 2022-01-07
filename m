Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74700C433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 14:34:48 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.7089.1641566087072790979
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 06:34:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LBmj3LOz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id a5so7460883wrh.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 06:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yr1Bi8odp4iFmbIbmFFJPOgPnp140YMh0C9J+zPB5kk=;
        b=LBmj3LOzcvXBVpose3yRKX0YGprTHMsaD8eZ5AKL+pRJa3vMyucyXQr+FbmbMuxaxO
         JstTuCHZrYMNq+t6GzZu3+zYqSkyMKaU//NFvt+FfyVOVxkYW5hANaA9NhgS2y9yxSB6
         27KCNMQwCUH6MLsYYLIcCIj0r1fZVSJErsXvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yr1Bi8odp4iFmbIbmFFJPOgPnp140YMh0C9J+zPB5kk=;
        b=WufhJwXizH5HEwR1BMAXH+p4JrtUbx4YBgN2BMoqZoF/cr6l9lPDSmQmLVBt2QpecV
         IcGbPDnhC9VhQLXBzf3L9hKCaL+bgPZkiv0EDL8nwLNd9W4LpO8gc1MwrFuLeTI8zXkG
         Mxc29K8gN2/zZqonOXqUnZmLtmVKozwqroNqkRlOPNOV2tkMVg5rLOMuQsexzwi444Cw
         YKiYyKb+6kI1Zit7b644lsbhvPRXC7f5QVA1vfOEDTRNt6ke1RBkVjJRwOSuCZpdanqf
         VawOj+nj8Ct0JJe4uVd6Iwc0RAVZM77oUUS6i2qUI5nuadwQ/f4VMYIXABM2kqnXpgg6
         GhEg==
X-Gm-Message-State: AOAM531RvJca6wJpZrSLtehsFfSQky+tnq+FzqTw5fzpUJl1elaeEuii
	CloS/R/IXHRSE+KxZoJs7Mm4YkMhIMbdkw==
X-Google-Smtp-Source: 
 ABdhPJyF4mH+kRAPxXapPfPJmFD+1HkpthisGdkYG0APfGXJ3pXrYUgjBuFzLTtwIlNPV+D1wiPevQ==
X-Received: by 2002:adf:fc89:: with SMTP id g9mr3282152wrr.619.1641566085384;
        Fri, 07 Jan 2022 06:34:45 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:df67:6706:4d53:dd6b])
        by smtp.gmail.com with ESMTPSA id
 h20sm4732289wmq.38.2022.01.07.06.34.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 06:34:45 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libsdl2: Fix X11 configure options
Date: Fri,  7 Jan 2022 14:34:44 +0000
Message-Id: <20220107143444.1506525-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jan 2022 14:34:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160260

We're seeing various failures where the X11 headers are found on the native
system but not all libraries are present and hence autoconfiguration of the
X11 subcomponents fails.

We don't list any of these X11 subcomponents as a dependency so disable
them by default. Configuration and dependencies can be added if people need
them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
index 20e49428359..893386343a7 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
@@ -37,7 +37,16 @@ EXTRA_OECMAKE = "-DSDL_OSS=OFF -DSDL_ESD=OFF -DSDL_ARTS=OFF \
                  -DSDL_PTHREADS=ON \
                  -DSDL_RPATH=OFF \
                  -DSDL_SNDIO=OFF \
-                "
+                 -DSDL_X11_XVM=OFF \
+                 -DSDL_X11_XCURSOR=OFF \
+                 -DSDL_X11_XINERAMA=OFF \
+                 -DSDL_X11_XDBE=OFF \
+                 -DSDL_X11_XFIXES=OFF \
+                 -DSDL_X11_XINPUT=OFF \
+                 -DSDL_X11_XRANDR=OFF \
+                 -DSDL_X11_XSCRNSAVER=OFF \
+                 -DSDL_X11_XSHAPE=OFF \
+"
 
 # opengl packageconfig factored out to make it easy for distros
 # and BSP layers to pick either (desktop) opengl, gles2, or no GL
-- 
2.32.0


