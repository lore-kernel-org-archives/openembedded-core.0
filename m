Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.1887.1600273072195164341
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2020 09:17:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=QmsiXEjh;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id t7so1866983pjd.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2020 09:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=SSbECz/C3dFoNf40pKXFZOwPzD6iBOnLu5jax+J9pD0=;
        b=QmsiXEjhBqAGtHAkjBMe7i/LM9BCcMxUWdDqjz4Tob2H65WCNnYMNAWQP6bDz74N3L
         xI3IBR5X1d+L4PoIQl62zC77yhaC219umMT3OtXMv8qQV95r21AAVOFoqlRxGMaCpzAd
         da1J5xtGelQdG5ZD1/V7bsAsPd0EvB0HbWceUg7FtYKpP3RORqEc5dhRaVyzb2D/QIzg
         pBun48aaJNjNGGQ80O0XmCE+ZkvXPEUcdBEfAvfgcX7INrYS4ekA8DXD9FjyrmaaYTlr
         2aaVk2hQ9FIR/T1mwH9KMlO4nWhebqf9MeRTJo53QZzwbTR4lkU6AtwyQeuruzRT0GEZ
         QCUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=SSbECz/C3dFoNf40pKXFZOwPzD6iBOnLu5jax+J9pD0=;
        b=HFF0z8gxeykHQQTO8A43WXf/5GZ5Av0EwVEIw5tV8I0e/cPW3nn4jr3oAJ2kM6HiMq
         6YvtPLN+ty3ewDyNJf6mCQhaJRlxbBbxKkf3+umAYC8bC+Ux4ve1nt22YlDLm4/Y3Lnn
         4Vcd8BUzXI2FMUr2n8O86P9lNTNSub6GHeTUamEoTWmWnOlcUJFjAxbCKkAq3azlCJXW
         nqjpppGOJV9+iZNu/k9lHphs+oXLcQN9zEbnfW1RIR5n3Phhm8qlzgY9NeYhhtrH4UuA
         580/QE7oPf3/veGyqpCHlNO78YRWfHWhLbZf+TZ0HuUDPUrxJXE5drNosFDTO1Hn88FG
         rumg==
X-Gm-Message-State: AOAM532BboZTyOHIE30zTcGwl4rmvLWhhr6XCqMZUKC/pFFs2MNdWxYJ
	XY7ze9I5EN0hLDbalJzw/9pQ2f+stG6n560meqw=
X-Google-Smtp-Source: ABdhPJziH9fjtH8cxZJdMpgO6PmKT44IDl74gMnRL1Z3Y+ol7vEl5uiYISLPxHeEPG48IiIJ7PSXOw==
X-Received: by 2002:a17:90a:c795:: with SMTP id gn21mr4312063pjb.27.1600273070891;
        Wed, 16 Sep 2020 09:17:50 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id j1sm15598630pgp.93.2020.09.16.09.17.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 09:17:50 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master][dunfell] xinput-calibrator: change SRC_URI to branch with libinput support
Date: Wed, 16 Sep 2020 06:17:31 -1000
Message-Id: <20200916161731.32701-1-steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Since "conf: Use xf86-input-libinput by default" [1] there are
reports [2] of xinput-calibrator failing because it expects
xf86-input-evdev and with the above patch xf86-input-libinput
takes precedence.

Fix this issue by using a branch of xinput calibrator which supports
xf86-input-libinput.

[1] https://git.openembedded.org/openembedded-core/commit/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc?id=2d005faff6341a81a2afae28860101ba9db51ae8
[2] https://www.yoctoproject.org/pipermail/yocto/2018-December/043487.html

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../xinput-calibrator/xinput-calibrator_git.bb                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index 4f831932e7..d2a16643fe 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -11,8 +11,8 @@ inherit autotools pkgconfig features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRCREV = "03dadf55109bd43d3380f040debe9f82f66f2f35"
-SRC_URI = "git://github.com/tias/xinput_calibrator.git \
+SRCREV = "18ec53f1cada39f905614ebfaffed5c7754ecf46"
+SRC_URI = "git://github.com/kreijack/xinput_calibrator.git;branch=libinput \
            file://30xinput_calibrate.sh \
            file://Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch \
            file://0001-calibrator.hh-Include-string-to-get-std-string.patch \
-- 
2.17.1

