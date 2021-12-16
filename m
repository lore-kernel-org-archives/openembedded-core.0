Return-Path: <matt@madison.systems>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD36C433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 11:49:15 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web08.9594.1639655347214147326
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 03:49:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison.systems header.s=google header.b=X49lHR/m;
 spf=pass (domain: madison.systems, ip: 209.85.216.51,
 mailfrom: matt@madison.systems)
Received: by mail-pj1-f51.google.com with SMTP id
 j6-20020a17090a588600b001a78a5ce46aso2379978pji.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 03:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison.systems; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PORPG9pxxMHJx0KORy3zJtkFFs53Y3bFfmRYFis5Bz4=;
        b=X49lHR/mcX44/oTMNgfSe3ADejijz4uxSodZ16STWEnDF3QSnCLdZm8ElzJ1c6Ueer
         YhO5vPTrwcEtw4/aQcTUOsT+2dh6WIvHtT4ugwphIcG4WhL55f+e/XBnw5gP5KJHl7J2
         E1GPEpvr2mtEC71GyDzcdFItBm+k5TOIppZp17PLbr5ZDnH1TTxK/fnyFcFxvi3zhNpC
         ypi41uXhD9DOQyPFx23o4u0XF0OfSK21MmglSXMPHJSwMZHIZX96/Rt7jdyoRuHVwswj
         7uv+biL7mklDo26Zt2PBi8DqFBKy/yv9OPoujTSTJ9BUxg6+sHJ3jQzkXRSUYtzw5Q3F
         SClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PORPG9pxxMHJx0KORy3zJtkFFs53Y3bFfmRYFis5Bz4=;
        b=I9jMX3VjI7Fqrp5zSYKp9iYgh4zN07p/po6rl4jyxaR0B3ZoHvRq3KJSU2tt06lOoM
         O/Fcv+BB8Pia6+8Ezjc6690F7wrkK8xtKKvFniy3AierSJ7wxsp0kry/yZSuXBh+UGPn
         Vp4TdWcrTEtsIzwJ966Qweu4qn1Bokm02qqgHVIfqinuacmxDXJfdUmCFFV7pmRdd1j2
         lEZ88upRB8h658voBuiI1cqsIZXurmOifYR4wLqIfWf3CLdL534KX0o7z05l6FmZ/3qh
         VSmHAd4CNLAeLNtSjaDoKdskY42FItiPdCqy31xgty+Spr6RmR9AWEV4ooibT3I3GvgJ
         wdkQ==
X-Gm-Message-State: AOAM533XUCqKs8e3AYJ7OWr0hax2e9ymE+HruJE3kcx9jjDyEK7ge4LT
	+LRjV72Bi/KKW6wDCp17kalHyZhT6XeixA==
X-Google-Smtp-Source: 
 ABdhPJyuG/HIeSiNSDpZlusdTjNhSn29I4XscnaH1vElWdojsEIiq0yGID0RgDukhlQY5dWDAMYrHQ==
X-Received: by 2002:a17:90b:1d04:: with SMTP id
 on4mr5674630pjb.86.1639655346260;
        Thu, 16 Dec 2021 03:49:06 -0800 (PST)
Received: from visar.local (76-209-242-28.lightspeed.mtryca.sbcglobal.net.
 [76.209.242.28])
        by smtp.gmail.com with ESMTPSA id
 q19sm5103175pgb.77.2021.12.16.03.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 03:49:05 -0800 (PST)
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Matt Madison <matt@madison.systems>
Subject: [OE-core][PATCH v2 2/2] qemu: add patch to set minimum kernel version
 for riscv32
Date: Thu, 16 Dec 2021 03:48:36 -0800
Message-Id: <20211216114836.964835-3-matt@madison.systems>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211216114836.964835-1-matt@madison.systems>
References: <20211216114836.964835-1-matt@madison.systems>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Dec 2021 11:49:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159783

which enables us to drop the -r option on qemu-static-riscv32
invocations.

Signed-off-by: Matt Madison <matt@madison.systems>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...s-minimum-kernel-version-for-riscv32.patch | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-riscv-Set-5.4-as-minimum-kernel-version-for-riscv32.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index fe35f94acf..584c9482e9 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -27,6 +27,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://determinism.patch \
            file://0001-tests-meson.build-use-relative-path-to-refer-to-file.patch \
            file://0001-linux-user-Replace-__u64-with-uint64_t.patch \
+           file://0001-riscv-Set-5.4-as-minimum-kernel-version-for-riscv32.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-riscv-Set-5.4-as-minimum-kernel-version-for-riscv32.patch b/meta/recipes-devtools/qemu/qemu/0001-riscv-Set-5.4-as-minimum-kernel-version-for-riscv32.patch
new file mode 100644
index 0000000000..ac4b6dcc44
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-riscv-Set-5.4-as-minimum-kernel-version-for-riscv32.patch
@@ -0,0 +1,40 @@
+From 359dc12eb32b2395cf10796157002024e6a58054 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 15 Dec 2021 23:31:11 -0800
+Subject: [PATCH] riscv: Set 5.4 as minimum kernel version for riscv32
+
+5.4 is first stable API as far as rv32 is concerned see [1]
+
+[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=7a55dd3fb6d2c307a002a16776be84310b9c8989
+
+Upstream-Status: Submitted [https://lists.nongnu.org/archive/html/qemu-devel/2021-12/msg02495.html]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Cc: Palmer Dabbelt <palmer@dabbelt.com>
+Cc: Alistair Francis <alistair.francis@wdc.com>
+Cc: Bin Meng <bin.meng@windriver.com>
+Signed-off-by: Matt Madison <matt@madison.systems>
+---
+ linux-user/riscv/target_syscall.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/linux-user/riscv/target_syscall.h b/linux-user/riscv/target_syscall.h
+index dc597c897..9b1316132 100644
+--- a/linux-user/riscv/target_syscall.h
++++ b/linux-user/riscv/target_syscall.h
+@@ -45,10 +45,11 @@ struct target_pt_regs {
+ 
+ #ifdef TARGET_RISCV32
+ #define UNAME_MACHINE "riscv32"
++#define UNAME_MINIMUM_RELEASE "5.4.0"
+ #else
+ #define UNAME_MACHINE "riscv64"
+-#endif
+ #define UNAME_MINIMUM_RELEASE "4.15.0"
++#endif
+ 
+ #define TARGET_MINSIGSTKSZ 2048
+ #define TARGET_MCL_CURRENT 1
+-- 
+2.32.0
+
-- 
2.32.0


