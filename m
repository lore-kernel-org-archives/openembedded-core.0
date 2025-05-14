Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D516C3ABD8
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 15:17:31 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.105222.1747235842103304433
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 08:17:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aG6J8/L1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43d0618746bso54188245e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 08:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747235840; x=1747840640; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=EspbGCVzWMtSONNUTO5wWwvW9N4lip3NVLkILO65mGQ=;
        b=aG6J8/L1KeLPqKTBAgeamzpDqOwY4A+33i6CaKE6TBvVO4ANUUeZsjf9ht7qXf/AUW
         r0gu2SDdgspbwR8zKijL6JbFMEEaKs93EN3rlLEdMqhujP04e9COzr48ZQAQBxv3YohI
         9jMFvyvaFg68TpEX7Fg6rxNs4QRLcEbQtd4K4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747235840; x=1747840640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EspbGCVzWMtSONNUTO5wWwvW9N4lip3NVLkILO65mGQ=;
        b=SKDq97uRh5nEytSI5PSCwy+DCyqn1EvtOZoN04ME1kcHJ8yWjhYyKxDoHK7pThK3Ah
         igYsKiKZKkn/NXeGvLVv1kwuyFO7DgTa3W31NZBf7MhstHU8fySz8tIpgfOhIHa7Z9rB
         qzMf85HrkXx4nWdP5j43yhBKzNdNmQgrCcyqPpe1ISRVJYEK3u+e1zhtHSR7JlWTfugz
         8fxLgyERWVzaMUcR1fScRxP8BJW84dCoAqCbYvzv6hqaEmIAIj/VNC256lnCTBExYvJb
         JFXFcg94/vFI+A6W2vqrv7qpyLp0+0Vpew1rz3sdT0nla3vjM7XOxxaDXRknZJ99LKvy
         AorA==
X-Gm-Message-State: AOJu0YxLbCCMMWc9AtzkrpDm/81Q08aMiXMM7oyTK6IljOyyQAAbLhyw
	6XDfqNjE+QzIlUnXkPVedAm0Q6SkQW5AceyzrB3dHjbKkQhGbtwVy1DOnzLsp2iZO7oprs1Pe7i
	B
X-Gm-Gg: ASbGnctJ0D8KMol0fjBQYKKiV/bjz/xz2yVQvUunP6HBtdafbN8Ul7azzJbrLbkM472
	L6q3P4DBOwIoBjX/GXJn1o6QKdzI3ICPpIWPzNban/ppfnCcwOD0G8mAyKl/DOhapHDIOO+Vs6d
	Z7bQ3Evj+Se8csl1E85P3CcasgwlpIZINA4J2sdhz0ow8XbOOyMO8DHL0mcYIf3d4+7L/N25iCg
	2mdRi0L4DoPxoK8//Gu/wfLuCXIBT8ouHoO2c3tkQp0B3tV3L6J9uZny+ALi84uopF5toPmCBWb
	CI5FrETqsoAnyGZE0CmgJP3w1Rbv2WD5uDZ61i2HfUAYh3t2u75v32aTzvoEjN8ykeRDiM8Xg9l
	QvMlz
X-Google-Smtp-Source: AGHT+IFCXCZGTGBLFLZ5+W9JswKDcfJUCqrlrM4LTdlKHJn3tWH2LiAJFjRQrekRvlNbtdVMr72Mbw==
X-Received: by 2002:a05:600c:1e84:b0:43c:e7a7:1e76 with SMTP id 5b1f17b1804b1-442f20b8554mr28142215e9.1.1747235839637;
        Wed, 14 May 2025 08:17:19 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ac80:8bbf:3444:fa34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39e853asm34899995e9.26.2025.05.14.08.17.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:17:19 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gcc: Fix riscv multilib issues in plain toolchains
Date: Wed, 14 May 2025 16:17:18 +0100
Message-ID: <20250514151718.1495233-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 15:17:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216497

