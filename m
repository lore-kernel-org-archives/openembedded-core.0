Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.332.1587835711234837119
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 10:28:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LxbeaTDx;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id u127so15423813wmg.1
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2020 10:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uibcfNzbam/8YOwo7yH0CHjkL/S1njEI6dWHoS+S/nY=;
        b=LxbeaTDxPHOPThX5BgRfR7szUBzrMM05XeMj1FcK/dEkiIhoj67qoHQ28A0DMsBUuC
         yNItbMfIUDkZk7gCJ2MKaAbCT7pVgw7Q8wBUlfXyRXSGdPi/1mYTt+ZA86PjKPkYT9mq
         TQ77anY8K6kb3+U0vflBVM0QGklsVQYcXtrAm8Mpjwu1oCLni5PHWtSfbjTyHvzvaP6h
         VjF6+SKYqK5Oan7XuBsKVWr+6BarzJRmV2Uy417jWGTXmg8Mj/CtPGMI8Hqd5F02iEv2
         7xnWyL3v/zLb33enTSoATYxa2JxPFHlpc6rsLIw4ImKQaHd2tlfgKWhNivIfw+thVcj7
         uOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uibcfNzbam/8YOwo7yH0CHjkL/S1njEI6dWHoS+S/nY=;
        b=AYHMsWgrzVJ/5fYrKyILhSkbEnqdmQfRwYT0dx85DsAaymim4QxZhKXLVo3i3QSJ34
         0xvvLNRS1ihOjSNC5GpGvR5Is1OSvWp7bmb0HimcACeTuyk2drl8+MdSyMX4Iyaj8tqR
         F0hx0XgdH46KEAYjxZkug6S3E/LUkqVy+PZHqr9F70QJAwJyClRX6y44I1hXmAfYWRzr
         KJh6dueoePSqXvCfhJ8aejk3f7BDMzOfN+4KAtEeM+iu+7imn+CbddXT8Q6GV2jficJk
         L93h99tDH0GOY57NvT2g2rC5uIZug6TTgs5sLCI7QWIJ6Wq/ZMJfpY0rvc6jFvqhIgb7
         OvOQ==
X-Gm-Message-State: AGi0PuYLBl0dIrg1i7UIMWTxZ2o3Dixs1pn8d+keenAk6ju3QSsFfqi3
	fWDIpDakcfBhaA83wkHutO8oRafI
X-Google-Smtp-Source: APiQypJQ30rcAe/KDrAFjU/mSbT/uDGHjNtasuYt01u3NxCYpL3zrZ+wjYfZA829BW0B7xJoDboskA==
X-Received: by 2002:a05:600c:148:: with SMTP id w8mr17565330wmm.144.1587835709417;
        Sat, 25 Apr 2020 10:28:29 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id g25sm7751253wmh.24.2020.04.25.10.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 10:28:28 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 03/15] libdnf: upgrade 0.28.1 -> 0.47.0
Date: Sat, 25 Apr 2020 19:28:02 +0200
Message-Id: <20200425172814.27370-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200425172814.27370-1-alex.kanavin@gmail.com>
References: <20200425172814.27370-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a patch that avoids hardcoded sphinx dependency.

Switch off a couple of new features (zchunk, html docs for
hawkey library via sphinx) that both require new dependencies.

Move from modulemd 1.x to 2.x, drop upstreamed patches.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libdnf/0001-Add-WITH_TESTS-option.patch   | 12 ++--
 ...nly-if-documentation-is-actually-ena.patch | 42 +++++++++++
 ...-include-stdexcept-for-runtime_error.patch | 65 -----------------
 .../libdnf/fix-deprecation-warning.patch      | 71 -------------------
 .../{libdnf_0.28.1.bb => libdnf_0.47.0.bb}    | 11 +--
 5 files changed, 54 insertions(+), 147 deletions(-)
 create mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-Look-fo-sphinx-only-if-documentation-is-actually-ena.patch
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-include-stdexcept-for-runtime_error.patch
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/fix-deprecation-warning.patch
 rename meta/recipes-devtools/libdnf/{libdnf_0.28.1.bb => libdnf_0.47.0.bb} (80%)

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Add-WITH_TESTS-option.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Add-WITH_TESTS-option.patch
index 3c87d4d8b3..ac9400c48d 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-Add-WITH_TESTS-option.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-Add-WITH_TESTS-option.patch
@@ -1,4 +1,4 @@
-From e5a50db749b2b02e9e0cff9f7b639020e8ac76da Mon Sep 17 00:00:00 2001
+From 56fa2bbdbd29377a6ef0d0b7aadbac8b5ea8c95b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 6 Nov 2018 13:54:43 +0100
 Subject: [PATCH] Add WITH_TESTS option
