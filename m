Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web08.33157.1622390257975245414
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 May 2021 08:57:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Xe3Gq20D;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id q25so7157292pfn.1
        for <openembedded-core@lists.openembedded.org>; Sun, 30 May 2021 08:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZqVPybxm77REfruckcxTTX4x94/NRe8ufXImEu1Qw+0=;
        b=Xe3Gq20DuSPxuPOuhXPKTHBBQaZCr/qYWiPQUtlqNugYwxLyjokHi7oC8DFwePxtJR
         HDLm4G1vm7Z5vs7/DbDz3YRif+I2ahPZfMXsaiDPcF0bFiS4olsw5aNHtxm/71J98G1N
         pQMaEGyn0tVDcyIZ9S/Y5IjviPR/P3ze4zXq0AdRKyNkYkJFlLU06j8mSOYjH9vNeUo/
         yQg7w0kL+JstBfRCw8oWSKV3oKTvMn3OSAlLXLu2IXBCHwL2diPPE87bVsTk1U/bggH9
         T2yRmKY5DDfDdVWyNWjJx/b9hB1K4VI1enmbFaXGrfUEDRgyQuYU7Hr21FumpF7BQHmh
         94NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZqVPybxm77REfruckcxTTX4x94/NRe8ufXImEu1Qw+0=;
        b=hspp/p1XGT+hWLJBOOc1ANyr1zb4jXcueSRLiapLVj4N4glABB6wSof1HFHbOOGg1C
         uHxVKc3HfY4XFLMveXcIrR+MlT7UMTUslE7qriC7W7dhfXjxcfuOrYdx7TDovvv7t7nb
         L/H422x7TL1pZT5QwBhd6RM6dguMZrAt7nNKPXLnfIGfUD7k/+hcOv7FJUSsrOPMZ7TM
         h+JKzmtA6R3TL3VqMITw2398LDNzyiKAdeuA8gqiTJqBhbu5ZrCtxk/RsXql9wRegULa
         T49QsCEmbysVxDpZchttf0p5UQ+2tn5gWs/C/212AAnWwjl6OKeqA4uIPL91GQeJALec
         +MpA==
X-Gm-Message-State: AOAM531ZYJqI79jtE0+3qYhhXxDpwSdIMbHN/iMEIF7hw4u2k68WfRtI
	d+2txwyoe/mLcd5UIYM32gc4R4pNScrqlQ==
X-Google-Smtp-Source: ABdhPJwqc3/1/TogBsMNLB1gM6dcgXVgMcoqmn8DZLxIobT5ynzVwClASlbM7XuVfBp1KZ7L9+hTxg==
X-Received: by 2002:a65:4286:: with SMTP id j6mr18381169pgp.11.1622390257124;
        Sun, 30 May 2021 08:57:37 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id h13sm4026243pfv.213.2021.05.30.08.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 08:57:36 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libucontext: Switch to meson build system
Date: Sun, 30 May 2021 08:57:34 -0700
Message-Id: <20210530155734.3112219-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cross compiling with meson is easier than the plain makefile build
method that libucontext has, there were bunch of problems passing
compiler and make variables, compounded by the fact that makefile
decided on some compiler flags internally and thought that cflags are
synthesized completely in makefile and not passed from environment like
OE is doing. As a result some features were not being compiled in e.g.
function name aliases were missing

meson, on the other hand is cleaner and we have to add a patch to
support cpu architecture on meson cmdline, everything else pretty much
works out of box

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-meson-Add-option-to-pass-cpu.patch   | 49 +++++++++++++++++++
 meta/recipes-core/musl/libucontext_git.bb     | 18 ++-----
 2 files changed, 53 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-core/musl/libucontext/0001-meson-Add-option-to-pass-cpu.patch

diff --git a/meta/recipes-core/musl/libucontext/0001-meson-Add-option-to-pass-cpu.patch b/meta/recipes-core/musl/libucontext/0001-meson-Add-option-to-pass-cpu.patch
new file mode 100644
index 0000000000..1fdc9f739d
--- /dev/null
+++ b/meta/recipes-core/musl/libucontext/0001-meson-Add-option-to-pass-cpu.patch
@@ -0,0 +1,49 @@
+From a530eed9e7e6872e10fe92efaf1e9739471c30ca Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 30 May 2021 08:30:28 -0700
+Subject: [PATCH] meson: Add option to pass cpu
+
+This helps with cross compile setups, where host_cpu != target_cpu
+therefore detecting it on the fly will end up with wrong cpu to build
+for
+
+Upstream-Status: Submitted [https://github.com/kaniini/libucontext/pull/28]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ meson.build       | 6 +++++-
+ meson_options.txt | 4 +++-
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index e863780..2b4bdbd 100644
+--- a/meson.build
++++ b/meson.build
+@@ -6,7 +6,11 @@ project(
+   version : run_command('head', files('VERSION')).stdout()
+ )
+ 
+-cpu = host_machine.cpu_family()
++cpu = get_option('cpu')
++if cpu == ''
++  cpu = host_machine.cpu_family()
++endif
++
+ if cpu == 'sh4'
+   cpu = 'sh'
+ endif
+diff --git a/meson_options.txt b/meson_options.txt
+index d4201d1..864d83c 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -1,4 +1,6 @@
+ option('freestanding', type : 'boolean', value : false,
+        description: 'Do not use system headers')
+ option('export_unprefixed', type : 'boolean', value : true,
+-       description: 'Export POSIX 2004 ucontext names as alises')
+\ No newline at end of file
++       description: 'Export POSIX 2004 ucontext names as alises')
++option('cpu', type : 'string', value : '',
++       description: 'Target CPU architecture for cross compile')
+-- 
+2.31.1
+
diff --git a/meta/recipes-core/musl/libucontext_git.bb b/meta/recipes-core/musl/libucontext_git.bb
index 0b64867ce0..d8ae8242c5 100644
--- a/meta/recipes-core/musl/libucontext_git.bb
+++ b/meta/recipes-core/musl/libucontext_git.bb
@@ -11,7 +11,8 @@ DEPENDS = ""
 PV = "1.1+${SRCPV}"
 SRCREV = "335ee864ef6f4a5d4b525453fd9dbfb3507cfecc"
 SRC_URI = "git://github.com/kaniini/libucontext \
-"
+           file://0001-meson-Add-option-to-pass-cpu.patch \
+           "
 
 S = "${WORKDIR}/git"
 
@@ -49,16 +50,5 @@ def map_kernel_arch(a, d):
             return a
         bb.error("cannot map '%s' to a linux kernel architecture" % a)
 
-export ARCH = "${@map_kernel_arch(d.getVar('TARGET_ARCH'), d)}"
-
-CFLAGS += "-Iarch/${ARCH} -Iarch/common"
-
-EXTRA_OEMAKE = "CFLAGS='${CFLAGS}' LDFLAGS='${LDFLAGS}' LIBDIR='${base_libdir}'"
-
-do_compile() {
-    oe_runmake ARCH=${ARCH}
-}
-
-do_install() {
-    oe_runmake ARCH="${ARCH}" DESTDIR="${D}" install
-}
+EXTRA_OEMESON = "-Dcpu=${@map_kernel_arch(d.getVar('TARGET_ARCH'), d)}"
+inherit meson
-- 
2.31.1

