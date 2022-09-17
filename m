Return-Path: <andrey.konovalov@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C3A8C6FA8B
	for <webhook@archiver.kernel.org>; Sat, 17 Sep 2022 11:56:59 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.5148.1663415815375419455
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Sep 2022 04:56:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=TDUm5DmU;
 spf=pass (domain: linaro.org, ip: 209.85.167.44,
 mailfrom: andrey.konovalov@linaro.org)
Received: by mail-lf1-f44.google.com with SMTP id a8so39486992lff.13
        for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Sep 2022 04:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=kJlQN/eVvItWwBRby1UdRoGXU8YvVzuauaefDhBLuEU=;
        b=TDUm5DmUYM2oaBpfGnCd3lECn/1FEwA2Cz9815VpzfSSCunH2WTTZCFQ58Ng0IZOd7
         D8GRfaXxhqHj5EuyeTknIymQ0V+f7rh02Da9Uff9E2a17cvQ0oge1ob2SwI4NIgFsdoY
         KNUPeye0n2X5LB79imukr31otFmr8Z/r6muPW99b/hse9VcvUjYLMp97xf0/TiOxmQ0/
         qfEWRDQSapirDQPRsu9qbIW5DpSML06ZLASPcSuv85DA79L4sS/qWAg5jwM9UR1v+sxl
         25wntl83rqQdJ+MRYFbXdTKFLXY3InOWpSq4WTdS0bqY9AucRpJBSMsuEsAp0CZAA6Mj
         cpGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=kJlQN/eVvItWwBRby1UdRoGXU8YvVzuauaefDhBLuEU=;
        b=38cEcHW1uImXhx+iKOtRd9lvLoaf21nur901IAXgOpZvLTO0qcFUMCpqN2b1ZePldU
         W6KYv57nZWj3wBR8nfuya9n/Eyl5ratf7IpJYjGH+vD1gVdQ7R85L2SxYmv8+6k2mLNa
         DfWQEcvASpGM8n3B1rLVnu2zo30x4PGebp13DrQRt9cUi8jxEWDao1ifDBIb8URu/Zhu
         IiBpf/OvyHW8cxfx9yiAVee8IFmTlB+veGeRpprRHy0U6mcs0QfHOxZxrOi52geEL8wy
         F9pCt5PoQX7Xl9iecUMlJYjh6kSRz4yhD/7gupsGiZ9lhN8QkGxLgqWpgT6jGpHjgZ/C
         iq0g==
X-Gm-Message-State: ACrzQf1L83zfrKrb0JfogNKWdNR0bnxsl5OsSoL3UluMcHG0IC46qUtc
	aIYZQ7wP/HtjUevE1dZjfJXFwce+bMQR9A==
X-Google-Smtp-Source: 
 AMsMyM6aZDUIl5VnF3E53+acF9BPnkqvaMV6A/gEtD390Mzl2FgImBoE50R366R5dShLg+gQ2i/FaA==
X-Received: by 2002:a05:6512:3c8d:b0:49a:d44b:41d with SMTP id
 h13-20020a0565123c8d00b0049ad44b041dmr3129928lfv.690.1663415813751;
        Sat, 17 Sep 2022 04:56:53 -0700 (PDT)
Received: from localhost.localdomain (128-69-252-44.broadband.corbina.ru.
 [128.69.252.44])
        by smtp.googlemail.com with ESMTPSA id
 y24-20020a199158000000b00492c017de43sm4077663lfj.127.2022.09.17.04.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Sep 2022 04:56:53 -0700 (PDT)
From: Andrey Konovalov <andrey.konovalov@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [RFC][PATCH 1/1] mesa: fix building OpenCL programs
Date: Sat, 17 Sep 2022 14:56:42 +0300
Message-Id: <20220917115642.766941-2-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220917115642.766941-1-andrey.konovalov@linaro.org>
References: <20220917115642.766941-1-andrey.konovalov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Sep 2022 11:56:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170828

