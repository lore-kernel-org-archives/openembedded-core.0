Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 706E9C4167D
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 07:08:57 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.32124.1699859329625644623
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Nov 2023 23:08:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h9/p+TnZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4083cd3917eso33239225e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Nov 2023 23:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699859328; x=1700464128; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jCFphhQR/Jr2oOulK9uZ9vpK4mUAhyZDsvl36u/KH1Y=;
        b=h9/p+TnZSI3RjXqxXsqCdSM42YQ7HIEvl03iY4WTZaBvxbz5B83u/6sUY9tjjII6PI
         G7u5Oj7XMrSoHn5DyNfYtszwl0Qm5y1GL/D+MRIE1LPmN5TUYfEPKfMhNhsOcoxAa5ES
         6gbXSZQ7vWiXT6XHPKJB/3jVy7K4BZzwkEl9kGbOTyg8SZvilvAD3D+o64/SF3IZ3LVn
         dr3VF8KxH7k7aqKP843pm+D64n9SVL/0xhHVbRvrLXKVoq/zzxJrmex932xLXDy2KBnl
         5jFDjJ/+y7PzOEDyBLZtIPG9axgYhhR8zTwq5jOBvtHdcMQiGm58UM13oREkkxKlwKEC
         GbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699859328; x=1700464128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jCFphhQR/Jr2oOulK9uZ9vpK4mUAhyZDsvl36u/KH1Y=;
        b=MV+UfsFvXUQRkyg9nwvPq9riO4Vk+bx7gEVeh5vGGx7jWriKpPZOT8uq0FJO2Ect6Q
         w3u9FegUxil/Be4wlv/8B4m4PjiD80L2IDyJJeG7JIrQbHN2YCVpZhWodwaOy5a2KJkW
         xUu93eQpW4vVK1wC+AuW9sQW/1AKpe02rAwzwMuHEsNqA4gH7OPrRta58USBdCLkHTRr
         Dj2bagwbDEsbCd/gK5n0CfinIdcgL2Ac7tqTdjl3Ttegi9vVnUDHqK71FbWI5H9OUo1D
         ThNaoDq9s1E9wgVVTMnO7elhZxN3gaCo0Q1RX+mEhnxq/+bteDuqAz9AYrkHun6xQ4KJ
         C55g==
X-Gm-Message-State: AOJu0YzJTnISPb0CbZMcdaUT6Q5IdevOtwkzp8TcOkLiarAvV55FPhXN
	aKnU+ArVBOvL5QST5JwIEnzYspHDnCM=
X-Google-Smtp-Source: AGHT+IFJHUwLFK9HFejkMe5H1u7ZuU3etCg1S9HpxVu0s6rVgtFaO1nFJqVu82nDGgpuNX1mY84a0Q==
X-Received: by 2002:a05:600c:500d:b0:405:7b92:4558 with SMTP id n13-20020a05600c500d00b004057b924558mr4450382wmr.38.1699859327719;
        Sun, 12 Nov 2023 23:08:47 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id u24-20020a05600c00d800b0040a463cf09dsm9337996wmm.33.2023.11.12.23.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 23:08:47 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 2/2] bitbake.conf, ovmf, go-cross-canadian, cargo, libjpeg-turbo, ffmpeg, acpica, perf: drop ${PE} and ${PR} from -f{file,macro,debug}-prefix-map
Date: Mon, 13 Nov 2023 08:08:44 +0100
Message-ID: <20231113070844.5142-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231113070844.5142-1-martin.jansa@gmail.com>
References: <20231113070844.5142-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Nov 2023 07:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190459

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


