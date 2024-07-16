Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 711CAC3DA49
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 09:54:49 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.7122.1721123682031210480
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 02:54:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=NZ9jgCCB;
 spf=pass (domain: linaro.org, ip: 209.85.208.172, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2eeb1ba0481so72813041fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 02:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721123680; x=1721728480; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FeP3aZtb83MpaCYTm/vBl8JXVRnjkV7OdPnvtqTBdyE=;
        b=NZ9jgCCBLyIJ3w07zZ+f8CTljjoogsdS4AVyCURJdCBzfcklr54A5zshzgW+gSSo9H
         cDD4aABZWLhTL96cIue9QmDZVzyGOX2lL724Y1zLkTnO8Sos/8UGvDfTd8kjnqU22iSk
         cHqcuMt35MtnIer2zxhv5dDgUxEEmnmTAfh1MKvvnQeuvymFSs8jyXicmdOPwjqmiMxu
         LAxbrY/b+0aOUbGQqY/Y074aIbZQZpjmJnPbwVdi1LksH0RIqC4xqbRI706DmnsxNXgq
         KbwvX67t/Btv8egk/Svfq6R6LncVN0kce5s2gysgE8lul9ejQDsGaYfbLm1LH5QpW9Nf
         85Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721123680; x=1721728480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FeP3aZtb83MpaCYTm/vBl8JXVRnjkV7OdPnvtqTBdyE=;
        b=XpKZfPalATZReEC9UrwtM9HHRF+A+R4+X8xmOk4/lCsIUMla5g4DtCTPqaKyVUywW7
         H5yIZ/DAd6UwLtpBhmi/pXffKd8emQYhn5ySpnQ168nrye/Fk4TATjR3s0oMuW/KmBOp
         kSTWw8TEX+A3WoAnD7ofX+L5jjl2KRez2gYDui3Ho1MUxqQdj9DpIwkRn+auDtRu6Zpy
         NE3jA1fKIF3rump7NKww/eKx30ZXVjiV1OPW1zT6eg7dtUJR0tCky+A0Nhgn5AasFx3f
         XStsxV3aZz9MZwgl99/JUDeWwYPO68OuQjBrNnDn6uQgcnAYM/WOAj8bdNfMeSSPg+uE
         CBDQ==
X-Gm-Message-State: AOJu0YznO5dwo97OBn2B6jQZQHDUi9rbty+cPbDgw3g/clmCe9WHKluX
	V5QXrU1vTC9ZjbawE7tIdmM8qv9ZSs8Rr4JX0RGiXOvBJ19aEXHfTlqy7KkcBPm+ydqbDy+6Q0+
	9
X-Google-Smtp-Source: AGHT+IFwiNiSlGUtz48cFgVsMK+70XB7dFYc9br/867G2Q8Ex6hV55rGkGL9o7dLBA97jXGEYmpQzA==
X-Received: by 2002:a2e:9cd2:0:b0:2ee:494c:c3d3 with SMTP id 38308e7fff4ca-2eef41eb355mr11047441fa.43.1721123679675;
        Tue, 16 Jul 2024 02:54:39 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2eee179ed5dsm11763181fa.25.2024.07.16.02.54.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 02:54:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3] mesa: fix QA warnings caused by freedreno tools
Date: Tue, 16 Jul 2024 12:54:38 +0300
Message-Id: <20240716095438.209874-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 09:54:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202098

Fix following QA warnings / errors

File /usr/bin/afuc-asm in package mesa-tools contains reference to TMPDIR [buildpaths]
File /usr/bin/afuc-disasm in package mesa-tools contains reference to TMPDIR [buildpaths]

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v2:
 - Reimplemented the patch and submitted it upstream (Richard)

Changes since v1:
 - Added the reason to the Upstream-Status tag.

---
 ...on-t-encode-build-path-into-binaries.patch | 78 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
