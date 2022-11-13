Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD89C433FE
	for <webhook@archiver.kernel.org>; Sun, 13 Nov 2022 08:44:42 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.926.1668329081575903744
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Nov 2022 00:44:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=RObmYJB0;
 spf=pass (domain: underview.tech, ip: 209.85.167.179, mailfrom: vince@underview.tech)
Received: by mail-oi1-f179.google.com with SMTP id c129so8835961oia.0
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 00:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YmsWOSRD7/VQ4XwqVqV5I0HBfV2sXpd8heHwjkrtKbU=;
        b=RObmYJB02WyrzTCk9LctL8/s7gW6OFq7x2hPVlFusPXTBO6ewgQPQNQkKj1LChnFtg
         lBpv7OP3TrCv9TDzkJxGxrhPlNJPwySxYJne7QFN2gn5jOruxNLfCHP6hrbSl+C8jSKx
         PTDb7KrletZ+ggtmYD1i572Zbjpf30Q3vzcpzZeuthDcl1mlfFO6jaTsqnl/AewHHYzk
         RxcvmHQ2ZtmfEciIPM9NQJloMc5+sUh0PPV2N/2b7sO120ukU2jQy/aJx47QG1xOBtlL
         FnEQSd6fc833nR2q7fB9pPz2DuAvcYf9rgXmEA3ETUKiRkBIQW3jjI+VIaE/Ftz1NCMf
         pk3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YmsWOSRD7/VQ4XwqVqV5I0HBfV2sXpd8heHwjkrtKbU=;
        b=ji7gMtLeGXIBmUqQYDhEBEkPwkh/X3/8E+tv6+wuQtp5OxkMpDzjzUVbl8Q+c2N33t
         Be08qW9Hk5DDcLOdYHNeTOMX7FCedxMENIys8QBC9mvpqcutTnwHcZem20Dn/HA7tOF/
         7Uzamf9H7in/Pot0E01ZxM4sSTq/UsoimMAQZTL0B7Em6TWhQHtAAaKu7GFG70v5b2BA
         rhemSwlrCuXu3wDRZI7t7yXgtBPPkxJcCjHzBdW5vNUQFvYlp+vDk9jHu6p//nVbk7nK
         ngU1Zl+QTD59qAwKEoQWqXuyvwFqKACR9urEfmhjgR4D3gKsCa475LEAxOMCd2LBGmIy
         ScyA==
X-Gm-Message-State: ANoB5pnPjHiulRDgwnglfqsVollLbX4j3CRV13FTcLkGFc83mijoBah2
	kqzIJxgc1EPlO3XD1ZKxbmiWdOvIjFSFG33h
X-Google-Smtp-Source: AA0mqf6otzjaatUQ3/qS845hpLrMupfZHS5Fz91H82VlEU7gUhaR4P9SMLBiO2axMztJTKXzaQahng==
X-Received: by 2002:a54:4783:0:b0:359:fcf4:9e47 with SMTP id o3-20020a544783000000b00359fcf49e47mr3774530oic.81.1668329080149;
        Sun, 13 Nov 2022 00:44:40 -0800 (PST)
Received: from vince-ubuntu.attlocal.net (99-113-4-128.lightspeed.hstntx.sbcglobal.net. [99.113.4.128])
        by smtp.gmail.com with ESMTPSA id w21-20020a056870b39500b0012c21a64a76sm3566803oap.24.2022.11.13.00.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 00:44:39 -0800 (PST)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH] llvm: fix native llvm-config RUNPATH
Date: Sun, 13 Nov 2022 02:44:29 -0600
Message-Id: <20221113084429.329094-1-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Nov 2022 08:44:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173187

Problem occurs when native llvm-config binary is
required by another recipe. RUNPATH is hardcoded
to $ORIGIN/../lib:$ORIGIN/../../lib which depending
upon architecture 'lib' directory name may vary
(i.e 'lib64').

Commit fixes issue by updating rpath on binary to include
architecture dependent directory name.