RISC-V multilib currently doesn't work at all. We could disable multilib for
the riscv platform but that would then behave differently to all our others.
Instead, copy the non-multilib config over the multilib config for now for
riscv, meaning we can keep the platforms similar.

This isn't quite enough as the triplet specific c++ headers are in the wrong
place leading to compiler issues and testimage failures. Work around that too
until someone adds full multilib support for the platform (if desired).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-multilib-config.inc | 6 ++++++
 meta/recipes-devtools/gcc/gcc-runtime.inc         | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
index 2dbbc23c940..d9959364c3a 100644
--- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
+++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
@@ -34,6 +34,7 @@ python gcc_multilib_setup() {
                 '%s/aarch64/aarch64-linux.h' % src_conf_dir,
                 '%s/aarch64/aarch64-cores.def' % src_conf_dir,
                 '%s/arm/linux-eabi.h' % src_conf_dir,
+                '%s/riscv/t-linux*' % src_conf_dir,
                 '%s/*/linux.h' % src_conf_dir,
                 '%s/linux.h' % src_conf_dir)
 
@@ -45,6 +46,9 @@ python gcc_multilib_setup() {
             bb.utils.mkdirhier('%s/%s' % (build_conf_dir, parent_dir))
             bb.utils.copyfile(fn, '%s/%s' % (build_conf_dir, rel_path))
 
+    # For now, force the riscv multilib view to our own meaning we can always enable multilib
+    bb.utils.copyfile('%s/riscv/t-linux' % src_conf_dir, '%s/riscv/t-linux-multilib' % build_conf_dir)
+
     pn = d.getVar('PN')
     multilibs = (d.getVar('MULTILIB_VARIANTS') or '').split()
     if not multilibs and pn != "nativesdk-gcc":
@@ -145,6 +149,7 @@ python gcc_multilib_setup() {
         'i686'      : ['gcc/config/i386/t-linux64'],
         'mips'      : ['gcc/config/mips/t-linux64'],
         'mips64'    : ['gcc/config/mips/t-linux64'],
+        'riscv64'     : ['gcc/config/riscv/t-linux-multilib'],
         'powerpc'   : ['gcc/config/rs6000/t-linux64'],
         'powerpc64' : ['gcc/config/rs6000/t-linux64'],
         'aarch64'   : ['gcc/config/aarch64/t-aarch64'],
@@ -161,6 +166,7 @@ python gcc_multilib_setup() {
         'powerpc64' : ['gcc/config/linux.h', 'gcc/config/rs6000/linux64.h'],
         'aarch64'   : ['gcc/config/linux.h', 'gcc/config/aarch64/aarch64-linux.h', 'gcc/config/arm/linux-eabi.h'],
         'arm'       : ['gcc/config/linux.h', 'gcc/config/aarch64/aarch64-linux.h', 'gcc/config/arm/linux-eabi.h'],
+        'riscv64'     : ['gcc/config/linux.h'],
     }
 
     libdir32 = 'SYSTEMLIBS_DIR'
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index afcc13a310c..fe1f43b2fd7 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -144,6 +144,11 @@ do_install:append:class-target () {
 		ln -sf ../${X86ARCH32}${TARGET_VENDOR}-${TARGET_OS} ${D}${includedir}/c++/${BINV}/${TARGET_ARCH}${TARGET_VENDOR}-${TARGET_OS}/32
 	fi
 
+	if [ "${TARGET_ARCH}" = "riscv64" -a "${MULTILIB_VARIANTS}" = "" ]; then
+		mv ${D}${includedir}/c++/${BINV}/${TARGET_SYS}/bits/* ${D}${includedir}/c++/${BINV}/bits
+		mv ${D}${includedir}/c++/${BINV}/${TARGET_SYS}/ext/* ${D}${includedir}/c++/${BINV}/ext
+	fi
+
 	if [ "${TCLIBC}" != "glibc" ]; then
 		case "${TARGET_OS}" in
 			"linux-musl" | "linux-*spe") extra_target_os="linux";;

