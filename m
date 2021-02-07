Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web12.15462.1612662696318304342
 for <openembedded-core@lists.openembedded.org>;
 Sat, 06 Feb 2021 17:51:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kfuVuIrc;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id u14so12909011wri.3
        for <openembedded-core@lists.openembedded.org>; Sat, 06 Feb 2021 17:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qud2M/kmoTT8XveFB4t3yWN0HbGwqs6TxiZYSAAheuw=;
        b=kfuVuIrcfqtzDiUlE1NH9Q6vsxOZlBbXt77wfQk25G1DAHXQtu1cCs6iW3Q43IZ5Bz
         CYbJCD/9shPZYNiYkXXX9+9gTrmbIXRbmO964ujqRjJ9rE/CQBdZ94CDoFvn5ikvnbVe
         /KmzT7IKqd3eZD5mU+xmw7iplPfZd4ILfnoLmXEBw/TxGwwZGV3QG5rPeVHSLJmTitj6
         Mk3C3vxQrcVz2h9ddXnOLh3GEcyDkAy6Dp4i+ln/WELXLCKYvcN7aVV8TItoSLZg2+zi
         Pg9C44AhbSW7/iuLlhr04iDDheXuFibCz7DDLa/jj2WnjdEf7nSdV78uJQQSpz/xB2P6
         pmLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qud2M/kmoTT8XveFB4t3yWN0HbGwqs6TxiZYSAAheuw=;
        b=Ns7oq8t7SzxnXSjpCi/NJ0gFbOei03MtsziWBe7vUF0tC6C6nf6TJVWSnk4QUFw7bV
         w7Xq7s3eRSi5jYsA+I/VvreuBP51xTr+9fMWv8qoTDHj5BaqpNRpZ0mYq4IoRLxFRr5U
         6frBm/ecyqPSucL9dbu0CQ+Cz/LJipMYU5xSS0Lpcoo5eJIZC1cUHzef0Y7Q53BVnTpG
         UF3FI94p3iRSPBV4+HdfGWWaYSbLQvfwTSYrR+hcW1uxVjafNLPwUOrseJKEdXjo/o9A
         T+4Y8VFzGQtOsLkWD3ddvySHRWGXnvBiC0uoUJrVs7jw3PaEJ9cH1wQ2FlGXcPWa8NnH
         kdWQ==
X-Gm-Message-State: AOAM532ftZfgqXp4WjjgywBvqR3QFlSdaiOyQQ6KXrswQBYXfqowl7+t
	RyyFK3lsZUrYfyKvJ6bAQf5Tas9GrfAwRg==
X-Google-Smtp-Source: ABdhPJw5wOJrzp4Ga+9eqRXeCssvUi5bHhPJUvf/NYDaHTmFA/xjQkAlPlG3AFHdHSUiL41NdKV83w==
X-Received: by 2002:a5d:430a:: with SMTP id h10mr5156384wrq.162.1612662694923;
        Sat, 06 Feb 2021 17:51:34 -0800 (PST)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id n9sm19129089wrq.41.2021.02.06.17.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Feb 2021 17:51:34 -0800 (PST)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 3/4] shaderc: add option to skip building the examples
Date: Sun,  7 Feb 2021 01:51:19 +0000
Message-Id: <20210207015120.1299136-3-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210207015120.1299136-1-quaresma.jose@gmail.com>
References: <20210207015120.1299136-1-quaresma.jose@gmail.com>
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