Commit also fixes issue with llvm-config --libdir command
by setting LLVM_LIBDIR_SUFFIX. Command will return proper
architecture dependent directory name.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/recipes-devtools/llvm/llvm_git.bb | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index 1f47e5d0fb..29eb119be5 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -56,6 +56,14 @@ def get_llvm_arch(bb, d, arch_var):
 def get_llvm_host_arch(bb, d):
     return get_llvm_arch(bb, d, 'HOST_ARCH')
 
+def get_llvm_libdir_suffix(bb, d):
+    import re
+    arch = d.getVar('HOST_ARCH')
+    if re.match(r'(x86.64)$', arch):
+        return 64
+    else:
+        return ""
+
 PACKAGECONFIG ??= ""
 # if optviewer OFF, force the modules to be not found or the ones on the host would be found
 PACKAGECONFIG[optviewer] = ",-DPY_PYGMENTS_FOUND=OFF -DPY_PYGMENTS_LEXERS_C_CPP_FOUND=OFF -DPY_YAML_FOUND=OFF,python3-pygments python3-pyyaml,python3-pygments python3-pyyaml"
@@ -64,6 +72,7 @@ PACKAGECONFIG[optviewer] = ",-DPY_PYGMENTS_FOUND=OFF -DPY_PYGMENTS_LEXERS_C_CPP_
 # Default to build all OE-Core supported target arches (user overridable).
 #
 LLVM_TARGETS ?= "AMDGPU;${@get_llvm_host_arch(bb, d)}"
+LLVM_TARGET_LIBDIR_SUFFIX ?= "${@get_llvm_libdir_suffix(bb, d)}"
 
 ARM_INSTRUCTION_SET:armv5 = "arm"
 ARM_INSTRUCTION_SET:armv4t = "arm"
@@ -83,6 +92,10 @@ EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DCMAKE_BUILD_TYPE=Release \
                   -G Ninja"
 
+EXTRA_OECMAKE:append:class-native = "\
+                  -DLLVM_LIBDIR_SUFFIX=${LLVM_TARGET_LIBDIR_SUFFIX} \
+                  "
+
 EXTRA_OECMAKE:append:class-target = "\
                   -DCMAKE_CROSSCOMPILING:BOOL=ON \
                   -DLLVM_TABLEGEN=${STAGING_BINDIR_NATIVE}/llvm-tblgen${PV} \
@@ -129,6 +142,7 @@ do_install:class-native() {
 }
 
 SYSROOT_PREPROCESS_FUNCS:append:class-target = " llvm_sysroot_preprocess"
+SYSROOT_PREPROCESS_FUNCS:append:class-native = " llvm_sysroot_preprocess_native"
 
 llvm_sysroot_preprocess() {
 	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
@@ -136,6 +150,18 @@ llvm_sysroot_preprocess() {
 	ln -sf llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${PV}
 }
 
+# All of LLVM's shipping binaries have an rpath pointing at ``$ORIGIN/../lib``.
+# Recipe llvm requires llvm-native to compile. When compiling llvm build libraries
+# are located in $ORIGIN/../lib directory. When the llvm-config binary required
+# in another recipe depending upon HOST_ARCH variable libraries may be located
+# in a different directory. Account for both situations here.
+llvm_sysroot_preprocess_native() {
+	chrpath --replace '$ORIGIN'/../lib${LLVM_TARGET_LIBDIR_SUFFIX}:'$ORIGIN'/../../lib${LLVM_TARGET_LIBDIR_SUFFIX}:'$ORIGIN'/../lib:'$ORIGIN'/../../lib \
+                          ${SYSROOT_DESTDIR}${bindir}/llvm-tblgen${PV}
+	chrpath --replace '$ORIGIN'/../lib${LLVM_TARGET_LIBDIR_SUFFIX}:'$ORIGIN'/../../lib${LLVM_TARGET_LIBDIR_SUFFIX}:'$ORIGIN'/../lib:'$ORIGIN'/../../lib \
+                          ${SYSROOT_DESTDIR}${bindir}/llvm-config${PV}
+}
+
 PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm ${PN}-liboptremarks ${PN}-liblto"
 
 RRECOMMENDS:${PN}-dev += "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-liboptremarks"
-- 
2.34.1


