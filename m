Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web11.579.1585091114923685989
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 16:05:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iOK094aA;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id 10so579437qtp.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2020 16:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ESBET5Ymr5STlJ1vt7/dgIII9r59LAvnMlPchay+RBA=;
        b=iOK094aAshJby1BwZGrk3vutJ4eE5fJz5zpVtgqPEFoBwmKH6dOWETwFqp3EyQ/UWO
         uPG0wAqWez3dIw5Ja3zfYm/nvRWq/aaRO1iQsW5U7OCcl/Z59d0+peB3rllZCNQtSO5m
         XFoc7C81jBec0I7uc9hs79ZGsGjrACCNV6osjMnu05oIR+uaWrfQK/qIToqtuHNLMX91
         1dTA//0pTmjdkqU/wMlo8scw69VimqFpWHYyCWEyLrhYrDs8wPtuqoparp78ooXuq9HT
         e4t3IBcarnB5AhRsjZHAsc7JxRk4ugE9m1zAMPWokiLyc+DaXArFbAneyMsaUzu1sZD9
         OfVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ESBET5Ymr5STlJ1vt7/dgIII9r59LAvnMlPchay+RBA=;
        b=N1+EvJMoSGqxI3aCl9ZVFn8YISdQX6fBcL4r5k7ofP6E9mvK+UGMT1hnGfq1syePjI
         +iPQSi7og71mpMRAx70FHmFrZnOH6Nb16Is6cI2X1BWjzyt9hGhPLiqezVsvLx1kFFKv
         fLXEdAdfyOZRbtFwnrmkxDSN6ewb/B/WPw1uxL4bnBeEofN7vYurxeNkG9sd5hohO/XQ
         Lxws5r1dOTPqNkUPOQIuazM3Qbo2/vMfapCZQY1F7s3A9md9c7XSzLDSZVnM8SBs0miy
         ZhnwDZiOKtkTBVZend1eSF4b1pxNyI/cRtu4C1gBfMR3kSid2yQWC7mxdYGeiN/cFrOZ
         nqlw==
X-Gm-Message-State: ANhLgQ2TirKFX0we+aHpeZk7QIFkBbp8uSOJdR4ADy0kW8qsx2wSldPS
	Va1bZdGs6p00aFrGsiLajv8=
X-Google-Smtp-Source: ADFU+vtBrA/Wn3eY4o5gJG816jvGC5SPXFWgE/8tuohJ9UDaP9vksVZKeCdrf8VXUnxqYCkfKkQB7Q==
X-Received: by 2002:aed:32a1:: with SMTP id z30mr270162qtd.288.1585091109043;
        Tue, 24 Mar 2020 16:05:09 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id l22sm15153655qkj.120.2020.03.24.16.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 16:05:08 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] linux-yocto/5.4: KVM: LAPIC: Mark hrtimer for period or oneshot mode to expire in hard interrupt context
Date: Tue, 24 Mar 2020 19:05:01 -0400
Message-Id: <554ee9b245a2d087a1d37affc356aa79c0ba3934.1585090958.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1585090957.git.bruce.ashfield@gmail.com>
References: <cover.1585090957.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commits to linux-yocto/5.4:

    9065d188f874 KVM: LAPIC: Mark hrtimer for period or oneshot mode to expire in hard interrupt context

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto-rt_5.4.bb |  2 +-
 .../linux/linux-yocto-tiny_5.4.bb              |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.4.bb   | 18 +++++++++---------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 9d237ee32f..2eb1e846e8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a069c47171c8b2510401dba1922b49b294c19b0e"
+SRCREV_machine ?= "87d86ed4bfc78baee66933982c2962309fca4ffe"
 SRCREV_meta ?= "d40bf6ad14acc6d84d5c9a8e2c794ce37ffa16ff"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 02beca0097..18ff195af3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "84a0aabc9db1eba2fbfcbd80b3c538cd73f0b03c"
-SRCREV_machine ?= "4cd12df48b83cef9cc7d6b80b128afbf68746718"
+SRCREV_machine_qemuarm ?= "b6bb0cf2d13aca397c216c2323985c87ac98919a"
+SRCREV_machine ?= "9065d188f87410b7c862e44ff3143648c1ad2295"
 SRCREV_meta ?= "d40bf6ad14acc6d84d5c9a8e2c794ce37ffa16ff"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 8bad042528..8db3d1c974 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,15 +12,15 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "f4bf0307957258b20048e704ff3683437d7b0373"
-SRCREV_machine_qemuarm64 ?= "4cd12df48b83cef9cc7d6b80b128afbf68746718"
-SRCREV_machine_qemumips ?= "06bdb6af393b84e2c1a6f34b67bf4af36b9331e3"
-SRCREV_machine_qemuppc ?= "4cd12df48b83cef9cc7d6b80b128afbf68746718"
-SRCREV_machine_qemuriscv64 ?= "4cd12df48b83cef9cc7d6b80b128afbf68746718"
-SRCREV_machine_qemux86 ?= "4cd12df48b83cef9cc7d6b80b128afbf68746718"
-SRCREV_machine_qemux86-64 ?= "4cd12df48b83cef9cc7d6b80b128afbf68746718"
-SRCREV_machine_qemumips64 ?= "958ee61d50f664b413f368a7573918a18a00d4ac"
-SRCREV_machine ?= "4cd12df48b83cef9cc7d6b80b128afbf68746718"
+SRCREV_machine_qemuarm ?= "9f04047a4f31450342960f04571194122e890461"
+SRCREV_machine_qemuarm64 ?= "9065d188f87410b7c862e44ff3143648c1ad2295"
+SRCREV_machine_qemumips ?= "f6f24e8e404d1debf07cb5793a183ba8e759d09b"
+SRCREV_machine_qemuppc ?= "9065d188f87410b7c862e44ff3143648c1ad2295"
+SRCREV_machine_qemuriscv64 ?= "9065d188f87410b7c862e44ff3143648c1ad2295"
+SRCREV_machine_qemux86 ?= "9065d188f87410b7c862e44ff3143648c1ad2295"
+SRCREV_machine_qemux86-64 ?= "9065d188f87410b7c862e44ff3143648c1ad2295"
+SRCREV_machine_qemumips64 ?= "6f93582af92ab433d43c2a67a7ed871e5c229e55"
+SRCREV_machine ?= "9065d188f87410b7c862e44ff3143648c1ad2295"
 SRCREV_meta ?= "d40bf6ad14acc6d84d5c9a8e2c794ce37ffa16ff"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
-- 
2.19.1

