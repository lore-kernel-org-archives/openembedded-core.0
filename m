Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98136C74A5B
	for <webhook@archiver.kernel.org>; Sun, 12 Mar 2023 14:51:03 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.67841.1678632661628457247
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Mar 2023 07:51:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dngV73wG;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id g10so10147392eda.1
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 07:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678632660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ool8CY/rV+TxRAGpPCbgJhqayGlaxflLhFKQOjS5WYw=;
        b=dngV73wGP1RzbpZxH5J0E4oAmqGMaP09wZIAl7q2V+D6/UwLZ+6CchgyJZZoyzb8Yq
         3O1aWd7KUT88gSmTT5X0DHvIS3iA4E+bdE9SMZUM5V+eYzbPwlcuiBslbhDrqPP13gWB
         bFGhH7kyZZRcI0CNH9WssXETPsOclgu8oLzbi1GvwoXggq/T2zBCKv9aKajlUAG6cXte
         2hA3YGLHGlTn6f7Drd14V6VvxwGjKvpkm7SHC+djc4fpp+lBD57Aus3yoJMQcLAa/jRP
         50z8DwzGiBurfag8+q4HYGrSssJrDuMswY04X8dDzO/+39+pQUlHzI2h+SEUOUpVjSFr
         /L/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678632660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ool8CY/rV+TxRAGpPCbgJhqayGlaxflLhFKQOjS5WYw=;
        b=OetE8fqcmrazOu+ikih/26equXDzAPD+YZmnus9nhOendQ3cjD8GyJLM6ivWKLwbZ0
         UsrvvUUcnk1jO2ozgJztvMtWP1TPZjQM2DDUu0EbCcVUyxqxCPDVSsVFbKIP58d4BHqF
         gJoV8U5w8f+tKCNCbRoc3KLfjDK8LXV/swt1uQG9G1zH7BO3ulcpNpNu8NKGr1/Z1e/M
         aFFYxd0rGAc16yVFR77vu2TMfNT49JIRuDp9Mc8DjM1wiuG917zw5gPVuP9oEAjfNzwS
         BDGY0CzN4hovQ8l1m63PSni3GUeCWeR+1c4QR6hLRf5vPxseNz9dnu7UORTxfuIpZlqk
         NPUg==
X-Gm-Message-State: AO0yUKXuyDnJbnsYFCZye6HM5K6HpHK8Aqd2gD/22RFbQ4GcuwoKvvJ/
	zgKejqrgheYdjyF08DCLIJSU2OJBssQ=
X-Google-Smtp-Source: AK7set9u7jo9hpxXlVaEYuY78dhUtHqlUHXC/fHHDYz8/h/RsTj6wiY1cq79X0eF77Zucb066xh10A==
X-Received: by 2002:a17:906:5a6e:b0:926:e917:133c with SMTP id my46-20020a1709065a6e00b00926e917133cmr1707354ejc.47.1678632660101;
        Sun, 12 Mar 2023 07:51:00 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l22-20020a50d6d6000000b004fa19f5ba99sm2012255edj.79.2023.03.12.07.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 07:50:59 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 5/7] llvm: allow building libllvm in native builds, subject to PACKAGECONFIG
Date: Sun, 12 Mar 2023 15:50:51 +0100
Message-Id: <20230312145053.1427377-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230312145053.1427377-1-alex@linutronix.de>
References: <20230312145053.1427377-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 14:51:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178397

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


