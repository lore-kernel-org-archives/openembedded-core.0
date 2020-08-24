Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web12.1982.1598295645244281823
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2020 12:00:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MMgYtrCM;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id u3so8486791qkd.9
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2020 12:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HmMTYNVURpKtPUAnl8p2CPChDrGux41u83eA8OwhdwQ=;
        b=MMgYtrCMAPZSpXGNluUDPY1Zey/RpWjxSOix5j9+6PoTEuua269ri29IHFlzSq09pg
         /vJg2CSwErTOhHhJr/hmp1+AA8JNzJP/56LoJu6/4yec4GT6pUwc3q+q0P0e/7w9gpb2
         EZ2EAyaYpaDdy4uB7kvAj5xZV/DHVxK+tbA9b2VGwE+HLVDpdc4mfP7T6q4PCJ7cW9tm
         crDxFb7h6CEukVHyOxZzInvGT5veasVN5jrzT/nnu5fG4tVrsWTbohVpBg3CQDia7emM
         l54Ut6U/08u4+/B9AbjJlw67nYmUWjj7Yj2z0DB8lsrfKMtkjJJ0Yz/PrxHHoM5IekrX
         Ezdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HmMTYNVURpKtPUAnl8p2CPChDrGux41u83eA8OwhdwQ=;
        b=NyIJaPtwoDjQ0SixW7/2ZBkgj3dI4rclP/N5Kd8KyOJnnNCOnufcmHusofGb2RNR9q
         Cva1h++Pii/tKUVCP4a5w7pN3Cd3rzSe5gaWCi2MagA3kvSEOI+HAdRYk4OupCRU3NmX
         O8C8+8E3H/mmSjCns8dV90HCBAzpzoZKpuwO6wBr8YybAJ0aEF62kwzFCHaj9nabcFGM
         bOa6ljHrFOUHxvYNUd4/sEFDZypm573rNemPuyoj6JCz7FJepm1KgvjAdkXfnSzo+fYW
         vMrhRK8PPTX6Idx33Pfm5F2Jei5I9sU+vqoGivM13J9KibZapgdJLQaZ9olXC6m5YpmN
         D33g==
X-Gm-Message-State: AOAM533oCn7+eHL7Csw3hkLcPF/6J5PaRHkT9VePHIUkizP68xllkGMx
	5Xqy3A78vSDa+3x+sgYy7Jc=
X-Google-Smtp-Source: ABdhPJzYBqwvD3v8IJ+V847vW/pmlZJf9ijxiczmTIhMYv7YSdPvQ/tqIFBhXWixQXM6S0v3v87ojA==
X-Received: by 2002:a37:4ccc:: with SMTP id z195mr5810332qka.270.1598295644147;
        Mon, 24 Aug 2020 12:00:44 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id f3sm3160826qth.56.2020.08.24.12.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 12:00:43 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] linux-yocto/5.8: fix perf and virtio_scsi warnings
Date: Mon, 24 Aug 2020 15:00:38 -0400
Message-Id: <20200824190041.54316-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.8:

    5d66d1a67c8d arm64/perf: Fix wrong cast that may cause wrong truncation

Khem reported in some configurations that CONFIG_SCSI_VIRTIO was
throwing a warning in the final .config. That was due to the fact that
if debug or not is enabled, it switches between built-in and a module.
Either configuration is correct, so we add it to the non-hardware file
to inhibit it being reported by deefault.

The following meta branch commit resolves the issue:

   commit 96e8f5e330f5a8f87deda0f1bae71af31c578ce9 (HEAD -> master)
   Author: Bruce Ashfield <bruce.ashfield@gmail.com>
   Date:   Sat Aug 22 22:19:13 2020 -0400

       virtio: declare CONFIG_SCSI_VIRTIO as non-hw

       Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.8.bb               |  4 ++--
 .../linux/linux-yocto-tiny_5.8.bb             |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_5.8.bb  | 20 +++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
index 6317f8da7b..7b5588f01f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3eb064c5f2b3938ef296c016bc7904cd66f50329"
-SRCREV_meta ?= "196209114496901389e2f9012c0600121fc617e0"
+SRCREV_machine ?= "5d66d1a67c8d654fa400f476daefbf2acd3a99f3"
+SRCREV_meta ?= "a53fa3813188b421c420b85b51ba95e6a6278689"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
index 022779f97f..8e7272b54e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "15d5da73971d108241be861b5587949fd56933e9"
-SRCREV_machine ?= "3eb064c5f2b3938ef296c016bc7904cd66f50329"
-SRCREV_meta ?= "196209114496901389e2f9012c0600121fc617e0"
+SRCREV_machine_qemuarm ?= "01ca9ab2d6cb0de4425d9dfca99dff30653083d9"
+SRCREV_machine ?= "5d66d1a67c8d654fa400f476daefbf2acd3a99f3"
+SRCREV_meta ?= "a53fa3813188b421c420b85b51ba95e6a6278689"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index ea167c1866..e6e1189802 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.8/standard/base"
 KBRANCH_qemux86-64 ?= "v5.8/standard/base"
 KBRANCH_qemumips64 ?= "v5.8/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "ca2de8f4027075ca7d7c973c2cc03f7d8b219a43"
-SRCREV_machine_qemuarm64 ?= "3eb064c5f2b3938ef296c016bc7904cd66f50329"
-SRCREV_machine_qemumips ?= "5e0205a156d14b6341487a169b75ea45b67007b9"
-SRCREV_machine_qemuppc ?= "3eb064c5f2b3938ef296c016bc7904cd66f50329"
-SRCREV_machine_qemuriscv64 ?= "3eb064c5f2b3938ef296c016bc7904cd66f50329"
-SRCREV_machine_qemux86 ?= "3eb064c5f2b3938ef296c016bc7904cd66f50329"
-SRCREV_machine_qemux86-64 ?= "3eb064c5f2b3938ef296c016bc7904cd66f50329"
-SRCREV_machine_qemumips64 ?= "576f92f17434ae7dd027e8d465a32e4119ead4ee"
-SRCREV_machine ?= "3eb064c5f2b3938ef296c016bc7904cd66f50329"
-SRCREV_meta ?= "196209114496901389e2f9012c0600121fc617e0"
+SRCREV_machine_qemuarm ?= "3c532d32043dbe90c159f334d8c4232ca67537cd"
+SRCREV_machine_qemuarm64 ?= "5d66d1a67c8d654fa400f476daefbf2acd3a99f3"
+SRCREV_machine_qemumips ?= "de93c804ee2e77d32e8a103a68ef19df6947757f"
+SRCREV_machine_qemuppc ?= "5d66d1a67c8d654fa400f476daefbf2acd3a99f3"
+SRCREV_machine_qemuriscv64 ?= "5d66d1a67c8d654fa400f476daefbf2acd3a99f3"
+SRCREV_machine_qemux86 ?= "5d66d1a67c8d654fa400f476daefbf2acd3a99f3"
+SRCREV_machine_qemux86-64 ?= "5d66d1a67c8d654fa400f476daefbf2acd3a99f3"
+SRCREV_machine_qemumips64 ?= "3109e6f363109f0dd4bd6a8647f639e445c533f2"
+SRCREV_machine ?= "5d66d1a67c8d654fa400f476daefbf2acd3a99f3"
+SRCREV_meta ?= "a53fa3813188b421c420b85b51ba95e6a6278689"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

