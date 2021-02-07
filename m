Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web08.23641.1612721114324296883
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Feb 2021 10:05:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iCZLvkZe;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id a1so14563932wrq.6
        for <openembedded-core@lists.openembedded.org>; Sun, 07 Feb 2021 10:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qud2M/kmoTT8XveFB4t3yWN0HbGwqs6TxiZYSAAheuw=;
        b=iCZLvkZejmFqXAp+LWb2+wOEtBVtE1rHOWcZeZC/q5feUzJ3lo56Y0Q5HEajEtkzOl
         mjZDoj2FhPXvKeq/OhK4SvwGuw7VVwao5BonbNqPH7yorPbrtNOCQV1SNx/JwhiAJ2tO
         ldNy/UEFPBq9/89FGpcMv75agLB8v7JleeAN6ntysYBPuxsDGqxYhRviz93dvb0s9gPa
         rSAHpV01K72j4uBQl0DMa7OfpGUz0VvbytG5B9F9Bmjd68hQoWQbxPH1IbDP64GvdpMF
         on75jvZJ+Eugg9Z0FNBbvNGqkccygmIo25h+fEe2bTO7NDhGN/qV7fE6fAGUvfVyn1Bl
         Zmag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qud2M/kmoTT8XveFB4t3yWN0HbGwqs6TxiZYSAAheuw=;
        b=IjbzA9nB2gfrT7bO84l5PF5ESVDam9wDnRKy7scfPdBbBwPUDhBjwMv+Va4+yTLysv
         BIK8WrW+V1BPRMvvitEZil7immClFYGdTG0I91x47oayDvCCfkySj99yL9sUlbe0KKvX
         PqkLHs+v/143CYcreANarEGh7egIZqQdUisi3AAKYn9N4OGshw69lOCmb03PnklD5Fvm
         1nQc4+F/4LiY5oqYqsI+T6prDDbHa8rtvV2wPI1SObG8J86iBP81B3dzb0x1l5MiVKMv
         NeYGMe/J+ZrGKwtiPH4wy42snCLszqi8kfNDGJMxNQXFYmsssTbr4SCcWDo0/s1m2OAx
         5Ikw==
X-Gm-Message-State: AOAM533VlS7uuIx9ocFQKPNpKtG4VcjBNlt3sOWlWRn5v5mPcVoTpaf0
	jfsrfO6/FecKkUVqcpr6EWAMV7ZOQnGSTg==
X-Google-Smtp-Source: ABdhPJxUlA9EhKnu8DDi3IGjeh4D0LlBdJyObEUAJB5vSagV6BS4fMNeHFLqlJNL9EPw6Fd8ND4l9A==
X-Received: by 2002:adf:cc8e:: with SMTP id p14mr15502000wrj.270.1612721112906;
        Sun, 07 Feb 2021 10:05:12 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id n9sm24045112wrq.41.2021.02.07.10.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 10:05:12 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v2 2/3] shaderc: add option to skip building the examples
Date: Sun,  7 Feb 2021 18:05:03 +0000
Message-Id: <20210207180504.1552900-2-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210207180504.1552900-1-quaresma.jose@gmail.com>
References: <20210207180504.1552900-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...dd-option-to-skip-build-the-examples.patch | 45 +++++++++++++++++++
 ...lding-external-dependencies-in-thir.patch} | 32 +++++--------
 .../shaderc/shaderc_2020.4.bb                 |  6 ++-
 3 files changed, 61 insertions(+), 22 deletions(-)
 create mode 100644 meta/recipes-graphics/shaderc/files/0001-cmake-add-option-to-skip-build-the-examples.patch
 rename meta/recipes-graphics/shaderc/files/{0001-cmake-de-vendor-libs-and-disable-git-versioning.patch => 0002-cmake-disable-building-external-dependencies-in-thir.patch} (55%)

