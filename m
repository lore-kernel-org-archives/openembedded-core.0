Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61ED2C61DD3
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 06:44:18 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1774.1788417850043760204
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 23:44:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Qtcvz9py;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so20829645e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 23:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788417848; x=1789022648; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R7AUE0QUE+mhqEFwxJroj63dmRLPtMOe4BQ1xUZh478=;
        b=Qtcvz9pyCaSDT1wntL2MZ6yMkPaoQkK6DHKla7WxFxaSxHqW8FSKy5MT6Ku2No2/dQ
         +Hut2EUd/49W6uP+ZroVueu08dzXDnrZ/imm9XfgcgHCTHrWyc8J7jsZrwodvLdU+H2h
         YVLOaikTwP2EAuVbGftxhMSWVnBxdTaa9kA4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788417848; x=1789022648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=R7AUE0QUE+mhqEFwxJroj63dmRLPtMOe4BQ1xUZh478=;
        b=UluZCOMWSSz0vo2dQ3w3nUGyf02QK5/3OsDoOetMYhNtIBaqRBwmXXHZf7CUHmzcJM
         ne2GmL8i8Hq+LtoL2Y9WFYZSSSwcSQcanE3NgjXiD8IIDbXGq9gsKxV4a56O5p0LhzPo
         VmagrpYLlyuJ4OhtKp5hyWz2o1l4keuOzgPQq5m70cVQvfmWJEX4ztnOqRlmKNWPbioP
         9GS32P7Jx1eZrS8ZnOW6cSVUctpx9/AU6x5z1e+NDK6qcnNDo8cXZwrZ2Om7WIr4cgxE
         iulRU5jOwTLCSn2+VgmjtBV38wY6Hcwz2mbPBRa9msi23TBsCI2LBY82mEuEVdl3pmWL
         yddw==
X-Gm-Message-State: AFuF++mB8u+22VsUmjgizJc4+/pJYLmxwtCg5sipOdd+SZXxFUJ3wL8h
	1coBQk2hP6EWMZU0LZ2Aa+UqEp45IIAnj6fHNfUnIsYNrx9RCH9Bh2hK0SOTuqavM2KKoyS2IRY
	/pJN7jvc=
X-Gm-Gg: AYBFou3O9fcp/kUia1aW1dYpFctyEtZDtHqojD94buWE4S+ioV+UcmEEdv5E+iQfnNQ
	fktS5pegQEs8D4gibrsjy43pP8+2wkmCJGGKatXZKpp4FFs9xZfkh2oC2Qi9Mg1ucyBcSihZxFy
	wOfzcXucgYP70gyUL251MEL8OupF9dW3wYlHiiXYDzkeKF1gEGfacVLdhRfJBztIBHyWGhZm4m8
	mPK4DP+96YYswdVFQM1iZa7PfzP4qOTgdaRhwpOB27hdLjz9xfRFXPSB1tBGBtcyMRJDHCMgl6l
	Bmlj1atUKRLdCAHVPCh+LOa0AJReTW4Gl8LZmGW0Y8CwR0E2PaWAD2I9X/NgEG5r+MeoQCe/wz+
	YTE8Jax2NxagcKnbLiCS/fSjfwQZLfXd89RWHweVvZR36cmStskUBxNbuhV58A3V5A6dZnK5dOT
	pzM43QxF+ZJ/BCCykJRfPwRPL3LUxDuZrV0VuBMs/ARS8RoHbc7+jXGp12NgRhNHQG++eZnni+w
	DfNQqU8VbtChSkVHw==
X-Received: by 2002:a05:600c:6992:b0:49a:a101:4157 with SMTP id 5b1f17b1804b1-49ce58034admr187797945e9.7.1788417848082;
        Wed, 02 Sep 2026 23:44:08 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a76d:4840:1f4f:ed41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5dead1sm44278175e9.11.2026.09.02.23.44.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 23:44:07 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] mesa: Upgrade 26.2.1 -> 26.2.2
Date: Thu,  3 Sep 2026 07:44:02 +0100
Message-ID: <20260903064403.3848874-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903064403.3848874-1-richard.purdie@linuxfoundation.org>
References: <20260903064403.3848874-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 06:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245007

