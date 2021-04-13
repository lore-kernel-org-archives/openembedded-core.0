Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web12.5461.1618296526155066450
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Apr 2021 23:48:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Uji2626Y;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id h20so7685533plr.4
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Apr 2021 23:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=btHOsc92ferXcPyc/B6v6QcRzrYW//fKFdlXSkN1i4I=;
        b=Uji2626YUJqw+H35Mb0/A+xb8bEXCwVRMi/JbSIkLAsVy/5gKviBe4f3ViuYC6rzyi
         2gzaujDQNZAeK1389MXoZRs5gTS5RdbLCn4AcxAYVcc+T36G7zzS1L9ScjJL7gGvxY2/
         HpiwodYF7O95AavFJGoGTv8inhCRkBlLMQoxX8tvsVZWt/KpjqmOEzLig6wFxDpHoIpq
         d0ooZ0weuQn7GE/SVvQLLDHZoCnU0suyJsIWpdLqlHdYOYNJKa02FLbG0zz6+wVgYX3O
         P55uiwl48QK3NCiCnlGgg9ffYPALWFnn28sPwVLUcdEXMJ8KjqWhYEwuajw+9xPlSlvB
         +UiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=btHOsc92ferXcPyc/B6v6QcRzrYW//fKFdlXSkN1i4I=;
        b=QAk8CCEcl/tt1/PV2vHAlDPBEshiUH0PNa3u7u/mAOEVJDJ/ve380x1/Fcx4vKpN6N
         fOePzcOp0oxngiUqUxfnoEh6co13VMhXhZFJcoiJHcmQF8ngZSNv2fBFUyNjitflbPrz
         nDTdZ+2sBL1odjwVYZTT6T2lTBsO5w/JgFMXnFjQ3T1aNIntwiai3Mwiz/hFe3CM0kjp
         WaRG3ehf2XxvrnS1WGDVPk9IGEyrTwA974Kzq7SbQU831aO2mmkObW1oa+zEIEgzbWbj
         8KVDwHFaXiKw047UvVglj0vwawuuF+f1SEyHp7i3WqquNosR0TfUajJG7b8KQyAOg4y5
         +90g==
X-Gm-Message-State: AOAM532rcQpnZ9QFhA9tpc57KO3nbKaAlSUG4BKx6ezB/ihZ0HqyvKCC
	k5I6Fnptslu3xuOdhh//Zzt8GGXOj5rhPg==
X-Google-Smtp-Source: ABdhPJycAXvxCB6AbGgTjBjmcR6+x2n90EzIXcHiHzUpgsgNiqvyRx9joyCZsco+USHeC+mKFCfVVQ==
X-Received: by 2002:a17:902:b60d:b029:e6:7a9:7f4 with SMTP id b13-20020a170902b60db02900e607a907f4mr30489116pls.3.1618296525422;
        Mon, 12 Apr 2021 23:48:45 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::630])
        by smtp.gmail.com with ESMTPSA id i18sm3109827pfq.168.2021.04.12.23.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 23:48:45 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] systemd: Fix build on mips/musl
Date: Mon, 12 Apr 2021 23:48:41 -0700
Message-Id: <20210413064841.2003099-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...l.h-Define-MIPS-ABI-defines-for-musl.patch | 36 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_247.4.bb    |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch

diff --git a/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch b/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
new file mode 100644
index 0000000000..bbee6e6b28
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch
@@ -0,0 +1,36 @@
+From 7b32582c066549fea0f7180a6c575e7fa37a867f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 12 Apr 2021 23:44:53 -0700
+Subject: [PATCH] missing_syscall.h: Define MIPS ABI defines for musl
+
+musl does not define _MIPS_SIM_ABI32, _MIPS_SIM_NABI32, _MIPS_SIM_ABI64
+unlike glibc where these are provided by libc headers, therefore define
+them here in case they are undefined
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/basic/missing_syscall.h | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/basic/missing_syscall.h b/src/basic/missing_syscall.h
+index 0594a1b930..495d161334 100644
+--- a/src/basic/missing_syscall.h
++++ b/src/basic/missing_syscall.h
+@@ -15,6 +15,12 @@
+ #include <asm/sgidefs.h>
+ #endif
+ 
++#ifndef _MIPS_SIM_ABI32
++#define _MIPS_SIM_ABI32		1
++#define _MIPS_SIM_NABI32	2
++#define _MIPS_SIM_ABI64		3
++#endif
++
+ #if defined(__x86_64__) && defined(__ILP32__)
+ #  define systemd_SC_arch_bias(x) ((x) | /* __X32_SYSCALL_BIT */ 0x40000000)
+ #elif defined(__ia64__)
+-- 
+2.31.1
+
diff --git a/meta/recipes-core/systemd/systemd_247.4.bb b/meta/recipes-core/systemd/systemd_247.4.bb
index cd67e65abe..32afa159ec 100644
--- a/meta/recipes-core/systemd/systemd_247.4.bb
+++ b/meta/recipes-core/systemd/systemd_247.4.bb
@@ -55,6 +55,7 @@ SRC_URI_MUSL = "\
                file://0022-do-not-disable-buffer-in-writing-files.patch \
                file://0025-Handle-__cpu_mask-usage.patch \
                file://0026-Handle-missing-gshadow.patch \
+               file://0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch \
                "
 
 PAM_PLUGINS = " \
-- 
2.31.1

