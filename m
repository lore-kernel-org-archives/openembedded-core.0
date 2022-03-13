Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1788C433EF
	for <webhook@archiver.kernel.org>; Sun, 13 Mar 2022 07:59:35 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web12.13258.1647158375291988131
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 23:59:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hkmRQ56v;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id
 15-20020a17090a098f00b001bef0376d5cso11768687pjo.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 23:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FDkXbBCXX0fXW4qA39yB0TTO6PZzLQHVGiFW5m4J75o=;
        b=hkmRQ56vxacxNO19FWmWwdmbd9v4CJpuBfj1tuoeTYXIaJe34z69xqd/Qq9PFo1UE6
         a5J1lmSfpOaZwE5mOhuLmj87B6hocoJjTyMNG1y5z2+7tROHAShrNEyBMzNL4M6Q5XBy
         HJO6p4NPFsEXSHN4KPFc7xO/Zz8mJcAwqXWMIscTgX8FXy2b8UuGns5jUNsQkD7SN1wL
         0aJaUbmedyBd812R+hExOhPowhvKvRVTMDUcvBWM4jjNl4/rRnfa4lkotnRX5l7J5iQs
         tfUTM7c0zgBKbcmnriublUbUxUmrES4ibLF3/FnbliHKy1jlObd7tWqXE4ec/0BpOfaJ
         xm+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FDkXbBCXX0fXW4qA39yB0TTO6PZzLQHVGiFW5m4J75o=;
        b=LdVrzOEs42GjlVmzxNy9HJOjcM2/lNJjv7RKCn8o3XYoRh3DucaxetDfEYGTv8gl/v
         bKczydylH5ttYWZbdzrf40WxzsCiWSbcAv4jjbRM6AZeZz1jcbRo4IpFhgSUwk25kBfz
         hDVsnvT9DgN0jICEpPAwVk8ETVKI/E5cbRUCpkUpwfwPSxzh5MUa/UE7nPTwryhrtm/V
         7QK0goXt6mZkV0Cpop5XKE0Kh+xxTc78XeAK3vAF7L0DfOKE5R6lzd5M4WOTI7b74sSP
         C9+ZAmuBkI/UmyEE61ylALy2+b0avgaLz2KF4Y+RxT7PynT4nYsxPD+9g4wOO6Ou+1LU
         msAA==
X-Gm-Message-State: AOAM5308iNNjISFD7lwGc2amPwP9rSoRxWEYj51F7/fpsCtX4dLtIgTd
	jNdcJ6Irkj4KELyPcaGwmrHlguH3ublUXw==
X-Google-Smtp-Source: 
 ABdhPJwH36/rsVA6EIiwgZQwqLNwTQYayP3kveNj34wxVlbOF7Sja2SKm6lr8HAwQj3Y+VFMxSicRg==
X-Received: by 2002:a17:902:e943:b0:14f:4a2b:203 with SMTP id
 b3-20020a170902e94300b0014f4a2b0203mr18572819pll.113.1647158374457;
        Sat, 12 Mar 2022 23:59:34 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 g28-20020a63111c000000b00374646abc42sm12958928pgl.36.2022.03.12.23.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 23:59:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] gcompat: Do not use static-pie on ppc
Date: Sat, 12 Mar 2022 23:59:30 -0800
Message-Id: <20220313075932.3031649-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Mar 2022 07:59:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163102

It fails currently with binutils 2.38
powerpc-yoe-linux-musl-ld: read-only segment has dynamic relocations

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Static-PIE-does-not-work-on-musl-ppc.patch | 30 +++++++++++++++++++
 meta/recipes-core/musl/gcompat_git.bb         |  7 +++--
 2 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/musl/gcompat/0001-make-Static-PIE-does-not-work-on-musl-ppc.patch

diff --git a/meta/recipes-core/musl/gcompat/0001-make-Static-PIE-does-not-work-on-musl-ppc.patch b/meta/recipes-core/musl/gcompat/0001-make-Static-PIE-does-not-work-on-musl-ppc.patch
new file mode 100644
index 00000000000..1d731163d07
--- /dev/null
+++ b/meta/recipes-core/musl/gcompat/0001-make-Static-PIE-does-not-work-on-musl-ppc.patch
@@ -0,0 +1,30 @@
+From 01180e78fe9568e7fb2673ba61801c42f0f70115 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 11 Mar 2022 10:37:51 -0800
+Subject: [PATCH] make: Static PIE does not work on musl/ppc
+
+Fixes linker error e.g.
+"read-only segment has dynamic relocations"
+
+Upstream-Status: Inappropriate [OE specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index cbb7634..69ee228 100644
+--- a/Makefile
++++ b/Makefile
+@@ -76,7 +76,7 @@ ${LIBGCOMPAT_NAME}: ${LIBGCOMPAT_OBJ}
+ ${LIBGCOMPAT_OBJ}: ${LIBGCOMPAT_INCLUDE}
+ 
+ ${LOADER_NAME}: ${LOADER_OBJ}
+-	${CC} ${CFLAGS} ${LDFLAGS} -static-pie -o ${LOADER_NAME} ${LOADER_OBJ}
++	${CC} ${CFLAGS} ${LDFLAGS} -static -o ${LOADER_NAME} ${LOADER_OBJ}
+ 
+ .c.o:
+ 	${CC} ${CPPFLAGS} ${CFLAGS} -c -D_BSD_SOURCE \
+-- 
+2.35.1
+
diff --git a/meta/recipes-core/musl/gcompat_git.bb b/meta/recipes-core/musl/gcompat_git.bb
index cab1a97a84d..962bcd8c75f 100644
--- a/meta/recipes-core/musl/gcompat_git.bb
+++ b/meta/recipes-core/musl/gcompat_git.bb
@@ -7,8 +7,11 @@ HOMEPAGE = "https://git.adelielinux.org/adelie/gcompat"
 LICENSE = "NCSA"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eb33ef4af05a9c7602843afb7adfe792"
 
-SRC_URI = "git://git.adelielinux.org/adelie/gcompat.git;protocol=https;branch=current"
-
+SRC_URI = "git://git.adelielinux.org/adelie/gcompat.git;protocol=https;branch=current \
+          "
+SRC_URI:append:powerpc = "\
+           file://0001-make-Static-PIE-does-not-work-on-musl-ppc.patch \
+           "
 PV = "1.0.0+1.1+git${SRCPV}"
 SRCREV = "4d6a5156a6eb7f56b30d93853a872e36dadde81b"
 
-- 
2.35.1


