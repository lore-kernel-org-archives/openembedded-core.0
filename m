Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A70C6FD1C
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 09:54:38 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.15613.1678442072399232988
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Mar 2023 01:54:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kwMpXuI2;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id k10so18075450edk.13
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 01:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678442070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q+asOmW+fp9UlSBQESjY0SCc1U2hSn9YUW587rYwxOM=;
        b=kwMpXuI2giwudBcOfhFRKgouTO8gNOQoi40LOCk9YV4mgS/gdyH0W6+V2XOO2ZLGx/
         XgQK0l0DGD7uie6UZH4HhTPzjO1T71swsonB/pom1jfplNvTjtxvjFypgQq0NzOOygbE
         w5LnsR9lw6rJHXRAtYYU67ArU8oOS4OmJRKLnhGoW96ugLDbZhvGkG9f0d8q1cuxZxJm
         7LLH3+8W+2j3ce/6cqoNMDhFpv8iVz4xDyfw9A8bQ3m90lDg1GF/kMb9ssAokX3r0DRE
         iv2gSeZ8ph+BNCTHqQzlZ0MTYljqgn/uzfuZZeV3VYCrblWYsiHzOz5vsdNuDK6wPJaA
         5L6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678442070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q+asOmW+fp9UlSBQESjY0SCc1U2hSn9YUW587rYwxOM=;
        b=x4oGMKhO3ZCz2XyE0fOkcJcZut3Px5FdNasDxVdUYyMwbc5cjHLlYEzKb4d4fujspc
         PJGlrdI+2/3/Tk6t+6ns8bsRRr06G+GFOM9xGhBzTMp5TqvtCYzZQb/PLE8bgd26Fo8Q
         bQWxCC8dT0JLdQr3grPlwNz8wdCdEzc1hkdb/Hq5jwhawwud+H03CU+nt/xa0W57nqH8
         uhNbGvrnwyuDr0fgk/ZarL1lW8R8Ly53pkINaW2SOM3+92tAOsYYgtKGBjOZj3HXVoA6
         xoeUurgZ6D1rlJD9eVbJxDQl3YbZQyXei/tmKcD18IE0wQ3L0NY4X7ISR4+i2idnxPmy
         8ZRQ==
X-Gm-Message-State: AO0yUKWr4JqN+A7fTtn5PAy4nf8EwEWO6MYoUW8cMR04dDRRKIoTQckl
	YfHVIo/iu7fxRGy40gZCbozMDtD2etg=
X-Google-Smtp-Source: AK7set9cUOdGkCzYb4h+M8e/S2FpaisGB070bG9O35qvvlpYTrHiEJoH8yZKyYCY/b1qE4ChcOWw9g==
X-Received: by 2002:a17:906:ce46:b0:8b1:ce91:a40c with SMTP id se6-20020a170906ce4600b008b1ce91a40cmr21913399ejb.53.1678442070669;
        Fri, 10 Mar 2023 01:54:30 -0800 (PST)
Received: from localhost.lan (BC244571.dsl.pool.telekom.hu. [188.36.69.113])
        by smtp.gmail.com with ESMTPSA id kq10-20020a170906abca00b008c405ebc32esm759549ejb.28.2023.03.10.01.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 01:54:30 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH 3/4] python3-cmake: New recipe
Date: Fri, 10 Mar 2023 10:54:18 +0100
Message-Id: <20230310095419.3487056-4-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310095419.3487056-1-zboszor@gmail.com>
References: <174B040A85AB843D.27660@lists.openembedded.org>
 <20230310095419.3487056-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 09:54:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178318

Some python modules rely on "import cmake".

Only build and ship the python parts, and don't download and
build cmake from sources. Use the already built cmake instead.

The CMakeLists.txt file is a crippled copy from this cmake
python module's sources, removing almost everything, and
adding a dummy install target, so do_install() doesn't fail.

The python code is patched so cmake is used from PATH.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../python/python3-cmake/CMakeLists.txt       | 11 +++++++
 .../python3-cmake/run-cmake-from-path.patch   | 11 +++++++
 .../python/python3-cmake_3.25.2.bb            | 33 +++++++++++++++++++
 3 files changed, 55 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-cmake/CMakeLists.txt
 create mode 100644 meta/recipes-devtools/python/python3-cmake/run-cmake-from-path.patch
 create mode 100644 meta/recipes-devtools/python/python3-cmake_3.25.2.bb

diff --git a/meta/recipes-devtools/python/python3-cmake/CMakeLists.txt b/meta/recipes-devtools/python/python3-cmake/CMakeLists.txt
new file mode 100644
index 0000000000..8ba81970ff
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cmake/CMakeLists.txt
@@ -0,0 +1,11 @@
+cmake_minimum_required(VERSION 3.6)
+
+#
+# For more details, see docs/building.rst
+#
+
+project(CMakePythonDistributions NONE)
+
+install(CODE "
+  message(STATUS \"Install CMake project\")
+")
diff --git a/meta/recipes-devtools/python/python3-cmake/run-cmake-from-path.patch b/meta/recipes-devtools/python/python3-cmake/run-cmake-from-path.patch
new file mode 100644
index 0000000000..5c38fadce0
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cmake/run-cmake-from-path.patch
@@ -0,0 +1,11 @@
+--- cmake-3.25.2/src/cmake/__init__.py.old	2023-03-10 09:40:43.582315753 +0100
++++ cmake-3.25.2/src/cmake/__init__.py	2023-03-10 09:41:38.030874047 +0100
+@@ -36,7 +36,7 @@
+ 
+ 
+ def _program(name, args):
+-    return subprocess.call([os.path.join(CMAKE_BIN_DIR, name)] + args, close_fds=False)
++    return subprocess.call([name] + args, close_fds=False)
+ 
+ 
+ def cmake():
diff --git a/meta/recipes-devtools/python/python3-cmake_3.25.2.bb b/meta/recipes-devtools/python/python3-cmake_3.25.2.bb
new file mode 100644
index 0000000000..e843293d68
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-cmake_3.25.2.bb
@@ -0,0 +1,33 @@
+SUMMARY = "CMake is an open-source, cross-platform family of tools designed to build, test and package software"
+LICENSE = "BSD-3-Clause & Apache-2.0"
+LIC_FILES_CHKSUM = " \
+	file://LICENSE_BSD_3;md5=9134cb61aebbdd79dd826ccb9ae6afcd \
+	file://LICENSE_Apache_20;md5=19cbd64715b51267a47bf3750cc6a8a5 \
+"
+
+DEPENDS = "ninja-native cmake-native python3-scikit-build-native"
+
+PYPI_PACKAGE = "cmake"
+
+inherit pypi python_setuptools_build_meta
+SRC_URI[sha256sum] = "bcf9f0369743278ec26961542b31ed1610e6f4cfc20c00a3f1c61985abb3b0d2"
+
+SRC_URI += " \
+	file://CMakeLists.txt \
+	file://run-cmake-from-path.patch \
+"
+
+addtask do_patchbuild after do_patch before do_configure
+
+do_patchbuild () {
+	rm -f ${S}/CMakeLists.txt
+	cp ${WORKDIR}/CMakeLists.txt ${S}/
+}
+
+do_install:append () {
+	rm -rf ${D}${bindir}
+}
+
+RDEPENDS:${PN} = "cmake"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


