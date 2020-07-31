Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web12.17662.1596200198885282047
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2020 05:56:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=0/BKO/lS;
 spf=pass (domain: burtonini.com, ip: 209.85.128.65, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f65.google.com with SMTP id g8so8471801wmk.3
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2020 05:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3JoKrKwpCQrChROzD+1zv6e2uyCs5slL9UMVruM5eJs=;
        b=0/BKO/lSYVTmwj2816R8glKS+K/dySFsPCecU0GCs9h/IhKac0YgemiHOJkfFQZoSs
         3jq4FnIQ/+/KurnN/hcipj5JRg5Kr/SKh2zmrEDHA3uyJbJbHghbDvfUZ+upP+6p2wQ5
         5ZmRRliucDplOcuNB4HjQKGPorZr2XLFnTkI2AZaR0tSLfeZmcxyUibvoya8nXJcYQlv
         FoZwtti8bs6aCNI2posIVDLNrMefQcGxBfEu3xKZeTsPsTrhUhREXmeC73bZpXKkvhFM
         P46QYshu46TFouiAdt3iggqCY14tm6J+zPyafRfoyDqT4yzwFiezt6+9E98o1GDR/6fL
         kauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3JoKrKwpCQrChROzD+1zv6e2uyCs5slL9UMVruM5eJs=;
        b=oyXuPSn5NMbq5nu7ULNSFY3IeKcDuYKdObcT+78cUdeuIgQPiCO2loFJrbLa6+32Fy
         vdR4UbB9dt8CnyOldU2tp85byZLA7AVi9Ku62uAO5Fc244KE51jYCo5xQsCSi4Ojg4WS
         bCuzmoAdyZZI5PHJ3jtZQakPBMNKKVZggX2+/325Mu1IFeivSfBYQX2rSI6loJ7m1crf
         mR9DleEZwzx7+sf5QVmzWUNTgRWe8REY+psJToVDh9xBuHuxh3t2IAuwW4Mis+YQpnbC
         pddVrgnmo8RTbw/1qg/f8Gd9KmA9RfB7qLw+RYAP2GotbvR5ACTRpmgOUOlOtQ9stmNX
         dPbA==
X-Gm-Message-State: AOAM532Uku+CRyBtFx4NVT7bGipr8oDTRpc915VBwyvScI5Tx4p8rZZQ
	aS/9nOe+tDshhju2BwC2npkmLYabBVo=
X-Google-Smtp-Source: ABdhPJzHlFmDiq371HT1E5olI550w9Rls02KEy1jLgeR5APwWYAS4pr1j2rrzTVSa+9gejA3KEGBCg==
X-Received: by 2002:a05:600c:245:: with SMTP id 5mr3803269wmj.22.1596200197132;
        Fri, 31 Jul 2020 05:56:37 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id o2sm12945862wrj.21.2020.07.31.05.56.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2020 05:56:36 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] conf/machine: set UBOOT_MACHINE for qemuarm and qemuarm64
Date: Fri, 31 Jul 2020 13:56:33 +0100
Message-Id: <20200731125633.1869900-1-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

These machines support booting U-Boot, so set the machine appropriately.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/conf/machine/qemuarm.conf   | 2 ++
 meta/conf/machine/qemuarm64.conf | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index 44e73a3070..3364dcf042 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -7,6 +7,8 @@ require conf/machine/include/qemu.inc
 
 KERNEL_IMAGETYPE = "zImage"
 
+UBOOT_MACHINE ?= "qemu_arm_defconfig"
+
 SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;hvc0"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index d0d6f38e42..fdd464d708 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -7,6 +7,8 @@ require conf/machine/include/qemu.inc
 
 KERNEL_IMAGETYPE = "Image"
 
+UBOOT_MACHINE ?= "qemu_arm64_defconfig"
+
 SERIAL_CONSOLES ?= "115200;ttyAMA0 115200;hvc0"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
-- 
2.26.2

