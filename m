Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C368C4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 07:25:37 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.32248.1699860330739093171
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Nov 2023 23:25:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e7rwICLh;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40790b0a224so32157275e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Nov 2023 23:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699860329; x=1700465129; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t/f16sEUvmltkl3WVE2BBtYr4r7YcVp6pdLVsJTTjHk=;
        b=e7rwICLhHTgRIh8e24XbxCBLg5zIc5fnXcs1GC8OfEavepTrcOO8uHkwPcgPkstac1
         hMr0SyN3MEkRAoWMosoMmb+FucTy4O7O4Isn9hqi5DqqkQWobrJ6WPoWJWwIqjFAoDZP
         SIGTOcDL1u2Lk+/vX+nyOTEid6xfki3OX+5nUvLx56GvrYpYRxD4KNTQaxRbpIA/sT4T
         947llughcv+ErflEK95mkI0lCRjXLLXB8rgN2x+a1Cl9alsY9kXxWyYXsgulAC/6UhrA
         BFIAhqUQh+wkKQnuN4a1ewPsLlONM2fTbu3nLicTZdqAPtn52vkp1HCrSW87UcKfS7nF
         ZR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699860329; x=1700465129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t/f16sEUvmltkl3WVE2BBtYr4r7YcVp6pdLVsJTTjHk=;
        b=nw86NDZSs1Dv9E2TFaKVuy+k633u0qXT2jaZ09ZioDIZ4W2eMPZyZR08VwNPyq/qCV
         NFb4tgtFSr2KJ9NpvVQsQ/7gDDwX7MLkltNGNLOShn0dkT8sDS4Zt313s5+fIU9nXGEV
         hV2EBYPd/YZeA4HNXsSLhQ8gNiW77lFofF358NUrPnnzrqnZlkN/+6sosE78hGQSipOG
         vSl3LWksU1nnM66rfdVbWiFy0yLCeh9OwdQzgBnIyix4iYYrO5B01uhsXM/taZFkB7ho
         y5E+fx+s4vHAvK3LCDBfwhvDPzifFcXWTg7AJ9B9TWDAb2WCH5VP2CMa0bcOAxePH1CM
         AegQ==
X-Gm-Message-State: AOJu0Ywbd43HPx9bXYGO1sg1D/VK1MFcKdgnNz+yVi5bE/Z5Fc+AcDfR
	qmHrndzU2Vl15jpwOyU6kUtb85Yy7HI=
X-Google-Smtp-Source: AGHT+IE5j8cjVVgdngIm5r2jIR4rVRbxnjXZ91F9RdIZu+HiyR1JRg5lC9DVmWMMiCHj8YtNJl7gMw==
X-Received: by 2002:a05:600c:3b13:b0:40a:4c7e:6f37 with SMTP id m19-20020a05600c3b1300b0040a4c7e6f37mr4110190wms.20.1699860328851;
        Sun, 12 Nov 2023 23:25:28 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id he9-20020a05600c540900b0040a48430837sm8631342wmb.13.2023.11.12.23.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 23:25:28 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCHv2] bitbake.conf: drop ${PE} and ${PR} from -f{file,macro,debug}-prefix-map
Date: Mon, 13 Nov 2023 08:25:24 +0100
Message-ID: <20231113072524.119148-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Nov 2023 07:25:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190461

* ${EXTENDPE} and ${PR} was already dropped from ${WORKDIR} in:
  https://lists.openembedded.org/g/openembedded-core/message/185818
  adjust -fmacro-prefix-map and -fdebug-prefix-map similarly.
  As we don't depend on PR in WORKDIR maybe we don't need it in
  /usr/src/debug paths as well anymore.

