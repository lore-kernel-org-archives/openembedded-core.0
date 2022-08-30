Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A52FAECAAD1
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 16:47:35 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web09.14248.1661878052432656655
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 09:47:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LgLekbPP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id
 v7-20020a1cac07000000b003a6062a4f81so10289753wme.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Aug 2022 09:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc;
        bh=dN2Cw7iWA8JV9HCUUl0mzZk2wi1Yu3Cv84FkypC9qCw=;
        b=LgLekbPP3cKUFFzWl/Jnv1F/2Ge3ToF665r/Z0j/lsB6mrdS9WvBPLiUxb7i1laeNP
         C6QhtYYPjMTIbH2dspt1L+IoD3aqgVX4cnP0qxOqQEjE7ICBeUIRr79loK+eyysdbvNE
         23ElhyRszMHPD0pi4EYAsNpk92cSCq/X4LUcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc;
        bh=dN2Cw7iWA8JV9HCUUl0mzZk2wi1Yu3Cv84FkypC9qCw=;
        b=mQV86tkMZfNCgoCpaKM5LI9/RoNaaqPfjeBI66txIp3pxo6qWYkyBvOGiiuiMfbMm+
         BqTj57vz31zCKf5KPuj3fJ6AsoZJ53wHGj+JSzrwsTZsHOgpImbKrZUGxebWT9/xUzwZ
         HyoYCVTDJgqlG6LlOy6rAWo3H+jQS9DJkECHjSsv7+518yiSwMaQ1AUHLCqTje/0NbMJ
         x8WjyhhtVceL+Q2MpAZFqS2qqB5WMINeX5MVtw0FkOdpGjfPmj3Oblf7EZ9qGxH+G76E
         8gX42RrSFnJo+3q78B9Wwq+SmIPp1qxOp3O+bolPdCoBbtEO0bd0uopxHzKIor6Zb98T
         jw6Q==
X-Gm-Message-State: ACgBeo3VoBnXzE3bxEs42ItvGHayHwk3utIUaYpFW9e20+0CTY9Af4MX
	nNiX1boKEw+4U1zxRHlzi73SL9vdFihAqg==
X-Google-Smtp-Source: 
 AA6agR5fyGvZ86GIjQC4+xMv0GziHiWMfpM8Z5HuIbO8A/E/8GMRGXwy1BI2mtADcgLneIfgGbA1xg==
X-Received: by 2002:a7b:cd0f:0:b0:3a5:ec59:daf0 with SMTP id
 f15-20020a7bcd0f000000b003a5ec59daf0mr10171105wmj.13.1661878050185;
        Tue, 30 Aug 2022 09:47:30 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5ba6:cf0e:f253:2cdf])
        by smtp.gmail.com with ESMTPSA id
 n16-20020a5d4850000000b0022546f469e1sm9848651wrs.28.2022.08.30.09.47.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 09:47:29 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] llvm: Add llvm-config wrapper to improve flags handling
Date: Tue, 30 Aug 2022 17:47:27 +0100
Message-Id: <20220830164728.124219-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 16:47:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170078

Add a wrapper for llvm-config which provides flags from the current envrionment
instead of the values hardcoded into llvm-native at compile time. Inspiration
taken from the wrapper in meta-clang but I had to totally rewrite it as:

* the TARGET_* prefixes weren't in our environment
* meson uses --libs --ldflags XXX which didn't work

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/llvm/llvm/llvm-config | 42 +++++++++++++++++++++
 meta/recipes-devtools/llvm/llvm_git.bb      | 10 +++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/llvm/llvm/llvm-config

diff --git a/meta/recipes-devtools/llvm/llvm/llvm-config b/meta/recipes-devtools/llvm/llvm/llvm-config
new file mode 100644
index 00000000000..a45f38c650a
--- /dev/null
+++ b/meta/recipes-devtools/llvm/llvm/llvm-config
@@ -0,0 +1,42 @@
+#!/bin/bash
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+# Wrap llvm-config since the native llvm-config will remap some values correctly
+# if placed in the target sysroot but for flags, it would provide the native ones.
+# Provide ours from the environment instead.
+
+NEXT_LLVM_CONFIG="$(which -a llvm-config | sed -n 2p)"
+if [[ $# == 0 ]]; then
+  exec "$NEXT_LLVM_CONFIG"
+fi
+
+remain=""
+output=""
+for arg in "$@"; do
+  case "$arg" in
+    --cppflags)
+      output="${output} ${CPPFLAGS}"
+      ;;
+    --cflags)
+      output="${output} ${CFLAGS}"
+      ;;
+    --cxxflags)
+      output="${output} ${CXXFLAGS}"
+      ;;
+    --ldflags)
+      output="${output} ${LDFLAGS}"
+      ;;
+    *)
+      remain="${remain} ${arg}"
+      ;;
+  esac
+done
+
+if [ "${remain}" != "" ]; then
+      output="${output} "$("$NEXT_LLVM_CONFIG" ${remain})
+fi
+
+echo "${output}"
diff --git a/meta/recipes-devtools/llvm/llvm_git.bb b/meta/recipes-devtools/llvm/llvm_git.bb
index bdea95db96e..4c7fadb667c 100644
--- a/meta/recipes-devtools/llvm/llvm_git.bb
+++ b/meta/recipes-devtools/llvm/llvm_git.bb
@@ -31,6 +31,7 @@ SRC_URI = "git://github.com/llvm/llvm-project.git;branch=${BRANCH};protocol=http
            file://0006-llvm-TargetLibraryInfo-Undefine-libc-functions-if-th.patch;striplevel=2 \
            file://0007-llvm-allow-env-override-of-exe-path.patch;striplevel=2 \
            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch;striplevel=2 \
+           file://llvm-config \
            "
 
 UPSTREAM_CHECK_GITTAGREGEX = "llvmorg-(?P<pver>\d+(\.\d+)+)"
@@ -124,6 +125,15 @@ do_install() {
 do_install:class-native() {
 	install -D -m 0755 ${B}/bin/llvm-tblgen ${D}${bindir}/llvm-tblgen${PV}
 	install -D -m 0755 ${B}/bin/llvm-config ${D}${bindir}/llvm-config${PV}
+	ln -sf llvm-config${PV} ${D}${bindir}/llvm-config
+}
+
+SYSROOT_PREPROCESS_FUNCS:append:class-target = " llvm_sysroot_preprocess"
+
+llvm_sysroot_preprocess() {
+	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+	install -m 0755 ${WORKDIR}/llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+	ln -sf llvm-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/llvm-config${PV}
 }
 
 PACKAGES =+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-libllvm ${PN}-liboptremarks ${PN}-liblto"
-- 
2.34.1


