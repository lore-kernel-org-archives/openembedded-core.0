Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web09.25688.1622999136725869604
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 10:05:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sIt2j0/U;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id d5-20020a17090ab305b02901675357c371so10093558pjr.1
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Jun 2021 10:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kp8zxeVHXStT7J01AWTdhVqFZIdnXR//vP1wdXkNeek=;
        b=sIt2j0/UI6ycrrKDb5cAFdZKv7uhXE2sMRJCj7KjGJZIEQ5KMGYsdnjnkrorRkOik5
         ZUamnXL7ltLqtLl0Dcv34pyw46UXul7IdkZbxGyzZQPLW5Q1ffL0v7zf40ykLMbJ+zux
         QAO3S+FNPvqF9hQUZzi98IvgAzjN8C4jTeTun/OZio3ZS8XbaJlEk9ms05oo7wQAmA1o
         AFxudR7Jta08qk0e+i4/1yJ8P6Sg6gQexW9Rv7jW5yWn4olJ4mUgvzcxxVS5fvxWptDH
         C4PKE674k1zMPUaUbbs0RosZjkmq+tNze/zgAETLqJrGz7sq1/62EE5Ewjz2dVC6MxLj
         JGpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kp8zxeVHXStT7J01AWTdhVqFZIdnXR//vP1wdXkNeek=;
        b=tz+4Qv1c1je1jysUPIjkNcO2PHfkPwFV4lmosyRmu1S+ADK+KkR3L0eL4NHqwmHyKB
         V+JZJQK/dtMgllnPA9Xw+fp5efCVao6eGnSTyevn3MgjlA5s3/F3L7LUMNZIOuqFJIot
         Fgu0MTaRcpmwxrcUZCLZvS1PzqosV7VoBzNSawea9zuxIGRz7zqQh5wxaaxMj0MSwtAP
         U8rwm8A2+GtA7KszEmpcu39hjo3QQxILPe3H+4tClCxIrIkwEkrHULfvkVEBrv4gqHDf
         ygHjISJwlN31h2SzGOr8CWhTdUTvgrSN1jN/3Ylbz9NgQyjKKc2JRGYp9xLt8N13h++x
         qD2Q==
X-Gm-Message-State: AOAM533kdNdVvpROI1b7INp53jHFzR+T7F2Zqu5MxNuuj3H3xGYDjI0a
	WsLW04OgWtYt5YdmfRkggpLgbmuefQ2c/g==
X-Google-Smtp-Source: ABdhPJw+3e+sCKnSlrEMYSCj595NKJ9IH75qf7x0lArRUaD9Rcq8TrNHG6W2Fpng2fDX50VbiaiG1g==
X-Received: by 2002:a17:902:c404:b029:10e:21e8:759c with SMTP id k4-20020a170902c404b029010e21e8759cmr14301102plk.44.1622999135860;
        Sun, 06 Jun 2021 10:05:35 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id s24sm10179031pju.9.2021.06.06.10.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jun 2021 10:05:35 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
	Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH v2 1/2] recipes-bsp/u-boot: Allow deploying the u-boot DTB
Date: Sun,  6 Jun 2021 10:05:32 -0700
Message-Id: <20210606170533.2182435-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

Use ??= assignment for UBOOT_DTB_BINARY because it is set using ?= in
fitImage bbclass as well, using ?= will preempt that

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
v2: Fix test regression

 meta/classes/uboot-config.bbclass  | 4 ++++
 meta/recipes-bsp/u-boot/u-boot.inc | 7 ++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes/uboot-config.bbclass b/meta/classes/uboot-config.bbclass
index 3bba02828b..451db0c650 100644
--- a/meta/classes/uboot-config.bbclass
+++ b/meta/classes/uboot-config.bbclass
@@ -71,6 +71,10 @@ UBOOT_MKIMAGE_SIGN ?= "${UBOOT_MKIMAGE}"
 UBOOT_MKIMAGE_SIGN_ARGS ?= ""
 SPL_MKIMAGE_SIGN_ARGS ?= ""
 
+# Options to deploy the u-boot device tree
+UBOOT_DTB ?= ""
+UBOOT_DTB_BINARY ??= ""
+
 python () {
     ubootmachine = d.getVar("UBOOT_MACHINE")
     ubootconfigflags = d.getVarFlags('UBOOT_CONFIG')
diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index 5398c2e621..8ccc532f7e 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -5,7 +5,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS += "kern-tools-native"
 
-inherit uboot-config uboot-extlinux-config uboot-sign deploy cml1 python3native
+inherit uboot-config uboot-extlinux-config uboot-sign deploy cml1 python3native kernel-arch
 
 DEPENDS += "swig-native"
 
@@ -346,6 +346,11 @@ do_deploy () {
         ln -sf ${UBOOT_EXTLINUX_SYMLINK} ${DEPLOYDIR}/${UBOOT_EXTLINUX_CONF_NAME}-${MACHINE}
         ln -sf ${UBOOT_EXTLINUX_SYMLINK} ${DEPLOYDIR}/${UBOOT_EXTLINUX_CONF_NAME}
     fi
+
+    if [ -n "${UBOOT_DTB}" ]
+    then
+        install -m 644 ${B}/arch/${UBOOT_ARCH}/dts/${UBOOT_DTB_BINARY} ${DEPLOYDIR}/
+    fi
 }
 
 addtask deploy before do_build after do_compile
-- 
2.31.1

