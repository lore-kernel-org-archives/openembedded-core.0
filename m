Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web12.577.1585091108917760790
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 16:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kAe7sJxi;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id i3so539222qtv.8
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2020 16:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QbCtquqaFxujT6RVCfwUKilke2urT9Ko05w4cyJRBDI=;
        b=kAe7sJxieAXplcAaonzTYtfpJIHusP/OerpU+iABXxErD2mbsTKYdxAQHloJNmyslg
         LhIlnz048SBBuPtuyqx9rycaclECNB2Iyb5mXuk47y9gjMsm7yej+tqlef8cfg/qJegR
         7CCJDNqvgmC1s6psZcNvGLdrnW7JrgfCzC79fWUBt2Sd3Gmhv9mI5Y+idqgvrTHmagR6
         +0jSRxMVTMiGtQwodxJIdP76j2lZ2Cjjw6RRbLs9pkVw8gHqYOrFbzUySPNrVo8x1W3e
         JMfGmtpBdkLTQYg7np1xbxfT6akNdWP7v3lwemmTgJceoDlEta/+F/ofBP40nKrpbCbQ
         BwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QbCtquqaFxujT6RVCfwUKilke2urT9Ko05w4cyJRBDI=;
        b=TPYEDVDwv/Q4nRrzwEjUOR6pkLA2sbOdAcyxWYmKYlC1wLRh2axFJjrYD8BkS61W3q
         aumQ2kQH7W8fCoDy5Bagrg8BcExDXWQnVZJn40tdjnM2YjJNX21bJwNLHeY8oK0tDnfJ
         ZxZQwjTAcfboBg1y85K4jySIlfzhu7tk4kkP46sSjUhsHWF54a81kQWSjbOuBC2saSse
         IRfmG8asJWgJg/xInhN6CBKsRrH47PIZtJwHS7YdWNgwMc2ZzUXypo0hFNMBbK4Dz3uE
         Rge7HGvIs7ESrANMVRI7c2eWIB26Te7S7bOEKdk+Op512rdT/OTYucFHgJN5VFZcdkYZ
         IKrA==
X-Gm-Message-State: ANhLgQ3pjsod5oOJz662P/g9ZySyaUHhGP9rXIgh58DEp7+3n06VwgC+
	vuDhhq/I4tcui+qDuNlFe5MmvWSYk4YdwA==
X-Google-Smtp-Source: ADFU+vss1sfpw2DLWsWg6kv6NpfqYIC5gihgweb64JGXLByFjgufoBPGxKQWLIRnlLP82A5mdL16Uw==
X-Received: by 2002:aed:2a87:: with SMTP id t7mr271259qtd.206.1585091108049;
        Tue, 24 Mar 2020 16:05:08 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id l22sm15153655qkj.120.2020.03.24.16.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 16:05:07 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] linux-yocto/5.4: fix kernel selftests
Date: Tue, 24 Mar 2020 19:05:00 -0400
Message-Id: <a952c26d12a4d9049725b9abb1cae694e3e6210c.1585090958.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1585090957.git.bruce.ashfield@gmail.com>
References: <cover.1585090957.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Khem reported that kernel selftests are failing after some of the recent
-stable udpates, and identified the followig commits to solve the
issues:

    4cd12df48b83 selftest/bpf: Use CHECK macro instead of RET_IF
    84591c1cb409 Revert "selftests/bpf: Fix perf_buffer test on systems w/ offline CPUs"
    844b959f96bd Revert "selftests/bpf: Skip perf hw events test if the setup disabled it"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  4 ++--
 .../linux/linux-yocto-tiny_5.4.bb             |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 20 +++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 5bdd2f629a..9d237ee32f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b6eb513c50e6de3746287c4f17058a81d1be613c"
-SRCREV_meta ?= "ccf845f650255696bcd41c4004abf8adba212d5d"
+SRCREV_machine ?= "a069c47171c8b2510401dba1922b49b294c19b0e"
+SRCREV_meta ?= "d40bf6ad14acc6d84d5c9a8e2c794ce37ffa16ff"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 0850725383..02beca0097 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "8f0a54b42e11bee3bf552ae6a04f7ec2267f4dd3"
-SRCREV_machine ?= "45760a7e1301894b3ffd4d1bd76684c99fbff6f7"
-SRCREV_meta ?= "ccf845f650255696bcd41c4004abf8adba212d5d"
+SRCREV_machine_qemuarm ?= "84a0aabc9db1eba2fbfcbd80b3c538cd73f0b03c"
+SRCREV_machine ?= "4cd12df48b83cef9cc7d6b80b128afbf68746718"
+SRCREV_meta ?= "d40bf6ad14acc6d84d5c9a8e2c794ce37ffa16ff"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 98e4accc74..8bad042528 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "e0b9db4dd28cfccc6b0cffd2da6cde7c8d760bdd"
-SRCREV_machine_qemuarm64 ?= "45760a7e1301894b3ffd4d1bd76684c99fbff6f7"
-SRCREV_machine_qemumips ?= "84c43062449817e61dd8e331f49821c65aa23967"
-SRCREV_machine_qemuppc ?= "45760a7e1301894b3ffd4d1bd76684c99fbff6f7"
-SRCREV_machine_qemuriscv64 ?= "45760a7e1301894b3ffd4d1bd76684c99fbff6f7"
-SRCREV_machine_qemux86 ?= "45760a7e1301894b3ffd4d1bd76684c99fbff6f7"
-SRCREV_machine_qemux86-64 ?= "45760a7e1301894b3ffd4d1bd76684c99fbff6f7"
-SRCREV_machine_qemumips64 ?= "08ac7d212e539ed2d17c6714d97b019e48e1fe1c"
-SRCREV_machine ?= "45760a7e1301894b3ffd4d1bd76684c99fbff6f7"
-SRCREV_meta ?= "ccf845f650255696bcd41c4004abf8adba212d5d"
+SRCREV_machine_qemuarm ?= "f4bf0307957258b20048e704ff3683437d7b0373"
+SRCREV_machine_qemuarm64 ?= "4cd12df48b83cef9cc7d6b80b128afbf68746718"
+SRCREV_machine_qemumips ?= "06bdb6af393b84e2c1a6f34b67bf4af36b9331e3"
+SRCREV_machine_qemuppc ?= "4cd12df48b83cef9cc7d6b80b128afbf68746718"
+SRCREV_machine_qemuriscv64 ?= "4cd12df48b83cef9cc7d6b80b128afbf68746718"
+SRCREV_machine_qemux86 ?= "4cd12df48b83cef9cc7d6b80b128afbf68746718"
+SRCREV_machine_qemux86-64 ?= "4cd12df48b83cef9cc7d6b80b128afbf68746718"
+SRCREV_machine_qemumips64 ?= "958ee61d50f664b413f368a7573918a18a00d4ac"
+SRCREV_machine ?= "4cd12df48b83cef9cc7d6b80b128afbf68746718"
+SRCREV_meta ?= "d40bf6ad14acc6d84d5c9a8e2c794ce37ffa16ff"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