new file mode 100644
index 000000000000..19e7fe668aa6
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
@@ -0,0 +1,78 @@
+From 027ac36756cc75eea9ed4fee135a351af30b35fd Mon Sep 17 00:00:00 2001
+From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+Date: Tue, 16 Jul 2024 12:32:47 +0300
+Subject: [PATCH] freedreno: don't encode build path into binaries
+
+Encoding build-specific path into installed binaries is generally
+frowned upon. It harms the reproducibility of the build and e.g.
+OpenEmbedded now considers that to be an error.
+
+Instead of hardcoding rnn_src_path into the RNN_DEF_PATH define specify
+it manually when running the tests.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30206]
+Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
+---
+ src/freedreno/afuc/meson.build   | 4 ++++
+ src/freedreno/decode/meson.build | 4 +++-
+ src/freedreno/meson.build        | 2 +-
+ 3 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/src/freedreno/afuc/meson.build b/src/freedreno/afuc/meson.build
+index bb7cebf5a748..351cc31ef2de 100644
+--- a/src/freedreno/afuc/meson.build
++++ b/src/freedreno/afuc/meson.build
+@@ -56,6 +56,7 @@ if with_tests
+   asm_fw = custom_target('afuc_test.fw',
+     output: 'afuc_test.fw',
+     command: [asm, '-g', '6', files('../.gitlab-ci/traces/afuc_test.asm'), '@OUTPUT@'],
++    env: {'RNN_PATH': rnn_src_path},
+   )
+   test('afuc-asm',
+     diff,
+@@ -120,6 +122,7 @@ if cc.sizeof('size_t') > 4
+     disasm_fw = custom_target('afuc_test.asm',
+       output: 'afuc_test.asm',
+       command: [disasm, '-u', files('../.gitlab-ci/reference/afuc_test.fw'), '-g', '630'],
++      env: {'RNN_PATH': rnn_src_path},
+       capture: true
+     )
+     test('afuc-disasm',
+diff --git a/src/freedreno/decode/meson.build b/src/freedreno/decode/meson.build
+index 469eeb4eb597..dfa1c12d0d9f 100644
+--- a/src/freedreno/decode/meson.build
++++ b/src/freedreno/decode/meson.build
+@@ -194,6 +194,7 @@ if dep_lua.found() and dep_libarchive.found()
+       log = custom_target(name + '.log',
+         output: name + '.log',
+         command: [cffdump, '--unit-test', args, files('../.gitlab-ci/traces/' + name + '.rd.gz')],
++        env: {'RNN_PATH': rnn_src_path},
+         capture: true,
+       )
+       test('cffdump-' + name,
+@@ -247,7 +248,8 @@ if with_tests
+       output: name + '.log',
+       command: [crashdec, args, files('../.gitlab-ci/traces/' + name + '.devcore')],
+       capture: true,
+-      env: {'GALLIUM_DUMP_CPU': 'false'},
++      env: {'GALLIUM_DUMP_CPU': 'false',
++            'RNN_PATH': rnn_src_path},
+     )
+ 
+     test('crashdec-' + name,
+diff --git a/src/freedreno/meson.build b/src/freedreno/meson.build
+index 98e49b8fcf0e..145e72597eb9 100644
+--- a/src/freedreno/meson.build
++++ b/src/freedreno/meson.build
+@@ -6,7 +6,7 @@ inc_freedreno_rnn = include_directories('rnn')
+ 
+ rnn_src_path = dir_source_root + '/src/freedreno/registers'
+ rnn_install_path = get_option('datadir') + '/freedreno/registers'
+-rnn_path = rnn_src_path + ':' + get_option('prefix') + '/' + rnn_install_path
++rnn_path = get_option('prefix') + '/' + rnn_install_path
+ 
+ dep_lua = dependency('lua54', 'lua53', 'lua52', 'lua', required: false,
+                      allow_fallback: true, version: '>=5.2')
+-- 
+2.39.2
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index c426e8fddd46..973b76213571 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -20,6 +20,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch \
            file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch \
            file://0001-amd-Include-missing-llvm-IR-header-Module.h.patch \
+           file://0001-freedreno-don-t-encode-build-path-into-binaries.patch\
 "
 
 SRC_URI[sha256sum] = "7454425f1ed4a6f1b5b107e1672b30c88b22ea0efea000ae2c7d96db93f6c26a"
-- 
2.39.2


