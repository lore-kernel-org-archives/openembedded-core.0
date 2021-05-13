Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web08.158.1620939407477544473
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 13:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m6+1BHPy;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id di13so32453672edb.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 May 2021 13:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cBTGltpdIz69W1JqfMg4qyCLPHxNw8EK51yXdgTjYy4=;
        b=m6+1BHPypbm4RWGeMXPAF7adUaUyM2eWGaLgx/dWT2j6yO9upq2IAyC0l/W21gjOeu
         HYFt3UuUxN8fsXh+pSOiDULQzh9qMqY+YyPFrC/3eCPTuRAg6LEK1ocuNkvZvQMjgpPK
         4oCLD8feRCTouFBJ/3NIwaXWMtZ8SHxkYooDLh0L/QVT3Q7rSPF2VSA2uqNNrcXc6+0Y
         bc4NxJ159Ad+/+mKig5QGWCaXou7NtG7O0xTLSsE3KRTpZ2o0M0rI2pP5RyA+cQCrQYi
         /dXgU9LK1rXBXNexRDWazC4zFCxhHsBjyyohWjWzMnsiSz17VT3TNBXkWjZGANwfsbHN
         dlsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cBTGltpdIz69W1JqfMg4qyCLPHxNw8EK51yXdgTjYy4=;
        b=SQ6pgTWQWNGjA0nvjs/9f/PA9snDZOJzLOrMtKRRYvRQR4eeN/6L8JtFWObtxWeRGh
         FO607ET/gm0uaV1LpJmKjEvjSLucUsDZd0VrR/4ajZlGfhtIYhPCh9d8dwqF7r91kGa3
         D6rRPbX6GoYpTicxagcGNACEreYbzRWPJclY9rGtpiLxk6VVJl9kLbjpgJQMzM0uuMlu
         UzvGO7I667ToHugO0ycnu+JjJe8BFbQb6twvCogxNh6svCu2fYLzzKVO7HJrRojEfhc9
         7lprhyKTlToB1mz692sX1JcwligPB1rkLDRgWkjh7wYl58q8BhIehGe8pr+3TupppeIs
         DhqA==
X-Gm-Message-State: AOAM531KGoGkoakIUmeNpEKOsJB0Zy5UU0a2UXOCiHnkvMce952qHAZT
	HSHzhRmlGBltzIx+m7bnyMzi6pYCaic=
X-Google-Smtp-Source: ABdhPJwSSIYaa6a0U7wolOGWWIJ/vK+9zCQst8HeC+h0QvmlElzjLogEVcX5S0bk8jgMM6YWNEpGzA==
X-Received: by 2002:a05:6402:2712:: with SMTP id y18mr54640814edd.41.1620939406080;
        Thu, 13 May 2021 13:56:46 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm2934768edd.91.2021.05.13.13.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 13:56:45 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 8/8] qemu: backport a patch to fix meson 0.58 builds
Date: Thu, 13 May 2021 22:56:22 +0200
Message-Id: <20210513205622.60879-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210513205622.60879-1-alex.kanavin@gmail.com>
References: <20210513205622.60879-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 ...igure-fix-detection-of-gdbus-codegen.patch | 53 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/0001-configure-fix-detection-of-gdbus-codegen.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 82d1cb5566..74c53c6309 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -57,6 +57,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-27821.patch \
            file://CVE-2021-20263.patch \
            file://CVE-2021-3392.patch \
+           file://0001-configure-fix-detection-of-gdbus-codegen.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-configure-fix-detection-of-gdbus-codegen.patch b/meta/recipes-devtools/qemu/qemu/0001-configure-fix-detection-of-gdbus-codegen.patch
new file mode 100644
index 0000000000..1f20077883
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/0001-configure-fix-detection-of-gdbus-codegen.patch
@@ -0,0 +1,53 @@
+From 464cfc64201b21386030b8f353fe9724a3413a85 Mon Sep 17 00:00:00 2001
+From: Paolo Bonzini <pbonzini@redhat.com>
+Date: Wed, 5 May 2021 10:15:34 -0400
+Subject: [PATCH] configure: fix detection of gdbus-codegen
+
+"pkg-config --variable=gdbus_codegen gio-2.0" returns "gdbus-codegen",
+and it does not pass test -x (which does not walk the path).
+
+Meson 0.58.0 notices that something is iffy, as the dbus_vmstate1
+assignment in tests/qtest/meson.build uses an empty string as the
+command, and fails very eloquently:
+
+../tests/qtest/meson.build:92:2: ERROR: No program name specified.
+
+Use the "has" function instead of test -x, and fix the generation
+of config-host.mak since meson.build expects that GDBUS_CODEGEN
+is absent, rather than empty, if the tool is unavailable.
+
+Reported-by: Sebastian Mitterle <smitterl@redhat.com>
+Fixes: #178
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commitdiff;h=5ecfb76ccc056eb6127e44268e475827ae73b9e0]
+(not in 6.0.0, should be kept when upgrading)
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ configure | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index 18c26e0389..4c36e221d3 100755
+--- a/configure
++++ b/configure
+@@ -3496,7 +3496,7 @@ if $pkg_config --atleast-version=$glib_req_ver gio-2.0; then
+     gio_cflags=$($pkg_config --cflags gio-2.0)
+     gio_libs=$($pkg_config --libs gio-2.0)
+     gdbus_codegen=$($pkg_config --variable=gdbus_codegen gio-2.0)
+-    if [ ! -x "$gdbus_codegen" ]; then
++    if ! has "$gdbus_codegen"; then
+         gdbus_codegen=
+     fi
+     # Check that the libraries actually work -- Ubuntu 18.04 ships
+@@ -6172,6 +6172,8 @@ if test "$gio" = "yes" ; then
+     echo "CONFIG_GIO=y" >> $config_host_mak
+     echo "GIO_CFLAGS=$gio_cflags" >> $config_host_mak
+     echo "GIO_LIBS=$gio_libs" >> $config_host_mak
++fi
++if test "$gdbus_codegen" != "" ; then
+     echo "GDBUS_CODEGEN=$gdbus_codegen" >> $config_host_mak
+ fi
+ echo "CONFIG_TLS_PRIORITY=\"$tls_priority\"" >> $config_host_mak
+-- 
+2.24.0
+
-- 
2.31.1