@@ -14,18 +14,18 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  2 files changed, 5 insertions(+)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index ce88b9e3..7a99320a 100644
+index 881152a..965c992 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -32,6 +32,7 @@ option(WITH_HTML "Enables hawkey HTML generation" ON)
- option(WITH_MAN "Enables hawkey man page generation" ON)
+@@ -33,6 +33,7 @@ option(WITH_MAN "Enables hawkey man page generation" ON)
+ option(WITH_ZCHUNK "Build with zchunk support" ON)
  option(ENABLE_RHSM_SUPPORT "Build with Red Hat Subscription Manager support?" OFF)
  option(ENABLE_SOLV_URPMREORDER "Build with support for URPM-like solution reordering?" OFF)
 +option(WITH_TESTS "Enables unit tests" ON)
  
  
  # load pkg-config first; it's required by other modules
-@@ -158,8 +159,10 @@ endif()
+@@ -165,8 +166,10 @@ endif()
  
  
  # build tests
@@ -37,7 +37,7 @@ index ce88b9e3..7a99320a 100644
      add_subdirectory(python/hawkey)
  endif()
 diff --git a/python/hawkey/CMakeLists.txt b/python/hawkey/CMakeLists.txt
-index d9645346..84d17204 100644
+index d964534..84d1720 100644
 --- a/python/hawkey/CMakeLists.txt
 +++ b/python/hawkey/CMakeLists.txt
 @@ -50,4 +50,6 @@ target_link_libraries(_hawkeymodule ${PYTHON_LIBRARY})
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Look-fo-sphinx-only-if-documentation-is-actually-ena.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Look-fo-sphinx-only-if-documentation-is-actually-ena.patch
new file mode 100644
index 0000000000..6dd7c71aae
--- /dev/null
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-Look-fo-sphinx-only-if-documentation-is-actually-ena.patch
@@ -0,0 +1,42 @@
+From b570c7f8bd089deec7da2b108aa789a27025a473 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 19 Nov 2019 13:46:09 +0100
+Subject: [PATCH] Look fo sphinx only if documentation is actually enabled
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ docs/hawkey/CMakeLists.txt | 20 +++++++++++---------
+ 1 file changed, 11 insertions(+), 9 deletions(-)
+
+diff --git a/docs/hawkey/CMakeLists.txt b/docs/hawkey/CMakeLists.txt
+index 52cc35c6..63c7672f 100644
+--- a/docs/hawkey/CMakeLists.txt
++++ b/docs/hawkey/CMakeLists.txt
+@@ -2,15 +2,17 @@
+ # tell sphinx-build to do them both in one go:
+ 
+ 
+-find_program(SPHINX_PROGRAM NAMES "sphinx-build-${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}")
+-if(NOT EXISTS ${SPHINX_PROGRAM})
+-    find_program(SPHINX_PROGRAM NAMES sphinx-build-${PYTHON_VERSION_MAJOR})
+-endif()
+-if(NOT EXISTS ${SPHINX_PROGRAM})
+-    find_program(SPHINX_PROGRAM NAMES sphinx-build)
+-endif()
+-if(NOT EXISTS ${SPHINX_PROGRAM})
+-    message(FATAL_ERROR "Sphinx program not found." )
++if (WITH_HTML OR WITH_MAN)
++    find_program(SPHINX_PROGRAM NAMES "sphinx-build-${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}")
++    if(NOT EXISTS ${SPHINX_PROGRAM})
++        find_program(SPHINX_PROGRAM NAMES sphinx-build-${PYTHON_VERSION_MAJOR})
++    endif()
++    if(NOT EXISTS ${SPHINX_PROGRAM})
++        find_program(SPHINX_PROGRAM NAMES sphinx-build)
++    endif()
++    if(NOT EXISTS ${SPHINX_PROGRAM})
++        message(FATAL_ERROR "Sphinx program not found." )
++    endif()
+ endif()
+ 
+ if(WITH_HTML)
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-include-stdexcept-for-runtime_error.patch b/meta/recipes-devtools/libdnf/libdnf/0001-include-stdexcept-for-runtime_error.patch
deleted file mode 100644
index cedf539243..0000000000
--- a/meta/recipes-devtools/libdnf/libdnf/0001-include-stdexcept-for-runtime_error.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 5f8eee5040d7074710cd542fc50f7a40918321fc Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 23 Dec 2019 14:30:22 -0800
-Subject: [PATCH] include <stdexcept> for runtime_error
-
-Fixes
-
-error: class 'libdnf::ModulePackageContainer::Exception' does not have any field named 'runtime_error'
-         explicit Exception(const std::string &what) : runtime_error(what) {}
-                                                       ^~~~~~~~~~~~~
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/libdnf/pull/867]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libdnf/goal/Goal.hpp                     | 1 +
- libdnf/module/ModulePackageContainer.hpp | 1 +
- libdnf/repo/solvable/Dependency.cpp      | 3 ++-
- 3 files changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/libdnf/goal/Goal.hpp b/libdnf/goal/Goal.hpp
-index f33dfa24..7b8d822c 100644
---- a/libdnf/goal/Goal.hpp
-+++ b/libdnf/goal/Goal.hpp
-@@ -22,6 +22,7 @@
- #define __GOAL_HPP
- 
- #include <memory>
-+#include <stdexcept>
- 
- #include "../dnf-types.h"
- #include "../hy-goal.h"
-diff --git a/libdnf/module/ModulePackageContainer.hpp b/libdnf/module/ModulePackageContainer.hpp
-index 1f815fda..37a8832d 100644
---- a/libdnf/module/ModulePackageContainer.hpp
-+++ b/libdnf/module/ModulePackageContainer.hpp
-@@ -30,6 +30,7 @@
- #include <string>
- #include <vector>
- #include <set>
-+#include <stdexcept>
- 
- //class ModulePackageContainer;
- //typedef std::shared_ptr<ModulePackageContainer> ModulePackageContainerPtr;
-diff --git a/libdnf/repo/solvable/Dependency.cpp b/libdnf/repo/solvable/Dependency.cpp
-index 6682b729..0fc8b5cd 100644
---- a/libdnf/repo/solvable/Dependency.cpp
-+++ b/libdnf/repo/solvable/Dependency.cpp
-@@ -18,6 +18,7 @@
-  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-  */
- 
-+#include <stdexcept>
- #include "Dependency.hpp"
- #include "libdnf/utils/utils.hpp"
- #include "libdnf/repo/DependencySplitter.hpp"
-@@ -106,4 +107,4 @@ Dependency::getReldepId(DnfSack *sack, const char * reldepStr)
-     }
- }
- 
--}
-\ No newline at end of file
-+}
--- 
-2.24.1
-
diff --git a/meta/recipes-devtools/libdnf/libdnf/fix-deprecation-warning.patch b/meta/recipes-devtools/libdnf/libdnf/fix-deprecation-warning.patch
deleted file mode 100644
index 3a3e02f352..0000000000
--- a/meta/recipes-devtools/libdnf/libdnf/fix-deprecation-warning.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 66d9b2ba3fbc7b04f2b5ad9d0e5371340c037b5f Mon Sep 17 00:00:00 2001
-From: Marek Blaha <mblaha@redhat.com>
-Date: Wed, 10 Jul 2019 10:11:01 +0200
-Subject: [oe-core][PATCH 1/1] Fix Python 3.8 deprecation warning
- (RhBug:1724244)
-
-This deprecation warning was introduced in Python 3.8 by
-https://bugs.python.org/issue36381:
-
-/usr/lib/python3.8/site-packages/dnf/package.py:57: DeprecationWarning: PY_SSIZE_T_CLEAN will be required for '#' formats
-  return super(Package, self).chksum
-
-https://bugzilla.redhat.com/show_bug.cgi?id=1724244
----
- python/hawkey/package-py.cpp      | 3 ++-
- python/hawkey/packagedelta-py.cpp | 3 ++-
- 2 files changed, 4 insertions(+), 2 deletions(-)
----
-
-Unchanged.  Appears in version 0.35.2.
-
-Upstream-Status: Backport [git://github.com/rpm-software-management/libdnf.git]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
-
-diff --git a/python/hawkey/package-py.cpp b/python/hawkey/package-py.cpp
-index 5102bba..68e03cb 100644
---- a/python/hawkey/package-py.cpp
-+++ b/python/hawkey/package-py.cpp
-@@ -18,6 +18,7 @@
-  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-  */
- 
-+#define PY_SSIZE_T_CLEAN
- #include <Python.h>
- #include <stdio.h>
- 
-@@ -251,7 +252,7 @@ get_chksum(_PackageObject *self, void *closure)
- #if PY_MAJOR_VERSION < 3
-     res = Py_BuildValue("is#", type, cs, checksum_length);
- #else
--    res = Py_BuildValue("iy#", type, cs, checksum_length);
-+    res = Py_BuildValue("iy#", type, cs, (Py_ssize_t)checksum_length);
- #endif
- 
-     return res;
-diff --git a/python/hawkey/packagedelta-py.cpp b/python/hawkey/packagedelta-py.cpp
-index ca1cb7d..1a64836 100644
---- a/python/hawkey/packagedelta-py.cpp
-+++ b/python/hawkey/packagedelta-py.cpp
-@@ -18,6 +18,7 @@
-  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-  */
- 
-+#define PY_SSIZE_T_CLEAN
- #include <Python.h>
- 
- // hawkey
-@@ -92,7 +93,7 @@ get_chksum(_PackageDeltaObject *self, void *closure)
- #if PY_MAJOR_VERSION < 3
-     res = Py_BuildValue("is#", type, cs, checksum_length);
- #else
--    res = Py_BuildValue("iy#", type, cs, checksum_length);
-+    res = Py_BuildValue("iy#", type, cs, (Py_ssize_t)checksum_length);
- #endif
- 
-     return res;
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb b/meta/recipes-devtools/libdnf/libdnf_0.47.0.bb
similarity index 80%
rename from meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.47.0.bb
index cc2ceb8816..1b4b7e4233 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.28.1.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.47.0.bb
@@ -2,27 +2,28 @@ SUMMARY = "Library providing simplified C and Python API to libsolv"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://github.com/rpm-software-management/libdnf \
+SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master \
            file://0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch \
            file://0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch \
            file://0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch \
            file://0001-Add-WITH_TESTS-option.patch \
-           file://0001-include-stdexcept-for-runtime_error.patch \
-           file://fix-deprecation-warning.patch \
+           file://0001-Look-fo-sphinx-only-if-documentation-is-actually-ena.patch \
            "
 
-SRCREV = "751f89045b80d58c0d05800f74357cf78cdf7e77"
+SRCREV = "8330eea6985c4e4b53796f858de5b6b38b1ddf5c"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "glib-2.0 libsolv libcheck librepo rpm gtk-doc libmodulemd-v1 json-c swig-native"
+DEPENDS = "glib-2.0 libsolv libcheck librepo rpm gtk-doc libmodulemd json-c swig-native"
 
 inherit gtk-doc gobject-introspection cmake pkgconfig distutils3-base
 
 EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DWITH_MAN=OFF -DPYTHON_DESIRED=3 \
                   ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DWITH_GIR=ON', '-DWITH_GIR=OFF', d)} \
                   -DWITH_TESTS=OFF \
+                  -DWITH_ZCHUNK=OFF \
+                  -DWITH_HTML=OFF \
                 "
 EXTRA_OECMAKE_append_class-native = " -DWITH_GIR=OFF"
 EXTRA_OECMAKE_append_class-nativesdk = " -DWITH_GIR=OFF"
-- 
2.26.1

