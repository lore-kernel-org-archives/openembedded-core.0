Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ACBCC7618A
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 09:41:16 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.8409.1678959670062438562
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 02:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BAXvZgKa;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id w9so5107693edc.3
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 02:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678959668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ool8CY/rV+TxRAGpPCbgJhqayGlaxflLhFKQOjS5WYw=;
        b=BAXvZgKaByBl+xIryASmp5qT56O5HtFqhx9Riz+vOHxFPiKKJacFMuSjBE3XvS477M
         ZfVZlCUsWf93xUvHdoSbNXGJrLoKtlrwBLrLymGpqjNVAz/7nRFQ7XO/3Bps78+6jBg7
         0OdB8X4pOeaREVF5hFiJg2m0iFYHk3dmcw/GodpHknuCGN5GUNZ+ZQ0aCCNiCOIS8N13
         CzgfoXi95q0AN0dTWWA8RwXGxQLwv9iAvwk8EfGc5tIOayJlL9/In3X1TM8ahAiKKAtw
         wP2u+qD3vhm1FTWn/dhR+MXsm6wK4nqhR7c6H2AaPmo4CBrLY2CQUHp6IFKDgRnMc5zj
         9ZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678959668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ool8CY/rV+TxRAGpPCbgJhqayGlaxflLhFKQOjS5WYw=;
        b=iLJQ/gc2YjNMFazGkY4uoFjdOAtq+/q3kvN4g7fNY0O4VT7nAopTwXgt/ZzpVRBw+C
         BX2OkPoJUPiZyU6/mTWnPaCEo0RyHE8AGNkzJYY5uEdf79PFDv5qcWcJuUtVmaFR2wdU
         7caH2p53zwllkvZulQW+5H/pqvEHRJ0yr4tb10cW4CX8DeC/1/DoKA+Ysm2AZIwO8aZG
         UgG4EDSzostyNq42iCWGPf2eFToiAYY89AFzdY9UlHU8xS2SUTlyjYAbMzugtYDnMJtr
         f2eiYE1FkNHmgh5Fbd4OCVADCTiZWkGbt20fHGDSeQs8slUOhN2jkt5Ddo+ueHHrwbTw
         PdUA==
X-Gm-Message-State: AO0yUKUlLNKiYtDo5ncO9gZs7u1NKEXDewCxQuzc2wvz092PcU+K8kgM
	82zN6HgcHR4RlN0v4DyVFbG67fSacHU=
X-Google-Smtp-Source: AK7set+sJPnrIy8xdSEeckqy+mWyZZPQN7hF0lD1bw2Y3miiknzv7Xa1s59TXj/E4d+P5MavrhYZDQ==
X-Received: by 2002:a17:906:f1d2:b0:8b1:7fe9:162e with SMTP id gx18-20020a170906f1d200b008b17fe9162emr9839575ejb.47.1678959668587;
        Thu, 16 Mar 2023 02:41:08 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id lf28-20020a170907175c00b00923221f4062sm3621661ejc.112.2023.03.16.02.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 02:41:08 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 4/6] llvm: allow building libllvm in native builds, subject to PACKAGECONFIG
Date: Thu, 16 Mar 2023 10:41:00 +0100
Message-Id: <20230316094102.2628727-4-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230316094102.2628727-1-alex@linutronix.de>
References: <20230316094102.2628727-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 09:41:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178694

Also, enable that, if opengl is in native DISTRO_FEATURES: this allows
mesa-native to build drivers that rely on libllvm, particularly llvmpipe,
which is a (sort of) accelerated software renderer that is the only
option on build hosts without dedicated or supported GPUs.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index b4e983d2d0..f133653903 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -57,9 +57,11 @@ def get_llvm_arch(bb, d, arch_var):
 def get_llvm_host_arch(bb, d):
     return get_llvm_arch(bb, d, 'HOST_ARCH')
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "libllvm"
+PACKAGECONFIG:class-native = "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'libllvm', '', d)}"
 # if optviewer OFF, force the modules to be not found or the ones on the host would be found
 PACKAGECONFIG[optviewer] = ",-DPY_PYGMENTS_FOUND=OFF -DPY_PYGMENTS_LEXERS_C_CPP_FOUND=OFF -DPY_YAML_FOUND=OFF,python3-pygments python3-pyyaml,python3-pygments python3-pyyaml"
+PACKAGECONFIG[libllvm] = ""
 
 #
 # Default to build all OE-Core supported target arches (user overridable).
@@ -102,14 +104,15 @@ do_compile:prepend:class-target() {
 }
 
 do_compile() {
+    if ${@bb.utils.contains('PACKAGECONFIG', 'libllvm', 'true', 'false', d)}; then
 	ninja -v ${PARALLEL_MAKE}
-}
-
-do_compile:class-native() {
+    else
 	ninja -v ${PARALLEL_MAKE} llvm-config llvm-tblgen
+    fi
 }
 
 do_install() {
+    if ${@bb.utils.contains('PACKAGECONFIG', 'libllvm', 'true', 'false', d)}; then
 	DESTDIR=${D} ninja -v install
 
         # llvm harcodes usr/lib as install path, so this corrects it to actual libdir
@@ -121,9 +124,10 @@ do_install() {
 
         # reproducibility
         sed -i -e 's,${WORKDIR},,g' ${D}/${libdir}/cmake/llvm/LLVMConfig.cmake
+    fi
 }
 
-do_install:class-native() {
+do_install:append:class-native() {
 	install -D -m 0755 ${B}/bin/llvm-tblgen ${D}${bindir}/llvm-tblgen${PV}
 	install -D -m 0755 ${B}/bin/llvm-config ${D}${bindir}/llvm-config${PV}
 	ln -sf llvm-config${PV} ${D}${bindir}/llvm-config
-- 
2.30.2