When building an OpenCL program clover needs to locate opencl-c.h
include file. This include file location is passed via cpp args using
CLANG_RESOURCE_DIR macro. To set CLANG_RESOURCE_DIR value meson currently
uses "$(llvm-config --libdir)" which results in path to sysroot included
into CLANG_RESOURCE_DIR. Then clBuildProgram() fails with
"fatal error: 'opencl-c.h' file not found".

Work this around by using '/usr/lib' instead of the libdir value
exported by LLVM.

Microsoft/Intel CLC should suffer from the same issue, and the similar
workaround should work in this case too.

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 ...-meson.CLANG_RESOURCE_DIR-workaround.patch | 42 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-meson.CLANG_RESOURCE_DIR-workaround.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-meson.CLANG_RESOURCE_DIR-workaround.patch b/meta/recipes-graphics/mesa/files/0001-meson.CLANG_RESOURCE_DIR-workaround.patch
new file mode 100644
index 0000000000..db60fe407f
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-meson.CLANG_RESOURCE_DIR-workaround.patch
@@ -0,0 +1,42 @@
+From: Andrey Konovalov <andrey.konovalov@linaro.org>
+Date: Fri, 16 Sep 2022 16:58:20 +0000
+Subject: [PATCH] CLANG_RESOURCE_DIR workaround
+
+Setting CLANG_RESOURCE_DIR to "$(llvm-config --libdir)something"
+results in clBuildProgram() error when an OpenCL program is being
+built on the target. The reason is that $(llvm-config --libdir) output
+includes path to the sysroot directory.
+
+Work this around by using '/usr/lib' instead of the libdir value
+exported by LLVM.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
+
+---
+
+--- a/src/gallium/frontends/clover/meson.build	2022-09-16 10:24:55.910577158 +0000
++++ b/src/gallium/frontends/clover/meson.build	2022-09-16 10:28:13.112804197 +0000
+@@ -71,8 +71,7 @@ libclllvm = static_library(
+     clover_opencl_cpp_args,
+     clover_spirv_cpp_args,
+     '-DCLANG_RESOURCE_DIR="@0@"'.format(join_paths(
+-      dep_llvm.get_variable(cmake : 'LLVM_LIBRARY_DIR', configtool: 'libdir'), 'clang',
+-      dep_llvm.version(), 'include',
++      '/usr/lib', 'clang', dep_llvm.version(), 'include',
+     )),
+   ],
+   gnu_symbol_visibility : 'hidden',
+--- a/src/compiler/clc/meson.build	2022-09-16 16:40:10.641735401 +0000
++++ b/src/compiler/clc/meson.build	2022-09-16 16:50:18.095700452 +0000
+@@ -39,7 +39,9 @@ files_libclc = files(
+   'clc_helpers.cpp',
+ )
+ 
+-_libclc_cpp_args = ['-DCLANG_RESOURCE_DIR="@0@"'.format(clang_resource_dir)]
++_libclc_cpp_args = ['-DCLANG_RESOURCE_DIR="@0@"'.format(join_paths(
++                       '/usr/lib', 'clang', dep_llvm.version(), 'include'
++                    ))]
+ if with_microsoft_clc
+   _libclc_cpp_args += ['-DUSE_STATIC_OPENCL_C_H=1']
+ endif
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index ea7ed4fd27..0a2fb2150d 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -23,6 +23,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-Revert-egl-wayland-deprecate-drm_handle_format-and-d.patch \
            file://0001-swrast_kms-use-swkmsDRI2Extension-instead-of-driDRI2.patch \
            file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch \
+           file://0001-meson.CLANG_RESOURCE_DIR-workaround.patch \
            "
 
 SRC_URI[sha256sum] = "22ced061eb9adab8ea35368246c1995c09723f3f71653cd5050c5cec376e671a"
-- 
2.25.1


