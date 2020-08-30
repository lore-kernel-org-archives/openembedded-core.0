Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web10.37080.1598811521086600655
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2020 11:18:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=DuTNUa1r;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.68, mailfrom: steve@sakoman.com)
Received: by mail-io1-f68.google.com with SMTP id d18so3785203iop.13
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2020 11:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Vew4BEiobkw9Ct9FoEPC7Vz06VPhg6Axtu1Akzwd404=;
        b=DuTNUa1rNOvNpCFYGpM37wkmKDiVx3tepkdvjPPbq92lAGxnESoqhHky0XzrQnYV3x
         BfYFw3AMYChEZkSLKSJkzv/MAAeTZj1RKPPPabX68+PPjPiGJYXjDkQ3kMG0HEwTXXAz
         d7Ha0akQ4lPlqnKD/xCgOcciky3DCsc/YJGr9MliE5FtgNphupo8TkxQKyqKc3s033Ba
         dXMxUmX1XmpLPuhV/rvIuW6BGMotSoOrjM4kyW1CizAnhUM/TxvOInmq3IOYp7+zKBWL
         sW/hCyKLhUWp3YBLArylzwy1ibcAXXi4Qwer4HqBpb+t1okO/vNUgVraJmXp+VR/RI3B
         5cnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Vew4BEiobkw9Ct9FoEPC7Vz06VPhg6Axtu1Akzwd404=;
        b=qNXFC6KKB0W06W6JFGAZuH9QEfP2kyKDm9aeuCFR+4G+IN79mF6Vrwmz9b8o97Ws+h
         QNBHYNjN2VWHcl3XAUajPOVoVMee8ICx7Vjy+9CBuTJ/Y5V2KEzD+X4y8dk0qMnVicTs
         lYFEzTGw5agGPWFxGArxg9sDtl00IkwS+45j8oUbY9SL8+Vtax6jEl+qLTmYsd1z2aUY
         0xyrfBNW3OuJJsNXbSSSmBCHF/ZKzlatiOnJ4YAe0tkHXqlg3AWoP3YZ901EJmXiy0+E
         7dv10FDVtaPTL9cOJdvPWNI1ud1s7V3256HyiccZ8jSti7M1vUvuws/+0uOKJF0Mpa+E
         qN0Q==
X-Gm-Message-State: AOAM533ZEPnKEEjTs7W8eaZQUGJVeydzeKXV6c7IfH+GowbbcsHacgcs
	qns2yzyTeVx1oHFrpcM1qWN048QdQ0J+DbpAcMo=
X-Google-Smtp-Source: ABdhPJwOmn8kwxeK2kywo2DV7P4daQZpJHSYHO1E0tjpwbYm0U/i81YsEzrKhVzNyDgPGasKZSqECA==
X-Received: by 2002:a02:730b:: with SMTP id y11mr9166004jab.126.1598811520051;
        Sun, 30 Aug 2020 11:18:40 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id j62sm2884768iof.53.2020.08.30.11.18.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 11:18:39 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/25] bluez5: fix builds that require ell support
Date: Sun, 30 Aug 2020 08:16:08 -1000
Message-Id: <a521ec99313872f200ad4a6bc97e2e8f030a1091.1598810890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1598810890.git.steve@sakoman.com>
References: <cover.1598810890.git.steve@sakoman.com>

From: "Peter A. Bigot" <pab@pabigot.com>

Shortly after the recipe was updated to add ell as a mesh dependency
the way ell was integrated into bluez5 was changed.  BlueZ requires
ell only for mesh and for btpclient (external test programs).  It will
be ignored unless either mesh or btpclient are selected.

ell can be supplied externally, or it can be copied into the bluez
build directory from an existing sibling source directory.  Since
bitbake builds do not provide a sibling source directory tell bluez to
look for it as an external library in the conditions where it's
required.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f22b4eba98b3707d7f6daa4277414cecb3e5ee6b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 150d909d73..f34ba0dce5 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -42,8 +42,8 @@ PACKAGECONFIG[sixaxis] = "--enable-sixaxis,--disable-sixaxis"
 PACKAGECONFIG[tools] = "--enable-tools,--disable-tools"
 PACKAGECONFIG[threads] = "--enable-threads,--disable-threads"
 PACKAGECONFIG[deprecated] = "--enable-deprecated,--disable-deprecated"
-PACKAGECONFIG[mesh] = "--enable-mesh,--disable-mesh, json-c ell"
-PACKAGECONFIG[btpclient] = "--enable-btpclient,--disable-btpclient, ell"
+PACKAGECONFIG[mesh] = "--enable-mesh --enable-external-ell,--disable-mesh, json-c ell"
+PACKAGECONFIG[btpclient] = "--enable-btpclient --enable-external-ell,--disable-btpclient, ell"
 PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
-- 
2.17.1