* The interesting side-effect of this is that for DISTROs which still
  use PR (e.g. webOS OSE), the difference in -fdebug-prefix-map causes
  all binaries to be slightly different when rebuilt with different PR
  (due to this path, even when otherwise they are binary reproducible)
  and when the number of digits in PR changes (e.g. from r9 to r10) it
  also results in slightly bigger binaries (and more unnecessary changes
  in buildhistory diffs).

  For example this foo binary, the difference between "new" and "old" is
  extra patch applied in SRC_URI (which doesn't affect the foo binary,
  but was the reason for PR bump).

  And the binary is bigger with r10, identical with r6 and slightly
  different due to debug-prefix-map between r6 and r7:

  $ ls -la 1.0.0-175-*/image/usr/sbin/foo
  -rwxr-xr-x 1 bitbake bitbake 30182460 Nov  8 08:29 1.0.0-175-new-r10/image/usr/sbin/foo
  -rwxr-xr-x 1 bitbake bitbake 30182224 Nov  8 08:02 1.0.0-175-new-r6/image/usr/sbin/foo
  -rwxr-xr-x 1 bitbake bitbake 30182224 Nov  8 07:49 1.0.0-175-new-r7/image/usr/sbin/foo
  -rwxr-xr-x 1 bitbake bitbake 30182224 Nov  8 07:39 1.0.0-175-old-r6/image/usr/sbin/foo

  $ md5sum 1.0.0-175-*/image/usr/sbin/foo
  8e3ab67d596f8cc2f9c6320dab10af01  1.0.0-175-new-r10/image/usr/sbin/foo
  f6ff1e64fe6affb9ba0d8f278cf7ed79  1.0.0-175-new-r6/image/usr/sbin/foo
  6469a0b10aac233911e63c5ea97b03c0  1.0.0-175-new-r7/image/usr/sbin/foo
  f6ff1e64fe6affb9ba0d8f278cf7ed79  1.0.0-175-old-r6/image/usr/sbin/foo

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
v2: shorten to summary to fix:
FAIL: test shortlog length: Edit shortlog so that it is 90 characters or less (currently 140 characters) (test_mbox.TestMbox.test_shortlog_length)

 meta/conf/bitbake.conf                            | 8 ++++----
 meta/recipes-core/ovmf/ovmf_git.bb                | 2 +-
 meta/recipes-devtools/go/go-cross-canadian.inc    | 2 +-
 meta/recipes-devtools/rust/cargo_1.70.0.bb        | 2 +-
 meta/recipes-extended/acpica/acpica_20230628.bb   | 2 +-
 meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb | 2 +-
 meta/recipes-kernel/perf/perf.bb                  | 2 +-
 meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb      | 2 +-
 8 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 67ff769046..3836a389b8 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -648,10 +648,10 @@ EXTRA_OEMAKE:prepend:task-install = "${PARALLEL_MAKEINST} "
 ##################################################################
 # Beware: applied last to first
 DEBUG_PREFIX_MAP ?= "-fcanon-prefix-map \
- -fmacro-prefix-map=${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
- -fdebug-prefix-map=${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
- -fmacro-prefix-map=${B}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
- -fdebug-prefix-map=${B}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
+ -fmacro-prefix-map=${S}=/usr/src/debug/${PN}/${PV} \
+ -fdebug-prefix-map=${S}=/usr/src/debug/${PN}/${PV} \
+ -fmacro-prefix-map=${B}=/usr/src/debug/${PN}/${PV} \
+ -fdebug-prefix-map=${B}=/usr/src/debug/${PN}/${PV} \
  -fdebug-prefix-map=${STAGING_DIR_HOST}= \
  -fmacro-prefix-map=${STAGING_DIR_HOST}= \
  -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 6bbe21ac5c..bf67a2a4a8 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -122,7 +122,7 @@ fix_toolchain:append:class-native() {
 # --debug-prefix-map to nasm (we carry a patch to nasm for this). The
 # tools definitions are built by ovmf-native so we need to pass this in
 # at target build time when we know the right values.
-export NASM_PREFIX_MAP = "--debug-prefix-map=${WORKDIR}=/usr/src/debug/ovmf/${EXTENDPE}${PV}-${PR}"
+export NASM_PREFIX_MAP = "--debug-prefix-map=${WORKDIR}=/usr/src/debug/ovmf/${PV}"
 export GCC_PREFIX_MAP = "${DEBUG_PREFIX_MAP} -Wno-stringop-overflow -Wno-maybe-uninitialized"
 
 GCC_VER="$(${CC} -v 2>&1 | tail -n1 | awk '{print $3}')"
diff --git a/meta/recipes-devtools/go/go-cross-canadian.inc b/meta/recipes-devtools/go/go-cross-canadian.inc
index 45758f3361..0a72e89bbd 100644
--- a/meta/recipes-devtools/go/go-cross-canadian.inc
+++ b/meta/recipes-devtools/go/go-cross-canadian.inc
@@ -8,7 +8,7 @@ PN = "go-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 # it uses gcc on build machine during go-cross-canadian bootstrap, but
 # the gcc version may be old and not support option '-fmacro-prefix-map'
 # which is one of default values of DEBUG_PREFIX_MAP
-DEBUG_PREFIX_MAP = "-fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
+DEBUG_PREFIX_MAP = "-fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${PV} \
                     -fdebug-prefix-map=${STAGING_DIR_HOST}= \
                     -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
                     "
diff --git a/meta/recipes-devtools/rust/cargo_1.70.0.bb b/meta/recipes-devtools/rust/cargo_1.70.0.bb
index a5c1064106..9a23ba9d5f 100644
--- a/meta/recipes-devtools/rust/cargo_1.70.0.bb
+++ b/meta/recipes-devtools/rust/cargo_1.70.0.bb
@@ -19,7 +19,7 @@ CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
 
 inherit cargo pkgconfig
 
-DEBUG_PREFIX_MAP += "-fdebug-prefix-map=${RUSTSRC}/vendor=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
+DEBUG_PREFIX_MAP += "-fdebug-prefix-map=${RUSTSRC}/vendor=/usr/src/debug/${PN}/${PV}"
 
 do_cargo_setup_snapshot () {
 	${WORKDIR}/rust-snapshot-components/${CARGO_SNAPSHOT}/install.sh --prefix="${WORKDIR}/${CARGO_SNAPSHOT}" --disable-ldconfig
diff --git a/meta/recipes-extended/acpica/acpica_20230628.bb b/meta/recipes-extended/acpica/acpica_20230628.bb
index b7921516a2..8ca1f0892f 100644
--- a/meta/recipes-extended/acpica/acpica_20230628.bb
+++ b/meta/recipes-extended/acpica/acpica_20230628.bb
@@ -36,7 +36,7 @@ EXTRA_OEMAKE = "CC='${CC}' \
                 INSTALLDIR=${bindir} \
                 INSTALLFLAGS= \
                 YACC=bison \
-                YFLAGS='-y --file-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}' \
+                YFLAGS='-y --file-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${PV}' \
                 "
 
 do_install() {
diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
index 99ed82dac4..ca1910966e 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb
@@ -24,7 +24,7 @@ RCONFLICTS:${PN} += "jpeg"
 
 inherit cmake pkgconfig
 
-export NASMENV = "--reproducible --debug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
+export NASMENV = "--reproducible --debug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${PV}"
 
 # Add nasm-native dependency consistently for all build arches is hard
 EXTRA_OECMAKE:append:class-native = " -DWITH_SIMD=False"
diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index a90acd55ef..dee8b50b31 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -98,7 +98,7 @@ EXTRA_OEMAKE = '\
     AR="${AR}" \
     LD="${LD}" \
     EXTRA_CFLAGS="-ldw -I${S}" \
-    YFLAGS='-y --file-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}' \
+    YFLAGS='-y --file-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${PV}' \
     EXTRA_LDFLAGS="${PERF_EXTRA_LDFLAGS}" \
     perfexecdir=${libexecdir} \
     NO_GTK2=1 \
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
index e65f80d64b..0ad2f80217 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
@@ -151,7 +151,7 @@ do_configure() {
     export TMPDIR="${B}/tmp"
     mkdir -p ${B}/tmp
     ${S}/configure ${EXTRA_OECONF}
-    sed -i -e "s,^X86ASMFLAGS=.*,& --debug-prefix-map=${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} --debug-prefix-map=${B}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR},g" ${B}/ffbuild/config.mak
+    sed -i -e "s,^X86ASMFLAGS=.*,& --debug-prefix-map=${S}=/usr/src/debug/${PN}/${PV} --debug-prefix-map=${B}=/usr/src/debug/${PN}/${PV},g" ${B}/ffbuild/config.mak
 }
 
 # patch out build host paths for reproducibility
-- 
2.42.1


