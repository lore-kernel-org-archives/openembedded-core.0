Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web08.23642.1612721115068519943
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Feb 2021 10:05:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RliD6tWm;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id y134so2791291wmd.3
        for <openembedded-core@lists.openembedded.org>; Sun, 07 Feb 2021 10:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4SeZQBmtJYJGl4F4ZBkzqtSc2iS9+OKJ6wPlb8BIjAk=;
        b=RliD6tWmao3T0Uov69c+dAU8hq9au2iIvI2QfZzPVVyDzwhuuYV+cGWZIn9UKjWSSH
         SzZMkHBsNmjobxeEDutEqWFJXvpHnn5M+DWMo82mLfDl9zKxqJwZmN2X/37+cFUS45X7
         GiwM4ZV0R1Y8bm00Gz5e/AKKKDkUYRRFSMFUHwpWAvG0LGUbtp4gUTq54S5Ua+Q5lz/6
         sT7vvZoWfqgyJl9HIDe8GB5xmMfXEG0JiF1XAdXZdQ9AYO931HVjA9tevary3ccJVxep
         8xngcKdI7mX/y28gP7LB5yyMtjyMWG7pC8iqzgaamUEs8FoI4nnA7DBUR7MQ2EUsXOGh
         oVHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4SeZQBmtJYJGl4F4ZBkzqtSc2iS9+OKJ6wPlb8BIjAk=;
        b=kPGpbWtjk9CorGfFh5PLSG7I32VG+c8dBCGgu7UArjZ1m7CAn+zdBBkVAZTOzG+1LG
         dfVmFBFlbkEubyQL1+7GM8aJ+eHxAUReQ5n4a+9BbiRV8kqjUlgs2yesXUehtWkP+Ez7
         ZQojciJaIXNNXFDx8rvVUf/ec3P5dqBoTYwkOdDCH+H56LvVSRFCfw04vfO+LMdC/Vi8
         u8cC9zmE8g6lfvdvt1BOvayu0fRsRP8jtwoGx4xgdqSmjv6DyEIvVoILbejlWrfPt5A2
         sueWLXWVKTGuaOpyxVYg6qvHGGbJTpmnbwwDDwUYVt9A+Ybi3pt1GpdSlcAJ5g9yoC7Z
         EJfg==
X-Gm-Message-State: AOAM531Q4X6wTIyDYZgC57BwGUiQkkBT/4l4RGRSozs7Mj/KQMzYQwWw
	wDdPB9ZW/fQDSxQAsH9YZytIpwbungXguQ==
X-Google-Smtp-Source: ABdhPJwZhPhygTX+8qx6AVcGP3eRg6XrajTAJiLTTGPVNuarTSzSsXlPa0OCOzxPgWczd9SZUP43rg==
X-Received: by 2002:a1c:b087:: with SMTP id z129mr11776626wme.147.1612721111881;
        Sun, 07 Feb 2021 10:05:11 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id n9sm24045112wrq.41.2021.02.07.10.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 10:05:11 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v2 1/3] glslang: generate glslang pkg-config
Date: Sun,  7 Feb 2021 18:05:02 +0000
Message-Id: <20210207180504.1552900-1-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- it will be useful for shaderc

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../0001-generate-glslang-pkg-config.patch    | 47 +++++++++++++++++++
 .../glslang/glslang_11.1.0.bb                 |  3 +-
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch

diff --git a/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
new file mode 100644
index 0000000000..ef092f17a1
--- /dev/null
+++ b/meta/recipes-graphics/glslang/glslang/0001-generate-glslang-pkg-config.patch
@@ -0,0 +1,47 @@
+From 6692611126b40d499c94bbcc8e29604560262072 Mon Sep 17 00:00:00 2001
+From: Jose Quaresma <quaresma.jose@gmail.com>
+Date: Sun, 7 Feb 2021 01:30:39 +0000
+Subject: [PATCH] generate glslang pkg-config
+
+Based on https://src.fedoraproject.org/rpms/glslang/blob/main/f/0001-pkg-config-compatibility.patch
+
+Upstream-Status: Pending
+
+Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+
+---
+ glslang/CMakeLists.txt      |  2 ++
+ glslang/glslang.pc.cmake.in | 11 +++++++++++
+ 2 files changed, 13 insertions(+)
+ create mode 100644 glslang/glslang.pc.cmake.in
+
+diff --git a/glslang/CMakeLists.txt b/glslang/CMakeLists.txt
+index 1c7d22a2..10c1e841 100644
+--- a/glslang/CMakeLists.txt
++++ b/glslang/CMakeLists.txt
+@@ -209,6 +209,8 @@ if(ENABLE_GLSLANG_INSTALL)
+                 EXPORT  glslangTargets
+                 ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR})
+     endif()
++    configure_file(${CMAKE_CURRENT_SOURCE_DIR}/glslang.pc.cmake.in ${CMAKE_CURRENT_BINARY_DIR}/pkgconfig/glslang.pc @ONLY)
++    install(FILES ${CMAKE_CURRENT_BINARY_DIR}/pkgconfig/glslang.pc DESTINATION ${CMAKE_INSTALL_LIBDIR}/pkgconfig)
+ 
+     install(EXPORT glslangTargets DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake)
+ 
+diff --git a/glslang/glslang.pc.cmake.in b/glslang/glslang.pc.cmake.in
+new file mode 100644
+index 00000000..64b6882d
+--- /dev/null
++++ b/glslang/glslang.pc.cmake.in
+@@ -0,0 +1,11 @@
++    prefix=@CMAKE_INSTALL_PREFIX@
++    exec_prefix=@CMAKE_INSTALL_PREFIX@
++    libdir=${exec_prefix}/@CMAKE_INSTALL_LIBDIR@
++    includedir=${prefix}/@CMAKE_INSTALL_INCLUDEDIR@
++    
++    Name: @PROJECT_NAME@
++    Description: OpenGL and OpenGL ES shader front end and validator
++    Requires:
++    Version: @GLSLANG_VERSION@
++    Libs: -L${libdir} -lglslang -lOSDependent -lHLSL -lOGLCompiler -lSPVRemapper
++    Cflags: -I${includedir}
diff --git a/meta/recipes-graphics/glslang/glslang_11.1.0.bb b/meta/recipes-graphics/glslang/glslang_11.1.0.bb
index fe21dbcf50..9b7c098743 100644
--- a/meta/recipes-graphics/glslang/glslang_11.1.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_11.1.0.bb
@@ -9,7 +9,8 @@ LICENSE = "BSD-3-Clause & BSD-2-Clause & MIT & Apache-2.0 & GPL-3-with-bison-exc
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c5ce49c0456e9b413b98a4368c378229"
 
 SRCREV = "c594de23cdd790d64ad5f9c8b059baae0ee2941d"
-SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https"
+SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https \
+           file://0001-generate-glslang-pkg-config.patch"
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
 
-- 
2.30.0