diff --git a/meta/recipes-graphics/shaderc/files/0001-cmake-add-option-to-skip-build-the-examples.patch b/meta/recipes-graphics/shaderc/files/0001-cmake-add-option-to-skip-build-the-examples.patch
new file mode 100644
index 0000000000..d414a78854
--- /dev/null
+++ b/meta/recipes-graphics/shaderc/files/0001-cmake-add-option-to-skip-build-the-examples.patch
@@ -0,0 +1,45 @@
+From 23114b9862482ef325768b5e2d47f6c247e5044e Mon Sep 17 00:00:00 2001
+From: Jose Quaresma <quaresma.jose@gmail.com>
+Date: Sun, 7 Feb 2021 01:30:39 +0000
+Subject: [PATCH] cmake: add option to skip build the examples
+
+Upstream-Status: Submitted [https://github.com/google/shaderc/pull/1170]
+
+Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
+
+---
+ CMakeLists.txt | 14 +++++++++++++-
+ 1 file changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 5c74cd8..0c8d1ae 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -40,6 +40,16 @@ else()
+   message(STATUS "Configuring Shaderc to avoid building tests.")
+ endif()
+ 
++option(SHADERC_SKIP_EXAMPLES "Skip building examples" ${SHADERC_SKIP_EXAMPLES})
++if(NOT ${SHADERC_SKIP_EXAMPLES})
++  set(SHADERC_ENABLE_EXAMPLES ON)
++endif()
++if(${SHADERC_ENABLE_EXAMPLES})
++  message(STATUS "Configuring Shaderc to build examples.")
++else()
++  message(STATUS "Configuring Shaderc to avoid building examples.")
++endif()
++
+ option(SHADERC_ENABLE_WERROR_COMPILE "Enable passing -Werror to compiler, if available" ON)
+ 
+ set (CMAKE_CXX_STANDARD 11)
+@@ -107,7 +117,9 @@ add_subdirectory(third_party)
+ add_subdirectory(libshaderc_util)
+ add_subdirectory(libshaderc)
+ add_subdirectory(glslc)
+-add_subdirectory(examples)
++if(${SHADERC_ENABLE_EXAMPLES})
++    add_subdirectory(examples)
++endif()
+ 
+ add_custom_target(build-version
+   ${PYTHON_EXECUTABLE}
diff --git a/meta/recipes-graphics/shaderc/files/0001-cmake-de-vendor-libs-and-disable-git-versioning.patch b/meta/recipes-graphics/shaderc/files/0002-cmake-disable-building-external-dependencies-in-thir.patch
similarity index 55%
rename from meta/recipes-graphics/shaderc/files/0001-cmake-de-vendor-libs-and-disable-git-versioning.patch
rename to meta/recipes-graphics/shaderc/files/0002-cmake-disable-building-external-dependencies-in-thir.patch
index 40cc84df26..2c82445028 100644
--- a/meta/recipes-graphics/shaderc/files/0001-cmake-de-vendor-libs-and-disable-git-versioning.patch
+++ b/meta/recipes-graphics/shaderc/files/0002-cmake-disable-building-external-dependencies-in-thir.patch
@@ -1,36 +1,31 @@
-From a07ac322a5a5fd4f0339913eb4456321ad1a69fd Mon Sep 17 00:00:00 2001
+From fdef5b662df941c49fd2d6e486d0427f8dfb602e Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
-Date: Sat, 17 Oct 2020 12:51:50 +0100
-Subject: [PATCH] cmake: de-vendor libs and disable git versioning
+Date: Sun, 7 Feb 2021 01:30:39 +0000
+Subject: [PATCH] cmake: disable building external dependencies in /third_party
 
-Upstream-Status: Inappropriate [configuration]
+Upstream-Status: Inappropriate [OE-core specific]
 
 Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
 
 ---
- CMakeLists.txt              | 2 --
- glslc/CMakeLists.txt        | 1 -
- glslc/src/build-version.inc | 0
- 3 files changed, 3 deletions(-)
- create mode 100644 glslc/src/build-version.inc
+ CMakeLists.txt       | 3 ---
+ glslc/CMakeLists.txt | 1 -
+ 2 files changed, 4 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 5c74cd8..9451fbc 100644
+index 0c8d1ae..c7940f6 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -102,12 +102,10 @@ endif(MSVC)
+@@ -111,9 +111,6 @@ endif(MSVC)
+ 
  
  # Configure subdirectories.
- # We depend on these for later projects, so they should come first.
+-# We depend on these for later projects, so they should come first.
 -add_subdirectory(third_party)
- 
+-
  add_subdirectory(libshaderc_util)
  add_subdirectory(libshaderc)
  add_subdirectory(glslc)
--add_subdirectory(examples)
- 
- add_custom_target(build-version
-   ${PYTHON_EXECUTABLE}
 diff --git a/glslc/CMakeLists.txt b/glslc/CMakeLists.txt
 index 31664d1..358d91b 100644
 --- a/glslc/CMakeLists.txt
@@ -43,6 +38,3 @@ index 31664d1..358d91b 100644
  
  shaderc_add_tests(
    TEST_PREFIX glslc
-diff --git a/glslc/src/build-version.inc b/glslc/src/build-version.inc
-new file mode 100644
-index 0000000..e69de29
diff --git a/meta/recipes-graphics/shaderc/shaderc_2020.4.bb b/meta/recipes-graphics/shaderc/shaderc_2020.4.bb
index 8658a5737b..c7982dd815 100644
--- a/meta/recipes-graphics/shaderc/shaderc_2020.4.bb
+++ b/meta/recipes-graphics/shaderc/shaderc_2020.4.bb
@@ -8,7 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 SRCREV = "0dbd899941a43ffd55df527d65128b3b66e75c9c"
 SRC_URI = "git://github.com/google/shaderc.git;protocol=https;branch=main \
-           file://0001-cmake-de-vendor-libs-and-disable-git-versioning.patch \
+           file://0001-cmake-add-option-to-skip-build-the-examples.patch \
+           file://0002-cmake-disable-building-external-dependencies-in-thir.patch \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
 S = "${WORKDIR}/git"
@@ -19,8 +20,9 @@ DEPENDS = "spirv-headers spirv-tools glslang"
 
 EXTRA_OECMAKE = " \
     -DCMAKE_BUILD_TYPE=Release \
-    -DSHADERC_SKIP_TESTS=ON \
     -Dglslang_SOURCE_DIR=${STAGING_INCDIR}/glslang \
+    -DSHADERC_SKIP_TESTS=ON \
+    -DSHADERC_SKIP_EXAMPLES=ON \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.0

