Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D01C64EC4
	for <webhook@archiver.kernel.org>; Wed,  8 Mar 2023 19:07:48 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.1885.1678302460493081321
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Mar 2023 11:07:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gMByJrap;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id bw19so16356903wrb.13
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 11:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678302459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1qqnpNgGr69+muv6Ds/YqI2mVdfjuh/LLvbrD8r/3Q=;
        b=gMByJrapsvtxlW6FND0rYtk/Bpcn7Hp2mJUH79kcFh5a5+2a4yh+AXrs2Gq2QyXUAl
         OulKX3kbkA/BhaXQaxl+eS6jxA8+eji5UgBHNUZadYh8x8ZN2PIHiGA8snFqg5b2oaZ4
         31U6VlQO4uOgrs0Ai7JkrsoVsnQLGC2kvy6o3cAevrnTuGuq/Q4/04hJHTiplXR2BNgQ
         vVP/VQuFvItjXZQ0TueEZXKMl5u0YzJtBQWkyPUCOiIoEZVYeElcbiAbypTBrJiOyfAK
         a2gQu62erCN1da9Y480P3vXJVK4eTgHkAFNQaI2W1sGIF4TUu2RvKiRICXloV+BOLDpe
         hQCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678302459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u1qqnpNgGr69+muv6Ds/YqI2mVdfjuh/LLvbrD8r/3Q=;
        b=DTOv0BKKYKoCKbb8eE6VRACRwGSQxzWkaSKAj76zA+vP+BTH82AhCIixlSegLn5Eqs
         vRuvHx9awI8FiUsYON6ifpYtSS8+TCJiNtqS9zfMEH1HRMbDsrWpVgCV54yFgTUO3VBc
         m1tXehx7QMPalit1GAHJUxDgyYJbOpH1anXQkZ2fZlJUzXjp8gJUUxZJP7/PoXLw0Ztv
         Rws96M7sc7OGLIEj2MLNuIl6vQY7zbPIInERmUajUkoa9u72tbzq7fe348ZV4avGYfhO
         vp2PoC3vzApb2lbpjsGZyrVuhcPqawi5JPIH7P6UHJqVJirPs1pXvQX4uOUmWlDhEidS
         lBXw==
X-Gm-Message-State: AO0yUKVXP1zChFoC0Pkr9ne3dhJGX5/lltkYK76HgiIc9v8AZKXfMqvw
	J1Jcz6YU0PH/kyA4VdUFQtlWqMxOcHY=
X-Google-Smtp-Source: AK7set/PBgyARU8Q66o1QeRv4yllJOqi0kn1+0JLmiC0y5g20Rn6uq7uYHcX7f2GjUlcpPyvTOfuQA==
X-Received: by 2002:adf:fb10:0:b0:2c5:4c5e:412b with SMTP id c16-20020adffb10000000b002c54c5e412bmr15642457wrr.23.1678302458979;
        Wed, 08 Mar 2023 11:07:38 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id v9-20020a05600c470900b003db03725e86sm356177wmo.8.2023.03.08.11.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 11:07:38 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [RFC PATCH 5/5] llvm: allow building libllvm in native builds, subject to PACKAGECONFIG
Date: Wed,  8 Mar 2023 20:07:23 +0100
Message-Id: <20230308190723.2570522-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230308190723.2570522-1-alex@linutronix.de>
References: <20230308190723.2570522-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Mar 2023 19:07:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178194

Also, enable that, if opengl is in native DISTRO_FEATURES: this allows
mesa-native to build drivers that rely on libllbm, particularly llvmpipe,
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


