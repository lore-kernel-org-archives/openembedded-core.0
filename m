Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.15221.1612662695537536566
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Feb 2021 17:51:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dSCsXJBk;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 190so9532302wmz.0
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Feb 2021 17:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O1K5EQ5OzBZGXYtnkx4AZDxoPtTwb/GWb+n6xP63Ym4=;
        b=dSCsXJBkNrElH50Qg4Obo6KZwNCby0uxiJ+nyMh03jB2N4faEl6wfDS5N03Afr/hwZ
         akcPZV0Fx3yPY8Vf9uOUwgH988IHxP4kqHyOKDlJbyvA2bubii67aeI+Lcuj8VstBhg4
         dfRV0YiOFTO3KuFRa8M1a1v7jxxnApvpHLQg3ky/ULspRV1ItV42UxduVJEYfMz/MD4e
         MQnS9aDHyv9GoG/E1kg2y9M23AkpcyF/pDPkznBHiyJopvFlV6qA5jZGpsX/TzKJYms2
         sfP/aZYMZnQ9U1gxTPpRiEyXqyWwVC17ViMmo3GySFi8Bwq/aZysPffyBqNOD0g7EW6y
         txpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O1K5EQ5OzBZGXYtnkx4AZDxoPtTwb/GWb+n6xP63Ym4=;
        b=hn5NejRKblJNxKeGi3IKAgWn1NE+nBmcGXz/O6bWuXFxdrn7wEGjR165OW82bcNJ4d
         VPfTSUW5dCULeG2FkFFhnpMPN8HYFwpvozvsZ1rn9qx5GFjBFC9Xn3N+N3m5wku/1mLv
         XJcrsmcxpkdBv43SN4Ad8DdPxK+Qwo12MebYNxbvxzp+UZh1dbbLm9txDc0y8TXQQt7H
         qXKcIDL/z57KVZmpTojvxZ33gd46SZM8e+zw013mkWjjPBuOLqD9GOiMfwY7BZbRZewj
         c5CInS369QVEP5IL26pJV3iD89NN922Owb1pvsQ72WUuAQta3oKk3owUCz2UR3LrqKLe
         78QA==
X-Gm-Message-State: AOAM531UZrJDFR1Bv7i2uaok2yGk5KjzkgH+ss4vEUW/ridGxfhKWCPA
	wBvyoejkwWV35n6pDmCmf0wOY/TPPryP/w==
X-Google-Smtp-Source: ABdhPJwAS0c56mf0NgxBqwY747B1QGzrWobGN4MUrATrxF5nHfD+Zq8+r076y8aAmIQIeiSvW/lB6g==
X-Received: by 2002:a05:600c:1988:: with SMTP id t8mr9558999wmq.48.1612662694151;
        Sat, 06 Feb 2021 17:51:34 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id n9sm19129089wrq.41.2021.02.06.17.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 17:51:33 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 2/4] glslang: generate glslang pkg-config
Date: Sun,  7 Feb 2021 01:51:18 +0000
Message-Id: <20210207015120.1299136-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210207015120.1299136-1-quaresma.jose@gmail.com>
References: <20210207015120.1299136-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- it will be useful for shaderc

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 .../0002-generate-glslang-pkg-config.patch    | 47 +++++++++++++++++++
 .../glslang/glslang_11.1.0.bb                 |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-graphics/glslang/glslang/0002-generate-glslang-pkg-config.patch

diff --git a/meta/recipes-graphics/glslang/glslang/0002-generate-glslang-pkg-config.patch b/meta/recipes-graphics/glslang/glslang/0002-generate-glslang-pkg-config.patch
new file mode 100644
index 0000000000..ef092f17a1
--- /dev/null
+++ b/meta/recipes-graphics/glslang/glslang/0002-generate-glslang-pkg-config.patch
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
index 7e83ff0626..391b686eca 100644
--- a/meta/recipes-graphics/glslang/glslang_11.1.0.bb
+++ b/meta/recipes-graphics/glslang/glslang_11.1.0.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c5ce49c0456e9b413b98a4368c378229"
 SRCREV = "c594de23cdd790d64ad5f9c8b059baae0ee2941d"
 SRC_URI = "git://github.com/KhronosGroup/glslang.git;protocol=https \
            file://0001-build-the-glslang-default-resource-limits-lib-static.patch \
+           file://0002-generate-glslang-pkg-config.patch \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
-- 
2.30.0