Contains bug fixes:
  - 26.2.x build fails with armhf
  - Confidential issue #15052
  - GL stencil reference query does not update immediately
  - Mesa 26.2.1: radeonsi no longer loads for GCN1 / Pitcairn when using radeon driver.
  - Textures got swapped/glitched on Wuthering Waves game.
  - [Navi10][RadeonSI/RADV] NGG culling causes nondeterministic GPU hangs; nonggc fixes both OpenGL and Vulkan
  - [radv][bisected][regression] Broken rendering in Persona 3 Reload menu on RDNA2 in gamescope
  - radv ignores count of 0 in vkCmdDrawIndirect

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch | 2 +-
 ...0001-freedreno-don-t-encode-build-path-into-binaries.patch | 2 +-
 .../0001-meson-misdetects-64bit-atomics-on-mips-clang.patch   | 2 +-
 ...src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch | 2 +-
 ...src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch | 2 +-
 meta/recipes-graphics/mesa/mesa.inc                           | 4 ++--
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch b/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch
index 07a4f66af8a..ac88417081a 100644
--- a/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch
+++ b/meta/recipes-graphics/mesa/files/0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch
@@ -1,4 +1,4 @@
-From 539870cc9dc54989c588f9a6bcf71f19f3ca45f6 Mon Sep 17 00:00:00 2001
+From 229a8815750765d7125f0c7efe9c8d6216678bef Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Thu, 13 Aug 2026 00:00:00 +0000
 Subject: [PATCH] addrlib: avoid __builtin_cpu_supports for avx2 detection
diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
index 590851f6f1d..087930245f5 100644
--- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
+++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
@@ -1,4 +1,4 @@
-From ea7f29215915d3e08111b4ed489defedc0f30c8b Mon Sep 17 00:00:00 2001
+From 44f9c60f2ca4ce212c8cc3ba19e5adc357ebdad4 Mon Sep 17 00:00:00 2001
 From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
 Date: Wed, 10 Dec 2025 02:27:16 +0200
 Subject: [PATCH] freedreno: don't encode build path into binaries
diff --git a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
index 9d148ed46bf..39ebd01e232 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
@@ -1,4 +1,4 @@
-From 82b7419010da29c7d2e1968a369f3682bc1010ef Mon Sep 17 00:00:00 2001
+From d0c3c71a0eebe72b822277e46ee2698bcc428d44 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 13 Jan 2020 15:23:47 -0800
 Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
diff --git a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
index 4a4836b6bf7..1cee7ad4e0e 100644
--- a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
+++ b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
@@ -1,4 +1,4 @@
-From 26b14d36b941b7839d13f82d12a8ca569b718235 Mon Sep 17 00:00:00 2001
+From 35ba9a2f6f5ffccca93aa430ef94cb174dd68ea5 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 14 Jun 2026 17:42:19 +0200
 Subject: [PATCH] src/intel/compiler/jay/jay_ir.h: do not used typed enum
diff --git a/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch b/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch
index 801c872c71f..a697b4c774f 100644
--- a/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch
+++ b/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch
@@ -1,4 +1,4 @@
-From 425aa8da2249c01f852fade871721e5e2f25555f Mon Sep 17 00:00:00 2001
+From 80a8cc93b8a4dca53ed11f9fd9b8065a55845bc3 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 1 Jul 2026 22:48:15 +0200
 Subject: [PATCH] src/util/u_math.c: do not use arm fpu instructions if fpu is
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 2179f1a6a0e..9927d80b227 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,8 +22,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-addrlib-avoid-builtin_cpu_supports-for-avx2-detecti.patch \
            "
 
-SRC_URI[sha256sum] = "c47e81bddc4760360a41ac3c5acec38acb81f9d750ecef47e7f3adc7021a4442"
-PV = "26.2.1"
+SRC_URI[sha256sum] = "eeb29ca7e56cfaa8e8a79538dcf834e3b18e501c31bef5145e959ea437cc4216"
+PV = "26.2.2"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 

