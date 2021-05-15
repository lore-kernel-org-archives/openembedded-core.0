Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.7425.1621093525320819259
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 08:45:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=a5gPKcdX;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id m13so1799203qtk.13
        for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 08:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4x1Bw2+6o+qmzYTDW0IiyMgXA1CAVUFY2ztwDYtxO3w=;
        b=a5gPKcdXUEAul9RsnkDBcQFQJEAtBSK5VIYGHoMqEbulA+4Jm1aWHndAqKXS+AJ5KV
         atMlNY/b4yeAZrIqueMrFalg6Z/1AxtB5BUu92LxrBIs8mQHkCVuXwG3ZHeTxZnajAuX
         910SrCe/BHmtHxfbTd9N/o+RMPQCUC/Z4KxkkbzetYSlEV9WYAe/iv1scb3fjBrP2zB0
         WpjeZKrmBHMfWOn3ccaDnYcfSl+wyPW+iMd8jjZkjHl82hh/BoyRIpDJ1vDOJIsugSpp
         DUk+7s51Bao7NnJxPH/pCH2QD8K224DblLMxD0PNtVCji3Sjd7XT+hICxyDh7CGFNYZ4
         lZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4x1Bw2+6o+qmzYTDW0IiyMgXA1CAVUFY2ztwDYtxO3w=;
        b=rCpORv1A3iLcnDnpQpjAI46uvKhN3jnIwOPboKJsPXuxgo59fwrFjYNzF8tEtTV5Eh
         SHG1UuKE8qcztolrs+aaaJ7nEWxALQnS3XRPz7wJxg/wsgb5bCwvSBfDDiUxVEIbVy4R
         CgenlFfGmZ3OseTJ7dsII6s6DNX7ocqmhe70zOkKfk6E0DZHY7KKKzZNKZT03T0wjPKi
         T7m37KF/dIqbF55ILVxa4FVqipt2Fs/4bCjT1h1jrnBsGiY+hgZdG5Di7U09LdXOzMwD
         PMuZdGEL5bvRu34JBt64VexaJ9F0jpiTyDE4aS2gXGWFbG+JmGvlZj72EDOcFOFgTkuQ
         tEfA==
X-Gm-Message-State: AOAM533rsdkZJ5PBl79vRhqTzLAh8TsEP6p3ypH1BGQR5RdErdfJCrjD
	j0L9liL7zteAVA071vEDcuk=
X-Google-Smtp-Source: ABdhPJy4qWmYrnLh53kgHUqMmO4U094nDXzfyQsUnvLAeI8jeEjGd3xC5gYAVso3YsUg6UQ4dV0PFA==
X-Received: by 2002:ac8:4e3a:: with SMTP id d26mr10533402qtw.32.1621093524302;
        Sat, 15 May 2021 08:45:24 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id m22sm6841125qkk.65.2021.05.15.08.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 08:45:23 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] lttng-modules: update devupstream to v2.13-rc
Date: Sat, 15 May 2021 11:45:21 -0400
Message-Id: <20210515154521.30312-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

To support builds against v5.13+ kernels, bumping the devupstream
to 2.13 and the 2.13-rc series.

Along with the SRCREV update, a port of the existing CONFIG_TRACEPOINTS
patch from the main Makefile to src/Kbuild is done.

The LICENSE file was part of commit [Cleanup: Move headers from toplevel
to include/lttng/], so we adjust the checksum to the new fie contents.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...e-missing-CONFIG_TRACEPOINTS-to-warn.patch | 37 +++++++++++++++++++
 .../lttng/lttng-modules_2.12.5.bb             | 10 ++---
 2 files changed, 42 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch
new file mode 100644
index 0000000000..6d81c81efe
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch
@@ -0,0 +1,37 @@
+From 0287f5c32b9fd99078e71c22ca679343d18f1513 Mon Sep 17 00:00:00 2001
+From: Bruce Ashfield <bruce.ashfield@gmail.com>
+Date: Sat, 15 May 2021 10:26:38 -0400
+Subject: [PATCH] src/Kbuild: change missing CONFIG_TRACEPOINTS to warning
+
+Taken from a previous patch to the main lttng-modules Makefile, by
+Otavio Salvador:
+
+  The lttng-modules are being pulled by the tools-profile image feature,
+  however, not every kernel has the CONFIG_TRACEPOINTS feature enabled.
+
+  This change makes the build do not fail when CONFIG_TRACEPOINTS is not
+  available, allowing it to be kept being pulled by default.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
+---
+ src/Kbuild | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Kbuild b/src/Kbuild
+index 7137874f..18a43b50 100644
+--- a/src/Kbuild
++++ b/src/Kbuild
+@@ -2,7 +2,7 @@
+ 
+ ifdef CONFIG_LOCALVERSION	# Check if dot-config is included.
+   ifeq ($(CONFIG_TRACEPOINTS),)
+-    $(error The option CONFIG_TRACEPOINTS needs to be enabled in your kernel configuration)
++    $(warning The option CONFIG_TRACEPOINTS needs to be enabled in your kernel configuration)
+   endif # CONFIG_TRACEPOINTS
+ endif # ifdef CONFIG_LOCALVERSION
+ 
+-- 
+2.19.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.12.5.bb b/meta/recipes-kernel/lttng/lttng-modules_2.12.5.bb
index 1a01cb0c01..c5efbb061a 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.12.5.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.12.5.bb
@@ -37,13 +37,13 @@ python do_package_prepend() {
 }
 
 BBCLASSEXTEND = "devupstream:target"
-LIC_FILES_CHKSUM_class-devupstream = "file://LICENSE;md5=3f882d431dc0f32f1f44c0707aa41128"
+LIC_FILES_CHKSUM_class-devupstream = "file://LICENSE;md5=0464cff101a009c403cd2ed65d01d4c4"
 DEFAULT_PREFERENCE_class-devupstream = "-1"
-SRC_URI_class-devupstream = "git://git.lttng.org/lttng-modules;branch=stable-2.12 \
-           file://Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch \
+SRC_URI_class-devupstream = "git://git.lttng.org/lttng-modules;branch=stable-2.13 \
+           file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch \
            "
 
-SRCREV_class-devupstream = "92cc3e7f76a545a2cd4828576971f1eea83f4e68"
-PV_class-devupstream = "2.12.5+git${SRCPV}"
+SRCREV_class-devupstream = "f982b51a98a29cb4aaf607cb9bbf2b509d8e6933"
+PV_class-devupstream = "2.13.0-rc2+git${SRCPV}"
 S_class-devupstream = "${WORKDIR}/git"
 SRCREV_FORMAT ?= "lttng_git"
-- 
2.19.1

